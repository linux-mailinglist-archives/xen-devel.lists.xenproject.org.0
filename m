Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFAB011DD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040263.1411749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wi-0002dp-6l; Fri, 11 Jul 2025 04:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040263.1411749; Fri, 11 Jul 2025 04:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wi-0002br-29; Fri, 11 Jul 2025 04:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1040263;
 Fri, 11 Jul 2025 04:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nv-0002LK-E4
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 663c5166-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:52:02 +0200 (CEST)
Received: from SJ0PR05CA0080.namprd05.prod.outlook.com (2603:10b6:a03:332::25)
 by DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 03:51:55 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::f8) by SJ0PR05CA0080.outlook.office365.com
 (2603:10b6:a03:332::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.5 via Frontend Transport; Fri,
 11 Jul 2025 03:51:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:53 -0500
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
X-Inumbo-ID: 663c5166-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXwDSsp0HX9BoR3DcwXcSp8KoMgu3OBVZfjB42cIs2G1fKE9Ekpz1TrPeO2SgOJ9J7UMH5Zx6dpzrSgzzUaY7M9jSMyMeP4d+90F2+2wRfmGJg8pdNdbAC4UnVTejI0xXaLN6PAAO0QrQsklS1kpwqiVh6DvTB8Zt2s2NUYEOTPifDQK7tRcH4KVSWAVZwQxKnzpebRMYUzbJsj2YibrXjJ0EVymSoyBQSY+VxmbEaOfMUhQUuLeE3sp9BKcL+tzIxWIxwx2KtPqBp7BgtGLdGV0pVFVLtmLcD6H8kOKDIFY+DEFIYQTcRpMtTb2HtriGyxTpoAjgKwcoGgMIb8MKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2xrCTmAriiyNcApbk66PtW1PjMrLOdQPPDHXCP2gL4=;
 b=Gt7SQqbpfXjGGIv1k92elusY/Z+bQMbyxIxB74thKGkMrZN76g+SHM4DQqz/p50t1GwqXotDD7bZ35jO0aG3n7Z1mzUIQIKXLGCXEU1jFZtT70IsPOgFvdbitnDyWqERGcBbeyYN15yV8VfDC/uWniQnP3mehE/YhwZ0NJcMo3bH9Ex12Q6h9peSGSR63YCl7L7LMJCn7IZ0Vzws6tJTyYaQUJfVz4hrIRuZJr2cQ3uHBHJp0JQb2Fs95xtY2CI98QIsf9snfsnxuSXJxK3GepJjbI/7vCyydeFXsz1++FRf/rakj9V72UHjp1s/7cveeT3plSsYrqIvvX1MgEthTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2xrCTmAriiyNcApbk66PtW1PjMrLOdQPPDHXCP2gL4=;
 b=0+tVz+UyMP+Fr8VHfS8sjyD5J5oasRWFXTgSovsUuXXnugQfajrVWC4+1hIBmg6poApHy5eL8B42r6gluMSfPbmGg8OigjOPn1T3UFoEo4CtKcqVkGRucrO7iibtpAIq/CClNQ3zN2KzwRGmSBFJjMDu+LPhLnCUNN3f+g4z/OQ=
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
Subject: [PATCH v6 14/19] xen/cpufreq: get performance policy from governor set via xenpm
Date: Fri, 11 Jul 2025 11:51:01 +0800
Message-ID: <20250711035106.2540522-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 130fcf83-4b8c-4f5a-21ab-08ddc02e476c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H38uZKB1pC5VKE2KJdyLELZNJ9W3gCwhbyelikfBIrQm8SLuBQIEDmKdR071?=
 =?us-ascii?Q?l8mQOCQPzlL9+T+Qs+KOtpRP5K/jweTwy4HcOGpwZ/ENrOT8InBQh5Y5X3rF?=
 =?us-ascii?Q?d6dWYJxKq7t9t4WTdn+ZMugOsVuaw3TKR2CDBYzXi5btiCJRMU1s8pk8D9ka?=
 =?us-ascii?Q?5oOZ32q6VaP4AqiMoVqI/kYgDqDhcSbe4FKEjEHgy2JKeoMfGCOgIC6gyy2w?=
 =?us-ascii?Q?u1dC4jcpDh50ODWBFlQNdrqez9wNF+Si1CLOzLP/UJ3xOrz4lXYGQx1xdwOo?=
 =?us-ascii?Q?KBEiRHsLm/vh83S/85NeFyWN1ADYgzFO3R0hYl5rK2949m/FTlMsY6OEKopj?=
 =?us-ascii?Q?MnjgzT34trVqgexKSD9I4lfYRPq4ytmWJFYUxXLO2K3RZ6ZG0DGPht/Nvpff?=
 =?us-ascii?Q?3YkhBpV87X2XISMUZeP5bVGTnQbizwWfheWioBSjbdpNFJD81nLnw/hWeu1i?=
 =?us-ascii?Q?zKrpD2Bh5IoCMB+SZ4rlgS52U5H4t0cdBRaiO+8lFtOV53i8Qzwo8N27ccr4?=
 =?us-ascii?Q?cgWVD+/ZYF1z7YYaW1VflCS3KU7WvkFwlHssJRDTOJ6JcmGe5yw4jbG7Dfyk?=
 =?us-ascii?Q?K6RUtUOhLjNvcVhitZ2SFeJBgXmM2ywt+wCiW0wkxKJOxjZNl+6gAgPi8Xc1?=
 =?us-ascii?Q?PU2xSLQBhT73guEYTZBJg7tDgiseYzlB0LZleK3f4bz3rgCca4ww96j7zBNd?=
 =?us-ascii?Q?Yjm1xlSVXtxQ5JYhhfUznf4dI0idIwAYI54pwx/lRyzmNijyoS4avJJNADrh?=
 =?us-ascii?Q?g2Vdp5SmStq4T5T6x3UujorpWN43fucCOYWcJOFNiZUcCtZBPBkDHDQboNcZ?=
 =?us-ascii?Q?NicAE681zVszncEogIydrzG02NaIsWjPzTS9K0t16umdZJLD+UkRhbiyK8A5?=
 =?us-ascii?Q?zhKbcZMIFHsHzUQZbpa+NKvRb60Zm68hrkbEtOtQdwcnxyPsesJTTGFvUXzJ?=
 =?us-ascii?Q?Rq2erbslfLnnJiq7gcZgHPRRgh79JEmGV9/bkN4ZZHmw3Do5+ObGNKLTBjv8?=
 =?us-ascii?Q?tJycfjvlofvtqsNPSL7dI64HLDOi423blf9N7QWkWk3ed5DRC4/TQjtTBQEQ?=
 =?us-ascii?Q?ilOsLojQMSBigFkiOFST2Zmwb/njw2NQTfx6hBGjij51BIyyIg4q2SSuV2jA?=
 =?us-ascii?Q?xv786Jtevj0XxduLsjgfW2BTqTGdF1QeN6wdkW81SH4HOxHwuuVVgjkmfy/f?=
 =?us-ascii?Q?3rm7cPK3LEx4mLTrKmDX7N13IuFa3LPKnTsHCpQqsx12hW/GWhaDo9P6MDle?=
 =?us-ascii?Q?fJA5pp0PRuHQzBIpiv4+eI7H9OJ3U25OaYs6+Duq9Ih/2ZAcXzA764otfsgW?=
 =?us-ascii?Q?JZ7xsszEldCwnk8hCBUzXzFh6RxUZP4hct3k/4pFLp8i80N3qv44iaxxYcln?=
 =?us-ascii?Q?rxwo5qD+RgjgmwOqjVm/Hf6cm1553lWXQ1u+Bp8ZDIdq5P7kn0ZL050LLTxt?=
 =?us-ascii?Q?g3tNf5CffXRQBHaAdb1GUOLZY165b4ZzFFEhd7yZSBkOoh4CGVRF0sc+w9sj?=
 =?us-ascii?Q?ph3iQ/TB1nm7+Ky5OoJEvA5CWXhNGmQ9YnDA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:55.4422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 130fcf83-4b8c-4f5a-21ab-08ddc02e476c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576

Even if Xen governor is not used in amd-cppc active mode, we could
somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
apply through which governor they choose, such as:
If user chooses performance governor, they want maximum performance, then
the policy shall be CPUFREQ_POLICY_PERFORMANCE
If user chooses powersave governor, they want the least power consumption,
then the policy shall be CPUFREQ_POLICY_POWERSAVE
Function cpufreq_policy_from_governor() is responsible for above transition,
and it shall be also effective when users setting new governor through xenpm.

ondemand and userspace are forbidden choices, and if users specify
such options, we shall not only give warning message to suggest using
"xenpm set-cpufreq-cppc", but also error out.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
v5 -> v6:
- refactor warning message
---
 xen/drivers/acpi/pm-op.c      | 8 ++++++++
 xen/drivers/cpufreq/utility.c | 1 +
 2 files changed, 9 insertions(+)

diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index d10f6db0e4..e616c3316a 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -205,6 +205,14 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
     if ( new_policy.governor == NULL )
         return -EINVAL;
 
+    new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
+    if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
+    {
+        printk("Failed to get performance policy from %s, Try \"xenpm set-cpufreq-cppc\"\n",
+               new_policy.governor->name);
+        return -EINVAL;
+    }
+
     return __cpufreq_set_policy(old_policy, &new_policy);
 }
 
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index 64bcc464f6..e2cc9ff2af 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -250,6 +250,7 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
     data->min = policy->min;
     data->max = policy->max;
     data->limits = policy->limits;
+    data->policy = policy->policy;
     if (cpufreq_driver.setpolicy)
         return alternative_call(cpufreq_driver.setpolicy, data);
 
-- 
2.34.1


