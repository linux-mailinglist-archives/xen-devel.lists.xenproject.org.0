Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2C2B50FAA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117590.1463704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQY-0007nq-Nj; Wed, 10 Sep 2025 07:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117590.1463704; Wed, 10 Sep 2025 07:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQY-0007ga-Hr; Wed, 10 Sep 2025 07:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1117590;
 Wed, 10 Sep 2025 07:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQX-0005yt-6G
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:37 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:240a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c5dcd5e-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:36 +0200 (CEST)
Received: from BYAPR11CA0072.namprd11.prod.outlook.com (2603:10b6:a03:80::49)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:32 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::59) by BYAPR11CA0072.outlook.office365.com
 (2603:10b6:a03:80::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:31 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:15 -0700
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
X-Inumbo-ID: 4c5dcd5e-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg/rQlYttFe336ob4CObvp/2vWQ8I+M79Lb6bkBPjX6OFIhM0S33O2gJrM2o9nPyLCF1Frws8kh8AONbHUT7ziphAUa7fi86L9Vc4BsNKZfiE9kXIZI/c/c4JEcaVy7ONLBipSisuMqgIQ06SObdZv8FMoRGhMtPtcpaTbyLc4LxtVuEXnwb/UpaYnyY9qKvOrUV254CMiboGlc7L0OKphbfb31tc1m8bbj+tdGxkgcp8tfgaJjFIC0ELj5o/s8UIYOIIaL1uTBFPjmVvVjvqhJn4uNouL3ESNZ8Nv6VW3A8d0OTY43WdFAqG1jY+PassmpCzBNLNgCnowr7dW+gwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/kOr6NWGAHtu7qRDO4SbbFA71cfMDDDWYMWSaKP9zk=;
 b=GjOedmGI3kMp3RF/JqKDhCW25x7gzCldl9A6hpTCUA9W9fqrp7sPJqyZnyhInMOwO10WOKBOlT1ekBba+eJnJuvfRrQNCP6tbUjgRgD3XjslU/KOVhZ/gVK+sYtTyIN3xc20RpTj8C5vZ6P5bTz61jC39u+SqzCAMZf0HvjrkPvHW83SKMBDbs4w5fwjMc3dwz0F/R/x/aChdUwUcETMRlvop5yFsPn5MMlHz6r91xxPeE3toi+ubmt5GmMOrDYs4bM4FU8pPrPzWzN6DyTrDDsYnHKsstUwClyfDWXX1Yyx5csSuJ2nG6+ukYOsGcjJ1cF5UBMUNc31OZQWICy1pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/kOr6NWGAHtu7qRDO4SbbFA71cfMDDDWYMWSaKP9zk=;
 b=aIF739X5s2DHVz/S1ZXaPVJITPlcNBYlhJDZ+DJ529KjNyUb80x1W9JLN5D6fjN4NFXiOnkyie3skPvm26Pb+6TaENXa0b7zuZ7tQAnft3Z0f1NztZcd4pxWEOzS/eoNo0XVjsW5EQs1V9lHXkDlEp+BMuguh0iVkqlH7XoTIS0=
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
Subject: [PATCH v2 07/26] xen/domctl: wrap domain_pause_by_systemcontroller() with MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:08 +0800
Message-ID: <20250910073827.3622177-8-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f86d3f-0d78-4c7e-566b-08ddf03d2e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y04zgkfScc3igoFPAO8b28+KL1lwiiFcWZGcGg5qva1e4aFUHY/E32CyBm26?=
 =?us-ascii?Q?dE8Odugeg7+H6RhXss2WWtBcy/dBtI4NJX1qN4Od68RiLGKjLtXtXBzgwE9N?=
 =?us-ascii?Q?i6GQ3DhMttpqw+cFh/ZVTCCW4hrVcsFt/GTFFP3HKnd1Q+9rW9ZDeCYp0kJW?=
 =?us-ascii?Q?7ucIL2EtsCnNSPW9f7zzSV614lCJqJap4Jdbfb1sUM0CFUUlb6blaG9dCOgr?=
 =?us-ascii?Q?GLfTTjDQug5ARup4Cc3VKptQwkDu3znxODI+aNStkfgIMTIaJupJktKydc5I?=
 =?us-ascii?Q?4tlwoANDAbSdRJcXkV17mNtKqDk/29bhgoBhO34ERd60E0hhQePpBP02qCWi?=
 =?us-ascii?Q?ox2Re8S1wU05zNTDMyZYW7UuytmhazXSDxggVwQwFhsv9f2/QD5DSRdBVNoZ?=
 =?us-ascii?Q?wnJXJshwrI4ec6FMhjD3DzoEsjo+9vDOvmcQGGKh33rgzezz9xma1mbjkkwc?=
 =?us-ascii?Q?AzcDgMA2iuaKSnXh+ENKHYBraK7am0abuX2HxFYaCYtX06LY31JC7I9z3t0F?=
 =?us-ascii?Q?4SORwn07ZxFL4lbN4nnJ5ny4E1x2CAPEWM2CKRU/VZvoNXHIWuIMl+NKV8hJ?=
 =?us-ascii?Q?5CjJP3wX39tSKj3Y7PQtQyg7h3QY3FmanHh7VBtJgMMbTf5vlv2YZXJCfpWj?=
 =?us-ascii?Q?/mfNiPVORHjr5rY3u7N43UPFeCsujDz7oVUiA8AS/u0Yb/IvXk93ZJJSQ5wl?=
 =?us-ascii?Q?379+8R4kMS43wmzBEYKoXRLJVFP5lCF9hi1krT5HQcHnd+NRVy1s3JyNj/Mv?=
 =?us-ascii?Q?zUSZAvXpK5nkxkkI7brC7eELJPSb4MHKMxIpJWhoQ95CHeCasUNMwOcEQkKE?=
 =?us-ascii?Q?b0R2G1adsd2sRwFPQ5bwEUNDSN17S81i4kuxKYrOFzWhK5rBPFrR3rMOjMdE?=
 =?us-ascii?Q?KQggkqsucjz01iKsebQQo7gkiYIvFkyt+SXdg0JoiV+mpxWwVttBy/YswZQZ?=
 =?us-ascii?Q?zd4jnJUNeSKVQV0ZqXbqsJxKMA9h9a5n+VszvTFVVp0B2FrsTGn5jVCd5T0t?=
 =?us-ascii?Q?DjawL2oG8x6yf5YYqH3KbmkwAn6gomofz5Z2XhXBxljfDZFcEEa0qSG+DDv0?=
 =?us-ascii?Q?fu59fRCJAJYDRJ8OslRQoYSg1mSIWT7vxG4pBXanqsNEKHSV1kiOntGZyBuf?=
 =?us-ascii?Q?+BSmxX2E+2i+HX/07aMZzqvMO3xoBSityxERKfgjTEzbW92494o+SZ1MOLFr?=
 =?us-ascii?Q?tU74OdP80FpGSCdx7cJ9ltjkxU846TOX5p0ZuDG+dmWxnp9rzypNRTvTb1p9?=
 =?us-ascii?Q?nPZH6SKE7EXpLS97OIC+Q7V4BK72EGxYwtURzXDc7U7rlUIPMJhRK2D13gxN?=
 =?us-ascii?Q?b2k8Bfp2+3guvp/wLX8jJ4cDRjyOJSgxFKR5fAnn/0sbMyxR8LOtAhhFl8Kb?=
 =?us-ascii?Q?MMCO/zdpPuCRQm3GWn/3Bxfn5ZYWDftkCvf1waCM6pBeffpOqdEM7i5eOryW?=
 =?us-ascii?Q?RAOLdU3D+TF010iFSLI8nBxdX4mCyO4JEts09q4edv4gxyMtfeIisIEWkkat?=
 =?us-ascii?Q?hcuJqrVDNYn0CBinn7043ZKO2DiprM0WAabp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:31.5245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f86d3f-0d78-4c7e-566b-08ddf03d2e3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067

Function domain_pause_by_systemcontroller() is responsible for
XEN_DOMCTL_pausedomain domctl-op, and shall be wrapped around with
CONFIG_MGMT_HYPERCALLS.
Provide transient wrapping around XEN_DOMCTL_pausedomain-case, and it
will be removed on introducing CONFIG_MGMT_HYPERCALLS on the common/domctl.c
in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- provide transient wrapping around XEN_DOMCTL_pausedomain-case
---
 xen/common/domain.c | 2 ++
 xen/common/domctl.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 775c339285..976172c7d3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1606,10 +1606,12 @@ static int _domain_pause_by_systemcontroller(struct domain *d, bool sync)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_pause_by_systemcontroller(struct domain *d)
 {
     return _domain_pause_by_systemcontroller(d, true /* sync */);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int domain_pause_by_systemcontroller_nosync(struct domain *d)
 {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 71e712c1f3..0061d7972a 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -390,11 +390,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_pausedomain:
         ret = -EINVAL;
         if ( d != current->domain )
             ret = domain_pause_by_systemcontroller(d);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_unpausedomain:
         ret = domain_unpause_by_systemcontroller(d);
-- 
2.34.1


