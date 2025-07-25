Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7414B1186C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057225.1425174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnb-0005yx-CK; Fri, 25 Jul 2025 06:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057225.1425174; Fri, 25 Jul 2025 06:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnb-0005vE-7S; Fri, 25 Jul 2025 06:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1057225;
 Fri, 25 Jul 2025 06:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBj8-0007jJ-Un
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:18 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:200a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfbbca57-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:17 +0200 (CEST)
Received: from SJ0PR13CA0104.namprd13.prod.outlook.com (2603:10b6:a03:2c5::19)
 by CY8PR12MB8244.namprd12.prod.outlook.com (2603:10b6:930:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:16:12 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::c) by SJ0PR13CA0104.outlook.office365.com
 (2603:10b6:a03:2c5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 06:16:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:16:12 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:16:09 -0500
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
X-Inumbo-ID: dfbbca57-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtJGlUrD3gL+DRr5qx3k2fzFkXcg50Q5ssUdQgsJbZ1MxK2qbaHQVd7l0aiKi5jE1ygOu5ZtvKTfB5V0vJukGPqFDMYf1tgpJNr6hlZHt4hvQceVHcSmtBiXKR1mYdiW5cj+hodSdivjWYAOq37PZp+p31/D725zhaVLcUFbJ5/B2HCpTvH0m0+A+zCmIQ41J+AIxUklvz1drGGhAcFqW62grpYkN+gbgKYdskKbrh0yW7kyiOrt3Z+gD3rPuyZaP3fGngP+mYS/EBulyMGxHi05jQFVqtjSrDO+qTra2ycoviDN1Ty7mt9Mv6lpd7s2NwnCgP62WvI522zlHNzOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw6NL7VqBaYKCW3hW2Z0XyyrZeJtYrsozW8O4Tm7LFc=;
 b=hvgtiv1u1CC6theR0TDuiGGWckhBvTBh7Zoz6e/FB3ze5uXRdRFy5dMXC2BQ7Ege7Aieh3pHxUtpUrjQHSiKU+gIaxYi+JaPkOUsfpeQu8d5wmmuq90Uk5Xw6oKI/NWeTaD27Bv3hGsqIZyCC3G6JI6e5/jhsbEEI3ruUPASqNk0wUOefOqt9lf2Ep6CplBDUIo1t8u09cA1OIAzAOLQEmozr1Cc2XnPb5p4GrO/KUn28tBqnpoiGjVj8fHe/MlmdoKW/lY6yOurvVgqwgkCHXDHcvvJDB0d+5oRaTXRWYe8quNK9s3HlosQSdW778V4U0w7SgQidDqNNq3wkHpDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw6NL7VqBaYKCW3hW2Z0XyyrZeJtYrsozW8O4Tm7LFc=;
 b=pOc2Hawyu6/YWN/a2w50QfcvDPiSTn1vuYubnO1y3D8jeTj9CbXbw/cMLg6XexNBdqdMtVka4l1anvlJSfwuU3nQ4a9AP0R+J7YxSYbRxBel83Lxb54grWN7zHIkMc8a2Eiz5VknEp79Ia/Ek0lHKQsvL2mobm1vkFPDba0S7h4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 09/11] xen/platform_op: Wrap around XENPF_mem_hotadd
Date: Fri, 25 Jul 2025 14:15:28 +0800
Message-ID: <20250725061530.309953-10-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|CY8PR12MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 423338f0-3d0b-4a09-bf9d-08ddcb42c143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWxHcWNQMVdXb1d1aTFXQ1pHYTRzTEliWGxlQW5LdFJnT0p1RmxYL3A5L1hL?=
 =?utf-8?B?eEswV2x5L0MyazVFZlV2TVh0bkoyRFgwYkU2cTNFZGNkdmVaRWFUOUltR09V?=
 =?utf-8?B?VStuSG95S0lORmprK1lVdlZ3azRsdzZ6c0FFSk9PTUFiME5VRFFrYkRlYTU4?=
 =?utf-8?B?N0lwT3E1U0JOQ0l3bmlFdlBsYkNaeG1PK1BMVWU5Z2t4czF3UlhzNjdoVXE1?=
 =?utf-8?B?clRHek5veUcxdVhFM3p0TWNRQ1ArbXNTY2ovVWUxQm5sUlpJQjcwb3dKeVlX?=
 =?utf-8?B?bnd1UTFJUHp0WHlNbjVoN1NEK3h0bTRnTDBOYnROU0kvamJCU0QzcWxSTnE4?=
 =?utf-8?B?bzBZOXV3YlM1MGpXTU8wend2SlEzMHV4cVQwdEU5NXk5SjlkL1lrK0pPaFVn?=
 =?utf-8?B?ZTFzdktNRm8xdTIwYkZTU0w0ek5HazBKK2Y4Um10SHhtcksyaGw3SVZ0MmEx?=
 =?utf-8?B?bTNTaVlhdGRueE9mOC9LcGlNUENUV0NpdVgrVnphck5wUWoxVjJ5V3RObkln?=
 =?utf-8?B?ajJYbXA2RFA1dUloS3dhSFlSK2VyTExia1pydDZyMUJVWnZMY1hKOU5BOGov?=
 =?utf-8?B?aFdhdkdtb09OeEFRRVp2c3czbmQ3MFFzWmRMU1hybFI4R21WREZuY3FmenRq?=
 =?utf-8?B?YisyQ0kvSUdXUDgySVRDbE9IeTRqU01teDdMbXoxY3NLNmwrUlJUaENFRVQ1?=
 =?utf-8?B?VkRTOTdMTmd2ZE80ditheUJTWUQvOWptQ3oxcWRNYTVIdW9ubnI0Y1NJdWhE?=
 =?utf-8?B?anZqcFRrOWt0emttSmV3OWJQZi9kSENKb1ZzeXAyYkxoeDZNdUZJY3JzVzVI?=
 =?utf-8?B?ZFpDQ3NzOFAvbHB3dmM2ZGpTckh0SXRPMjBabWo4Q21MT0xnNkJNQjdKTkx6?=
 =?utf-8?B?Ni9WTHdHREJKbDlqWnBpRW9ob29ud1J1S2FjdEVZbzhoY0VPRnhwSmNjVlEw?=
 =?utf-8?B?aTd1N0tldmdUMlVZRmpZeUVCZE9lT1RCUGpYYU5oWjhITmk2VXI3Tk5LcTVD?=
 =?utf-8?B?Z1FPTHdKdU10R2xRYnMxZjBQd3JjNXJjWW92bFhLa2ZYcnhjZUxWZUlaSE1U?=
 =?utf-8?B?M2NmRmxmOTNndFVYSlZLb0N6K0xLbXFsaThSUlVqaHdpRmd6clpZTnpXY0tv?=
 =?utf-8?B?bUNnd2gzZ2pvcWtJYng3ZWNadGpiTnhOcWx5eFVNaHFhL2xmSGU0OC93Ukw4?=
 =?utf-8?B?U05seklseHNxUlJtNzlVQkdKaW0vT1RYcXZmRk9kOFRlZlQ1Q3IwaXp1VGtC?=
 =?utf-8?B?YXdQOTI0bmhLMktOQXppSHVLMm1HaVZpSjAvVk10OU1BR2FZZ1Q0MDJXcXZ6?=
 =?utf-8?B?ajFRaHYzTzNjOTdETEwzamFHbUVJd2RDMDhLV0hzaWZYdGFSbDlVU0NwSWc5?=
 =?utf-8?B?WG1nWUx5T0VVR3NzUEI3T3oxb3VCbGg0ZWVqZGFFMmtOQ2lQUThWTFJ6b3U4?=
 =?utf-8?B?b0MvQ25PaGxIcVRhRmtuNE15OFRJNC9BL1Z4SmE4RFlnZkhjaDNZOTJ5Ykcy?=
 =?utf-8?B?MVo1dTlmcnJyMW9uVzljaGRtZDVETktzWkdJRGZ1SmNCTktBRStmTzlRYlc0?=
 =?utf-8?B?SDh0VlFkWW1BYXVwV3pKMEcxdEVRUXM5MnMxMlllOGRnQmdPNXVadkdDMmt0?=
 =?utf-8?B?L3I5YzdKMDFZMk4rbmdaZkd0Nm04WjB5ZmFhM3FYaWZuVUlzbW9wV1RLREpo?=
 =?utf-8?B?T3J3MjZ6dS96K1RCS3I3bW5CWTFCMDJwa0VsdlFReEc5NTJtaDRsczVBeU0r?=
 =?utf-8?B?cElLNWEvMy9GMEpTaUpQYkpBcjBlUTRKN3hZMHBHcWtkNmphUEVvaS9paEdQ?=
 =?utf-8?B?WHp6TlFkZHI2aDBFbEhpZEpEa1NLWnpBeFNUNU1ORGQ2aWszbHRxZ1UxSWRS?=
 =?utf-8?B?L21GK3kxVnV4bUlZS1MyUlpIWVAySnBoRlJPMmUzMUJnYUpEUFJZVXpBbkxp?=
 =?utf-8?B?TFg4alBMaHhaamRBd1NQZ2R6NE1rN1hweFFaNGVwVmZiQWtiN3lmaCsybFdK?=
 =?utf-8?B?M1d5TjE0dFVWaWpyTlUzUzFraVFFMWdGbW9jbkN3U01lM2FtbVZTd2prQUtH?=
 =?utf-8?Q?ckKJTS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:12.5841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 423338f0-3d0b-4a09-bf9d-08ddcb42c143
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8244

Wrap around call stack functions of XENPF_mem_hotadd:
memory_add
	mem_hotadd_check
	valid_numa_range
	extend_frame_table
		setup_frametable_chunk
	setup_m2p_table
		m2p_mapped
		setup_compat_m2p_table
			alloc_hotadd_mfn
	share_hotadd_m2p_table
	transfer_pages_to_heap
	destroy_m2p_mapping
		destroy_compat_m2p_mapping
	cleanup_frame_table
		hotadd_mem_valid

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/x86_64/mm.c | 6 ++++++
 xen/common/numa.c        | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d4e6a9c0a2e0..5952bca8cd84 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -111,6 +111,7 @@ void *do_page_walk(struct vcpu *v, unsigned long addr)
     return map_domain_page(_mfn(mfn)) + (addr & ~PAGE_MASK);
 }
 
+#ifdef CONFIG_PLATFORM_OP
 /*
  * Allocate page table pages for m2p table
  */
@@ -496,6 +497,7 @@ error:
     unmap_domain_page(l3_ro_mpt);
     return ret;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 void __init paging_init(void)
 {
@@ -743,6 +745,7 @@ void free_compat_arg_xlat(struct vcpu *v)
                               PFN_UP(COMPAT_ARG_XLAT_SIZE));
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static void cleanup_frame_table(struct mem_hotadd_info *info)
 {
     unsigned long sva, eva;
@@ -861,6 +864,7 @@ static int extend_frame_table(struct mem_hotadd_info *info)
            (unsigned long)mfn_to_page(epfn) - (unsigned long)mfn_to_page(spfn));
     return 0;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 void __init subarch_init_memory(void)
 {
@@ -1139,6 +1143,7 @@ unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits)
     return min(d->arch.physaddr_bitsize, bits);
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static int transfer_pages_to_heap(struct mem_hotadd_info *info)
 {
     unsigned long i;
@@ -1360,6 +1365,7 @@ destroy_frametable:
 
     return ret;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
 {
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a1622..9a1b7e3a729c 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -59,6 +59,7 @@ void __init numa_set_processor_nodes_parsed(nodeid_t node)
     node_set(node, processor_nodes_parsed);
 }
 
+#ifdef CONFIG_PLATFORM_OP
 bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
     unsigned int i;
@@ -74,6 +75,7 @@ bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 
     return false;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static enum conflicts __init conflicting_memblks(
     nodeid_t nid, paddr_t start, paddr_t end, paddr_t nd_start,
-- 
2.34.1


