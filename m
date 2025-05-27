Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE8CAC4AB0
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998004.1378881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1E-0001yR-N9; Tue, 27 May 2025 08:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998004.1378881; Tue, 27 May 2025 08:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1E-0001oo-DH; Tue, 27 May 2025 08:50:44 +0000
Received: by outflank-mailman (input) for mailman id 998004;
 Tue, 27 May 2025 08:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0L-0002ks-6j
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:49 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2407::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8888d0f4-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:44 +0200 (CEST)
Received: from SJ2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:a03:505::20)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 08:49:42 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::c5) by SJ2PR07CA0011.outlook.office365.com
 (2603:10b6:a03:505::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Tue,
 27 May 2025 08:49:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:41 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:39 -0500
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
X-Inumbo-ID: 8888d0f4-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxkEoPzguB/T28ljyQp+pCHyZEIqZDL6Hb+Ynn+WE6bfMbpeWi3RkzAAPW/ljD74Yu+DH1Wf1C74Q69aGrD2ieKQ95zepCpqKo6QBQNWlcHpvQxLoF+aYpfLevv/wUPuJ3WSTYH71SWlbY/gV0SmdGnwybEdfXs3en009ny0Dch0oArIHNqQhBGqZ1l7OYxce/JgMMCJwdeJ2EVVsIgcsaDJeOmh2PT1sHQgHxbAMzsi+kRrTowdTbgDfdCWx0SvDc/G84M+v8RgL3goYWBSipaxn47EHVANi+qx1iAggjMu4Z6nfoWmAgOi6DodMFmltS4APSPoG7XPRqyC8KmNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udVnsou+9c+YNjZiXHLgK6AMVgKetWIyil6Opn22eBs=;
 b=w58F/lrGu7Ji22vueQwhYyi4XKoVOyiuEWztjoKXDFlCz9iFJbCORM9YQ8S3nNFfAz6w7aUVUmTPQiqR738VoGzjG7UDyZtgaH9OuqOAptUaxD8LYYu4Yy47eBR9jMI+A7/+IzP+3a35W/ks1suwFT61y/PeVJR/Vdb6boiVxTEdChnF6PTSPzfagtwHPyWpk4dyPcFnXsetz3Np6Aidpb9ElfXNbavqbKqLnKSC2qhNmMJjpM60db+KyhK1ob6vl6g7Xum+JWnBeJxuOrvNXbA2YSQ2o4AYlKpjPgPilCdBM25pWDr/zpDRLafZMRxT8eMFVWSmiYrgSz447kb/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udVnsou+9c+YNjZiXHLgK6AMVgKetWIyil6Opn22eBs=;
 b=mGpedRMGv1hb7fEFm/mH9RdsrwADqG/XuiqF5dZ5A630+gOs+ra0KYHsMBKZDps66JFsB4WwPnI++ZHGOBqJo3pcVbYpoZEciYj6/8vYfGtvPcYC99LqFytOZxB+eH6ZSgJXWe+YHy9EpgWKtQTfifN6SNTq6EwYBH3FZPc/vWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 16/18] tools: drop "has_num" condition check for cppc mode
Date: Tue, 27 May 2025 16:48:31 +0800
Message-ID: <20250527084833.338427-17-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb66d1a-e742-4b2c-49fc-08dd9cfb6bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jQqiZc/nDcgZbWmQeA/kE+kCLsdPZ+qHNdLCdtVxuSuMDsiI5bsh7iO7kKzU?=
 =?us-ascii?Q?caK50ZzqsUjzpphPnaFQLtwwVSWrdHUJASBFG6ynfAj2J4mNViH7OuYwGW9G?=
 =?us-ascii?Q?/xlZ/ALJ8ir/dFSeQg7ecmBKKNPujT+rq3T0S8F2TbaZWl50xwMchqT98FYF?=
 =?us-ascii?Q?RrN97dBU/AqAfFW272ASsbmjT06ewxxnu5nfauL2FUbVS9ntSGzECWVOrbQc?=
 =?us-ascii?Q?yu1s23PN4fMTZZX5+FKKD9n4xRn2SKWPV6/B01QoqYZd0/U/cM2TPCoLOKdg?=
 =?us-ascii?Q?ZKbvCcxfEblSY2P+nkxiBrVA7SDetiZBt4v5pLO4gV3zmdkjFgUnXTr5lvsO?=
 =?us-ascii?Q?iQeJjhZqOp7wGNSYjdW/is+rger+fdxHuU2w6vPJIYllmHLP8NQuEQUoPSTt?=
 =?us-ascii?Q?afZwr+LbZ/bcDZR3O/OrNYGquU0oMmBUzWp6bWvA0a566nG21JoGssdRvwGm?=
 =?us-ascii?Q?IbigfrseONoEf35LfAz33H2BP4yvGBqu9C00XfbD2+Fsd+OjgB8gn8AqdLME?=
 =?us-ascii?Q?YthEiKEv4/2vJz0oUfKOh5b+UAU9ftqifsWPxwD9n0A8JDnfZ0ksMt50LvUQ?=
 =?us-ascii?Q?tKt4H+IlAiHLDyQGYTbYBOBxUi8KdgYfSd6tVckTTA+EXZadlsiLj+3ahhhX?=
 =?us-ascii?Q?yXmFq/OHTJFhE/wSraNMfRqm37waK2TgikMii9oQ+Q6PPwpEMNZL/poyjwqm?=
 =?us-ascii?Q?WdRxnCxmIxH+y9i8yux+k4L1vEy4xFq6r+BOrMpPVLUbWx/HGCFGJQMaOTP5?=
 =?us-ascii?Q?oOB0dIaQbOxxtPEmSZQCVDs5HE4HncXgE3vX5quMTTtABfOn24hluy3Jhri9?=
 =?us-ascii?Q?X9FyrOG5NKpWwnmLnzkDRrnvFJ6kji4fJMDPWYyCvHQOX1Trp5YQBnoIQ3Hk?=
 =?us-ascii?Q?rmf19EAQSIG1OlFh2XCaTeQxn02lXbcEn2sxUAPOu2Y0MA8z/hUhPEEXUQDN?=
 =?us-ascii?Q?LH0xU+fBuxBV3Ts7/gqB1o28v5wW9426JGG0amv8TfFpkxamPyFZppGgJ7zC?=
 =?us-ascii?Q?Xs8Qj150KtndkU4+Og319kN8NCf9kqsqKdlebrLaT20KZ1ce+qrcxxHbw2RV?=
 =?us-ascii?Q?BDjpaFnOGrGcMjFsfKnBN5B3SI2MTdBB64CMWay2IHmJBhiPmTIMdWxzouXZ?=
 =?us-ascii?Q?nTtsni3j4k83g2MqzE53OeKPIUAmRJNtWJ7ilKYMWCFcNc6l1d2Z+9GbEe1t?=
 =?us-ascii?Q?O3efLIM2U9nXjnpsmPqkSpxaDJm0Z5fs8GgLCd4sh+36V4qa9S2n50d5GXis?=
 =?us-ascii?Q?cIyb/YUOlYhLO/zkD42gGA5ats2KuuVW4fRd3r37SaaZ9dSRY4nw2lM/XSnR?=
 =?us-ascii?Q?WhUo0ph9OsxQ79hmCx/FYBkUoRdfW8hZvGxHvQhwikqLCr5BrysxNpCSjBwx?=
 =?us-ascii?Q?exFnbrgJsi8mR91B+eAg08YFzO6EOWb2vfJ0axA4rDRILV024VN97iUKF7pH?=
 =?us-ascii?Q?KtqjVXEOyKA5/3Tyb2EIrZCxEEFM917wDxGzc7Vx4hvF/XBbssQpjJ97EWCP?=
 =?us-ascii?Q?7ThRtQzvcSCTBanWUotzYGnqHLn3nWjrexEV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:41.7369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb66d1a-e742-4b2c-49fc-08dd9cfb6bf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529

In `xenpm get-cpufreq-para <cpuid>`, ->freq_num and ->cpu_num checking are
tied together via variable "has_num", while ->freq_num only has non-zero value
when cpufreq driver in legacy P-states mode.

So we drop the "has_num" condition check, and mirror the ->gov_num check for
both ->freq_num and ->cpu_num in xc_get_cpufreq_para().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- drop the "has_num" condition check
---
v4 -> v5:
- refactor title and commit
- make all three pieces (xc_hypercall_bounce_pre()) be as similar as possible
---
 tools/libs/ctrl/xc_pm.c | 43 +++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 3c9e272aee..cdc072e757 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -212,34 +212,41 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
     DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
 			 user_para->scaling_available_governors,
 			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    bool has_num = user_para->cpu_num && user_para->freq_num;
 
-    if ( has_num )
+    if ( (user_para->cpu_num && !user_para->affected_cpus) ||
+         (user_para->freq_num && !user_para->scaling_available_frequencies) ||
+         (user_para->gov_num && !user_para->scaling_available_governors) )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+    if ( user_para->cpu_num )
     {
-        if ( (!user_para->affected_cpus)                    ||
-             (!user_para->scaling_available_frequencies)    ||
-             (user_para->gov_num && !user_para->scaling_available_governors) )
-        {
-            errno = EINVAL;
-            return -1;
-        }
         ret = xc_hypercall_bounce_pre(xch, affected_cpus);
         if ( ret )
             return ret;
+    }
+    if ( user_para->freq_num )
+    {
         ret = xc_hypercall_bounce_pre(xch, scaling_available_frequencies);
         if ( ret )
             goto unlock_2;
-        if ( user_para->gov_num )
-            ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
+    }
+    if ( user_para->gov_num )
+    {
+        ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
         if ( ret )
             goto unlock_3;
+    }
 
+    if ( user_para->cpu_num )
         set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
-        set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
-        if ( user_para->gov_num )
-            set_xen_guest_handle(sys_para->scaling_available_governors,
-                                 scaling_available_governors);
-    }
+    if ( user_para->freq_num )
+        set_xen_guest_handle(sys_para->scaling_available_frequencies,
+                             scaling_available_frequencies);
+    if ( user_para->gov_num )
+        set_xen_guest_handle(sys_para->scaling_available_governors,
+                             scaling_available_governors);
 
     sysctl.cmd = XEN_SYSCTL_pm_op;
     sysctl.u.pm_op.cmd = GET_CPUFREQ_PARA;
@@ -258,9 +265,7 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
             user_para->gov_num  = sys_para->gov_num;
         }
 
-        if ( has_num )
-            goto unlock_4;
-        return ret;
+        goto unlock_4;
     }
     else
     {
-- 
2.34.1


