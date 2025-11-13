Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE2C5583A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 04:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160537.1488653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpn-0004CN-UV; Thu, 13 Nov 2025 03:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160537.1488653; Thu, 13 Nov 2025 03:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpn-00049P-QJ; Thu, 13 Nov 2025 03:17:19 +0000
Received: by outflank-mailman (input) for mailman id 1160537;
 Thu, 13 Nov 2025 03:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJNpm-0003dm-Jl
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 03:17:18 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41dc68b6-c03f-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 04:17:18 +0100 (CET)
Received: from BN9PR03CA0279.namprd03.prod.outlook.com (2603:10b6:408:f5::14)
 by DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 03:17:08 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::54) by BN9PR03CA0279.outlook.office365.com
 (2603:10b6:408:f5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 03:17:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 03:17:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 12 Nov 2025 19:17:02 -0800
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
X-Inumbo-ID: 41dc68b6-c03f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWDNcJFfFSBxRDtPR3xftvgiSE+qJl8COMp8sVqHpqAtFzo0vQSOxBZ8mEoaBW7lm3a0vwU877uofnJsau+lqgCNvXIN7sxPEhCrfb+bNH0JmEM2MKFbB6we4ryfapZQGsyXi5cKA4xLvugOi2jRvWhyRR5qb9FA7DmO+6QyV7jo5oCm8epzfLpQpWUzYxtNVbAClxPzsomLq2rtREzi1TCaAnkrDsi7ksBjvO9ZyX8zgNjw/zfWu3YiQJVrR8nmMYANiIXstgn6xkDvWx20DuM/vhqFblYrWLUq7MmMMtGhqE4yv7/0d2c/fpWgKLmaFH7ELN0gpUiZ3gAKi0n1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Q12+M0OwuIkHlopjraGyEJ5y3DeGTjmnV498MkT3eM=;
 b=CBfz+GEoOOXQvca4AdB1a9rfs3NRMCnJ3kr/htZFQ6LH7qloDfVtjXM99vKVHXGCy+ksPNszLQNGwAuQ3pjQDYjbyXFeX0G1EJJ79zRVgusc91fNtCYNOYL8+E1OWzxsOhvW09zg2P8GVpnN3S/XUM+c7FjKHLfghigm4hCbm70vzxiPjE9YMu+kj4q11IQAhLk2Nuqj363n6o07yCJbNnjw5rQsyWkp3oEZjKW1571ouCGa6yKC96SsmQvWB6opbM/kkuBemaK5qfBzFGzk99ScmDfuapEgdbbWWApT/rJp3Y7nDsk+LQq/M1XlvpBRpVzFJghMYEnZVo6IzKGF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Q12+M0OwuIkHlopjraGyEJ5y3DeGTjmnV498MkT3eM=;
 b=BQ1g6RJvDYQ9CgkBs6yXnYIl3ricd0Sw4THUFkO2uLNUVfcnPyrC+rPi72jNSFbOnUjDgjN9agk15LY1TfQf9u2O8q8KiGqYAk3fEwmkrhMiXnC9S1xRcpIMsjXd78YyTqqo/S40uF6VV1yFid+0R7/24nuRG8eRItkynLh23TI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v1 4/7] xen/p2m: move xenmem_access_to_p2m_access() to common p2m.c
Date: Thu, 13 Nov 2025 11:16:27 +0800
Message-ID: <20251113031630.1465599-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113031630.1465599-1-Penny.Zheng@amd.com>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|DS7PR12MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: ab65e609-fbd7-44ef-6f32-08de2263205e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xwGO9fsoFLSPFSFcz246KUg3hyQWvfV/9V402P/E3W5D+swhpQIqx8fiWpeS?=
 =?us-ascii?Q?i9EKMbymTJKo2wjNtDgOINaP6L0UIG1SvWu0Tdknsigf5P5uLsfmGKblADe0?=
 =?us-ascii?Q?WsSLojJZBjreFgpBcgHtiahZ9uFvIGycMbCZ6GwWt4lRSNNM1tQUtuB2xSyj?=
 =?us-ascii?Q?XMRzWfSdJEM39EinyLsumwn4nZzxQA0fEh9nurFYQLylqYSNGDcQlF9UE6j6?=
 =?us-ascii?Q?UfsNrqSfDRatN4k8+EI0J1uzuiHjGo7Nq9hfH9p5aX1fSkQDjflre/Iozu/h?=
 =?us-ascii?Q?z0weW3YaWmGSuKb7oXuLG97cbWhSypmcZRv95a/mZuY/5T1cvTfbdazo2EYU?=
 =?us-ascii?Q?A/0cHVejrKILMWkoTglpiA3AU5gua/ZYCT6BiCTaopvkNno/xIgdU7osiyX9?=
 =?us-ascii?Q?CpmXuEqJOf9ExhxQghEXrVFcWMhuT5a/9St3LoFWzbzpO5HSJyS1Ub+co3tE?=
 =?us-ascii?Q?vDBADJ6+I+xvJsQEuI6BNqKntW364EYQeSClYdGTZ3PfGoXG6nlhFqSDGsyD?=
 =?us-ascii?Q?k+lyf1EI+8Y7G9dVnDkkDdW08DNoSTHaelnwCK4OA8UpSOISFCPyUvlRMbYe?=
 =?us-ascii?Q?JNZgAaGXMMZnLdqXmSqNTH10sixTA3WHoZehrnDjO+rFEFbvEtEwohehpyt5?=
 =?us-ascii?Q?zR9J9V3TIKegrOAoC5LqXeS5QTUJqLoAt87+9Q6yYjEO/5RrO1slY8kHw5wX?=
 =?us-ascii?Q?Vv38ukO9IoBeCzMEV4EEWuCR3abXPHzj3CQRuLfI5779oGf6mS9UpRRekWRi?=
 =?us-ascii?Q?R1Yor6FYBjr5pzbH1gcldKFLSSTQV9l4H9nOFnQU/RpbI2OajIs5sYVdsi0j?=
 =?us-ascii?Q?CgnHlslQsy7HfW8SbKZr3bOgb5ZQFRhTTzl8DsmiuzNV4wV0LjuU2zCerjQG?=
 =?us-ascii?Q?ruFAvH9Pq4vzk2J+RRwmoIBCx3lHrUUXD6KthkU9+QwIMbIgIo6e5ZttXFNP?=
 =?us-ascii?Q?v37/k9/8n1sJZtoqDoE937o21OXd5CR+BuWYoS9KJDDMxCz5ERW1DZPvmOy3?=
 =?us-ascii?Q?HSIgZQ4Dmu0LCqWuaJ4q4RjUxqPB2WPpRNxJOnUxysPpxeF9ZbdRJ85CuoN/?=
 =?us-ascii?Q?qZI32sS1GHY7JEvIm1HsfNK/2fi1upZQ46cxBna7BSN2M1go2qIXkzAcl3xD?=
 =?us-ascii?Q?/sz+2nOxYzHQeHgegMZdf3w4aI4ubp7DH2lEiLXXr/zdE6BU4HZa6DeyZDpw?=
 =?us-ascii?Q?T+9yIUxll/WKJnySNzOrPNkIDfyIM9y24cb6jJRp/bs2ZDaHrGa9ffZSjMEc?=
 =?us-ascii?Q?70mQQTQuvVj0AogSd/O7/4x49ZjfyDVrt8N+Rtq6/BmvVuyhoZ0BDqPTLFn6?=
 =?us-ascii?Q?KRrrDod+WSWDJ42TgxzI1uR62TXWMefr0kh4680DEIJF+d3Vzv4yptdhbzia?=
 =?us-ascii?Q?41TwVaHGobctc69j64STOej72TCXzb+Yyst918wWBaUd+TEMo0SHsT0dkqj8?=
 =?us-ascii?Q?TZjkQ3duHlhEfs6WjIf9uk5nPYLDEYXXMlBrnzLAgZszOt/LP6aDRlq+QHXT?=
 =?us-ascii?Q?h/FFN02yu3LzMaiRws+lXhHKlSPsckCb0js+j99Abq6FIgv/mrBaQ2HX7Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 03:17:07.2920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab65e609-fbd7-44ef-6f32-08de2263205e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231

Memory access and ALTP2M are two seperate features, while both depending on
helper xenmem_access_to_p2m_access(). So it betters lives in common p2m.c,
other than mem_access.c which will be compiled out when VM_EVENT=n && ALTP2M=y.
Coding style has been corrected at the same time.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/arch/x86/mm/mem_access.c | 36 ----------------------------------
 xen/arch/x86/mm/p2m.c        | 38 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e6b609064c..e55e53f44c 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -298,42 +298,6 @@ static int set_mem_access(struct domain *d, struct p2m_domain *p2m,
     return rc;
 }
 
-bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
-                                 xenmem_access_t xaccess,
-                                 p2m_access_t *paccess)
-{
-    static const p2m_access_t memaccess[] = {
-#define ACCESS(ac) [XENMEM_access_##ac] = p2m_access_##ac
-        ACCESS(n),
-        ACCESS(r),
-        ACCESS(w),
-        ACCESS(rw),
-        ACCESS(x),
-        ACCESS(rx),
-        ACCESS(wx),
-        ACCESS(rwx),
-        ACCESS(rx2rw),
-        ACCESS(n2rwx),
-        ACCESS(r_pw),
-#undef ACCESS
-    };
-
-    switch ( xaccess )
-    {
-    case 0 ... ARRAY_SIZE(memaccess) - 1:
-        xaccess = array_index_nospec(xaccess, ARRAY_SIZE(memaccess));
-        *paccess = memaccess[xaccess];
-        break;
-    case XENMEM_access_default:
-        *paccess = p2m->default_access;
-        break;
-    default:
-        return false;
-    }
-
-    return true;
-}
-
 /*
  * Set access type for a region of gfns.
  * If gfn == INVALID_GFN, sets the default access type.
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e2a00a0efd..f2bf5ef8d3 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2189,6 +2189,44 @@ void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
+bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                 xenmem_access_t xaccess,
+                                 p2m_access_t *paccess)
+{
+    static const p2m_access_t memaccess[] = {
+#define ACCESS(ac) [XENMEM_access_##ac] = p2m_access_##ac
+        ACCESS(n),
+        ACCESS(r),
+        ACCESS(w),
+        ACCESS(rw),
+        ACCESS(x),
+        ACCESS(rx),
+        ACCESS(wx),
+        ACCESS(rwx),
+        ACCESS(rx2rw),
+        ACCESS(n2rwx),
+        ACCESS(r_pw),
+#undef ACCESS
+    };
+
+    switch ( xaccess )
+    {
+    case 0 ... ARRAY_SIZE(memaccess) - 1:
+        xaccess = array_index_nospec(xaccess, ARRAY_SIZE(memaccess));
+        *paccess = memaccess[xaccess];
+        break;
+
+    case XENMEM_access_default:
+        *paccess = p2m->default_access;
+        break;
+
+    default:
+        return false;
+    }
+
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


