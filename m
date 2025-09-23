Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1974B943C6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128120.1468595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0unz-0000sk-MG; Tue, 23 Sep 2025 04:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128120.1468595; Tue, 23 Sep 2025 04:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0unz-0000qX-Iu; Tue, 23 Sep 2025 04:39:07 +0000
Received: by outflank-mailman (input) for mailman id 1128120;
 Tue, 23 Sep 2025 04:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0uny-0000c8-FO
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:39:06 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c04f00b-9837-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 06:39:04 +0200 (CEST)
Received: from BYAPR07CA0047.namprd07.prod.outlook.com (2603:10b6:a03:60::24)
 by DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Tue, 23 Sep 2025 04:38:58 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:60:cafe::f7) by BYAPR07CA0047.outlook.office365.com
 (2603:10b6:a03:60::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 04:38:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:38:57 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:38:55 -0700
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
X-Inumbo-ID: 3c04f00b-9837-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAPBZSNR2acgG6nBwl90pC9kJfxulfzebqCFOwTWBprooMzhQY8g/EvGMsT3mMbwCa8IgoGzCw8M4aU/1gxSIH2MnfpySMQVIVgkm9bOXzSRto2fgu72K3L6J5hZ/grkVIF4MHigAbQWjNYrHoZ13YmmfOr+PGiPH7OHrM+OJ1yKt4Oro570VNXW/wvzmKXJaT/Fuwe9i36UEUrJAbZ6vGGcK2VRcqZ0qsSFSUN+MkCac5wMpXpQVlgezhGL29JLhw8CHF7hGW1T/mjgZeAKLj9L3/D1FFYIW7MOt4jvWkryKVTfb3Iqbb7oANDMq9D1py7PHK4B5tPqwwQkFeIcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU7mqu+2k15Y3Xtkgnh53PzMeEkvcBNFuqW8rgIayvU=;
 b=T2G5dmcEakVqML0h3RQEmIBSkfSICArv/61xw2BiOokH+9gIcY0W7HsqgLQFYq4sbpinKMMWTjLnr6roF3tIbpuWidvt2vhMXMbgrzyxmtJyE/NZdHl4hW0nv7R7cxV8IA+eTSY2mVUHph1Y59dblwF3twENoLToM9bkat4rKhGn4LShIi/HLrMGXZMZd5TT0vT43/9TcI2ecJua89BxMG97L3l9xGRfzmV2E8CEf+9HfU/J0i+rWQO6qisDI2FgEwfeWydU4Ap4nMu0+EzD8Q4Y2vguYo17fiyG4Qq0yEIaMbc4SiHo+Hjk+SHCSMF8dn1jgQkp+HrmOcDILfARLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU7mqu+2k15Y3Xtkgnh53PzMeEkvcBNFuqW8rgIayvU=;
 b=sndoIAf2Nd6eaUyOpBwXJvONU0XlHI6glJxBPTw07+Vf0oPvJZQBuZ2mXI+pCGubQRE7u4fgEW+d95ncuRpq8Ts71zcIR3wkAo6M3JwgBQ2QmcG9aI/zPMc417nvBBBh3IGNXOiDc8jeOhIvtigx7t1UJUxIK1sUE94Vio89Dok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v10 1/8] xen/cpufreq: make HW_ALL the only expected value for CPPC mode
Date: Tue, 23 Sep 2025 12:38:19 +0800
Message-ID: <20250923043826.3831957-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923043826.3831957-1-Penny.Zheng@amd.com>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|DS7PR12MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1bea35-8364-4f5c-6063-08ddfa5b1c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yu3XZ90LrO/gZWVWoecPO3jhB/ppRYH61JWuS9TF4XUIHJb3wbNSTeZEJCcJ?=
 =?us-ascii?Q?xyUjgq8z+G9Xl67owK+r8riOs70O63TfMAPs3u4bzfgm/jK3mp9Nsu8PWCSq?=
 =?us-ascii?Q?s81Ybtoxl3KxXVsGhuPavqyKz7nEd1PH4G8rHf/eiWrDvFNRk5OxFhRgoHC+?=
 =?us-ascii?Q?e6i4SYzHpifOqJLUSCUAiK2cv1gg8dEx5Q6JA/fQU7hUxZs9tjxEdZ1jVRAo?=
 =?us-ascii?Q?mKrOGJa15HLs1A3bv9sh0nlcGkyW80ezSWcPbUxPZEBOQ+dfacKmLCSC+SvZ?=
 =?us-ascii?Q?HlDL7blu5b+ZKKso7YMaViUvmsjn4rrztr7CZ6VmTbddjLG7ydT15DhdRYu7?=
 =?us-ascii?Q?sXDahVn7V69+GgNZ6JrztLiDImDjWFyCuhv+bw+5h8mZfVp0VFr1q1HmtPsY?=
 =?us-ascii?Q?T5nJQlARj88/bspJPc+AA2Ufd3Xu2blBKyxoW+wKtF3+lkbFttu3WRuoU1x0?=
 =?us-ascii?Q?X5tYnCboyP4cT+QOPgCu/gCye9CzR4fspRNS4Ih77Unqe0rqqsmqLBBJfK7g?=
 =?us-ascii?Q?8jwSVN9g+DhxLxFtMW5iwuyRu5mmmSQ0N0MzHs5agkvI09xtBqP7Qn4EdhMA?=
 =?us-ascii?Q?phHLApEzuxWewR0fk8w2LjfeH8PSurJnP3+jP+X3B4giJ/Hy//+ozpUbKKme?=
 =?us-ascii?Q?f8ndKsGPMQLmjea7d2mdm++F9nh5zz6thvGQqobbxk6UxsY35hNVAVYwTIE4?=
 =?us-ascii?Q?NFOMeEW9Acf4Ns6f9Fo5NG+JWQnxGty62BaQ/Hl7zASePeMI8+L4M1lHiBgJ?=
 =?us-ascii?Q?CMYDFJgy5USlepi8QY4pI/4DX70BvHeu2WuDvDcVrGSqaiCRoOpC+NfuBr8c?=
 =?us-ascii?Q?v/Kf2F2SJhOH+816I1lvMdRKS6BR2iLDRA0vJ3t6NlpDP9n+ydZnoXelLuyV?=
 =?us-ascii?Q?SqzClfAYZYX1RGdN8LHDV58WMIaiKh96WeHfAsndqs15EHO2XiUCd/nc3Hzs?=
 =?us-ascii?Q?in5xBxRTI9ijZfeppfsaGyUJoGVMs5rdkRry7fS2yhQbwvoimNZrXpSjdJ6i?=
 =?us-ascii?Q?KRD6MtlHYCfIGY/QnSBqKDJMVxiVKSwIYlWSdV3+P02k2R758+XLAglzdX7Q?=
 =?us-ascii?Q?iqYf01T1En9f/eYPZNgbCP8+iqpu0kUn+dEJGprAPr3IeK+CrRGI83hwTaw1?=
 =?us-ascii?Q?OMbDREHvc1o5d63R22w7WCs8fcqrZHjOs1whCkCyXFzhuTFT8OiVcHJaAC6+?=
 =?us-ascii?Q?BPkz4YGhmp8889K9sCupaW2wtfLHpdRXECO8qoeVKbY0pWshCsqpD7b7a2cj?=
 =?us-ascii?Q?uIrnQ0kvIxKgmj8W9KG/P/AgdvFaLbzP0eVLEzGSIJUubaAdHIkXgxfriYxB?=
 =?us-ascii?Q?KkSGdVXgc5UvLvrNC/uM0twP0LOLFFylqaDhNnb4aJxq2HcHobEAwqq46Hk/?=
 =?us-ascii?Q?AoS7l7UJMOnSpo+gPgAHEkOONOHsta0YjI9myG2GtkG1sDig7JlTjNmcvtBo?=
 =?us-ascii?Q?vxYp3f5J5JtpcjBVyK9YSjy4W48z0xefLTvX0JiK8xWrSEpu8TlHh7AlG5yQ?=
 =?us-ascii?Q?TCK8qT8jh885i2nj09nD4F/q/adfnGMve8D5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:38:57.8117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1bea35-8364-4f5c-6063-08ddfa5b1c41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022

Right now, no matter for code construction or hardware restriction, HW_ALL
shall be the only expected values in _PSD for AMD CPPC mode

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v9 - v10:
- new commit
---
 xen/drivers/cpufreq/cpufreq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index fe6bd7ff25..4b74f5590b 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -765,6 +765,16 @@ int set_cppc_pminfo(unsigned int acpi_id,
         goto out;
     }
 
+    /* Right now, HW_ALL shall be the only expected value in CPPC mode */
+    if ( cppc_data->shared_type != CPUFREQ_SHARED_TYPE_HW )
+    {
+        ret = -EINVAL;
+        printk_once(XENLOG_ERR
+                    "Unsupported sharing type %u in CPPC mode\n",
+                    cppc_data->shared_type);
+        goto out;
+    }
+
     if ( cppc_data->flags & XEN_CPPC_CPC )
     {
         if ( cppc_data->cpc.highest_perf == 0 ||
-- 
2.34.1


