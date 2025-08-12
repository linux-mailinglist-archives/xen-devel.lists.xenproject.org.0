Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D0B23BEB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 00:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079228.1440240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxWJ-00056T-Ej; Tue, 12 Aug 2025 22:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079228.1440240; Tue, 12 Aug 2025 22:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxWJ-00054T-Bn; Tue, 12 Aug 2025 22:31:03 +0000
Received: by outflank-mailman (input) for mailman id 1079228;
 Tue, 12 Aug 2025 22:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Th/E=2Y=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ulxWI-00040E-CQ
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 22:31:02 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0603fb4d-77cc-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 00:31:00 +0200 (CEST)
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
X-Inumbo-ID: 0603fb4d-77cc-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=k7oph3bys5gy3njxrbdir6chzq.protonmail; t=1755037860; x=1755297060;
	bh=rdQXCVFze6KOyWq6nsTsOEIIqpuCBpCeg3Vc7jqqwuk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n4UmsL8nvb2m1Qlx7l9qbLyiqN3PiWpF+WLGYF8mRpW0wDpcEG67yUhcAO/SJ9KjQ
	 vBVBE9fsxhEvPbed8s+6qYjCGVM49q93bXoncN0Ki7q6vwO0eAjWwvv5aSliASuGNf
	 uaD9na1XDReGJ3go/NE61LgmMeNWHWgcfhFcFDa3/AgltYXpPWRgKcOpCn7PsNZysR
	 qqQihcOtCf1D98OhlV7aNOQL0FwpAUsqx+kA76eP6XTjjua6ytSvSE14yAdOO2DzKp
	 03yN43VdG/15KusPNCNK5DsSJFpQIYiHspAsi/UDJ0POqkAVps/nnJawdyWGtfdsUt
	 FL+ii1AgiSuoA==
Date: Tue, 12 Aug 2025 22:30:55 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v16 4/4] xen/domain: update create_dom0() messages
Message-ID: <20250812223024.2364749-5-dmukhin@ford.com>
In-Reply-To: <20250812223024.2364749-1-dmukhin@ford.com>
References: <20250812223024.2364749-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 988fb461b15465d53a24828d95a121f315ef5de8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Use %pd for domain identification in error/panic messages in create_dom0().

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes since v15:
- n/a
---
 xen/arch/arm/domain_build.c | 6 +++---
 xen/arch/x86/setup.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index aca35b8961d6..670f634b8b0d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2084,14 +2084,14 @@ void __init create_dom0(void)
         panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
=20
     if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
-        panic("Error initializing LLC coloring for domain 0 (rc =3D %d)\n"=
, rc);
+        panic("Error initializing LLC coloring for %pd (rc =3D %d)\n", dom=
0, rc);
=20
     if ( vcpu_create(dom0, 0) =3D=3D NULL )
-        panic("Error creating domain 0 vcpu0\n");
+        panic("Error creating %pdv0\n", dom0);
=20
     rc =3D construct_dom0(dom0);
     if ( rc )
-        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
+        panic("Could not set up %pd guest OS (rc =3D %d)\n", dom0, rc);
=20
     set_xs_domain(dom0);
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 398da734c0c5..bf21c55f7193 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1084,7 +1084,7 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
=20
         if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
         {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\n");
+            printk("ACPI is disabled, notifying %pd (acpi=3Doff)\n", d);
             safe_strcpy(acpi_param, "off");
         }
=20
@@ -1099,7 +1099,7 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
=20
     bd->d =3D d;
     if ( construct_dom0(bd) !=3D 0 )
-        panic("Could not construct domain 0\n");
+        panic("Could not construct %pd\n", d);
=20
     bd->cmdline =3D NULL;
     xfree(cmdline);
--=20
2.34.1



