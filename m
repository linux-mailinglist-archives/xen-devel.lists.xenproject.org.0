Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4BA5D4F4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909687.1316632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNK-0000i3-PP; Wed, 12 Mar 2025 04:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909687.1316632; Wed, 12 Mar 2025 04:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNK-0000eH-LU; Wed, 12 Mar 2025 04:07:22 +0000
Received: by outflank-mailman (input) for mailman id 909687;
 Wed, 12 Mar 2025 04:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNJ-0007Fd-H8
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dcd120b-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:07:20 +0100 (CET)
Received: from BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7)
 by DM4PR12MB6088.namprd12.prod.outlook.com (2603:10b6:8:af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 04:07:15 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::bc) by BN9PR03CA0362.outlook.office365.com
 (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 04:07:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:14 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:11 -0500
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
X-Inumbo-ID: 7dcd120b-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQW3Pd/vW+mDDx3dpr4Zd6FYV7VKIDWlZU7+vgtJZ+HKCyToOt3uCIthVs/GfAIlpF0OySYS5ShfPYUG2OK88y7+T3qPZc9S8WbHjVVHMfiruI4TIFOl2KfiEYJva8ru/jjiKaeucykzT1VDz/4b2OMQf7eH0ibpzapAR0q9UxC6hLyRNxIoTZ4oxTRWpZ1HOFtZ70wxoEy1vnLTShSLUKBr2wbj/YBwiqEn+XPJB5+a5xrjrD9VsUnkueF7B4+98tdPG0u1MmYDs7ky5iZxcSS4lvP+bfWDU+bxPKpIb2IMmmlM0/WzqtePRi2KL9hYTfkORPDmoep4aRhhpfHIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyXPch7vdUxtYLZkn2hdqi4FR/VmMozdqU4pWrNieqE=;
 b=VpcpuquTXilZMM4AkHCnE70jRamVGPoQ51WG5KoVwi8b7Na6ryhP5rqUBXtgqLbjd43TkOtDw3qeZ+Bo7HSpGP53rTu3xziHzMPNI2aJ+isfuTI7fjOShmHj03g23Kmvt/j0GfXKG0bPGxXJXxX7vx4MNxfZJiMqgeDyD4DxeXYkI0TOVh+FraZz9XtFVN+xi7vu2en7FjDBa9a/odS3SR/cWtdC7aEntT7O/NlLTaYEVtmughOPlm/hFpbDRAsSoLgFvCr4n7PgA//5TFj2T9092cMbIrmS7giw0RmRsiT0m6UnRdYS9ML6HZqNf4734g1ME4FlgSmvolTH/9YY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyXPch7vdUxtYLZkn2hdqi4FR/VmMozdqU4pWrNieqE=;
 b=JLEigtTqL5x1kz0zTs8U3z0ThFZ3i1fK7GqZQCDUd16uY0WiO4gz6HT4WITq0FlEZXnzA8DdYNHbW90l5m1gWl9WJjkCo5NrMQTPx09yFsIH43cfRJHQx9H7fIKSXLBhg8H+Z3+BFODx0xFgdEBw0MUHVM+MYC4u8huWvjm0GGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 07/19] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
Date: Wed, 12 Mar 2025 12:06:20 +0800
Message-ID: <20250312040632.2853485-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DM4PR12MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afb2d37-c9f1-4b82-323a-08dd611b5f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tncPJjHwSB6zCeIKlaWadR2LIkmRs6oDDgdWO9MLWbWvUUY7fjTuSRuxXWGn?=
 =?us-ascii?Q?fZfrPia2LZ12+fVU2qhAnfFykg88MJA+C0hEsywM7jWsQcSp82RmPTQ1WdJF?=
 =?us-ascii?Q?fdlJjw1PfP6smZKkWSUli1u3DLhfjpOcnLKyTCPuo+bzRNtPd3PTXOP5D+UB?=
 =?us-ascii?Q?OPjuPtjil40XcXt84iBdov5ulJKdCKeh8EUWRmhFATCADyD3BeCA99UFNwy1?=
 =?us-ascii?Q?+B3kUdk0fmyPhlQ8/KnMwgiE+6Al8eBn15x9JQ+xT11n8SIiuBAjQWHlBNib?=
 =?us-ascii?Q?JfPnR3zZNeo/ZIFbIW7BiqCLf9GJd1qe1Ca8mkkXJOiabBXmteFQu+l/O7A7?=
 =?us-ascii?Q?JNM7S6yDng8q+0T880GBgv2JHizgPDw7mXYnThy0ZKZSeWVK8L3wyL0qQLHB?=
 =?us-ascii?Q?fsU7hN23gq4o7yQgSD674v3Dzi8u8xgmSkI5oJc8csV0M3Zfe0FtOTdDp35p?=
 =?us-ascii?Q?LkT6eJgP5tm6/EszHtWGXi5hwqLcoBsNN6eZN0NCwrkNnDdbRavE/HRWvJmX?=
 =?us-ascii?Q?8r0/YQfrPBAOCA6YhRJX6EOJtQNfICP8T3v/umfGTLGx9gDskmPaJ1YBrZFr?=
 =?us-ascii?Q?xxEFUp6wfhd7WOBHyXJh4Xg2eotq1YzEfOvxnT/es/xCl9gpCYbajN2NWANq?=
 =?us-ascii?Q?EOz1kuJBN4Oe5mNaB6EYmptKvM4va7QY6IvlBI3iVAQxP0yz3zNjgN4yF0W0?=
 =?us-ascii?Q?RcfmUNLPDY31r5up6662yIbFa+Gx3nEX+QSJ1A3L+bjo409q5yTPPu7qcNZY?=
 =?us-ascii?Q?ruDno5YdirUlzX/EdYhMIojVY1JDRB8OKblFoGZvQ4iTO0dnH9hQ9CGQ7bvm?=
 =?us-ascii?Q?4GUrQM9fp8OL40hF4GBQpICdm+m6WFtEdSgl+mHl6vMajoK8P2apOwzXZrpo?=
 =?us-ascii?Q?bIDBL5VwG+sAD19GgqWhfmrXNuM2kFQ0AM4ILzyF2Dm97785Tql0OEL/6rk6?=
 =?us-ascii?Q?BTG+LiXJli+H0vIKLBnlJgRuqYlDbE94Boy5fXXL3YHo5Trjy97Ve0EHV3i6?=
 =?us-ascii?Q?sYWjNDoC6sW/u37EX2KQmTjmyjfSKJmo1qt+T/d1SS6FBnoXWtLb4nBMipjo?=
 =?us-ascii?Q?776mb2yTjBaHiCBrYUVQFwnzTjFpX2cHL9C/M6rHmCTLM3t+grq3zAmZW2Uc?=
 =?us-ascii?Q?5rISNz4iigPB2GQAksDvxItCdTVwb4k/gjBXEecPI38pPxWNHuhaDeZSLTs9?=
 =?us-ascii?Q?ByMqhB8ePbipMniIzHjQ+WridfMWd1o9AMQTvUn+IsSN3+s03nmMP/M5P9RP?=
 =?us-ascii?Q?OpZ3pMGg00XlSzpT/XjviDVjwfO58B+9qT5sRqPdo+dApXgHw849fSm6l5wT?=
 =?us-ascii?Q?eiNjHcKJns3sw7zf2BDDBjM2D27+nID1ib/hGnGvsjNZT4QZNyXfUSynR/+C?=
 =?us-ascii?Q?nixqawvjyYxkUbn1ro40G2iyPFakewgVRRw3so2elUO+dFOJDm5ePP+ZfPK0?=
 =?us-ascii?Q?jMVQj/w7GZjOQQDyyEiyjbbWFyc4XDSMwhPAV9v+bBlhpvPJglLjqzHaUc2L?=
 =?us-ascii?Q?CAuuk24ssUDZPIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:14.8554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afb2d37-c9f1-4b82-323a-08dd611b5f66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6088

The following function is only to serve spinlock profiling via
XEN_SYSCTL_lockprof_op, so it shall be wrapped:
- spinlock_profile_control

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/spinlock.c      | 2 ++
 xen/include/xen/spinlock.h | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 38caa10a2e..0389293b09 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -690,6 +690,7 @@ void cf_check spinlock_profile_reset(unsigned char key)
     spinlock_profile_iterate(spinlock_profile_reset_elem, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 typedef struct {
     struct xen_sysctl_lockprof_op *pc;
     int                      rc;
@@ -749,6 +750,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx)
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ca9d8c7ec0..7f2a814ee0 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -164,7 +164,14 @@ void _lock_profile_deregister_struct(int32_t type,
 #define lock_profile_deregister_struct(type, ptr)                             \
     _lock_profile_deregister_struct(type, &((ptr)->profile_head))
 
+#ifdef CONFIG_SYSCTL
 extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
+#else
+static inline int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 extern void cf_check spinlock_profile_printall(unsigned char key);
 extern void cf_check spinlock_profile_reset(unsigned char key);
 
-- 
2.34.1


