Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82AA87924
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949118.1345784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERo-00018L-VQ; Mon, 14 Apr 2025 07:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949118.1345784; Mon, 14 Apr 2025 07:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERo-00014c-QB; Mon, 14 Apr 2025 07:41:40 +0000
Received: by outflank-mailman (input) for mailman id 949118;
 Mon, 14 Apr 2025 07:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERm-0008Gw-Uf
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:38 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2415::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4f7a2a6-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:36 +0200 (CEST)
Received: from CH5PR05CA0019.namprd05.prod.outlook.com (2603:10b6:610:1f0::27)
 by BN7PPFB3F5C406F.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:34 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::81) by CH5PR05CA0019.outlook.office365.com
 (2603:10b6:610:1f0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.14 via Frontend Transport; Mon,
 14 Apr 2025 07:41:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:32 -0500
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
X-Inumbo-ID: e4f7a2a6-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXXM7gonYPtLLX3r3eheWztwAk+YW1KYatB59mvJX0w9t4EauMFlpgb2XKuCcJMMLFScKSXqSL+f0SuOJmZqittYxq5IFUt4JEQbUukVbwgG8/WPRCcWi/1NWM0e0RZMsevKy+43vn+c6XB/iiHkj4RUjJDIFxh3u6jMSQLOGeTbD3fNBhWZbxMv+k9JH78ZA1VaG1ng1zaDQYT2XWnIGkgpH+0edO9sEygIeYe2ByTjXgQBuJNj/8Safhwy+WXZnJd0/iKL1V5KwfLD7zRJN0nrVhZJYFnrQTVInj4e53zzKm9eXucG6e10ZkFJ0hKbyXYXWc2XLDTCKxun6kp2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwM1okoZi56E1zIpImVLgp1DbrCBg+nCr0izLGm2QqY=;
 b=NtyXBB9Dh1zfOjo1L5P51KarL/UWxeH92uUURBUuJe7XGM9c43LJ6hU73pzQNb8zYBt2NItaaf73DLdXqYiShdDpAQMxeJexqBweN5vkHdlb7BHGtpPY3h8gNv/KSqMIHbaXMAVPhJg5/AMfYmgbfw6BK5DiRkfVBXmIje1h2M7tEwppAfmprBr1E5vgd9nHmpHo7WXqiNshmp9rzpAE9FNjs24uW9tVWFA74Lt/27+xikjcz3BxYUkAg7mLRryk5SyLj+X4NuTdN5hVCVbLi79qCYAtGHpwnjdViE5yWEJMA3mlguPbpD3XjRdhkZ/4w8dp4HbzTf0K7psCzKjKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwM1okoZi56E1zIpImVLgp1DbrCBg+nCr0izLGm2QqY=;
 b=BnaeyNDzAaKnoNRNnPfO1KBUmU1894JUvZoOg1VpS89MPDsIMdetCoHmoPudaru5w7sGqBpt21aQsmw8j1OvEqcKEkMm42vcgOfDYRho7jb/0ZyZZ8AGLNAvQEspOkBWMfOaZ3xdOq5qTbzb1jYLhcrcC87snMohH68PDk/ifkI=
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
Subject: [PATCH v4 06/15] xen/cpufreq: disable px statistic info in amd-cppc mode
Date: Mon, 14 Apr 2025 15:40:47 +0800
Message-ID: <20250414074056.3696888-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|BN7PPFB3F5C406F:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e74f5c6-9d34-41be-5f6a-08dd7b27c799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lIqnwnCa4+Q5oLQJZE3FKUC3rFWZlEAyFZkYpWWFw6v2Q5SxW9OYFS5l+emM?=
 =?us-ascii?Q?KBZhHqHScHotaCS4uCorieNhGQdWzR/Uw+Q6ZoivJJLBVpwyxZQrh2MlTVUt?=
 =?us-ascii?Q?7T7sxpHHCUgcDaUiIRslbVnzDp/hHYwTtNQlUlELGr94arjfMqaI0fBfrVDj?=
 =?us-ascii?Q?w/XeeyXsYOlcHlGoIpA4R+mOfLR/LYewpEL6q15FT9atl6EK/Hb3pyr4CtDP?=
 =?us-ascii?Q?IDr3rnHBlC+ujrW+WjVUoL0q8MhBvrySmAc9POEQN95YD2xld1n6xpUnqdAT?=
 =?us-ascii?Q?1KHE9jLzsIomBB37qvvYjBvwTV7kUkh8fshBBGC4M26og7xtAitPgGdSmgut?=
 =?us-ascii?Q?SgGz0C7V/WpT6ahimwix+CVOE9HV0uKEhFPkFVI5BokAaRQPxo5pUbpIUEol?=
 =?us-ascii?Q?j5lDWVCrkZTzLHzGC23jpN9Z0g9skfijQu6LkiXhnum+0BUKSiAFAWlmcDBh?=
 =?us-ascii?Q?p0JXtkYEEUJ1RgkloiimZDbYl5cVvRObmOR6Ct9SoAyBST7nl6XA89OjOJ0Y?=
 =?us-ascii?Q?jSGWpJkzfz3xkjR+dQ2Z31TZ39g8NsScrBP/BkZszH7OBwelLIaSzz6zQUoo?=
 =?us-ascii?Q?CRIWgqU7o0LaGKUI4Oh1dzk7b8R+y8eIMyGr5SfTITCRATVAiW2br+DlXMTM?=
 =?us-ascii?Q?SUgxgJE1sPIEHaNyO0vIKTtALragI8IYrcmWiiPlpTM5zPgPTvLrT1l3OZ6q?=
 =?us-ascii?Q?ihtKIsC/ZNudf1b6oY0SDaLU2dPfrh+oUR8qurs/vyxI2C/i27iICA+3VZD1?=
 =?us-ascii?Q?yk3knqIGe+HQKoslWUibVCbjyiTNxvLPrDtVDlZP/kd8IlBtE9MMWPiQcFqe?=
 =?us-ascii?Q?r7b3xjPfkRLCSEN6FPVDp44L8lk2a9cApo7xKoTqFnNkkN3EOS58CSGm4htX?=
 =?us-ascii?Q?WrugOtPWLBs3+pxllCUpJ7sV+AQXi2NHLfqj6NupWfZvYJUGlm1qnE0IgtqB?=
 =?us-ascii?Q?2lbUxnf97H6+YQvgh6KamzdyS9G7PL9iGQZKvyBN/67fyeb51icCIByxBw8F?=
 =?us-ascii?Q?v3tbHXb/QcRbz9cX8xLk5k8VY1EOK4IUz4kDLJaym43I486loos9SlOeW+ba?=
 =?us-ascii?Q?pMEIMOK/76y2SsHbO3hWFzw5vbgUk911UwjR3kwGIwMYROa+/80vdMLHPtaR?=
 =?us-ascii?Q?7gxeACUfsvZSR7Wn+a+D9JjaIWM2RIGoTytV6YPwnqjHFTbS4vJaHwSU160a?=
 =?us-ascii?Q?veFzf61NAuyFhJ0DoRAb5fpSjK17nXlYO09NvxEYGaEMlUFMcYmUrE1TFF3Q?=
 =?us-ascii?Q?tY1QQHPXrNSsVwvC9M9680VrXRCcA7vjpTr5gHJG7Sp9FutUWXX1qeMJsViB?=
 =?us-ascii?Q?QX6a1csWjMgG+wA42trccaERg5ZwoxWXEF/N4j0KKFMDeVTRAjeRDIjFqQAV?=
 =?us-ascii?Q?WVj3BVgUJjVSOLS4eU4CwW+ASwceRPQy8ApSNsUMpGLU20j4t04pygbASv3v?=
 =?us-ascii?Q?8XOTM6OD+6DkVRh+O1/xov7TysPSf3CEJc4kmqzrgpsqzxuL8lehR8K46f/X?=
 =?us-ascii?Q?afhCvnfEEOnh2YuoPcITeeyvyEb2Rkv6OYMS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:33.8511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e74f5c6-9d34-41be-5f6a-08dd7b27c799
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFB3F5C406F

We need to bypass construction of px statistic info in
cpufreq_statistic_init() for amd-cppc mode, as P-states is not necessary there.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- remove unnecessary stub for cpufreq_statistic_exit()
---
 xen/drivers/cpufreq/utility.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index e690a484f1..b35e2eb1b6 100644
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
-- 
2.34.1


