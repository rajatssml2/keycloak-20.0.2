<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="${properties.kcFormClass!}" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                        <#if usernameEditDisabled??>
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                        <#else>
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                        <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="ulb" class="${properties.kcLabelClass!}">ULBs</label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                    <select name="cars" id="cars" tabindex="3" class="${properties.kcInputClass!}">
                        <option value="">Select</option>
                        <option value="dehradun">Dehradun Municipal Corporation</option>
                        <option value="rishikesh">Rishikesh Municipal Corporation</option>
                        <option value="haridwar">Haridwar Municipal Corporation</option>
                        <option value="roorkee">Roorkee Municipal Corporation</option>
                        <option value="almora">Almora</option>
                        <option value="champawat">Champawat</option>
                        <option value="badrinath">Badrinath</option>
                    </select>
                        
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="4" id="rememberMe" name="rememberMe" type="checkbox" tabindex="4" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="4" id="rememberMe" name="rememberMe" type="checkbox" tabindex="4"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                     </div>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
        <div id="kc-social-providers">
        <h1>Hi Rajat</h1>
          <h3><a href="#social-provider-selector" data-revealer>${msg("providerLogin")}</a></h3>
          <div id="social-provider-selector">
          <label for="social-provider-filter">${msg("providerLoginLabel")}</label>
          <input id="social-provider-filter" name="social-provider-filter" type="text" />
          <ul data-filtered-by="social-provider-filter">
              <#list social.providers as p>
                  <li title="${p.displayName}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="next-button ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
              </#list>
          </ul>
          </div>
        </div>
        </#if>
    </#if>
</@layout.registrationLayout>