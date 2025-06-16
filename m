Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D8ADA86A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016520.1393475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xy-0001ov-GT; Mon, 16 Jun 2025 06:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016520.1393475; Mon, 16 Jun 2025 06:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xy-0001kb-AB; Mon, 16 Jun 2025 06:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1016520;
 Mon, 16 Jun 2025 06:42:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xw-0008AT-LS
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c94ab09-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:20 +0200 (CEST)
Received: from CY5P221CA0079.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::16) by
 CH3PR12MB8912.namprd12.prod.outlook.com (2603:10b6:610:169::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:42:16 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::9e) by CY5P221CA0079.outlook.office365.com
 (2603:10b6:930:9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 06:42:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:16 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:13 -0500
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
X-Inumbo-ID: 0c94ab09-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVmLdi47vlZNlcUWRqS7mlnyQMAJCVFUpASLGD8RaIVWHrzCxzYYnJmn07j88lQGHU7xuKWj5BzHOQdrpMLddkZ5BUrvqOomE8lSamp4ywCyzqurVgd34lOv9XCuN6lvSygIf/3B9X33gP26nWfgT40vv6iWh6Nz+4mlcRJgYViT67rpBQM6sSPtcVPEbOcqdfJ+tCPz+kW8G3AR4TRu0HWWqNAucxDIduIFmoI+ucMEFR+RmpaGL2ApYd2I9V+DXIyVf2QZqHchCckmp9JZxSJ8FczYlKZaCK2ue/QTCFM0h8OftmqZj4I2a1t9CJvTtaF2CyxR+rFwAAUUtK8gxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPsu3Whzar30hPPztM4eYMHCA+8Epbp9x/t6GVQxLw0=;
 b=SuNrWdKcc3XV4Y9qGslJOAQWyTvbW80BOpKG+N79L9nP3zF/uTdMTwXyg7VxR5XOTeNnGxc9j6yS7zzRWKPdSU99t+lrx3rYv2PI46LG9IWFPz9sNwJJavMcnSkr2rINyKsJTqPY2Sq3GfYzOSnv2OoKPLoj7AwiH6tTBjMZLYuDuKzo3lY3gSVHMwUeTxtXMPYuZ+ipo0dhcrb78VN+T5Nwj7KJAVdPkBC2mNlHQgWneAal+Dzdy74PtLwa3haYMnJKZ3oWUvlXcGl0LDqcq6uaLfpglrMlwCj6ZTIbELWCNWcxvIqX+1yE2X4R5bhjCZcZ6OlzaVp29BOvirj3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPsu3Whzar30hPPztM4eYMHCA+8Epbp9x/t6GVQxLw0=;
 b=wOLJylAQuqi7OoMouxOcdy15IyJtli0NSftv8e30qmeKWqYI5Ft2M+DIwbBXX8QWdcxDSPwDBQuISpI1aXB8ZFc0QqA6+wnjcQg9M7oYq+Q12wNQ/5uP084qruD+m4h8JoHYRNteZQy/1VjIbTfTjJ6kwL14bSRczBhNpiPfoTE=
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
Subject: [PATCH v5 08/18] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
Date: Mon, 16 Jun 2025 14:41:18 +0800
Message-ID: <20250616064128.581164-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|CH3PR12MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: 082a468c-fd40-4427-ef12-08ddaca0ef16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yIcXdGt3LmXI/IAj6VezHT7klzfM7kh3dc2XMb4TYML0X+scdgYjJZg7zPhL?=
 =?us-ascii?Q?/yIJFuYsr9eTQzjuCbNwIb2Gc0uyzSfiFtVIwO3b2YBJ4FSnwu3Wm8XLDGqV?=
 =?us-ascii?Q?ckSp24kR2V5frD9hxF28Ur1HiHmrLYpRAx0+HUOsfRcGquqYlmcmvz8EtM1w?=
 =?us-ascii?Q?zJQuMNT3MCZBEtuMVBsFxaGU58SDznDFvu+t1Nm57kKmf+VFXZHNH6AHOYvm?=
 =?us-ascii?Q?HX1Bo2XACCMx1lxKltUkcbKTkvSZ5mpp5EmFQnqxeOPN1okjqwuBAJxOazNQ?=
 =?us-ascii?Q?sMOoG8rLA+EHc4U6LQqdiQYMPuiQB7UKq6qbyBap+5wy34iU+OPCWM3Z9vce?=
 =?us-ascii?Q?UlC03Mw7KLdOcrOUQ3HlJcGKg5jjdQ6e8sD8N30DNz34dY1PswzXzH4SqXmR?=
 =?us-ascii?Q?xgCf1R/haOTGnNBA1I0KzRs3dJ9F6jcxG5UDDcYfz6B2tOmDn3RgtUJMEW6V?=
 =?us-ascii?Q?WWbkkNFHnoQZzad9v1YULKoHu42ZjMqM3BIBcAEbo12BhT8P5PGnuEZdr9KE?=
 =?us-ascii?Q?PCd2VXdy11gpxkSFCSD/dSoiIsaloPKiZ2uwDxqm75wE4NxsLH5+ZqqWOeEB?=
 =?us-ascii?Q?W2DUdGTim2mcqtSYxP7p7NWg8d1llbxOtm1weH6TPU+NLRoPzr+buzUFOsCk?=
 =?us-ascii?Q?j0wxhLIEuu9vQTeUe9TNGgzEQ1gZXaLII0A3DvwUUBu+rre2lBjHigPkEGjb?=
 =?us-ascii?Q?E5T3aJNolNblOU5oyV9L+9mfCITqLuduv+3A7JFjjnnlxX9kkV/mTtb4HmYg?=
 =?us-ascii?Q?ytwI6T7QvXb4a5b+U6AMR1cjNy9d49i76OPwa4kLsrj4nr1G4Q3waOYsMJcx?=
 =?us-ascii?Q?O8odZvIkjyIEvEE1U7L46iUKKqlW9p6JdaJBBxGhLZ5EhyKIWSRcjFuTZyaz?=
 =?us-ascii?Q?mEIorFHxl08oqGv5ZtIc5R8BUXgKq6iNHICuuPnPIAtlGu4uPdH4aNXm2FFj?=
 =?us-ascii?Q?w0No81xar/ylCcgMtnLNPRnHJMeb0B+LYZ4W6baez2pAM0PbX9dldVj2BCdh?=
 =?us-ascii?Q?k6c3LCCycBvwSdL+jhANGTrPIfljwJ1cWKL7jGNtavfMjqprSGZLxZxNPIVL?=
 =?us-ascii?Q?jaaPqVfRBj7bl+fpwTQSfhqQs4QcznIANeQWbKDQidmbvhxg1olHg3nV8ike?=
 =?us-ascii?Q?KepWDMifErfuydjqvlfTTIqf6OvCuWrt4RyNFjxorYtP2XkDt/qu3p5wM6Bp?=
 =?us-ascii?Q?XyBVWE0pgkiVQsIzmpTT8ptJJnw5/3fdk57hEzNFX8EjW8BtB54wZrWO8tOS?=
 =?us-ascii?Q?go2M8ObU9cThasYz4ZEMBsKZRXp9T269AEhBii7TEQx19SvfXMUjxB9inGFk?=
 =?us-ascii?Q?jn9WsfwfwG5iBHYb3q7rcPOXUbl/A0ZVKNtzKWB/JeF9xHj9yTtBAtbyGj+P?=
 =?us-ascii?Q?zPqlW9fayR9BgwotHWyb292xL/jEwfu4OOfmrTOGFaY0LX4bdsocNWdjGMUf?=
 =?us-ascii?Q?jIVLREthy9A5XFIYALtfDqE4U+PJ7OsDspmDn2jUAutkA3AYnzN251IHcC3q?=
 =?us-ascii?Q?KbO7z2cWe/DYj46XmC+1aPUs5VC3+IpFW2QC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:16.1444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082a468c-fd40-4427-ef12-08ddaca0ef16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8912

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
- remove transient "#ifdef CONFIG_SYSCTL"
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


