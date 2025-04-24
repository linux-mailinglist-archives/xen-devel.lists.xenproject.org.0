Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8362BA9B3BC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966599.1356794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zJt-0007Mp-I5; Thu, 24 Apr 2025 16:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966599.1356794; Thu, 24 Apr 2025 16:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zJt-0007L7-FC; Thu, 24 Apr 2025 16:21:01 +0000
Received: by outflank-mailman (input) for mailman id 966599;
 Thu, 24 Apr 2025 16:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAd-0001nN-UD
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:200a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c415f30f-2126-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 18:11:24 +0200 (CEST)
Received: from MW4PR04CA0287.namprd04.prod.outlook.com (2603:10b6:303:89::22)
 by SJ0PR12MB6854.namprd12.prod.outlook.com (2603:10b6:a03:47c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 16:11:18 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::1b) by MW4PR04CA0287.outlook.office365.com
 (2603:10b6:303:89::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 16:11:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:11:18 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:11:15 -0500
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
X-Inumbo-ID: c415f30f-2126-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZryILJ9lMBMSEhswr6xb8tx8H1Ju0uCieYHJMPfprCLQO5e7T5eOTrYWMAsb79WRI9BjB9Zcd6SjoYj6VB8ZEQZJzKg3o5z6SDUwkfcqprxmV4k9cQDvWU+mj0vufXW4awAvDu5BqSw9towBjjdMdu7j7shlsCs1PCSr0Ti7Skmjj+vq27vzHrjkg6R1g6yj/gTkzUegGdpUrzqPDlag/Y/ZeES9Fnfaa8Uzyfp3pTl8z0tQ/dtrlOy+Ne0rbc1gUQrAOrUuLEo+7biprbEUq9UXw+XBg5BXpVgBoyq6oK5EBJvpyLDOBsTdbXYQornPCkm1cO62I1NiH3EqDnJKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsN0d2QN5rII9Lf6gzYOwAZ2IpMwWI5p1HyZ9OS2+wc=;
 b=eONT1h2CXOya8wDho9x6fIFKxI56ZnbCA+KqUj+Ipq6O6KjDRHdJkmE+FMb8ZJuVdAh3fDca/AHIT3aJRlyiGZp1prxexN/qoqyUJYzAP9+fjpw1P0HEL7eO/RjFGKISqwK/qtkLxY3qJ7Jvhs2zqHfdafIyRb4xkKlAUxyQ4Jb6v69oNEJnXFaNsexIHs32Xct8Tin52cFnulSWTPFM0x9aD5MwW+K+bjjnSUqCJGGQvf4O/vuonYqiTBU0z21Vsye15Z6jSzHZ5HFNpi1HfadYtg/9GlGPGplhJlyenf1smbxU1idy2uGO5xfJMum3DNcw04o0GsTbTOUnR5XWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsN0d2QN5rII9Lf6gzYOwAZ2IpMwWI5p1HyZ9OS2+wc=;
 b=HV6wNsfJdMlsUDwEHTA3WiTdvLo/rVSduvgaxytPjkyBCC9vJfixm1mjYKkoeZ810jtQeZB+xMWZwZcGLwK4n0+oXk1AzbuZEg99/+W5r6Rf/4axBXUq5dPscsKHYxAIcVi4l2xrOhlDEKYhNEmGpSfOiMDBnN+X/PG13H+VKqg=
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
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>,
	"Denis Mukhin" <dmukhin@ford.com>
Subject: [PATCH v5 11/12] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Date: Thu, 24 Apr 2025 17:10:21 +0100
Message-ID: <20250424161027.92942-12-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|SJ0PR12MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: fd647027-00d6-42cf-4817-08dd834aa586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SHILNE1zQ1878s/MWzWAEjzjbr/I7N/eoueJUmOdriNp71t0VeE/FZyBxvrv?=
 =?us-ascii?Q?kIVcU50Bl5e5TPYymorKwR4E59IJO04qZqQv39B+RRfwlaTVInciwsKQ2SYD?=
 =?us-ascii?Q?DDTpIWwR1/mR+8+OV00ucigzT3+t+VSq4NaRlH5Yr63nZB5uvNU+weuejjaZ?=
 =?us-ascii?Q?vnkYpJlCw1dOKVLuabvzJn/U3JcvdsDdufWgTVZCTbdsSBwuRWLNXN1VtE7p?=
 =?us-ascii?Q?hmfwOiZ6DT4jHK+DCJqWqBiSUnsT8NUJUrYj/m3MFMOvk8PU41VmoHVmkmQo?=
 =?us-ascii?Q?fGhwj+A8UI19U51WDt00q0+KttK0dvr8c6PoUrO0fIdFAZ3oL0EVNa0ZLfnB?=
 =?us-ascii?Q?AXVj+wM9izVBgbRi/AhJJgvnvCtjx4oFvOyA2TqsLeo3uSS5ZVBEnu/NmI+Q?=
 =?us-ascii?Q?pE6LFvM7dqlBxi4+Z9sibA1duaA6MK3hXRZCtPlxmjbiHDH+ay6S+MSCDbcf?=
 =?us-ascii?Q?b8vorB3hRF4wCbOV7DhPbAbFYdlmcafSw0/l0suwWA6Ie518e0ozMKJCNAuJ?=
 =?us-ascii?Q?rSbMxiW9nOEuV07Y+WSvpn50ysrY3nbyJq/PkzTdFs8rNAzKMEim0ib4HHGp?=
 =?us-ascii?Q?WssEMK03eG4pRVO1rQTHDBHbl+ZDkQ7XhkjiWtRhhAHw/pqssCK/zVW6Xu+g?=
 =?us-ascii?Q?bZkEoOiWKodpinjP9pZ78JWYER469IeFE32ICMmHbtMvIsfYtjdWC0VlE6eO?=
 =?us-ascii?Q?rW5J+wLjJCScS1N7+GSmS5djyb2QgK2ZrpCqFqS2+ITEuXc677ahkmDLm4mF?=
 =?us-ascii?Q?BVdt2T2/UJcBQyjTp1ZY+VEgeRdVeqwblu3BB/WR3cYjYUJVWgn1T0WNF1ww?=
 =?us-ascii?Q?2XXlEb3m8MaufnX5yMbYpPFSYJp9AQqe1mk4EoC1B5G5oxwPx7r9+X16ggnU?=
 =?us-ascii?Q?KKWF9FBdDdhGTQW2YXMvBB79A1sBCcVjAkY44Bns123xWczPo5Cqy4E+SQmu?=
 =?us-ascii?Q?+I5IFSJVXXzqb7h+LOKinkPhhQP9GqaE3OTLClC2GZOHErGeAvyphQlOLo23?=
 =?us-ascii?Q?VKLVXcd+jPpKGaQbodcEi64zKE3zagxoqNBkXAujl/5RLBaDLzutRoPJ9ZNY?=
 =?us-ascii?Q?nOQf8+Wbetjz8j3weoB9vPsK/z7S4bI+guLQ2R04BvasutvbeS8gbvwiY00A?=
 =?us-ascii?Q?ph82jL8E/0Ma96UltH3lN2p2VBtGj+aTM9Hk/WmnagIA8IpSiiTR941UpFvl?=
 =?us-ascii?Q?E6wy9J+PXiGSlTq6/nrVYWXjplmXXDbVLCCpkevXUg65LVyw08Oe+ufJ93Lk?=
 =?us-ascii?Q?3hZ+Zy/TDwk5ZWiNPkTnLLweKCOn0Eg5r0QQ6MzS41cLwB1+Zf7Eg2RzTfEv?=
 =?us-ascii?Q?Nqd/gY4bXSq0ezXV8OZEsjmFmZAmTIhkIKc+4S9at85VCxJfkLgKpuq4irAP?=
 =?us-ascii?Q?oWCp0SvWPDPoakjJBz8Hi4F1Bo87Akt0qGNYguwh5lpF4uDd3m+OBUZKR4Bh?=
 =?us-ascii?Q?WyN8nfJzPuiH2AZ5z5bnpZUkji+/bgiwfe/7hv4O3+ifVx+tHT3HFGk06nCh?=
 =?us-ascii?Q?Xksl/p5FsVTLyswj4ql0EihnzbwzgSpchGmh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:11:18.2931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd647027-00d6-42cf-4817-08dd834aa586
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6854

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the `cpus` property, named as such for dom0less compatibility, that
represents the maximum number of vcpus to allocate for a domain. In the device
tree, it will be encoded as a u32 value.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/dom0_build.c              |  3 +++
 xen/arch/x86/include/asm/boot-domain.h |  2 ++
 xen/common/domain-builder/fdt.c        | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8db24dbc0a..f734104c74 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -635,6 +635,9 @@ int __init construct_dom0(const struct boot_domain *bd)
     if ( !get_memsize(&dom0_max_size, ULONG_MAX) && bd->max_pages )
         dom0_max_size.nr_pages = bd->max_pages;
 
+    if ( opt_dom0_max_vcpus_max == UINT_MAX && bd->max_vcpus )
+        opt_dom0_max_vcpus_max = bd->max_vcpus;
+
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index fa8ea1cc66..969c02a6ea 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -22,6 +22,8 @@ struct boot_domain {
     unsigned long min_pages;
     unsigned long max_pages;
 
+    unsigned int max_vcpus;
+
     struct boot_module *kernel;
     struct boot_module *module;
     const char *cmdline;
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index ff41727ef1..e90f183481 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -302,6 +302,17 @@ static int __init process_domain_node(
             bd->max_pages = PFN_DOWN(kb * SZ_1K);
             printk(XENLOG_INFO "  max memory: %lu KiB\n", kb);
         }
+        else if ( !strncmp(prop_name, "cpus", name_len) )
+        {
+            uint32_t val = UINT32_MAX;
+            if ( (rc = fdt_prop_as_u32(prop, &val)) )
+            {
+                printk(XENLOG_ERR "  bad \"cpus\" prop on domain %s\n", name);
+                return rc;
+            }
+            bd->max_vcpus = val;
+            printk(XENLOG_INFO "  cpus: %d\n", bd->max_vcpus);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


