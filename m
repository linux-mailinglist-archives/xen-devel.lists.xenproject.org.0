Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C1D3C3CB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208500.1520659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8D4-0001Ar-T3; Tue, 20 Jan 2026 09:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208500.1520659; Tue, 20 Jan 2026 09:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8D4-00018l-QA; Tue, 20 Jan 2026 09:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1208500;
 Tue, 20 Jan 2026 09:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8D3-00018d-K2
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:39:37 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee14f73b-f5e3-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 10:39:35 +0100 (CET)
Received: from SA1PR04CA0024.namprd04.prod.outlook.com (2603:10b6:806:2ce::28)
 by DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 09:39:30 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:2ce:cafe::26) by SA1PR04CA0024.outlook.office365.com
 (2603:10b6:806:2ce::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 09:39:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:39:29 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:39:26 -0600
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
X-Inumbo-ID: ee14f73b-f5e3-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NY2A7IxOtkKgA3Hn1goGUiv468LLtofv+O0IGtneZ8Ut4PUtSCnE05EhiHrbR60QOpOSrEEiuEZmvdQVRh/sPUUwTN+uBni8Nwabr4pOQ2Q7r/65Zhtl/0tpieBNbNFKkDLzGCuIsLVFgliy3uU/OP+i8W+aI7AdBHPhdIwSqoV0qjwsl25QKKt2+ZnMxf+Uvsl6KXCvbFgQqGae03F/QRlnZnxgbemYCsRVPaMEjkvD++ixDj2grh7qJlQ9Q/tPSS8FxElTofSyEDPj8gU/beRC/lkYxzvJf7gYINFHhmMZVkvzcWvHIyKSu2l9LSYn6pyj4vDOwHRqaBK46I5VpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTHEOSo1GinnsF6MJncYbd12zNvRUUcGZTNdnJimhAk=;
 b=DnJdIO+1tSFQvZ1sdJGwNSF2z3Q30peUNsNGyog9I/Ob6TSvy5xixiJEEySCCRROYJRaQ5AbFiPifv/SeBpy0jcNRVZNEVrU4NkjXG23ZxNSr8B4pjxwVlnLmOmLZY9iIzy2yIDrSFDPF9YysjzvQhpWAhFJENVIzf+Gh0NA521V/YphTEt1p0uzjoyG3KsdDheXGU1NupL7dOTvgSqnanLy3IR+VFuqBSkeGJc9WplYg4IVwyHlSMQhjeomnGEy1FoPgrid/i62/fDTJ+Sca6mNkB5YekizgfDQc7Xdwzh0+ZXzPzqpJclO9YbghaRpUyDp1MLSI+E7+r+//aomRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTHEOSo1GinnsF6MJncYbd12zNvRUUcGZTNdnJimhAk=;
 b=FPtPtRcfL7NQNgjfK1gy37kcN01zli9wEvN1V+9V3yM4iEZIsrDpnMkQ1EHVzC/vvC3xZdmHufU2kWXHNUutqzWZ7qv5SPyKynk0BxN7D3/WN8fh5cvn6Rb8siVXd5lefJ4n7K2K1fYOMR0xRhx4h7dRnMJhXFgFPTn6OCiv8yo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4 0/4] Add Kconfig option to remove microcode loading support
Date: Tue, 20 Jan 2026 10:38:45 +0100
Message-ID: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 536b3562-30a4-4616-693f-08de5807cf1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u67qK3bVuUqqvIHaTJLlqrL5t6zdpZJ5nEpnO5sMkPwK5ne40KSJItvS+niE?=
 =?us-ascii?Q?ZGSnfjLXAHV7opQHU1MFDR9LWTxLBaPBulP7rbk0JH1rAMLAFzMKbyANwR/h?=
 =?us-ascii?Q?g71sB/y3p/84zEad+w3JYrhTZus33YRSpB7QetikquDKpeNiFSxRYR5bGo7a?=
 =?us-ascii?Q?uxEYTsQxZgabNBznjZyiZy78mz1IEh98bNZsk2Hgrfs1nC8RLpJ1vtvnfcsL?=
 =?us-ascii?Q?hBX7ikIEBckcKVur4BB7vubAU4NLUY8wFrKrxeDqNsW3v7BuZL1kzWsWhRyh?=
 =?us-ascii?Q?3+8kBi3YEahKDoXYJ4yZL/MI7tdV4nJhaMPR+nfsf6h2mKT73uBBwuLUPKEN?=
 =?us-ascii?Q?Fsr7nJ0ZAEbm2mtdS3TMMuv6bkmn5ik9h7APJHaW6C2SAEfTOBwVhL78jWm7?=
 =?us-ascii?Q?vvmVjAi4natWjHmvoR8O0DhuIbMejETLfuN9LUgR7Idt4NF4mi3ntafYS4eo?=
 =?us-ascii?Q?ogBkvSj5V4yyEdrxGIdI173eeGD67yQmMinroi5Fa9wo7LHYaxWsEAuQcxuK?=
 =?us-ascii?Q?VAlodH4eC81zFAofq6oq2UoKZnJ/+H4Hp1dxty39h52mK8PriwPmZ4nHEncy?=
 =?us-ascii?Q?+6GVDqcnJwHhKWciCXsSQSIlFjmf+1V1l6grZZlAj2InnDtbXaweFNrtxbSI?=
 =?us-ascii?Q?fayG2sPEtATXWiTMKuAI3o6sY3lgDjcaSNp3HhOJdVuqkW0a3VoMnDP4OhZ0?=
 =?us-ascii?Q?Wqzqqas85xtm+3LM/0/1a6KxQSvxm2GZ8jRceEPWvIWac2Wh3kcljqyz4lHT?=
 =?us-ascii?Q?uGqVmk0xDxZMqEemUckAq4j8/4XS0+F0LgfO0kav2rSGQ1qE05JA2g1CVri/?=
 =?us-ascii?Q?f6v569n4Dfzi/yXioy1bG9OEXxLz4KpZQ800oWuNW+eoNs4Q1LeLsYKh9uHN?=
 =?us-ascii?Q?zqpOW/pdKM/lsNIOi6QrjFLFXJS/KbrVAxuMRjr+5GaAcO6WV3+5OJdg18FM?=
 =?us-ascii?Q?TXocRWS69W29itjLBCw0A4RET/dUM5YcmUN+nEgtBl3jRSTp+aZPXL7hmcAq?=
 =?us-ascii?Q?N0IGURZRl6Jyau59XcBFSQ4/cad1y6uZYE+AdpfcRsZkow2OwOkcVJDHHI8X?=
 =?us-ascii?Q?g4S6zSIf/RiPnlmIBRLrO2ySiDODvVIHLjzZbsfDiIl1NlA7XyWDHEMoWoUg?=
 =?us-ascii?Q?wttRGJz9/B2xolTFhB1CF+M9dT0vrTTltVuNPZ5JKeECQfPO1mrYK8NoyQMz?=
 =?us-ascii?Q?U/QW1Fe5V90c71+RvzYs/BquCBtAUEPvI6V3txqP9IIl9D52vwBXYwwBqE4s?=
 =?us-ascii?Q?XemDrSEb66tCPtp8G/DPgYA4+lmz4ZXJwPdAEBRrE+UxPlXoraO6SdvO7TsZ?=
 =?us-ascii?Q?7Od7ewzXUBZ4Y+MKl/KYo9drFAcIM1YSyXfvdI+iMElqYNxrOl8T7HbBLHwc?=
 =?us-ascii?Q?uz+hcMPot5zf8Q92fZYWLuSSYMndrY9Qh1drtQouNPw7OseVegW4x/6hSYmd?=
 =?us-ascii?Q?XaeLVWRePdC5rWsOX7EAStai4rEIEIYdD4VviO0TQg2ICujJP9FfudgSDZRC?=
 =?us-ascii?Q?c2g9Ylux7t8YHwzBzV6RvbHI0dTEWPqiTyxOnWfFTIGMuPzBU31r2nFiFiS3?=
 =?us-ascii?Q?9r1GDSwuaXT+STtJqHSx4UGetH+X+eMUuqQ/KtbtXTRWwdr6kcpkhsFCZyX9?=
 =?us-ascii?Q?jBptBLinZH4m6IkYfpGY36jfFE6mYSMAP9dbxDRpz6kQxjdchuZ1T69lAAlW?=
 =?us-ascii?Q?ZdgTVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:39:29.5423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536b3562-30a4-4616-693f-08de5807cf1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938

Hi,

v1: https://lore.kernel.org/xen-devel/20251112162219.226075-1-alejandro.garciavallejo@amd.com/
v2: https://lore.kernel.org/xen-devel/20260112150259.74535-1-alejandro.garciavallejo@amd.com/
v3: https://lore.kernel.org/xen-devel/20260113122109.62399-1-alejandro.garciavallejo@amd.com/
pipeline (red, but see below):
    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2272127547

Pipeline failures are on ARM builds, so clearly unrelated to this. Also has
an eclair run on allcode that shows no new failures in earlycpio.c.

The only dependency here is patch 2 going in before patch 3. Everything else
can be freely rearranged.

Cheers,
Alejandro

Alejandro Vallejo (5):
  x86/ucode: Add Kconfig option to remove microcode loading
  xen: Allow lib-y targets to also be .init.o
  earlycpio: lib-ify earlycpio.c
  docs/misra: Remove earlycpio.c from the Eclair exclusion list.
  automation: Disable ucode loading on AMD's analysis run

 automation/gitlab-ci/analyze.yaml      |  1 +
 docs/admin-guide/microcode-loading.rst |  2 ++
 docs/misc/efi.pandoc                   |  2 ++
 docs/misc/xen-command-line.pandoc      |  7 ++++---
 docs/misra/exclude-list.json           |  4 ----
 xen/Rules.mk                           | 10 +++++-----
 xen/arch/x86/Kconfig                   | 14 ++++++++++++++
 xen/arch/x86/cpu/microcode/amd.c       | 16 +++++++++-------
 xen/arch/x86/cpu/microcode/core.c      | 15 ++++++++++++---
 xen/arch/x86/cpu/microcode/intel.c     | 11 +++++++----
 xen/arch/x86/cpu/microcode/private.h   |  3 +++
 xen/arch/x86/efi/efi-boot.h            |  3 ++-
 xen/arch/x86/platform_hypercall.c      | 10 ++++++++--
 xen/common/Makefile                    |  2 +-
 xen/lib/Makefile                       |  1 +
 xen/{common => lib}/earlycpio.c        |  0
 16 files changed, 71 insertions(+), 30 deletions(-)
 rename xen/{common => lib}/earlycpio.c (100%)


base-commit: 7b3e1b4e848d34c9a5b6634009959a7b9dd42104
-- 
2.43.0


