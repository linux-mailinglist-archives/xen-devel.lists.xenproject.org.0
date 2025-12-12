Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2BCB7D43
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184914.1507264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQm-0001qU-0A; Fri, 12 Dec 2025 04:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184914.1507264; Fri, 12 Dec 2025 04:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQl-0001om-SE; Fri, 12 Dec 2025 04:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1184914;
 Fri, 12 Dec 2025 04:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQk-0007SS-7t
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:58 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffc3d82d-d70f-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:06:56 +0100 (CET)
Received: from MN2PR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:23a::24)
 by CYXPR12MB9320.namprd12.prod.outlook.com (2603:10b6:930:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 04:06:52 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::6c) by MN2PR03CA0019.outlook.office365.com
 (2603:10b6:208:23a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Fri,
 12 Dec 2025 04:06:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:51 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:49 -0600
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
X-Inumbo-ID: ffc3d82d-d70f-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIeq9S8OHBwMPG4YYGbZplRdCWcpHxME9wXmHt2J2j8iI574QDOj2lLMt+XPSgaI2lAuIevYCQlC32s+gF2UJXW75MDDN31NnkolavnIvvhbPZu7c3dyS81+kJ16BwzBgBGfWKt347Sh2s/XTB1v7EraAKAjga64MLPgfHJL8laVDyXU8jkkNDpSBbyrR1xDedVstwTHV76tlDb61ysdG23tu4tGqno4hG9FdlcKhEPAXfA123tm5IGbuMUSwxIz8eEnEvAK3l2AHagdW+MVzso1hMBYMgbsy/oxyuiDX0jklL29GbewEd++1cIpY2ASgzH1pAgO9iS7ulO9n4C3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujDe1zt9QHrXlG7ZNmi2RWPU8HuKyDN6Q+EP1SD7HV8=;
 b=KgxNpuyFTmyd6rWJNY2v4i8E2A1lUBNCP59bvRAnx1aH686HlfTaX15lwvkOjbfXubs9rvvcVPAOxSlBfbN6PTJytnnH4+ZbE7tKi1eY0GFNXc8zePSLoTmDYpbLV9DDSyd1U9TDVAhKNRJvXT5pQ6lxN5877STaGm4+BxJOCx4tcHWBEMNtpfHiE5dHJ2558N8+ogV9a9B86m3bk77hC6i4U++o+vR8kEEyuHLyqjb7FZisG8SWT5Eqk+SCr+ATUNREcIi8TAYWdGaHpB/ANZ+3ghz1/6inlyAyjulqTs7MHl+bZ1kdL/UkoUdW83kl96vnIqapl2wEoPPDKxoa7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujDe1zt9QHrXlG7ZNmi2RWPU8HuKyDN6Q+EP1SD7HV8=;
 b=1S0uPclOCCh4MrRqmYxA3CcUQLd9k8jytQ5kHGDcTfWgNXwwdkK/RHX8jhyvsbXu23gketArFG3MyJLhL+QbqhZV9v8CCYFIKJ067OdpqJbBepQ9RH24assbcPV2HzXF0O4CqGFvhQouhlEQv0B5PbWIoHugtM2pK7BVl1YeyzI=
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
Subject: [PATCH v5 10/24] xen/domctl: wrap vcpu_affinity_domctl() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:55 +0800
Message-ID: <20251212040209.1970553-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|CYXPR12MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 5473bb78-81e1-4d8a-4371-08de3933e134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GdMJX9nOr9p/IVlXpJBxx4QGFkKdUpsrOzs7FiwNxbHyzitE3PB27ZnD84eA?=
 =?us-ascii?Q?J68wd6V+awla9zm8VBuj0ni50y3URty53b7W0kFuZDsK9uD0K90OoJjUAeTa?=
 =?us-ascii?Q?Zr30l60GN1gCS9npeg34lWsqPfcUjDNcPD7KwEHGy0oE4MzADTNlXI1dDY9I?=
 =?us-ascii?Q?SXAtbP9dgPBaIDnidbZdVQ5HUVoyPbHgteeZI5oy/oVujQDLhCGXDCNMNh/r?=
 =?us-ascii?Q?YQ9fkaAmV0Pn5RETxXOcycKMn58l4tvsu/zo7fC8AGKGytT5dZctuigv7xd9?=
 =?us-ascii?Q?RDsm8hl5DD1fdQuNLTJuKPVke4b2TOVyKKszoFXaEnC6yvnGMFJbEvJswsWi?=
 =?us-ascii?Q?zQLkL+xtgogAAnCEnC2Gjc0NZgBreL/pF7SMiWtdobnQ6PPDK358P0TKvOqb?=
 =?us-ascii?Q?njJbqFB+vqRRzZ1TNJb7SUzowsn2y7o+LUJD4eA99VSnARfGosGAIHC2h3L0?=
 =?us-ascii?Q?dUI31110FJp/SkRAmyFKxyXOFllwpcYFm5vtKfEOFmeMfijKkMAHvIMf/JFS?=
 =?us-ascii?Q?MLQ3AXCAO7FQMSwiRxkGKj4qK/IysBi20uG5O9hgvL/GUwepEX0sYstEXGgQ?=
 =?us-ascii?Q?qtDYB+Jw6a0uJ93Gxyhr6AMCuLYRB4/ZhixYUjvWMzbHUBU/N16neMnexM8x?=
 =?us-ascii?Q?MfDfE9+w6NdiAzrqkDD2ZT/7Fq9HAqPJnE+6NU8snZnIwmLRls6P0xRKJCuH?=
 =?us-ascii?Q?nLdG2X4+p4dkD07MeFU+Z5UeomQMQ3/jNmKRJJSedHQ7WelnSyNLK9lYufCX?=
 =?us-ascii?Q?ADG1wqfh3GVsYCnDMhnwuyfu5XG7VSFGDtxfMVgm0HVEhjxGymyzQ0siBpJf?=
 =?us-ascii?Q?4DSvnN0Y6o+xl7n/f6s6HrwweUi5PHUx/xCglGKdizvoqeou1R5QGN6tepZB?=
 =?us-ascii?Q?U5CrM5vd2Kh18gxqIEVjKIvMkQSA/TEiTjvzY920zWJJrkSSJ/ipp4vWUMId?=
 =?us-ascii?Q?Ow0wsFohKiC/Y0X8u+9+3WYSor3CC3yVFatvm2RuZkGkRSX+bkuy9e2DSLjS?=
 =?us-ascii?Q?0fLrB8b3ScW5fbtVYRIVCiKHevj8KSJB9+tz7V99mpL9RezAw7Mg/60Eu1TS?=
 =?us-ascii?Q?HZyKgqz5C9qRfVz/42byMl4i0IkUhdbt5VpoVymEmyEvRu2x/4rDMnZWqod1?=
 =?us-ascii?Q?zuGWR8RqWUeLVq7VFfOnQtkSF1STKl+2l16GES9gmehNeSf6wOkMJLLd/S11?=
 =?us-ascii?Q?ia07cGZxBCs1AtOBCnvjIIxqvHUPQ4NeDXaMS2lgFpoRRnyMQQ5eZsfHH/L2?=
 =?us-ascii?Q?Yjm2HkTZZXSHSglxZDASbHM7DuUibxNqWqUNE9yizENS9cFn+kQcdzf1xmlX?=
 =?us-ascii?Q?AKM2hnl9xlWM8C9bJ/88zlaeyjB3Di42NzXnHzG2uDrr1ZhWQ7ZtMCcal7Qh?=
 =?us-ascii?Q?3NnJ31lkPXFMR8/S879hKjSSNcGm19b+ejghJ1au2FedDbrO/O+pzn62ERrK?=
 =?us-ascii?Q?QQ5L/FBeUBBey1Uwti3Fh2u8H94qZRhsgNTCbHmA+n+Q/trURhQ/7Vl1j/dp?=
 =?us-ascii?Q?oUTQ5g1/LY+bnfBfmQVitVqLuDfsVSwIvHMIBo0LWhCeI8kdzgNxj+8hxW4I?=
 =?us-ascii?Q?vaikI92vicy9QvaJBVI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:51.7157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5473bb78-81e1-4d8a-4371-08de3933e134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9320

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


