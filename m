Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33584BD28F6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142014.1476280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flb-0005hg-JG; Mon, 13 Oct 2025 10:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142014.1476280; Mon, 13 Oct 2025 10:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flb-0005Y3-98; Mon, 13 Oct 2025 10:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1142014;
 Mon, 13 Oct 2025 10:26:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcJ-0004Rd-95
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:23 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdd25592-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:21 +0200 (CEST)
Received: from BLAPR05CA0029.namprd05.prod.outlook.com (2603:10b6:208:335::10)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:17 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:335:cafe::52) by BLAPR05CA0029.outlook.office365.com
 (2603:10b6:208:335::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 10:17:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:17 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:15 -0700
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
X-Inumbo-ID: cdd25592-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtCwgnpjddVNchvciwercwRn30bU7UO8J77GsaBNIIOtc+Mc3Kx7ymhpcopweYCxxIS+1AI1dqvxmVIC3Ro1ULzePglI4THAqhtonDzd2zVihArTp2uRrtFk+p1ye8aQEm12YspFwphTpJgIZzB6kqhRAUqGoZu9BF1ZXsly1bLk3D9WXhszjGIYwCEABE7KKR4LhXFsDqjHBenAPcy5ROH3opa7AJkCBjJq4HETAjrwdsrQaXleCmBNY4hnyfYClj9X4OC4a8HrzEEyDLRz+NYMP7ITnUBx9IuJrgS3p60JoHSUekYVX+CJ8ivZim7+GFoJojzKvB7QqP5Op8jDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tX06dash+GtYajn/b5K12INPH/R8TWFIax5WrG4+MA=;
 b=dRHvpiUnh6E2NwpnkiYWPMafk9noNr5szAFsB0h5gIBmiNpB4qlapC3VgazD+Uytk6Rk9m/VKyF5J9FqYAD2UvxQyu+MVDDSqRXssAHlpqsciNcBCGDwJT0GUkl6/dGRv6YKqiJdzLMMtyPBc4tPXcxQD3NXvm/cFpcFn9fxc4JVvzhOhfDZx9Md5qpxWHHAEvvX/VrDrtQNhn3oGNgzbdMvBM+OUToYZbUGetmJEEoX5+28SmeHo0rBGWAgTjDN1tqAL1wiXMP1sggf5TacCCP4DBtlGDcKfeCWzDkmQSFXJC42Bmv7nrG60h139H+533DiUFxSkVYe8aCijocvNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tX06dash+GtYajn/b5K12INPH/R8TWFIax5WrG4+MA=;
 b=jIBv1wDRJJ354TrXCwJA6WAMdcvPLMAmbsDLYpzNJ6fTmk+T4TwH4b0pP/ihURgghO3OhOKdeOBcwlBLsOwiaffR+lEOVNDo6wcnuJwc7wUUoQcLuP5tW/Kk4f+s/co3+QX2P/ddO/sXV5BbBxBmbiSDs+nTpDBY9RSFzRlcB+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH v3 17/28] xen/domctl: wrap vcpu_affinity_domctl() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:29 +0800
Message-ID: <20251013101540.3502842-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 2145f477-f4ee-42d2-6a63-08de0a41b02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QcJUW/sBGKpD1gJntzVDE/oiITPMNxkRqlrKgFNg+GvbEbrJsys91cVb+U4t?=
 =?us-ascii?Q?yE5QjmqIN5KKbR0jpCh7+fFa0+hwMM1x/ByafTaVDBY80znuK9TkPdowpYXv?=
 =?us-ascii?Q?Jap5iZ3K4PRr+dMAPrK78oLijK3SDFKQPgQfhHxEsI4nN9lA2dZF2o8bLrkp?=
 =?us-ascii?Q?+2TvkYRv7ukq7pE1D5FaLvcI9kR66g4v6t+NdehDGBgzSLT2QdwIym14OdKG?=
 =?us-ascii?Q?+9Yq33MuoUCGLoHH4QVy/D8PPR3QZf6qF6SQdQuAAkQ2jbaPCMGwaeDhSRZB?=
 =?us-ascii?Q?NQWu+aJLUZyUgA0r8raUrlf/WyQ78ZQfB55x03mUA+FVHP43/VTmmx48E/YF?=
 =?us-ascii?Q?ucZRESeyI0HzfJFfdMqsF1AOuLp3h1C1yYuHWdtKa/ukyRJaEDFpIgEOWT56?=
 =?us-ascii?Q?wt5bbSozAfi19AWsQRZ4vDt9bZBUA4VNiETH+A6ggYgYtWapFRzUhZ2jw6ab?=
 =?us-ascii?Q?cXZ02k8eDNYOwsMuNAhdEKyM+5G1VyYkC6Ct8Q9rKzdOOgj/kIlR1SxqntX6?=
 =?us-ascii?Q?376Uc6rWMwvs+t0eo7SIjcis1bsv79zAUQKe35zWuSpHkcVudzNGRP20auTR?=
 =?us-ascii?Q?pm+jcIUomg4cIs/RiYm8d7vsHCwN0SBcWO7w7MYxFZUL2XzY+VOAx8hPekhL?=
 =?us-ascii?Q?RxYyysZa1b7h7vge4vvf/etHW+VUibVRe20lEptn1oo+GhzirtFl0k0Cnwzn?=
 =?us-ascii?Q?9/4ED0NZmVsOceArhUXAzvziaXoRUpyef5Cz3eO+4txUZEs1KR6NwPzisjxr?=
 =?us-ascii?Q?2oBd3ZuaBD8XXFThUJUSCmBaFzg9vaAbOabtIGyhY9YzsyqFhzxFpdlNiIoX?=
 =?us-ascii?Q?vdauUcQuVjqwjdWU1rqn04DhS/UMvlM3z+HZt+r8z9EK30TA204Fjm0x/MKy?=
 =?us-ascii?Q?3GAf0a1WXpAiAJQEmNXF4QmgG3uLQ1ZXaPrFL3S9ktMrErdE9fKBnz8AuzEc?=
 =?us-ascii?Q?GFpz7vhOlpMsENn4fMBETUR6a2sLJgKUjWfZeoju320HrLIVnnbg3dV0HgCa?=
 =?us-ascii?Q?Cw/YUlGQYD5RS48ClQgvACrotwGNCJxX9ZAWPTVJ1l36xiIq0I5yqGbxdylc?=
 =?us-ascii?Q?gnuCJcrfQCdGPC+xGAwqfws8r70w5DZzhogDnkulCESzav3ScXCvjrrAzihw?=
 =?us-ascii?Q?vJ6cE3etCS1Qb8h9daERE/oBMboCsVar5Z8U/OnO2wlqrLXYjia24cHkYQ8W?=
 =?us-ascii?Q?sz4lK1OB56gIY51onjdTFIqLaRVfLycKPJeef5kZK8BzeXxy0F9O5MINIjq+?=
 =?us-ascii?Q?166c5Wy5p3Mzs2d9jbJ+fz48e+LBHNBy93hT/pAn9bnSsubMecxZ9bXBvH4y?=
 =?us-ascii?Q?t8Q6nyBlNDhLi20fSGjU4e3pbQ6+nkZHRgPXc72PDIF/rFbnF0PGbGSenUUA?=
 =?us-ascii?Q?3XEn0s23QeNZlp0dG4sMiiJyPJOgykgfhajiHiPw0Odibh48NvzoQ5hvWEOV?=
 =?us-ascii?Q?mwjsidswJlyETMDMUTwcB0IUHV0ThCHAgM8IFXi/khUrICcxsMkR+7topry2?=
 =?us-ascii?Q?izWmaQkuNbhApykamr2cCkyW9c/sVRznQmXNG23qRP7Ly+M51/XJivspJkev?=
 =?us-ascii?Q?NXdBHU/QqDQkDx9h4l4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:17.7546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2145f477-f4ee-42d2-6a63-08de0a41b02b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

Function vcpu_affinity_domctl() is responsible for
XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity} domctl-op, and shall be
wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreachable
codes when MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.

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
 xen/common/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 88150432c3..180de784fa 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1688,6 +1688,7 @@ int vcpuaffinity_params_invalid(const struct xen_domctl_vcpuaffinity *vcpuaff)
             guest_handle_is_null(vcpuaff->cpumap_soft.bitmap));
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
                          struct xen_domctl_vcpuaffinity *vcpuaff)
 {
@@ -1798,6 +1799,7 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 bool alloc_affinity_masks(struct affinity_masks *affinity)
 {
-- 
2.34.1


