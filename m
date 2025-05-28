Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89852AC6589
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999063.1379809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvB-0002HN-3C; Wed, 28 May 2025 09:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999063.1379809; Wed, 28 May 2025 09:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvA-0002EX-Sn; Wed, 28 May 2025 09:18:00 +0000
Received: by outflank-mailman (input) for mailman id 999063;
 Wed, 28 May 2025 09:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCv9-0001jE-6t
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:17:59 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2408::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4871c12-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:17:57 +0200 (CEST)
Received: from SN7PR18CA0015.namprd18.prod.outlook.com (2603:10b6:806:f3::6)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 09:17:54 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::54) by SN7PR18CA0015.outlook.office365.com
 (2603:10b6:806:f3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 28 May 2025 09:17:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:17:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:51 -0500
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
X-Inumbo-ID: a4871c12-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3aUIuUz0AG6CxhWJB11fyYZwqROfw4TFutkkodra1GAycoyY0I2ZkFMc4otD745YQRUpsmJsBjwoWeQGQEsQSh2DpDdtjfaxWbIWt7szwgagsurnyi/hG3B39uQvw4TF8IASg9ViFfUdSij9uGMo1Y8C87rfdGYbhUllo1ikT3WkK6nJWn/VaxxXMr06zNMY5NCXUbl0QyFCEYLUzUEz60CtMTCLa2Fu9n0Qkk7XtUDgpPkn7SzWCv3ubElhYGfDbrSl/MoetvU9Qk5DWFyDQsgFDJ8z6i5eNMs40xE36XQRrETU6WGVYyAvWa6pdbst+rlYpYSvHE2hKYnq0iLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=xpnhPImnB73CSTsAbAwuXlRNBiSoLzb9XvuI3a2HBcBAKOTZfRZ5iEoc7uaL77owWMRCG4Y6uhkocHC0HvjX0Z22+ZySYjMENOsOwTEABc+PMTbSj2ZxqtMyHiC+LGMzWdTdf0J5O3If7QlCjEtQYHknQvvas3zdcxeeyaHM8e4FKWHy2ut3in1DmpBrj+BOD+FGOt6jX6hXFPr6b9ojiqoRmv1Eut59PdWvgbs3/GKTWgTUliZJ/+ruy6cDSVo+c9RzEQ0bb0B7yI7NMUaechmkKTerJF3PM1dfTf5WbGhkwT+ZZVS0FAJnDZ9YNC1SVXrZHMjlaNN7CjLheWUM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=2vZSF/Vfm9rc4GL50HJKlTHW9qUgXfz7IpFBwjEz4EYRFD0dbBkISPKPBZVoCSkJtqlnVHpH6WfWH1fhlxd51XpcRel7wdqRgluA3iv1JdR25Ew9cd9xTBN9N+mZn2OTKEZ+PJ06gCONvxjtkCUogxoATDoiYMY3lTK2yVCUD2I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 05/20] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Wed, 28 May 2025 17:16:53 +0800
Message-ID: <20250528091708.390767-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 2388eed9-0070-4b79-4c89-08dd9dc886d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VEUdW4W8l6HYAwK1vUez4gxzVaffOJPXtITZyFiGYdEkrk4W8EkdEkjpNAtk?=
 =?us-ascii?Q?c2/lbDb2xg6ROe1aZOCxj/eggy9gHnQw0DzxMI8ltFQjY/YRwhQWCbhxD1jJ?=
 =?us-ascii?Q?Da69drKAon8hqZFWoRkHPqyq02JoPNTRLoW3GTcLJrSZ9WkmMqVBzhZGQUZR?=
 =?us-ascii?Q?gpiJbU6yPG0yFi8w7X+K1yKNbKPYjGJ+tNBiRhNFotaIzqvop9sZjp2K2FAg?=
 =?us-ascii?Q?8INDiKxUzoz29cXJ14D5Bj/8AoNqu28p6alF4Pi2qdbNAph62ms5NcjJy/K1?=
 =?us-ascii?Q?rIhlvDBuj0LwpUajQm4sCHTtb294TzVO5AnWHt+MOwpp+pklZLSNhOdy7K+p?=
 =?us-ascii?Q?mbQe96B9ug25XP4HnU0DFwI2Ki9f+Mai2fSx8FqoqrdoPjHQyPi/jyztR+yl?=
 =?us-ascii?Q?znHZttENgvN3lU7Hf0sgk4KUtd60GAFr/6E1IBVpmKDImEFIcq8xHu70KecW?=
 =?us-ascii?Q?h8R4Dt4MRJlVO33aKLcQTtdsJUujSx8EZnBXWBAmLVp+z4RS24mIR+Jgwk0f?=
 =?us-ascii?Q?hPzsvGkp7cDq0cbRHbZPaudJbL51zZU2Nu6trsNRwX74RaJhGqPM+I3InV8m?=
 =?us-ascii?Q?qkX4Ped9SRgceR0uNIgaiansPU01/SM2dESXf5D9RKxoauW1uqQGJSsaiBLk?=
 =?us-ascii?Q?AOsVRVzkZ8beT0FuIcs3F/lkynANGmyIUrMx9IdhSWFVymBQ0zmv0gr1n+sl?=
 =?us-ascii?Q?Uyq0+qCCaV9e/pc6keU9dD37vFAFR+qKwqGpdMQq1XLuZruZDc5rACbhyx2g?=
 =?us-ascii?Q?04f5yMV8M+qJTCgjFvfxrOwAPAmdppfJvMN5dPoU+dVaA8jw7t9koxU8G2W8?=
 =?us-ascii?Q?Iijz2Ne+WpCOvHiygZhs869Qz1KVNn6nF4X1/2LzZxQ315cQUdPjGuklvq78?=
 =?us-ascii?Q?q43BfX5sH8NoTt8jPH2RW1+0+h8KFFXfNA8rDVEEMQTRwNHwnCbxR3FvknGK?=
 =?us-ascii?Q?ZaFgIqDhaa/m9ivuMVashW2Rf0n44k/Fd+fNgEkCIizZdiXT5D12XiMck0PG?=
 =?us-ascii?Q?d99qKUsMS8TfyAkTKiOYGgAMKLH8RKh2ATcEQCfHM5jK/5KwseXayoLRtUi8?=
 =?us-ascii?Q?t4wz0FOzlBZxfzLbZoYesDrb3lUaiSx1/tg0pOF1x4rE6i4O8tYVWUFKW08K?=
 =?us-ascii?Q?Pqtp15PI3x78kg81DxQY9/lcwy9RfftWhTiUP6CV6EyMPIp87h9bPoQ3A8A4?=
 =?us-ascii?Q?+fDk3tX8TvynkjeOd5t1eLnrdcfipw3+7qKrO3cS4uX0Lx8Hl6FCGri+90Je?=
 =?us-ascii?Q?bur+locHgLhJpYduVaNxq21x4YwGQxnUAs3ILdJvJIWWwmsCvXqrcswp3IaO?=
 =?us-ascii?Q?hSrR+sY0JHiYTjwH0HB1mepYlBbarhQewfqPEzxucHl3RZu4NWmomeXfXokC?=
 =?us-ascii?Q?2YsZmdNo/JRUV0mo0avkGx2UaTfBobgRsO2+Rny8dF+KJCqLqH6dJCHAyFks?=
 =?us-ascii?Q?pBwWn9daVKdVrNKJdDnrxSFmSbg5lmBnz0ApmY/ZPFvU41Inu9WUa89LQeHl?=
 =?us-ascii?Q?atSHxmR0GZL16S/MW2/YBhAc9mPgAxqo/VUa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:17:53.6852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2388eed9-0070-4b79-4c89-08dd9dc886d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366

As function xsm_sysctl() is solely invoked in sysctl.c, we need to
wrap around it with CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 2 ++
 xen/xsm/flask/hooks.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..22e2429f52 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -261,7 +261,11 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..93a0665ecc 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -22,7 +22,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
+#endif
     .readconsole                   = xsm_readconsole,
 
     .evtchn_unbound                = xsm_evtchn_unbound,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6a53487ea4..3a43e5a1d6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -856,6 +856,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -933,6 +934,7 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -1884,7 +1886,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
     .domctl = flask_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
+#endif
     .readconsole = flask_readconsole,
 
     .evtchn_unbound = flask_evtchn_unbound,
-- 
2.34.1


