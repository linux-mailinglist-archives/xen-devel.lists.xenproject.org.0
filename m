Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171D8A6CA0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 15:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706972.1104410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwj1X-0002S0-Fk; Tue, 16 Apr 2024 13:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706972.1104410; Tue, 16 Apr 2024 13:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwj1X-0002Py-Ce; Tue, 16 Apr 2024 13:38:59 +0000
Received: by outflank-mailman (input) for mailman id 706972;
 Tue, 16 Apr 2024 13:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gIXQ=LV=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rwj1V-0002PR-TQ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 13:38:57 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb4e3b2-fbf6-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 15:38:55 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 16 Apr
 2024 15:38:54 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Tue, 16 Apr 2024 15:38:54 +0200
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
X-Inumbo-ID: abb4e3b2-fbf6-11ee-94a3-07e782e9044d
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "John
 Ernberg" <john.ernberg@actia.se>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
Thread-Topic: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
Thread-Index: AQHakANs0o7CMXmy6E6n0UqJT/8QvQ==
Date: Tue, 16 Apr 2024 13:38:54 +0000
Message-ID: <20240416133844.2544452-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A293A9A2F57647D64
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

New contributions are recommended to be under GPL-2.0-only [1], since this
code piece originally came from the NXP tree the original license was
retained.

However, as discussed both Peng [2] and I [3] are ok with GPL-2.0.-only
as a license. Change the license.

Cc: Peng Fan <peng.fan@nxp.com>
Link: https://lore.kernel.org/xen-devel/084b9ed5-1585-4802-b504-6ccd2f26254=
2@xen.org/ [1]
Link: https://lore.kernel.org/xen-devel/DU0PR04MB9417A835B5D04517CC11500788=
082@DU0PR04MB9417.eurprd04.prod.outlook.com/ [2]
Link: https://lore.kernel.org/xen-devel/e3785d8a-9b16-4b74-9453-b0166bdbb17=
1@actia.se/ [3]
Signed-off-by: John Ernberg <john.ernberg@actia.se>
---
 xen/arch/arm/platforms/imx8qm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8q=
m.c
index 3600a073e8..9dac6af425 100644
--- a/xen/arch/arm/platforms/imx8qm.c
+++ b/xen/arch/arm/platforms/imx8qm.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * xen/arch/arm/platforms/imx8qm.c
  *
--=20
2.44.0

