Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D628FB0D8BD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052391.1421088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfd-0004rc-To; Tue, 22 Jul 2025 12:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052391.1421088; Tue, 22 Jul 2025 12:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfd-0004mH-L0; Tue, 22 Jul 2025 12:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1052391;
 Tue, 22 Jul 2025 12:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfc-0003QN-BC
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2009::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77122c4f-66f3-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:00:31 +0200 (CEST)
Received: from SJ0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:a03:33a::22)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:00:28 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2f) by SJ0PR03CA0017.outlook.office365.com
 (2603:10b6:a03:33a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:00:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:26 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:23 -0500
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
X-Inumbo-ID: 77122c4f-66f3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyBHcY3n8N6EikuBhO0Xmb8cvKGCVBRyNYPpo6hF0Yik2gM627J2qgNuF8zMEHZj+gZJqhBdlVAuSygxZe4xpJOxYmacS7uq37Or9q4eCLoCbGEUIOH6Cjlys/WvnXYR/l72nrzG3RWVuR0XYa7vaK/3NWKnVe23+mLefRIxea2WhqfmmT+1FdCCSX5MbJdaZjpDFaMWGFX0irccG0QaEqcqRKeSOrbrm38Qtk6nE2N3Omq5ByRGMZ8cry/7gcuhBq311D2fRSlvjz57OnHCOl3TczbOyPxpsryfnAE40S4UViLKjmvDihM9fEYk/DfXiPi924F10rghA78fN3eQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFOSoi/32WLDNN9/GzpR2R3rnsXpnxjRZeNX0xaEwv0=;
 b=i1LyWo3Sh0/o2dtYIVznaoW3BsG/E0laYWXshpygznO3URVr/MwUlNYW0x1c2TDy4xO6sdK6Ee1bm6b2HtmE/oxJEWx1SJiWpXqQXxE4bm0sgk9DJ1jek2gmPfwis1m3ISD1mszSuj2/X3haresiD/Lkw48yjz2bFMUovXHf6yCVeNB03HfVT0D6XDnPv695MDXpIVESd1u42s5Indgx/49LZASD3mSam9OqTUGKHyYNuHyOlm6h+oLYmy5xSyVFsPOK1qhjOrLko/tViLCZXKZGblVFVINFcWXeEY0Ah98FKlLMLUyAIc2bRgXM9GC9XHDjx1g6LUbwZW3xC6On1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFOSoi/32WLDNN9/GzpR2R3rnsXpnxjRZeNX0xaEwv0=;
 b=K+pHzYDVTkbKJvHBo89Rf0mQ43kdEonytRrISSpH1lxuJ6ko8PY4thrXrVqWDEyuUOf9DA2du212GdUxui5gpyx6pZrQOkZs6SmKdrhCg6yBnmedcsYqUL9Y3OE6Jf3Q2Ull+3FM6+mcvXjBSX5dbP3OpRhA2RUCbYeF+q1AzYA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/10] dom0less: Allow arch_parse_dom0less_node() to be fallible
Date: Tue, 22 Jul 2025 13:59:48 +0200
Message-ID: <20250722115955.57167-9-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: eea9fe6f-43a4-482e-4ea5-08ddc91758d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IYi7ODVGXbECVEU8uYKs3FAztFEk53EEs5ZpQxGEhH2/NyJTvAZdFehY0kBd?=
 =?us-ascii?Q?Fzh8b+JJySStkFB9Ya65IiEHP3vmzl5oKoyBHUynqPEWtWlnI88HpuutifpP?=
 =?us-ascii?Q?Q/FM+OTPwRhdHl6gW2G4jAYa/JIurtdvoNq1BxMQ5nxerRWIS+V2WcpiqfSv?=
 =?us-ascii?Q?Z/tHLvxfIQ+6OLrhO3LZK2lEhHvjIAvH52FCGskWZFKUozOdQgA4DuhSmUAE?=
 =?us-ascii?Q?2GnN0tYz/DWTTCkZk8psuBvrMsjpdBikcleH5znn6mIteErwQFYuKifw3QUo?=
 =?us-ascii?Q?Ks6QB9cL3mKzBVhJLLI8NQ27Abi8+2/0UF8RPjjeP9ZZZxm8Q4ZdkN6mZA6K?=
 =?us-ascii?Q?4LG9Kkqh5hfuh4u1U+tgOds7jtDFYk1blfM7KWRvvanjPQm88B9vMUV27rql?=
 =?us-ascii?Q?KqOKe8mcSpm2Kh6QnvxZlQ7Q2tofI23muRFzXA5xegSakxUgDrK6EBkj3dNL?=
 =?us-ascii?Q?u6GKjspVmFvR6uO2ld477ZF2yrR3mv14989KNAT351aI9Z4ZgunMeh12IL7I?=
 =?us-ascii?Q?qNcFVGOBfmZjDDOnbBq/3VTZh64XhJgkeQN2ZwSWuX/46w+yvgwN7E2jw2Zu?=
 =?us-ascii?Q?6n6t9j6KQabLLLZ0B0H5VULSEBzwyC9n+yzwE9LzzWeDgwCEAYjPRWc77YMX?=
 =?us-ascii?Q?Pqapsv+xrJqGAWrDSUfGaY44LFuwMG9noxXrPtjiBZMANvFXcymuTg6LiCWD?=
 =?us-ascii?Q?+DC330lDT1KaoNyDivLhg754jvh4ar5WUK/R626U484JogFsCEwHjp7nOQSj?=
 =?us-ascii?Q?WKDTR9qRflohPpgLQkpW6kviAcvYVBneqK3xx1sHMLttmgyVpjnB0VOLjZsj?=
 =?us-ascii?Q?Nx3uZvuVTLRpbZ07Gvl7GXo5jWKAtY3VVCVWqOp8hDVHhW1Brxo+ytMgZWak?=
 =?us-ascii?Q?5wKlKrhXwQga6UncHX84SbiuWiPKsUfebnVaI7piivsObgE1d3Vawqt31kPm?=
 =?us-ascii?Q?4yV76oFelqqeWh+HI/WjJER/PoZiRIzGJBdfDa8IuZaRYOiqKQxjcnqLgaC+?=
 =?us-ascii?Q?JTd+Uj+lUxJVHwtPa7k0IrcGwzvrLYeAAFUriPYU2T0ZihOi3uNVEoPUCv0p?=
 =?us-ascii?Q?uvdUhsJpHNYZIguTtI2AUjX7ntc4RYjxdQvpDJiU3PCDqm/P/dPCcJurSkM6?=
 =?us-ascii?Q?fzQXSkuVPx+bEwO9yDxZKJNvw60FTh3HtuBLlf/ojy2syBeS08t62UFyjwpU?=
 =?us-ascii?Q?Iy1rv7+QtoKlDx6XlnqWsJHE06LKNK8kWoVds5N5J0nzEQQ0rUVckoG3uiJl?=
 =?us-ascii?Q?zonG+9kUdHWEjvDqIvl/4NHhCJqhJJ/2GNtYJS9Vugheii7XH5R5mMhSv3/A?=
 =?us-ascii?Q?ME0fyZrU3tPwR8yWG/c7jLsB1fGgv62smNMFGsGBR2+tIzZRFUG7XUHmIQzR?=
 =?us-ascii?Q?EJh6RUATwzPGRw+RdceeueI0GPvcKf8a5lZ5OfHWJiGNXSpd/y7bXrz2qBUO?=
 =?us-ascii?Q?losL65B3s10gaASM+IwO0ebOtkPU8c6AmgSHWF8cwvYre9u6D8GEOibhRL1t?=
 =?us-ascii?Q?JN9XXTyHEhBSd3lR3Y1apbGNLN9Keu9fdTyD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:26.6879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea9fe6f-43a4-482e-4ea5-08ddc91758d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809

Let the function return an errno, so fallible bindings are not precluded.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/arm/dom0less-build.c           | 6 ++++--
 xen/common/device-tree/dom0less-build.c | 3 ++-
 xen/include/xen/dom0less-build.h        | 6 +++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 3dea56dc76..c8d07213e2 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -272,8 +272,8 @@ int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
     return rc;
 }
 
-void __init arch_parse_dom0less_node(struct dt_device_node *node,
-                                     struct boot_domain *bd)
+int __init arch_parse_dom0less_node(struct dt_device_node *node,
+                                    struct boot_domain *bd)
 {
     struct xen_domctl_createdomain *d_cfg = &bd->create_cfg;
     unsigned int flags = bd->create_flags;
@@ -354,6 +354,8 @@ void __init arch_parse_dom0less_node(struct dt_device_node *node,
         if ( !val )
             d_cfg->flags &= ~XEN_DOMCTL_CDF_trap_unmapped_accesses;
     }
+
+    return 0;
 }
 
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 8caceb9f6b..ef4b095d97 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -960,7 +960,8 @@ void __init create_domUs(void)
             panic("'llc-colors' found, but LLC coloring is disabled\n");
 #endif
 
-        arch_parse_dom0less_node(node, &ki.bd);
+        if ( (rc = arch_parse_dom0less_node(node, &ki.bd)) )
+            panic("error parsing arch-specific dom0less props (rc=%d)", rc);
 
         /*
          * The variable max_init_domid is initialized with zero, so here it's
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
index 8f3f90ae2a..72ca8f5e6d 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -9,7 +9,7 @@ struct domain;
 
 #ifdef CONFIG_DOM0LESS_BOOT
 
-struct xen_domctl_createdomain;
+struct boot_domain;
 struct dt_device_node;
 struct kernel_info;
 
@@ -45,8 +45,8 @@ void create_domUs(void);
 bool is_dom0less_mode(void);
 void set_xs_domain(struct domain *d);
 
-void arch_parse_dom0less_node(struct dt_device_node *node,
-                              struct boot_domain *bd);
+int arch_parse_dom0less_node(struct dt_device_node *node,
+                             struct boot_domain *bd);
 
 int init_vuart(struct domain *d, struct kernel_info *kinfo,
                const struct dt_device_node *node);
-- 
2.43.0


