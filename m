Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7AADA86B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016515.1393442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xu-0000t4-BK; Mon, 16 Jun 2025 06:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016515.1393442; Mon, 16 Jun 2025 06:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xu-0000nm-1o; Mon, 16 Jun 2025 06:42:18 +0000
Received: by outflank-mailman (input) for mailman id 1016515;
 Mon, 16 Jun 2025 06:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xs-0008OL-TW
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2009::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09969e04-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:15 +0200 (CEST)
Received: from CY5P221CA0093.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::24) by
 MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Mon, 16 Jun 2025 06:42:09 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::d3) by CY5P221CA0093.outlook.office365.com
 (2603:10b6:930:9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 06:42:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:02 -0500
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
X-Inumbo-ID: 09969e04-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfYqHoOngTmz0CNvFzfEiVCQkXDcn2AoCEAzePU8LeK69UOMtXGleDB/RhyuuegoX7D3kyXKJLR9edWFKeecg1n8twcAquCQyuyoQZ98WwE5bkd6U95yKn94I6mzyp3NOjkhpeHHAzalwGPbtAURSztTMCelrK8u2nhhjQNbmhMqfGIXQ3tesoI9bJV9tenQpXUskg1KgirhQg2XbsbNpa5PwEkEs6er9S5n6OVH0xVJDQYt+Czr5ElfNQWug19z5vEjqR3eaBYQnypazd8mgyqHqhlO6p37eAvAe8uEMqrRpevdpDgAqU0+MOnDfVzl2wkFUbWN1TOjYSRBVwsc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeIUmUq38Uzyb1WbuRkli9IxN8DEmf2a6PHRz26bpsY=;
 b=mA/h+WnWdkBfbOoKZcF/afE9XoraxvPgUvVB0WG+esE8zh3QX0ISspV0NoD5+l1qf7pvgQbtQt2dTvM3NnQUVwR7ZYdjkit6Bn5tXAu1/5zLrWz61YMSxOvZ8NuakmEJEDYLlPjjww7G4DxayKH8UHMV8gUSQmqmO3YoPZdDuaCkeWur0sFGb1SsnAV11r/sMzunnBsKj87eMT5NrvAlXapMR4cv8pfG74Q6OIA5yYlHY6rAnTBH+RkwcAjwYSqbbFqVATaypKVmylnfKmtQYhz0r4BRy4N2QfjpKYmoREpRpcdcKcEb9VoMyBSPUz55daHK3O7/1bxxWFuf6ubwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeIUmUq38Uzyb1WbuRkli9IxN8DEmf2a6PHRz26bpsY=;
 b=ZxkEb3PJGkcZdsQlk5o3u2bpTnFwTbUxJ8/bUwYDbyY3oKuK/eZ3YBN+mqPYVRaMeAFhjxCbV3A8MOcsbPyQ25SgEvJVWKx83+rA6clfD4R91syAihaerY/qzYNJxckfIWdaqoi6IzcpvTkj4Zrs1UR92qLZg5BXmkEyDv2hXJg=
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
Subject: [PATCH v5 04/18] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Mon, 16 Jun 2025 14:41:14 +0800
Message-ID: <20250616064128.581164-5-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 3757cb68-d9f1-4953-73eb-08ddaca0eae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RspbxeGpYR+qKUF1F18DZmoMDYi9OIsabq5gD46sZ8TW8ZrnlmbiVKgh8Wtu?=
 =?us-ascii?Q?HOi5qKA6kMZoc9vReZh03ZFH2SLZ7JryVyi3Dkw8TcuYxS5RZdGHPVZ4FqRA?=
 =?us-ascii?Q?Mdc23ty6NWVaKGD3AcbworD16mRVaf8MlAQvKEYY3NEb44d5d3HW+oBu8Ie6?=
 =?us-ascii?Q?eyHSqxRFokeS3ay+Zn70/oHUThiYX3TJ2BKbzYHIFICJD7kpURElVZIVwoU0?=
 =?us-ascii?Q?gNkPyPdSlhLa3jJQrZQ2/D05lM8cEaFrtIQ9EPCjPoS8fwfhayUlGO8V7yJN?=
 =?us-ascii?Q?zOrC3rje8MWwkSluVJO5gX3R2WK0+oyd9oEMOQaVhTqSkV7x1COZbdq/FlpA?=
 =?us-ascii?Q?bvVXPDM3/8pYEz/uK49ocEn1j9pnMIo94k3uV+hN8OxTiczsldUvw4OJC914?=
 =?us-ascii?Q?3EASq0IOCu/zxUp/0efiFJEwoJQOf/lQ36r8eOo3zGXbrezJ5raJAu5+lIcG?=
 =?us-ascii?Q?A1ucIs7Ff0NiS1JyWup8YftiQZP3aDQ7XheQLvs0ftx9OPqCtTAm4/2B9S+O?=
 =?us-ascii?Q?NCe9VKnJ6GkiC8SkfQIASlCNHG1fRjIK3vNs1j11EzSpm1a9xhQOUpzcdtIv?=
 =?us-ascii?Q?30bMOMHanQT8o60MpKLbfQi9vDUHlxzW8seYSrkNEEmQWPCryR60Wpmx66CI?=
 =?us-ascii?Q?lFVQXt39VyamKPzj70WX+GB8Pli1E/uLslOSDWDyY3XuJHWHqlzb7E1oasbJ?=
 =?us-ascii?Q?cLW+g3Z1MYTNl8fLKvH+OslJBBo/pxd7EcYBnnwnUKDT9ark4ZjGl+O/FVw2?=
 =?us-ascii?Q?ZbjkF9GtjdPoCLTDDe7ma7RC/Ziqp3CzA5ncTN3WKMuSmj0lkeY1Nz2ZsXrn?=
 =?us-ascii?Q?qn3OFOFTumBxgUA6U9EI40V2/Q4ge0LcNy3i4sM7R1BMxLcUOI/hJ0PS87i9?=
 =?us-ascii?Q?EB3vWgTU2WPfg2sS/SXkU7Q1PgT60h78xAZibirZz0w3lK11MQP3MOURvNvr?=
 =?us-ascii?Q?E3LvaNO4f8U8pshDHmXBZIRvoWvvQ3R/dL1x8ml4qlLN/xF/4GWDR1Sj6zKd?=
 =?us-ascii?Q?/duTEKb7DaAdCBV7/lHKEBTIfBB74sWbgw5GP2drG5+vJ1xrgC4GzUqpkUfv?=
 =?us-ascii?Q?rPShNnNl8nLcmy8Te6DKP1Wx/kz5GrOhHy2PDpxndv3NjR739Agk5cTKC60Y?=
 =?us-ascii?Q?4lU1f3LUn7GjVn/jjnWCoVtaANHopoqYnev7OVnL1Z3QAomyvT3Zjl8QKMMf?=
 =?us-ascii?Q?InGGe4yEuIzPWN4+H4MslrW6IWp+pkjzV9LpxRO2qQ1H+RhMWP5cL34yRE7E?=
 =?us-ascii?Q?tSecV+v6CB3YsE6KxuJG2wu3QKPzu+aCfCVYZrkaTGF2wDZKYeP3SyxUC2J2?=
 =?us-ascii?Q?oTCd8iLO8pUeCH6xT/g4hiBQUVs/7Y8aXcT7I5ujXBA4BLi83aHAcFMDgJ5M?=
 =?us-ascii?Q?39xmimKpV5VagTBdfvNt5NRjgf8QVV49niwTVycCcMpL2Ev6mu6rLKJ/ghVL?=
 =?us-ascii?Q?fui6JnbJbw+ySHLX/F5z7edGbBv08Ba5ihdWf7rxS1uvc/dyF0UrzW0E5zeN?=
 =?us-ascii?Q?dEghN30kFekzeFwufA1wJ4A2VS7dCxGVU9hn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:09.0890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3757cb68-d9f1-4953-73eb-08ddaca0eae2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460

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
index 9a9836ba91..b9de9631ae 100644
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


