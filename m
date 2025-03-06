Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB5A54522
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903112.1311088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mY-0004Tu-PV; Thu, 06 Mar 2025 08:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903112.1311088; Thu, 06 Mar 2025 08:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mY-0004Pl-JJ; Thu, 06 Mar 2025 08:40:42 +0000
Received: by outflank-mailman (input) for mailman id 903112;
 Thu, 06 Mar 2025 08:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mW-00031D-RJ
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:40 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f403:240a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2e641a-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:38 +0100 (CET)
Received: from CH0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:610:b2::20)
 by CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:40:32 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::bb) by CH0PR13CA0045.outlook.office365.com
 (2603:10b6:610:b2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15 via Frontend Transport; Thu,
 6 Mar 2025 08:40:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:30 -0600
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
X-Inumbo-ID: ad2e641a-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAu+8fASJam+A4Dv5UyxArKvfBDgkxo/o3EFJHNSwMrqaLJLyNNl2EG4VzfusvU4XWmIzo7jLPRMvhLcy2OA38oMid+1Yjz/nHCgHjcgsbTH+Kt4VTBPSHWAbwRJpYGl7Si9Rzblqjk0cXxErGV25eCQ88KgaCossV4C3cTEI0kdnSvpt7ulHQY5m2AfXVaY6aUSUG82NUcWlx6orLH8hhSNJmMoP4ylRa94zpGaDLujV/fyltnqdbt9Sr52NAWKZ+E5lhyJEXm6eWirjOJVZvSoe9cpXcCOIE7TzUXkkxBVOS+uz1efy7TSh1EQ2e/V6/rzpM83f1znOHKIuvIXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6iDSLQoooiR5gm7higEaAq42NXQT6TzllxZUAXS+Vw=;
 b=YIBxtLaB23F+Vo+H5jza+Td797DaQ0bF7LLE2xi9fQquv1FUIuiYPlC4awUKxYMZSB2aXNrRNwVWlErNPLg+Ho1dhHmC5+j4NJMAy95TfEMkS9xteD7WKWnA9D8J/Upp+WiNGPoWQzj3AbFcsV6gtxlbAfB993vJsBwJQ9AewernThzrHgpRXIuSWjPBausrgMxho+hu6LJRIi/3spZgIndgzgNdrvlqEIVn4TI9ZJclVu3Y9E9tbjAlTE9kZpVihltqtEqsZr03rqa2zFADgb36uf+apBNr65I7ks+ZfJXXIfT9th9/zlRMtFr1TicrWvsvLVjCErmcdshgen1TIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6iDSLQoooiR5gm7higEaAq42NXQT6TzllxZUAXS+Vw=;
 b=XV9OozZbO7q2Ib6tTb/hmGRA+mgkfwMIunH+M9KwFBzKnUjYfq9cEkXISnENMOsuPIcw63t7LOI6cltoEaWXb/ZQXHGtHSf53mguq3PcZvPWXvFdLOF7WJi38Krgm3ZP5/7DuGyFYlJlFtfAjw0uaQ4hMZvqDkzwhHR+G7mAeg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3 06/15] xen/cpufreq: disable px statistic info in amd-cppc mode
Date: Thu, 6 Mar 2025 16:39:40 +0800
Message-ID: <20250306083949.1503385-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|CY8PR12MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 7465ab14-b1ac-4cf0-99e9-08dd5c8a8eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EhxPXJVmpEJGzpB4IstWSTsDcA2IlljFxTwU/gv90KasrD6PKXFV6wzW1HtZ?=
 =?us-ascii?Q?/i2jt4InqHbqqwkuenpEXCyEw2/5WHUo593968/zCxUAGlB6MdVPC159CjT5?=
 =?us-ascii?Q?CtwZgdL67j3f2bS7FZkoQQzyfKEsd6oh/xEHdSJezWH46ybyw9kKTXZtbNUC?=
 =?us-ascii?Q?mVYzR/tE9Vo4oM/0VLqDeuacatMwPa4gsnSfojIY0S43BGnhuWZQDwZ9PUfU?=
 =?us-ascii?Q?o54DbiSlf85/689BpkixnF8MSmGQXwWK1qp0ftwQDWkfdFGNJZmt/1rAWSBt?=
 =?us-ascii?Q?UgT+kfOT+n//fcsQvJ7af1QE+WW8bHXB/Sqfy782QY1wEgwzc3/QM1o03KKK?=
 =?us-ascii?Q?TnZiLMlP4DgpTeJ738IJdBwCrYgID0C/TVW7DQzAr/60WqB27jfNnpRLZ7QA?=
 =?us-ascii?Q?YCcTdEc+NBQu/vMu1kjI7EpwBaW3iPcq/yb6Z0FG+wzVKz6Frqk4z1/XR1VI?=
 =?us-ascii?Q?naJ7qdEITcr+ouewL2aqIrq1TApUwiLN+CQpM9P+5EP08M7Wv3UGZYz8kZU0?=
 =?us-ascii?Q?PWmWUBffMAFAuhRZ0/p+BxlWJKUJgCdWyiYmjApr+ynmws2VLn38UasgWPx1?=
 =?us-ascii?Q?lY1PQZkKWI2/VxWl3M5HhsxDVrwlEuXsW62jL/DgV7fuaqPC9bJmPwp6o/mk?=
 =?us-ascii?Q?357BtR38tUZSz/lo9gkv75nKeL9DV4JEuLgsFfyn31UOnftM1kaFKn/4MHOq?=
 =?us-ascii?Q?sRDIAN8VghPfovvaif0SRhGLrcMduHQk6eztO26r5+3THtEojSptgyMOMgvg?=
 =?us-ascii?Q?mTUS+vWr984LMyHaAF4Eil6JOWYS2CZLlM0+3kq8kH6DEg1LLyf3oGrt9kSJ?=
 =?us-ascii?Q?FQBXgbBBayIgXqEbqVPpiX5J9NZlBx3uhLo7tFgI3dLnjVeA2MaQfVSNeqC1?=
 =?us-ascii?Q?Yg78HhuLc3agJO+2zw6oXjCHlD/RPHZ4xK2qCdYYz1vyDlEShIyAuCYM56T4?=
 =?us-ascii?Q?z0g65bZxUC9ILtGbCocF/umsZx8DCvihA+MoyIHfWt+hkVqhNlN/SXB5EDhe?=
 =?us-ascii?Q?fIciVmByl3npwWNSmPDrkDB8NTs632zAxBoyaNdtGWPPWHSik++HlBKpFMzG?=
 =?us-ascii?Q?Zad4qM3lbfjIZjcp2nmGzl7TNKmZoDiYO145xUAi504HlrFAT6MZINuYV0Pg?=
 =?us-ascii?Q?Yn/ZpvBoSE7ZzvjmNnfyA0Z5zDc1qaLSFV0Jtr6ag75rHcehUBweUzCjWyhl?=
 =?us-ascii?Q?+AHfcn6OrEx2wKO8iwSWoSN2OmFE91cTK3jFbRyjeDDwMA7YFYhE9zxPiH7h?=
 =?us-ascii?Q?nXrPakqCkLNN2DEhiz9IRqOEhkdW7sFptFdCdD056v542JveJQAftLbzBor6?=
 =?us-ascii?Q?QlCffLVf7MT+oI+XHMBylngCHI6P+Ymg73dEKARJkips/mlYiwYF16AFHd1b?=
 =?us-ascii?Q?mGo0RF9HTgJ01ZQg5/GCrPij6tNb3NZS/GMLYCOWV9+WYDQVlYnZUx2kK7Dx?=
 =?us-ascii?Q?ObzvVxEV2//h1AsVu+SXyeUzWXCOs6CgUBWmbPXwkn0HEs96WZdB9ziXoLCU?=
 =?us-ascii?Q?M1uvo6xPOUeNHLE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:32.5008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7465ab14-b1ac-4cf0-99e9-08dd5c8a8eb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337

Bypass cnstruction and deconstruction for px statistic info(
cpufreq_statistic_init and cpufreq_statistic_exit) in cpufreq
CPPC mode.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/drivers/cpufreq/utility.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index e690a484f1..f1fd2fdbce 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -98,6 +98,9 @@ int cpufreq_statistic_init(unsigned int cpu)
     if ( !pmpt )
         return -EINVAL;
 
+    if ( !(pmpt->init & XEN_PX_INIT) )
+        return 0;
+
     spin_lock(cpufreq_statistic_lock);
 
     pxpt = per_cpu(cpufreq_statistic_data, cpu);
@@ -147,8 +150,12 @@ int cpufreq_statistic_init(unsigned int cpu)
 void cpufreq_statistic_exit(unsigned int cpu)
 {
     struct pm_px *pxpt;
+    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
     spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
 
+    if ( !(pmpt->init & XEN_PX_INIT) )
+        return;
+
     spin_lock(cpufreq_statistic_lock);
 
     pxpt = per_cpu(cpufreq_statistic_data, cpu);
-- 
2.34.1


