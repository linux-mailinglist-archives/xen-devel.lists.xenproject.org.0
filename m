Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094A2AA0BC9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972348.1360724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCr-0007u3-1T; Tue, 29 Apr 2025 12:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972348.1360724; Tue, 29 Apr 2025 12:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCq-0007sG-U4; Tue, 29 Apr 2025 12:37:00 +0000
Received: by outflank-mailman (input) for mailman id 972348;
 Tue, 29 Apr 2025 12:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kCp-0007KK-6X
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:36:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4400458-24f6-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:36:58 +0200 (CEST)
Received: from BL1PR13CA0305.namprd13.prod.outlook.com (2603:10b6:208:2c1::10)
 by CYYPR12MB8872.namprd12.prod.outlook.com (2603:10b6:930:c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 12:36:53 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::8a) by BL1PR13CA0305.outlook.office365.com
 (2603:10b6:208:2c1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.17 via Frontend Transport; Tue,
 29 Apr 2025 12:36:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:36:51 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:36:47 -0500
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
X-Inumbo-ID: a4400458-24f6-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sq+LJCWF7DZ8Bh0bneBWq9jqBaaVzk83Kk65C8kV6npkGXmLJJNYfZT7VYazrYHSbRNptaIGc8e15w+3ctQ3j6hVsyni/wwUrk888TlNcAGnTyXHACVHLSvQZnaNp9x5/1IGFU8P+1GaEGGNN3ltckZ+qhuiAWeHtIyv/6l6t0K5UeMoaPiM7/CtR+1fRfsZ3y9YEd+RHrBh1gwTs3dL2MFKA2nscPiB8LzgUM0dxLI1f8wRdVkotIohFONtm+slYtmpKouyQMn1lGqf0fcNS2zT+XjI7ixiyFkK7dsp7S1qmFeVTFZxcLCN59FUvJCz/V88sVIVUQ51t/SCwU4omQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgu5x27Qay+e+Aam2Lc6rwal+aKJVBVdZe6PlDDiYms=;
 b=Q1ahSUBVoeiMrl96V2+YFFNDZeIRt0T217leaZC721l0FiKJDESw4Xki39AKk8z9VoTmEvYLRwDh8Ls1PmthPNQvV37tqcLQsBvDLjrv3eQrTU/IFYgCweNHJZMxtA/tvO2NPnSP7iATJkqW8kE3BNvgb4iylEsaIJ7SYHXbu/QFeLJWQVTpExEddpkPSDw3l9PBWe4GemUFSx+ISV4xaBWwwixSwitIBqMh7dFtEXFXBKv9cTNtPTP8I91n5JUnAJNiPz2DOfNr4pCVDN/Bq679rnjjeEDMNEz+8b9tn0axdwTzd2dSGTszbe2X/cn5+DRC5o+KJcBrUSR3oHvN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgu5x27Qay+e+Aam2Lc6rwal+aKJVBVdZe6PlDDiYms=;
 b=pYtbuTzeV2HqvsLBRZM5fiv/E3gG8XpblVjxIfwpV5YDcEf8oQKKhqFBe2/U9JNbF7ICb2ybr3Z1X8xmnA31DTo3EKG12fepSbsXo9dSfIcry3yw2eusMcIrJwHetzQlZwMFI7gECb6C9JvnfqgriwFGje+ry8ixiOrR6NXreAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <agarciav@amd.com>, Denis Mukhin <dmukhin@ford.com>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v6 01/12] kconfig: introduce CONFIG_DOMAIN_BUILDER
Date: Tue, 29 Apr 2025 13:36:12 +0100
Message-ID: <20250429123629.20839-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429123629.20839-1-agarciav@amd.com>
References: <20250429123629.20839-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CYYPR12MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c7a079-5d78-4454-bbdd-08dd871a8488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QqIFw1ez2hhEUNMppwSZo9npba0HNsihh6IXQfpzFDwwUUwTEAwJ3gSN67ZP?=
 =?us-ascii?Q?TNpwBnkdi9CKSI3LQSdxOUqW8m4NrAubjG6G9O5H6zACKvBF8u5OahVfxJtV?=
 =?us-ascii?Q?ZSe0rx7Wn+LmKx65OIBrH+5R5y7zDiHbId/gKqgPnNxlB9604NMlKmBVTmZC?=
 =?us-ascii?Q?vTnh3+NUcdmYM7JeymACQsEAV6W/QCVQP2+hlHxK1nou7qW3gH7vj0bWQjVm?=
 =?us-ascii?Q?5Scdji/XAgOaJ6RfX7jhnXsCRDZNJJhxGVydaivbNrROOr8E4EPhlUI+Njl6?=
 =?us-ascii?Q?wiH95woTPfdAfjN+nUYdOHWblQRKZvnVmUDM1IOTBPA7B9FecZ0CNE1dIEax?=
 =?us-ascii?Q?jrX0euM4ts6PSvfZ7JvjCiWrJKyd+hM8R1SbxFMx/iz/S++lb9f5cuHCDBCT?=
 =?us-ascii?Q?j9odgtSaHphynA01sEWtjFz9SgxYrYir7BLvqDa5+QqrIohOizWHVj4Yq08r?=
 =?us-ascii?Q?PvowjKZLxcOQlLofvl8YqZ+4anNRfVTUhH03KUrbH3anCaQF4c2clceWI/VT?=
 =?us-ascii?Q?Dv2mc4v131/8t0rHAwsn4mZ+6GBi6cNuyAEn84gt9Jy4oa7nK81j3ImI7guX?=
 =?us-ascii?Q?/10RGh5qw7ZF2gWAY8UWa2zS921JVTCAY5oO/fxzPCIhwCvwPlDlDtpoPoC0?=
 =?us-ascii?Q?rZII8l36NkhWdSaBcPowpX78lweHTeyx4aCFSdxApd0lAaaCKq4/AiX3QgoF?=
 =?us-ascii?Q?HOuPQdFJg4Fl2tnbjro9ABl9PCG0ZpAuxUdTSDelZmDa/UxTqIjkalOE83sk?=
 =?us-ascii?Q?YpSsL2FjzEIV3ujoUseblG4fgbg20rwNOQ454uyQFOBc/oiGy5xc5+DzGkCe?=
 =?us-ascii?Q?yPN7pH8NK9OvnPDnZ6h7uTfpGgFK+74gi0CwhQd0MNW+8uh4HzyoCqvIj8LK?=
 =?us-ascii?Q?7opkNx7Mk8XXEEJaSBqoQHcTeTrsi44feRHw0YKWyrydDlPqPXoQpAb6BIEq?=
 =?us-ascii?Q?yhM4W/pBbeupYIcN/tSm5kZnmgvaD2ohRbNpu5/bqfba9CEygnF6VW6EFATJ?=
 =?us-ascii?Q?ssmKS6HLn10aCI2hAUksberhlSBueTsIOUKqfwQn+GnPXpJlA7iwBNtcoJQ6?=
 =?us-ascii?Q?9E1O1+DK4Xp1SHt3ZpfStqmRpegrBQ7pcM5tjkmtW7A6cNQFVnub2PK8D/nu?=
 =?us-ascii?Q?eHoE74UzTMqe1L+GLVQo2JvEJwmUg2hsAb1IUs7IDhIv9RMQ4iCgWTcgWsx3?=
 =?us-ascii?Q?1XxQkYB+HMOtx7cuArGjmN16qIHeGZxPAO2+f0b+LyEy/d3ID0aMp8EfP8Ia?=
 =?us-ascii?Q?/wjY2agjoktQ5ZaxqGgcyuy0qp7r3TcYT1+uCayPPE8gvPoxYpRAOK8kCZ7i?=
 =?us-ascii?Q?xvubyIky1nJsXyL2eaHqeZp1SNZb2zdqByVWXdJreYRS3WgRDAGKS6XSmmSL?=
 =?us-ascii?Q?4vcqxzL+QiQVFp2uHoqYhrb3HMhx3UW7w3Ls42hyfrhpwUZmDIRhNpK9zNZQ?=
 =?us-ascii?Q?J0Z9ZTRwglKrxYqawhUh5fkG75vVHOPgdl1o7eamPTy+snvNb6tr6Dmctsn8?=
 =?us-ascii?Q?ei+q6lOztE329GpjvlMzqUX1QBM24JGF57Tz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:36:51.8481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c7a079-5d78-4454-bbdd-08dd871a8488
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Hyperlaunch domain builder will be the consolidated boot time domain
building logic framework. Introduce the config option to enable this
domain builder to eventually turn on the ability to load the domain
configuration via a flattened device tree.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/Kconfig                |  2 ++
 xen/common/domain-builder/Kconfig | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 xen/common/domain-builder/Kconfig

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index be28060716..e025fbe257 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -144,6 +144,8 @@ config STATIC_MEMORY
 
 	  If unsure, say N.
 
+source "common/domain-builder/Kconfig"
+
 menu "Speculative hardening"
 
 config INDIRECT_THUNK
diff --git a/xen/common/domain-builder/Kconfig b/xen/common/domain-builder/Kconfig
new file mode 100644
index 0000000000..44b8351af8
--- /dev/null
+++ b/xen/common/domain-builder/Kconfig
@@ -0,0 +1,15 @@
+menu "Domain Builder Features"
+
+config DOMAIN_BUILDER
+	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED && X86
+	select LIBFDT
+	help
+	  Support for constructing predefined domains described by a flattened
+	  device tree. This allows constructing multiple domains at boot time
+	  instead of being limited to a single dom0.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
+endmenu
-- 
2.43.0


