Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01526B50FAB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117594.1463728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQc-000056-Fq; Wed, 10 Sep 2025 07:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117594.1463728; Wed, 10 Sep 2025 07:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQc-0008S5-7l; Wed, 10 Sep 2025 07:39:42 +0000
Received: by outflank-mailman (input) for mailman id 1117594;
 Wed, 10 Sep 2025 07:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQa-0005yt-Ly
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e968969-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:40 +0200 (CEST)
Received: from BYAPR11CA0062.namprd11.prod.outlook.com (2603:10b6:a03:80::39)
 by DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 10 Sep
 2025 07:39:36 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::44) by BYAPR11CA0062.outlook.office365.com
 (2603:10b6:a03:80::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:21 -0700
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
X-Inumbo-ID: 4e968969-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVUiKKCZz1pwJPp5699W7G7o3EDjcEn0Qww5nhoxmN1sBbsc1tu+L/bDRVqNNfH6FxQOz6vEsVDvOXz4uFovdSdE6waf8fFd0tA/mkyFu8DG0HSOBNz764l4TZCUYsNQBhVI4t37wk1OxBcJJqoYl5Nq/2sr/aWn8h9CWeHdOTewNeVlf6p2WKIgoCn+2/LIhABtmYpTxLAtPx58rquLRBjBXUJg20A+TBSBRpifIKZ7sV0Mek66gxt4QGjBBI2MmCcIqzU/43fk4TUNrE1sQD6wi/FrgUToStrlndx4bu0ZiZ2YQmuZU9YRriH67wihtA9qX53HqaBseJGtvdSncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6hAYbhVRKjqwBmccO7F1sUrcRPgT0pjyjykY0wxnhw=;
 b=szzAevj0MhHlDtgbptDbO0iTa2YqOeiwtcUAfAoAzKUjyIOXIH6y5D1Sl8x3Ifw8HrnvCZj1qUz+xWIJ8ZTe8yKXdZ93NU4UFlaBZgTh9A3Qc6qbJFS2R3yxfwXmjU52gSfZHR9bX13hOexXQlDPZo88GvIo7b/6Iy3ATTgGlt2JEu1DKlWtN86DrzLA5OUs1YQ95ek1UGmR7MWFDn/q+fV56UhQeEaaTb8ADqfXV2D/vzUG34ABU8mZZjqj2ITw1mmXqwV4oC3ltlr3PaZzZX9dYIivxHz+Jh9KsO8va/RxkaoyQ4QYVfCWBjngWUfq3a3M3slUWpbNg6heBVo95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6hAYbhVRKjqwBmccO7F1sUrcRPgT0pjyjykY0wxnhw=;
 b=mBSKxN87Tp76439btxPWVtaIW/nT5E5s1RaHnR/Q6ZLm5OQLJyMiEL1lkCEcUM4gnU1WpWNBP4hTvfN+fh/7BzoRHOKUlUDuyoNEFyTF28XpJvA1ts0b6pIvWKeFbcCkYi403KpTVaIWqtREGvPpzwkrbg5js7zXAPR/xKYab/M=
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
Subject: [PATCH v2 09/26] xen/domctl: wrap domain_resume() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:10 +0800
Message-ID: <20250910073827.3622177-10-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f8b0d4-1f3d-4f5c-ba3b-08ddf03d30dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b2GM+DZx/Bf+CG8Tj43G06F7ac/a8WC6z8W6yER3g17mkfgRZie5ioROLC4s?=
 =?us-ascii?Q?SIfsvQEOty25H/+/GL1fSy3Gsneb9X3TDlpOqAqmvRTOEShygmY6w3d16qfG?=
 =?us-ascii?Q?8L7EuGv1WZR3FQ2YYGdiGMo6gslJr9uMkDLrqjRO9SS6Q33ubixvfS/Z1R/r?=
 =?us-ascii?Q?Q/9KJvolQOPj60v6zzfDkxCU31EGnBXR35ONH1y4AhInm5eL7uXT8CvEAJ14?=
 =?us-ascii?Q?CQNcsdrp2DLVJs7CA97KgQccU50qkrw7bt2/Zs5HPBNIf3Hnnjx8Hcntf7QC?=
 =?us-ascii?Q?BIMZlMg8ofFnOZeUOHjsSzDeq9jUpbd/aryA+WD2DiCLQh8LKL968b8lKkUS?=
 =?us-ascii?Q?UuoRSy+Bd8jV4YALZX7a/nR71zBObXDqPRPsNKvPfohuxGW8pMWo3oNB9sWy?=
 =?us-ascii?Q?Wt20j9DlIRhe7M2YCpnAU8a9faRSK03CAsn37cAA9IQjLkwkPJKab4r3Zhl9?=
 =?us-ascii?Q?Xm8mdbmdXZhAtLN5z3nE8uHs1oXKI1e74m4Z7/ryRN88lnS2kcT+YckLRTay?=
 =?us-ascii?Q?ajaOcI4XyMzqjlz0HMbsigFq/zwzzmtaiiP3qr+z0qtzs6t9RiuCaT4Iwbys?=
 =?us-ascii?Q?j/bGSIQ5zuuShJ00J4805EOrMhxgtiBlDG91e4IRhfJLjentucvt1lz2Lyxt?=
 =?us-ascii?Q?JviIvcZholuu/FDG771emVyi/tqBZU4HrMwlXOHUhqgwW+cyu5uN9C/D0tMS?=
 =?us-ascii?Q?Fh4E0yiJ9p+EzJQqsXq67I59wAQSaUSYdj/TTOPwg/z6CAuZqpJgrNR2/H2h?=
 =?us-ascii?Q?So/jmf0sP1ZPAR15vaKPvlbijjSp7uiE6+3LT0bTLYkGh9nMs1jvQ0rOHup3?=
 =?us-ascii?Q?ifPwID+f3eqQ92zVEuE4B92egf3kqYyuKWkrr/FvPydfz8QWL4vChvmJalml?=
 =?us-ascii?Q?aWHm8GoQRP/EiyCjLvfXT/42R7DGJIGNFRd+vukjt/N8xQz/8Kt3RFl8MYeF?=
 =?us-ascii?Q?GNxz2L4R6rFBMH3aR0/deqQ+YQnb4Lj+gDFyrzD2u5VZ3ITExnyrGAbH4Qn8?=
 =?us-ascii?Q?UnuW8VfDP+Gsz9Md00r6hY0akdd+6nEpfUjjT5yetDO2eXW6m1w4wkle0fY3?=
 =?us-ascii?Q?5HGzj8+g+tAH4NP+lHLm3zkpY3Yr4FePXcov7wHpe2a7HbORMy9TjwEtmOKz?=
 =?us-ascii?Q?hgzQg5PITXBuP+USZx8Ml6EINR7a0ZmNw/Itisl9xaWb4BBwkqhoYkWwkA3a?=
 =?us-ascii?Q?0T9/FVh8JXFyAb5W0TpFVIT1dO6xw1dhwEHNgx/JBfu5/clcIvooxCcB7am3?=
 =?us-ascii?Q?jx7pcWniLxxNfXx/10OfVjSEcXNQwc/L2K1tsJepvQuFLNOej8ky2/l+1cjS?=
 =?us-ascii?Q?OSpzwUvQPqitZKTThl+liAZZyEoqeaRNrTXVrivgEAMa6YNMkHN4cET9s9X6?=
 =?us-ascii?Q?oyT71onVLJOBsA7K4yPm44OgtoB03/R09F8nO2+flDA7k1NgTKPJeE/hAcrA?=
 =?us-ascii?Q?XGaIO13/YhEsnZu2yfijXVbfGHDifFi8TlNpNUhkG+TueDVN1hLi6Kgu1Xmp?=
 =?us-ascii?Q?TjVkbr2llN942L61y91w6Dcu3x2iqXGBFjZd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:35.9241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f8b0d4-1f3d-4f5c-ba3b-08ddf03d30dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

One usage of function domain_resume() is in domain resume domctl-op, and
the other is in domain_soft_reset(), which is already guarded with
CONFIG_MGMT_HYPERCALLS.
So we could wrap domain_soft_reset() with CONFIG_MGMT_HYPERCALLS.

Wrap XEN_DOMCTL_resumedomain-case transiently with CONFIG_MGMT_HYPERCALLS, and
it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
 xen/common/domain.c | 2 ++
 xen/common/domctl.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 678e81b400..34e2e501dc 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1351,6 +1351,7 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void domain_resume(struct domain *d)
 {
     struct vcpu *v;
@@ -1377,6 +1378,7 @@ void domain_resume(struct domain *d)
 
     domain_unpause(d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int vcpu_start_shutdown_deferral(struct vcpu *v)
 {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 1c0bfd456e..278a00b141 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -402,12 +402,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = domain_unpause_by_systemcontroller(d);
         break;
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_resumedomain:
         if ( d == current->domain ) /* no domain_pause() */
             ret = -EINVAL;
         else
             domain_resume(d);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_createdomain:
     {
-- 
2.34.1


