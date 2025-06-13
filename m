Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC6AD90EF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014454.1392559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ691-0000nm-HC; Fri, 13 Jun 2025 15:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014454.1392559; Fri, 13 Jun 2025 15:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ691-0000mS-Do; Fri, 13 Jun 2025 15:16:39 +0000
Received: by outflank-mailman (input) for mailman id 1014454;
 Fri, 13 Jun 2025 15:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ68z-0000Kb-Sa
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2009::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6596cc6a-4869-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:16:37 +0200 (CEST)
Received: from DS7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::19) by
 LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 15:16:33 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com (2603:10b6:8:223::4)
 by DS7P220CA0027.outlook.office365.com (2603:10b6:8:223::19) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25
 via Frontend Transport; Fri, 13 Jun 2025 15:16:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:33 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:31 -0500
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
X-Inumbo-ID: 6596cc6a-4869-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PL0V2z8o5prrW1Cf1eeiZXc8sbVqT9pxgIm1pTQwxCYt05f5GZAhjOS4SJuuraIsvRTutWmOfMjO6FNC2bEBBBn4J0NWb7PILO4k2yOHN+18xzwUQlVirLgEMcfy5bNmXH82yrEI30eWT3eoR3qjaQh2MHD94ebRuku/S5EU6po3eIYjnCjihZCum+lMxFLGYSR0jC5bP0DxL3+0ZPjS3BN3ocv+woSaRj3lz8LOKemunmyayu9GyDqWVVrfj0Cz08G3xGWe0ZY3wMr3WOhbXedTvi/Mkj2xx7m4mNCEpb+pGqXDXj4QpIeppKFxbVtuxXTkvPzFrO/IGD0bKRcAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weLNhDghvy5grqCkI6xfefJ+ZcBJH01riMFjQPWY3SQ=;
 b=rg3iR9obO+3DfB2X3XjRuPnZEYzJI+k+ln3Vn5v7bvrbm6OHmov6PBG74zz2gURNbct94VhVTuKio9zv7UDD9PtA510RmoPj1Jc+aCij6hSw2P0qV3CCP+HjOIaTVQsM5oQ9+K70fSmW5DhpnodEpbdCxYCqqcx6E7Dh888M/+dxstRPcq5mooMcUFs93y/ZXWPAC+M8QDdDg6bPhl2U9gw6IVKGjacrJx70lLCSzjlSAQsNZDuJ0zzjriEK60Z1ErxMAcnbfyx2Pb8sRtrOeB7jdT6+GZ+XrIPjMUWs0w1+qKfj/LwkBe5jGIggy/GPhKcWovVgvorYZz/sUaIuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weLNhDghvy5grqCkI6xfefJ+ZcBJH01riMFjQPWY3SQ=;
 b=Ho5yUoYCeF618xshs+XqbtZcoV05lOxqS8w9jlDL8GzWBIK/Cw9Ax6dweWcKuh0E7PrwTmI+1gjWCvjCNenl6bz/G184c3fZ5wArD0TdiZk2X6S0bSXV6mEh9IdARiJIHRhWA0zF2bwVHxQu4nplwyG0zhjWhr7k2S6b9eTcqTg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v3 02/14] x86: Preinitialise all modules to be of kind BOOTMOD_UNKNOWN
Date: Fri, 13 Jun 2025 17:13:11 +0200
Message-ID: <20250613151612.754222-3-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|LV3PR12MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 8765acaf-6d40-4e83-d936-08ddaa8d484f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SYnjCFW3hzLciSSYT6u+o9ik1rUWS/0yiYogc9giHG5wPxKA7Rf/N41EzVzq?=
 =?us-ascii?Q?60HF5jmH7TptQHBLrpwoTXng/Fbx5lM4DFTgCXYjjdLgwMrO+z2PegkFJJUJ?=
 =?us-ascii?Q?lrpFocTNKIXZlQPQ7LgDnCU+FT/KntNS4pSSxDT73XrUnVbkTN+J9y6yuZHz?=
 =?us-ascii?Q?519pbcdNKIucZnVAjrG906RhhLLDR8BzMoqyO4x1SLu8dqVhCcQhQTroFSeq?=
 =?us-ascii?Q?SLO73nPoSqy/ChVqkQjHdd3+gdLij+zENJDcZxF6YSvsKPOQkBdiT9EPemsA?=
 =?us-ascii?Q?AEYY7m0qXgHNDEzQOc3RA5RNFjgv2aCf613cNSj+VGvKgIScr0ogQ5Rz/7CQ?=
 =?us-ascii?Q?nFQ8nsKjO8V3PBoyrAf92uTKfYJlMA3r55/u50GSJECJcpAyiNDFSrqkMX96?=
 =?us-ascii?Q?tDvFMY8auUk5K9Ya35tQGsJA88dGvloff395ghRIc+aCce/urQilQABD3+B0?=
 =?us-ascii?Q?sf5psqkXaHwpY3R4Yi5Yh/+AvW4eUYsoEb7V8nRCxayBYEZdEMe9th6GO5mJ?=
 =?us-ascii?Q?5cMMs53uQEca85OHCIrY33FgswyqP2AF+4HFlY/Xbe9eONWtBhJIVPS3+8Rx?=
 =?us-ascii?Q?agS9SEHBpa36lYbwF/4eKfwqXPj4I7p64wXJcDoOdYCskel9vifEI6sQITZw?=
 =?us-ascii?Q?Lawgvfrr8dQwte7LzOICiF1Klx6Uc/6BG1UaCcjS8JvY0OzrRzO3I34P4RdU?=
 =?us-ascii?Q?bpe9vFyD6iB+aMq7cT1JPRFa77SGdc4gRnoPrDbdXL760Cn07NJdRNpN25Ti?=
 =?us-ascii?Q?2Lt4iwdVA4EccvAgxTdxFPGcAtNXog5eQdOCj/ZV5TSV3WAgvL0a+uMuzJH/?=
 =?us-ascii?Q?a112Zq1PVqd7DEVEzHhGy8/I0Kw9MbeRJLPfav3daNcaNlJzcXPZJeGxxd/1?=
 =?us-ascii?Q?zVaxFQiqOSbFzFysaAPCFmCKq82qu+psRC4A5ZMUyWo9E6bGx/THazzDmzkH?=
 =?us-ascii?Q?7PCkJMDVlBvmIQBLkOUEBU143SLa2/CXuIRgEB+NlxNwWJ49pxuoppmLuKG1?=
 =?us-ascii?Q?5m0u95W4YiFipRP3oOwFC4ojpNeTjHjuXsSqScORcX37oOuAJ8Moc4QS8wjq?=
 =?us-ascii?Q?nYMtAadj34CtxP8g3cGtetQxlqYXLcg8iR4oloBXTMJTQjeBYfEACKXlO4bD?=
 =?us-ascii?Q?s9UGd1011IjgN5zVCcrydMUmHQTnpSi/DrLOPhS37P6aYe4x7GL6bn+9IuZO?=
 =?us-ascii?Q?rRCZfkMg8w6vJ2foIv9nWVUkl+MDwg6BasAal3XNQTAxOJ7QD/jf2CjHrKE7?=
 =?us-ascii?Q?1MJePGYUXbTX9VXH11rVrEOVWCoHHf16rYrX6REYhTUfcXvgaUiLCMCJH+kg?=
 =?us-ascii?Q?YUhfu0erWFtlq+H6ivXFeAWtt6vSEybhAHWFFMN/uFednvLGIDnB3V2lbdid?=
 =?us-ascii?Q?2cEINmIU7LDycj57P4ZGnznOLgTSPnUhhs49tMTnCu8Hb4tDkkrZvRsGA0gX?=
 =?us-ascii?Q?WE4PYFb8QRVwgZI2sohQgXcBxQ9EbzTSRTVuBqm1jRb4ULHqYcEVKvItetn/?=
 =?us-ascii?Q?VPfQ5sDg1QQLmZDTfVK6H8lD4JaZfwD6z6Qm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:33.5969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8765acaf-6d40-4e83-d936-08ddaa8d484f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9213

A later patch removes boot_module and replaces its uses with bootmodule.
The equivalent field for "type" doesn't have BOOTMOD_UNKNOWN as a zero
value, so it must be explicitly set in the static xen_boot_info.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0..7d3b30e1db 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -298,6 +298,12 @@ struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
     .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
+    /*
+     * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by one.
+     *
+     * The extra entry exists to be able to add the Xen image as a module.
+     */
+    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
 };
 
 static struct boot_info *__init multiboot_fill_boot_info(
-- 
2.43.0


