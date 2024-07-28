Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78E93EA18
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 00:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766220.1176726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYCqk-0000ZW-8q; Sun, 28 Jul 2024 22:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766220.1176726; Sun, 28 Jul 2024 22:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYCqk-0000Wn-5p; Sun, 28 Jul 2024 22:58:46 +0000
Received: by outflank-mailman (input) for mailman id 766220;
 Sun, 28 Jul 2024 22:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m0Qz=O4=byiq.org=techguru@srs-se1.protection.inumbo.net>)
 id 1sYCqe-0000Wg-9w
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2024 22:58:44 +0000
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch
 [2001:1600:4:17::bc08])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec63a902-4d34-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 00:58:37 +0200 (CEST)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WXH3J3ldGzblG
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:58:36 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WXH3J1ZwBzMgZ
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:58:36 +0200 (CEST)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ec63a902-4d34-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=byiq.org;
	s=20191114; t=1722207516;
	bh=yomPAbtoeerznwAxCQ7S3pDuHJhKgMlP98s6ZuJG05M=;
	h=Date:Subject:From:Reply-To:To:From;
	b=eMJBrBXq4UuLvZhbFUWpvocE5ZrNC9pxre8j7LFfLtF2cLDuShMK9ungJbJYt6KFm
	 vekU02CncgHkhsdp98ZWSnsutFr8OTc/NOM+AgTVGBYQQ98YAqDbeaCEwYBJJftean
	 p8UzpiOH6bV9zI8Rp64FmSXhR3/OTGnjXVOQWFOI=
Message-ID: <3e2f9830a43bd867cd50faf4485c2683@mail.infomaniak.com>
Date: Mon, 29 Jul 2024 00:58:36 +0200
Subject: SLA Exceeded -- Coverity project access
From: Techguru <techguru@byiq.org>
Reply-To: Techguru <techguru@byiq.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="_=_swift_1722207516_35e967953221b53dc0ff2b7adcfdbfc2_=_"
X-WS-User-Origin: eyJpdiI6IlFjcVk3Z2Vlb0lKRlJlY0RnKyt2bUE9PSIsInZhbHVlIjoidkRvcDl2cS9GQUpwdk1zT0NoemJwZz09IiwibWFjIjoiZDk2YmFkMjhkYTYwNjYyYmRhN2ZjMDNlNGUzYjhkOTAyY2RhZmJhNWFhYzBiNTFhMGMxZDlhZTEwZTE5ZGQyYSIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6IkQrZVgzR05WbEJSaG9ubUNTVEV4NGc9PSIsInZhbHVlIjoiSFpRZXJ4UzZRWGIwL3V5YjhMREtUQT09IiwibWFjIjoiNmM5ZWQ0ODg2ZjIxMjQ5MWVhOGQ3OTA4ZGQ1YjAxYWNjM2E2OGZmM2JiODc4YzBmMDI1YTVlYjk3MDU5ZTI4YSIsInRhZyI6IiJ9
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.725)
X-Infomaniak-Routing: alpha


--_=_swift_1722207516_35e967953221b53dc0ff2b7adcfdbfc2_=_
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Project
Requested On
Status

=09=09XenProject [https://scan.coverit=
y.com/projects/606]

=09=09Jul 22, 2024

=09=09Pending Approval
=

request would be for GitHub ID "techguru@byiq.com"

thanks for your =
kind attention to this matter.



--_=_swift_1722207516_35e967953221b53dc0ff2b7adcfdbfc2_=_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><table style=3D"font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start;=
 text-transform: none; white-space: normal; widows: auto; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none; box-sizing: border=
-box; border-collapse: collapse; border-spacing: 0px; background-color: rgb=
(245, 245, 245); width: 847.5px; max-width: 100%; margin-bottom: 20px; min-=
height: 20px; padding: 19px; border: 1px solid rgb(207, 207, 207); border-r=
adius: 0px; -webkit-box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px inset; box-=
shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px inset; caret-color: rgb(51, 51, 51)=
; color: rgb(51, 51, 51); font-family: arial, helvetica, clean, sans-serif;=
 font-size: 18px;" class=3D"table table-striped well"><thead style=3D"box-s=
izing: border-box;"><tr style=3D"box-sizing: border-box;"><th style=3D"box-=
sizing: border-box; padding: 8px; text-align: left; line-height: 1.428571; =
vertical-align: bottom; border-top-width: 0px; border-top-style: none; bord=
er-top-color: currentcolor; border-bottom-width: 2px; border-bottom-style: =
solid; border-bottom-color: rgb(221, 221, 221);">Project<br></th><th style=
=3D"box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.=
428571; vertical-align: bottom; border-top-width: 0px; border-top-style: no=
ne; border-top-color: currentcolor; border-bottom-width: 2px; border-bottom=
-style: solid; border-bottom-color: rgb(221, 221, 221);">Requested On<br></=
th><th style=3D"box-sizing: border-box; padding: 8px; text-align: left; lin=
e-height: 1.428571; vertical-align: bottom; border-top-width: 0px; border-t=
op-style: none; border-top-color: currentcolor; border-bottom-width: 2px; b=
order-bottom-style: solid; border-bottom-color: rgb(221, 221, 221);">Status=
<br></th><th style=3D"box-sizing: border-box; padding: 8px; text-align: lef=
t; line-height: 1.428571; vertical-align: bottom; border-top-width: 0px; bo=
rder-top-style: none; border-top-color: currentcolor; border-bottom-width: =
2px; border-bottom-style: solid; border-bottom-color: rgb(221, 221, 221);">=
<br></th></tr></thead><tbody style=3D"box-sizing: border-box;"><tr style=3D=
"box-sizing: border-box; background-color: rgb(249, 249, 249);"><td style=
=3D"box-sizing: border-box; padding: 8px; line-height: 1.428571; vertical-a=
lign: top; border-top-width: 1px; border-top-style: solid; border-top-color=
: rgb(221, 221, 221);"><a style=3D"box-sizing: border-box; background-color=
: transparent; color: rgb(224, 124, 5); text-decoration: none;" href=3D"htt=
ps://scan.coverity.com/projects/606" target=3D"_blank" rel=3D"noopener nore=
ferrer" data-ik=3D"ik-secure">XenProject</a><br></td><td style=3D"box-sizin=
g: border-box; padding: 8px; line-height: 1.428571; vertical-align: top; bo=
rder-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 22=
1, 221);">Jul 22, 2024<br></td><td style=3D"box-sizing: border-box; padding=
: 8px; line-height: 1.428571; vertical-align: top; border-top-width: 1px; b=
order-top-style: solid; border-top-color: rgb(221, 221, 221);"><span class=
=3D"colour" style=3D"color:rgb(138, 109, 59)">Pending Approval<br><br></spa=
n></td></tr></tbody></table><div ><div>request would be for GitHub ID "<a h=
ref=3D"mailto:techguru@byiq.com">techguru@byiq.com</a>"<br></div><div style=
=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size:=
 14px"><br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Ar=
ial, sans-serif; font-size: 14px">thanks for your kind attention to this ma=
tter.<br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Aria=
l, sans-serif; font-size: 14px"><br></div></div><div style=3D"font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px"><br></div>=
</body></html>


--_=_swift_1722207516_35e967953221b53dc0ff2b7adcfdbfc2_=_--


