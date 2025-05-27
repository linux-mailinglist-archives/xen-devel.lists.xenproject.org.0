Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A5AC4AAF
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997984.1378837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq18-0000mi-2V; Tue, 27 May 2025 08:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997984.1378837; Tue, 27 May 2025 08:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq17-0000ju-Ud; Tue, 27 May 2025 08:50:37 +0000
Received: by outflank-mailman (input) for mailman id 997984;
 Tue, 27 May 2025 08:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0L-0002ks-Da
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2416::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89004f6a-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:44 +0200 (CEST)
Received: from SJ2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:a03:505::28)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 27 May
 2025 08:49:43 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::e9) by SJ2PR07CA0015.outlook.office365.com
 (2603:10b6:a03:505::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 27 May 2025 08:49:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:41 -0500
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
X-Inumbo-ID: 89004f6a-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdBXsxIG/ci/tcVUBdtGlKDzQXfQ0Nk902E9Z9iuRTQ6mfIXzk4iJ2MaB9ivPUmw4UtCRjj7TKEj8ZMbTQrR5zOvPcfqc21oUk9rfROEpD/sh7jTOgW+dH9ht2BgQW7RMVIaEWFonkM6e70Sdbud8485/PcGBJCb1Z2wYDT/ffkrvKnGOghcLivaRDBPwgf3VeoXkGM9jKjHjoVp7+365GkZOqWXU5yszVtKycQMT1FrAso8mbzpPILLSW8NUx/9kxt/bFL3cV/XFBy4xOmpgJX9QcS5yLHOs/e0lbll9MQutGUir0eUyZQmOxUmRYOh8aMzB1PNx20NId0pzz8hAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3Tn87xWwjj3VP5ECGhcDNI0MAhylxGbzcaSKHPCXC4=;
 b=AxTMKWgFoLFEDzYz+REysTjcdYUoahqHgcmLOU9L7KlyhGopmHyX1F7oW2EjIBIErNzUk9/E8N0zZcivoRHPlozVwt44SCS13RD+1xf3e4lTaDPpTlxaFTGHl3uXiQHjDEwbSOuWzdbjrV4SJbuSR5nQ3aexijM+vwKBjTnfeMUlLivLEXXYzM8ofB8HMg2gbgoEFpt4t6DIRKtFowSqtGK2KEV3lHlSa0HC1xADlnnVSaXbW22kflbWH/DrbnRhoTl3ISPRe5kqS8aL8+VOvVx5UH4KZhwODQ6K/oCZQpAkwfliAowXsBGFqZIUR8u0iobJZJqzSC4GrNj5mjfMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3Tn87xWwjj3VP5ECGhcDNI0MAhylxGbzcaSKHPCXC4=;
 b=0DkIXM1MkreuXk1OjEXtElaRcls6k8D7uKfM2N4YhRWCAih7RnpsRDriIfdz+1iZz9BejeEZILNjjPQ2l1Mv9e3fqprHoESbTgnkppkmRsXU0LS2Ph5kaxe5l6MDIi/Dde4Vb9jJIgJbRZ72l/XjoLVKDcMcXngtuCPUnKeXbFA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v5 17/18] tools: optimize cpufreq average freq print
Date: Tue, 27 May 2025 16:48:32 +0800
Message-ID: <20250527084833.338427-18-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daf20f8-ab1a-4be8-b8d6-08dd9cfb6caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZW6qtrRa5F1TVvmHcRjpCB1LV5hy+A/PYfTgi7NoUMKyf7UDRDAc98CfXHMp?=
 =?us-ascii?Q?d8NO1asPptPNr53VxEX5QmBCzxCfTCepfchGR/+ksQBLRDVXrOLp2WzTGVZ1?=
 =?us-ascii?Q?youdddWJSam+NuO8N2Oqs4xtnWwhlpPC8q+l/CTHFaP0puAOAAKO6ujT3GlI?=
 =?us-ascii?Q?fN8ag4bv2fWUPsoQBFaDUFBnuq7CPxMQoaNqvPYdwy8WPEPk3TUwtP94A+4B?=
 =?us-ascii?Q?18NT+IP1KSCVZXuNBXwkeHtnh2sLL/iFQY5f5SMFp/MmyaRya2GBptQhmpnR?=
 =?us-ascii?Q?OpNa8iFHTDp+nglu9RIch4wB96Quhd2klIQiXoNeIPSCjM7Pd5HB01y1fsQ0?=
 =?us-ascii?Q?5BwUHprcA85KYlWNH53wiFwKrLfAGLk4ZpHpcNsB9XHfMzer+lELeA1wWK9P?=
 =?us-ascii?Q?NOqf5jFN/G8+mf0RNgyjnF9ImTgzfQucOa3T8REnWTld+uAeCPv0fTDL3cYv?=
 =?us-ascii?Q?1o4rA8uAc69cBirvJ5Oy+LZm+IeDNZQenLrb88WW0MIHfOIuvdphqaxFr/Rc?=
 =?us-ascii?Q?2NOw6BAgdJOAoZ4yaw/bhdILL7BP3UrKSxRGJHk6La+3QcFo1l6tUitZzPw/?=
 =?us-ascii?Q?1u0Aofu7D9NAUshO+vS3sfhN4SvwzUvIQ2dL7XWkKVhtkj59+Oa8b7QxfVy9?=
 =?us-ascii?Q?7Y9RuFOpiRH/sNu40JeMp2rKy/vqEJ7cNfJWyEN4gsYZfVH/THQwwX4dP0fM?=
 =?us-ascii?Q?rXYGVjxbgT86dl76RI5msJ1V+KD2mRIkZrbhqR5/GJAeodfI/RQuYxDDUGu0?=
 =?us-ascii?Q?fVLOMjP1wFPyQEMTOyZVYKQa/7ye6ReAlM+6PwBvhlhPnpXLIcIrscsSShSl?=
 =?us-ascii?Q?AcE32ix4g5HAcvONcswWXXp2fiSEdtuAxefkAgQuKf7uWcHOlbfQ48KqLaXc?=
 =?us-ascii?Q?wMDU5/93tZ185dJF5ULMpHIku5MfL/HeJObGxXO+eqNj64DapzxzXKbbcMjF?=
 =?us-ascii?Q?gMLc9qZyU6MFemRwwnRQzzuAYvIgyoybkNYcUosiXzQth8J55ECrYeyRbzYR?=
 =?us-ascii?Q?s7nMo+9NjtdXRA4biICzAKh5EhZ0jVpgmJJrwWU/b5bw+fSViXEv4r12Vp+7?=
 =?us-ascii?Q?8yMpFnXX3IMqm39aKPAVp1I+aRj2N9I0JBsxxOFxOuUMfLadwVi42H1p7FMc?=
 =?us-ascii?Q?IRDAP1kC24Umog5xbj4gt8yrGd77I+Jj4xayUURrkxWwkheBA7S8ncmgp1/o?=
 =?us-ascii?Q?EezpZ9gRPe3bgXv8pILqmkw6EygX4XMmozjKNLojCGixNp2LNjVBxFMJ+/r0?=
 =?us-ascii?Q?3ERnbSxM+Fwn7e1rXgZn1Hbmxt0qnnLecNZRkBAUaOhZBUXD+0qmMn1H2am+?=
 =?us-ascii?Q?WSBjE1hN5UZL26yTG0kaXAcnGNX3xLgCqV+Ti6Jv7+JkZN2VkKGLsG8Lp8iV?=
 =?us-ascii?Q?mDflazH65B1t1XCAjqirklJpXHmQeKdLq+EOUksiOKyvjCJjPs+3gqhVnB3A?=
 =?us-ascii?Q?CtnFabfc4MtiLQJP3JzcMUrGaZEBOLWL4Uno9azVaW7i7syVDAfeKVxZ4VcV?=
 =?us-ascii?Q?xpmm5mcbZ/uWXZ5dg7Row9qHBsXLTJoTJqra?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:42.9399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daf20f8-ab1a-4be8-b8d6-08dd9cfb6caf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA

Unlike Cx/Px states, for which we need an extra loop to summerize residency (
sum_cx[]/sum_px[]), we could call get_avgfreq_by_cpuid() right before printing.
Also, with introduction of CPPC mode, average frequency print shall
not depend on the existence of legacy P-states, so we remove "px_cap"
dependancy check.

Fixes: add6160d7 (Add cpufreq actual average freq information to xenpm tools)
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
v4 -> v5:
- refactor title and commit message
- call get_avgfreq_by_cpuid() right before printing
---
 tools/misc/xenpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index f173e598ea..2864506da4 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -497,9 +497,6 @@ static void signal_int_handler(int signo)
                                  pxstat_start[i].pt[j].residency;
     }
 
-    for ( i = 0; i < max_cpu_nr; i++ )
-        get_avgfreq_by_cpuid(xc_handle, i, &avgfreq[i]);
-
     printf("Elapsed time (ms): %"PRIu64"\n", (usec_end - usec_start) / 1000UL);
     for ( i = 0; i < max_cpu_nr; i++ )
     {
@@ -540,7 +537,8 @@ static void signal_int_handler(int signo)
                         res / 1000000UL, 100UL * res / (double)sum_px[i]);
             }
         }
-        if ( px_cap && avgfreq[i] )
+        get_avgfreq_by_cpuid(xc_handle, i, &avgfreq[i]);
+        if ( avgfreq[i] )
             printf("  Avg freq\t%d\tKHz\n", avgfreq[i]);
     }
 
-- 
2.34.1


