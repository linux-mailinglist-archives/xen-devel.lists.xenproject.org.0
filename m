Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A4AF8E9E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033084.1406498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckQ-0006zm-Ei; Fri, 04 Jul 2025 09:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033084.1406498; Fri, 04 Jul 2025 09:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckQ-0006x6-Bm; Fri, 04 Jul 2025 09:30:22 +0000
Received: by outflank-mailman (input) for mailman id 1033084;
 Fri, 04 Jul 2025 09:30:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckP-0006x0-CO
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:21 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 806693b3-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:30:19 +0200 (CEST)
Received: from BN9PR03CA0406.namprd03.prod.outlook.com (2603:10b6:408:111::21)
 by LV8PR12MB9262.namprd12.prod.outlook.com (2603:10b6:408:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 4 Jul
 2025 09:30:15 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::9) by BN9PR03CA0406.outlook.office365.com
 (2603:10b6:408:111::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:10 -0500
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
X-Inumbo-ID: 806693b3-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjAFaofEW2beGg77EApVxvewQnqIp2hJNyGKX3pB9Ks0Ngg6YKh/N1coyXUBAkimcJ6NOymnAWQL+mAfkUFE2Blv879gJ3xzQqmqExahu8b3NXu1shk6BXNGEI/2Jnl1fxzrbAuHoVM5ilpusdhjpasYlejJdO24VbAp/iL72J96h+rxzKOGh08xwvDR1OQkNsnW/IBJgBhkQmppeGeSWTrb0zyndgpciISZZXO1fLLRRZ+L2ACHvwMA9+Y5NrcZPKhThLVXbcpWT9Gd9UN8unrHmYirfJyLhONywqwHjflPbiJbDt1+Dphq7Z29rocP6ugBcTsNYTu+bt8tXg4b+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdBaE2ZAn0zVs7zMkv6iVvtUYk0VsH6uGpj56SXk+SQ=;
 b=stq54wWXved+0ftO9VIl5Ja0r9lsVw1F2lk+kO+7AtPyI6poK+rzMCRKyFmRr1DhUyJWcdVrO2OjLLOTZprF8a6UG/PhZATJcTUFqnqBdUEWkoGYFn7lnAslno7L6taag2FSzN9AAbggLuR3MHUaSCYlfr4qvaZ0pOYPlBt58Q+pZWklrvKC2YVXKxwUyaTtoPZirHP5GmTa9kf1Xu4ib7yJU2+Z7GVwBf+IDgpueFXX+9+xwlDW3UFHKGcCCqa7jhDgRoNbOV68Yv3bxSMhfb/gsaYaZQ9wd0tr3/WK5GmktKahhM2mkQ/p7WU8Zep4vWonY9qfIf4jX9wjn78tWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdBaE2ZAn0zVs7zMkv6iVvtUYk0VsH6uGpj56SXk+SQ=;
 b=nqsVs9eW93/9Lo0jeUnM0cqVnqiQOeM0PWCJgXKafX9kf1ju30gzkRrIDVZ0HY3c3WRDzZoSvlZlPAIAMucjytAWK/lCk35hL50A4yf2aZVsjKfOl7NH7W7RMOcfOa7reIdHP1CBGAAILHgAfj/mJ6OGDDlurI06HB0vXkonSOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v6 01/18] xen: introduce CONFIG_SYSCTL
Date: Fri, 4 Jul 2025 17:29:35 +0800
Message-ID: <20250704092952.822578-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|LV8PR12MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c9c31c-bc13-47a6-8837-08ddbadd6158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?huv/besFrr3ishSlW84zO6Ji+SR5s38diBXyMsE2++1skTtGqOlcexKjy4Rs?=
 =?us-ascii?Q?+tFiUhCz3T6KRzWQbjHJx855lud0wqQgRJMA9LdI1vmtkUTT5OvmDJnEqHam?=
 =?us-ascii?Q?so4Fjd37b/gIqVHAyFFxZp/kTWmLnTOnpG697W/9vvTLu9Wl3/R07hamCwHy?=
 =?us-ascii?Q?kk3qEqZjvE3Jof0pE5vh9e+Uc9B/EFDTcqliX+vOXSI8Z5et0lVAJjkiSpSb?=
 =?us-ascii?Q?tyEUTTGy/OtQVkcn1Bl695O41q+Iy5IVJ4cTreCDvpCMBzC+HfqwSRNpoAsN?=
 =?us-ascii?Q?04GYAieGY46qEcmuuS0xyTd4wBfYySiVFvZP9FgP00jA6BJW8TZ8YNEuQ9Yv?=
 =?us-ascii?Q?9ht8Tk5saMQIi3Jj9LfWVZ3vLxhf8pw0rFnA5cH53OO1JOMI/aKy5tuLOhT9?=
 =?us-ascii?Q?T5jQEiAY9cKUsuY+pWgsbA2R9wzviCSIIayYtZOqCvJAa4SVyGfHCfrX5jHG?=
 =?us-ascii?Q?+jzNPoTQwTbPATOkjZ3WiI+fhq+LGzG7jcHH8jSgHPZgmGaxtvCtmKjgbKRa?=
 =?us-ascii?Q?5+9FtGwre4I9vXM6A4yqQK0uE7KBOHHNCp9bJVBgFQD0A59sZlUwrG/CE/Dd?=
 =?us-ascii?Q?z/TaNPt/n1Zymq5yyPek/6SRUIen25hQHCOXHLzBp2z2weJxO8TGd6g5V7i0?=
 =?us-ascii?Q?47FSrrK7Dlw7R/KoFFkR6echuaH1cCSs8X3IevGp/GC2MNMAQj+mctnJZxe0?=
 =?us-ascii?Q?V3qbRb3+ah+X4m7Aoa5JjfElyGMojuiecvw71AvQhOtwejtLC8/lqnrOGiia?=
 =?us-ascii?Q?bs1tJVzf534BxAF59IsU8lMP7GmptRhFd3Y/qipMtDbS3UmOtsj6Rplzv9kz?=
 =?us-ascii?Q?cdKYzdBkolSeDgRlMYRxAFiv34wLF16rSjGzchpmpL2pQH6d7Eru9PzHCFXC?=
 =?us-ascii?Q?SUsfS5oI9iziqgEoeDaxDMVDPkmUBdLhghmJuhc8R/ZW4tNNKw1hBf+TQAqw?=
 =?us-ascii?Q?C4eprk1jdWyZZVUUalKZK0ZsKuoYdFGgDyzLkmbzFdXtIYUUKdBcXpV0m6gu?=
 =?us-ascii?Q?5eMWpkLKauOKF+/eChWcFQ3PtmUSKkA7l/yxr5JQiSwXBd5pkF/2QTAjG7fY?=
 =?us-ascii?Q?eyXRxbIkpP35sklAyrPdblSioWmuZzqhfUNETN61R5shBDalPUNusHCfQW0W?=
 =?us-ascii?Q?+BW1Wt+W0lAeRwH6buFdeuV3UDKpukqLx26oLE/ObXBpLfXxboPtKPEy4fDm?=
 =?us-ascii?Q?5fyzLjS+ZR1HPmvtiF3UIUnqkDAdY9amWFnTwhMOKbiFiWLIyvPfIBK++eoh?=
 =?us-ascii?Q?ooxWtxs2ziCNn119ks07aS8N84L8slIQP/+LMZFvQFQvgaDko3/I8btkbWYQ?=
 =?us-ascii?Q?Bb5IohuOL0sfuPr1lpxPgyPOarx6F0e5D7j1Q2pNFa0WgZCFXWf+IAUWAqy9?=
 =?us-ascii?Q?uEDcDXWxObETBiAHpEcrnSJ4Cjw/Nxad2nP/0JknhEQxsCy/Sg1aiSPlTx8t?=
 =?us-ascii?Q?WqSIQpnmnSt7JAuz0kIOJaogJGh11/62ZS7J14Zu5hxvoFtC209mhF4dwKv5?=
 =?us-ascii?Q?OdHRDIB8F1nTwPXspjQ536ImkDrEt6tKUtBA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:13.9807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c9c31c-bc13-47a6-8837-08ddbadd6158
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9262

From: Stefano Stabellini <stefano.stabellini@amd.com>

We introduce a new Kconfig CONFIG_SYSCTL, which shall only be disabled
on some dom0less systems or PV shim on x86, to reduce Xen footprint.

Making SYSCTL without prompt is transient and it will be adjusted in the final
patch. And the consequence of introducing "CONFIG_SYSCTL=y" in .config file
generated from pvshim_defconfig is transient too, which will also be adjusted
in the final patch.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- remove "intend to" in commit message
---
v3 -> v4:
- introduce the option without prompt (simply "defbool y") to eliminate the
need for transient "#ifdef CONFIG_SYSCTL"
- calling out the transient scenario in commit message
---
v4 -> v5:
- a simple definition "def_bool y" for CONFIG_SYSCTL is enough here
- refactor commit message
- blank line ahead of endmenu
---
 xen/common/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 867710134a..fb5c60517a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -611,4 +611,12 @@ config SYSTEM_SUSPEND
 
 	  If unsure, say N.
 
+menu "Supported hypercall interfaces"
+	visible if EXPERT
+
+config SYSCTL
+	def_bool y
+
+endmenu
+
 endmenu
-- 
2.34.1


