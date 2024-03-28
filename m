Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D389053A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699123.1091723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshj-0005VO-Vt; Thu, 28 Mar 2024 16:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699123.1091723; Thu, 28 Mar 2024 16:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshj-0005Sa-Qz; Thu, 28 Mar 2024 16:34:15 +0000
Received: by outflank-mailman (input) for mailman id 699123;
 Thu, 28 Mar 2024 16:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOaz=LC=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rpshi-0004sj-Dg
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 16:34:14 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 028a482f-ed21-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 17:34:12 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Mar
 2024 17:34:09 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Thu, 28 Mar 2024 17:34:09 +0100
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
X-Inumbo-ID: 028a482f-ed21-11ee-a1ef-f123f15fe8a2
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH v3 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP} related
 patches
Thread-Topic: [PATCH v3 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP}
 related patches
Thread-Index: AQHagS3BovnjCFENDkmKWDvyUosLMw==
Date: Thu, 28 Mar 2024 16:34:08 +0000
Message-ID: <20240328163351.64808-4-john.ernberg@actia.se>
References: <20240328163351.64808-1-john.ernberg@actia.se>
In-Reply-To: <20240328163351.64808-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2958D729556C7D66
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

I have experience with the IMX8QXP, and the supported parts of the IMX8QM
are identical.

Help review patches touching these areas.

---

v3:
 - New patch (Bertrand Marquis)
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bd22fd75f..09982241b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -337,6 +337,11 @@ F:	tools/misc/xenhypfs.c
 F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
=20
+IMX8QM/QXP SUPPORT
+R:	John Ernberg <john.ernberg@actia.se>
+F:	xen/arch/arm/platforms/imx8qm.c
+F:	xen/drivers/char/imx-lpuart.c
+
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
 R:	Lukasz Hawrylko <lukasz@hawrylko.pl>
 R:	Daniel P. Smith <dpsmith@apertussolutions.com>
--=20
2.44.0

