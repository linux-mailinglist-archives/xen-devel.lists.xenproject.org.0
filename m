Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A74EC77BFB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168290.1494360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLsr-0004qS-RZ; Fri, 21 Nov 2025 07:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168290.1494360; Fri, 21 Nov 2025 07:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLsr-0004oT-NE; Fri, 21 Nov 2025 07:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1168290;
 Fri, 21 Nov 2025 07:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMLsq-0004hA-4v
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:48:44 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e4157be-c6ae-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 08:48:41 +0100 (CET)
Received: from MW4PR03CA0027.namprd03.prod.outlook.com (2603:10b6:303:8f::32)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 07:48:36 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::4c) by MW4PR03CA0027.outlook.office365.com
 (2603:10b6:303:8f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 07:48:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:48:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 23:48:31 -0800
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
X-Inumbo-ID: 7e4157be-c6ae-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9Pc2apTGTzE42f0uqPE7KHBIu/kxHT/F7Kc16cGKkhJFoICbdwR+1VxgD+tTXqwQpGKBnwdGN8GuRHg1dUESX3kjy1FH/Q34Yq5yAfmBO9pmT/d5OEwKDmmVQtN9+7I8YDhg8VN1ffmIP7g6gdkNjNB3xfDedRhpmjcF5CoKkcIoZ45qyNugY5/gQq6Wb3AprcdxtcUpem0RqHiZLu9YToNQooTflj2v7U5/ePchkjbXM+vdy5X40oQ9m8owUZGIKpfjUnTdjjg6YMjPH409/kyyl/CaWz5zxLHWFj285LCksVL3svXsYoZlD2+ZaFUwoJTbtparvBUKRaH2U9jWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrxm4Ssb4DNyh7hnIccW9NVrE+CVSNJj7c6CdihhrWg=;
 b=jW+YmBNB/dqV+w3f/KN/XYov+AazsG89PaonHdLEayZGL9k1J9N3SF+3AgJVDvZ6zL6Tm2zK7p37cdc3Ik+Q0FvPsdNNCBmzCHJQweFCPysAkwX73CA+liYNUHSWHWFLjoOIw57q6IterBmGjha9behwuCgtlFWw3hTzFNGdm1VqXQG01KUQJVvYfk7Xvd1MONzt1di8ZFToyuRMxkCXZh7zQXHfTqJqw364aoLm4QOy2S0Gq049KExzktP7goDSjd0fG98senKSJYqSeOh0JsuVw+ZdTQ5SUHYq2Qc2/hstQC4kIDyk3m5ZEKY1a1y2xC6EOUzX/4iBwqj7bawQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrxm4Ssb4DNyh7hnIccW9NVrE+CVSNJj7c6CdihhrWg=;
 b=2v+/cy+F75ERXnflTDW31anBNXl30/AVfy/L0ALzxefvDeF6Q1EQdb2nuBl4Tn00eQpIqa1XclNkAM0msPNGdmX5tTl9VrxWpl4N/xNoGNxtP4xlPmil6XzqD/PdRWsQJ6I4mtCUOFFC3RE9DFYEj2Mz7ITdXj75RJf4MVLziZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 1/7] xen/x86: move declaration from mem_access.h to altp2m.h
Date: Fri, 21 Nov 2025 15:47:57 +0800
Message-ID: <20251121074803.312568-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121074803.312568-1-Penny.Zheng@amd.com>
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bbf2ca-c86c-492b-2928-08de28d2603d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1zDZeD/uAdChCptJvFLuhYdW45I/uDuMqNQonEygpPxB66OpaY8vPvzprBu5?=
 =?us-ascii?Q?OC77toWBXSZWYoG17DwUi/VStFbvR03s+Y5w9f++Sh30hgxkhKsaqDIpKw6b?=
 =?us-ascii?Q?dgjMNBZhy5O7ybPnrvNZwN7j7rNV375tfOg4QSkkGOLiVfuYhf8PQB4u4SCP?=
 =?us-ascii?Q?mlvjQ5i8HmcNJVN8+YNcBWGixaR5NULfqJEYP1A5iCxkr8ewd2ZosU1Mbb0g?=
 =?us-ascii?Q?t0SyY5m/4BfrEoIe4okRdUM1VA01OllXcwGI2NqIJ9kn9NbIjvCpRQPT2XXt?=
 =?us-ascii?Q?T7AhPgKMMkheoiK1eVmjWv4yfpdzOe8wED6JnV6kQJnS5po72MQ+/qsiE9RG?=
 =?us-ascii?Q?rjcUBbAt3KfovktkdzPoq3IqhS7B3eiF9bC/F1sngxTS/r/htvPR83e6LxG/?=
 =?us-ascii?Q?irOOtxYbf5oy0dPIfKu1qRV8BzmJXbQ8Cwq1wtXgN7KUQHVo4NQFTwpCw4tz?=
 =?us-ascii?Q?Cezku+Ny+5S98mP6JYJ5Isg9E6x2fdtDfnQecDzmcNV8QvbY4jWwt2UG4mAf?=
 =?us-ascii?Q?49Jj71IL50r4brFZYLqgDtlH0B5OsHEca8GlFCtK70j41uzev5A1frpC9bHJ?=
 =?us-ascii?Q?MUtLaL+JYWCCyX+Xc53ljAAFrUo8E+O8mEbw7tPWOEhQA7voEzW6pBC4sDng?=
 =?us-ascii?Q?PJt4OxmcgZHo94iK91GbGFkambgH3+adFfwHWJbib9mlX8uxTqxl8odIqOY9?=
 =?us-ascii?Q?nrtqC+AQqKANick0nngXwrR9jaYVJW13D9wr61ZptVVnd3nyiAwI9mabmHcM?=
 =?us-ascii?Q?gKMOaZbIM1WjBV60Ij/fLquyskYueteyoNEvsjQ9OvBdtc9nPkVlpNw0POFa?=
 =?us-ascii?Q?ZYvQh1uAN3HOmzJF6VKSKyO+CaFLe4QQ859botM6GOq8ANhmGqSpo0AWzJoq?=
 =?us-ascii?Q?wxJHPeax3Ujp3fE36b2R/NuzyZlfV29Yw5ba2uJBijeCgmsu2g87Qha0wQrn?=
 =?us-ascii?Q?hXP7BdrfUKGZewKR6bpyxf/aljdczUzErBXIV0Iq1ihzoJIXhvtfm5FU6Xw/?=
 =?us-ascii?Q?9Wq2cSKbIQ4Nx77eQLXgXAHlHZ83hcdzzvzYbki6txBeQCUPyBfNKRvYPlLh?=
 =?us-ascii?Q?U0FT6o8VV5h656yJrc6b+gi1bKPYF/0IdcDGR2u7QOjolxVjrt1gFLthYim3?=
 =?us-ascii?Q?rqe1V3ccSJObc8ng++oKthKWM5dHhbc9x4T/qZIYnM0hc60GHQMM8Yaj3XRg?=
 =?us-ascii?Q?FlhBWKbmG8Y8PGsBROy7cmMqft9cP8/pZAzFbRLO2iaoVhMMnbj60ntJZzvF?=
 =?us-ascii?Q?SiC4SVHqJBeDlCfB9bYZG49FxH8Mf+MOeuj7WdAyrR0KmDprta32EagpHz2J?=
 =?us-ascii?Q?EojNVPza9mgKnTxPz/GYUnu2hNWFUvgOGrZmFyCfa4axUxokJpXiCyZ4glel?=
 =?us-ascii?Q?XBgrn36eVxC0FR1uOn4b6bi5mKppKznZkNYQUsFs2Q+2RLNKKvdTA4JumGDc?=
 =?us-ascii?Q?tYDq6vs+tSEKL17dPKmxgFdViK8CEPhLvZFL9FTVdebRDD/Py+HrViLjEMs1?=
 =?us-ascii?Q?VmAbimYTBYtxTUzvjCQfTfI3ODR+Va8YLQYZlgQrNcIQxCO3lJIceChYPpL3?=
 =?us-ascii?Q?Oc5ScFOXk5NNTHOPpNc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:48:35.4716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bbf2ca-c86c-492b-2928-08de28d2603d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407

Memory access and ALTP2M are two seperate features, and each could be
controlled via VM_EVENT or ALTP2M. In order to avoid implicit declaration
when ALTP2M=y and VM_EVENT=n on compiling hvm.o/altp2m.o, we move declaration
of the following functions from <asm/mem_access.h> to <asm/altp2m.h>:
- p2m_set_suppress_ve
- p2m_set_suppress_ve_multi
- p2m_get_suppress_ve
Potential error on altp2m.c also breaks Misra Rule 8.4.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/altp2m.h     | 10 ++++++++++
 xen/arch/x86/include/asm/mem_access.h | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 8ecd74f363..9c1ac3cc26 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -46,6 +46,16 @@ void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
 
+int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
+                        unsigned int altp2m_idx);
+
+struct xen_hvm_altp2m_suppress_ve_multi;
+int p2m_set_suppress_ve_multi(struct domain *d,
+                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
+
+int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
+                        unsigned int altp2m_idx);
+
 #else
 
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 1a52a10322..257ed33de1 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -34,16 +34,6 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
 /* Sanity check for mem_access hardware support */
 bool p2m_mem_access_sanity_check(const struct domain *d);
 
-int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
-                        unsigned int altp2m_idx);
-
-struct xen_hvm_altp2m_suppress_ve_multi;
-int p2m_set_suppress_ve_multi(struct domain *d,
-                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
-
-int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
-                        unsigned int altp2m_idx);
-
 #endif /*__ASM_X86_MEM_ACCESS_H__ */
 
 /*
-- 
2.34.1


