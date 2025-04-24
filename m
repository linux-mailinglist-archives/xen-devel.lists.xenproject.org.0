Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64CEA9B3C5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966638.1356824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zKR-0000Uz-EH; Thu, 24 Apr 2025 16:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966638.1356824; Thu, 24 Apr 2025 16:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zKR-0000SH-BD; Thu, 24 Apr 2025 16:21:35 +0000
Received: by outflank-mailman (input) for mailman id 966638;
 Thu, 24 Apr 2025 16:21:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAR-0001nN-PO
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:15 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:200a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdc409bd-2126-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 18:11:14 +0200 (CEST)
Received: from MW4PR04CA0287.namprd04.prod.outlook.com (2603:10b6:303:89::22)
 by PH7PR12MB9125.namprd12.prod.outlook.com (2603:10b6:510:2f4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 16:11:08 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::ca) by MW4PR04CA0287.outlook.office365.com
 (2603:10b6:303:89::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 16:11:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:11:06 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:11:01 -0500
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
X-Inumbo-ID: bdc409bd-2126-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+UKtx/veAKpIV4ZiRM3KQcfAseuB592R7A7/5IAbFjV3vjlezXKiGvJHvoHlbiqqLccPTqi/K4r73NbB0jJ+uln3LuGBprztes36FHxkfnFGafbVWztCeyKQZT02USGOD4okpjdH0LzmJxNwzdtZuEZh3/OGAn7uyrX9tOWPPulhQxsmJb3a1HiA2N9y6T0Phlo+FjHUNAMbJx2RiP3X+GXxlV56jbJ9bzAlg9rI1DHT8Jiuj892VUK5qqSze9kE8X6Vri7hISqPoubi66cZ4NaeykEtFi00nzJN+qzml6+woWATvOgXH5mB2lKS33WzXJ5AhBEtUCV5Cd1EkFplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y2vRpZxTQB/tX3/SzwBn0+VCnYO2holz9cei3VSTZg=;
 b=i3YFUN3PvzsNnbEJd3KfGg2qt0mN7pSAeIniY9i0bkJXNbkyJZww6Se6BGIHSIMc+R+M8c8huRAkrToHtEng7Ce8RelMFkJZ4iUspf2pLyRGNjOBz9iqjaYda2UBXuD/H97f1e7rI+y9M2hmgoCTKkQJHz/VebTMzqUwsV5NKLlk/Ws5T8iXdSjwExZz4JZ6bxSefAohQCztutJ7CFl+WM31yxWpYawmivJLQzNdu8UEN9uhRp0QQ9IVxWCs5HTJc5kuFKyGOZ6NyVz+/dOwVpB3yRzX2BPZUdnM3w6jWdh1vjcgUGal0EEbnsdlH1GCKEVetu4W7kdU+7D3H5Mudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y2vRpZxTQB/tX3/SzwBn0+VCnYO2holz9cei3VSTZg=;
 b=inkGGmKoJ7BV9rOFbw7jDDAm3cZWpWmcWffrveR8PCb0b776ksqHLG6Nha0CK1/+U1WkuZ5170DEEfuua6vVuA/D5FFz9dCrFgKn6bp/omtC2Veq1gCZHIuB4XfB+ynIp754IYc7LXZUQ1BFyqROUCSgH4vd3uSqCv+OnCFZpIs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v5 07/12] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Date: Thu, 24 Apr 2025 17:10:17 +0100
Message-ID: <20250424161027.92942-8-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|PH7PR12MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdc1277-9c07-4fa5-10bc-08dd834a9eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wYpcAwj715kVW3UcT0dpIsBxe3Gj6LBMJifMuRN84ZWawaA3bi1qheF1QmKm?=
 =?us-ascii?Q?tJlkFlt889YQYSbD81GInXIq6URxpE9ooFuu72A/xNFoDpUvFOlbERvVIGlG?=
 =?us-ascii?Q?LkK2THTFairq14hhuyz/HyPc9Beviw6Do0gcoaPm542IWyNEOXN5ywXkYdQv?=
 =?us-ascii?Q?p9s8GLM7sXr5MvOvffZKS3cjA5/dI4HA7k3j+Xq1rpMCkchpiV22C5ZeJuHi?=
 =?us-ascii?Q?+9uDqS4CpIMtqJ4LYjkElXwv/2He8Sel5e8ykPm4fw1bLhGS8D1bR1Jy0dKz?=
 =?us-ascii?Q?6GJ7lKJtLdDJpnGeRrLIPYZaGEbmaTrVczqmCqlNt8Hi9gY/KLmzYWFmBoCB?=
 =?us-ascii?Q?ZjugXj3sukq2Bt5nO3O4B/1zauVpZf3CCxy5Ru97HqARh2TLfRg8aQkrxVa+?=
 =?us-ascii?Q?YNaJQgQ0/sXVKYjrUq6urGYX+3I3C0Bb4rB9PpEszkXphmg9KLOoEN1kxyX2?=
 =?us-ascii?Q?ERTr1oOVqY0QIPJoPbGH0Su5u+fYFeASCgscd57j7bQykEb7EqjHf4npv4Ao?=
 =?us-ascii?Q?/SvN6XmwW8Af6YhpQenGu28eRaAAD12jAXLKco48PHoSDt/WxXb3OaB3n8Kj?=
 =?us-ascii?Q?/5XodTwbsNwazbK1N/FDJwHn/IP79yvIbr4z+KDHzsLQywrIeP9mTm5ZzduR?=
 =?us-ascii?Q?H9cMowPdtSiZoyXI3SivWMq1nB191FNl0GlUH94ZmP5Qfre7y8divFgmglED?=
 =?us-ascii?Q?IK0LGzYa6sdTTglInJ2W5EnlzaxypCOsu+UhS4pfc4YFrCAGIl74Gs+QvSiD?=
 =?us-ascii?Q?vsE95K/ExcqziqSj4kkWtIktit5eoJZxf63GGpQT41JYrKlKlaj7P5BTGTB8?=
 =?us-ascii?Q?QDpIf0dgaPBQjHhGMfQ7g5zY9yM2Dew3SxCXM759G+aQUmnUnJTV/pm91gae?=
 =?us-ascii?Q?buFy0ER0BOYEd6vlqd7ZLrFc9sJxbYOcpn3aPgphyEH0FhGsXShxy3R9DV3A?=
 =?us-ascii?Q?kb5extZ6IZwsGUFkeX5+AK6587BHJi9Al2ctweGrPwyIA++tTz6LiJeaxhMp?=
 =?us-ascii?Q?wwtrCL6q5Gv6OlMhBOaxLdDhXlhiw6ykUdSNNb8CDt9fGApOjnBDBEE/MnC+?=
 =?us-ascii?Q?eSnjiPACW9TErmv36GYvguzMor0yQtCbeadn6Ei1WEkX7MJYvuUYbwzphOIT?=
 =?us-ascii?Q?MO+d89JuSO/6wsE8Awez2YzU18suRA5u3Q2KRkl3wJKTHWKbHDeQxjyZs/E3?=
 =?us-ascii?Q?bUIzjwfHz3CohkHtjo07E+EVx8Szhhdj1Pg8ZFBbz4kUT3k9qCvB6zXzkudH?=
 =?us-ascii?Q?Diw91Mk4VrOPziO1UgEsgLxTgB11WBjOVOjQrC2JO+m4SvDwr+HfEYeGGewo?=
 =?us-ascii?Q?agl0ccvgvdFb0KKLzxpIjoc5EeRAt/vz2UHc1YVViS8y7AM0t0P7/O/9ZIiC?=
 =?us-ascii?Q?Zi1kjWKQYB/coUdd+KauoG6k3SzGkRs2UudyguVYEulb1l5MS8o3wUVoc8Tf?=
 =?us-ascii?Q?MdPoKFKfs1nj3EPxgGGjsc9Aatj39wkLDy1BGV7/niU7sPGBKeX8oAjD8/3T?=
 =?us-ascii?Q?o47ruxnTUKBxpMejz95clWE+e64pWwVA2VOT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:11:06.8089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdc1277-9c07-4fa5-10bc-08dd834a9eb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9125

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Look for a subnode of type `multiboot,ramdisk` within a domain node and
parse via the fdt_read_multiboot_module() helper. After a successful
helper call, the module index is returned and the module is guaranteed
to be in the module list.

Fix unused typo in adjacent comment.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * Propagate errors from fdt_read_multiboot_module()
---
 xen/arch/x86/setup.c            |  4 ++--
 xen/common/domain-builder/fdt.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 325ba8cc8a..661b80138a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2171,11 +2171,11 @@ void asmlinkage __init noreturn __start_xen(void)
      * At this point all capabilities that consume boot modules should have
      * claimed their boot modules. Find the first unclaimed boot module and
      * claim it as the initrd ramdisk. Do a second search to see if there are
-     * any remaining unclaimed boot modules, and report them as unusued initrd
+     * any remaining unclaimed boot modules, and report them as unused initrd
      * candidates.
      */
     initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
-    if ( initrdidx < MAX_NR_BOOTMODS )
+    if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
         bi->domains[0].module = &bi->mods[initrdidx];
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index fa92dc55b2..144fcc75b5 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -226,6 +226,30 @@ static int __init process_domain_node(
                 bd->kernel->fdt_cmdline = fdt_get_prop_offset(
                     fdt, node, "bootargs", &bd->kernel->cmdline_pa);
         }
+        else if ( !fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") )
+        {
+            int idx;
+
+            if ( bd->module )
+            {
+                printk(XENLOG_WARNING
+                       "Duplicate module for domain %s\n", name);
+                continue;
+            }
+
+            idx = fdt_read_multiboot_module(fdt, node, address_cells,
+                                            size_cells, bi);
+            if ( idx < 0 )
+            {
+                printk(XENLOG_ERR "  failed processing module for domain %s\n",
+                       name);
+                return idx;
+            }
+
+            printk(XENLOG_INFO "  module: multiboot-index=%d\n", idx);
+            bi->mods[idx].type = BOOTMOD_RAMDISK;
+            bd->module = &bi->mods[idx];
+        }
     }
 
     if ( !bd->kernel )
-- 
2.43.0


