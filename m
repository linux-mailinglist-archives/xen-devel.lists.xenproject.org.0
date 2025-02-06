Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB06A2A332
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882557.1292692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKK-0001Ut-3h; Thu, 06 Feb 2025 08:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882557.1292692; Thu, 06 Feb 2025 08:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKJ-0001SD-Uz; Thu, 06 Feb 2025 08:33:35 +0000
Received: by outflank-mailman (input) for mailman id 882557;
 Thu, 06 Feb 2025 08:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKI-0000gq-Qt
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c406dfd-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:33 +0100 (CET)
Received: from BN9P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::18)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 08:33:29 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::1c) by BN9P221CA0016.outlook.office365.com
 (2603:10b6:408:10a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 08:33:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:26 -0600
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
X-Inumbo-ID: 0c406dfd-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4gibFYkOqYazLEBhTbjzCT7yDgr85x8ncMrhCO6FPu+OIklUlrQy1xPYFnHYy1gXkYLdYhLoEOnep4Bom6Ch6aP3RNI6rHaNsr+iarrQEGdgBQ8J8lyKe+gwGUiIlS3ZbMJ3n0++t6OktaOC18TKC6dxThk88ZaugTL+T4fZnWOsV5StNF2+1UdFnPKoSlK+QKwjgIYl9a1MEuLpMWICVFEFB8nqcZiHtNqAoZnoLSnFfo7A17+ugnhN4nmjDMbNVglwcUhNKx+aHX1DPUX7/6EbxM6aqC0FAJn0E9XIv2I6Hy8WLIuKi8C/nqiRCVo+MKlO13CIbYiOI0tZiEjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUUUYW+VHXbpHQDxQCEnkBbb3oOklS6IdLABVlVMlmk=;
 b=JoBss/1qcpTd2EV7CfpxjAAYww2sdWZTxFHOlyr8MyW2YLf6Kz8X/G/WKFA6yJsdONXHxPIwbLv0upQef5JLezp1nSqNbl4HfhF39znBP/txTf1OXaL4xvf51AfFf3HRVi2etiKyW78QqA42eJasAJ8S2CeoxD+RUVY4f0Ppcjjq4HXOLcYxkWZ2NDlZfY+zxXw+m7YUeDd1cGjVSdjWPOuzr623NcziJamNklOPwmWZswhOkgy4EUmSsnmHY3Xo3sbjxqRcmIhdNeRX4pbxgAcgKkrXjqoHl/d/h38FGfw+yLnL/9G33i+5YlBragnQh6V/LybNnsq/7DcAdU4RiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUUUYW+VHXbpHQDxQCEnkBbb3oOklS6IdLABVlVMlmk=;
 b=4MVJPEnt/yLmym2fLyKEyD/aAlgcG5byM2+xc9Pmx6IG710ei2ow7QGZCARpj/bm2OOSChXU9hvyCqK+0orwxlmVOjOsJd3albu5YULVJjK7ptrTYC+B2wO5JZJdWufAowUmxB4X0CqQwOM3yVMIgpkqBgUKL5CvtZayGXsjW/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 04/11] xen/amd: export processor max frequency value
Date: Thu, 6 Feb 2025 16:32:48 +0800
Message-ID: <20250206083255.1296363-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|CH2PR12MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: 88db1faa-49b2-45d4-9194-08dd4688ee99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XhPl6wDI/raZd1+VzEiGTrQ0soFPm5MI3De3DhQAioPYH7nC6MJg99EMkjE2?=
 =?us-ascii?Q?NGZbo5PaAY78TpURXGoiGxVV7OWTACpA6VYjExfOA6C2qWPl8UyTQbc7Xvg5?=
 =?us-ascii?Q?JmfDe1OREHSJIhTptIX1PgxXjBO9LQiKHZHfYMfjWQelVCfXBYkaYW0Hxeig?=
 =?us-ascii?Q?dwpjnAVE1sDSe13T/CvCNa+vc2iuLDrMLOzd7PSGNXFyWO8mOVYAyrpZV4hk?=
 =?us-ascii?Q?kFes5FNHLlcEdi4SWgbtC0ZG4hc1HG4YzRDRAubKZQh+1LQsdtg5LYl1egQy?=
 =?us-ascii?Q?0b8TPcberKP1FIWg4oDNhONKO/KBfPwFBI8/hYtImDU8qltBeH3TdXu5boPq?=
 =?us-ascii?Q?LdMOi62WmPMYdjzARDvD1tdCJNnMfX3gXP37JBc19LYFGfSq1a7ciw7RfGpy?=
 =?us-ascii?Q?M664HfVelPA2X4cUujWV1A88utJYFCaFrOHVJKajWfa0ckpSdHH+F458D1wg?=
 =?us-ascii?Q?mT/zVkS/eOzbE1f68OQwtKviVue4pgf9JBDH/5tMr0hWN2j9gBdTcE0/dS7i?=
 =?us-ascii?Q?eirs39gAEVCSMLbPpEfPYpdbbehRzZ5QJUc4C44TD8w3IokMoMjLUPyg6OV0?=
 =?us-ascii?Q?eJXeEAToanRhu/M+Y6fBGCrrLYv+VzO84MytUVLN3O9Ykr0blhL/Q6E4CqrW?=
 =?us-ascii?Q?wEtKQtoYNMhfaZWzHtRlrdN/Gi2jsEqaiV8Qn3rVTwbRwKbxUk/m2OnR4yMY?=
 =?us-ascii?Q?XyiKBb6hRJmogsygbV4mUdUTQwYTmD2G3hefqiuOfwCoVJgW0w4Ga3CKedUt?=
 =?us-ascii?Q?vUkrzmCZQVfohk2OGvxgPvTLgOk6SXCEQRF279GJyVFI7qn7zZ6pV1GvKAfH?=
 =?us-ascii?Q?8yZREWR6ufmtH6AUVNTHY6QL52DflWAFiYFNab2QTnNK6rbdMIBuyLvcf4kG?=
 =?us-ascii?Q?IDnietUTxP9OlKawGd2w4Nc4iFnx9VDMo0TBkNgDcXq7+xTd+/Xchr/deGiC?=
 =?us-ascii?Q?rsLdGycRR/m8iGnKcF8Hd2quZSBrxEO8259XlcbrhhHEtuGvKV41j8kq3yCY?=
 =?us-ascii?Q?fP+WYK95cem5rKf/gmEk6N9fcyavQoB5sEHmX48vDqPp4UTHH9Xfeff+SjlX?=
 =?us-ascii?Q?5/a2EEM3LRXoXQgI2yr98S59neDGKTetpq1DtXh+vU6/0xL0qLMq2O07jl7T?=
 =?us-ascii?Q?ozqkoOVHThwyJzSEE/YsyWBolEyPNnPaeWPFzGRPvi2W2puuAjnrj9uZCA/C?=
 =?us-ascii?Q?vIemecEKGb+aKA5UFJysjbNgUKiT7I51NOAOAntsPwqkQetUBL5kfYbbClKK?=
 =?us-ascii?Q?0cMYYEGSjRUhIRwT/7jzQAPQ3xWOXzW56aO7qrFmZdq1yo2z8PJRjbS+GsCD?=
 =?us-ascii?Q?ZE/eg4S6f0K45znnCnS9OrgcZ9ySXV3OAHUXCgS+lBxGrJwl0JaHnfrzX+CN?=
 =?us-ascii?Q?uhUMXBT3tDz9niPEGT/SyzIDd3X7sXhf2fazZfoT+5ba9nWazdBrQz2VpSox?=
 =?us-ascii?Q?Y0x9g58GVCFNVMB3s6Rsr97jwK+HoHo5GjUo3JIz8L2j9ZkH0k6fd7ELUKIr?=
 =?us-ascii?Q?G847QszIEMJltnY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:28.8391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88db1faa-49b2-45d4-9194-08dd4688ee99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087

When _CPC table could not provide processor frequency range
values for OS governor, we need to read processor max frequency
as anchor point.

For AMD processors, we export max frequency value from amd_log_freq()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
 xen/arch/x86/cpu/amd.c         | 7 +++++++
 xen/arch/x86/include/asm/amd.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 597b0f073d..489e092815 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -56,6 +56,8 @@ bool __initdata amd_virt_spec_ctrl;
 
 static bool __read_mostly fam17_c6_disabled;
 
+DEFINE_PER_CPU_READ_MOSTLY(uint64_t, max_freq_mhz);
+
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
 {
@@ -669,7 +671,12 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 		printk("CPU%u: %lu ... %lu MHz\n",
 		       smp_processor_id(), FREQ(lo), FREQ(hi));
 	else
+	{
 		printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
+		return;
+	}
+
+	per_cpu(max_freq_mhz, smp_processor_id()) = FREQ(hi);
 #undef FREQ
 }
 
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 9c9599a622..96367ba646 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -174,4 +174,5 @@ bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
 
+DECLARE_PER_CPU(uint64_t, max_freq_mhz);
 #endif /* __AMD_H__ */
-- 
2.34.1


