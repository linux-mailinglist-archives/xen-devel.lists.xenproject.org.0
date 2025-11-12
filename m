Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9942C535C4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160303.1488493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcL-0000gl-CE; Wed, 12 Nov 2025 16:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160303.1488493; Wed, 12 Nov 2025 16:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDcL-0000fG-8C; Wed, 12 Nov 2025 16:22:45 +0000
Received: by outflank-mailman (input) for mailman id 1160303;
 Wed, 12 Nov 2025 16:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJDcJ-0000RL-Hy
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:22:43 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf9992f6-bfe3-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 17:22:42 +0100 (CET)
Received: from BN9PR03CA0204.namprd03.prod.outlook.com (2603:10b6:408:f9::29)
 by SJ0PR12MB6758.namprd12.prod.outlook.com (2603:10b6:a03:44a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 16:22:35 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::55) by BN9PR03CA0204.outlook.office365.com
 (2603:10b6:408:f9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 16:22:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Wed, 12 Nov 2025 16:22:34 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 08:22:31 -0800
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
X-Inumbo-ID: cf9992f6-bfe3-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWoddzX0nL/RtPDkX4fGkha15irCHr8QiqGhyb9X9InBHYZktYCybDYm+W3D3RxOZIAFZlbs5F58XM/tu/56tdxFW6FpLBJPTeIH57Mp0TtqoyFc8ZP0dUQ6TlSulq6uUrQblJazJ4zfAa1pdsEnQkiK3Mr29VMGpMwrwuGknbd9H8IJrDJ1Wvp7dgtyjrHeU4OUXeeOyamRShuZ4yTZx6MdV3AmfEbp3uRJ0dQpQ2fL2h8kZDo2SgHWCnrJchQC1/iiL5URleS6wKHSYMip5U3jUds0QXQO/p6eAZ2N5q/ze7MJlD9rf5lA3dAemE1xNVBqS7uhfMURM7jCY+Sggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Loe3auNsQGtsQe4VcnZlToVD2AT8r0kPmm2eVxOlhk=;
 b=clog8pkVJjIrb7UJ8xkvSeSNSIRyWTmcSYCyTue3Tkyq0Q2PDxoE49LkVePELQ0t28ThUauzL34do1hg10HMR0qFdTLZ+2iJZwbXAD5QC5+qp4Hg4Pkawc29eV/03LVH9El6oL/z6GWwuCwVoCddqHqcJemkibyc4VAR69H7y9Jw7NL5yhio1Ga2TBbfUZPSiAFTScqgfpInd+YWydEvwGcS8Wzeon3SwgljbHWcmAcr0avARg10fjUyeleVlZoBzIyLbBrulFFv7eXMzKbXtjCvpcX2GrBRwfSdEfV+co+wnwCDHMK8MykvD0IgegB3Ip2G3SaoJOAKB/O9buIeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Loe3auNsQGtsQe4VcnZlToVD2AT8r0kPmm2eVxOlhk=;
 b=a0vNrh8NWuvYtXmINn4rAQcLu66ezWLCrE5CubS/8FQPq9BtKox+AkjNtK1uVvkpgw0zheGjldXWss+T0yeG5hrf6VTikfDzlPGqUSD3/Jk/rNVBkDLa6QE7tRUJ4Ofd2TpVVTsu9UlBsXz5fGzo0l/6tT49+zcOo6xonWb1LHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH 0/4] Add Kconfig option to remove microcode loading support
Date: Wed, 12 Nov 2025 17:22:13 +0100
Message-ID: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SJ0PR12MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a9dfec-2edd-4c67-522d-08de2207b03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/QuRt4Rfc6IdGMyiJT3RZsHSpI7yzNj5UlZlw2bH1XOsOMU2fMRycHEjL3tJ?=
 =?us-ascii?Q?mPQY0otZr4pKNcsSNnJw1JN7GAoQG2CSG9tcXqW79LjVin1lvQqo8ircSXnL?=
 =?us-ascii?Q?0vNeK8HzOuL401CC56Pa5kAtpanMieg379kprk2e/qu+t3AC91zCe29OfhB0?=
 =?us-ascii?Q?dwyhvDex8S57uKwzGJE5vD/JOMlen9hq4FOGAP6rd3xOfjRG1/EZBptP1Gz9?=
 =?us-ascii?Q?8IndUCtIh/nXrkrSPq8vOK4B7QlLhQENv7H+/1DnVeH6XhP9rf5XHX0GnVLh?=
 =?us-ascii?Q?jmdcXHj6yfilqkX8+wKDBTUB9a5lYCdLg1g3yULcAwdRp9k80lEPB75MWwsg?=
 =?us-ascii?Q?k573MipzC3Cut0Qn//+XGMSy2LIpQm1AdUPQPJ1ZsyDuf2P2lI5k4vtgNlgy?=
 =?us-ascii?Q?w4vDpWm5aWiPuLXuYUy+zjYwDsAOjkabCApQRwNGq5OA3C44vf7GMX3NLT8j?=
 =?us-ascii?Q?Sc7UeGX6rpkbT0NL4p4WVB4149ZZCMRFoP36w12ka1+2Vz4+DO/um14WvXSR?=
 =?us-ascii?Q?5xJid2n2r6hKIK+rOe6ygqLU0MyxnIPn5IXitNMN8gyid1zQ+9JXbVmbHI84?=
 =?us-ascii?Q?217yb3ZksZQ8EpZFmcr5zUyJ7A9MGjOcLo3j0PzX3uxDwaJuvxzdphoT334r?=
 =?us-ascii?Q?ILoBjxKGxUaOthL4iWkT7coBWhvGm8yTAgARnfYOM86lri9jzblBtBZ7qmBD?=
 =?us-ascii?Q?SxRMYimhIJwH0y7HI1aXK3PdoWbA13wZ1mPFEvxIWvHXyGHY0o/7hHEcp34H?=
 =?us-ascii?Q?t8E45HdNHvFFNFbaFFYxgzdvleKssJbffHbXXxV4BeVTLnlpDP53gWqG6uY/?=
 =?us-ascii?Q?GUGgeebFBOfhTyk5zuEZYwQEJRIOa4Bw5sCj0k/eFmpCZ0hAR/hgvdqjGlCY?=
 =?us-ascii?Q?vkSQTvGDMd/bcpuIak7s7svCf2huwLusAmC04bURijGYyDTygD3qyCAGSwBf?=
 =?us-ascii?Q?uYsVpmbPIcHNtuXaNwVEB2rI9dEHNqmUZLYOvDfKc1T/pWrZ1MUcbYZ261LC?=
 =?us-ascii?Q?UAygwgC3xZRc7MBeZB39A5Wh20NXDw9n7pYr+DIeHFGIiAsMVezhFl/bdLef?=
 =?us-ascii?Q?b2ygTnHCumnCOK06HWAZ9WqfXj+LA6XCMVvmIOnHavh4p65K0BPwLrhJSK9m?=
 =?us-ascii?Q?3c1OpSNPizEvNmcoMB+wMUKa+oyo2Z7TW/g1Qwb56wpPrpvB7Tz4N8w8Nl4y?=
 =?us-ascii?Q?cxvgJhBg/J4xo70kTMFtq1fiMnw4EO7eIj4sYHP1FbdNWIJ4y689kDTG2TXb?=
 =?us-ascii?Q?0JmBTuabeEgtPTBsgpblDBrEeX96rVcpof0H6iTM4XwYyhJK0nfL0j93RHBQ?=
 =?us-ascii?Q?RoayRsp0z++GawGOjTPBr6+rJJriU4CN+6Ysu69FYnKWWupP7yXuMu509gxd?=
 =?us-ascii?Q?3fhVdqIab9Fu2NQo9FYPOyyaHcC0XtcSZC2vQILtRU8oyy1MI5FH1oJpUNJo?=
 =?us-ascii?Q?w+9hxYkH64bvOS+NMLau70E0pzmrUgpsNx+3Er/TVavDDUeOEb2f1j4OlwAM?=
 =?us-ascii?Q?4pdg12lt2JC+AkUYS7mQEMh+6Ol1fbeSWVorZNdLlOb+XMyePVMeDiLNCoNa?=
 =?us-ascii?Q?U/wuSxwmtrHe9GBK+m0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:22:34.9607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a9dfec-2edd-4c67-522d-08de2207b03c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6758

Hi,

The series is mostly a refactor between everything needed to load microcode and
the bare minimum to probe the current microcode revision.

The Kconfig option keeps the reading of microcode rev data around, as it's very
relevant for security and debuggability in order to deduce which erratas apply
to the current platform.

The idea is to move everything that must still be compiled with !CONFIG_UCODE
onto {,amd-,intel-}base.c, then remove everything else conditionally at the
Makefile level.

Renaming files (e.g: s/base/core/ and s/core/common/) would better reflect
post-series reality, but it'd be annoying for later backports in this general
area.

Cheers,
Alejandro

Alejandro Vallejo (4):
  x86: Split out AMD-specific code to be executed without ucode loading
  x86: Split out Intel-specific code to be executed without ucode
    loading
  x86: Split out early_microcode_load() and microcode_load_one()
  x86: Add Kconfig option to disable microcode loading

 xen/arch/x86/Kconfig                    | 12 ++++
 xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
 xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
 xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
 xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
 xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
 xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
 xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
 xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
 xen/arch/x86/cpu/microcode/private.h    | 14 +++++
 xen/arch/x86/efi/efi-boot.h             |  2 +-
 xen/arch/x86/platform_hypercall.c       |  2 +
 13 files changed, 259 insertions(+), 158 deletions(-)
 create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
 create mode 100644 xen/arch/x86/cpu/microcode/amd.h
 create mode 100644 xen/arch/x86/cpu/microcode/base.c
 create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
 create mode 100644 xen/arch/x86/cpu/microcode/intel.h


base-commit: e00c1673992e07ed31e9c60fefa8d053491abbe6
-- 
2.43.0


