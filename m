Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2763ACFD3A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007969.1387162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR8y-0003XC-M9; Fri, 06 Jun 2025 07:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007969.1387162; Fri, 06 Jun 2025 07:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR8y-0003Ut-JK; Fri, 06 Jun 2025 07:05:36 +0000
Received: by outflank-mailman (input) for mailman id 1007969;
 Fri, 06 Jun 2025 07:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTeh=YV=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uNR8x-0003Um-Da
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:05:35 +0000
Received: from rein-hpcbdc09 (unknown [1.7.42.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1be8be0-42a4-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 09:05:33 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id D7D7E80C0C4F; Fri,  6 Jun 2025 12:35:28 +0530 (IST)
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
X-Inumbo-ID: a1be8be0-42a4-11f0-a301-13f23c93f187
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org,
	Jahan Murudi <jahan.murudi.zg@renesas.com>
Subject: [PATCH xen/arm 1/1] xen/arm: Standardize R-Car platform Kconfig descriptions
Date: Fri,  6 Jun 2025 12:35:01 +0530
Message-Id: <20250606070501.3470801-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changed "RCar3/RCar4" to "R-Car Gen3/Gen4" to match official Renesas branding
Aligns with documentation and industry-standard terminology

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 xen/arch/arm/platforms/Kconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 87bf614788..c8bc0bfae3 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -22,21 +22,23 @@ config QEMU
 	  machine.
 
 config RCAR3
-	bool "Renesas RCar3 support"
+	bool "Renesas R-Car Gen3 support"
 	depends on ARM_64
 	select HAS_SCIF
 	select IPMMU_VMSA
 	help
-	  Enable all the required drivers for Renesas RCar3
+	  Enable support for Renesas R-Car Generation 3 SoCs (H3, M3, etc.).
+	  Includes all required drivers and platform-specific features.
 
 config RCAR4
-	bool "Renesas RCar4 support"
+	bool "Renesas R-Car Gen4 support"
 	depends on ARM_64
 	select HAS_SCIF
 	select HAS_ITS
 	select IPMMU_VMSA
 	help
-	Enable all the required drivers for Renesas RCar4
+	  Enable support for Renesas R-Car Generation 4 SoCs (V4H, V4M, etc.).
+	  Includes all required drivers and platform-specific features.
 
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
-- 
2.34.1


