Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA50BD28FA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142012.1476274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flb-0005Z5-20; Mon, 13 Oct 2025 10:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142012.1476274; Mon, 13 Oct 2025 10:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fla-0005Rg-EB; Mon, 13 Oct 2025 10:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1142012;
 Mon, 13 Oct 2025 10:26:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcA-0004Rd-Gc
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:14 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c78fe375-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:12 +0200 (CEST)
Received: from BN9PR03CA0492.namprd03.prod.outlook.com (2603:10b6:408:130::17)
 by SA1PR12MB8948.namprd12.prod.outlook.com (2603:10b6:806:38e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 10:17:08 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::44) by BN9PR03CA0492.outlook.office365.com
 (2603:10b6:408:130::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:17:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:08 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:05 -0700
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
X-Inumbo-ID: c78fe375-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITUoKqvYFBnv6JqoApo/bZ9Mnc9tXyPpsarLaG2g4Sk5v2XeZgS2aHvK+7Du2qldWR/tHcdnBZ/Z8Bu5ghzdetze5HE/NHmqFYcUz1P6VwBjGDSIhQmBTNBzHqi+B+bqGkfYF0NYtGs9HGNKVhtBCxOl2znu3AF+e5ajBOUoDhA5C4QOXed5pnwitCbx4Kkod6dnT+KS9ZQvii3nCZ3GbMhKv1jKF/FalFpeWnys/4Pd9eTg0IUvZz9zZ+KAlkXeRgpIId6LSIJ3yv4q+W9wQ4OHvljD4L3RKIBZdcUfWHL/OXyy6Ai1PZm7OFY9ipIQFMWz9RvnCvg0CvTyOxWwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyANdC3k7aP7WUEmBjJUqOcnGAygkfaCGTkQVbLp+cc=;
 b=NtFtKQEsIyKom6gd4A1Af8j2QVFrGL0+x787FWQl4fx7MQHKyikL5hAzgoj3qqmu0Aq8vuZhCJePui405ad9dgFz2cWsNEi2KksPTAYQjuI/PoFxH6vpU9ir9BPmh9qdElXqPvp3eX5xBvmjG1foydMDc5AvdqMXBv/AwqODAdjkmXjpCulbdGB8pF/3Az4EG7KekK+OZEjA6gcq6+kP1fcDFFA+qxDI7gTx20P7GG8BBxVriVsgbHFoSiLaqU8SCEM9B//DbN2YOK0Hj+kwduQbwSWO0sdSGBm+bC/S0oxrvvudqjrJzAlk/slFgwHw444kERojljLFGuqiXc2psQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyANdC3k7aP7WUEmBjJUqOcnGAygkfaCGTkQVbLp+cc=;
 b=J7yQQSy6OZ2JutOgPIpZFGtnj798F2f7QAvXHU+AsCMJbUU59eykR8gZQhrN/bMm+p1oiiY49+XaKKWCHWlY+DahYOYZuymrTspsScuYxXwCFnZzwBvtsDsEUsvoOnSFGQjSygYuITmFabQlzJfCzwFirZqgJ6nC3+ZKXQdyV1o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 14/28] xen/domctl: wrap domain_resume() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:26 +0800
Message-ID: <20251013101540.3502842-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SA1PR12MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 19177c81-1d42-4ad5-76a6-08de0a41aaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mxb3IBXdD0geumV4uQEWm8W3Zozkddo824I2idJ1A9b0gPnrFEPfD9T29PRp?=
 =?us-ascii?Q?TamTqjxe9QW+v72zX0Q6SaKuCV/6t0+kSB2vABIeLtdrYv1yDznsqw7o9w2Q?=
 =?us-ascii?Q?N97LoNGNgEhwfel+BhJSJ+7WEjEhH+FIn5eYjfFDSK90+Em1de+j1HW8J8wZ?=
 =?us-ascii?Q?hQT4b9ig9DtUUuZr6sYuLD2Sbroq7LxmpmLI+Fe1nnCqW4QXuGKjgCgamsU2?=
 =?us-ascii?Q?huvPaPWJDLK+pitZhPk0d0dG+VjniKzILo7NfES+sZd6scsZvgPMWYI6EUDZ?=
 =?us-ascii?Q?Qo2ETLNEu3eIBZQR21hyi7v+fHF0GhNo8feS6SZRdbe/SLSCHuU6bViKmA9E?=
 =?us-ascii?Q?gCq3vya3mD6Z0XUIG4NYwCrr+dG74vm8HhbQDFWdsh/nHbQ0dLIIBjVnEa7z?=
 =?us-ascii?Q?FjUebe4Hm9rTSs0XRcj1+PZZ1IiPoBcorewxoS9zc9cStUVRILG6hPDuFgvI?=
 =?us-ascii?Q?BA5bCE8+dpI6/bmvvetwbPd+ZycyBe2k6DU7IFwbQoAAdXIxr0a+i6Iwujtd?=
 =?us-ascii?Q?GBTR+dD1P2mBNUbuDQltz6sQm2B17pxXir/8v4jVP1IZi/SI98hvv1eWhSXx?=
 =?us-ascii?Q?QTAhMnUMlHtTkF2Q8ODYJctxbv8fUDW2TPt11Z+3XFq7LDgQDBHWSO8FV/FH?=
 =?us-ascii?Q?kDaEDsZseFhdvUC3SKbfC8l72NcrIZedbfHRvYzi8Lyf2mMGOpkTiQMq7NP8?=
 =?us-ascii?Q?0HCwPmFUROv89kO7YH4LOwXvXcb5Dj0WWX3TnL84Pf3AcVb3XqbotaP33kuK?=
 =?us-ascii?Q?Cw40N79HpxyX1ftpaJKrArK+7dOLr0BqXUFUTCllUPAn5tu3XTc/HHTR0YnT?=
 =?us-ascii?Q?q38FVBOoRWXfJromISgszR59gC2KJ2WN3KlB6EqZM8jcWG6ZavdHR0RAhR/l?=
 =?us-ascii?Q?/gQuIMEE80HpLomBUSu0cSaosbSKAnnQpGFTlr0e/dS6Or0e3DHfDku+u6e9?=
 =?us-ascii?Q?82JIzB3sbTZeiH9RmiKBiYOvq37YrF1zjz7N6efUI2wCg7RkSd0zeWodTGAs?=
 =?us-ascii?Q?RvSMoYE0zbmQL2iBiReHByR6ThiQb6laHnQ8dnpk0bwdtyeX3V0sw7eOE/Xp?=
 =?us-ascii?Q?tWa8FGExJ4aWpQDUPTuWwFTlib+aba3SVLxoDiJiC003ngEWaYqS2Gaie4GR?=
 =?us-ascii?Q?O2NKkUX1QXeQzjdiv8wLuUdK3C2tdVc8sGHQWDCNgwjui2WYIsGU4m4VLywt?=
 =?us-ascii?Q?nKAO0YQy6SET1hh/Ff2+0jgeNY7k7VdElP1B9ve0GVPBMb6dAXtiCa4vrANy?=
 =?us-ascii?Q?CtbRAFnLCJQRECCKOHr1mMltus1rgsAL71o3pSh6KvJNfd+D2fcVeST0SJhv?=
 =?us-ascii?Q?UrHaEdrCXL7gtuSgRv29NpowwCx76XQDF7LSEcbnIpKelFA+K826ls/lMK+O?=
 =?us-ascii?Q?86NbN1aFHTE6VIAY8qKM1I33vO1YoVlnvWujG/phmhVXUBO2CXIjvrO0HwgX?=
 =?us-ascii?Q?E7BMI3J4NQksYFXIpUR+YaM3Rq1HzIYGmDS/jtCjSy13vZ3gjae0CytpFkSN?=
 =?us-ascii?Q?iuHNIorz/qyn9sDnrr+kYcsBVEsHhF17ibvMFL9Lvr+kzYP76JVC+7K3PT1L?=
 =?us-ascii?Q?3otyh/w6GMOEzsLRiSI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:08.5485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19177c81-1d42-4ad5-76a6-08de0a41aaae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8948

One usage of function domain_resume() is in domain resume domctl-op, and
the other is in domain_soft_reset(), which is already guarded with
CONFIG_MGMT_HYPERCALLS.
So we could wrap domain_resume() with CONFIG_MGMT_HYPERCALLS. Otherwise
it will become unreachable codes when MGMT_HYPERCALLS=n and hence violating
Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- new commit
---
v2 -> v3:
- remove transient wrapping around XEN_DOMCTL_resumedomain-case
- address "violating Misra rule 2.1" in commit message
---
 xen/common/domain.c | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.34.1


