Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF58D18AE1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201588.1517187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP3-0004rB-3r; Tue, 13 Jan 2026 12:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201588.1517187; Tue, 13 Jan 2026 12:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP3-0004pL-0R; Tue, 13 Jan 2026 12:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1201588;
 Tue, 13 Jan 2026 12:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfdP2-0004bu-Cb
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:21:40 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68bf6443-f07a-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 13:21:39 +0100 (CET)
Received: from MN2PR16CA0054.namprd16.prod.outlook.com (2603:10b6:208:234::23)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:21:34 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::66) by MN2PR16CA0054.outlook.office365.com
 (2603:10b6:208:234::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 12:21:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 12:21:33 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 06:21:31 -0600
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
X-Inumbo-ID: 68bf6443-f07a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOE3n/ylmwFo8M3Ifm/7N8YuOhlkaZULvGMtnIAuEF8b2nxzsENWMBIlf4cfcOzhS1DrdzI/cc0d16y3fnDEwOcKibqfiMcVMT6o/ju/PRYc61y1RJe/vLED/jCa10w+95f5OVCakGHzTej5FDHceAJK8rWyY+dR3bqcTxlrGRbR2lwDD1tMmJyAENVXmxkdaVzg62vRps03JK3ankVkfhNbz/11zkdkG7aCEs/1fphSr2JYcnegbM+9WDqXx+2BwPUlj+Vu4TACpTa+fpirUVNR/R519Fy62gFrgn8x3getEjHscq0AKR5r8V7Mp2Bnm9lfIfBeJ9WtrJwJV6/VpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd63tS65+pkJnhvg7m7v40+QJW9Mib6yuJizuBKbNkQ=;
 b=ijx2UEsvn33k4IPrEd/jUoNVzSMZLjhK8U9kRhLmKTPcWF0j+gONgfNKGxfygp1P13ojOiikHFNBeJ/+giKPnZAqoAvIg1j13o8MdFSfu9JKcK6vzbuCa+I6ckpeFqG/OSzV0yA5sUEJhAjgpncASF82gChVzvOw5HcJnxikXhBM/P7zDTQaCf2ZaiNhfCwfv1W9dnfeCKu3nkoG+mdmlQSpUDXY1sb6KcdGQPz6csWbuaY6IVXm4SxQSrFPM7okNG9HfNOvdEXAF/rHqzRDckS2eJwhS/6Yo2+bTkUs5yM3lYgaB18X+n0h3U59jRIAsR701FVBkX1ajI5Q6dYtqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hd63tS65+pkJnhvg7m7v40+QJW9Mib6yuJizuBKbNkQ=;
 b=OI5L4QVjCi13eqvStaGifek5WQ8sJjD6d59dhCm6HASs7sUN/XcvNmUxD57GBm5XGX6a6LuPhWwhq5jOrAScr3wKaFgvfjavQFZhluqlNcpvbkntzTrYBl6ivbxCn6WKeraBRZLJk90z/mxHecU8xmhwlXTXMblI2gKqgMz1NlA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/4] x86/ucode: Fix typo s/mitigiated/mitigated/
Date: Tue, 13 Jan 2026 13:21:01 +0100
Message-ID: <20260113122109.62399-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|BY5PR12MB4308:EE_
X-MS-Office365-Filtering-Correlation-Id: 45976c8d-4da6-417a-120b-08de529e4a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tg1GfHx9uB9ef6jLwB7zQUV3q0AB7tdwL+vMt1ypWdn7do+rJJ7FlkTzU/Qv?=
 =?us-ascii?Q?RT4CoL2VXSxGBR5ekPSdAN3FInxjbtrGNWtb0KLZTCcC3RgEl9dXn89LnXkF?=
 =?us-ascii?Q?9aS1SPHMA42cVkCRj7V+mGXI+rRiCWdFCYdd1FpMYLmR5/sdAV4dIDFdONBY?=
 =?us-ascii?Q?8VJ+zXUryniIGS7HxZtDlmPorJD2tbDTZHwS2G/WU5BgmJeSFvnib6bhH3M3?=
 =?us-ascii?Q?lHJRwFwOax+B7NDa61mDPvLr56MbH1X2+SMYlbE4dTXi8O9SP7kqgN06P0Jd?=
 =?us-ascii?Q?pZjH9MNtfT0dXC3JHhcVjmmVh9ayPfgDdFRykPhF3P8DviPakQRfI+91wlQf?=
 =?us-ascii?Q?Dam3OUb/BgGxRPURlKW/9eo3sGVGTt9GIWKali6KQgBQhStmPY09Z7h3lhAK?=
 =?us-ascii?Q?i8vZS+heifbuAai21tolG80FffzxxWOVEiQT+hzEwhmk/P8JxrhEQ6X6Nrgh?=
 =?us-ascii?Q?xRGK5KBORA6RmzmxP8Cw8+9RSX98VTL7m3s0S0cVw1YQXLN1ZirACAMmww+O?=
 =?us-ascii?Q?MNYpvVXwy+yOuwhlsaYjOViMWdZomgdNYSOcIAhQ+ZAvhH4qf2jCYquxdZcZ?=
 =?us-ascii?Q?TIfWhc363pCvtZ13qD+3D4R0JTW/274ui2TsmBY9lJMRAR2QbTeTyArz+22q?=
 =?us-ascii?Q?/2k8K3uvg2oOUfHt157cHsqd0FVjzdTrLh7n06FhfpwuA8LOfzoEKKVhQJjB?=
 =?us-ascii?Q?u7IEPrwoixb+GUmV+EM0fxVQYv73hSKbhUhwRsuFP8JDM3aORl7f1fHxWUyL?=
 =?us-ascii?Q?i3MbqKZLjCd8+dg/iaIRqDN9CkAaGcYBLA5ymP6RuZTkUhCQ4Vih+expqA3E?=
 =?us-ascii?Q?+Kbr0qSXyKaUyLrxaaPqjOTogn3JMxsHif7DVuEoXhyDEZ8QjrHuGSXsd2mC?=
 =?us-ascii?Q?BZhRqa6zzYNFqDpM/GjLGZSF1tUoGfa1QnKJMN/gQ94Krrd86gQuWLE4Xnvr?=
 =?us-ascii?Q?22h11E+eM+23HR4DYyC1nPmgjDfiABGyZRazRa/d4FYVKrLKAf8ZdBm+RCJk?=
 =?us-ascii?Q?DfjquSP3hddrhwaNUdlgVEr7Mu2tCyOPrWMlX9iaiXN1J9qZO05+fsQkQ/bJ?=
 =?us-ascii?Q?2ljo0+Y5qA0z6oGn89WL7t0YWgqeWRfgLMH5hibllyD1sQFxYcXHpWaaWyig?=
 =?us-ascii?Q?bnX04vFXSxYpgdJyZu1W4dxbCdhRHszB7HqNog1okkYHeh2FXh+MtClZNbnr?=
 =?us-ascii?Q?E3A/ydMoBvl4gXqpc+1hD+oxpkUBM3eshSRPImyOD85i8MpNmMVIl9HK7LhG?=
 =?us-ascii?Q?z9JEOEvhZNmmQg9OMBrSwuoihm5nVw2X+qdK2JkwWYpIA2CGFBiQo2DlMaDc?=
 =?us-ascii?Q?w71sAQX6gmqCyl097W7t1S3Q+1Ye3Ts/5ZKHhjC8b+qmFPPFnGPfvl5oLwBA?=
 =?us-ascii?Q?8IOJDOlxf/M+2FhOImdzwOfag4H00K1/5iS9c23tGEw+DkY7WdeX1Vjttn08?=
 =?us-ascii?Q?4FDDnbb84WkUiVgYGS/E/UHwlEcrey4IAntEFMtLAtY9PjkqCPvgUmB3zg26?=
 =?us-ascii?Q?FYs7qj4uctozXG0bHzLSps/wVPY8l+EMYB2tkjEI8gEGQORAYsnXJ/OqbHS7?=
 =?us-ascii?Q?ux5WXe6zLPN7DLNSbk8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:21:33.4664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45976c8d-4da6-417a-120b-08de529e4a20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3:
  * No changes
---
 xen/arch/x86/cpu/microcode/amd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 2760ace921..71b041c84b 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -101,7 +101,7 @@ static const struct patch_digest {
 } patch_digests[] = {
 #include "amd-patch-digests.c"
 };
-static bool __ro_after_init entrysign_mitigiated_in_firmware;
+static bool __ro_after_init entrysign_mitigated_in_firmware;
 
 static int cf_check cmp_patch_id(const void *key, const void *elem)
 {
@@ -127,7 +127,7 @@ static bool check_digest(const struct container_microcode *mc)
      * the digest of the patch against a list of known provenance.
      */
     if ( boot_cpu_data.family < 0x17 || boot_cpu_data.family > 0x1a ||
-         entrysign_mitigiated_in_firmware || !opt_digest_check )
+         entrysign_mitigated_in_firmware || !opt_digest_check )
         return true;
 
     pd = bsearch(&patch->patch_id, patch_digests, ARRAY_SIZE(patch_digests),
@@ -676,7 +676,7 @@ void __init amd_check_entrysign(void)
      */
     if ( (uint8_t)curr_rev >= fixed_rev )
     {
-        entrysign_mitigiated_in_firmware = true;
+        entrysign_mitigated_in_firmware = true;
         return;
     }
 
-- 
2.43.0


