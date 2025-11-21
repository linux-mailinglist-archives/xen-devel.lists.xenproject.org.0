Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F179DC78971
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168606.1494630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOr7-0002Ny-Hl; Fri, 21 Nov 2025 10:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168606.1494630; Fri, 21 Nov 2025 10:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOr7-0002Jb-DY; Fri, 21 Nov 2025 10:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1168606;
 Fri, 21 Nov 2025 10:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOr5-0008Dv-Cg
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:07 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 187aa613-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:05 +0100 (CET)
Received: from CH2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:610:60::24)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:58:58 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:60:cafe::da) by CH2PR14CA0014.outlook.office365.com
 (2603:10b6:610:60::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:58:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:58:57 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:53 -0800
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
X-Inumbo-ID: 187aa613-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ft9+9JuvplachEXk7C7SqGSu9flEKZXtRKKYz0MNR8FnssZkrw02oobYXT1g9JZ63F5OPOFjgzhWA8XfGLRV6aGE4ppjRwvez/eyDshn+B6i+CfetoCj/vLwonbpeXUBDpitSVMdC2gBKYjyg5qOLTDKBqCO/7yP9uLMTK7uldv+UCdn9tucVrH62YljdhyIMfgjTJX7Oz/av3g8JzHMzzGiN5yka6xgtsjcggU7FBCpbnNWmOmrOEnsrTJn8QrrCYmHayK2uNr3aWxutb8VPWyIGXRT3WfByLxDEz+96znrEDijbI9ziuubzVXVRNJMZLBcM9wIceiSGz6YhrVAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SGeGKilNkPW5Ffxzg5kKaE0E0FbCgqcHjey+FbgZYY=;
 b=kA55KhXFhZFPKI3qaZAo0/feqyoB4Go/ERj4A1CqzJdSRuLTwXKxn+T69SJf3phXQl6lLUhUw/2TGZ4aMS5o3LVI2I+Aqg7/FNyKSOeAqkZIoF43zqFAl4CNBJ1gNq35esfDD6WoipJDHz3DboiguCzaAXMFHG10DEc3OVtxtGsUw+AEl3fdmmXDnmPW4SLCzSeJjtcuEyzlrS2BJqVYjC4Ra83uwOxTza3qZ+85tqsh5fWBNA+sTHadouxNQCCLqtgy7/x+7qjktvvNkh5iBTt4q6rUTD9G+e9o0eSJOdqrbTKsb/dRkXacq0ujB4I4/IzdtYaV+ymcF9E2TDlm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SGeGKilNkPW5Ffxzg5kKaE0E0FbCgqcHjey+FbgZYY=;
 b=mSCgesVEyMBg/bkHQy6J+Xm2NDl4VBM0qGmOakGA4F6ZPWm7iCPwKoHQEk6ryrPTunH49JVkVFQMuI2z0Jdw+8cbt41/gAC8l9XRvuc15tL3zYe/Bx2lBZLYRhlsnANAfIP13AKhE5MEG3wjSrMSYdjyhvAtNCqtOBCSy0OKc6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Nathan Studer <nathan.studer@dornerworks.com>,
	"Stewart Hildebrand" <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
	"Juergen Gross" <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Meng
 Xu <mengxu@cis.upenn.edu>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 10/24] xen/domctl: wrap sched_adjust() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:47 +0800
Message-ID: <20251121105801.1251262-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: bb10e3ad-1f2a-4dbd-cb37-08de28ecf818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pjh4VyIiI/vYMBC9HL13AGiMOWyclR1JlNBG6lzn4snbN/c6rDBaZZIdTMsn?=
 =?us-ascii?Q?D9tTQxCCJ6fpSRsthf9iDKrI5XAHCEvtsHxTWLgBEKp9utFW5uf2tIUySc8p?=
 =?us-ascii?Q?4G12oDI4KCwDs7JpHOj8yM1ruk9pl/1x5IHawOMECs23Y+cVoCdYh6Z8Iakd?=
 =?us-ascii?Q?HMc5z0vbmV+Y/Cu794ChoxhK1JSq0xAFcSvF86fnkxEbmqMnluLUoRUK4wmZ?=
 =?us-ascii?Q?pmfm4ye8q7q7v6KbI9MCiQ75KTJJ4JrAKA2yHp5lVZdS738SzbHZwvCVPu8A?=
 =?us-ascii?Q?ZEM3+8FdEdDDejNXIHe03wG+ZpUdTEqjtMJ+xyZyEFSP4ePsehvVnK1NGugv?=
 =?us-ascii?Q?uR8PD1ODoEOmFMYP2MmJReM0nraxnUNNKljhuLMTew2F/3vfN9cxoEbHkNFv?=
 =?us-ascii?Q?nOWmvG7SVqISiKthvTYpxTd+qZG3MtfQWu3K2Tyw3Wvk+285FbT5RQLsYS5F?=
 =?us-ascii?Q?m8PnLVLG1YEilGYFF5rOE5sK5ApXenOVe3uRDTz/CQ7KlO9einBlEf3kEL12?=
 =?us-ascii?Q?W29ahcRaFmD2m9WBTL5Nd95KVwJCJiGBRpdVubJI0Q8OL3/lwWNBPoUn6XMc?=
 =?us-ascii?Q?ISBHN68yuqnzNwAwPtlpWzQIkwoCPpwbxFr0ucg0899B4b7gz7K9SwJQRahk?=
 =?us-ascii?Q?CzM6H/mbsg54LQ1p7HB3s5/AZTn6Ko8kGDlSLGYyl5+C6D0eK1s2wZmJa6Vr?=
 =?us-ascii?Q?t6FbhkgLflpG5YjG8Ycbn4zA1HbE6F72UclWtbCyFbWxcA3S9e6eXSczy/RI?=
 =?us-ascii?Q?FXU84le7rIVGzwPry+hwE+9gKvovnb5C/CmUv9PrF4Jyh1lGfx0R00vZE29t?=
 =?us-ascii?Q?WOPJx2lt8h5+cWbP+R1tydqUV4VstSvvaC+HsPfkEm8Maza+xIUBi2Of17vq?=
 =?us-ascii?Q?/awwVr8wQkcfUOWmzS3fYyxqDgrIy1L28YSpcAs9i15UdqpytVsnG9MfJW5w?=
 =?us-ascii?Q?tMoAxeHagWjIsTpGBW0cVBp9ou3B9hHLSyTfhGapCRc4WOKyZKya9hyLiG4D?=
 =?us-ascii?Q?zrmERBJNXnjXTdB3YQNKw0cSZZg9VVPC9QHrFDYPMBafbxgW7IM68aH2+cep?=
 =?us-ascii?Q?h5DREVLo1I3xMoNMXrMhbWC6qNTwHfIr7XCfjVIEQqv5UHQ3GFJeKBY9dGoJ?=
 =?us-ascii?Q?hNHE/5cNLzBd3lxtPGGCoVh9PH8wCGFp3zB8bom4Khxv4ciZH22Qr4hr1Rle?=
 =?us-ascii?Q?ZXxK+TA8QhF8Dnsoyxg8zJn8yII20NZX5+rF4yA1uX6RJHxlvCzEgKFLa6u4?=
 =?us-ascii?Q?ru3RGfv8mdO3EmjDyj8b8AnX+P9mJLUyIhp1aOir/m8o0p6ykli5SOZBg3wM?=
 =?us-ascii?Q?8ha+ynOBx83oFzyHP/ZBYdjX2ti0s45sW4hFe1uvYlnrxBQwOqd2c2yXQv/3?=
 =?us-ascii?Q?GEVPwNgz9eGHhIXeTdOORy2HlhFJO3JmekU1/Srrut3SQApVmAOFOB+MK9NX?=
 =?us-ascii?Q?uo+OFaXQS5j3+pva0SU2FvN69JGF++5X6UkqEcFHzzEyqyYOz/GAIrl6wn1J?=
 =?us-ascii?Q?iVGEsJ7tmnHzmTdoCwDxpHBzNkFTB+5CzMyZsHeeXKklKbkEjoyjZACYO0Au?=
 =?us-ascii?Q?pyOZ5CQvrVoPFOI+knU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:57.2429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb10e3ad-1f2a-4dbd-cb37-08de28ecf818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

Function sched_adjust() is responsible for XEN_DOMCTL_scheduler_op domctl-op,
so it could be wrapped with CONFIG_MGMT_HYPERCALLS.
Tracing its calling chain, the following functions shall be wrapped with
CONFIG_MGMT_HYPERCALLS too:
- sched_adjust_dom()
- scheduler-specific .adjust() callback
- xsm_sysctl_scheduler_op()
Otherwise all these functions will become unreachable when MGMT_HYPERCALLS=n,
and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_scheduler_op-case transiently
---
v2 -> v3
- add missing wrapping in xsm/dummy.h
- move and get away with just a single #ifdef
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_scheduler_op-case
---
 xen/common/sched/arinc653.c | 1 -
 xen/common/sched/core.c     | 2 --
 xen/common/sched/credit.c   | 4 +++-
 xen/common/sched/credit2.c  | 4 +++-
 xen/common/sched/private.h  | 8 ++++----
 xen/common/sched/rt.c       | 4 ++++
 xen/include/xsm/dummy.h     | 2 ++
 xen/include/xsm/xsm.h       | 4 ++--
 xen/xsm/dummy.c             | 2 +-
 xen/xsm/flask/hooks.c       | 4 ++--
 10 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 7d6c40d800..5a6f8c8642 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -735,7 +735,6 @@ static const struct scheduler sched_arinc653_def = {
 
     .switch_sched   = a653_switch_sched,
 
-    .adjust         = NULL,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .adjust_global  = a653sched_adjust_global,
 #endif
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 83e34e7c05..0943cb1e97 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2072,7 +2072,6 @@ int scheduler_id(void)
 {
     return operations.sched_id;
 }
-#endif
 
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
@@ -2109,7 +2108,6 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     return ret;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 {
     struct cpupool *pool;
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 0cbec2a9c0..ed3241bec8 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1183,6 +1183,7 @@ csched_unit_yield(const struct scheduler *ops, struct sched_unit *unit)
     set_bit(CSCHED_FLAG_UNIT_YIELD, &svc->flags);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check
 csched_dom_cntl(
     const struct scheduler *ops,
@@ -1227,6 +1228,7 @@ csched_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check
 csched_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
@@ -2288,9 +2290,9 @@ static const struct scheduler sched_credit_def = {
     .wake           = csched_unit_wake,
     .yield          = csched_unit_yield,
 
-    .adjust         = csched_dom_cntl,
     .adjust_affinity= csched_aff_cntl,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .adjust         = csched_dom_cntl,
     .adjust_global  = csched_sys_cntl,
 #endif
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 307e63ebd8..b73dd3c548 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2909,6 +2909,7 @@ static void cf_check csched2_unit_migrate(
         sched_set_res(unit, get_sched_res(new_cpu));
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check
 csched2_dom_cntl(
     const struct scheduler *ops,
@@ -3114,6 +3115,7 @@ csched2_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check
 csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
@@ -4246,9 +4248,9 @@ static const struct scheduler sched_credit2_def = {
     .wake           = csched2_unit_wake,
     .yield          = csched2_unit_yield,
 
-    .adjust         = csched2_dom_cntl,
     .adjust_affinity= csched2_aff_cntl,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .adjust         = csched2_dom_cntl,
     .adjust_global  = csched2_sys_cntl,
 #endif
 
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index b7ff67200b..3b35002c5d 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -349,14 +349,14 @@ struct scheduler {
     void         (*migrate)        (const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     unsigned int new_cpu);
-    int          (*adjust)         (const struct scheduler *ops,
-                                    struct domain *d,
-                                    struct xen_domctl_scheduler_op *op);
     void         (*adjust_affinity)(const struct scheduler *ops,
                                     struct sched_unit *unit,
                                     const struct cpumask *hard,
                                     const struct cpumask *soft);
 #ifdef CONFIG_MGMT_HYPERCALLS
+    int          (*adjust)         (const struct scheduler *ops,
+                                    struct domain *d,
+                                    struct xen_domctl_scheduler_op *op);
     int          (*adjust_global)  (const struct scheduler *ops,
                                     struct xen_sysctl_scheduler_op *sc);
 #endif
@@ -506,13 +506,13 @@ static inline void sched_adjust_affinity(const struct scheduler *s,
         s->adjust_affinity(s, unit, hard, soft);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
                                    struct xen_domctl_scheduler_op *op)
 {
     return s->adjust ? s->adjust(s, d, op) : 0;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int sched_adjust_cpupool(const struct scheduler *s,
                                        struct xen_sysctl_scheduler_op *op)
 {
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..a42040b259 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1362,6 +1362,7 @@ out:
     unit_schedule_unlock_irq(lock, unit);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * set/get each unit info of each domain
  */
@@ -1471,6 +1472,7 @@ rt_dom_cntl(
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * The replenishment timer handler picks units
@@ -1572,7 +1574,9 @@ static const struct scheduler sched_rtds_def = {
     .insert_unit    = rt_unit_insert,
     .remove_unit    = rt_unit_remove,
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     .adjust         = rt_dom_cntl,
+#endif
 
     .pick_resource  = rt_res_pick,
     .do_schedule    = rt_schedule,
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 9b1d31b6ec..5810a18087 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -141,12 +141,14 @@ static XSM_INLINE int cf_check xsm_getdomaininfo(
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_domctl_scheduler_op(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 4c6e0dc0f9..9dd485646a 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -56,8 +56,8 @@ struct xsm_ops {
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
     int (*getdomaininfo)(struct domain *d);
-    int (*domctl_scheduler_op)(struct domain *d, int op);
 #ifdef CONFIG_MGMT_HYPERCALLS
+    int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
 #endif
     int (*set_target)(struct domain *d, struct domain *e);
@@ -240,13 +240,13 @@ static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
     return alternative_call(xsm_ops.get_domain_state, d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_domctl_scheduler_op(
     xsm_default_t def, struct domain *d, int cmd)
 {
     return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 {
     return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index dbe363f0de..724b2a2653 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -18,8 +18,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
-    .domctl_scheduler_op           = xsm_domctl_scheduler_op,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .domctl_scheduler_op           = xsm_domctl_scheduler_op,
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
 #endif
     .set_target                    = xsm_set_target,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index d0fd057db5..839a4cf9e6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -609,6 +609,7 @@ static int cf_check flask_getdomaininfo(struct domain *d)
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETDOMAININFO);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
 {
     switch ( op )
@@ -626,7 +627,6 @@ static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
     }
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_sysctl_scheduler_op(int op)
 {
     switch ( op )
@@ -1883,8 +1883,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
-    .domctl_scheduler_op = flask_domctl_scheduler_op,
 #ifdef CONFIG_MGMT_HYPERCALLS
+    .domctl_scheduler_op = flask_domctl_scheduler_op,
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
 #endif
     .set_target = flask_set_target,
-- 
2.34.1


