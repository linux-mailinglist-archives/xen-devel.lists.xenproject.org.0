Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9927F63D1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639842.997541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CQu-0007Tv-8J; Thu, 23 Nov 2023 16:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639842.997541; Thu, 23 Nov 2023 16:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CQu-0007Re-2A; Thu, 23 Nov 2023 16:20:04 +0000
Received: by outflank-mailman (input) for mailman id 639842;
 Thu, 23 Nov 2023 16:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zW5S=HE=mg.gitlab.com=bounce+c66dc3.947b4-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1r6CQs-0006y3-Fq
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:20:02 +0000
Received: from mail-183-236.mailgun.info (mail-183-236.mailgun.info
 [23.253.183.236]) by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 24ff61b1-8a1c-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 17:19:58 +0100 (CET)
Received: from mg.gitlab.com (12.226.74.34.bc.googleusercontent.com
 [34.74.226.12]) by
 4880619ba52c with SMTP id 655f7baceffdc8361574d36f (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 23 Nov 2023 16:19:56 GMT
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
X-Inumbo-ID: 24ff61b1-8a1c-11ee-9b0e-b553b5be7939
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.gitlab.com;
 q=dns/txt; s=mailo; t=1700756396; x=1700763596; h=List-Id:
 Content-Transfer-Encoding: Content-Type: Mime-Version: Subject: Subject:
 Message-ID: To: To: Reply-To: From: From: Date: Sender: Sender;
 bh=n9igjEkFBligUsERFzHg/N3JAklzOvXmrlOBMEpq9D4=;
 b=G11CWVejLoNTVLXO7Pxhc/4E/RJMmPwxOFIhYKA4HaNwh/iEoGzXAU04xotK+Y0sxkmKopbTvirUBTDcesUErIZdRHGqOe/Lq/Uyfu9xd350DxWDFc+9j08vxt7IiAGrGa6/ytftcXlzY6C7JQ6B4NblyD6Rthl2FYKuBAveRsY=
X-Mailgun-Sending-Ip: 23.253.183.236
X-Mailgun-Sid: WyI4YjA3MiIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsIjk0N2I0Il0=
Sender: gitlab@mg.gitlab.com
Date: Thu, 23 Nov 2023 16:19:56 +0000
From: GitLab <gitlab@mg.gitlab.com>
Reply-To: GitLab <noreply@gitlab.com>
To: xen-devel@lists.xenproject.org
Message-ID: <655f7bac56eea_2d9ad5813232d@gitlab-sidekiq-catchall-v2-9564b97f6-vm4t9.mail>
Subject: xen | Successful pipeline for staging | f96e2f64
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_655f7bac4e995_2d9ad58132243";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitLab-Project: xen
X-GitLab-Project-Id: 2336572
X-GitLab-Project-Path: xen-project/xen
X-GitLab-Pipeline-Id: 1082747345
X-GitLab-Pipeline-Ref: staging
X-GitLab-Pipeline-Status: success
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All

----==_mimepart_655f7bac4e995_2d9ad58132243
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit



Pipeline #1082747345 has passed!

Project: xen ( https://gitlab.com/xen-project/xen )
Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )

Commit: f96e2f64 ( https://gitlab.com/xen-project/xen/-/commit/f96e2f64576cdbb147391c7cb399d393385719a9 )
Commit Message: xen/MISRA: Remove nonstandard inline keywords

...
Commit Author: Andrew Cooper ( https://gitlab.com/andyhhp )



Pipeline #1082747345 ( https://gitlab.com/xen-project/xen/-/pipelines/1082747345 ) triggered by Ganis ( https://gitlab.com/ganis )
successfully completed 129 jobs in 3 stages.

-- 
You're receiving this email because of your account on gitlab.com.




----==_mimepart_655f7bac4e995_2d9ad58132243
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
<title>xen | Successful pipeline for staging | f96e2f64</title>
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
Pipeline #1082747345 has passed!
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
<a href=3D"https://gitlab.com/xen-project/xen/-/commit/f96e2f64576cdbb147=
391c7cb399d393385719a9" style=3D"color: #3777b0; text-decoration: none;">=
f96e2f64</a>
</td>
</tr>
</tbody>
</table>
<div class=3D"commit" style=3D"color: #5c5c5c; font-weight: 300;">
xen/MISRA: Remove nonstandard inline keywords

...
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
ar.com/avatar/6cb22538f3a82e4ee99e1d0419f62385?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
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
Pipeline <a href=3D"https://gitlab.com/xen-project/xen/-/pipelines/108274=
7345" style=3D"color: #3777b0; text-decoration: none;">#1082747345</a> tr=
iggered by
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; padding-right: 5px; pa=
dding-left: 5px;" width=3D"24" valign=3D"middle">
<img alt=3D"" class=3D"avatar" height=3D"24" src=3D"https://secure.gravat=
ar.com/avatar/568538936b4ac45a343cb3a4ab0c6cda?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"baseline">
<a class=3D"muted" href=3D"https://gitlab.com/ganis" style=3D"color: #333=
333; text-decoration: none;">
Ganis
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
successfully completed 129 jobs in 3 stages.
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

----==_mimepart_655f7bac4e995_2d9ad58132243--

