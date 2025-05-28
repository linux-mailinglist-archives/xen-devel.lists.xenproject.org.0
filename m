Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214FAC65A3
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999173.1379929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyZ-0002Ua-2g; Wed, 28 May 2025 09:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999173.1379929; Wed, 28 May 2025 09:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyY-0002S9-Uy; Wed, 28 May 2025 09:21:30 +0000
Received: by outflank-mailman (input) for mailman id 999173;
 Wed, 28 May 2025 09:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvO-0000yL-9J
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:14 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2407::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ace5f501-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:18:12 +0200 (CEST)
Received: from SN7PR18CA0011.namprd18.prod.outlook.com (2603:10b6:806:f3::19)
 by SA1PR12MB6845.namprd12.prod.outlook.com (2603:10b6:806:25c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 09:18:07 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::39) by SN7PR18CA0011.outlook.office365.com
 (2603:10b6:806:f3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.32 via Frontend Transport; Wed,
 28 May 2025 09:18:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:04 -0500
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
X-Inumbo-ID: ace5f501-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW+Sn6Qsmmzm5l9wGcSElkVrbgCfddXKslUdSX8xIplM8crnXGOzbwBRrNoPxlpVjX6QP0GKfx8ywr85ruYV6HnpPDNQ832ppjBQmKm2v+PWTAYtOSW73N5kb4jLt44cJOM6WlC1oNxDuUrBOiDnpbPnBRUGwJ2/YHF2axg0loMrjFJSbU/tYFoyOcfPk53SXdAkIrR96q9uqnpiYrc4KpTKw19wjg5UACK3VrwngRXVPOF8GdUZ79L+DKHR7R9J6UPbYMWkwJqqwwL0YeXfF/zE6w6rWQGBTtA32al4Dh2AFwA473zlSK9L3oGQUlU/U2SRp8UidAa5Cs4uphbPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PNM5kmGchxaBPy9UTeIPhmjlaI6cmNBtQ+7yjRXB+Y=;
 b=UlZio1P/jjlObvX7fsIr1uiCHol1Vcf5A4ptTAXexd/qiibkn6tXIcf+FEz+TBFStSE3pVc5UedS58Yw+1gGjA24+rap/LYWSIwPoKrT+Ew6PtgUoFsincOqUT8HsosccOw0Xmm7SFNaHgX2N9ScoAxYD9wyrs8QbJlYbknEJARCx+a1q1MSlx1Nm5gJQseM0CYIpvHgeTBqv7PYZgilvr24+V4/Poy3kgBVIg0MlWUkoeDl08O2nJk+m3M6gKUY0cwMjT8m0+VscZAQNDaXXeDpqohjmC73PnLSRFMwfeh5hiVIZz7fS1nohkqbc31YjOm53w6GRUK4qn+Tg2VmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PNM5kmGchxaBPy9UTeIPhmjlaI6cmNBtQ+7yjRXB+Y=;
 b=dV26dEczxQnKEcq4MhFBfZoJikIkSxcK4u9I4Xghq5Hy+Pi6zdON8GqeB4Gh0Suey57JZt5Zis4vSF1nVuNWEw/NjyiYdQaS5tFacybCwPYmVIqu9cLYLANB10TnyVTCQpdajvQ9mZHtImKpPwmxCdmnTBn2YtSu2hTQUW2w1SM=
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
Subject: [PATCH v4 10/20] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
Date: Wed, 28 May 2025 17:16:58 +0800
Message-ID: <20250528091708.390767-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SA1PR12MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c9b3e5-0fb3-43e3-5069-08dd9dc88ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AvVEUYrLCpXVU7eof8HpKhyFoej6DzYJTNnic3tefaw4wQNUESW5yq/89hQR?=
 =?us-ascii?Q?2EkXxElq7H0PMeTXmWkpkG7qLTSSQEJscjdiVL5KPgyu87r0Hg/xD+V0dw5/?=
 =?us-ascii?Q?o7ITDifYwRD/5VB0Hr4QYytwmdZ7KUARg+Dnwj9FuvHSqpsROPshUf/AlqrL?=
 =?us-ascii?Q?bTaCye0DWsU1VE5a5GtEAxSQxTSdr0jiTmY7ZCFUILHaL2x3vW8pAbPYXXPk?=
 =?us-ascii?Q?wqooN4o271utJGQO8S8xMlt5vCwuYaCvASmXBA1djVTDgyk8th32OZpG8Gb+?=
 =?us-ascii?Q?e/0PAaAr3TlAzP0g0JpsR1fDuQru04xRunlyQHzgwodfwGX4EvQhjit8dZum?=
 =?us-ascii?Q?fRXLpxSzucEaaqLfb2zZkYporDNwDCkolWp4moulX6NAh4FyIbhgJpWe8How?=
 =?us-ascii?Q?HJCgCILwhiUBndEBE+RRzoqTxg/ajS9OjTwr41ci834BpIk6GGa6peiFxwep?=
 =?us-ascii?Q?3WAd5eoapwksU/sIuuUnnGITJlY+QppcuW+6SFKA8yWiagShlalrdX6L522P?=
 =?us-ascii?Q?QGoORhohIpEsaQP6/LN4r9CDzFwiqGO7rWmJs34cY3h294yeHFVxfqud0ycn?=
 =?us-ascii?Q?tjZ67XjRMR0ajxu80ZXPPMMdBkTLUcX+PCrJBEjNlle6YnHe6+uJw7wdU7EH?=
 =?us-ascii?Q?3otbcMsLMnZpcsPBr3T+q+XGbzBPcIAE76O3ji7aI2PMQL7vYA29k76dio/u?=
 =?us-ascii?Q?f3EfWgGmBjggqFCDZnyhnQ+yYwTLdecgXW2vX04MiHuXFZNoCMj8rAtFHr+T?=
 =?us-ascii?Q?YF+4Q9vQ7nF58VQdsYsJ7aCImSc/QZGctppcjCQf6nVX0eix1JiEKeBxP2ln?=
 =?us-ascii?Q?ruBbi6dgoWAgPe9bW3rWgZQ4APxcoqTu01+XpvHcjX7TkR7KCwHUcBjMsl7i?=
 =?us-ascii?Q?IVk+0knZVyiTd0SgFm7LhS3eSDrfjgHY+kL+t+GSB/eeF1BW6pCtm6Dx+632?=
 =?us-ascii?Q?Z3lJepqiYJOkJxriqjhYv6Ds0XV4Bwl8mXPyoS1ve7AYgpHgKD6mxxLpOCLG?=
 =?us-ascii?Q?Yik5bK7dmlOuBBJpkG08GKxNoahy39LbspZQGeJLNmpdGu9X+IX4hy44zFfG?=
 =?us-ascii?Q?JlrcKuL35QDmvUPb0K81NtsRjQb1EO2vqaKDAXMt88pSaYaK2UvwPcDU9xc2?=
 =?us-ascii?Q?MrxCLs1JWt5iVTf3pf+kbq0BQDO/z89h/rEaWMGdSdYulSWTq/QCUMGTKDQT?=
 =?us-ascii?Q?us60T0/O1gzfR+KCQ0IaOQaU08p49TWZHN9TQ1T1mQlIx3oWB1qR49ubCRcY?=
 =?us-ascii?Q?deq4QbM+AThTTuY09u3gNG0mayrhsJKPhuSzWU67FVD+4gF+viQMUdBVau4K?=
 =?us-ascii?Q?Q+WEo82q7VGzUCaeJ0hOjk3opIDQ7yl7JuAtcGFbEr6VXxYmmqg79wDGDhf1?=
 =?us-ascii?Q?Su+VNwSzn2EXEF/0iF8lWjlvb6GEf2N0ciArxhC5Dc01ASN7E51UsKOaR4B+?=
 =?us-ascii?Q?vxduGW9mUN6HLk9erkRhlHMIru3GpSqNm5bEHbbPA7CSCXBzSmXhv+xvWYp5?=
 =?us-ascii?Q?reee1ELt1Vy/TwpOkDtTKeXxbe43aVrH8lae?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:07.0280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c9b3e5-0fb3-43e3-5069-08dd9dc88ec7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6845

The following function is only to serve spinlock profiling via
XEN_SYSCTL_lockprof_op, so it shall be wrapped:
- spinlock_profile_control()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- add the blank line
---
v3 -> v4:
- removw transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/spinlock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 38caa10a2e..0389293b09 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -690,6 +690,7 @@ void cf_check spinlock_profile_reset(unsigned char key)
     spinlock_profile_iterate(spinlock_profile_reset_elem, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 typedef struct {
     struct xen_sysctl_lockprof_op *pc;
     int                      rc;
@@ -749,6 +750,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx)
-- 
2.34.1


