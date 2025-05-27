Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135BAC4AB1
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997995.1378853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1B-0001CL-Sn; Tue, 27 May 2025 08:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997995.1378853; Tue, 27 May 2025 08:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1B-00018q-Le; Tue, 27 May 2025 08:50:41 +0000
Received: by outflank-mailman (input) for mailman id 997995;
 Tue, 27 May 2025 08:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0K-00031E-IQ
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2414::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89819fbc-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:45 +0200 (CEST)
Received: from SJ0PR13CA0107.namprd13.prod.outlook.com (2603:10b6:a03:2c5::22)
 by SJ0PR12MB8167.namprd12.prod.outlook.com (2603:10b6:a03:4e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 08:49:40 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::2c) by SJ0PR13CA0107.outlook.office365.com
 (2603:10b6:a03:2c5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.17 via Frontend Transport; Tue,
 27 May 2025 08:49:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:37 -0500
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
X-Inumbo-ID: 89819fbc-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzDbpWQJVSD4gE9YS0S0YmAsgQ8CzVZAO8+e4G1tkMFNEqJB/89XmUO3ZIc0WpbQZ7b4WMH5hOc4ypy9RcUDUnaJhgep4eTGIx6fooI/s/DYRtIeQWKwAvN235LoMPdu8ZuYD1ePiZH5jMO/W35n951ay49AUK4IP3xMMPRy10Njkw67zV1U7SkJ84g9AKFecsJttTbcvS2aIAvSc26MZqEMO1wD93qBIBXTFEBXmt5+41Z2F2mqkZBljTpsgNhvR9Fndk7lhRvEfsxBC4hVI4hnjLa9Xet6kTGDJHDsqYQKqrU+WzUGPtNdeHw6OYE4+t2DlHLsAOYLGVRtEElwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB3Mek026fWNFIQDzjs+lsqQvvJxYv/q/FC2PzT8yzo=;
 b=lG3361jcMkvWKaOkdb2QtqSKiER5QMpapQTai4qbdpz2zlPk18z2TDiFgjp82i9McnaYBJVYuxb+P0neZan3LdUKf6obaZhlOB/JwV8CnZVNMky/VxUHlJB13bR3O2hG7Ar3V0DitR2tKGh1/QI26CMsyxwDVHR/TTub06d+Z/Iv9rxg4LGdHTG3U+zd2XN1zWl1wH/SFi9s6NUQoGg1SKQXJI49KmKeCcvuPY2ujClduFygQ5blzc4FlOVEvEsxMsWtLWBEiMcPO8FtIoMFAgqJvoIgG2ZsZpDdF03u4a9nJVbbML9jeJXGrDiuD+9q6slhzin7YYg8UazJgjZnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB3Mek026fWNFIQDzjs+lsqQvvJxYv/q/FC2PzT8yzo=;
 b=qGiyCVmKplWh10jNH06VD4UXfNk8iz7c3yHWiiaKtmhWCVXyI8eCbZ3Pi8FsZam4eavidll487O1cHep76B5bOW8NSPb7X3+kxweWjO4v2Hc/yXTkOAIgLzrjn5Af9EOlrgB7sbLAE7W0EQlwKhiiOTck7va8ckbBzuRuv0NF5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 15/18] xen/cpufreq: bypass governor-related para for amd-cppc-epp
Date: Tue, 27 May 2025 16:48:30 +0800
Message-ID: <20250527084833.338427-16-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SJ0PR12MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ac84a1-a730-4625-3add-08dd9cfb6ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KWrDju3zLvhxBHu6z8VU0Rb3L32I4qpoaWVC3RH8B2TD311+zaz5KZnVzqKX?=
 =?us-ascii?Q?6TyvBqKOfN42qAnrKzbBaZiTQcqLNUbl98ZggyTFRtiMiAf3h88hSraTEGkZ?=
 =?us-ascii?Q?kzmPxCbcodd4F5oRD5+So2ZReN5gP4sHysm5V+Pwm0sbnwIpX4evKC0ldP2E?=
 =?us-ascii?Q?BhqMt0yuggdXKI8MOtufNpp6EVlvKo4cvnTUn8wfGk+UcMkvYovMCUB6w5Go?=
 =?us-ascii?Q?A8SQ1yV2XAOAd4+17W97LHOwwVM0ZAYvKOZ/1vaIYCOa3dIFCc2NvFWNPKuv?=
 =?us-ascii?Q?+OoYES5Il9GZD87boPJ2Il6a6GDHh9aZLucP3V7tSVA1U4rtsr9uoLJPQDcH?=
 =?us-ascii?Q?pj15NcMQ80r1Lckh5zmBXQeNown//nSTPfjPZ6Q5RmNlq8T+376fodOQLcFd?=
 =?us-ascii?Q?JV8L29T0Z8reKdcmupe0cXEqivYxoeHgU1tWNpKN5VdCgziL9JwEaVDveZ/1?=
 =?us-ascii?Q?GAiLEdaE72pn64Z/RuDMVZ+LFfOWQSgXHQ7L2flxyovkG6VqU4wkSKC1qCRL?=
 =?us-ascii?Q?puC5w770raY8uIDIvNzQBa7aMRUO/dugYsrD8VO7vEm+Wr/6lxw29XDrAE0n?=
 =?us-ascii?Q?XVC1ooaWgIZcQBtZAlACDGL7ZcoDAffiRj1xDMkNRXv3LEmD9JehRE7YKJU8?=
 =?us-ascii?Q?YDqN/032uYZWVf7WgfDqeEXzuj/pEPbF491cNd+XuXOHmyTirHVrm230MiV5?=
 =?us-ascii?Q?/QV8ojF4xJ3IK7nca9+wueOg6vPJFIDuAzNby8O3qnqCI4JZTfxj0GrFQWSp?=
 =?us-ascii?Q?wdnnUzSvd/irPb5aRk979Zfezl+1WoeJ0kI9dm+Y5yRCMxRtbhSdQ8a114DI?=
 =?us-ascii?Q?iBlb9OJfjr1vr7Sw2k68L991GR3bnPb8UtLu1en6vmJRWzU88N8YisYUKVa9?=
 =?us-ascii?Q?jNyfamQ3XpSOYygn+d1trAZTUwLsGHjlZUcURTwpZ4yTjaVPq8gG7sIrKwB/?=
 =?us-ascii?Q?lSVvBNBSGGoIx/NFSE28796i4iYDmdvttrwJfVGtUP/G1TqilJr1mkd2efzT?=
 =?us-ascii?Q?sBX8tUzFbKCu83n4jGf7yFi7fhjvRkJELVlMC5pvqwexbREt4sTpvY6Beb/r?=
 =?us-ascii?Q?yur/Rf+YxxTFg+usB1pIE25POVb1RqgWLce1Q6uCDZCLhnFfJqigiw0f9zzU?=
 =?us-ascii?Q?jn5l9PzSvjEpym3FP/KQ3m3pnuC1WH++RsQgO3wP92wUMOFTyc4DgANHDAfe?=
 =?us-ascii?Q?MOC5b2LCU/qU98/HueEs1/s1uJBDsXbiw6XSt3UJMHI3fPa5PxWXQBZPlio6?=
 =?us-ascii?Q?hgzt58kf1ZrPCgPxv6OW74Qm7ifFrLZ8EIh9wEWZi9/mRahu/9IV+uSy2Qxc?=
 =?us-ascii?Q?y2sQrT86Weko9K5xKH5SVxHyvjj/85hwvgJ9whuP6CGfExa+FCyUy/PpBKUM?=
 =?us-ascii?Q?RUIuBTf3k22ewibph0rLClnhWdEgXZMQzw2vaxdlaEyr64TTgNNkhadZ+kZz?=
 =?us-ascii?Q?quf+uFNkabrUnchGpB0i6euwdCfvjypsWWpEbXn3y371SieYSnbBrRdrEJla?=
 =?us-ascii?Q?x9BBhf/dcEl5PAzkNrjDa649Ni8Map5c2IYe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:39.9018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ac84a1-a730-4625-3add-08dd9cfb6ae0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8167

HWP and amd-cppc-epp are both governor-less driver,
so we introduce "hw_auto" flag to together bypass governor-related print in
print_cpufreq_para().

In get/set_cpufreq_para(), we are adding "cpufreq_driver.setpolicy == NULL"
check to exclude governor-related para for amd-cppc-epp driver.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- Include validation check fix here
---
v4 -> v5:
- validation check has beem moved to where XEN_PROCESSOR_PM_CPPC and
XEN_CPPC_INIT have been firstly introduced
- adding "cpufreq_driver.setpolicy == NULL" check to exclude governor-related
para for amd-cppc-epp driver in get/set_cpufreq_para()
---
 tools/misc/xenpm.c        | 10 +++++++---
 xen/drivers/acpi/pmstat.c |  6 ++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 2a87f7ae8a..f173e598ea 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -791,9 +791,13 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool hw_auto = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        hw_auto = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -801,7 +805,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( hw_auto )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -813,7 +817,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( !hwp )
+    if ( !hw_auto )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 6e9178ade1..e5f375921a 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -253,7 +253,8 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( !hwp_active() )
+    /* bypass hwp and amd-cppc-epp driver */
+    if ( !hwp_active() && cpufreq_driver.setpolicy == NULL )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -346,7 +347,8 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -EINVAL;
 
-    if ( hwp_active() )
+    /* bypass hwp and amd-cppc-epp driver */
+    if ( hwp_active() || cpufreq_driver.setpolicy == NULL )
         return -EOPNOTSUPP;
 
     switch(op->u.set_para.ctrl_type)
-- 
2.34.1


