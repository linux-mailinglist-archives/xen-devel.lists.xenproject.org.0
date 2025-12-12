Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7FFCB7D55
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184952.1507314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuRB-0004so-4J; Fri, 12 Dec 2025 04:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184952.1507314; Fri, 12 Dec 2025 04:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuRA-0004n7-VS; Fri, 12 Dec 2025 04:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1184952;
 Fri, 12 Dec 2025 04:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQv-0007Dl-8y
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:09 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05557dea-d710-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:07:06 +0100 (CET)
Received: from BL6PEPF00013E03.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1b) by DS0PR12MB7584.namprd12.prod.outlook.com
 (2603:10b6:8:13b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 04:07:02 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2a01:111:f403:f901::7) by BL6PEPF00013E03.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Fri,
 12 Dec 2025 04:07:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:02 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:56 -0600
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
X-Inumbo-ID: 05557dea-d710-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULoZrgPWshFwCo6OOQyEa0aQRZE/nkE8TFL2gsqqBd/h/IqJLlKYtnQeOLnIldbEeoHt3nS65/bGIYM3qdtw6AUb7/moehVAsr2R82at+ditstBHPGhYtjZLpJBmHfXf/AL+nuIpxC5mYmTXV7JVpNH0kZW3cVdYlz6LySVPLQ47QXwlKjHcU/OuB9hKvJFZctMEg8uVCh0DFrJIUna2ur6qDNxdcsDhBlhYsXYflhmPzkLThg0lyukE8CjLYyx6or1OQhm37hWGqWmmx0i79o2MSR87BLmRwKz/ToVkVE7H1Virobj1zabkwIciCzECyk2ZJ9mmx0vZEN9tKm7tuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hSsMPp+Gwf1XzRD1dfz9efboZW2JkZdEhihPPv5904=;
 b=EXdvIzbXbPVbF8gjLe3Why7kHaO0q/Sv8khXRBsh1mDGe0zfmiwyaGk8jLhDB3kSNtb28MnuHyxOI5ZRhOPvln8iLUdiBJIEBz54j7WoWPYpbs8eDUk5Sz/mAP6Be0TgPF+P+fwSOOT2aCJ5ksTysCySU8rUzSwtl5N9WmYB0JqYAGO40cG5odlqc5BkeOJrFN05rQxoDaDZ1MRsE/VBKjiO0M0xD+F6LxKe3DZNn2DEZ7Ai6Ynj8uuhL3zut/tV4N3cExLk7XMrCO0phObY/xAL+aPYQ6vSbKVo3GhxLDXqD0zqm4t2RyAHivA1IHaplZPJF/uIilMWpzfksc+yPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hSsMPp+Gwf1XzRD1dfz9efboZW2JkZdEhihPPv5904=;
 b=PauBnWC7ULFfbbZDHXHlmt9iWR1LQDV2M0y9Vx7pmhXzl6xYrFOxuSxaioHykfrvREzkv5Ua1/u+00YvNNe80DB1d0m92w5qPh18zPxeTv3CEq2+owOblk1cuUXQuoJcAoXY59SGf1rUrLgu+wtIgeGt4WQyQNZTaNAU+C7VMUs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 13/24] xen/domctl: wrap arch-specific domain_set_time_offset() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:58 +0800
Message-ID: <20251212040209.1970553-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 1039f12a-7642-4c66-3cff-08de3933e77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vP0vjNDnEG0Z5iKSakAYxSdaUel/3wafOwfiyLrcQBFOm3SbT1Aw0x3CyQJ?=
 =?us-ascii?Q?Ogh1JnPm3/Uv4nJOKyCSrW+UpRtqNZdA8lywBPAqzIMc6DYkWVXRYCNQC/kc?=
 =?us-ascii?Q?od5gMLM9WZMEjRkFYGKo266qRQVTRvn0JQzQ15r6RcNjStA3IRDGJuO/fRmv?=
 =?us-ascii?Q?2FeD4ncUqERq840Zi88ZbTRtJ+HQxuolG9gjENtOonqtCdXUWxwl3/vKxpQZ?=
 =?us-ascii?Q?yc2g/g5hw9H/NqJ/nUrQgqEClyfMopDzvCpI4PdIjL+tFNBFuTvUI/qXG0Bp?=
 =?us-ascii?Q?dR08PU/9PTi9J0v4pm6h3jtdhGHlpqbZPgS3nVzIOtOg0BwjqpyyW55P9ewD?=
 =?us-ascii?Q?h2F1EIXqSjmSc2YzXwgdzwtkn1Nxr1+s1TFCqvldrQFNytMPbk0qWhV6TfNH?=
 =?us-ascii?Q?6mtqG1wh1Ee91EyXmADRwGvEFLijgbgnj3oQh6+oNSZ5scPSEK/rB6es/F8j?=
 =?us-ascii?Q?5ZL2H7mV2pCReQC1jkk7ANnAf+xlsEN4uqrMj0H0YVKCht4nSJibepmF9YsB?=
 =?us-ascii?Q?TnrXt45aAVNDVPH0jjuxWYX+skyrNNvyyu07L9Q7MpytjUWoqrzHBBxOSEkl?=
 =?us-ascii?Q?n4Gfia93+okn+Q+JVpp3pzLzo77928KfYQLrorOrjl0VQp3JTehOnenLYFNl?=
 =?us-ascii?Q?5V6Kv88HtJcefwYXV92ALICnE604dEKuMtIcCz6R8VipF83qGtAwoYAcgNtg?=
 =?us-ascii?Q?Oib1SislO8jNjg3+V7P/hEDcMGAZXjsqU5dR1AayIEWDEyJhTLcmAaK7zZay?=
 =?us-ascii?Q?6gWtickPqOPjdrSkAqzd9K6IosMdtIE6bfVQ2iNNwXSncFRsoLznuvBpQfZZ?=
 =?us-ascii?Q?Exid2ONlWEZmJ1rD6GSmG7MMuAakNmfZnxS/6bHWsBfgi2eHeXdvhIg0klUa?=
 =?us-ascii?Q?2oAVUMMI3JL/frG8hhr+mzKhdS/FB3qiT8jAuzPtLLDMs8ZpWIlr+YBE9/yT?=
 =?us-ascii?Q?B4ZOE3bMhw1ZBrlOu8Mh55sJKJO6ZCbF5AVK/wgbudFwm9q1jDD+rMGUkZxn?=
 =?us-ascii?Q?wHeg58wxkQiDT6c+0VphnHGzG49mKvERTRrl6GHP3Dp4pRrv8aW64vrLjyXc?=
 =?us-ascii?Q?b6qU9U1p/Wb43Si7zOqMzsDSFQ7/Hf9rY2+iV9AureqVIV8YvYHtK2oGTbit?=
 =?us-ascii?Q?qi32InTggpVehnOU3eQFX9qq2Xdg+cPpYl41R/tqklDz9FrtHH2gcytYYHKa?=
 =?us-ascii?Q?hTQT8p7g/Uk5GVntgcaNb1eaajdogz9FIBH4sbd7vsYtYl3gnkHQ+AQhZJLO?=
 =?us-ascii?Q?RzXueJLQz3UqM+wDz/yV+uVARAoLtEBiHhJWbCFxWG4hnQBGA/5vNnhCmRW9?=
 =?us-ascii?Q?Ilvge8cpGUZIXl8DloJMhm5PCD0KQxxSexUjimGN5dJAF0V9oJN/1KoJbnqT?=
 =?us-ascii?Q?UjW2VcZVLhBCAVweHRAZsPL8qco0/cL+MxuTZ2RKnvcdQkt6NJoy77P1oP8i?=
 =?us-ascii?Q?tjmYBsTmKJF4p+9NlMc3Bpfghxd7wTocRG5i+nlfyNonDtCZk4S3qwEHP1rD?=
 =?us-ascii?Q?HUV7kNA+AANkAZdYOBFwTHA2bn3osX+o5ZYH+5QdnXkMtJ3NvB8l5wWYfHNu?=
 =?us-ascii?Q?K7BVc/F45JTEG3cmyAI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:02.2425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1039f12a-7642-4c66-3cff-08de3933e77a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584

Arch-specific domain_set_time_offset() is responisble for
XEN_DOMCTL_settimeoffset domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreachable when
MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com> # x86
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_settimeoffset-case transiently
---
v2 -> v3:
- add back stub wrapping for riscv
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_settimeoffset-case
---
 xen/arch/arm/time.c    | 2 ++
 xen/arch/riscv/stubs.c | 2 ++
 xen/arch/x86/time.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 3710eab109..a40b233f9d 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -378,12 +378,14 @@ void force_update_vcpu_system_time(struct vcpu *v)
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
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index c2e6af2c43..a8a0b4156a 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -31,10 +31,12 @@ void send_timer_event(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* domctl.c */
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index ece9ae0b34..8ba2dd9395 100644
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
-- 
2.34.1


