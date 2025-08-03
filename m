Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420DB1934C
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068397.1432439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMc-0003fk-JD; Sun, 03 Aug 2025 09:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068397.1432439; Sun, 03 Aug 2025 09:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMc-0003Zd-C5; Sun, 03 Aug 2025 09:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1068397;
 Sun, 03 Aug 2025 09:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKj-0005K3-SM
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0da46d53-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:49 +0200 (CEST)
Received: from MW2PR16CA0019.namprd16.prod.outlook.com (2603:10b6:907::32) by
 SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.19; Sun, 3 Aug 2025 09:48:19 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::9b) by MW2PR16CA0019.outlook.office365.com
 (2603:10b6:907::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.19 via Frontend Transport; Sun,
 3 Aug 2025 09:48:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:15 -0500
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
X-Inumbo-ID: 0da46d53-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS2X8YsZbNq3fb+rCJpyNwtVnx5xjMvpjt4mjSrWwLVgO5hoaHPQrkbYXUQsarr7sV2X88AE2eWw11+noSs37ka7Y5sHwXKOGunVmVng7aG4CGnJ2Lmcr1/bOpACF1H2l21djvB4g53UKH5omKGvZkPPjDjVEYdet5e1A7ibKMeW40PNHGzGDNV6kd3UNpMH7aYy8UmfRUj7m+VYvAVWVwtkL7RxIcrQfuAYpYf9E2pTjsRSKrWvJpgCzQJ/iNV2WODQ3OgLC3/Iv4M3vmz9GHOBB0+4lpAqAjus8mMcSvw5GExI6Z6hHSHfvaRG8HdVBqNo0RkI6kLKAv7yV3JJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZiU8v1gYjYKd6yc8FaXHrqpMcJ4UcE447WtvMO8tJs=;
 b=vrCguJP9Gd4lOJnVlI5bUrRItZaIvlhiIlVf7zOn7/s0pOw1Xucy48u600QoJlMFaniodU8IPtQM/O9qLfLpG0eru+4yweR12pNhVwg3acJB1Mp9wuBQyJQFh8MYU6YTj/ViY5q/wbXPTJ0qWfh2gRahMHdz+Jljw4LPPmf5Gg0PaHYc4FUfirvSCpyHmQnhaIe2WeET5gNO7ok8HYbCg3L4cJh8LGR/n+f3+VmOzFL/Q4UWtVWIse82S9alqpI0o5MfXP3My5wQz0yd8Y/hNc7aTx9mfigxbwr8VEIkguaKjM1h70r/OgzpTBGig7KZCjY/ZsLzhU9T+6vWO0/7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZiU8v1gYjYKd6yc8FaXHrqpMcJ4UcE447WtvMO8tJs=;
 b=r1tQisOlaSShZhn4pVCHkY6Tm1K1iJbULyx1ti+1ZpaaWaPAYBn6WMBuPMgpXgn7ZonEwX1gmeNCrza3urr1qhYQvbf1uTHNQftiss/NIv0zhF/kIAhidg4C/JxfNuVTIr3gg7x0SOIXHssYEW4O9D/H5nvtRPHarS7tdOqsrM0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 06/25] xen/domctl: provide stub for domctl_lock_{acquire,release}
Date: Sun, 3 Aug 2025 17:47:19 +0800
Message-ID: <20250803094738.3625269-7-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d7a918-c43e-452e-dd72-08ddd272e037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|30052699003|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qgiHqDbFKUBUG9aBdJLQ1vJ9A4INDRvDDtwnJgi7UWxL5/2TfCMBFlxntOly?=
 =?us-ascii?Q?74PKBRyr554U+PUbXqGC7yvq/7pbVp8ALs5s3TM28P/TJTm3wOmBAaXgiIQL?=
 =?us-ascii?Q?i6pDq5XF7lUsRMsA9CH0b7k7z8Bw9+LpZKQ8WqC4wjkaRarSQ+8utAvTVOqb?=
 =?us-ascii?Q?dJrelHAQZSf3xwxOT0vyGbcFGeq3SNDctZ1cVOA8m9pwEPvjXOWq3WrmTFJe?=
 =?us-ascii?Q?c3v3ETFwAdhJlD8Ux0SDsSOuYUEbA8012ag0nnKJCtTVEcZ4H927JEyVSeEW?=
 =?us-ascii?Q?N4ARB+3ncZjZJhSaC+W6UiEkQ9PxpWODh5kQGQRFAV8FzRwfyBePKf7+kFKL?=
 =?us-ascii?Q?S1AfDjjozJWHfIhkxO51a4eHVw3QM7ECAtGiiTLX74YaxDohkt7vB6/NCH8v?=
 =?us-ascii?Q?1dzWCcQivVqeysRGdEIjzeL3d+81H7y+Nie0tVbwyngEbkKxziQOPEsdLGAD?=
 =?us-ascii?Q?17DJ9t1L2FtNyZKfEY5cPA0g60sSY1fpUWthE5rrXjdfMYD3S48WqpH2vH1/?=
 =?us-ascii?Q?x39JNkluPXCs0oL0dYZsFksGfR56B+Brk+ICu6kQQLu+T55wmamUMGQezvjq?=
 =?us-ascii?Q?Cy7d4SlMoSxjD6tNyHU01k6LSMU3L8lvXklpenuRDHLfdQxQ2rV0T1hw5jij?=
 =?us-ascii?Q?z1jAXbRfnjOY71At1/qqL9iCYzdsh7LNd1TvyCeyW42pWJt3KoedIHoo168H?=
 =?us-ascii?Q?ddu6Oa6JiScrntHAWzma/mX5BwWX8YhdyKmwXTaILVmrezcjohC0M9bN8fJi?=
 =?us-ascii?Q?2zQqoht8CCMF3+fSRqn5SiwKXxOgexBdrW+h40vDmP3JewEi5i2XBqg7h47H?=
 =?us-ascii?Q?nxv2Pu6K+/Vb9nT8DhTfOO2iaUFprzrIrk+Pc8IugYfrGtBUOq8rbLrRYAto?=
 =?us-ascii?Q?PZ+M0VuAcIaNUsz+rGi6iCE5e+4KqmtHLXNAQDaScK3SLgPPdHXg6ittBaxX?=
 =?us-ascii?Q?UQ2j3GePqi21AR3m0YpCF9FpZXSL5VEuBu+HcJHlpkohnarPe3j5iliFrcPe?=
 =?us-ascii?Q?7Ro4T/JCh/aeih+NBFVWTbBW+2GesSmd0P5k5vpBb70qNaIJUToQw06RuJOu?=
 =?us-ascii?Q?WAtT8yjj1GPonM09uCUDjHiYGK4BCOXllmx2/IgcPltsQUz2A+NFgSyyjt6/?=
 =?us-ascii?Q?8F2assdmFCFT5TJKa8c1GmS5YhJcZrMo07oi80yW4HC5wm5AnENwE5s/HDCy?=
 =?us-ascii?Q?PB/YfP7L3ckZb/WNBG7AC1FSxq0x+tTTfTiz6PzYTPDNDL0qBUupSH4Byq9w?=
 =?us-ascii?Q?90qNVMt/8ni2UN6kZzP/VekX3i11kVV3Jy03S7b6P8FRAeOXJIyDxqsGya/e?=
 =?us-ascii?Q?rFAvclWAtiIP6JvMZyrc56diYFmUbMIaY/fh+RMQWeaPCRV2/117jcu7fuHW?=
 =?us-ascii?Q?Vbnwfvg5+0sduYOdDgtrExIx04YYyJ2KVAd4YN2egefNPbdmcbF1b6J2Hhmg?=
 =?us-ascii?Q?hQlOfeyUPhxFkzV3z8L0ZRb6ESrSt2GOihgtT6RU3kzeeKaOteM/GSb1itWw?=
 =?us-ascii?Q?sqLjzx643h7I+bV5i5wOy4Sxwa+flsHgj0+f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(30052699003)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:18.5009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d7a918-c43e-452e-dd72-08ddd272e037
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461

With DOMCTL=n, we need to provide stub for domctl_lock_{acquire,release}(),
as it may be invoked by hvm_set_param() in x86 PV shim mode. Although
PV_SHIM_EXCLUSIVE and HVM shall not be both enabled, randconfig stands
little chance to make it happen.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/include/xen/domain.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 33dd90357c..b45ac91760 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
 
 int arch_vcpu_reset(struct vcpu *v);
 
+#ifdef CONFIG_DOMCTL
 bool domctl_lock_acquire(void);
 void domctl_lock_release(void);
+#else
+static inline bool domctl_lock_acquire(void)
+{
+    return false;
+}
+
+static inline void domctl_lock_release(void) {}
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Continue the current hypercall via func(data) on specified cpu.
-- 
2.34.1


