Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C405A94D4B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960999.1352635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj5-0008Vo-9L; Mon, 21 Apr 2025 07:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960999.1352635; Mon, 21 Apr 2025 07:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj5-0008TG-5z; Mon, 21 Apr 2025 07:37:59 +0000
Received: by outflank-mailman (input) for mailman id 960999;
 Mon, 21 Apr 2025 07:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6lj4-0007m8-3V
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:37:58 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:240a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a4b8ea2-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:37:57 +0200 (CEST)
Received: from MN2PR04CA0017.namprd04.prod.outlook.com (2603:10b6:208:d4::30)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 07:37:52 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::f1) by MN2PR04CA0017.outlook.office365.com
 (2603:10b6:208:d4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 21 Apr 2025 07:37:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:37:52 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:37:50 -0500
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
X-Inumbo-ID: 8a4b8ea2-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFsTZo+EhhnIOsK5aO4C3EBr+HZwU4hqJU/2+YsIqSJNojnfQu76/VbWyr+dMLxKaBhaPzdxdf8zZENbGQkpWvEVoy2J2hKNlv+0wd47M5kZk9dzYCJbRW3+LvpiXKXD9W3RxeZSNGOyCxj7nUYC40yTbDbf8O2L+AjgSDXq9l5TBoFNnpyoUDxB5IaSCBgiKtsqIfv2/9jutjijPQRYy7RrwRcdsLQu85DTEjVW2eULKqdw6Q0vLG1UtL0lnJWCKCkIz5kNqmn/zavBuSzUQiIo+mWEd5XdVCvqQEw4GwJ6PwFNvSvDBZmo0OJhAi6qgONBIYb1ysE22D85OlFlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=DvZ4hEXcpWBHHhlM/8JrEV5m7sfzEW7s/5J/wVyD32oZ5kIpG/Y9f9so6r+ZrxKh5oyuuwntOXZ6xhqV553XjDWuKAW3eU9/5d800ZMEOMWdTvccEyKl9RsAjYsfiSxPbGA3VQHir321JT/AiKTH7FMONlrrmd0eLoKw9OKryNYizMwF7MfkbfUteyPP84VHVVbeNyMbkGReGLFQ1zOdcdhigJWb6FVkCzMYnmLZju5rlqYdAz6rCU2zBuNMWgsPA9qVBVM+mTUHFRC61fA5NoLIchabp1aoiXCZTdw0mk0OWl7dgOOpewCXhSo/lGZOVAcJYsvSCJwPR7NA4CM8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=rrItc8Ysk3LZSfErRqkcG65EnPrf5YESj+vIZoRikvP+00IkS7VHwB7dIVcnpvCOPXA4I4dYEET7TY3tMx641kjUuf8LkPTwdEAgE1uPnwvDxysoXHj5nI/IYwF8t7MPpSxsK/CXtDc45B3+7w1i27Dc1T6wZeaUrniX1rBlQ8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 03/20] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Mon, 21 Apr 2025 15:37:06 +0800
Message-ID: <20250421073723.3863060-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|CH2PR12MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: cc25fabc-498a-4f2f-25a8-08dd80a76c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zK6a0JhEaXyng/VVpg6RRPfJLGJeLp2wnSMBpLQj6/aq1JuOQv9RsBGp5N50?=
 =?us-ascii?Q?iF4LMwS2bS6hv2WjZnLwk0raAgCLwOq2mx/0fLV84IsmJKMNmm8g0aT0pcO7?=
 =?us-ascii?Q?JzfqG5om2+QhvL/USteMevGPAcT8pfcLKbrUJ9mMVIGXnhE+aWCAZYH8c1QC?=
 =?us-ascii?Q?laJZ6lNZR+9dplKvsxOYyoloWd3+dGoNRHb2+rJYB15ShbDltX2ApnyN/hAY?=
 =?us-ascii?Q?Ao/nW1d4vpFmzoFPh2Y9Ziiq6GmHUNlb1R99uFFai8HpA6lB4SRjdiKAr5/g?=
 =?us-ascii?Q?gspBA0SiC7j9NI/9yqWsxlhRLRptm2Ut2fZzEkxS13pVjKYkbmzXsMvIWvs+?=
 =?us-ascii?Q?lx0I1sZHoqpeG5C1TVVwPgx5Ekkbv4KJ9VvRZGox0Lk/8kX8qSKdaX8pPkNa?=
 =?us-ascii?Q?0sIIoRWXIFW/96GV31EE0mp16pOVwjt5AQjcRQg7k8R4eDSrAdd+Ech8my+2?=
 =?us-ascii?Q?ttk3omhfpnYlywOI0q2VdhAs4bwYgadcUIrhBjZO53qxkBfTjhaz9SacX0Y4?=
 =?us-ascii?Q?Gtld/ypvO4feA5BOiWAFMJjM0rGnczvV012Zf3wJRXSxD1vVM8cGkiNoDn0k?=
 =?us-ascii?Q?ZCGZ0kB+LBzIHWptfcR0vV2Nud1s1DzeSIPmqI95g47htJT0ed+iG2G4fdqb?=
 =?us-ascii?Q?4rjhoyf0u5jRaRDBxXqFhBJtUVPg9xamotlQa+8JPdVQ+kmw/JKVvrJm+VQR?=
 =?us-ascii?Q?xbeYOZYunbjSSewiSKzK0ywNg0MqgsiWQgKyF6/PWGvNrgGYZubVyvBbuXUt?=
 =?us-ascii?Q?2FI5dETwADYnBjRKOFjn6Tiw55HCqrM+wDPR38qzMLslyUa81wGbBY/yg00R?=
 =?us-ascii?Q?zmU2WJQ87QE4Ug2/ID8jE7wXkSwWhI/JctiYhjDEXfs6kezDYjeCfbwZFi+f?=
 =?us-ascii?Q?bEy3aK5HOmZvl8S0T3kTIqLpwEywuQwZkrPNmZQLTrtK4e/v9EAMsbt/Jzof?=
 =?us-ascii?Q?gYff1b/AIpgI+7pIY2W+27NiGHyTZkM44WcCRZaa6m9njfAQWJTs0BxRp/0j?=
 =?us-ascii?Q?x1fgcx7m8ylEdZd+51wTxeKuPf28E9Ek9L53m22ClCPOeaGyLFNjt0J3UoyK?=
 =?us-ascii?Q?VEeQoAY9P3IBYFvtrsyvYRhcXmcWorR7UIid8otS68ckStopwbL26Y1a8qs0?=
 =?us-ascii?Q?VHKREFJnM4YGsK2FbN9Uc4U8HcI+Rcd8/jKqjf1nPqEop6xZdCArD0x1NNg/?=
 =?us-ascii?Q?6kez28AW0aAjMHqB8VyokZvNtamTBQfhzLDX0dzjMa6Uv6PXIiuvkfHi5qD+?=
 =?us-ascii?Q?PRPOSfuwwUtKvtlWv7jW23d0x0sNbJXd7Q1Q7bGhTDMk/dbu1JZnxU4V4CW7?=
 =?us-ascii?Q?BsvJXhxQBeQyLNjbxCUryd+4KcfFpUE14I+QYMm7JxVjK1ws6eJn+4OXTQCj?=
 =?us-ascii?Q?yBS3oFJAdGcG6vF4uSZNtgNMl/xC76lkob9kHdsgRI64JkIfLbiH8x+gsESB?=
 =?us-ascii?Q?ASta+0V1mrLJ5wtR9jn7Gc02P9ikCwmjbB15PMkrG+y3ySTcKU4z8ybChXpV?=
 =?us-ascii?Q?mBAqZWdYaJSISZBHdo1TakTkHKTo9gLa5RMJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:37:52.4820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc25fabc-498a-4f2f-25a8-08dd80a76c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496

As function xsm_sysctl() is solely invoked in sysctl.c, we need to
wrap around it with CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 2 ++
 xen/xsm/flask/hooks.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..22e2429f52 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -261,7 +261,11 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..93a0665ecc 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -22,7 +22,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
+#endif
     .readconsole                   = xsm_readconsole,
 
     .evtchn_unbound                = xsm_evtchn_unbound,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6a53487ea4..3a43e5a1d6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -856,6 +856,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -933,6 +934,7 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -1884,7 +1886,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
     .domctl = flask_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
+#endif
     .readconsole = flask_readconsole,
 
     .evtchn_unbound = flask_evtchn_unbound,
-- 
2.34.1


