Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E175AC8D4B
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000710.1380909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySH-0007cb-Hu; Fri, 30 May 2025 12:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000710.1380909; Fri, 30 May 2025 12:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySH-0007Zt-EY; Fri, 30 May 2025 12:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1000710;
 Fri, 30 May 2025 12:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySF-00076q-S5
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:19 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20607.outbound.protection.outlook.com
 [2a01:111:f403:2409::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12d8a7b5-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:19 +0200 (CEST)
Received: from MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::35)
 by SJ2PR12MB8875.namprd12.prod.outlook.com (2603:10b6:a03:543::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 12:03:15 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::b7) by MW4P222CA0030.outlook.office365.com
 (2603:10b6:303:114::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 30 May 2025 12:03:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:14 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:12 -0500
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
X-Inumbo-ID: 12d8a7b5-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgNdOYn6LZppeW60AoHaZawC9zMx/TBsYCkwDmCWFIwHfNgNTSk0qkHDC2TRrIY6MqF9hUvp21lGjr8C45/pP1OfPNZ2McUQ+7syqFgZvRqSbb/CtJ4ihjvTqX5EA+2+iWhDAx2JHhYWNZ++i+ZenI/YbnUwnMCQB6JaeYHaUvSRUH528EXsJV4ZEbpxm3ooezBlvXUzLf5aGzm/Z5CcXa6wpFFhDhYm4cnkhSz0Bmb2oM+WSPUJX7Vj5cT9CIrrJQ/kkAYN6qgN0Df0PjiwZ8VFyM20XOjXDRQ4aQTNEadQVcTLKjfbf4Y1pB9n9U3H4SFqoa/XthtVnIxuVHp1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXe5G9Iqi22LTrUnfwfBy2xZ8mkimgLDxsX5KClv5aA=;
 b=sMeTs7B++1zOODlgyRPXuiY4Ic6+NnmMJYJWsYcRG1R2RhJu7YmAqcskRhXjbDLc9hcTTNY70Ge3NUUeM1i5ibbaj8lPNU48CT2wZ3U8/sKu+mBmEPRWPJHRuLQVYLU+ubVvKkook7sSs806xGaf29nIkTKuf+PFXjA8M5YoKeuhwDK17oDhGDP+2gqcmr+H5iAO2BHwXVMshtnp9tIkntsaVDyesVeKfDUgxxdbU/GKeCsWwucyzw2z8TL6/tG7J7/kpu8AXH5ekZDMhqpbgOuh3t8xzWkkixUcuWrlNgNWEi/5IyXYERGybyFk6tmvzfwR9IbP9/KI5sReI9UARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXe5G9Iqi22LTrUnfwfBy2xZ8mkimgLDxsX5KClv5aA=;
 b=JVrQATxBKDlNkVzgQuRS9caoou9sEvDf0glsQJH0iN9Ux5BLI6KmDWocEqbphrSSGqgi0DV3lLkxcskERrFSfek9FGagIhTajRP57oVfjA78+QTW/a9qyz9i9xQwEBBqJRinOgx9Rox8Bda/rdMFzKLs9GesEWoqGpsxgnX+Yhg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 04/19] xen: Add missing forward declaration to  btcpupools_get_domain_pool_id
Date: Fri, 30 May 2025 14:02:12 +0200
Message-ID: <20250530120242.39398-5-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SJ2PR12MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: 1838771b-1bce-4689-5d99-08dd9f71f52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ujbPSl9VUQxCXANEnhkT8ggAjjklNJZuqYZmdBWQ2NwEzvbJK+61t6l9qN/Y?=
 =?us-ascii?Q?YuneEeipx/SIn587HQVZRQD2v3URS4PILJGmwmXi2AcbGspCc1T27qu1cg6s?=
 =?us-ascii?Q?4utwWpkmLyYMgoYgK0ve9fLOhiR4qd9xUnIZp8RA45ptRLpJbgtCgZk+TfSi?=
 =?us-ascii?Q?TEPo63Zhf1pME1dO7vOQqRXhe0dzflmuq1fFaV1fakf+zyUHV+TnNrAPKsP4?=
 =?us-ascii?Q?o3Wq56+fnbmjgMv0BqBlJb9wd67J01cQ11JdiBKhuCpS5nPOdj/0+tbdygcr?=
 =?us-ascii?Q?03L7eO7aop2gnei/AntGzqcQaZkZF5/SXRe0WClhGWVuG8V43Nu+MnnMPQEL?=
 =?us-ascii?Q?ytdEMr0EdqL743jYPPRWNpBSwaoNkf+UGTrlOPrD6A+4QUd+MWKqREN1ROpd?=
 =?us-ascii?Q?0IGSBjHX/CI3J6VMw5dM25PMKt1RmoMe5aKXxqGrWoXp+IjFxAU3SHyOzJD8?=
 =?us-ascii?Q?F/Y3XhERrk32/tNN6fU1pV98ifQlVEQHkZ0TDcTmVOFy2kMaFrSksSgNId36?=
 =?us-ascii?Q?C6s9lFKvO8vDrMLwpoq2JwxcobcG6o0LNOjVYpNGQJo5C57M1FTMbfSL0FnB?=
 =?us-ascii?Q?aJvQhOe0/tqSWTtTMbG014yDMWpT5OuG+xDPL9wmowNJYAreZinHnDcho10S?=
 =?us-ascii?Q?INchhTE+J5Y5Md/IurI4ztZQfEteQSO20EOu26q651QBY6VUsFTUAVat0+1a?=
 =?us-ascii?Q?yax7ckmm7nzaz81CwPwejbZ7e5ScUtelRC64WYY/aIVQy+1Sh1dMwfsYR5XU?=
 =?us-ascii?Q?EDWjzydYtawl71qaAaUmnhl99rwOzltDrTEZUmQ0G4fsYWQqt2B2RIiTutSz?=
 =?us-ascii?Q?sCXB0CXvIgsEp88337c5AytnhuObgwZXiO5pT34qgqzEE0jXt8HiSvPlgcpi?=
 =?us-ascii?Q?MS7YS9f1PIoheg2fWNRfFVWyKWMt9REdnpqwPSx/cubOz3iYHfaakOzV0utE?=
 =?us-ascii?Q?mOT+Hw33MialGYA2E4TWJ+n9VuOyi0M1zuvZBGAyIZoj76o4s29/gZoUtxxV?=
 =?us-ascii?Q?cvtxTXMsJ2zdECokV+7Db4s0W0WNEaJK8NIIq2LxACLeH0m7EJqgn+ujWNfM?=
 =?us-ascii?Q?RHv89/yAJ2swf3z9FEqIgxXw9VklPg4g1rYH6neBWxiKImMx9wWAxb7b6OPU?=
 =?us-ascii?Q?jrRymDJQpxoSxs0c7Qx41PMrYhXVonmL8fLo4qVmsJCLOxixj218pkvG0ExI?=
 =?us-ascii?Q?fIutC56DCqk4/7eGJMentHOUHdKhifxZM8pFqhWhvEuwqijgvf8n7lFH6aVP?=
 =?us-ascii?Q?Mw/B7/xaxzbJqBd7CuzL9bT/L+QvJfpt/ZTbDsCF5WZmthQFPAO4I3bCXYYX?=
 =?us-ascii?Q?xHM1sxpHxum9QHPpxoapqB7vPAYs3W2grZQQrqzDzOwJ3dcKRj/qsNSXtuDb?=
 =?us-ascii?Q?oW2ZULywzbbX5UMhWBdHqT4Y7+Vqh+I+1f2i+28mLjDOL2N+N7zl09Ii5k9N?=
 =?us-ascii?Q?XwJbxnNea3YUN6OY0ZVuDiy5FslUsu1QmYKuNgtG6nWMRrsOA6JIHDVtYqud?=
 =?us-ascii?Q?6asq12L0vr0UjXzXrLwzMGjNeFJAO7mTJ0TH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:14.9312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1838771b-1bce-4689-5d99-08dd9f71f52b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8875

And remove the ifdef guard, as it's inconsequential.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/include/xen/sched.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c..b5a6a22c7f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1291,15 +1291,15 @@ static inline unsigned int btcpupools_get_cpupool_id(unsigned int cpu)
 {
     return 0;
 }
-#ifdef CONFIG_HAS_DEVICE_TREE
+
+struct dt_device_node;
+
 static inline int
 btcpupools_get_domain_pool_id(const struct dt_device_node *node)
 {
     return 0;
 }
-#endif
-
-#endif
+#endif /* !CONFIG_BOOT_TIME_CPUPOOLS */
 
 #endif /* __SCHED_H__ */
 
-- 
2.43.0


