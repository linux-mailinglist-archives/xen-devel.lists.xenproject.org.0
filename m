Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA08A54520
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903113.1311095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mZ-0004bX-BW; Thu, 06 Mar 2025 08:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903113.1311095; Thu, 06 Mar 2025 08:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mZ-0004Ts-1P; Thu, 06 Mar 2025 08:40:43 +0000
Received: by outflank-mailman (input) for mailman id 903113;
 Thu, 06 Mar 2025 08:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mX-0002me-A3
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2415::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af3600da-fa66-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:40:40 +0100 (CET)
Received: from CH0PR03CA0312.namprd03.prod.outlook.com (2603:10b6:610:118::21)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:40:36 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::30) by CH0PR03CA0312.outlook.office365.com
 (2603:10b6:610:118::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 08:40:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:34 -0600
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
X-Inumbo-ID: af3600da-fa66-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woixVp+4Kvk9+vb1eLrU11Ai6jzi+fNyxt714VTRNWdx2cyUKHmdABMbtEdjiUEHxMtUfYPeEOmy+2qmM77DdPkDurgWzWAxNjTYBYWOSYjFcTG6+5zKEOjbWXsDkWcGEmMPpUJVDHVwhpzSy0vGfgGYP2ifskFljrTxLT17OjU6VwhZ3TrBO1sBh11AXYuIEEuMFxhFPmAob+/i4giZ9uTIvlxBRhVTNaFy5DH7lzSCEMsZKzUVjbSOhTqm1pXuBttasLRmiIYIleFUa5I04xJNl568j4Uo8+LRHVJjrCVEa3kIe54IZoWvbgLT27qiZzElu5NHfrjFGB5sMAOKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6CnOecAYFlbYtAmXNZIM52L5jLL9etV56RibsihqlM=;
 b=eRgyBptrM7j1j77ja7PC/Lf4Zcko8U89t3ebdiGayTb1MU7h93/ECr5h9B8uCGzoosqN1itQs1vS2mI87SHl0FU9HNYhqhGMNuxaUR6dKdgPYlmX78/sKAqPcMR1Kst/zck9eo0nsew7OhNMo6exr3Vx9fOf/XrEhXgnuWMhzZ+F+CPYqlaDwP9UaSoUf6owGa/9jXZ4vU3nU8WQTTknKUEDh/5wzpnayr7bAnGh6XxgeKukvWUwEfKjgXV8QLdZ92/cZs+yJOsXSqkNW1lzKAmcPRi6PmrRK24EoqKhpGyx1NBAh62kgkOKCRQgkfXz4EO5YCnrGfDy9ztls/RskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6CnOecAYFlbYtAmXNZIM52L5jLL9etV56RibsihqlM=;
 b=3nyhcJ9GYHwB/seN63njxV4qLQy9NvR4oV1Wyr1KmBVw7/JB7Q3+MPEN+gBCwjBLeGjjfmBJGtxC2k/R81l11oJoCmofLPpGy0xJidvtT38RRjoIqBsD2X9sBWtXy6nfOdbn8s3DvB5iiVXdSBpVk8fEMTYd3H10yxLPljeC8Qs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 08/15] xen/amd: export processor max frequency value
Date: Thu, 6 Mar 2025 16:39:42 +0800
Message-ID: <20250306083949.1503385-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 1926a8fb-da75-462d-699c-08dd5c8a9130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MBkOcWnBaTGia9nkDmX6dcySX2kf+wgKIlzcCswiq3c4OXa0hhCRv4FfIjqd?=
 =?us-ascii?Q?Z1BfwTVqLGDILT1sTb6r7BR8Lln/XLUtrypBmjaycXmaFsM91joBFcB11ek2?=
 =?us-ascii?Q?AD1bZTiE5reXwls6rqcV/nupo2B3yUU9iXdnYaYpj/fB5XdLacPmP3ruah0F?=
 =?us-ascii?Q?5VenZpNd1JdqUn+crWrqr765f196J6nDkn0j1QQIt1lNP3S+47fhpll0sBPZ?=
 =?us-ascii?Q?n/8V/VVUm4zT0U7Cw22Que/eWBfq6h8LL0sOXTNipwkGwv3BDFp7I29+c9p2?=
 =?us-ascii?Q?VZWVo0SkFU4FpYgH+BhjJH6J6gINVy2wt1uCgTMS2EXWlEGaWQWG4qnGwV3v?=
 =?us-ascii?Q?mlx7UzLDE9l7mmY6YN1zdadGAmEKBN5JThkHzfRhX9IuNMW39wmwmpTGdhv4?=
 =?us-ascii?Q?tXvJaiwm9hhwbIU2ZaG0sOSxrVVYzdEQODhu2uHrnD0juHmwtH6qg9Io46zX?=
 =?us-ascii?Q?0HIWBTq2GRnCzZvSy+5E16FV2nAqtuokyLvMxkoVSuTobL3tT1RcmsEhQl3p?=
 =?us-ascii?Q?D+KQGXbmJiKmPzMHIBOX7rNjX9TW6xcgMK8zfTuv+1w/wuiGH5htTzTkxCv7?=
 =?us-ascii?Q?FAv3dEbVPKeHDAWh+QnRBmB2+L1mfQJcNeUn0C7l7lmMJpcsMbf2l4meCqMm?=
 =?us-ascii?Q?XbbhQOWrifSO0B0tfYVtFtGBsqK2sEsbvFx7oiAlQKI44mvTw8KWFlD4N4zd?=
 =?us-ascii?Q?KGIDukAhkE+XiARB4KZefWJJeDHyeKqZu0dJ3AlwtkAG5pTEEO4e4RpBwCH2?=
 =?us-ascii?Q?6BsACQiX7AlvuaAsw6/NDnZejgLlHur8z9MDCrwAykEsLma23/p6CaVCSTq9?=
 =?us-ascii?Q?yADhMUpM/fcpY39OjnxedR3vFNPZxGOH2hGJorwJYtG3mShR1ZWz/qqWBKPs?=
 =?us-ascii?Q?EcUjHHiE6vA0KUKXTgoHItlWcNd5WvyWJBSjs8Nu2UtwlUeDNyw6dRbrEbv1?=
 =?us-ascii?Q?M4fo17osFqbpvhZPxabrK9ovK1Yh8h5u89aZEsKAcLZb5/M9gYVJ1ttGWCJK?=
 =?us-ascii?Q?Xm4U/q6pQpumJZSytoKp5GCLh3FiXOHKtm1GzsZ1rTJT4K9gUy5luaDG0oKe?=
 =?us-ascii?Q?HOf0aRJEzYxx/55B9iEXDcFokhVTNAfUmHZ3AXOUqyRrJKCsJKoYLG377qh0?=
 =?us-ascii?Q?lnBwtB5gItzdvcf7iKvMdo7DkMf/r/hZuiSyNcreN1170m1Rv4/1wKiS+reT?=
 =?us-ascii?Q?X+6IXIxmWwq8D2D5kolyXT1uWpiDfDJvAwuzmXNyShVlRLwjQzixzqo+wCE8?=
 =?us-ascii?Q?GSA34dgA6tTeB/H/LVnB95kFB7EOFTXzk2XC5IqzhQixh0GQXn8SdzGmyQPY?=
 =?us-ascii?Q?MK6tG4Ddd7ziEN+JvmmTeCXDdNySJIjqiCU11z/vfHLtGLSYz0pufLJtQ0kj?=
 =?us-ascii?Q?/Yh12/W/x7HTcYhaYkvi/HmSbyo0AJfwTP4ovsa+hj+agV40hrB1mAUBR3xI?=
 =?us-ascii?Q?dlow/U4TN4FTgidnSTFmsEL8yVaRgPYeqtFr3vsJEgjf9ekWin1i3gZeZicT?=
 =?us-ascii?Q?bsqPzQBQBbF6UzI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:36.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1926a8fb-da75-462d-699c-08dd5c8a9130
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531

When _CPC table could not provide processor frequency range
values for Xen governor, we need to read processor max frequency
as anchor point.

For AMD processors, we export max frequency value from amd_log_freq()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
xen/amd: export processor max frequency value

When _CPC table could not provide processor frequency range
values for Xen governor, we need to read processor max frequency
as anchor point.

For AMD processors, we export max frequency value from amd_log_freq()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
v2 -> v3:
- Replace per_cpu with this_cpu
- Add amd_ prefix for AMD-only variable
---
 xen/arch/x86/cpu/amd.c         | 10 +++++++++-
 xen/arch/x86/include/asm/amd.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 7fb1d76798..6ab1cff3e5 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -56,6 +56,8 @@ bool __initdata amd_virt_spec_ctrl;
 
 static bool __read_mostly fam17_c6_disabled;
 
+DEFINE_PER_CPU_READ_MOSTLY(uint64_t, amd_max_freq_mhz);
+
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
 {
@@ -681,9 +683,15 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 		printk("CPU%u: %lu ... %lu MHz\n",
 		       smp_processor_id(),
 		       amd_parse_freq(c, lo), amd_parse_freq(c, hi));
-	else
+	else {
 		printk("CPU%u: %lu MHz\n", smp_processor_id(),
 		       amd_parse_freq(c, lo));
+		return;
+	}
+
+	/* Store max frequency for amd-cppc cpufreq driver */
+	if (hi >> 63)
+		this_cpu(amd_max_freq_mhz) = amd_parse_freq(c, hi);
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 9c9599a622..cf9177c00a 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -174,4 +174,5 @@ bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
 
+DECLARE_PER_CPU(uint64_t, amd_max_freq_mhz);
 #endif /* __AMD_H__ */
-- 
2.34.1


