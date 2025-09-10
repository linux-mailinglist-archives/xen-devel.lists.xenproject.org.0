Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E975B50FE8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117756.1463873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXF-0000YX-DR; Wed, 10 Sep 2025 07:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117756.1463873; Wed, 10 Sep 2025 07:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFXF-0000U5-3X; Wed, 10 Sep 2025 07:46:33 +0000
Received: by outflank-mailman (input) for mailman id 1117756;
 Wed, 10 Sep 2025 07:46:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQu-0005yo-3n
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:00 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2417::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57c69ddc-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:55 +0200 (CEST)
Received: from SA1P222CA0047.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::20)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:52 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::86) by SA1P222CA0047.outlook.office365.com
 (2603:10b6:806:2d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 07:39:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:51 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:48 -0700
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
X-Inumbo-ID: 57c69ddc-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oi1oEnzCXoywaEC4Krshfh+wk40FigGtYgLQpurH0kNhmVYbRvEN0klh0TddLzk/KFL3plUkfX4CoUZW1sX8YzOzudSyi9rAsHewpBUO5SP2OyDY3MJHYHByXJeuBx3GGZQzr0jRzMu0TUNaiFr+iqegVYY+Dw2k3Nymqm82ZeOOFB/vXRcsfiSfBWWuTCL0OsR3+J8FgIs2cZzqiJUUoK0kqFh2/exQ4OhiDle7wc2eKR1M1m24nJKy/KrvYBZOXw7BeHTbe7ubpfURBLH1d8uVmov1kJFBrbHYwirtXJegLnmwzdlQP/EUo6J/Mk7i7lGPuyDmNTQvC8Dzg2/bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGyZbWaZfEIBYiIhPUBicJ7ty970xz/buEsqX2eLXCg=;
 b=Tcmzjg3cOilBkuaLwYaE+lMGIbeijHA9lDgMbvdVRe5F/rmHa+884XoEyRQ21WQs/14zBEKVJVFPHCmxNknENuLLw2X51ehXr2iTNIOdwuzKo0+kYh3o8GmwDhj3IfR20VrP1naehgLetM773+xsEWS91LCpnCPZ0AuXJdCgqxzajm7CGbGKSBcAKlFS3VT9tb4wprR9VMZzBRFHatL0pQWk/cigBlwtc0FnSf6CBgwUwfrDVZZb8jYW2u6mYWPXBeec7iaXRUi+cp5lkidHw4vt9rLKrQCnu4NnB1vqrKvJOU9GSFgqwhhi56doLnpoH5B0MpKg2RJGggyke8rFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGyZbWaZfEIBYiIhPUBicJ7ty970xz/buEsqX2eLXCg=;
 b=0sq8xIeTBqqObh2NU121hzp/yNyZ9TWkdp4VQH/Tp7CmbvLotV5w6gJaT3grNf+PTq+r8OaRoQXJXg8U6NsCYOIWKYGZOmNbspAEQc7B1WQAtO+bLagq8WT+PYmseyktb21pKPHtfFXgJh7w0jxwIVAuRaAlztF3vVtfy9L9+9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 19/26] xen/domctl: wrap set_global_virq_handler() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:20 +0800
Message-ID: <20250910073827.3622177-20-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2d45ae-03c3-4073-dfd1-08ddf03d3a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qT2NZjLdFfcQ9P54WrIz1xqSJc90Sbh29bQ+4yvC9P7k1KsIIEkJ215hCBgr?=
 =?us-ascii?Q?UFRC3mnRf3t93y51aJR6vHoBPy004qNGUywwGfQ6HQ2sJ/5j+o4nfgDKVovS?=
 =?us-ascii?Q?q55Yy9vkygNIxRaUr4Nfdfrg+6zQMA5dg8zQJzvIs5jEJLr5wJf9FehZQIPi?=
 =?us-ascii?Q?DN7MC3clyCTuse5tBFdq22zF0X3U1L1xeTqkMlMVbvEdVqhvh7h2FDYBd45N?=
 =?us-ascii?Q?FDgPyTpfbz7/wIHzYLXcDgo9Yqqy9Hu31MUsPSGA0i2NcIi2d48pPZF2C23w?=
 =?us-ascii?Q?vX/paTARys4HGoNVndTfdKPHeUINqQsBUNKI6nsp+Ykl9530hubkriYScks5?=
 =?us-ascii?Q?xmseX0wHnOANgx2AJYYEedN4OQU6704+/xuhOTrlOYnSRnfAKtSv7HjL8rk3?=
 =?us-ascii?Q?xa97YKOlamz09sX4XeeyKT7GodIs2XKqxPE129Z25mtKqgw8l9Uyp9kzzXAu?=
 =?us-ascii?Q?NTPHoeGN1pkMht/c4UH6jOYcLCOYwLP8PaDbbqbEr3SgPDG7aNK9RBa2OUDS?=
 =?us-ascii?Q?4uCc6Lsq0zx+/B66/0wLW1vmEwFogMFXw/o2aV9h9t2bzE06OJHVtVPBGCaa?=
 =?us-ascii?Q?zQVjv3lC2tRKKU2WKqT87nFDaXKcIju2UQMNH2W4eQAP7ccvTlbhENhy7jbU?=
 =?us-ascii?Q?z2t1hCoG24mLtR5GExQEM1EsIlzHtguPaLC21Gzn6nMIFV5NnBWhfmx+S0Pp?=
 =?us-ascii?Q?8Bxt4Kv6FG4LTEmZPE+qnpQP2MJo7Av7UrzfcwRjnbdRZ4bYIWs6ZwhtE2i6?=
 =?us-ascii?Q?C5pMXw7Z+Iw/ffToHEOzo9NihgzO6PqXTRfMZBwi0xlbelORn09dMpWcGfZG?=
 =?us-ascii?Q?dz7/ZZ/hI5rzU0QYjcAdlM6DLWH2GECaF1KhRdx6LIif0oH98LDKk04tJWOm?=
 =?us-ascii?Q?3S0pOWJMnoT5+T3ttVMC2FhE7PLzFoIcmz7y/E2xgbGCHIuKn5hVUJdJ516h?=
 =?us-ascii?Q?cJ/Tytzud7EJwyWj4mUk1R8otP18WklVBxlHSpk7X63+EeZcUTq41YDlE4cm?=
 =?us-ascii?Q?/G7tbi05GcxQB+xpwiKAKOckN1RFmJ1881z5gOmFkIkb3TKr80W5M48EGicE?=
 =?us-ascii?Q?D5sMSjUBzDuzBGw+OhqI2uacaKTxJFD0b01jn/2C0AqiAP23SYWKNwnPjAef?=
 =?us-ascii?Q?nY4MDogSajAO/3NAU4cOVeX7JoHazH1e+iRuCB16UnI2fADvvG984R58XRnI?=
 =?us-ascii?Q?uQ3clXsVDlh+6FWoPP88zewGJB6cPLyjGHfDoG/CnXt543+lodpi0effQg3T?=
 =?us-ascii?Q?uplO/HCLYeT20TE2gvly6MJ34OYBTSSUJrDM9I3bcKgRAWQy6cX74JEEDaV+?=
 =?us-ascii?Q?7VCUEMx169Ziur4wGfmUtDCxv+2MSlFgFjw8TODd5i92WvREcilpCiP4AvJ8?=
 =?us-ascii?Q?5a3O0mS9/78/EWckiQFPpUBwvmdLKZYIYFnnmDDw0MKOxthLrVCmUEnLT8xT?=
 =?us-ascii?Q?uhbNwjUtjxqB9BjmBBtvIqLjkshRIXqFuUjnQD4ILDYnaYO1Th1IfHDK3Mp5?=
 =?us-ascii?Q?bYh75cDVpndq49Ytwvup8lAd1E1KrKeVyO7X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:51.8857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2d45ae-03c3-4073-dfd1-08ddf03d3a60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549

Function set_global_virq_handler() is reponsible for
XEN_DOMCTL_set_virq_handler domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS.
Wrap XEN_DOMCTL_set_virq_handler-case transiently with CONFIG_MGMT_HYPERCALLS,
and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_set_virq_handler-case transiently
---
 xen/common/domctl.c        | 2 ++
 xen/common/event_channel.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 776bf7b8e2..736ad52265 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -808,9 +808,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 #endif
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_set_virq_handler:
         ret = set_global_virq_handler(d, op->u.set_virq_handler.virq);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_setvnumainfo:
     {
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 67700b050a..bb53dc1fb0 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1006,6 +1006,7 @@ void send_global_virq(uint32_t virq)
     send_guest_domain_virq(get_global_virq_handler(virq), virq);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int set_global_virq_handler(struct domain *d, uint32_t virq)
 {
     struct domain *old, *hdl;
@@ -1068,6 +1069,7 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void clear_global_virq_handlers(struct domain *d)
 {
-- 
2.34.1


