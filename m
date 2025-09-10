Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E6B50FDE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117685.1463809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWw-0005vy-Ll; Wed, 10 Sep 2025 07:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117685.1463809; Wed, 10 Sep 2025 07:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWw-0005s7-EX; Wed, 10 Sep 2025 07:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1117685;
 Wed, 10 Sep 2025 07:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQs-0005yt-7K
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56205dc0-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:52 +0200 (CEST)
Received: from BYAPR02CA0047.namprd02.prod.outlook.com (2603:10b6:a03:54::24)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.34; Wed, 10 Sep
 2025 07:39:46 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::12) by BYAPR02CA0047.outlook.office365.com
 (2603:10b6:a03:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:42 -0700
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
X-Inumbo-ID: 56205dc0-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFhzBuSoEqGo1qfmYewzY2UDPyyD1XOvaCgJ/Oe0sh/CWf15by+aBzZBf8H4bApY7q7bm3isd51+EbqDoVxAZprboRFpwg7smhH00J2UVo34C88MfnjNKvVL/oQXVYxh0qV+agk6v7g/BNeBjmC92AQQ9LFJskpakbPr3pmUHNrhZ+/0+dxINzgpxM2Y4x91f0aW+oj86X0V1hgM6twM2r3zU1T6Doi/CeZX823mcgYVzJCTUnt6hZI0dx8NfsFd73dje+Uvn+zMyw8Qz1bq5B/uiCC2ivHjnBl3SxCDaSeDPn5a4bdQtiPCOcVy5B+XU3HUzDrcG1YySIveURVQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkokiDvf/GT2g8eWcD+vSGI07NbkAbkWkG3C6DWEVjg=;
 b=erIj7X08HTx3JEqR+EiUBdvqPVsBNcp5hl4FvpNg8kYP4livdjI3ZcfsWRahkc6VA2XZsU5V1SJAEJzA3NIlYumVmLIWo0pAJ74ZlnatdIQgDX2ZTDqOCSC9aUljggHhSoYMP5jTlACYFDNMsMSfwbP7pk7bgkh5p8taiXs247MeWYlsCr41088E5KDk2cJfn1qW4VDpLePIJ9rBdseKaWCmFUryA/LeLYRcNIwZs0eO3kW68EKZq243Xr0kzuyFyqhN+WrLZ3NXAMgYbFUmuwIdO3gs1bBa7rCCo6K+Rg3CrocNvs0iNDTHA5+R6FMKnXq1z1NzO+xYTSlOOto73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkokiDvf/GT2g8eWcD+vSGI07NbkAbkWkG3C6DWEVjg=;
 b=CqYunTH/CciNKIrKwijIzmwrADepuLsVJpR9h/k0scVLZ9rCCg3r0BciC0/qgHSRe2+sU1ZLZyNqayrCF4MyW6ZEu099XJCk5etH/XCIFE0VA4yB+a1gSRXU2Ini6X5xBLpoJTmH/+NylDkDKJ/cn/zmaV3VsFs3oXj6hiHu40E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 16/26] xen/domctl: wrap arch-specific domain_set_time_offset() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:17 +0800
Message-ID: <20250910073827.3622177-17-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SN7PR12MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a24d557-f83a-4dd1-fc8f-08ddf03d3729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vhuvEjMv/cpVb/VAqf3IpSIPlbny3JZsTOL8KONxHr7UEMtnZU5jw3PpXhg?=
 =?us-ascii?Q?W+U6i0YDgJf69lFf9Di4z1ZgDTB1R+bh9l5fui92ha6Y7PPUSYqgrg8A3SjC?=
 =?us-ascii?Q?AZqS/Cqgg5uw/e+5YIKYaT9+omdSEvVhFYr1aQsY1DlGprgbTOXkyMX7f4ft?=
 =?us-ascii?Q?76QkTx3EW7z2pznpsp06+2u07DXgj1nTUHtFWMGSKZcY1alPitOuTaEd8ivo?=
 =?us-ascii?Q?NW6WxX5Waqw+DXP89YHbF4zxScogxSwY5uloHPqtkyusDwzdsZfnyWeq5h2+?=
 =?us-ascii?Q?fQ1R9Sw689a9vQFFyGCBby/CwqAlIe1USLnEIEEqSMm9Lu68SuxaJdCksVUj?=
 =?us-ascii?Q?TG6kvfSmgt1A+buRZKsP7SMNwOYUi9mgRNbLTKMPRKMCCqWSOrDynN5fnC4t?=
 =?us-ascii?Q?O3ZRbwtRfCoImr2mudqTS+56jROFJG4xGrskYpjnVRP7p5YLjGVB4ilF9cUq?=
 =?us-ascii?Q?OfRwQreFDHCWpGI6Kcs3VR1jMvZ27L9k5yVC6DN1KBgd6YsGJapRUOmGfgjc?=
 =?us-ascii?Q?sNaWboh/Vh+pkdOrHSJ9UU6zP2mNFcRECL5xWAwXsOEZWG70uvNe6b2R+vL+?=
 =?us-ascii?Q?HEXbl179UVRkT8G1rwiszoAVYe6q5WBRMl2cbtCe3npyqSkHUYz5JsPM9FDP?=
 =?us-ascii?Q?soxUMAUQlHYx+xdRh9jhfbOCALi662DQmOKbww7TYTBhDUlcv2h0FW84KBs6?=
 =?us-ascii?Q?2RplZX78z0/rmxZK3wra7aVWNxyumlp87tE1krEWuPstWoLlXx+NVYJNVzlm?=
 =?us-ascii?Q?79YKpo0aP2nVTiq3LUehdIA6Q+Fj3Zfoa67cVeEAzVn8Urn1FMHS+OcFfyQv?=
 =?us-ascii?Q?UIIrbTgduK0QPAdUXQ5RLKJavRnkAWnrz7EZyRls8HLKGVmpGV/ZQAyEyr33?=
 =?us-ascii?Q?46eu0apmll0gDJj4gotwXVmVSYzdf3Zl4NmiZilwx7ZCKAh0iVFoV3MHSXuF?=
 =?us-ascii?Q?7k8aazlkJ7UW/Oldsxx/L1rFLEcT7QTJPXRGvIgA9MJ4+FF4Hi0NGAALFi1M?=
 =?us-ascii?Q?wRMIf813TxNg+lMBQUODJP6q3ScpADIgl6Qo/q7xm65MQfkteNa3NLfY4qkC?=
 =?us-ascii?Q?CDXJhIdonC892Mnn4LKTzFu0SD73E+7U57ripeX9KrgIBtyo5K49oyZs9RuC?=
 =?us-ascii?Q?R1bDRhF6xHziyyEA0qva8gqQ9swi424BAQ1W5b5NwaKhDUQT4kanhP4S8/lL?=
 =?us-ascii?Q?X9/Brszy/Ua1v2nswqRtDSIWKVcwOkcEjakIsJeUgD6f/UwEtWFEFjQeUZhf?=
 =?us-ascii?Q?DTqa8XAuqbZKxH8NfcT2/c+DOkPd9i6LwADd+R2WvoW02bdujZV540sM+ImV?=
 =?us-ascii?Q?WJktsgGYe0tImxdiRrxbv8bbsNgEbpOZf0CzQQ6vFMlqr6S7e8ZDQWCGoBH+?=
 =?us-ascii?Q?7DLghzNLR6dQFpgmk7FlfD3s4LXvYhQy983P+FPQ0Xb4f8gO/F0LP6kln5Ki?=
 =?us-ascii?Q?wNnEI+ccrT1GhZBDpVgvn7PrH775cvjcv0mdq0ATPn9DEXx60Cop2uEgAEdO?=
 =?us-ascii?Q?JrIRqrYISNOuN9JfXhNcJh7ApLAb1EnYzvgF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:46.4922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a24d557-f83a-4dd1-fc8f-08ddf03d3729
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690

Arch-specific domain_set_time_offset() is responisble for
XEN_DOMCTL_settimeoffset domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS
Wrap XEN_DOMCTL_settimeoffset-case transiently with CONFIG_MGMT_HYPERCALLS,
and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_settimeoffset-case transiently
---
 xen/arch/arm/time.c | 2 ++
 xen/arch/x86/time.c | 2 ++
 xen/common/domctl.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..dfed0b0ab8 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -365,12 +365,14 @@ void force_update_vcpu_system_time(struct vcpu *v)
     update_vcpu_system_time(v);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     d->time_offset.seconds = time_offset_seconds;
     d->time_offset.set = true;
     /* XXX update guest visible wallclock time */
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 59129f419d..e7394ce8cf 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1841,6 +1841,7 @@ static void update_domain_rtc(void)
     rcu_read_unlock(&domlist_read_lock);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     d->time_offset.seconds = time_offset_seconds;
@@ -1849,6 +1850,7 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
         rtc_update_clock(d);
     update_domain_wallclock_time(d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int cpu_frequency_change(u64 freq)
 {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 6048a87826..776bf7b8e2 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -748,9 +748,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_settimeoffset:
         domain_set_time_offset(d, op->u.settimeoffset.time_offset_seconds);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_set_target:
     {
-- 
2.34.1


