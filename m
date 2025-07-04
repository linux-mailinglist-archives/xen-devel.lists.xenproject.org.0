Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F1AF8E9C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033085.1406507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckT-0007Dg-Li; Fri, 04 Jul 2025 09:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033085.1406507; Fri, 04 Jul 2025 09:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckT-0007Az-IA; Fri, 04 Jul 2025 09:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1033085;
 Fri, 04 Jul 2025 09:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckS-0006x0-0d
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81f36bfa-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:30:23 +0200 (CEST)
Received: from BN9PR03CA0399.namprd03.prod.outlook.com (2603:10b6:408:111::14)
 by LV2PR12MB5992.namprd12.prod.outlook.com (2603:10b6:408:14e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Fri, 4 Jul
 2025 09:30:18 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::8b) by BN9PR03CA0399.outlook.office365.com
 (2603:10b6:408:111::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 09:30:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:15 -0500
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
X-Inumbo-ID: 81f36bfa-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDdWThzy6saZ2bBiWJXrvydyuZ2aCWc3XnY2Gi8uLzut4aZAkRlT2RNdHMcZjxDE0Q8EyNOx6NnauIgt0A+caxywzITeVDifLZYNe38Kne0HXqTv0KEBnV+uG9qRvizqlvBsiZbUU0QHbt85N/PRbSS9UaJpLSYMKpnZxoBg1UF1XgI/gCnHfvI6juvm/0JX9EtwWcm3KoUx5m7FAftFQKnaWXBucMxFNHbAfihMbssrB9TsvKeQ+7nw/7p3Ldl9w8pK5LsPsJUgdEktWiemWTcwIVWFnPwpW3+Q2K9ZiclmgOVURUSiaXOGpYpcAXgtWjEwx4Wpd2kYFi4L7SSyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRS93Hqoh3N+utDDcTTMVxjdZcKA6NhPk5u7Ncd0IJ8=;
 b=Jhv3pe8ZAS4seoY7lSbEDjJWIG2OL5mxIxR72PMfsx4DqgTuhr+xX5RkiAzzVgZKJrmaLscimhdzs+xxDU+slVl5yx7OAYXmoYx0tRun9AZrWLg2Plqp8/9mYTzl8ueTagQ1c6CL0YF81Wm+BlaeE8wETYeobvEcJEgD+/t5axiT+AZ0nwaVV4+pZzKq5SNkCO3e1R9Xu9aAzuWnyFKA2G2QFeS4MO+Gio+qTpeFd51gdz4Cqo8M3+mA/FtKQk5KII9vEyjLQJuxUPl78Ydre1D42kLjI7WXyB1Qg16SZ7c7hwyizhAlK2xLDviWH8CBwpisns5v1QPA+YsQxrStIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRS93Hqoh3N+utDDcTTMVxjdZcKA6NhPk5u7Ncd0IJ8=;
 b=2N1ZS9GUblNQq8c1Jzf/v1z3mYxgdkpefwoQanIPu99yRPl8qUK5AeNtWP3T8o76FUfN1FhJhH6Pzh6XUxVAZTEzyBdhAh4G4Nl1+fsLn7KaM8ph+rNLmObVHXAnf3UrgmIl95EdEEWjVCycnY4fyIRjbMBdvD3RIows4dOZPyY=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 03/18] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Fri, 4 Jul 2025 17:29:37 +0800
Message-ID: <20250704092952.822578-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|LV2PR12MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2e57ae-fa5b-4d19-95d0-08ddbadd6429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ouoe+mrXad6l/g5sqBHgY0OeIjCmqIuxvG+EkFq8RotQSQXhjM19YK73e2U1?=
 =?us-ascii?Q?dxEyN4HRsOcxvRtD26UXExHbYm8S7qTXjOT2krP6DftM/CDfFUtjjh11WzVK?=
 =?us-ascii?Q?5bUQvexw3TDEQ/fEfvB3hBEYNoLip57ap9i4EQGjPM7HxZKO8FNXCuc6gsxk?=
 =?us-ascii?Q?GDMA+9xN9yh10DuJO4mPzZo9E8sfahQtIiYd0PmiaG5ABoejoqtQUae2M1kt?=
 =?us-ascii?Q?EVSzwoiW5CIubQJg1BzPXzg61lcm6uplKANHao9+lmWzdk9MktEM6I+upWCZ?=
 =?us-ascii?Q?6zX3uPKLIJw7NyHpHhi9d0MiqBZ60vUjlwmTBdDskjmR33PAocOu/lidOp6P?=
 =?us-ascii?Q?lftLLg7BWLLw/0LRH6r+UdqvNasIGrdQBoJ2jFp8ch6B/b80aBwWCgp1ATam?=
 =?us-ascii?Q?TSZApt6rXuTCcsY7m2u/9UTfz+I7AOUWfcxRekygDy5QEu5UB8yuDYZXCgcH?=
 =?us-ascii?Q?2IGm5R4+GyyckghEqH8EEWzn5cC+gi5XcHtfz+jz8wq0pPABF2DeuULEJAbA?=
 =?us-ascii?Q?gg6Ak37UFyamZgkBy3ULBNA9KY46AJsrmHhyObw8DySAtPMRp8Oz/BR17F3c?=
 =?us-ascii?Q?brrI8QRbaZDkFFSM6DUVXsc0Jw+KB2787frlNzUlYq0M2Ux5tK8SuUy42hYQ?=
 =?us-ascii?Q?qBvlO0moEX+idLUFye3/qxJhsYFojtqWQavEWhQXV4EqHNFXF4Oi28s8djLQ?=
 =?us-ascii?Q?LaXssDzVwFeyBHmzNofU64K9Ev1HGvFPMOyoKwAeOeAIr+cYa6BoRIWa9VvB?=
 =?us-ascii?Q?rqPuvFRrEi1MtnsvRcArFJvOVq90zuwplaUVfkyEjbjxYD/BImGt8pnjdBhW?=
 =?us-ascii?Q?gAhe7w+vEdx8zilSXNsfu6x3QPr1VHtNLDukAgoVYLhfLLinHnAkz5ybRNG7?=
 =?us-ascii?Q?URn+PDrNDlyh2S5djGbNwllkLdcJwcxevuMhm/CXMBwcj+PSrvQaSyVbfUhz?=
 =?us-ascii?Q?pw+5hp52gPJlm1okmo0dYNsv11mSCfWUbKVL99Q6xnhmwnf+4BV2cXqvj/R0?=
 =?us-ascii?Q?iHaCbUEJ+Vy6uvuAuNTn1glFbp4KcmWox2NMi0D/scjt1nKZLeWPUIA7hFV1?=
 =?us-ascii?Q?zxES7rwsuIEdwU5FTLdiV30g+Zt/sDWAAkAUHBi0vushNmmSUt7lwmBzYqyz?=
 =?us-ascii?Q?TWuxfGZDW1d+fPEPla6ZdM3zzX0BYHsV0SjokSHUwMiT7fGXKsBgotyw7g4g?=
 =?us-ascii?Q?ua5cILu4hbWSxexb9gKsDR2IVj/P5PU3/nz3qtCAYE9Z0qLARdDAwW/lLTV9?=
 =?us-ascii?Q?AN8YKLOjLNFgOWAEUQAUYT4H2I0ufDgCNeRf3XCc8r6xGHyjgkNmURekGphp?=
 =?us-ascii?Q?xYA5HC0WZMzDG4id9RkKiE0rMgosQjLcpZ/c33s2IBi24R9ZPrcEbV1wTBi+?=
 =?us-ascii?Q?mCJPdtJHhLIlz70Bps0g6hkw7Bwd8HnCH196lJBvCTa7gx54+9kuibkpo/5r?=
 =?us-ascii?Q?zDD3oRoPVfpqhYkcF6x5xRDj5BovWZ4tOeVD+/QEcZVH4hahi7iqZ5PmXhrI?=
 =?us-ascii?Q?c06KXWodcRwRwSXWS3YgWa5HqLvCedhXVq+t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:18.7038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2e57ae-fa5b-4d19-95d0-08ddbadd6429
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5992

The following functions is to deal with XEN_SYSCTL_readconsole sub-op, and
shall be wrapped:
- xsm_readconsole()
- read_console_ring()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/drivers/char/console.c | 2 ++
 xen/include/xsm/xsm.h      | 4 ++++
 xen/xsm/dummy.c            | 2 +-
 xen/xsm/flask/hooks.c      | 4 ++--
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ba5a809a99..c5afac9f72 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -368,6 +368,7 @@ static void conring_puts(const char *str, size_t len)
         conringc = conringp - conring_size;
 }
 
+#ifdef CONFIG_SYSCTL
 long read_console_ring(struct xen_sysctl_readconsole *op)
 {
     XEN_GUEST_HANDLE_PARAM(char) str;
@@ -410,6 +411,7 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 
 /*
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 22e2429f52..042a99449f 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -270,7 +270,11 @@ static inline int xsm_sysctl(xsm_default_t def, int cmd)
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.readconsole, clear);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_evtchn_unbound(
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93a0665ecc..cd0e844fcf 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -24,8 +24,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
-#endif
     .readconsole                   = xsm_readconsole,
+#endif
 
     .evtchn_unbound                = xsm_evtchn_unbound,
     .evtchn_interdomain            = xsm_evtchn_interdomain,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3a43e5a1d6..df7e10775b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -934,7 +934,6 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
-#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -945,6 +944,7 @@ static int cf_check flask_readconsole(uint32_t clear)
 
     return domain_has_xen(current->domain, perms);
 }
+#endif /* CONFIG_SYSCTL */
 
 static inline uint32_t resource_to_perm(uint8_t access)
 {
@@ -1888,8 +1888,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .domctl = flask_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
-#endif
     .readconsole = flask_readconsole,
+#endif
 
     .evtchn_unbound = flask_evtchn_unbound,
     .evtchn_interdomain = flask_evtchn_interdomain,
-- 
2.34.1


