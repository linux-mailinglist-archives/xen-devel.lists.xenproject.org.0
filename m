Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF64815FF9
	for <lists+xen-devel@lfdr.de>; Sun, 17 Dec 2023 15:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655597.1023321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEsP9-0006vz-50; Sun, 17 Dec 2023 14:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655597.1023321; Sun, 17 Dec 2023 14:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEsP9-0006tp-23; Sun, 17 Dec 2023 14:46:07 +0000
Received: by outflank-mailman (input) for mailman id 655597;
 Sun, 17 Dec 2023 14:46:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbmG=H4=mg.gitlab.com=bounce+c66dc3.947b4-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1rEsP8-0006tj-62
 for xen-devel@lists.xenproject.org; Sun, 17 Dec 2023 14:46:06 +0000
Received: from so254-136.mailgun.net (so254-136.mailgun.net [198.61.254.136])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id ffd7fbea-9cea-11ee-98eb-6d05b1d4d9a1;
 Sun, 17 Dec 2023 15:46:03 +0100 (CET)
Received: from mg.gitlab.com (31.226.74.34.bc.googleusercontent.com
 [34.74.226.31]) by
 b88a95e97985 with SMTP id 657f09a9438585501f953895 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Sun, 17 Dec 2023 14:46:01 GMT
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: ffd7fbea-9cea-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.gitlab.com;
 q=dns/txt; s=mailo; t=1702824361; x=1702831561; h=List-Id:
 Content-Transfer-Encoding: Content-Type: Mime-Version: Subject: Subject:
 Message-ID: To: To: Reply-To: From: From: Date: Sender: Sender;
 bh=1jI5KCIP65GEgat+AZp/e1kWntWUtY7I57vyq9S+Opg=;
 b=dnpIrdSMeUpEV11J2BbpXIOh+Z6QV54oITPsphrrYRdYkMWZUyM04uC30drP7B6K81T7ez5ZihwvJSdZY4a65sZ93mARgExzsi+bmQ2XLSwR5kEUz1a8BIWR4Nqu4mzCkBJYhkjKz8xYuoKikkIWcOGIJjrtQR5/whJsYxTh5ic=
X-Mailgun-Sending-Ip: 198.61.254.136
X-Mailgun-Sid: WyI4YjA3MiIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsIjk0N2I0Il0=
Sender: gitlab@mg.gitlab.com
Date: Sun, 17 Dec 2023 14:46:00 +0000
From: GitLab <gitlab@mg.gitlab.com>
Reply-To: GitLab <noreply@gitlab.com>
To: xen-devel@lists.xenproject.org
Message-ID: <657f09a8df561_2c11088afc153135@gitlab-sidekiq-catchall-v2-5b75896b6c-wrff7.mail>
Subject: xen | Successful pipeline for staging | a60067f3
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_657f09a8d76fa_2c11088afc1530b6";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitLab-Project: xen
X-GitLab-Project-Id: 2336572
X-GitLab-Project-Path: xen-project/xen
X-GitLab-Pipeline-Id: 1110118952
X-GitLab-Pipeline-Ref: staging
X-GitLab-Pipeline-Status: success
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All

----==_mimepart_657f09a8d76fa_2c11088afc1530b6
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit



Pipeline #1110118952 has passed!

Project: xen ( https://gitlab.com/xen-project/xen )
Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )

Commit: a60067f3 ( https://gitlab.com/xen-project/xen/-/commit/a60067f39882a4f40547fc0cd8177bac89cb01b7 )
Commit Message: docs/misra/rules.rst: add Rule 16.2

Signed-off...
Commit Author: Stefano Stabellini



Pipeline #1110118952 ( https://gitlab.com/xen-project/xen/-/pipelines/1110118952 ) triggered by Andrew Cooper ( https://gitlab.com/andyhhp )
successfully completed 133 jobs in 3 stages.

-- 
You're receiving this email because of your account on gitlab.com.




----==_mimepart_657f09a8d76fa_2c11088afc1530b6
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://ww=
w.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml" lang=3D"en" xml:lang=3D"en">=

<head>
<meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Type" =
/>
<meta content=3D"width=3Ddevice-width, initial-scale=3D1" name=3D"viewpor=
t" />
<meta content=3D"IE=3Dedge" http-equiv=3D"X-UA-Compatible" />
<title>xen | Successful pipeline for staging | a60067f3</title>
<style data-premailer=3D"ignore" type=3D"text/css">
body,table,td,a{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}t=
able,td{mso-table-lspace:0pt;mso-table-rspace:0pt}img{-ms-interpolation-m=
ode:bicubic}.hidden{display:none !important;visibility:hidden !important}=
a[x-apple-data-detectors]{color:inherit !important;text-decoration:none !=
important;font-size:inherit !important;font-family:inherit !important;fon=
t-weight:inherit !important;line-height:inherit !important}div[style*=3D'=
margin: 16px 0']{margin:0 !important}@media only screen and (max-width: 6=
39px){body,#body{min-width:320px !important}table.wrapper{width:100% !imp=
ortant;min-width:320px !important}table.wrapper td.wrapper-cell{border-le=
ft:0 !important;border-right:0 !important;border-radius:0 !important;padd=
ing-left:10px !important;padding-right:10px !important}}

</style>

<style>body {
margin: 0 !important; background-color: #fafafa; padding: 0; text-align: =
center; min-width: 640px; width: 100%; height: 100%; font-family: "Helvet=
ica Neue", Helvetica, Arial, sans-serif;
}
</style></head>
<body style=3D"text-align: center; min-width: 640px; width: 100%; height:=
 100%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-se=
rif; margin: 0; padding: 0;" bgcolor=3D"#fafafa">

<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" id=3D"body" style=
=3D"text-align: center; min-width: 640px; width: 100%; margin: 0; padding=
: 0;" bgcolor=3D"#fafafa">
<tbody>
<tr class=3D"line">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; height: 4px; font-size: 4px; line-height: 4px;" bgcolor=3D"#6b=
4fbb"></td>
</tr>
<tr class=3D"header">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; font-size: 13px; line-height: 1.6; color: #5c5c5c; padding: 25=
px 0;">

<img alt=3D"GitLab" src=3D"https://gitlab.com/assets/mailers/gitlab_logo-=
2957169c8ef64c58616a1ac3f4fc626e8a35ce4eb3ed31bb0d873712f2a041a0.png" wid=
th=3D"55" height=3D"55" />
</td>
</tr>
<tr>
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"wrapper"=
 style=3D"width: 640px; border-collapse: separate; border-spacing: 0; mar=
gin: 0 auto;">
<tbody>
<tr>
<td class=3D"wrapper-cell" style=3D"font-family: &quot;Helvetica Neue&quo=
t;, Helvetica, Arial, sans-serif; border-radius: 3px; overflow: hidden; p=
adding: 18px 25px; border: 1px solid #ededed;" align=3D"left" bgcolor=3D"=
#fff">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"content"=
 style=3D"width: 100%; border-collapse: separate; border-spacing: 0;">
<tbody>
<tr class=3D"table-success">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 3px; font-size: 14px; line-height: 1.3; overflow: hidden; co=
lor: #ffffff; padding: 10px;" align=3D"center" bgcolor=3D"#31af64">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse; margin: 0 auto;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #ffffff; padding-right: 5px;" align=3D"center" valign=3D"middle">
<img alt=3D"&#10003;" height=3D"13" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-check-green-inverted-3fc3485096ebb83ce1d951=
5883c8ca25ee5f382c4d643e064beb5da510aa26d5.gif" style=3D"display: block;"=
 width=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #ffffff;" align=3D"center" valign=3D"middle">
Pipeline #1110118952 has passed!
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr class=3D"spacer">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; he=
ight: 18px; font-size: 18px; line-height: 18px;">
&#160;
</td>
</tr>
<tr class=3D"section">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 3px; overflow: hidden; padding: 0 15px; border: 1px solid #e=
deded;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"table-in=
fo" style=3D"width: 100%;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; margin=
: 0; padding: 14px 0;">
Project
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #333333; font-weight: 500; width:=
 75%; margin: 0; padding: 14px 0 14px 5px;">
<a class=3D"muted" href=3D"https://gitlab.com/xen-project" style=3D"color=
: #333333; text-decoration: none;">
xen-project
</a>
/
<a class=3D"muted" href=3D"https://gitlab.com/xen-project/xen" style=3D"c=
olor: #333333; text-decoration: none;">
xen
</a>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">
Branch
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #333333; font-weight: 500; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" height=3D"13" src=3D"https://gitlab.com/assets/mailers/ci_p=
ipeline_notif_v1/icon-branch-gray-53618a7fc19d4d32ccbabac2f6d59bebe67202a=
9f2f1255e3f72c69756c0dd9c.gif" style=3D"display: block;" width=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a class=3D"muted" href=3D"https://gitlab.com/xen-project/xen/-/commits/s=
taging" style=3D"color: #333333; text-decoration: none;">
staging
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">
Commit
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #333333; font-weight: 400; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" height=3D"13" src=3D"https://gitlab.com/assets/mailers/ci_p=
ipeline_notif_v1/icon-commit-gray-c10243ac24cde64b549aec91de35e6b49c8739b=
506b86472b54614c10d8b4aac.gif" style=3D"display: block;" width=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a href=3D"https://gitlab.com/xen-project/xen/-/commit/a60067f39882a4f405=
47fc0cd8177bac89cb01b7" style=3D"color: #3777b0; text-decoration: none;">=
a60067f3</a>
</td>
</tr>
</tbody>
</table>
<div class=3D"commit" style=3D"color: #5c5c5c; font-weight: 300;">
docs/misra/rules.rst: add Rule 16.2

Signed-off...
</div>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">
Commit Author
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #333333; font-weight: 500; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" class=3D"avatar" height=3D"24" src=3D"https://secure.gravat=
ar.com/avatar/50b82a64e2a9f930cabefa3948871101?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<span>
Stefano Stabellini
</span>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr class=3D"spacer">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; he=
ight: 18px; font-size: 18px; line-height: 18px;">
&#160;
</td>
</tr>
<tr class=3D"success-message">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #333333; font-size: 15px; font-weight: 400; line-height: 1.4; paddin=
g: 15px 5px 0;" align=3D"center">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse; margin: 0 auto;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500;" valign=3D"baseline">
Pipeline <a href=3D"https://gitlab.com/xen-project/xen/-/pipelines/111011=
8952" style=3D"color: #3777b0; text-decoration: none;">#1110118952</a> tr=
iggered by
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; padding-right: 5px; pa=
dding-left: 5px;" width=3D"24" valign=3D"middle">
<img alt=3D"" class=3D"avatar" height=3D"24" src=3D"https://secure.gravat=
ar.com/avatar/4c68e59c4858f6dbd3465bd1ba226772?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"baseline">
<a class=3D"muted" href=3D"https://gitlab.com/andyhhp" style=3D"color: #3=
33333; text-decoration: none;">
Andrew Cooper
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; color: #333333; font-size: 15px; font-weight: 300; line-heigh=
t: 1.4; padding: 15px 5px;" align=3D"center">
successfully completed 133 jobs in 3 stages.
</td>
</tr>


</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>

<tr class=3D"footer">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; font-size: 13px; line-height: 1.6; color: #5c5c5c; padding: 25=
px 0;">
<img alt=3D"GitLab" class=3D"footer-logo" src=3D"https://gitlab.com/asset=
s/mailers/gitlab_logo_black_text-5430ca955baf2bbce6d3aa856a025da70ac5c959=
5597537254f665c10beab7a5.png" style=3D"display: block; width: 90px; margi=
n: 0 auto 1em;" />
<div>
You're receiving this email because of your account on <a target=3D"_blan=
k" rel=3D"noopener noreferrer" href=3D"https://gitlab.com" style=3D"color=
: #3777b0; text-decoration: none;">gitlab.com</a>. <a href=3D"https://git=
lab.com/-/profile/notifications" target=3D"_blank" rel=3D"noopener norefe=
rrer" class=3D"mng-notif-link" style=3D"color: #3777b0; text-decoration: =
none;">Manage all notifications</a> &#183; <a href=3D"https://gitlab.com/=
help" target=3D"_blank" rel=3D"noopener noreferrer" class=3D"help-link" s=
tyle=3D"color: #3777b0; text-decoration: none;">Help</a>
</div>
</td>
</tr>


<tr>
<td class=3D"footer-message" style=3D"font-family: &quot;Helvetica Neue&q=
uot;, Helvetica, Arial, sans-serif; font-size: 13px; line-height: 1.6; co=
lor: #5c5c5c; padding: 25px 0;">

</td>
</tr>
</tbody>
</table>
</body>
</html>

----==_mimepart_657f09a8d76fa_2c11088afc1530b6--

