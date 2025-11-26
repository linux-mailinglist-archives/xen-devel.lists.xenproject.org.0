Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395AAC8B079
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173114.1498264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIe0-0001eW-4o; Wed, 26 Nov 2025 16:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173114.1498264; Wed, 26 Nov 2025 16:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIe0-0001bj-0f; Wed, 26 Nov 2025 16:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1173114;
 Wed, 26 Nov 2025 16:45:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIdx-0008EF-Rg
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:25 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db579a4-cae7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:45:24 +0100 (CET)
Received: from PH7PR17CA0057.namprd17.prod.outlook.com (2603:10b6:510:325::6)
 by IA1PR12MB6043.namprd12.prod.outlook.com (2603:10b6:208:3d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 16:45:17 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:325:cafe::5d) by PH7PR17CA0057.outlook.office365.com
 (2603:10b6:510:325::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Wed, 26 Nov 2025 16:45:15 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:12 -0600
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
X-Inumbo-ID: 4db579a4-cae7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haZuDJJUQR954/QVXW2q4DpgQLxlnqJ4IUMVqTpP+H/3aQP++S5C4IKnQA0CJVoZaBoYOXKLMe3/UrDYrbEngDv9IovGYX/q3kIsuGg2ascxydLsr/q8VmmtdrgpCQy9D6DgvnPoGV/TIErp+1Y95MNIjAof0A/MqInsRmDGDRsTzMzoNK8p8GX8kkk+la8J2FN7urZ/+WI4zjIHuvzgtRbJI1AVAsI2Gms7eS68z0sanM/IRYdU8MigBG+kka6kbU+xir8kRxxxiAudZGnIahUjzxuioBq0YcH2p6vD8EwfIe170rCzYgJ0E9ZPYcxhHuBfduX8RDkbrtKh+Ur4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezvPIICh4zSuhQ9u1lde9uJGYUuIAHWu9bk/o4mRgZA=;
 b=G7D1ZoInxL/0gleguyBxiEKgI0wZC95RTDUJtTjwMcYwcYjG5l9d2ZA3GxsNjl2O0XG6t7dq4+Ai8CsWcOs6GO2b2l98fO1cLUSdpdI9P0fF3v27K7RBXSjrDdcNo/hEVpFlsNsqb/6TT+wQtLcBqgKHa1LWIwYhaqpfYbkkt0js6PXNxYeYz+UQMX3fVPPMazkz3iljOVJvfAa7I0nlmE2RDTcluo7Pj0gafn5e7EAFh/lWm/G2tAK33d56lxDrIMh7sZx5vyN1mTIuPwp00zZXwQgigZzBnJEyYMvMbxfzgZNq2b9AhY3T2K8VBSqUwlC/Pj8hq8RucbluRfxC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezvPIICh4zSuhQ9u1lde9uJGYUuIAHWu9bk/o4mRgZA=;
 b=TRiFo+tqVgYUiOi76yLB/Ua6W+2Hkg0vjwK8l7ORsz9hPbfEr0bd3inzI+ThHyO6EuEfMtoznIqoypiPuGvIN1zj53cHjEKgkAR/Fdk6ewoToc7w1X9VeeMhpkKxUtdRpD/Wm0PrviGjhcbtZsIdWSt60WkhVI0ZngfVpSWH5cc=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH 07/11] x86: Migrate MSR handler vendor checks to x86_vendor_is()
Date: Wed, 26 Nov 2025 17:44:09 +0100
Message-ID: <20251126164419.174487-8-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|IA1PR12MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0509cb-9f4f-41bb-f479-08de2d0b2d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?swdMEF6RWcLm373DrgzjI2YlkUysWKa+9FdEop3NfbL7o3w0bzd9jxzl4IT8?=
 =?us-ascii?Q?DW3zg6C50xltHvNoB+i6AcOnXQxCfWNRt5QYgjpwKq0JIsYlRsldIRviQKMM?=
 =?us-ascii?Q?FEFkpHSb9q1EuiGtNy+Betl3SY84ebzM92Shf1xs7YeZcXJCqov5t8bvEckH?=
 =?us-ascii?Q?0KI1cK16HmwsH+R61pUJQteQrv06KY/UbfeaNhnIucNlE61wYlXiivLirSjs?=
 =?us-ascii?Q?jGEVlchBc50m/pUBSPr8464PEH/Iqme2lSmGDZiGJiNOiC7LEXx5pPP6vqe5?=
 =?us-ascii?Q?2lTobCn6IUPsHORuTjlxF2IpFpoth+iOTDk2/7G0egQ+2DUqHTguG7Kla5A0?=
 =?us-ascii?Q?/IwY+pgs+xmIwjfPta3wM6gz1xyE8klwZb0vGrtaw4LsnTiZHm/1Tps+ZiM5?=
 =?us-ascii?Q?yPc2H5nMrRPSPbNsitFG17Ar39Ztl3p/JO8OPC0RBddn93tvu1u51370zmgw?=
 =?us-ascii?Q?PA1eBmQo06bwU4+r2x6YCLyh7NyFuzFto+exApVAcDlZnG7h895BYNcmirVW?=
 =?us-ascii?Q?3EVigubb/nbLdgWm/GMBIh5CadNYm+0HFxJReb/pPf/EygxTAw8bLU1Hjvcl?=
 =?us-ascii?Q?dkp/zRXHTZtZ5dzwzfn551XZqZs3TxVCO3gnuRNK/SyoUASLq+297Gu2BU9s?=
 =?us-ascii?Q?M4tYFLEIaHPYriidC73ZxgXFCcx9OVN5w1mtX+OL3h84rWqR/lUeDz2oPbjt?=
 =?us-ascii?Q?lSRLVoqDnPXslDLKPut+pCDiYi4iUNA3hm//j0GawkJrMOgqdNoByS6BkXDU?=
 =?us-ascii?Q?ZBcAOEMgjZIGAeqA1/lckmDMJR0FUR9p/KarjGUfQDgrii5ZO8VQBKfNi11f?=
 =?us-ascii?Q?yts/cjOA6dmK8X0/G4ITgotafJO+vu6WT5KK96pHA340Xl1TC4vX7l01Z+uj?=
 =?us-ascii?Q?CpHh7iB5mzGlY6oeWTSy/trQTGo6/iygsuMtNf7ImhV7+PR9a2FNR6FtrMS5?=
 =?us-ascii?Q?SUOfZIWfq0U9+XlZQh0pp449eZv9C9/JrFSy3rvSF85LTQJfIMmX9+vfKUlt?=
 =?us-ascii?Q?m9SszX9fO7NxE2/ORftGO9xHwl5YoxPhE6BgvGcS3ofCDfiKHD41hEiNkISN?=
 =?us-ascii?Q?3nq6Je2qkXWKoVkb82O1XCkQTUb9caShSWGiHOD6lDDPKbeieyrKmXZcEqMZ?=
 =?us-ascii?Q?NSiDUBf/4o0YTTAn6CQVMgbPRezdJCA1ZCqxX7UtAVmBozXywY7np3s4XNPj?=
 =?us-ascii?Q?VCeQpLo/6isAvz6N3/DGk9CIpYCy06NHkX7yrZ3mM8/WH8vr1rvA/VjT7ZRo?=
 =?us-ascii?Q?9VTgReUKm3xtGYrV9KU2O0NLTsahG+SOVlksFMcQd2SqY/2Mypv6ll/5WIPf?=
 =?us-ascii?Q?8G7b9IWqt6xzj2wWDO4cOYbyHQ39XFLu+J6PJ6HOcLPFqQLuyW3yXVaVFlwC?=
 =?us-ascii?Q?rWZE1kPwBeG7yOc+4+ux6TsUdJERW74vbhSHEPjUtO21m8zy9d9/cQP3eZl5?=
 =?us-ascii?Q?fdjO+SWrG7uyfbNb/bhtIctw5VMhnjpUHncBiTA4An/u1kiYH7MWJbGVcnZW?=
 =?us-ascii?Q?UEbROt2PLzdUMDzkdMzwHSjNFXiCbdhboAp/8fCLh33IYj2sGJ2ZZzJuXUcf?=
 =?us-ascii?Q?l8WlDVy2p4WFMSmJuLg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:15.6824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0509cb-9f4f-41bb-f479-08de2d0b2d1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6043

Many handlers are vendor-specific and are currently gated on runtime
checks. If we migrate those to x86_vendor_is() they will effectively
cause the ellision of handling code for CPU vendors not compiled in.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/msr.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ad75a2e108..f022332971 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -157,8 +157,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * The MSR has existed on all Intel parts since before the 64bit days,
          * and is implemented by other vendors.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR |
-                                 X86_VENDOR_SHANGHAI)) )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_INTEL   |
+                                            X86_VENDOR_CENTAUR |
+                                            X86_VENDOR_SHANGHAI) )
             goto gp_fault;
 
         *val = IA32_FEATURE_CONTROL_LOCK;
@@ -169,8 +170,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_IA32_PLATFORM_ID:
-        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_INTEL) ||
+             !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
             goto gp_fault;
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
@@ -189,9 +190,10 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * from Xen's last microcode load, which can be forwarded straight to
          * the guest.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.x86_vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
+        if ( !x86_vendor_is(cp->x86_vendor,
+                            X86_VENDOR_INTEL | X86_VENDOR_AMD) ||
+             !x86_vendor_is(boot_cpu_data.x86_vendor,
+                            X86_VENDOR_INTEL | X86_VENDOR_AMD) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
         break;
@@ -236,7 +238,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          */
     case MSR_IA32_PERF_STATUS:
     case MSR_IA32_PERF_CTL:
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+        if ( !x86_vendor_is(cp->x86_vendor,
+                            X86_VENDOR_INTEL | X86_VENDOR_CENTAUR) )
             goto gp_fault;
 
         *val = 0;
@@ -245,7 +248,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         goto gp_fault;
 
     case MSR_IA32_THERM_STATUS:
-        if ( cp->x86_vendor != X86_VENDOR_INTEL )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_INTEL) )
             goto gp_fault;
         *val = 0;
         break;
@@ -302,7 +305,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_K8_IORR_MASK1:
     case MSR_K8_TSEG_BASE:
     case MSR_K8_TSEG_MASK:
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
             goto gp_fault;
         if ( !is_hardware_domain(d) )
             return X86EMUL_UNHANDLEABLE;
@@ -314,14 +317,15 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_K8_HWCR:
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
             goto gp_fault;
         *val = 0;
         break;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
         if ( !is_hardware_domain(d) ||
-             !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+             !x86_vendor_is(cp->x86_vendor,
+                            X86_VENDOR_AMD | X86_VENDOR_HYGON) ||
              rdmsr_safe(msr, val) )
             goto gp_fault;
 
@@ -338,7 +342,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_AMD64_DE_CFG:
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
             goto gp_fault;
         *val = AMD64_DE_CFG_LFENCE_SERIALISE;
         break;
@@ -461,7 +465,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * for backwards compatiblity, the OS should write 0 to it before
          * trying to access the current microcode version.
          */
-        if ( cp->x86_vendor != X86_VENDOR_INTEL || val != 0 )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_INTEL) || val != 0 )
             goto gp_fault;
         break;
 
@@ -471,7 +475,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * to AMD CPUs as well (at least the architectural/CPUID part does).
          */
         if ( is_pv_domain(d) ||
-             cp->x86_vendor != X86_VENDOR_AMD )
+             !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD) )
             goto gp_fault;
         break;
 
@@ -483,7 +487,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * by any CPUID bit.
          */
         if ( is_pv_domain(d) ||
-             cp->x86_vendor != X86_VENDOR_INTEL )
+             !x86_vendor_is(cp->x86_vendor, X86_VENDOR_INTEL) )
             goto gp_fault;
         break;
 
@@ -553,7 +557,8 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * a cpufreq controller dom0 which has full access.
          */
     case MSR_IA32_PERF_CTL:
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+        if ( !x86_vendor_is(cp->x86_vendor,
+                            X86_VENDOR_INTEL | X86_VENDOR_CENTAUR) )
             goto gp_fault;
 
         if ( likely(!is_cpufreq_controller(d)) || wrmsr_safe(msr, val) == 0 )
@@ -663,7 +668,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
          * https://www.illumos.org/issues/12998 - drop writes.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON) )
             goto gp_fault;
         break;
 
-- 
2.43.0


