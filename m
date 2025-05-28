Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F10AC658D
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999069.1379828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvJ-0003EY-ON; Wed, 28 May 2025 09:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999069.1379828; Wed, 28 May 2025 09:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvJ-0003B6-KE; Wed, 28 May 2025 09:18:09 +0000
Received: by outflank-mailman (input) for mailman id 999069;
 Wed, 28 May 2025 09:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvI-0001jE-96
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9c3109e-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:06 +0200 (CEST)
Received: from SN7PR18CA0015.namprd18.prod.outlook.com (2603:10b6:806:f3::6)
 by PH7PR12MB7020.namprd12.prod.outlook.com (2603:10b6:510:1ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:18:03 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::fe) by SN7PR18CA0015.outlook.office365.com
 (2603:10b6:806:f3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 28 May 2025 09:18:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:59 -0500
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
X-Inumbo-ID: a9c3109e-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjZktzLymzXFzcWhDSCBI5r+c61LqGTP9wQk1uLSrasc3vk0tN3XX+OIDDXTKw6ESRQ51C15cuWvlRNUY/CHi2+nJzvCjCmUywb0P6nuGzysEP98LLGrmSJS1cqCqFJZ2jmrfxayspKhpEbXv3ceuTzvRdCQFdPDADcrP3V7zLoKMU0VlIcGa81Idp1g163Gj8GZm32eS5fu3iilI/psR3v6TDb5VhNpXcvXvKbkoYaqtHIU2yL97PljonfQvDXvi3zgdiyuDbzwAUna81OJvm0X968/JGsK+7cMJ8RU0ktRSkl1wYct+sWD33tYN0dUxE8EE0yVplNztK+z0b2gZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=O1jgzCCNksDS/8lqvCGvC2v01yXBkUh2oRtyR+Yo43gZA2eDz09IBagq6h1Dfd0zvnIYbDRHT0cnvndbC8+0lE3dbAzKtkkz4U2ETwF6+8mtulNBMtMtwlNmsXcpCXTZ32zs6O+FkTINH14d+FHhualayug8tpVW0z8rL/zSTfBW6T6ueZmh7WCu/x3ijDMVKCTHDGWGQngxmONyC93v4x2Ql58SBTjvMZFbwCIa+XRtMVCzuqccSqmXcVB1cF6vA7K4r5/pP3tlGWHgPZktvnJQ50V+UAHx+1n0W4f0Gv546m8aH159XVagehpfQaWTr+/MjiorfX1EJTisvIUaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=T9HC93Sg9ZujVTZ179v+ooynKI8q3CAEGWmC1UAZjQ5IrE0wtzm2C+qRAsHaZ7ggNf9P3I+0XvzKDvIPSttApIzGFQLgnkIkk6VDApcMHQoMjN8O38bQ27tHkw86TEG+R55yTJAUSRAXjIahoaN4fes6cP3FuidMhVVj+x6QNcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 08/20] xen/sysctl: wrap around XEN_SYSCTL_sched_id
Date: Wed, 28 May 2025 17:16:56 +0800
Message-ID: <20250528091708.390767-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|PH7PR12MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 9509008b-acce-4e44-af6c-08dd9dc88c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dwqw1CJ04FDWf9MVfHsVlWuImI20jFrl6Ajm86uJsW+x8oGBpHqUq5y63qzH?=
 =?us-ascii?Q?XdvM6DjXu1oIYfhnUITfKlVWRWgdbrw0cxWl91cmrA4yghh5boCN3ozP2yrr?=
 =?us-ascii?Q?PZlr0NNGf1vo1d+wJDy40zpxdDXTmRi6vhxNAgc7bNgWoxoeZP5YfdB5wg85?=
 =?us-ascii?Q?1remH6jK2YEZAHJr8xT18I+GeLG4KgUDnAzRDfLTEnZ1KuSaEz2Rmk/vDOGE?=
 =?us-ascii?Q?oCRdxyNeuwmFAFNF1U0haOOLOQv4rPKntYJLKurzfRZEKW5SViackie49Vka?=
 =?us-ascii?Q?Xl8mK01huss0fgSAaFEPyWGaQp3uvmhaSHJhd/2kMdYH+kSMHlrk0scFDaKX?=
 =?us-ascii?Q?9gHZnKeks0Wcj7VRgAFhivAoTR/wbgY2uCKb36ym6QCMFnGDB/0//tQHvTr6?=
 =?us-ascii?Q?2vx9kU1x8h8XdbTZszOl/ZGg7CHe0iG0PkE6lTdQyrLzm72fdHCYdY7tFZeS?=
 =?us-ascii?Q?bZoyfXZBiUU50mievaWKanKIz38jdFhltMLiqMIfsi0rxck3TqBXRAJ6MoMJ?=
 =?us-ascii?Q?JbJ+Qr4yt4cnhO1yOUDV5CiZRndlOqZRJqoMeImjV5iT5b+vIVxrH4GSsEmw?=
 =?us-ascii?Q?9cMbPpTmexKhTErMX8Lffc1eT4t+AS64xoLSDPRga8CxIPn5i5Nj5pQRrnon?=
 =?us-ascii?Q?KSn/2Xfp0ZEpyLR3iYR23cA27CRMWffl3ciOg2sP4Adl7ae3Mkdb5AfGfuCe?=
 =?us-ascii?Q?H7SuLPQL9MtFkUR6ENpVDHlw4aa8sy8V9ZPbVMUKIf9+BMSjy6wjNdn8xNIP?=
 =?us-ascii?Q?Y7Hz6V8VP57EjWrKhrSInFFDLFdP9f5cZc6+hhEZIJpuX1rljxyuZKPOraBB?=
 =?us-ascii?Q?qaCLsEZfwzOn8krXZWgB2NBZnUdc88W8v1O9W2ib1TQmGP37IwL+DDIe5cY6?=
 =?us-ascii?Q?gDVWAwynOrQh5DgjNNUQyfqBJQXS37ik/FOfJUiQkOtIu7DLnMVYaXCrNZy0?=
 =?us-ascii?Q?Ijjor1u/c8anZBcsCY22rPAYJRbtcCWwW+v0BG1w+O7Tzj0xfygXUFWg4CTH?=
 =?us-ascii?Q?oZ5ueoP/6s9T5rn/vWKVwcyshofObX6n82I9kF1338AljqHwWARS6pXZIbMV?=
 =?us-ascii?Q?m6qvLNfl7Bhsfr/KcRRq4x9qUKOWiigfB6ppgx2F17yKJpOW7xkMi1sTmE1g?=
 =?us-ascii?Q?UpCvucuZGsUZ/HMWPDNR1Gq7HlmlmgM6byORKXeByh92y3HOlQWx2PafyONX?=
 =?us-ascii?Q?8VK/NRH1/hfWnxCqB+M4C2nX9MGob66wSDFqiBt5rGWLrsDx3g/mgS0nGNx+?=
 =?us-ascii?Q?J7m2koVKBfVhGJ6W823S8ej+1ZKg/lcBp2usMPh023vafV34c57Gw1aH1Yla?=
 =?us-ascii?Q?pzrMpUtjPwzgGexR67MMJfIXg6GQ2epk4bQiylDn2HC49PymnUfyLedwGZuR?=
 =?us-ascii?Q?t0teSyDRpOZMhnIbnO84NP7GNTWA5DkvAwGJ1Y/8R+3JaoCt1vKcfXCG+uHl?=
 =?us-ascii?Q?snz8xV31RFYHHJD+vaXI0MNHEeQk+HhyTVzLB1ZsNPkVOJcIu4AsWooi/7bs?=
 =?us-ascii?Q?VAh5CHj1fhL/QGDsteR8E6FFfRQCVVAlQGkP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:03.1578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509008b-acce-4e44-af6c-08dd9dc88c78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7020

The following function shall be wrapped:
- scheduler_id()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290..13fdf57e57 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2069,11 +2069,13 @@ long do_set_timer_op(s_time_t timeout)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /* scheduler_id - fetch ID of current scheduler */
 int scheduler_id(void)
 {
     return operations.sched_id;
 }
+#endif
 
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
-- 
2.34.1


