Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DADB1934A
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068378.1432398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMY-0002h7-Gm; Sun, 03 Aug 2025 09:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068378.1432398; Sun, 03 Aug 2025 09:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMY-0002en-Df; Sun, 03 Aug 2025 09:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1068378;
 Sun, 03 Aug 2025 09:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKs-0005K3-AL
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 121c9450-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:56 +0200 (CEST)
Received: from MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::14)
 by DS4PR12MB9588.namprd12.prod.outlook.com (2603:10b6:8:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:47 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::4c) by MW4P222CA0009.outlook.office365.com
 (2603:10b6:303:114::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.17 via Frontend Transport; Sun,
 3 Aug 2025 09:48:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:41 -0500
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
X-Inumbo-ID: 121c9450-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzMtirBEoe24sQOgNjDwzrxAwjJlKknllu4u1Vy5I6c3x4AF2UoyHOtmXBxH+0bqVx0kqH0ifjskshA5+PHYHPl7w86KZs4820apdUcvc26P5sxNj4H85f2QQ3O1GND5j60V1L7Eir7B8tIycKBSnsGq1ru69zGClifwz5ZqUNuQ72YdcmhIWFsmuq0zunvnpdfNnjI5RZQrkZZj6EdZds2f76d1juoDm9i4etT/Fw7ANpXsm5p5X0AzkwPUQhwVFQP5Dm2RZk9Tapq1pbjrEVDs02GOffQxO5WRxF6aoGGsa9ugdeyltG51UscW5XKlpFKi5H/9d3b4iMwTTOWI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKCJ9vwLM3+NoLdeUojQBdoUwvP1C5l3ojylIEw6UR8=;
 b=kD/WKn6zgLTDP2vX+ENhrGoU5+zyi48Xc09gWEqIRfsW+5IiNVfBoFIp+p1SEke+bHw3L1iMrDIsPbBQobKLa70O3MLhMt1V0aC1b8Si1oeb8JFJAJVWjwkHhRwPp2/qvHW+5Jb4RyAoApd30bdyrBz6dGd0YKNMUCh0QT7cp6Wqze1f/+9UriGhu+y3acvNXPV6201cX048oI4QeFg+nRG/YhZrPyd2kDQQi9Ni/7yiyU8fxZ+j4r4Ht15Dutpk41N6KK8na9V6pBuWtSrEyOSaIGjdsgKdhzB2X4besLb4f4Pz+sdLqKCYcqCKsSxR4mz2aAfynCvtdg4fxz7pvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKCJ9vwLM3+NoLdeUojQBdoUwvP1C5l3ojylIEw6UR8=;
 b=DVsRWEeq5R/DPrk9JksTDmewMnbQB13Lkuwi8n4iTTw/M44U2rJ6X65TJTM2TGsZKj7RQZHhWd0e8FTDkTxACh40Gb/3k0mwdve5TzeFkeke6h7tUC+RItJA3RUqyl6rlnNQak+iSBRDIO2GymN5v5i5EukXpdDRVW6oWnAQF3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 15/25] xen/domctl: wrap around XEN_DOMCTL_settimeoffset
Date: Sun, 3 Aug 2025 17:47:28 +0800
Message-ID: <20250803094738.3625269-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|DS4PR12MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f0ce4e-862b-42be-0317-08ddd272f141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DX+6plCdkpKLe6Yul2h8kPO2wqJrtEOfmwTDKBOAy1s/NMqLxHuwHUV7ZYb2?=
 =?us-ascii?Q?eJdzgdBmpySm1JwZrF+Kn+uYMRCPJo29gxaxdEqvU5t4BzNBHJOnl1McDlI6?=
 =?us-ascii?Q?U34eOynvH6fBVct18q3TweEylDxa9JCTCC7PxeSWC0OeNnyA4XwFwrkjJcDW?=
 =?us-ascii?Q?JUjiJCyOxItiZV3VwuVpo3T1BxmxpcWPBs5cA9QoklYrTK9+v5hr8JeKw6bw?=
 =?us-ascii?Q?7GCwQwwV7aKG554GqRQ0qZRByJWwVgXoUoVULfaPgSefq34nTDXBvX0hIrMO?=
 =?us-ascii?Q?xyG2kC4RuD6HH2CFzwvyGAVaR34PQD0MvD+Ai4/6lgvi79IXydWiqKZb1skb?=
 =?us-ascii?Q?MtGCOeEjjGTeVbn33nCQ4e+yjPuYI3pqp3Pbpj1BJvuxlCRP/AefL640n0gV?=
 =?us-ascii?Q?LpIk8dgta6gIwKDLfhoMKx1H0S+18UVbSmxlXUaDeqvfAa93GaL5WAeB5qzK?=
 =?us-ascii?Q?6/Auc9YS8/eW5y+Hsx4zRKx8zFMyrj+YI6nyNP1CERapZzgMiEnlcy6UzXFl?=
 =?us-ascii?Q?y9uKVM1mRoAu17PGB/Q+tRL8zduJGYd5UZ2M/aCIVg05w/niaWPO30qs6gF5?=
 =?us-ascii?Q?pJq0wCAfTuq2Mqy+UmWII4IchVMAebpHkARBAQILdiQqCCq4NdxVywwImqk+?=
 =?us-ascii?Q?W/IWQV2HsgQOf4oSrvBtCJvdEjiXMqY4xHYHT7iYVhXWpscaOjJ3O4C3QFQY?=
 =?us-ascii?Q?OYCZWbJIZ3h2R8QWSzz08EXDwVKJlqFLJthmCGqFPC+QVF93jzip3SeBuyYi?=
 =?us-ascii?Q?a4KsopW5/8s1xFj0W0yz1n91fnZGCeLJEnOemen0C76YuzwZcPW/GA5sJjM+?=
 =?us-ascii?Q?RZeoSHF8E0ppJWPL4kJRu+kXhfYpeWR3NZCmb8E/ahrqLGfw4/B4zU7aercP?=
 =?us-ascii?Q?ScA7eKGpI5Sf6UFRms24AoLrpfHNYq2SeX5pAU27YrZAlPumLpZrUTIeAGUI?=
 =?us-ascii?Q?3dxkQv7T4G1Qnr5A3AswzvSKggp01kYQEnnYzp05hrOiEjgFtOYqJukSi9wW?=
 =?us-ascii?Q?fcUfLR+nyxprqQr2fpThjhc9unV/FxzrRU08ZnHladeT4NTPahAhen6d3AKD?=
 =?us-ascii?Q?H6cpdqn2TsBAGAvWYSHQD2X/N52Z7iKn0RfN9CCusI5kARLlGgET87EoJKGz?=
 =?us-ascii?Q?Yddn807MJ6UeycuXCWvz9OLXG4KOzuHIuEk/u5wxGZZ3OEA4L2yDS7cjY90i?=
 =?us-ascii?Q?bm6tjuAnqyeTk9X+OQicvh+tpLOWAqveqr2wNYB/yV5FTvDBKKepBf+jjgI2?=
 =?us-ascii?Q?tWxiGIwntAvIsXGnolOONaXMaBLt7j3JMsO2qOeU0ysO9z+hUGj1/vR7z3OZ?=
 =?us-ascii?Q?393qFEi5RpohIAwCPBH6/sR47zz+fehaHqVSrrA454R/IL+c9fIabEJrygiL?=
 =?us-ascii?Q?c83Gc7jrwEpRL1BTp9HcQfL4AuZzYFae5B53cV3jhcFS9NGpWb057YJKCb72?=
 =?us-ascii?Q?bmE5yMyLmLOY9OtdUaapLEfSN940qHGmMM3b8lzabm5Dwtlz6jDM5VKhj5NC?=
 =?us-ascii?Q?NWuEwX23NHdHmDeIrw5QpGawIZvWaTF9jUbN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:47.0815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f0ce4e-862b-42be-0317-08ddd272f141
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9588

Arch-specific domain_set_time_offset() is responisble for
XEN_DOMCTL_settimeoffset domctl-op, and shall be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/time.c | 2 ++
 xen/arch/x86/time.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..5955c7ce7a 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -365,12 +365,14 @@ void force_update_vcpu_system_time(struct vcpu *v)
     update_vcpu_system_time(v);
 }
 
+#ifdef CONFIG_DOMCTL
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     d->time_offset.seconds = time_offset_seconds;
     d->time_offset.set = true;
     /* XXX update guest visible wallclock time */
 }
+#endif /* CONFIG_DOMCTL */
 
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 59129f419d..c1411be64e 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1841,6 +1841,7 @@ static void update_domain_rtc(void)
     rcu_read_unlock(&domlist_read_lock);
 }
 
+#ifdef CONFIG_DOMCTL
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     d->time_offset.seconds = time_offset_seconds;
@@ -1849,6 +1850,7 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
         rtc_update_clock(d);
     update_domain_wallclock_time(d);
 }
+#endif /* CONFIG_DOMCTL */
 
 int cpu_frequency_change(u64 freq)
 {
-- 
2.34.1


