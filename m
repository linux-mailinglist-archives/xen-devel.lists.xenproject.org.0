Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A7A81D6C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943385.1342182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCa-00057B-9I; Wed, 09 Apr 2025 06:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943385.1342182; Wed, 09 Apr 2025 06:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCa-00054S-4p; Wed, 09 Apr 2025 06:46:24 +0000
Received: by outflank-mailman (input) for mailman id 943385;
 Wed, 09 Apr 2025 06:46:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCY-000466-CA
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:200a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5394f18a-150e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:46:12 +0200 (CEST)
Received: from BN9P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::21)
 by PH7PR12MB9152.namprd12.prod.outlook.com (2603:10b6:510:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 06:46:05 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::c1) by BN9P220CA0016.outlook.office365.com
 (2603:10b6:408:13e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Wed,
 9 Apr 2025 06:46:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:04 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:02 -0500
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
X-Inumbo-ID: 5394f18a-150e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJa1cV9WkhAqsWt4EzY5pSQsbL5h8ofIZnz1l/sXA89zkycC8BxdImebzmW28t6mOSSHow5C/KbNw0v3NQDYGlCbCnMhfIQlAKbtt6s66/85Sy4GYcwCshQFuUqdsaUvc3CfbNhBWj1pMfYsmHh7VYz1cciuSeUhw0d8rDYDQGKNbBRoD1890L2hs22tTBnQrJpaS3sqAn/E/pcWORYoAH2JoZk3BuJaKzm5RetaCCMwr13laMTEJQermUiRxdhkfk8aLcnUKpyBqoLUXBHmpbXnVh8Tdpz3gzgIZ/u8e8UttKhEGAYk43e7N82Itb70hcjC3NXXbUpvMBTX9FevMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMgY1Y5/5gM2dTkAPzGu49VcWk2pghTKDCEmBMNm3MM=;
 b=j8ODDE2vfR2iHznqAeR6DmQ4ZP3n2FG07AdPkSVhuxOrL5nW1dkETWGXijys5RfbH2EPdknl3I6EQ4d1KOq3wdiLNuHihgyWYipXz/nJYVGP+ZkZlaSx7S042YHHDueyKDTi4esQlq1KeG0Llbm/ewx+XFyJVELMkkULn2CWsVic7bQrGr1/k/pjMKrebq+Cmb8MRD8q3QE0Ka8kJVypYb4wom9wmvw5lDVyaGmW+dY7PYKnGqXToaJPuYxTFU+EH/WKweRL68FzmUilvV3cNA4tRi5IkrEDRG9qcIV0nie9v5croMnwObH45dfScCvcWZPpQrQ68N7s3xWPo6Cuwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMgY1Y5/5gM2dTkAPzGu49VcWk2pghTKDCEmBMNm3MM=;
 b=X5yNrbmsZdbLFJTZzmkUtUQtJqkWCx1wM33LbZ3VC4zmXvdx4L0rxDsKeA5XyYokRcy5pMqq3wjQK2PhApfntVP2F8SYknASitAkhmNT7HegvSEaCx5WuaNNixz5FKXuXRrshIYZ5vdFuXFR580RooaoB8jiZWaOkvaOFoSulwQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 0/8] Support hiding capability when its initialization fails
Date: Wed, 9 Apr 2025 14:45:20 +0800
Message-ID: <20250409064528.405573-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH7PR12MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: c4171035-3662-47f6-fe51-08dd7732335b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MG5yZmI5Z3I0Y0lJcjFoSVViMkM5S0VsWnJCWHN5VjJLTmMvTjVROFgzeGh0?=
 =?utf-8?B?RmwxQ0lnVDF6TkFBaVpzN1ljcGk0Ym5iUFExaGhkdVlTNEg2cGlPYlNwVk9k?=
 =?utf-8?B?eGlrMC9iaXFSSTFSTXh3ckFiaTZBTGJJM1orSHhVNFRhQmhqR0h2OTFBYTJ6?=
 =?utf-8?B?YkY0ZUFFSmlPVDR3TDlwR1V0UnQvM0NxVnRlMjdEWjNIeHFGUlJMVkRmcS93?=
 =?utf-8?B?WldqcmdzTkVsRytBSTc2dGx4RzhkL2RTT3NqZmdqTktLVmJkbHI3b3pVcUpF?=
 =?utf-8?B?YXNJOGR4bG1zdENQZHpFWk5XR1RCRkhTRFZ2WFZXYllaN0h5em9UZzkwUFZ4?=
 =?utf-8?B?dFRodE41bVFBcVlxZzl4TzIzemFUOEN5YTJFbWloblpyRVI3MFYxUnUydndz?=
 =?utf-8?B?eWgzM0pHNXBna0R2WTlLYmVzSVBPK3htTDRaT0dFM0NZQW1IZ01LaS9wV2NQ?=
 =?utf-8?B?b2xJVTNFZm9obS9HdkgrNktoRklVZzJCOVluWWR5VHFLOW5NMnM5WlpyZFpN?=
 =?utf-8?B?eVJRb0kvbkpraGx1cGtaNzROcjFJZGRBeDNoTmtwS1ZGQ2R5UUtnalROSW55?=
 =?utf-8?B?VFNOY1JaM3NaNFJ4VlBBQ2hJdmJ4SE5XcGNnTU9pQUNCbHUzbnZaRzJYZlJE?=
 =?utf-8?B?TUh1RUt2anZzUU90OHp5Y0U0MTVIa1IzUFJsZUk3QXY0RGx0OXZ2WiszaUl4?=
 =?utf-8?B?YzV5VzZ1ZW9lNEpWZFNRZHVraWNoK0RSVHh5MUJTbHBmTjhtK1hqNkpBN2sr?=
 =?utf-8?B?ZGxQc0Z3dUNHTnFJVDdFditYcXNrUTZ3aDZZd1dWR1d1dFNhZ0RUQzJLWmdi?=
 =?utf-8?B?dzVIcklmaysyVTRTYjJzNi82dmZOWUJHci9nL0hCQmJpZmRBTzF1cm5HOWdl?=
 =?utf-8?B?MmJEN2V3WTVuUTFLQ0RBVEQycTgzT2VxdjNwU0grdDVGTXFkREpETk5YdnNq?=
 =?utf-8?B?SXAwd0s3eXY1cXA1TDFaa1pmQXhINUM5TE13NERremYzSjBGMHFpS3V6S3pn?=
 =?utf-8?B?NXptOE1IQzg5OWgxV2dqblY2UjdGYVNHUFdQTVJuWlVBYjZRaEJmdFMrcG1G?=
 =?utf-8?B?K0RFaXdCeitwMVVYaTFwNjVOTE9CNWNRcFZyb2N5VDZuczJTcDd5OWN5SzFr?=
 =?utf-8?B?NlBVSEJGUUdlbnhJemZpdU9JTmhtcnQwam1NVlFFRzNSalhXajBPZ0JSTUxl?=
 =?utf-8?B?NWJBdGV3V0xhbGIzYUFlS1ZVS3ZUNjA1L0h3c25VMmZSVW5uaWdKWDIzcXBP?=
 =?utf-8?B?dFdDVWRZQUFBZnRTVHZrS1hMQ0lid2RidWVNTFp5UTVCanlZY2tUdjlJRHV3?=
 =?utf-8?B?d3ljSFhXblA4bjlOZkVqZVY1bEFWVkwvckFjOUxXL0ltMVZITnhaSzNZWFlw?=
 =?utf-8?B?dGtTVDFCWWtBdWtUdmhxYmVQQU1qTGZlcm1hQjVZV3oyTVdtb0xLak1tZldh?=
 =?utf-8?B?WjBXWVk3OXdsZ2ZpNExXc25DQVJoM1hxS3FIM2U5SjFoTVZqT3hWRllicnpz?=
 =?utf-8?B?OThMVVY0WGp2ajViZEZwNHQzVHZwMkt1VkZ1TWJOa0pzMnJrREs0bWJmWFZu?=
 =?utf-8?B?R2FqUUlUSkxBS1EydkFxTGZzakVaSXNSUGs1Ly9mTFlPL015anlmekxDNTBS?=
 =?utf-8?B?NDdZVU5BQklrRVdDVW5rTVBDanlDVTlYUktWbTBJTC9lUGM4bVZpUkIxdW54?=
 =?utf-8?B?M0dmcytmM3lsWG4zdmV3OEtjdTBKZFlWNCtMT1VOcUFwa0ZVRjUxbk1sVUFz?=
 =?utf-8?B?TjJYU0hlZU5DVXZEU3lyazBGRzhjVjdqU3c3VE91MWlVN3JJb0VlUExEdnlN?=
 =?utf-8?B?Z29QTU0vem8rZzRNTGppR0FGRjkzZjk1bzZOMS8xN3ZJL1lrZU54TzFZSEI3?=
 =?utf-8?B?SlhGS2Jvd0QzUjlIS3R0bkptU0ozWWFnV0hkMkk2cm95akowSmpoajk4cmhD?=
 =?utf-8?B?cEVDNUxPS0FDaWVvZy8yTlBldHNCK1ErZFdaTUN1Rm1KSEpwcUEzbC9yTUNw?=
 =?utf-8?B?MDZoUE9zUjYyWUIrSHdIckcySllLSzdES2g0KzZhRFFGdnJKbGhtbFFjdExj?=
 =?utf-8?Q?L71RvF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:04.9746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4171035-3662-47f6-fe51-08dd7732335b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9152

Hi,

This series is to
emulate legacy and extended capability list for host, including patch #1, #2, #3,
hide capability when its initialization fails, including patch #4,
remove all related registers and other resources when failure, including patch #5, #6, #7, #8.

Best regards,
Jiqian Chen.
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
Jiqian Chen (8):
  driver/pci: Get next capability without passing caps
  vpci/header: Emulate legacy capability list for host
  vpci/header: Emulate extended capability list for host
  vpci: Hide capability when it fails to initialize
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Remove registers when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Add function to clean MSIX resources

 tools/tests/vpci/main.c           |   4 +-
 xen/arch/x86/hvm/intercept.c      |  44 +++++++
 xen/arch/x86/include/asm/hvm/io.h |   3 +
 xen/drivers/pci/pci.c             |   6 +-
 xen/drivers/vpci/header.c         | 180 ++++++++++++++++-----------
 xen/drivers/vpci/msi.c            |  49 ++++++--
 xen/drivers/vpci/msix.c           |  67 +++++++++-
 xen/drivers/vpci/rebar.c          |  27 ++--
 xen/drivers/vpci/vpci.c           | 198 ++++++++++++++++++++++++------
 xen/include/xen/pci.h             |   2 +-
 xen/include/xen/pci_regs.h        |   1 +
 xen/include/xen/vpci.h            |  30 +++--
 xen/include/xen/xen.lds.h         |   2 +-
 13 files changed, 461 insertions(+), 152 deletions(-)

-- 
2.34.1


