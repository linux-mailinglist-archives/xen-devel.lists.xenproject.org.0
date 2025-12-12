Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B86CB9D7B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 22:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185811.1507775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAH5-0006vf-Ag; Fri, 12 Dec 2025 21:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185811.1507775; Fri, 12 Dec 2025 21:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAH5-0006sv-7b; Fri, 12 Dec 2025 21:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1185811;
 Fri, 12 Dec 2025 21:02:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7oZ6=6S=tutanota.de=torsten.oehlenschlager@srs-se1.protection.inumbo.net>)
 id 1vUAH3-0006sp-OF
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 21:02:01 +0000
Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccfbd694-d79d-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 22:01:59 +0100 (CET)
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
 by mail.w13.tutanota.de (Postfix) with ESMTP id F3012EE60988
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 22:01:58 +0100 (CET)
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
X-Inumbo-ID: ccfbd694-d79d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765573318;
	s=s1; d=tutanota.de;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=8TNNbGS4SlRE8tnfQkt9yF/hi7qgkssIVVtcVelpxnE=;
	b=tS64eeYfKTXLJQPNhtZkDEUZkGbmtHEfOvjGhibHW8d8BsR4R9YsONbfbkccIG36
	ND+wAiP3ec0jtKlzS5byVid53+kW0PECm18xT+NQUAQzqeSXQUubsMsvUyCSkYUQb9I
	CFS0uwJ7dFvGsAyS2Swb4MvJaBi3aBzyFgp6lnvTLyLxAw+Mm68IHFw3yE8YDMtv9dK
	3NBoWM22pHnLgch85fkEM0ub3jRS60yBxlK2O3s/jQFJeJ+l3QzlWiHHfT8SWxtWjzA
	RwGHRI15PcsjeUZtJpFxORJeKFThxJTpGWZ1vJpk5YdLT9vJdHrQ/31II1JA5MWcV7c
	AksM6EQI4g==
Date: Fri, 12 Dec 2025 22:01:58 +0100 (CET)
From: torsten.oehlenschlager@tutanota.de
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper3 <andrew.cooper3@citrix.com>,
	Sstabellini <sstabellini@kernel.org>, Jbeulich <jbeulich@suse.com>,
	Julien <julien@xen.org>
Message-ID: <OgJMhRT--F-9@tutanota.de>
Subject: [PATCH] xen/domain: enable VCPUOP_register_runstate_phys_area
 hypercall
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_158966_818997258.1765573318990"
Feedback-ID: 011d5ed05728e58e5db284b86eb700e945cf629bed5c7c39853a6d350729b3e9f5cb022cdd0f4650868659d87b16d2f26197404a7fa7c230a23c8b7e8d6dfcd12a91a98cb923aa405ecf29ac953b9df678:TurnOnPrivacy!:tutamail

------=_Part_158966_818997258.1765573318990
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ice@blossom ...............................................................=
...........................................................................=
....................................=E2=80=A6/xen =F0=9F=8C=B8 enable-runst=
ate-phys-area ?
=E2=9D=AF cat 0001-xen-domain-enable-VCPUOP_register_runstate_phys_area.pat=
ch
From 416992b30258d34b7cc7bc4f7875719f47618147 Mon Sep 17 00:00:00 2001
From: melanie <torsten.oehlenschlager@tutanota.de>
Date: Fri, 12 Dec 2025 20:55:50 +0000
Subject: [PATCH] xen/domain: enable VCPUOP_register_runstate_phys_area
hypercall

The XENFEAT_runstate_phys_area feature is unconditionally advertised to
guests via XENVER_get_features ( see xen/common/kernel.c ),=C2=A0 but the
corresponding VCPUOP_register_runstate_phys_area hypercall was disabled
with a placeholder check that always returned -ENOSYS!

Remove the dead code to enable the hypercall,=C2=A0 making the implementati=
on
consistent with the advertised feature.

Signed-off-by: melanie <torsten.oehlenschlager@tutanota.de>
---
xen/common/domain.c | 4 ----
1 file changed, 4 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 93c71bc766..3ae8d41cf2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2284,10 +2284,6 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUE=
ST_HANDLE_PARAM(void) arg)
=C2=A0=C2=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu_register_runst=
ate_memory_area area;

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -ENOSYS;
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( 0 /* TODO: Dom's XENFEAT_r=
unstate_phys_area setting */ )
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
-
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -EFAULT;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( copy_from_guest(&area=
.addr.p, arg, 1) )
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
--

--=20

------=_Part_158966_818997258.1765573318990
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
<div dir=3D"auto">ice@blossom .............................................=
...........................................................................=
......................................................=E2=80=A6/xen =F0=9F=
=8C=B8 enable-runstate-phys-area ?<br></div><div dir=3D"auto">=E2=9D=AF cat=
 0001-xen-domain-enable-VCPUOP_register_runstate_phys_area.patch<br></div><=
div dir=3D"auto">From 416992b30258d34b7cc7bc4f7875719f47618147 Mon Sep 17 0=
0:00:00 2001<br></div><div dir=3D"auto">From: melanie &lt;<a href=3D"mailto=
:torsten.oehlenschlager@tutanota.de" rel=3D"noopener noreferrer" target=3D"=
_blank">torsten.oehlenschlager@tutanota.de</a>&gt;<br></div><div dir=3D"aut=
o">Date: Fri, 12 Dec 2025 20:55:50 +0000<br></div><div dir=3D"auto">Subject=
: [PATCH] xen/domain: enable VCPUOP_register_runstate_phys_area<br></div><d=
iv dir=3D"auto">hypercall<br></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">The XENFEAT_runstate_phys_area feature is unconditionally advertised =
to<br></div><div dir=3D"auto">guests via XENVER_get_features ( see xen/comm=
on/kernel.c ),&nbsp; but the<br></div><div dir=3D"auto">corresponding VCPUO=
P_register_runstate_phys_area hypercall was disabled<br></div><div dir=3D"a=
uto">with a placeholder check that always returned -ENOSYS!<br></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Remove the dead code to enable the =
hypercall,&nbsp; making the implementation<br></div><div dir=3D"auto">consi=
stent with the advertised feature.<br></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Signed-off-by: melanie &lt;<a href=3D"mailto:torsten.oehlens=
chlager@tutanota.de" rel=3D"noopener noreferrer" target=3D"_blank">torsten.=
oehlenschlager@tutanota.de</a>&gt;<br></div><div dir=3D"auto">---<br></div>=
<div dir=3D"auto">xen/common/domain.c | 4 ----<br></div><div dir=3D"auto">1=
 file changed, 4 deletions(-)<br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">diff --git a/xen/common/domain.c b/xen/common/domain.c<br></div><=
div dir=3D"auto">index 93c71bc766..3ae8d41cf2 100644<br></div><div dir=3D"a=
uto">--- a/xen/common/domain.c<br></div><div dir=3D"auto">+++ b/xen/common/=
domain.c<br></div><div dir=3D"auto">@@ -2284,10 +2284,6 @@ long common_vcpu=
_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)<br></div><di=
v dir=3D"auto">&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div dir=3D"auto">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vcpu_register_runstate_me=
mory_area area;<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">-&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D -ENOSYS;<br></div><div dir=
=3D"auto">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( 0 /* TODO: Dom's=
 XENFEAT_runstate_phys_area setting */ )<br></div><div dir=3D"auto">-&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></di=
v><div dir=3D"auto">-<br></div><div dir=3D"auto">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; rc =3D -EFAULT;<br></div><div dir=3D"auto">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( copy_from_guest(&amp;area.addr=
.p, arg, 1) )<br></div><div dir=3D"auto">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div dir=3D"auto">--=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">-- <br></div>  </bo=
dy>
</html>

------=_Part_158966_818997258.1765573318990--

