Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07D9E157E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847308.1262467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAd-00017I-HE; Tue, 03 Dec 2024 08:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847308.1262467; Tue, 03 Dec 2024 08:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAd-0000tl-1R; Tue, 03 Dec 2024 08:22:11 +0000
Received: by outflank-mailman (input) for mailman id 847308;
 Tue, 03 Dec 2024 08:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO99-0007ic-F3
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:20:39 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2417::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79d08f79-b14f-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:20:38 +0100 (CET)
Received: from BLAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:208:32b::27)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:20:34 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::8c) by BLAPR03CA0022.outlook.office365.com
 (2603:10b6:208:32b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 3 Dec 2024 08:20:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:20:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:17:51 -0600
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
X-Inumbo-ID: 79d08f79-b14f-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCasWjSrBn73oZePdaOjykvj9DvWfyLaNBvz4Pb65V2+d0slKzhKCtkau97Cj+F1gOjmzBsWv6TLpCyeSD/WI8hTXFu4v/alXuR9OBimag+c7POGBFYcYLM9+tq9I7ECQfC0dU+6Zn5IbcOR9oqcSp1KYNFBNWdtqW4bxUpN1uHpXU2UrDyd5arK4nTLfIYJM8/V9+YlrccIFF5O/9Oh42YeIDSo533NOc/0lOPOll0aGlQRgyfIvDXImhG0s15tfCUKMdAlj2mvrW1axAbwmUO3VReKXwtu6EmJUBHOctSu9TOU2XYMQk83D2ROXQWj2wz92gZVgV33KmpDiwh1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QP5qhZll8rzt3zPECYH2FuNf7IFpUiVXoJ+eD0kzQE=;
 b=YulXtlYwlYGAWLtwVoNft5q8dsXxCuFiA4hVUA1x7yPsIqckyAhkruBcwZP+Z7/5DNjbyTS39Uzda4mmljFSNSPS3p9uROd9YYiXMohr3RahaaQBy13H/FjhWDg52Rj8dkj6dBgLLaJ6D0//24+PNk/bDqGw9k7OOjZ3C93Y31gUkT/Nw8+LD13qqT7lK0kawPCJ2kS99mNHntvjjEOpRPOABNhDs64MpTZH6TBSTHUoQz4aWV/DlMV1H5YRIbQ1L5fqYUJ+IqM/myuvKTjTu4VcEmMdtxGKl28V4RugBEk0uW/augUODSAupOhWEXklFUBv68JE/N0RhpIYeEMOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QP5qhZll8rzt3zPECYH2FuNf7IFpUiVXoJ+eD0kzQE=;
 b=aCoskza9RnJbZJUb8uBVTJKSjfl3C9JlmbTimDbTVdACQ1zPsHjbtQdq9odInIcQIhsrJTDvGzzRGvRl55AdgUBd9ak4KaYqYzeBfQkxTsjCGqzQR8VAItNWU9vJUO9xruKiMHDlC529v2nmg6zTWmhW14GiCbzWYibSRtgSG14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v1 07/11] xen/cpufreq: only set gov NULL when cpufreq_driver.target() exists
Date: Tue, 3 Dec 2024 16:11:07 +0800
Message-ID: <20241203081111.463400-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a14cf4d-fafb-492b-b2e9-08dd13735b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?921LlBPZ2eJqUf5e9rFmvuEBZkws5TWNjbo5XpuBJ49MYj+22OCW0g2Es5jX?=
 =?us-ascii?Q?c2w7ABRnXlhDnePGW069Fxgn2oGFYr3CjmP88fpzjAc1OR4qcI3okByYxLZ2?=
 =?us-ascii?Q?5hxaM7SL3Qkom7+ELaYh5LKX11TmyTz770V4UhZh+32clmQvV7q0wkasGoKa?=
 =?us-ascii?Q?f4aY8RPkyjEIv8Pi5HF327IwYfURVEL/ISoPrsBfnMjqLCB7GqLD8Wa/kyN7?=
 =?us-ascii?Q?5vjhuLGCoj+ZwlgM9zcS1IjKefbtBclpu4UgfvrYrchA2HNvi/4ShxRIog+w?=
 =?us-ascii?Q?in5zwfYb5ZQdVHuVZkxna2qjs038q60O82Zx4t3K2fxfWa/7MS8zicZ2itm4?=
 =?us-ascii?Q?w7AdKf9Bsm9VGud6RvmW2vc64vvhOfCpVLN/KUjBSkmic+/FaE+0ys4sm+xF?=
 =?us-ascii?Q?9IZW95jczw+GdFPF3Yv9XK4K8Oy6xOURkxR8Rw/hQnc59J0jqwc42cZfD+jB?=
 =?us-ascii?Q?PqH/7eI5O7hiQQ0t72MN0ZQRMkd/ScfAtosMo4zOAPnJ8Hgz2NNBPkKCN2CM?=
 =?us-ascii?Q?Iew7VwuwwkkYLoVJJzW9T1e5e1OzJEbqU5igIIkJJB9mwAbrI0x4x07SIPYN?=
 =?us-ascii?Q?XqL/JIgLDsbEtnorQ26L/INXcReLxgU3LdAfjK+yObwP1Bqbd5vyP1XCiTpi?=
 =?us-ascii?Q?uh1e2+4T8akMYjj8IKgwHDmp3pFdwGtnPrHU4guV4DEofVWeQdeginVc2eOu?=
 =?us-ascii?Q?jelko8Px+hBYU9AbU75QwKuTE8GCjdHNDsksDsijyswwrihx5jAxhHyCWMGc?=
 =?us-ascii?Q?fNIIQMnxDVwK1fNNPnTP4ARQ7EI/e3izyO2vvpsar3V+ohdOzRCvW+mqb+lE?=
 =?us-ascii?Q?0NeG/Yopa9RNRV8HxWZ7w/RAMcaI2MJMPM3ZSumgJaBXhBC+C8qY90J4P3r/?=
 =?us-ascii?Q?Sfnxv0DpculM3xGPftQYGKEQq4QGptHApZHrQ8QDyngqMmY7GsZWxz8N/Gjv?=
 =?us-ascii?Q?WidFbIo71oHf+ZR2z6krcW+MAuQAiJxHs2ugI1H1puQC2Aj8+xMiPTSarbdp?=
 =?us-ascii?Q?LsW1i4LrFPXj4Mdjj7v+wQ02oJj8jgMoHguK/yVnHHZC2wQWdx6pJCe/YfOR?=
 =?us-ascii?Q?5sXcKT1zayWFWKzRddn96W4qR0WxCSrHi8C3lSfQOREbNfAKTW3u0sRPSJ47?=
 =?us-ascii?Q?/auUK4HMmZelge5ppY8vQrUmvVpupAW0Cvk+sYGp1GyukfOldVcD1Q37VJiZ?=
 =?us-ascii?Q?1ghWHp7Eeu4TAeeQaKtz6g685IrO7R422HUmiWgrl0DZLZkgIoTUr1TGdanC?=
 =?us-ascii?Q?0aCGidAXUBZsyKUamvx888EOE4uRiF1j87KPJ0Y/RTcw+oXbDdtTvggdGGET?=
 =?us-ascii?Q?80WnVDxVrBzAtMPduc459fX9MVTfcBM67/dnURS6+b7W8PTYDwa1cbZDCYim?=
 =?us-ascii?Q?fYTF/eUM0KV8m5edTkKwaQwOxJUtktVFRjhd4ca9YrQq9Ied5gAOhdJWxTI5?=
 =?us-ascii?Q?huK1LLrvoe+y6HiOxhy2+6J1ooidbynL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:20:32.9773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a14cf4d-fafb-492b-b2e9-08dd13735b4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147

From: Penny Zheng <penny.zheng@amd.com>

amd-pstate on active mode bypasses the scaling governor layer, and
provides its own P-state selection algorithms. Consequently, when
it is used, the driver's -> setpolicy() callback is invoked
to register per-CPU utilization update callbacks, not the ->target()
callback.

So, only when cpufreq_driver.target() exists, we need to deliberately
set old gov as NULL to trigger the according gov starting.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/drivers/cpufreq/cpufreq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 54d554aa4f..c170a2cb2b 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -316,7 +316,13 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
                    perf->domain_info.num_processors)) {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        policy->governor = NULL;
+
+       /*
+        * Only when cpufreq_driver.target exists, we need to deliberately set old gov as NULL
+        * to trigger the according gov starting.
+        */
+       if ( cpufreq_driver.target )
+            policy->governor = NULL;
 
         cpufreq_cmdline_common_para(&new_policy);
 
-- 
2.34.1


