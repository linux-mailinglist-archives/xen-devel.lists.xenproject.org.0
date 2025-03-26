Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFBBA7104C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927132.1329938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpV-0008W1-0z; Wed, 26 Mar 2025 06:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927132.1329938; Wed, 26 Mar 2025 06:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpU-0008TA-Sy; Wed, 26 Mar 2025 06:01:32 +0000
Received: by outflank-mailman (input) for mailman id 927132;
 Wed, 26 Mar 2025 06:01:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJi3-0008HQ-42
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b00e91c6-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:49 +0100 (CET)
Received: from MW4P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::8)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 05:53:44 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::64) by MW4P222CA0003.outlook.office365.com
 (2603:10b6:303:114::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:39 -0500
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
X-Inumbo-ID: b00e91c6-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYDLBBKTy7OF9vW/vqXUCw3fmr7nJPc9O47o7fOmfg+/ENsiFzcZxA+rwxeCCaU95BcnAJXlEVsXWkELvG/6TS1el0P0vy9lUXctNkbSAuI6TT3FWLqWtfLTn1rwJAkTL7Bu+MSk+bR5m7DDQ9q08AWujiidIsdot2rsmp9zAFp9ZvEef5EB2FlBJW4AULfGVUySb1m5lv2FQkCA7i0YGflxZNvMJDgzi0rHm8gtoj8qfqONIYe3n/NhVyEVCLRZ/c/3LsZJE/PYDPK1V33LrsWYSnHHeieeOWQx4+4Q1N31GSuKy4fPBCq4YRghgaBTTNvYeBGatL5KNEetH0OvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkPzVb9EWJAVFmOTUhFIe6Bwd7eu9nzSdd6u4mcgRpM=;
 b=pIwXy10+/tOlQHqNTMzgbql/EnSPic4JHoe4s9MHcobvBZwc/WK8IWKWHQVTN3wONLGm0hNZmgn14Ff7OYeeMMeyLTpQ6BH7NfoL/f2A+g6phWXDRdrkIlTRisog6IcIFGJbYiP0Vz0IknXVb2d8KUrL78e/noFDj6u+CArtnrqHNSa6XUoGu0g3nP0vUpXGVrLybX+2xCvqA007Sb7G1RSp7DPDLFcV/6F6PX128de64b1X8KfIWMuPEIj3/QKNK0e1XgIt6TrgeoOyDuYd/qhUDPy6sOJx6RZN1Vb06wmcNihrlY3+bL470c3Qt7MQlDRhDKv7zb2ptWcEnX9F0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkPzVb9EWJAVFmOTUhFIe6Bwd7eu9nzSdd6u4mcgRpM=;
 b=TDwyIPP4Ou8xARzNIlWIfD1ofqvG3L1gyoz5XDU4hoBJROEBsKhuSIteqrFbO3oFmWzbvoIJtHgl1pY+9yHRzf/27eUA+OlrWhv34V4A68MPH0ThYOvSChUXAEhT8jtiqmV515AyS3xEQcxQ21yRkWV7CEqTfsOKmlSilIDDwrI=
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
Subject: [PATCH v2 08/19] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
Date: Wed, 26 Mar 2025 13:50:42 +0800
Message-ID: <20250326055053.3313146-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d5431a-95a4-488c-094a-08dd6c2a90ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BRBWHhGKC0ba7ZdMvgrHoYC7TQBRDd+SG573CRs6H3ddwvB7OilZggsB+7Gv?=
 =?us-ascii?Q?vr5DIUy2TWG63ZLYVuDx1fiBdFRYeiBvnwfESz8iHNWdT1SbzsVh+N0kThrI?=
 =?us-ascii?Q?MW9fmzmjpDUgmDDpHBAfKwZEEfrCr84/Xfww5vfDzF63ar63Z2/UN3GryzDB?=
 =?us-ascii?Q?R9bfOF0EJKy/arJEY1+HB0DWQRWxqex1iLnvEdTi8eBlZ+VsuCG1ClZpTz9F?=
 =?us-ascii?Q?n4omhWI0eBdRAEcyL0SE8ams/f2GU+rC8cmml5fALU9ebLGEqXOscc96BHAn?=
 =?us-ascii?Q?YT6G2HYM8VDkT/cX7VCzOyxYW0i0EFWyA2OwEE79dI/r9DDggQ/J/eAi1juY?=
 =?us-ascii?Q?bos25yTH8GNcEaE3si2aupspKhCSrm0911DE2f9G0vkwU9BkoryZSma2+A6U?=
 =?us-ascii?Q?O8IZCTQ4wY3uQbrwkxeaxvkLoQqzk0VSbDz+0hampab1nrEUSsnC50FLTYbA?=
 =?us-ascii?Q?63gXBKzeG64e8mt1l4NOqbEitvyd5C0oKbLBKhjFWcWyAGmz6pOvgdb2saD2?=
 =?us-ascii?Q?d4N48ROttc/uPWcpQsDzo5D6ETQ0jB5F0KLu0Nrsoc1S4o7G19qC3sISinaw?=
 =?us-ascii?Q?2pi7CQiduZvO65Z4A255koCfisqP66FIzbJAiHZEMzPkVzIHd5skpI8KerzP?=
 =?us-ascii?Q?mhkCh9wPfAh3xoZaaEnDHpkhMjpQ9JAZtC9Wjfg/UijdbXiMZM7WTe8eMXK5?=
 =?us-ascii?Q?nMWvNh8qgfTVUxxMFkpSBI767wqgmCp7YKIkaudND3G1sabF96N3C+K41n+m?=
 =?us-ascii?Q?Pq/uH7uejFA+6pckMUys9Mh+24kRUGKSNBzyWNGL9D1HWze4F1MMfNW4zACX?=
 =?us-ascii?Q?PHcREP3DncP7c51g/+jRra2zGw1cL5nzPhnniccLkugZwFyf1MKHQlyAuPWG?=
 =?us-ascii?Q?f/UVe886ThkXXxHGJZYgpMDLu9k5rJNTDDEeVV+21XCq9Qn0tVIjSsB5KoH3?=
 =?us-ascii?Q?zvMUVFRm11n2x0HApXHoRWuW4q7JzXzsmn56Ko50V2FlVqRQb5dHoVkphlmN?=
 =?us-ascii?Q?Fwdpumjbvmk6WO+zB0zISRq7JegpLbw7KjVioKGWtNrIWJd+GU0XIv9eYW0B?=
 =?us-ascii?Q?udr9vsC41aFqG17wbDibvuHr/a7mJNCViQHzhLh1PN6nV4mFGurIGWw+dPCk?=
 =?us-ascii?Q?6n07AQoFslHARmn7+9tyPS0KU1VOC/B6/dYUE0v61agV6Mto89chm5XTwORz?=
 =?us-ascii?Q?2ZyWB4Wb3bEtY3TQRCcz01+iI3B8xL3r0NLdklSjn75P+BwPrikihFnAc+7o?=
 =?us-ascii?Q?9RAmW9WZCGJzb6EOqfy1txBR+pzA8149HtcszEdqIYkzTaJlD6WDzRTSo8A5?=
 =?us-ascii?Q?D8NCLlGTC9n5zOr0XAWjrFOA6XbHDhJH8EG0Hwc1E2IWrc9x+FBzrSa8McPV?=
 =?us-ascii?Q?+T8iBreS3ErPZSuVhI1fuadBR/tHYHSMu1xCch6ITpeWsJKky3EVkBsJKdWo?=
 =?us-ascii?Q?YZGLeLqaWnxKoMdxKtWIR5J/45JJ9KnQd1Gpl+ssq84PYTdHf1KLlS0rCrng?=
 =?us-ascii?Q?pFsD7dx/m6sl1Fg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:43.1239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d5431a-95a4-488c-094a-08dd6c2a90ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175

The following function is only to serve spinlock profiling via
XEN_SYSCTL_lockprof_op, so it shall be wrapped:
- spinlock_profile_control

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/common/spinlock.c | 2 ++
 xen/common/sysctl.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

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
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 0da82d6e31..4602d84203 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -123,13 +123,13 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = perfc_control(&op->u.perfc_op);
         break;
 #endif
-#endif /* CONFIG_SYSCTL */
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     case XEN_SYSCTL_lockprof_op:
         ret = spinlock_profile_control(&op->u.lockprof_op);
         break;
 #endif
+#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_debug_keys:
     {
         char c;
-- 
2.34.1


