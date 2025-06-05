Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446BACF84D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007452.1386730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGa8-0002uu-Sd; Thu, 05 Jun 2025 19:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007452.1386730; Thu, 05 Jun 2025 19:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGa8-0002tE-PP; Thu, 05 Jun 2025 19:48:56 +0000
Received: by outflank-mailman (input) for mailman id 1007452;
 Thu, 05 Jun 2025 19:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGa7-0002fZ-MU
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:48:55 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2009::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc05c60-4246-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 21:48:54 +0200 (CEST)
Received: from BN9P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::33)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 5 Jun
 2025 19:48:50 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::a4) by BN9P223CA0028.outlook.office365.com
 (2603:10b6:408:10b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 5 Jun 2025 19:48:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:50 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:46 -0500
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
X-Inumbo-ID: 1bc05c60-4246-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNVPyuWLYTQT7XtRq8yNETWeiaxysNWfyMttO3W9GP2w7QvLtOJX6UEy0W5pctNWxf2OE+Y8LRDT9JT1dsItcL7Vo0lDCJMjiQMTu8KvnHNejAlCBgZ8eLWyoNQo6ZceYVL3Aa1IlNV3bBCLJB2LA1t1jXLl/6ErY79zNF1qjKTxR0KflHroylqlOQqOCtZXH+6fDuHtqnLjIylAXHJdMEyH/lAJj+1cA8ZHL1IcZchxl3PDGcb3aHGY1Tts8/tbA51RU+uLzfgOIliklcMkO06IbGds9/67sCifyvOuX0fdkOCnbf75L8rYdB+l3bWZD08h3vfcvZaO3TxRmuzlbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdgGRU93owYApIHVcIm7iZ88U71h29ScJQ/Sz6iodgg=;
 b=rgZvr7REDjzjKpuGKPnVSD0WYZsGMPB43armjmgbzmG/aWJTlDe7gPr+e3hmsiqF7hJ5++K8afkTzhPVpnPKPjLnidFKOQkYMJlKk6nAIwqDi4tSY0uv/FtMQFilymMy+eKakLPgRIc2hcdd9FouFPxFQHYm4fa2wjkO54uIVjJI64irHTkaxlO63aGiuPAgipnuZBqNaJ2/BiG4ftQ/P70gta7XRFbABAznghEZwmiLq0VZBb9SSYgR3abgSN2YhKxwtGcSYmzNUgYq/jKembrj0FT1ViLjWTnx11vkpDy4+lIXLuuNR86cZ/0BHm7Ld49ILzL8Yf0M8fcLe6+dTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdgGRU93owYApIHVcIm7iZ88U71h29ScJQ/Sz6iodgg=;
 b=ZFb9GzLT6Bg6MO/vN8q3zZ6yL2tTJUzH85NXxk/lNq6DAUX8K15A5UNst4yK3PA0K5wSK/Lznf6a9bgb8JiA+O6D9gd9sgRABr5WcaFtvIi4VjyKkcUJbvvNJuMInFVy6vteRbmELah8B67tJH3EPMzpnG47wELnXp1TwUGI5RA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 03/15] xen/dt: Add BOOTMOD_MICROCODE
Date: Thu, 5 Jun 2025 21:47:55 +0200
Message-ID: <20250605194810.2782031-4-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 16efe8ab-8de1-4893-c800-08dda469fe88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9bzTa0F8shATQti5V+211cPeq8ykB+KppC3oqZPQTJfwBuixmixGuP7U8/Rh?=
 =?us-ascii?Q?uN1vErjkUHY1+fnZuaJgBgdFuNS6Lk+mqFkBSR+vWXpZBoNqDT9ZZeYiIEdn?=
 =?us-ascii?Q?bE4TCdEhJxDvZ7ZzAx961N0PTi0odwl8ZnFLc4Xkz8d9yqryIH4+e0LzhkWv?=
 =?us-ascii?Q?TgR/2D5OINH/LhstA58LSCEieeR8nJQbaUCJcdEBcGmBS/xUYOzXixGv0JFy?=
 =?us-ascii?Q?1Xa2BJgRIQSeSenGBIHEui9zv3+YR+Wb9AH3qZQTDbhnu5v7AjUkW/glXSeq?=
 =?us-ascii?Q?kohzn8Rjh91h4R9fZEVSS/8mWvGFNcje6AcLaY3bHNL/jcOJ+ZngRuimdqst?=
 =?us-ascii?Q?yIh8mtf8BTqhwCfCoWrHZej3ww0MyslJLE0tARIr5Pju3v+GBJy8SS7Fm68f?=
 =?us-ascii?Q?GbQeBNpikrGkSYq9m601JhI4BnOvsX+IudAMEc7fZogctpZjCmcM87x1PQLZ?=
 =?us-ascii?Q?Ihd0l85mAgI3wmhGVgv0Casl+65gx028C+C/3bDE5w19Sg8YVvy8w8YC3oXk?=
 =?us-ascii?Q?fiKa0GZYKnrXi1UaJkYAj9VmebS9KG9sMEPIo6/HJiTI6xdBTd42UiyzzahE?=
 =?us-ascii?Q?CdNekEPpdmLimzYCGza4kNcz7B12onAUjxveYVDp0MMPvaybV5l9D6UITt9o?=
 =?us-ascii?Q?qZ5L2FeVMmRsMJ5kD9IgKMXXHx01va8b3+wKoNRNtJbGT1AW3/mt9u/Z3SxF?=
 =?us-ascii?Q?5bs1Ux3I0/G4n8mH8m9ZOfRPa/JPdAQifB78qE6UmR0x6Olqq3iD/rI68lb7?=
 =?us-ascii?Q?fEmSZkrprHKMeX+TI4eTCAfA0y3ZLtL7HOlC0JA8S3VUbdA+VgkT2MAR4jtx?=
 =?us-ascii?Q?AQDnd/SxWkRQXN0pnv/NE1ebByurNFeCWGmehXHzCRt+kmhevgpIbYbsj3s+?=
 =?us-ascii?Q?taNu+Z6Q/iFFDOE8Ec1zGejgll5nuzCafO9qPIMxuIdDBFlEwuJeB+t1J0EA?=
 =?us-ascii?Q?PCFZGQfsUrJnlWHAxBW/TXyKwQZEP8EVhBBC/73YNzmIuiHIiNgooiuIy52l?=
 =?us-ascii?Q?s5E8Hh88IvWRRMLkiSkAQXi3XRkdVY3d5OC/wV9eOSUKqkpr2c0z7GWnILAN?=
 =?us-ascii?Q?UPKz0mPlZR6dei6sW0m5qiv4e03CdLIvIBmEI9xzumGEiM9spRLbfIUO/jzG?=
 =?us-ascii?Q?7K5MiZwPf95oXThq+Xxf5RTjzcQ1fz30BJAbdETiRoYZd2nDpE+za0H0bvBk?=
 =?us-ascii?Q?O8Ok2YdZSs09XE0QaI+P7FHRwAA3ME6GhyP9L9m4XskY+p5YVuqXV82qoCNT?=
 =?us-ascii?Q?Vkncux1ac/g1SXAjOXToE5KKWtz/25/fZzz8kVZ50RH2rO2fbB89lkhT8u8M?=
 =?us-ascii?Q?VjmOJ1k9tSrDw2bS9E20/UvMQqzaORT0pBkPv/xK+Pm0VX1J0+tM2rxPukAg?=
 =?us-ascii?Q?GvCNTo3ZwMBYwZtYbW9Irl2Z8jSVTrRJ2DW2DG4IvAc0dRrKws3FUj7hOhhS?=
 =?us-ascii?Q?lktOL4ijDVX8DcHLeSaDrrEeT0wfILDCIFALt4e/cX4yTMVZG+rvJ5T8NsTf?=
 =?us-ascii?Q?v1gw5yit2QHkxjQnDE7sf93ugbZ6vNYxjtWi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:50.4949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16efe8ab-8de1-4893-c800-08dda469fe88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462

In preparation for x86 to start using bootmodule instead of boot_module

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v2:
  * Added microcode detection in early probing
---
 xen/common/device-tree/bootfdt.c  | 2 ++
 xen/common/device-tree/bootinfo.c | 1 +
 xen/include/xen/bootfdt.h         | 1 +
 3 files changed, 4 insertions(+)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 9df80291b1..9daea06e57 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -351,6 +351,8 @@ static void __init process_multiboot_node(const void *fdt, int node,
         kind = BOOTMOD_XSM;
     else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
         kind = BOOTMOD_GUEST_DTB;
+    else if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
+        kind = BOOTMOD_MICROCODE;
     else
         kind = BOOTMOD_UNKNOWN;
 
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index 76d652c0de..717cfa0962 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -31,6 +31,7 @@ const char * __init boot_module_kind_as_string(bootmodule_kind kind)
     case BOOTMOD_RAMDISK: return "Ramdisk";
     case BOOTMOD_XSM:     return "XSM";
     case BOOTMOD_GUEST_DTB:     return "DTB";
+    case BOOTMOD_MICROCODE:     return "Microcode";
     case BOOTMOD_UNKNOWN: return "Unknown";
     default: BUG();
     }
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 64db48f4fe..ff40f3078e 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -21,6 +21,7 @@ typedef enum {
     BOOTMOD_RAMDISK,
     BOOTMOD_XSM,
     BOOTMOD_GUEST_DTB,
+    BOOTMOD_MICROCODE,
     BOOTMOD_UNKNOWN
 }  bootmodule_kind;
 
-- 
2.43.0


