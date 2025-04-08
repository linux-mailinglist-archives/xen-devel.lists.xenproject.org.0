Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B40A8119F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942872.1341965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXe-0002OT-UX; Tue, 08 Apr 2025 16:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942872.1341965; Tue, 08 Apr 2025 16:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXe-0002LB-Qt; Tue, 08 Apr 2025 16:11:14 +0000
Received: by outflank-mailman (input) for mailman id 942872;
 Tue, 08 Apr 2025 16:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVc-0000a6-RN
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2412::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb9afe1-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:07 +0200 (CEST)
Received: from BN9PR03CA0526.namprd03.prod.outlook.com (2603:10b6:408:131::21)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 16:09:01 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::45) by BN9PR03CA0526.outlook.office365.com
 (2603:10b6:408:131::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 16:09:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:00 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:08:59 -0500
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
X-Inumbo-ID: cbb9afe1-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvA8xnCHX6oY1DnXtoLNZ2GSqM4yuSunyTC/d6mpn9FgCib5yAEhYl0AV8cxfvZHxrnkWEPu6KavvHe57Q4D77dMH7K9FmalIZ6gghWHxw2b/6zEdOcxq7uAvwXjTjuSxQFZ/0GTh35l5IOfNBHFYhRoESKQHhOlnswi7ZocEeG8Yhm93dxpqpKVUtNDpgpWsTLb5QBBxYNf9R3JlMad7VcQoBU4zLqPF2eu381kK2gwR7o+FCnf9PQ4HWzKJjRo8hyKGXw+NMq7uzOhlw6OjkfHg8WmbP+eBdPV/e6GFHmbJu35anxYRsk8MAs7d4UjCblAe6Oh1mvNAz1X4tGsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4NLg8ZGB5ywF9hUuTTn4esEKLdJ7mThXS52DT8LHzo=;
 b=WkzqqgHWk6YmuRxoOp0UxkmpDuRlt0Vap64OKyH3EIc4J2nAeJY4xTzNVBZGiDNX7nAYxLnWaBBOMUxM/97da/xi+Z+yWM4beNiGzyJRNxQJrjatZ43+CaPlmM+CNP4JfzFQz6hJab+QP0p5u8A3DjtJcDxT+lHYp3pQwufAJyu3pFy69N1R0w9ocHzbq2ESMg3MemguNNbbO38gd0urhCMtG2P0xabOWAyEiaitvrI0IIKFt1dtEq2zRYB1ORgDbsxUU+t4Teq57DIxGg/FfKFGEbrQFettdwlzXbC9aMWt49pasoZIytIxbEytIrI/7sx0B+khpPtlFpr+5PVJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4NLg8ZGB5ywF9hUuTTn4esEKLdJ7mThXS52DT8LHzo=;
 b=eD+Rn8EI6hfo6VaJwgIiXes92jo1SbP07RXGSEpUvBWxYWdJlUWDf0kzqAE/2ejpDUhl8Yk6qTNdmt8lF4L15ZjVo3QFSBd/zDbDLd8POLLNYIVcyvp7wGhepa+lT1xi2sq7U88giMdDrOES/ibHteBfWtoTcOpXn1RqmKXvpdc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Alejandro Vallejo" <agarciav@amd.com>
Subject: [PATCH v3 02/16] x86/boot: introduce domid field to struct boot_domain
Date: Tue, 8 Apr 2025 17:07:24 +0100
Message-ID: <20250408160802.49870-3-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 96384393-4263-4c29-aeea-08dd76b7acdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pab5bAnRK4kM2gptm1hiuNSEuHsWHTujALoHLnBWLH5OgU3NoH6K5l0a4zFx?=
 =?us-ascii?Q?JyAXhYLy+CUeVTlh6s+Takd7BMlty328WmcQ1F8DP2SGtdG+w9l12jY1Yto6?=
 =?us-ascii?Q?pWQbI/mSUbcM5okBrqqSCIBm+IlRAUiejxv8VDuExkzBDxv9d5QptTKRKZ8P?=
 =?us-ascii?Q?+hQvqb+S4QNRA4CvBiDFOaRFi7ujjwR/Zssx4E6wuHL+e5qd88WtULWGc2EM?=
 =?us-ascii?Q?yqFV7ychm0I6KGv4BYtNJdeLlw7WcpCRkz2PuOyEcesE3fJiMRHaFlgAgiSU?=
 =?us-ascii?Q?3FEzV+cb+dyX7AeeI6gizgE/QiC++zHHEiQcgF3TbTTvaWe/pNeH+tidUJWt?=
 =?us-ascii?Q?ttFsG1HPbzj7KsWIqWboZLqC/l4hWUVmvbZJlH1fgykHwr7wbzJH2/Hzmenh?=
 =?us-ascii?Q?YivpYsYZmP+wNmsydRZlKPBGHOashTCekXhMyD6mrqrrKnqx27x1hW1wbsuI?=
 =?us-ascii?Q?IzTRQN6rREgh99cpfPdptL3Y0OI8BS/GowR47GZczoOFV1d0TJo2R1Arb0ta?=
 =?us-ascii?Q?pjeIDdGITtvbKuf0mis2he8HIlM/+4uCKFbcQxPb2H5zbrmkDazUUzCEAsYg?=
 =?us-ascii?Q?dCOHKbaBzoJnr3tdSxM0coy27c7pwZda6Dk2wQ7RMjWN9pYYGYOmapbULZag?=
 =?us-ascii?Q?qkIzEo9PvulTOnWZT4E/OJrH3TQf9jmg22ZoyASpDo1/DW/KHGvuENIZMZin?=
 =?us-ascii?Q?ZUnGLkOywPBVSK4nalrxODNhzgCESXXxtYBTs37IMyTRJD1CAC9CB/e8vFsh?=
 =?us-ascii?Q?SNNDW+uJvvWW5HyqZSa6VtulC4X7QYScZsTH5RFVeK79pl0ouu7eKLm/B2RO?=
 =?us-ascii?Q?56teuURI9NbWSx8nYkqYZQaJec/oFwdT8wM+ET1tP9sZKst4plK5sMKbOXem?=
 =?us-ascii?Q?OufAoDHGgeOdXtV130kueEJvLTrH9yyofI8OKF61lozKBaQhEZ3LTj7Row5e?=
 =?us-ascii?Q?gpLghazbYE7BUSErfYGR2fJj23Egn5C7abi4ni45xGBCvbtCqltvoI5wCkdu?=
 =?us-ascii?Q?FjUZoN9w+omyNBYCHgugw8Kwf3QRgA5X2m5yx3j8WTTGrEWVSFePXCuCcDxi?=
 =?us-ascii?Q?L3FlENjL9UHKJB/j6Wa5fQaAixl0Hg+jAvvumL/R2d5it3CcDVYB/NQuScSo?=
 =?us-ascii?Q?VQXY2XrSC4aOBtl/lrK4+r8RiLuldZhbY2sbXykpnUgLavFECi6DrOWKn2PI?=
 =?us-ascii?Q?aPteYLMLAgQPBzOS4du102/WpZnq/LfeF1MfuHljr4KB6y4CYGn/tyBeh8ZS?=
 =?us-ascii?Q?wqe+WE0K0Uq4xNtzK94cdVQbZ2Y73r7G1YcAdcV4FUNy7ub58p/ZsNaohpoK?=
 =?us-ascii?Q?yZ5lolVGNZhKAwjaBtvgd/8ZR1zd/76LSVDtB28IpDg6/EjlT6OcHy3L0+MZ?=
 =?us-ascii?Q?Cg03AWlQW2V1No5zREc2WyoLcXswok4jSxmxiXeMpAkSxu5uFFrq2Otmc7xT?=
 =?us-ascii?Q?GLxhmLXlA1mo5kRlYw7SCrMXnDbxLhACyxXKoG5GHsTV6kCue/Wp+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:00.7442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96384393-4263-4c29-aeea-08dd76b7acdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

boot_domain stores the domid until it is used to create (and allocate)
struct domain. d->domain_id is not available early enough.

boot_domain domids are initialized to DOMID_INVALID. If not overridden
by device tree, domids of DOMID_INVALID are assigned a valid value. The
domid will be optionally parsed from the device tree configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v3:
  * Initialize all boot_info.domains domid fields
  * Re-write commit message to justify the new domid field.
  * Use "%pd vcpu 0" in error message
  * Move xen.h include (introduced in v1) inside ifdef guards
---
 xen/arch/x86/include/asm/boot-domain.h |  4 ++++
 xen/arch/x86/setup.c                   | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 5e1e1a0b61..fcbedda0f0 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -8,7 +8,11 @@
 #ifndef __XEN_X86_BOOTDOMAIN_H__
 #define __XEN_X86_BOOTDOMAIN_H__
 
+#include <public/xen.h>
+
 struct boot_domain {
+    domid_t domid;
+
     struct boot_module *kernel;
     struct boot_module *module;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ddb10ea03d..585316f1ca 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -295,6 +295,7 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
+    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
 };
 
 static struct boot_info *__init multiboot_fill_boot_info(
@@ -994,7 +995,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -1010,15 +1010,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    bd->domid = get_initial_domain_id();
+    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
     init_dom0_cpuid_policy(d);
 
     if ( alloc_dom0_vcpu0(d) == NULL )
-        panic("Error creating d%uv0\n", domid);
+        panic("Error creating %pd vcpu 0\n", d);
 
     /* Grab the DOM0 command line. */
     if ( bd->kernel->cmdline_pa || bi->kextra )
-- 
2.43.0


