Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C746AC4AB2
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998000.1378874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1E-0001mA-1i; Tue, 27 May 2025 08:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998000.1378874; Tue, 27 May 2025 08:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1D-0001fp-Mk; Tue, 27 May 2025 08:50:43 +0000
Received: by outflank-mailman (input) for mailman id 998000;
 Tue, 27 May 2025 08:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0E-0002ks-81
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2414::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84058220-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:36 +0200 (CEST)
Received: from SJ0PR13CA0097.namprd13.prod.outlook.com (2603:10b6:a03:2c5::12)
 by CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 08:49:34 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::a8) by SJ0PR13CA0097.outlook.office365.com
 (2603:10b6:a03:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Tue,
 27 May 2025 08:49:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:31 -0500
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
X-Inumbo-ID: 84058220-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMmlld2VPjyKlHcYfHGImSreZGxmHsc5X831ga8NQnUA8l2pujC4idddpvb3q5pWwKg9RdHaHw1zpqZN/RuZjUov4C3/9H1Ibr8l0pqdurbBvTqQI3mNM61ysTQco6ZuzNCe55/uWxFqULbrqMFV2IaZFONUXxX5Gyn2nS6o118tXsWmQ8xWn/M8zyumB4fG1GoYokaN+EeN0UltAN6JqVRrPHalGL8j2O/YbCZFgNYeRLr4jj2N4ZH1myz8C4Ui8n8yJDd7V1TTWcuAP3nx1W1SBBlAUcaBkctH4j1Mro04beNHac1PI2io4ujbIx+ZzOv3CugQBiFxMlZKKQdeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKMq5MghF8UFPlQJDia7shL8Q+N/pOobWNyzD8HVQKI=;
 b=mAZ3azt71GQbQnMIuaOFsHCuE2+su7gCdnHmS60eSR48e6W/TMYlRg2E8TC8VAlUxBpx89h9sykNWqsL24xkaARSmz8NBsiPbXI4nPotPORZzsI8eCqc0LERuSbfrhSQ4gbTbqH2EULv23+KwFoCbh5amSWuxpurXMufS/7GZUcYptq47PYDR9LV1g9AO7QjLTuLHsxDz0L6zWtkixoAt/RUlxOqhDsoHZyEvMAbNTI83ty/YIAWTV/JlNQuGl6atkAtlg4rPtpcb4E+5fio/g49gB6VbcLtDrLrStRgNhtfMlgL/4ZxgZPg/7f2NH6K6p3ah/yidMsBHBCBj7uz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKMq5MghF8UFPlQJDia7shL8Q+N/pOobWNyzD8HVQKI=;
 b=YuS2gFTbJEPcn+aOz5m18Z8mwOwSo6JT5o9l4mO6yC86Y3sjM5Ucuo8etTclsOH8YG/6e/f+3uc2nCtXhgWz4YKC4BSXMJafNaCrXg2fHB0/mTYDdorXCbqlQrvMV9B5fpV7Ew8TjW9EYdbS6vL7KHTHe2rR7w/Yem0G6oolKAM=
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
Subject: [PATCH v5 12/18] xen/cpufreq: get performance policy from governor set via xenpm
Date: Tue, 27 May 2025 16:48:27 +0800
Message-ID: <20250527084833.338427-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ca16e1-e993-4cb3-ed29-08dd9cfb672f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tnMPAPpq/aq/cYKy2p0s5ZUIXBWJIOZS64pI8OkzeZoqN3AcTzQqO6eXYLY4?=
 =?us-ascii?Q?y0cq1Mbw7mqOS4EqIAivSfRDTeRhKkjH7E8Q33wbH4PEeB2JWfsBFu4g93im?=
 =?us-ascii?Q?ObrQ4P5tg46cLvN5+Gbu5R0rJcmp9GOys+e64wZlW8+e+eCXuz/ZHh6kiG/m?=
 =?us-ascii?Q?jYgQHcqtt0cMu54M9d4C1/Qzc4olBDsSMiiEzp1oDcGnxOt+9T37v2wFD3EV?=
 =?us-ascii?Q?JAt5kCzXevaoiFwyK01Ty82HLEfUYfuqNfVYwX8Fx7PsRmjP9mGRO6PZGe/Z?=
 =?us-ascii?Q?WfHIspdLZoDyQF6H/0XjtskFXyRVFbHEhGi3Jk9tlKx6/eTgs72fKnU7EDtj?=
 =?us-ascii?Q?fuxvboH1G06jo2+A8M86NZZ6eN7Uyy0ltH421faxwbljR/JSVRROKEZJD7VI?=
 =?us-ascii?Q?eq0Jf/L3QUHecZE4UHZYkPG+hnt4iprNDzIAL7TZxYIaNk3KCzxvqrafr+0i?=
 =?us-ascii?Q?ZDQ3X7eiVS5e+Bx4eBA8+fzGxFFQ3pBkEffWgr54kqHFnbZlDhJ5v+K8AZT9?=
 =?us-ascii?Q?PwgA89sOVj/zQVO2q+/muBDsKC2FKMLhQuxOfOA5SC2KD7hucuyfyTP/jTYu?=
 =?us-ascii?Q?4PbpwZpg9DspuZUZsXkNwuxs9aWIgM5OPpd3l0smsu9wM2HAGqzgzMQ9Tai/?=
 =?us-ascii?Q?obz/zeyFATX39TVMe2dsqhxtpwWYOciyJevlY2TWokqtzUHMg4FiBV9mYh5c?=
 =?us-ascii?Q?adbzYVPC1XnsJosT434TQw7bh0YDCy9C9cSjj6WNH4nQ7l33QUKXMgfg5j2K?=
 =?us-ascii?Q?QxlQNX7dA6S9ma+NVLhx6EhkvHIUIbxbevuLkdXzPHim5Kjm4tuxsA6F6bz4?=
 =?us-ascii?Q?x9SxUJIouK42ZWiyZPpndDz6phIk/GhW1JHMvOWnOF0e4gPfym+COFimloQp?=
 =?us-ascii?Q?R6ZvObJDt9JXSG7iphS7WPFIjWzdzg6K01ogHbAKt63RFsifmiBwXMPfERsC?=
 =?us-ascii?Q?yvKNQKOf3IRoa5RWti+AkX5oVMjzvkmcOSq73+EA86Lkwcpza8WNqz1cDw+O?=
 =?us-ascii?Q?ddqYjc9z2paDIbjHHQhztEpqS0DEZxPdtBY0TYlIkl+omEH3cPGuWF4kDpr4?=
 =?us-ascii?Q?LPMbCE8RIkybrsyiqg2ua3tLIGbiniBexZXgSRn9mO30Qf+Jr0ABEKDHPgD6?=
 =?us-ascii?Q?UW0arxvUxI3EC0dy2IfqV6VaHr6x2gdRqkkxcdtMREhdZ9qvgxknqBWWaVsu?=
 =?us-ascii?Q?5BoN5lRBpp2urDPcarvevuGiGeN24qESx4VfN5U1o4aAIZwU0n1WP/KW3/kn?=
 =?us-ascii?Q?2ZryeJ0GWfvm3I59jRwXVsUeC2Wes7t8AHBqziYFbtZ70pVjQCLb8deq6Uvd?=
 =?us-ascii?Q?GhU3yU9r06psh+3z8qFOSEAKemm/sIRIrLcdVjRHMyGS2mNpiT+btwBLFhFb?=
 =?us-ascii?Q?/Jd1VhFAle1ElpssHVannktkZ2a7KiMPzYLA9+nD7hsDSn7tDXfzZjJmjKVb?=
 =?us-ascii?Q?2Acvy4z0AJMwJi5EgQQHYQGqjuvQl9zxX7SMt1EZU+6o+8TV+f0PNjXqJbg6?=
 =?us-ascii?Q?t+ZSIR4z+RfWiW9q3GX3o22Gs/2oCGMZsLcs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:33.7131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ca16e1-e993-4cb3-ed29-08dd9cfb672f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763

Even if Xen governor is not used in amd-cppc active mode, we could
somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
apply through which governor they choose, such as:
If user chooses performance governor, they want maximum performance.
If user chooses powersave governor, they want the least power consumption.
Function cpufreq_policy_from_governor() is responsible for above transition,
and it shall be also effective when users setting new governor through xenpm.

ondemand and userspace are forbidden choices, and if users specify
such options, we shall not only give warning message, but also error out.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
 xen/drivers/acpi/pmstat.c     | 8 ++++++++
 xen/drivers/cpufreq/utility.c | 1 +
 2 files changed, 9 insertions(+)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 330bc3a1c2..514475cf5c 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -319,6 +319,14 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
     if (new_policy.governor == NULL)
         return -EINVAL;
 
+    new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
+    if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
+    {
+        printk("Failed to get performance policy from %s, and users shall write epp values to deliver preference towards performance over efficiency",
+               new_policy.governor->name);
+        return -EINVAL;
+    }
+
     return __cpufreq_set_policy(old_policy, &new_policy);
 }
 
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index 2617581125..734cd84be1 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -456,6 +456,7 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
     data->min = policy->min;
     data->max = policy->max;
     data->limits = policy->limits;
+    data->policy = policy->policy;
     if (cpufreq_driver.setpolicy)
         return alternative_call(cpufreq_driver.setpolicy, data);
 
-- 
2.34.1


