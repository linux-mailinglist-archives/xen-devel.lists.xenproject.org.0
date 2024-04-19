Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D008AADDE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709038.1108321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxmeA-0004o7-ER; Fri, 19 Apr 2024 11:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709038.1108321; Fri, 19 Apr 2024 11:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxmeA-0004l5-Ad; Fri, 19 Apr 2024 11:43:14 +0000
Received: by outflank-mailman (input) for mailman id 709038;
 Fri, 19 Apr 2024 11:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vK8K=LY=posteo.net=tobias.fitschen@srs-se1.protection.inumbo.net>)
 id 1rxmSl-00028q-TM
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:31:28 +0000
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a052577-fe40-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 13:31:23 +0200 (CEST)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0A914240027
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 13:31:22 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VLXXT5PdMz6tm8;
 Fri, 19 Apr 2024 13:31:21 +0200 (CEST)
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
X-Inumbo-ID: 5a052577-fe40-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1713526283; bh=3KhJWAlb7hiPakWNt/PdwbycrXAPh43wMejKFcylGNw=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ZHn+v2L2S26wsawP7+MdQJVRtBD47dHUDyD1TUy8dPc9KiR2pC+Qh0XlyB9uFlxhr
	 lt6JroGgmhFMwa7Aq+SiiqlBUZqP0LA28Py7er/0D2CPdCBf+VeGpcHo6TigJfHGpg
	 zOODO6FHS91uPH4h9i7CCWjOJ1w/aF9w9NZq9AVMfLugjjaqtWsMz0ViRjes49rGfj
	 XQWWgqM2Mk7YmQcfOXsZQkPdlXL0MPFwRElaFKK8lWQ4lJF0owmfyjkjiEfSqxqamS
	 WKRmEB5kVu+qmZTGaYbUd7TdduSuBIvZGQWaS+nf4GypcKWiIfKOSo4QP4bfNvf+mr
	 2uNftZZc7cDpw==
Date: Fri, 19 Apr 2024 11:31:23 +0000
From: Tobias Fitschen <tobias.fitschen@posteo.net>
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
CC: Tobias Fitschen <tobias.fitschen@posteo.de>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/3=5D_tools/golang=3A_When_return?=
 =?US-ASCII?Q?ing_pointers=2C_actually_allocate_structrues?=
In-Reply-To: <20240419105037.700283-1-george.dunlap@cloud.com>
References: <20240419105037.700283-1-george.dunlap@cloud.com>
Message-ID: <0743B38A-6015-41B7-9294-3ABD01A3C8E1@posteo.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----IGRBF76P9LC1X6RLGLX726QSMKBBY6
Content-Transfer-Encoding: 7bit

------IGRBF76P9LC1X6RLGLX726QSMKBBY6
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you for the fast response, George=2E I can confirm that I can call al=
l three functions without errors now and this patch fixes the errors I enco=
untered=2E

Am 19=2E April 2024 12:50:35 MESZ schrieb George Dunlap <george=2Edunlap@c=
loud=2Ecom>:
>In a handful of cases, it was decided to return a pointer to a
>structure rather than the plain structure itself, due to the size=2E
>However, in these cases the structure was never allocated, leading to
>a nil pointer exception when calling the relevant `fromC` method=2E
>
>Allocate structures before attempting to fill them in=2E
>
>Reported-by: Tobias Fitschen <tobias=2Efitschen@posteo=2Ede>
>Signed-off-by: George Dunlap <george=2Edunlap@cloud=2Ecom>
>---
>This has been compile-tested only; Tobias, I'd appreciate a test if you g=
et a chance=2E
>
>CC: Nick Rosbrook <rosbrookn@gmail=2Ecom>
>CC: Anthony PERARD <anthony=2Eperard@citrix=2Ecom>
>---
> tools/golang/xenlight/xenlight=2Ego | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/tools/golang/xenlight/xenlight=2Ego b/tools/golang/xenlight/=
xenlight=2Ego
>index a45c636952=2E=2Ed793f172e5 100644
>--- a/tools/golang/xenlight/xenlight=2Ego
>+++ b/tools/golang/xenlight/xenlight=2Ego
>@@ -999,6 +999,7 @@ func (ctx *Context) GetPhysinfo() (physinfo *Physinfo=
, err error) {
> 		err =3D Error(ret)
> 		return
> 	}
>+	physinfo =3D &Physinfo{}
> 	err =3D physinfo=2EfromC(&cphys)
>=20
> 	return
>@@ -1010,6 +1011,7 @@ func (ctx *Context) GetVersionInfo() (info *Version=
Info, err error) {
>=20
> 	cinfo =3D C=2Elibxl_get_version_info(ctx=2Ectx)
>=20
>+	info =3D &VersionInfo{}
> 	err =3D info=2EfromC(cinfo)
>=20
> 	return
>@@ -1027,6 +1029,7 @@ func (ctx *Context) DomainInfo(Id Domid) (di *Domin=
fo, err error) {
> 		return
> 	}
>=20
>+	di =3D &Dominfo{}
> 	err =3D di=2EfromC(&cdi)
>=20
> 	return
>--=20
>2=2E25=2E1
>

------IGRBF76P9LC1X6RLGLX726QSMKBBY6
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Thank you for the fast response,=
 George=2E I can confirm that I can call all three functions without errors=
 now and this patch fixes the errors I encountered=2E</div><br><br><div cla=
ss=3D"gmail_quote"><div dir=3D"auto">Am 19=2E April 2024 12:50:35 MESZ schr=
ieb George Dunlap &lt;george=2Edunlap@cloud=2Ecom&gt;:</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px s=
olid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><div dir=3D"auto">In a handful of cases, it was deci=
ded to return a pointer to a<br>structure rather than the plain structure i=
tself, due to the size=2E<br>However, in these cases the structure was neve=
r allocated, leading to<br>a nil pointer exception when calling the relevan=
t `fromC` method=2E<br><br>Allocate structures before attempting to fill th=
em in=2E<br><br>Reported-by: Tobias Fitschen &lt;tobias=2Efitschen@posteo=
=2Ede&gt;<br>Signed-off-by: George Dunlap &lt;george=2Edunlap@cloud=2Ecom&g=
t;<hr>This has been compile-tested only; Tobias, I'd appreciate a test if y=
ou get a chance=2E<br><br>CC: Nick Rosbrook &lt;rosbrookn@gmail=2Ecom&gt;<b=
r>CC: Anthony PERARD &lt;anthony=2Eperard@citrix=2Ecom&gt;<hr> tools/golang=
/xenlight/xenlight=2Ego | 3 +++<br> 1 file changed, 3 insertions(+)<br><br>=
diff --git a/tools/golang/xenlight/xenlight=2Ego b/tools/golang/xenlight/xe=
nlight=2Ego<br>index a45c636952=2E=2Ed793f172e5 100644<br>--- a/tools/golan=
g/xenlight/xenlight=2Ego<br>+++ b/tools/golang/xenlight/xenlight=2Ego<br>@@=
 -999,6 +999,7 @@ func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, er=
r error) {<br> 		err =3D Error(ret)<br> 		return<br> 	}<br>+	physinfo =3D &=
amp;Physinfo{}<br> 	err =3D physinfo=2EfromC(&amp;cphys)<br> <br> 	return<b=
r>@@ -1010,6 +1011,7 @@ func (ctx *Context) GetVersionInfo() (info *Version=
Info, err error) {<br> <br> 	cinfo =3D C=2Elibxl_get_version_info(ctx=2Ectx=
)<br> <br>+	info =3D &amp;VersionInfo{}<br> 	err =3D info=2EfromC(cinfo)<br=
> <br> 	return<br>@@ -1027,6 +1029,7 @@ func (ctx *Context) DomainInfo(Id D=
omid) (di *Dominfo, err error) {<br> 		return<br> 	}<br> <br>+	di =3D &amp;=
Dominfo{}<br> 	err =3D di=2EfromC(&amp;cdi)<br> <br> 	return<br></div></pre=
></blockquote></div></body></html>
------IGRBF76P9LC1X6RLGLX726QSMKBBY6--

