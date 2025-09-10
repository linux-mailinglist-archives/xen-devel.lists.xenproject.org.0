Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104EB50FD9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117675.1463784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWr-00055p-Sm; Wed, 10 Sep 2025 07:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117675.1463784; Wed, 10 Sep 2025 07:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWr-000528-M6; Wed, 10 Sep 2025 07:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1117675;
 Wed, 10 Sep 2025 07:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQe-0005yo-DD
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2413::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5000c6ac-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:42 +0200 (CEST)
Received: from BYAPR11CA0052.namprd11.prod.outlook.com (2603:10b6:a03:80::29)
 by IA4PR12MB9761.namprd12.prod.outlook.com (2603:10b6:208:550::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:38 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::e6) by BYAPR11CA0052.outlook.office365.com
 (2603:10b6:a03:80::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:27 -0700
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
X-Inumbo-ID: 5000c6ac-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcaZHxMRnZA8Y/4pmRABLQd8vd2H2gqTLuqoJvPbL+TJxyjpqhb6B1Y9km4KFuDskGEAbYCHR85dfwFFFQx367oSZGAhlWR0YLvOiWI4qg78V1jvcqemZ7FiByw+xiOKm1LiaLXyk0eNBxF8Jk4MiO+cEGw0WmU3DyLZMGcHUvVPGlH1UZUkIFUnxq2+LUEM2zZcn0cilyHUHYfTuD9e/DSkAFQcAJqa9gIQenRJKIokmp3v6Sj6fZ8/gQ6ITJUIpVLOC8yslrVUslIG+a+l4bWmmWVNQUca6TXwqD3WeOfn3CzOeWFAkDfddMgeLm3kw+PUUhVYwoM7tbewWzHK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObH7PSMMf5VmUwx5E3g8pzKJFZIPGuXzQ+wIgiA+LvA=;
 b=U6TYwA5r/FnHLTVPCed+D46kPFYZQOTUvfAnNAa6Bu9ssjadQAOu2RYySyGZtDXGCjqSA7ZVHwlyHGd1znRHchG/AW+gb2VevBRwatmPUsCjP8tR9///SaaAAvyOVG2pmBS7MD956a88IcVb+xkKVqNf0UuXe3VY1cyzeQezIjfaVTFtvmjt1yDOPnKXsA/SHKU0b/pAa/Iy1yfPcwJDTetW9tjz/pXMfJvMQ97/wNbO2bYE1eAaV2j7sqYcvxR4KfFTD6bPBs+bpclJLgqrVQLL3zOP0ux9gQqiftUq4Lojlgn7Ve1InqBQF00bTts8LwbjQv367nBlE5aQdc5MtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObH7PSMMf5VmUwx5E3g8pzKJFZIPGuXzQ+wIgiA+LvA=;
 b=xxIuk57nC4L/W+Sw1bmBZuiIy0fd7ipZpvY/eMdov+1JKglbv9H3k2mZ3Mdj5zJF2fpeQcXk8alc9OhD99gUYh68PJJHv/pHjr++k340zbTEZKQSoCEms+oezXFpXGpSCzkskKlJrtsOxS4LQOiO6fd6LTrTouAxRTqWjvlj9Jc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 11/26] xen/domctl: wrap domain_set_node_affinity() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:12 +0800
Message-ID: <20250910073827.3622177-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA4PR12MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b679de5-b022-408a-6c6c-08ddf03d3204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h71nJG8hkgIj2M9OKNziahRWDkFZ8qURrrhXsaAYPzC8qnfSgKauYMFxHhod?=
 =?us-ascii?Q?iIZL1bzVDmrQtmah3oJPekReRxkb8YI0FW9Ccg6pE1Y8s7aj1Qe1hCgcRX11?=
 =?us-ascii?Q?4x1Z6q863272xD9oIjGD0RccqxGEqYXBKUWKhn5d2K+tEX8IVcUPQIAUafAB?=
 =?us-ascii?Q?JLu8rgJrPXZFwewHftb3KcTvtJGjmJ1UQtPiK/jsXXqdGf6LMJMiXgCPQeSe?=
 =?us-ascii?Q?5O7DXzYU3boqlIlSk5lnCSVLPb5ZxWFg9wevqdoH/CIUjiO5Tfv82Wt9/XfJ?=
 =?us-ascii?Q?GSeh+FKTEvdRs/+9w3XCLW/uAsTt8ExATq7zGVAQVBLuq8BSrFL2osMK+eGF?=
 =?us-ascii?Q?C+pDcgh9i1f4xChJc8oafUyYYe7UQc3VJDGWjEaW3wJHr2bgXm002Hei4VNJ?=
 =?us-ascii?Q?h9qDDw1dA7W4E+ZNhzBy0zF7xEwR3rBegLZSllq8d0txA8fXJztiLpdgWjJc?=
 =?us-ascii?Q?BRP73Qc0P4XQdBaHRFYbDO8H9LI8HX6JU+YpUTEbsifuBD75DPJ0aB4uh6KP?=
 =?us-ascii?Q?flUI9mFK5d6vVvm8a9MxlT5LmIiXopoZxuuARjzOz8yUrWdxthcDzIAbtuWp?=
 =?us-ascii?Q?OkN+tjJ8UqSxrIj1gQcwVvLLrouTdl6pj5Lk/4Xbd7n+kJXthO3Z1aMpJvUR?=
 =?us-ascii?Q?s3wd1ySuGPHkgyQ9eL0em4fD0EnIwj4i8aisku2pAzTwgeOsNMm/iV10eKx7?=
 =?us-ascii?Q?H8nYB/mRGXyx3gzvvgSSxAsXTpS4U5RcZoSlUSBm03jmeLdQx5bKB/jJh+wI?=
 =?us-ascii?Q?4tozkoS8UDUCGKo8PA8Sa06482K09pCM00gluMMq/riXJd3WkU5bGNqqJvUz?=
 =?us-ascii?Q?sRQeBwOIjdZJ2jUfI/85s+4nCbQAXLWJOOR3JKF2jw6S0NpptChUSltCVO20?=
 =?us-ascii?Q?tpI09zJIRgU7zokxc1+3BL/jDcma05IQRmBQq0Gnk0DdiwWO/iu+Zq7W3hsF?=
 =?us-ascii?Q?HB+2TzmL3drldYZUQ56uIj5nDlIk3X40n/jr737aoi5hiUarhYBoBnxikf+p?=
 =?us-ascii?Q?6/xkGHfsD0LmIuKEpZAgu7Ide/eHbJ+u1cxAcER5VYoDnPhyNxeTFv0Pt/7O?=
 =?us-ascii?Q?7RThJ6sURKbPmAJt+Q48s1tgykM/AQQdLD5VKC1GEBgR2yt0m/mv8sXNS/Aj?=
 =?us-ascii?Q?ooInXOqZpGyLccU8i1LktbVJQ3SspbJOL1RgTUQ1NmJdAiZxpdrGgu+FyBPp?=
 =?us-ascii?Q?0MSINtsyU4QjFzp0Clp6hBuxy8b803uwsGFXatwCTzRRUvqKTvzqd58IK/Vd?=
 =?us-ascii?Q?n4F7vcxPWXaKdbyIya0R9gb5YH4nBJ+4KAKOJ1JzbWEhiSd+AhTzlrljdNgV?=
 =?us-ascii?Q?LG4/08mQXAGkftKxRUn049Aht/8F01IttBO791hCeo7zj2B+1ZJGRwtMlvg1?=
 =?us-ascii?Q?7akO0NeRMEDYKIl4R4/QJW7qfw2kDJkIpH1lkzFiPDxpBPvV177Rm4W/m6Zh?=
 =?us-ascii?Q?kYh8ZwzIdKpaj0IlCN0MkkTaQiI/HDAgORu04vCxwaBzN4ZgV4qTh0AhhKfi?=
 =?us-ascii?Q?GarTOafHUVLjliLtyg9a/kgkzeSxE3pWYABW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:37.8617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b679de5-b022-408a-6c6c-08ddf03d3204
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9761

Function domain_set_node_affinity() is responsible for
XEN_DOMCTL_setnodeaffinity domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS
Wrap XEN_DOMCTL_setnodeaffinity-case and xenctl_bitmap_to_nodemask()
transiently with CONFIG_MGMT_HYPERCALLS, and it will be removed when
introducing CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_setnodeaffinity-case and xenctl_bitmap_to_nodemask()
transiently
---
 xen/common/domain.c | 2 ++
 xen/common/domctl.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5d81ab3045..6778dc388c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1105,6 +1105,7 @@ void __init setup_system_domains(void)
 #endif
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity)
 {
     /* Being disjoint with the system is just wrong. */
@@ -1133,6 +1134,7 @@ out:
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* rcu_read_lock(&domlist_read_lock) must be held. */
 static struct domain *domid_to_domain(domid_t dom)
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 0f20e8941b..fb6fe90888 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -44,12 +44,14 @@ static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_nodemap,
                                    MAX_NUMNODES);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
                                      const struct xenctl_bitmap *xenctl_nodemap)
 {
     return xenctl_bitmap_to_bitmap(nodemask_bits(nodemask), xenctl_nodemap,
                                    MAX_NUMNODES);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
@@ -495,7 +497,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_setnodeaffinity:
     {
@@ -507,6 +508,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = domain_set_node_affinity(d, &new_affinity);
         break;
     }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_getnodeaffinity:
         ret = nodemask_to_xenctl_bitmap(&op->u.nodeaffinity.nodemap,
-- 
2.34.1


