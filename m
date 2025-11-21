Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36467C77BFE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168293.1494369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt0-0005F1-78; Fri, 21 Nov 2025 07:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168293.1494369; Fri, 21 Nov 2025 07:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLt0-0005CN-3b; Fri, 21 Nov 2025 07:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1168293;
 Fri, 21 Nov 2025 07:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMLsy-0004hA-JR
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:48:52 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8442ff06-c6ae-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 08:48:50 +0100 (CET)
Received: from MW4PR03CA0001.namprd03.prod.outlook.com (2603:10b6:303:8f::6)
 by DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 07:48:46 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::6d) by MW4PR03CA0001.outlook.office365.com
 (2603:10b6:303:8f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 07:48:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:48:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 23:48:42 -0800
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
X-Inumbo-ID: 8442ff06-c6ae-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEIbg2WbKFC9efOy8ENuvVuNreaCkYTtlo0+PsknIAB2hUb+QzV523+OWoLbDRnMh76/R0kgaBu7ShFzMqXsOkL2V1sUAVHObk9PA6nfeuCj9HOYO7OMAbzVn6/u5lqoSZ6G7LLaazVtqzSEz1Y/YnKxSu0Lhdqd1hekvcGInHuJc2WCVKJAgUyJVr+pzS/Ed0WfTbM+1+Det/i5gHbxj5wq9whsP+6HYgsAe3lb1TdIUGbXmWCbDvAKWBPA6rgY8QDcL0avi0HI8zwIWK0I95rFe75bego9i3drLbqusCb9E5GNYQglPHGx1u/DTlRqzQFA2b+N1QZ5069Jk2PZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDAbNopACv5O5LpLWh1vQ8zSCmW+KHY5SViKu0W024c=;
 b=hy/UNXOPZc87TFo7Kq6f7KTPDTOMawDSv0vUlXu3GC6hG8jZcjpdxjQmvSUZeeF6xzaHwoBtZqFpsVDySQGr+RIDJfycj5h5coLcwchrw712vt9QdaK6rder/1yYcPN8DJoPvQ86DNh8j5OYk3rWX8CJ+hYRl5lfN3DOCle4TfG0lz0FzRkY7A25N+xn++72hE+1xIkDj5+rI52yJeTxrMF+HqmaE0nrC96kGtwOihvv9wj9nxWNYL1pPyx80AbLUcOyMk7FA6P3RBTed40YERulIpHo96DUBu0AxgdBwosy8xY2tvClSPLA12fnGdlDd5DkfgIqrDiOFsumiPvong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDAbNopACv5O5LpLWh1vQ8zSCmW+KHY5SViKu0W024c=;
 b=dG9kLTdVG4lnTyJsewaS4skJD6bmJxg7mGN/Ay2ltNImAa6dVDMcXRCbx0mjmhKRY8wrgiF2HmzPQQg0BYerjF7vg62LiQVW9iQ+FvKcs/E/jUVNH6F1cWe+sJghEsBNTKgGnX35/TAEttKZGb8pA2//m6PxeuzAE7gNN1JRuPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 5/7] xen/p2m: move xenmem_access_to_p2m_access() to common p2m.c
Date: Fri, 21 Nov 2025 15:48:01 +0800
Message-ID: <20251121074803.312568-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121074803.312568-1-Penny.Zheng@amd.com>
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|DS0PR12MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 440fc3a0-4ac8-40b5-a67b-08de28d2669c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IgZ00L6Gl64s/IqaTcXzPfBbUZRHaw94erktVYOleNPhqtzUq/aNMSgoKLsm?=
 =?us-ascii?Q?ZL595al4ST88WZrJUkGMmCJ9vFwRxwnN3pZZD6G7JL6p/NOWr5ZU7Qffn1qS?=
 =?us-ascii?Q?HVWn0fiXa0Vn0Nap4jfud1NxN1uuZ8ogqzxNqhkPSrFa+6n4PcOYxsRNQIMN?=
 =?us-ascii?Q?dcGmWBACNidr+G2mYM8mhNl1JMURieonDUWlCzOE+Ol3dL09tOV1VEqEMKN+?=
 =?us-ascii?Q?tejaT/uOnHWX+rGYnZ/nBy43Q7BPUQB9/RMMeyrYAcyC7pTwOEhwmrWjCyhw?=
 =?us-ascii?Q?ZeBLmcKvxr9AXaUDsgeV1qdy2JA7E8ua0Jf9BH1Se6Zi9I7IWihgedJeYUD9?=
 =?us-ascii?Q?a1XZ9Y6CFgkpouiyWTMOWb7Tdd96tLqZLAT8ISJ/aagCipfX92c7J5nIlvuV?=
 =?us-ascii?Q?nwB8MuWyi67SSsx9VCPtAq+pUczrx8YiNHaNPGoQ9Ux4GSCZY5Af3VL4K8kQ?=
 =?us-ascii?Q?kmgMIaX9MFXdualn8YNYZYKUOLh7jm4P9C0HXp2AG1z+ErPlRVAnM6Gysqg4?=
 =?us-ascii?Q?EbRtpuk3CPUrEbqoyPFtd2VYPA+sX957C2pteHNj1wZjmjAzdt3bhVTObytr?=
 =?us-ascii?Q?BT5G0KO0U449S99gwVt8OGJYsswz67p3NC50TgCtdddnAcNrhsJ99IeqkOmh?=
 =?us-ascii?Q?o/vcBfG1PqthaAfmxO10DcEyz3YP2SpTDDjNRBLweFngzz33Opw7Fqbhe3fH?=
 =?us-ascii?Q?AyPVyYGMniocmwF2Mpu9wIiYoBS98HQdeDuDjR9gFH3KOq6LI9lh8pG5eB6c?=
 =?us-ascii?Q?SyLFNgSIa6ynz4aAxOsZQ6KgbDnsE6XzwWlRzOgQ1fdS6itmau/dI6NnMBiV?=
 =?us-ascii?Q?s7fEjR1S8PaNd1NXWgmFIAad5nLJ2Wpw5xl23FGueK4otWR+2xsn92EeOmbf?=
 =?us-ascii?Q?RWVhSJ2Y3bnFJPboyaAO71pWigezIAo7CArHb8U49/UHUXbgx8i2F1MWT71s?=
 =?us-ascii?Q?WxE5RLuS18pz8trcF1kgo4Nyq7+0TW/AvKQQmalk4uQfar+EV/sXaUKwDI0G?=
 =?us-ascii?Q?/Sfuffj8aGYYTpgksbYuPj3SGqCwXWJX7hKLH5qrFKClbDrsJ0Wj+IxHcl55?=
 =?us-ascii?Q?J47aTdB9cm0134UdTvUnIfzF7WX+w9toLMplICoDc4UaGuQBExfqv2t2+oMu?=
 =?us-ascii?Q?2/BxsG4P0dwFaPj/J1vuZHn/WUXVYxheucilscam53KgAYTjgMGp0EPJXUId?=
 =?us-ascii?Q?TN8rop9A1vN/YjZRtXHFMeWaCxb51aKzO//FL+LCgVOsv9TcXlYdRw3t4E1v?=
 =?us-ascii?Q?t3MplaF8jA6NTeX9bcSG3AR6Wjee9sdgJNkYTAXeCCn7mNOttzndqFGCvNKN?=
 =?us-ascii?Q?zYkEFqkHHL/6V2c11o1N4toJvfxU9smObiVyJJXKps1MpQrj5RPpw4CPjMv3?=
 =?us-ascii?Q?67yr883wlDhyh+dpbFvTlsl8IT/gAs/svwFQ4UoPEZf/TcRXPjR5RbqUo2I+?=
 =?us-ascii?Q?nP8M4D3SjgaITsJe491WvE1cYUnzjUC/YPb7VTQ4nMWP4NfLKPfQlktdmVgU?=
 =?us-ascii?Q?GO37oSNurUfgCcY5NsOsZCos2yKer/+fYMP88BZ76fGHDj0R7q2uGSYHMkJP?=
 =?us-ascii?Q?YgxXv6vfOVWm0hvm58U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:48:46.1645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 440fc3a0-4ac8-40b5-a67b-08de28d2669c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447

Memory access and ALTP2M are two seperate features, while both depending on
helper xenmem_access_to_p2m_access(). So it betters lives in common p2m.c,
other than mem_access.c which will be compiled out when VM_EVENT=n && ALTP2M=y.
Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M, otherwise it
will become unreachable when both VM_EVENT=n and ALTP2M=n, and hence
violating Misra rule 2.1
We also need to move declaration from mem_access.h to p2m-common.h
An extra blank line is inserted after each case-block to correct coding
style at the same time.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M
- Move declaration from mem_access.h to p2m-common.h
- refine commit message
---
 xen/arch/x86/mm/mem_access.c | 36 --------------------------------
 xen/arch/x86/mm/p2m.c        | 40 ++++++++++++++++++++++++++++++++++++
 xen/include/xen/mem_access.h |  5 -----
 xen/include/xen/p2m-common.h |  3 +++
 4 files changed, 43 insertions(+), 41 deletions(-)

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
index e2a00a0efd..2763f9a6be 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2189,6 +2189,46 @@ void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
+#if defined(CONFIG_VM_EVENT) || defined(CONFIG_ALTP2M)
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
+#endif /* VM_EVENT || ALTP2M */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4de651038d..8e7d9ea2e3 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -73,11 +73,6 @@ typedef enum {
     /* NOTE: Assumed to be only 4 bits right now on x86. */
 } p2m_access_t;
 
-struct p2m_domain;
-bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
-                                 xenmem_access_t xaccess,
-                                 p2m_access_t *paccess);
-
 /*
  * Set access type for a region of gfns.
  * If gfn == INVALID_GFN, sets the default access type.
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b98..bd4169caee 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -43,5 +43,8 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          bool readonly, p2m_type_t *p2mt_p,
                                          struct page_info **page_p);
 
+bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                 xenmem_access_t xaccess,
+                                 p2m_access_t *paccess);
 
 #endif /* _XEN_P2M_COMMON_H */
-- 
2.34.1


