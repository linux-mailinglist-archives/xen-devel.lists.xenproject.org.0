Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62425C789EF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168734.1494788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtl-0002JQ-8O; Fri, 21 Nov 2025 11:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168734.1494788; Fri, 21 Nov 2025 11:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtk-00029z-Uv; Fri, 21 Nov 2025 11:01:52 +0000
Received: by outflank-mailman (input) for mailman id 1168734;
 Fri, 21 Nov 2025 11:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqx-0007TB-Cn
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:59 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 149fe4eb-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:58 +0100 (CET)
Received: from PH8PR22CA0013.namprd22.prod.outlook.com (2603:10b6:510:2d1::11)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:58:54 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::6b) by PH8PR22CA0013.outlook.office365.com
 (2603:10b6:510:2d1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:58:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:51 -0800
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
X-Inumbo-ID: 149fe4eb-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ke9yDmteeYhVKq/N6zQDOQkMwa/lKkcNa3u8t2t8LYuNdoqSDMiX2DcU6vsMUkkwFY8H4eu28kQjb9Xxd+M9w1l5vwS/EZXXDFy7RxZ/OvUqNToRdTSWWu4Q/rfurput33a5y8Lex84ORz6OaxbdhH6GP4Lsi9TugEKR2GFBsVd1feDsu27y6jx/h5m8nQ+O+2XHp5yhh5Dtnf8TG2Jm+sxtlh/5XXTFpuT3fTjaqCJQvZ6PtDUObe1FqcsSzcf7L4UAb3kq6KRpkffEZNSCoZiLJxYayM7gkh0FvE4jMNdcuVFIdDkIjlojgkET3nyWGX4xHa83ECaIImLsnOR4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujDe1zt9QHrXlG7ZNmi2RWPU8HuKyDN6Q+EP1SD7HV8=;
 b=A90AZw0ITXUe5iH1c/cvR9CsOtGrqzefMgDb8VFVsBN0nHswsW1CNGDS5ARkl0ATbNxSdaJuQggeH4n6x+B2Q0J+lP9VHEs3Jclq4LAV1lrUvFOZjnpUwtfegx2+2Zy/vZIG7IgXhBsGuOAk/EeLdG6fCSTxxwQiVutWr7JU78KqFw4mXZqMiw7TUcGaxxO5SKXK0q3jy/js0DnZUBeWAU2ARoKvurS7zmykvCVuqbjH/0ZzasxjE8pD0CCrbwn1zNr7T5HSJDc/EXEwyvuyfYYfFKjd2A0pWy1g3Nz8cXGyFEPqm4PJMnIF/uP+7dbW0sRvkvFJUp2qurQTo80GMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujDe1zt9QHrXlG7ZNmi2RWPU8HuKyDN6Q+EP1SD7HV8=;
 b=e6gynIt5oRGe7GI4kszttLt9EKM/QkK2m4XDH0TB5o9AMVCIzD78gj8+I9jq5fcv6WYMa0yxsBrscAxxKtu3JAgdxBKyoEMbPi/POp6etdC2YZZu/01a7zhu8TTf1J8JRQypfO2KhArmOIDVjqohj3UWgw407OrhMeKrEtINntk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH v4 09/24] xen/domctl: wrap vcpu_affinity_domctl() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:46 +0800
Message-ID: <20251121105801.1251262-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3fbe06-c867-409a-410a-08de28ecf611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oOxYw/VkdIQeDfwrW3v/OP4NAbJyQ9bfO1Pj23dG/ul6HbbfH7MDzaMAKwM5?=
 =?us-ascii?Q?GwwyM4R7dY+t/VkFtBKAtKEbAofbaduoxscTnTpmmUT0uCL9LYi3n/cu7ZfZ?=
 =?us-ascii?Q?2FoxBLEW6S+NHsbFiJg2ePfSwABK1banYrFJs2Cn4zCYtLCm4dOh4oZRpXNn?=
 =?us-ascii?Q?xGqMOjSrD3tU2oV2Awn8reOh+/AfAn1MDbs6KoqHER/CRg5nl7zoHRgGOHmr?=
 =?us-ascii?Q?g300TgNcPpAZzr27MzgcecUoLcbXDkCepBxKyBNHMuOBlUnQWt0JKpNOnbar?=
 =?us-ascii?Q?83FMBMdo6K7eskUT02gaK/2wQvaHhxepVdduoudrezryVM7RDciIi6i2DAjK?=
 =?us-ascii?Q?RKMVp4HOwFZgkxr0qJGZOXJS9DvMCbBCLMFJ4sbAignuQuM0NK2PM7mJf3lY?=
 =?us-ascii?Q?y7S5JH/RpQJXF8/V4bmjZqwPxIg6xoDUtINS8MljIWNW8VBfb8zviSgZHpJk?=
 =?us-ascii?Q?mxf1yuJnUIbO0Nx1BJiquxKUh/w3InbQuUSchog8aTxQqASImf56Bz2TqahE?=
 =?us-ascii?Q?mAU7mJuAzdjMOskLXSVJWQAq3BZpFQHl2kpbO7H8DTSP+j/oO/3i/WH3X6A7?=
 =?us-ascii?Q?z571p7UiABhRhuSJWqXfae+fJfVXFq0ZHIeUNl6nYYqOgsfdO43WC6HJwnp1?=
 =?us-ascii?Q?MmQi6nZ8imO/Edl2NhFE/gQDxX/QH9HXKjiKtmrGcjnKwice31zB2tZw3xLj?=
 =?us-ascii?Q?NCFv6l/VDBLD2b7J4YM4iTajcnRngX5CSyb/Z41pcYWqjUxBo7n/EpARmljd?=
 =?us-ascii?Q?4mlDZoTD7nf0LFu0yyGLhDwqE+DzQ6bWLseT4FBaOy1T4gno39TdTLIxkGn7?=
 =?us-ascii?Q?2DFsXWxBxWhzmME5KknJUOvbBNcR7BMTjauVX5Oe8d+P5u3wcADgg4UDg5CQ?=
 =?us-ascii?Q?lmo50JAgOQxJmra0lmibFxQrYbdoWtbJAy88MJ5/YPsM+mTnkTxrYVL1ElvH?=
 =?us-ascii?Q?zdroxmwpftN+OBJKDzcFzJ51i83cBgA/bKeD/SiPuDnttzIhaOUV5K/I6DrU?=
 =?us-ascii?Q?j422eGtGYtaEExbJsxzE6mViwrPNMGeBIYP1dp3X5rcdgtcCli+1Uce6DUfY?=
 =?us-ascii?Q?S49VGtGEAekFWGEAl820izFyuuv19WFfrH51vO/s/jv6u8uRX8AVi6vY4COx?=
 =?us-ascii?Q?xNxJhHTmKwgcaveQfuOB+9kdVGZYDTV2p3uJ8PjhdJp3o+gJOs9ex+hlQ3jj?=
 =?us-ascii?Q?VjRdQL2c9oIVPCfqDc8jdZmhAChtrw53wbcYvFhgCWgp7UxaZMFibd2JeZko?=
 =?us-ascii?Q?W2WiIe6wFat5M6UubrddrQMYzWYzOkO4Ag/ZMNKCqX1395vwqf1y3WLPP1R2?=
 =?us-ascii?Q?jaOmQyutEuYkO3h9UcG9Tj9t0pmKtcxHvnghzmpKjWRu3NrV7ZK8KjYda3cY?=
 =?us-ascii?Q?tgZb/yNMbfB8dlgWxCz8LsBucOATLdrCPHSNSbCrXcJ0Uq7v7IRn5ptpFJB0?=
 =?us-ascii?Q?KxuFslSWr72z77h3fi8MvCD9k/NsBU6gLfRScmSEB2IdjFZRz/ivjRCpBWdd?=
 =?us-ascii?Q?X8oDXTdKfx5c7Wrr7QajHtYV23bYdaUGEiPEde+iUaV1Qmc2nJ3lBMf2UGkn?=
 =?us-ascii?Q?dnm2hqAli1T1Wcj6YSs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:53.8224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3fbe06-c867-409a-410a-08de28ecf611
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990

Function vcpu_affinity_domctl() is responsible for
XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity} domctl-op, and shall be
wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreachable
codes when MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
Tracking its calling chain, vcpuaffinity_params_invalid() also needs
wrapping too

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity}-case transiently
---
v2 -> v3:
- adapt to changes of "remove vcpu_set_soft_affinity()"
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity}-case
---
v3 -> v4
- wrap vcpuaffinity_params_invalid()
---
 xen/common/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 88150432c3..83e34e7c05 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1678,6 +1678,7 @@ int vcpu_temporary_affinity(struct vcpu *v, unsigned int cpu, uint8_t reason)
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline
 int vcpuaffinity_params_invalid(const struct xen_domctl_vcpuaffinity *vcpuaff)
 {
@@ -1798,6 +1799,7 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 bool alloc_affinity_masks(struct affinity_masks *affinity)
 {
-- 
2.34.1


