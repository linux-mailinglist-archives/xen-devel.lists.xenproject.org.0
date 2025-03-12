Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F9A5D4F2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909678.1316614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNG-0008KS-9B; Wed, 12 Mar 2025 04:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909678.1316614; Wed, 12 Mar 2025 04:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNF-0008IK-UK; Wed, 12 Mar 2025 04:07:17 +0000
Received: by outflank-mailman (input) for mailman id 909678;
 Wed, 12 Mar 2025 04:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNE-0006o2-1U
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2417::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a28e153-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:14 +0100 (CET)
Received: from BN9PR03CA0519.namprd03.prod.outlook.com (2603:10b6:408:131::14)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:10 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::2d) by BN9PR03CA0519.outlook.office365.com
 (2603:10b6:408:131::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 04:07:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:05 -0500
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
X-Inumbo-ID: 7a28e153-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSmlVcRQhYFo2TKTDFfb5Umk/3L9lW135zemp2Zag00QgFHqtCySlg3U6k5snHdfh2qjXIUIxW1YYiBD8HaCY7uyJ4iNEz7O/D7Zbx8eaM/KbO3v44mJgba0JxntQ9xh2VwVaaI05bAkcERjpmp0rZ43lgGreol6/riWq4XGQ5CjALqLBM9tI/tv5NK74hhgZCZi5yUEB/ED8RkIOrot2TsJRyQ6qCXA3C+Wbo9Isk7kJTIc/sE96s8M5S2NsVqqXKTeEtYU/jc+5XpAE/0q3n+tUd4qFPrhop6c13Qv1nxUv4LSEqmkMZjrK0YF85oAQmfCcQitMXH4l6bUjekxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MulITfmVWa9VrAVpSfm2qWFDXdm5/Mzq9x+66kMeZ7g=;
 b=mMpA6DUnPQoNbNpliA33T+ZAPtSswrb8Sp2PnhEcqpmm7yvcY/GXzCWcWMBcLZvRlcoCeygKK8zsGkYQrKwbutRC1nuKCuZCsWcwnMxmizmYWtgj2yTZ5XcfzntP06iACdl++/Ho+xhDKWrjgI+yYP2hT08Y/ZWJhho7LOEI0pyGU6MzQccrrmM9broJX5/yeV9A+qx5LGOkbTQLQwReaY5oDhn+ogekp6Xmlx/qUfETITojinfUtwB6p1abxlyUkDZNzcLR8oS2vnjsVzPRX3llR3TH8YnrcdPiRcOKcjpLn7YmfzythLu3IjhTRToUoF38VBOgQjbB/gNpJPpDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MulITfmVWa9VrAVpSfm2qWFDXdm5/Mzq9x+66kMeZ7g=;
 b=fhFqj9wOBDtc2ZzeN/Y2T5tuu0Rxt4JI9qhp9S8TBlUS/cOOpGDu5xzbWoZhOBJAsW2Af+VAeWG/+U7+HkKjKh+ZRnRkC8TaXPJLUyHbNjswa8CfHkkyEYBMPYtkkRLtO5Fh/lWG8yUmxsm4F9ctdL53SOsitdoWxhvSdPowRf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v1 05/19] xen/sysctl: wrap around XEN_SYSCTL_sched_id
Date: Wed, 12 Mar 2025 12:06:18 +0800
Message-ID: <20250312040632.2853485-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c95c138-bf4b-4f5e-6422-08dd611b5c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pJrKAHo8ZR2OoO8yVoTR9/R6qGAjFVfbJlqoV5MdeLDbRgIce/b4zReD69Z/?=
 =?us-ascii?Q?/uTPf/B9ob7OzSNxfv0B52uq/RtipQpUjzs7Ka5Zgw45oV1b1ElnHVYVwMkl?=
 =?us-ascii?Q?r4qzYpIhrbpLNoiCR0HZ15Vylkz7Dm3AirAkjcFp0WZ5kvq056K7nHWF4RSF?=
 =?us-ascii?Q?Kerfkt05yzQSKgk49iadyXMwI70ar0JBbRla8fWm0i73ez1T4tjsjt8EUwFD?=
 =?us-ascii?Q?Ufl3T5EuuT30FXCBnspK0gBBSmn+cN0Calwks8iqqsPswGj0iMfL+VkOXPWU?=
 =?us-ascii?Q?r7hk8cE+O5qqwodivwjV7GSpeDkFer0qy+wu7Ti53a9TwiQpiU1dCOtlpwAa?=
 =?us-ascii?Q?OWNs45CbyzebPvqkVLNvmfSKwpDQWj6NtDdOW6x8hcivOoeOmkhCezb3dFMQ?=
 =?us-ascii?Q?db7AE5f58Nh4jv9G+bLRmsioZkefLQMT7bYCWP/pLEvKcEkgmmYFFt2tciK/?=
 =?us-ascii?Q?bUXAJ2UFuBhAshcXjOS3NiTuyJXFISCAKs14zdglbi4wb4OJFGF8bKxpavE6?=
 =?us-ascii?Q?+/KY4Cj9z4s0wk1PF1bmFbjzfw/yIKRq4qpvImbFaykiKeRKme/8QkSNw1LJ?=
 =?us-ascii?Q?+m4OIFuOcaS0e/83wDKaLawbevXci+SJvzitW6LIK8LP1wgzvo+rhwGT57os?=
 =?us-ascii?Q?FBuwDs9BURb+1Xe5H3xCakJPKPMDAeZsWlUh+uhrcyL4EkKJDSRaRgXGZXAX?=
 =?us-ascii?Q?+RLY9HBLoZ1GyJwDDtfofVYCb3+AwVEGBgeaozl7HohHuLVN3AQzxZLorzcr?=
 =?us-ascii?Q?zNMJdIWGm1ihsOAJlb4mPfePI872pDnUSf+5JHPZH4T7vg45TZDJmyh2ZZDl?=
 =?us-ascii?Q?JrNvSm/Lf3hbqLIjdd+ZvZeIfsqBurvCyLU//pbU1Rj6/306urwGyb9BJY8e?=
 =?us-ascii?Q?ssrXtVwsbC/zAvi7ou6tCxwPRUPS213JOwaenqIYBauAJic34jPT1Uy5Vs3B?=
 =?us-ascii?Q?JHfeNGdpFZ3Y5jtb39iSjUOwFRq31ZKPi5bMD1mK7XqjoTtzEJ/rk6U1Cl1p?=
 =?us-ascii?Q?xGAuJqcI1wmKhLWlsculMRqcCjeAbLXChFm/ErG7m18Uc5LE/Ta7QvSiuhrh?=
 =?us-ascii?Q?KOCkfcV41PI3RyLqUJsTMWOk+GxAbCwtlKv6gETu3+nkIaNe7rcNSMe2sPnJ?=
 =?us-ascii?Q?RpxLpp+KVtOQUrpgUhqG8dfuyGbzwe3dmGY60Bcp4lpNks6CS6pEjRTHoemY?=
 =?us-ascii?Q?BGpb9jXDwoVCcBF8DV7xAOQYIRpEmrXAbKQRvSN+g5cS8CFwU8w3zPJ8CZH5?=
 =?us-ascii?Q?knwSBmQqnRFIuXpCr3inRdw2SPzPv5JhXSI2E7S1OG6AjPd3x2SwIdzIqnIG?=
 =?us-ascii?Q?kRvbeEZmGTmSM5RnBX2srghBF+r7oLromUteJpaf2YIX6y71bH7wXNnCzC1j?=
 =?us-ascii?Q?8TmGSDC/6pnmZTzu5AXb5HM6dS++X3VZjlWBgRMFC/nN0m/wUtvWqe3y+L3u?=
 =?us-ascii?Q?UxOzjVK3Ec2gCN5xV3GLCBvHTNAw7X4u73HN1deKnLllGHyKiXOBDMwxWgxm?=
 =?us-ascii?Q?20I6YoIiMiAc05w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:09.4106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c95c138-bf4b-4f5e-6422-08dd611b5c27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073

The following function shall be wrapped:
- scheduler_id

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/sched/core.c | 2 ++
 xen/include/xen/sched.h | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d6296d99fd..ea452d8b3e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2052,11 +2052,13 @@ long do_set_timer_op(s_time_t timeout)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /* scheduler_id - fetch ID of current scheduler */
 int scheduler_id(void)
 {
     return operations.sched_id;
 }
+#endif
 
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c..9bdeb85aa4 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -849,7 +849,14 @@ int  sched_init_domain(struct domain *d, unsigned int poolid);
 void sched_destroy_domain(struct domain *d);
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op);
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
+#ifdef CONFIG_SYSCTL
 int  scheduler_id(void);
+#else
+static inline int scheduler_id(void)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 /*
  * sched_get_id_by_name - retrieves a scheduler id given a scheduler name
-- 
2.34.1


