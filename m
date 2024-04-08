Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57489C968
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 18:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702012.1096721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtraw-00021o-F4; Mon, 08 Apr 2024 16:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702012.1096721; Mon, 08 Apr 2024 16:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtraw-0001rz-9l; Mon, 08 Apr 2024 16:11:42 +0000
Received: by outflank-mailman (input) for mailman id 702012;
 Mon, 08 Apr 2024 16:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUGe=LN=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rtrav-0001de-14
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 16:11:41 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7352cb-f5c2-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 18:11:37 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 8 Apr
 2024 18:11:36 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Mon, 8 Apr 2024 18:11:36 +0200
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
X-Inumbo-ID: ad7352cb-f5c2-11ee-b7f7-5d6b493b22b9
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
Subject: [PATCH v4 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP} related
 patches
Thread-Topic: [PATCH v4 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP}
 related patches
Thread-Index: AQHaic9t6tnWcqaR0k6EJDZEI79dYg==
Date: Mon, 8 Apr 2024 16:11:35 +0000
Message-ID: <20240408161129.900347-4-john.ernberg@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
In-Reply-To: <20240408161129.900347-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72954657C6A
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

I have experience with the IMX8QXP, and the supported parts of the IMX8QM
are identical.

Help review patches touching these areas.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---

v4:
 - Properly sign the patch off (Stefano Stabellini)
 - Pick up Stefano's ack

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

