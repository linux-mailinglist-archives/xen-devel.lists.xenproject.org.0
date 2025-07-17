Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A789AB08F5E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 16:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046935.1417325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPb7-0001Ed-HH; Thu, 17 Jul 2025 14:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046935.1417325; Thu, 17 Jul 2025 14:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPb7-0001BZ-EK; Thu, 17 Jul 2025 14:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1046935;
 Thu, 17 Jul 2025 14:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucPb5-0001BQ-GQ
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 14:28:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2418::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ebf0999-631a-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 16:28:29 +0200 (CEST)
Received: from BYAPR11CA0106.namprd11.prod.outlook.com (2603:10b6:a03:f4::47)
 by LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:28:23 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:f4:cafe::e3) by BYAPR11CA0106.outlook.office365.com
 (2603:10b6:a03:f4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 14:28:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 14:28:21 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 09:28:17 -0500
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
X-Inumbo-ID: 4ebf0999-631a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPUZS9HxwW4AhbJuG5/eGxg0zfwoF19D6Qjf7RydJcZlxrFYuNDH4A2+awYgjSjTynYM2Orw7KGosqBbgwewBxcqKp9lA1Ip1NV/4hXbgGy26VWPcauovEwj+BaaZoqMddMO5OpsWsZwiGptWlyY1Y/YI7qX1XYVNxIpeyBouKueLi9nt/xwV+/ZyA2QR4xUAHS8J1xh7cgBwvz9XkVqIQxGAvGsMQXxX8nVNzH6fYO97m6leecWzV5jm05Yun9oXM1h9Odduh5m7u3C0Cx0KQktbqJ6nY/XJonGDhiDxU3NR/sL2VNhh4Hj4Sxbo6UM4n9Ut4p0IHMa29QQanF58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUgcQSgyKVINx4y+SPwCGex3eBJUIr6NGgNnsgwphdk=;
 b=vuEUl7/k8rKEvYEcvcswo2ij6zVmftkV7P3uBgkak56Qr9ZedgQrzxNwQdCjXrI3KZJSxYatQteRiVo3BFJD10aXHBd4762k/H5B0y+dLrKuQ2mdwals41kR0LcNmjOZxvKAk79L1cJdY1WML9FgkDs+zWgi+ZRXr/xJRibWpG5igCvcTFLsJPtZXY7lNS5BW6+uiCUS6QQDov3GjGgI49k6C0ITgt71wn0bOld5Fwox9mFz9si+Gk1mkJptpwz3gi/fg+NwF7rPkMOXTOaiv1myL7l6fj93cnW5jhqQn0pH9hrIsGJk2HMetkqMp5VgvZQLWZA+HjASchAn+E8LHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUgcQSgyKVINx4y+SPwCGex3eBJUIr6NGgNnsgwphdk=;
 b=aLYSbMEbO6uzuSbOVLWrEjNApbm7rZJ+GPASAF3KCyr/ALPwKGb1MWbG7pBZmkB3Z+nWGb1/KygS+ZKuujDAzpUUVAsZkkYIKrY6Jq3hAh4vBZ9QkTJOpzDntngUlTMjibb3ZtFwL6UhXlCygiR5vC5gDMcMQkpFQMGcYHufxKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] dom0less: Move single-xenstore check from bindings to set_xs_domain()
Date: Thu, 17 Jul 2025 16:28:05 +0200
Message-ID: <20250717142806.257597-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|LV3PR12MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e80a34-c59f-4a3b-4612-08ddc53e2e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GBQHhPNxVSZMAasP8HMC7fCQuCswH5aGskBjuZcAa2eMyM6JYJk0oqx31O4R?=
 =?us-ascii?Q?rsLUVTVQBaQhuy8lQeNzGx8Y4JR/wpOvcO20LaFr4GCioosmuPgkL1sdRguE?=
 =?us-ascii?Q?/ASnJeCIABcfr7JVswIhajaDZspTV3NVUM2txm5E5uH6qBvDu5oqIZ/UoFpW?=
 =?us-ascii?Q?9joZ0Ks+OCRAloIPI7NnTkJzIG37JnoZewmc8mlK3z6qCkpwezNY5s5K8Uwa?=
 =?us-ascii?Q?uyW7lNU5HwvFgYI2CiISiQtwDdfha86xm5J9uUditGaQkq99YUu73r/KSUqJ?=
 =?us-ascii?Q?nef7FO4k/EqUaNisW2/6oNXyjFlEmizA8I1vZDS3bz6h4rtFc6ClR+1KGzhK?=
 =?us-ascii?Q?iQzXNcv0wZKGMnAuFmyPrsYApGyxkgbgHC2tLxnXtqGOiupngt8vecls94Gj?=
 =?us-ascii?Q?VAlayLB69srvlp9Bn50Y8hqz0Op7LKOSpurLMhC0pJfb3rfNs2f7vfWdWyFi?=
 =?us-ascii?Q?HBdrD/R1QO4NVkLfC0wrFKvWoSrjzNZHpVl2sj71Khvi0VIJP/D12Twvd2GL?=
 =?us-ascii?Q?mBG6Uu9LHLqOetsXXig6ASmo27VXqiKeynE8GHn9W3FhXndELl4EX7AQDBeX?=
 =?us-ascii?Q?HrdaXxrpNrl9UoYbLH9BJqM6e2xxEyvHyepgvvt5DguOtjaKzdRqVWwStPCE?=
 =?us-ascii?Q?E1lraVjKYhZHRF9/Jq6aoiF79iEepzhwAcothtz3H6xPu7YG6xBHCpWEETBS?=
 =?us-ascii?Q?JraOPygrIwj+v9bFDqnNtnK3oDiSSmvNhYDGXotvoddRmOcMPtDJ9Gk/kqCd?=
 =?us-ascii?Q?CI0MVgW2DWLTp8X5sLr1mTsL9g44yHEL4DRNrUgWieHHIckXnjWhqEJq1dZK?=
 =?us-ascii?Q?XTKZxY9oYO5ar2+ABc5+Y8EL/hLRJdgg8wlyZO0azr8dGnikbb/p/vTSij/o?=
 =?us-ascii?Q?wZdbPxLizrTr6Ee62WQubnsmh5wHLQRP8Nmfb4kYCAToDTuL7+SWA+03bjim?=
 =?us-ascii?Q?I/BvrUHUCKHKwVkIBCA6WyOOk4pAAkLQbPsm9gx8LhnV3rb6oda2L9STFdrq?=
 =?us-ascii?Q?lATxhLiZdx9jjU/g0Copitu6JUxG0SuZao+Be9UQAU0Jxal0eXqq6LEkVA0n?=
 =?us-ascii?Q?7eyc6YG/VgWFWzm5Xa3CcEO9xKBavse7Hco+skjM1lvqUFW77NWHsUFdnDWg?=
 =?us-ascii?Q?UCtX6LyDnsByE7Bu02v/uSuAI7g/zXo/NRF9dP1IviPuyS8DwzfVXJSh1oOO?=
 =?us-ascii?Q?VO1s3hVgM8BoPe5oTVHI32aRztZINuYXT94hDys6ihXcv1UwjT53xVrk246L?=
 =?us-ascii?Q?k6ZXWm60lOJhcTu9pnZn2tOXvD9NZzQLASW/hXKCGXBZ8sN69CDAo8XX95Jx?=
 =?us-ascii?Q?m/hy9Nh+2MwOap9susXKa/LJbV4aqurAgWN50ZJjFWoNlQDJ6qB+ns3K12v4?=
 =?us-ascii?Q?e9bXkA2iWBUToY1ZZjbNNRsSsYbY4mmGkL3bXDKBsPqNgkE5zZ3Z2kqP/XIF?=
 =?us-ascii?Q?JT/2EYqNheWDUBeUfVu02Cc2R1SBfUQt5SXT5Zly6VEWDPIhNOI4HVs2x9Sn?=
 =?us-ascii?Q?LrzYZMSlT9beqGRgf1wLmIw5oCIZUu9nJ9N7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:28:21.2082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e80a34-c59f-4a3b-4612-08ddc53e2e64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411

Later patches extract the bindings to a separate file, where that global
won't be available. Make the check when calling the function instead so
the bindings remain agnostic.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/device-tree/dom0less-build.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 87828d4d9d..0012046574 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -38,6 +38,9 @@ static bool __initdata need_xenstore;
 
 void __init set_xs_domain(struct domain *d)
 {
+    if ( xs_domid != DOMID_INVALID )
+        panic("Only 1 xenstore domain can be specified! (%u)", xs_domid);
+
     xs_domid = d->domain_id;
     set_global_virq_handler(d, VIRQ_DOM_EXC);
 }
@@ -876,10 +879,6 @@ void __init create_domUs(void)
 
             if ( val & DOMAIN_CAPS_XENSTORE )
             {
-                if ( xs_domid != DOMID_INVALID )
-                    panic("Only 1 xenstore domain can be specified! (%u)\n",
-                            xs_domid);
-
                 d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
                 d_cfg.max_evtchn_port = -1;
             }

base-commit: 14d96bd64d8b82cb7666005221c90fb0c93785a8
-- 
2.43.0


