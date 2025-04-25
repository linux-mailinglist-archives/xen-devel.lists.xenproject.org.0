Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CBA9CCC2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968262.1357919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ksr-0006RR-Ia; Fri, 25 Apr 2025 15:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968262.1357919; Fri, 25 Apr 2025 15:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ksr-0006PC-Fs; Fri, 25 Apr 2025 15:22:33 +0000
Received: by outflank-mailman (input) for mailman id 968262;
 Fri, 25 Apr 2025 15:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8Ksp-0006P3-Rs
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:22:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2412::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1955c1ad-21e9-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 17:22:30 +0200 (CEST)
Received: from BLAPR03CA0143.namprd03.prod.outlook.com (2603:10b6:208:32e::28)
 by SA1PR12MB8600.namprd12.prod.outlook.com (2603:10b6:806:257::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Fri, 25 Apr
 2025 15:22:23 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:208:32e:cafe::5b) by BLAPR03CA0143.outlook.office365.com
 (2603:10b6:208:32e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 15:22:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 15:22:23 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 10:22:22 -0500
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
X-Inumbo-ID: 1955c1ad-21e9-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKbDnYk7gM7+ziPsw8ypZcp/uRKuhg2ElfDDbXZdqczhMI9HtIDUotv3hnXrexHBO6GjS6X7mWX4AfcDxhgwQVVysxvUd8oWfEwEJGmoY9SDNgyiN8Mg0Nd6Bfr7pWBOaNM6dRyMZAUIjayf4d+vW0kUQtaUAt7oaKgR2yxq2xHHnAv5G70ZdFTqP/KRfRINnHOvXGMFlues50jS3eEM+LEQEL4gTNPOK50OZRpQWpcd9Y+Ym3RwPET044UWFojLbDn2D9ot27+RDqx1gAqLT5SNOjJdV7ThO4Pk0a+HTX2KvZekx2EJLnp+V21Qsh1Ntsw4bDyUNt27j9uHrOGpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtI2W2IgT4q2vABA7JthLVQLkC/UPM3zKWRx5ppodnI=;
 b=fFkX8l2EwckaoxBXw/lGWz7k8sEChxBorM2q9PWNxA6M8QOYgDN6voGHCtOi2YYRHsGjc8gkGCT30tZKHQS8C8gFQ5FLmJmAcA7XaA1z1ZIPWgwKlYbz9BfLqypnN3Qzp7DERUHL43W+zgGiNcWoZG0mrPuYvW37KRa4/SgRjvgGhykslu0xxMKrGIM9Rpf9xeqWGjbHW4boyOBxK3pbycQHMBEMsJ0UJUC3eAa6lgsgwVPt3xk28uEmDxnD1mrWXvflwI5G2c+lh1WBgbNPlLVRpZWDm3mxLMaWZnN05Y/xIc7nlNis/4jSNAqIUQwsdGaxqAg6PvJ4h+TvhNi9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtI2W2IgT4q2vABA7JthLVQLkC/UPM3zKWRx5ppodnI=;
 b=lkkWeJP8htfUpfAhcR+MwJragf8S7edncjeiQc3whSyc/P//Oe1RPIKrT8OXP9l3cdqdA55f7+TT8ZtSFJ86mWunYfvd15lPeqmOZtJMECUqQr182+1EmMIiITrSzctD3nEqOks8eUSDcOo2kLvn8KNvWqRYQW+JiF5O1oRxJEE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 16:22:21 +0100
Message-ID: <D9FTMDQ501TU.1H73IHNYGWKZH@amd.com>
CC: <jason.andryuk@amd.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC 04/38] x86/hyperlaunch: convert vcpu0 creation to domain
 builder
From: Alejandro Vallejo <agarciav@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-5-dpsmith@apertussolutions.com>
In-Reply-To: <20250419220820.4234-5-dpsmith@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|SA1PR12MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c43e89-2779-43a6-116b-08dd840cfaaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFRFVngxMG1DWVVTRys4Q1BzVExxY2syeVFnUUlaaEUrMWZDbU1KN2cwNERQ?=
 =?utf-8?B?MDkzdEZudGpzTXpiQmVmTUZlWFg3bWxJb1V3Y0tWUVNsbEo2YUpQamJ5N1NZ?=
 =?utf-8?B?bUx5bzViL0FqNU0zMkg0VDBmdGpMVTNlTXkwVEQ4Rm43RkhHckRtd2NvSE5z?=
 =?utf-8?B?RXR4aVJGMmhEOTJrZFZQQVN3WWtPRXpFT1hSbW1CcHJtZzIwR2NEVjdjUVlS?=
 =?utf-8?B?dmY2MCtmMW1wcmZ1MWNZaTVIQi9sUksxUktGSnFTOER0ODhvVWtEd2NNS2RB?=
 =?utf-8?B?MjR5WDZrMjZqVDJTZllXRmhjWjhCTjdrakh5RW14NXJ3ZjlhM1JidHF6encr?=
 =?utf-8?B?Y1BLMHF0OFNpd0JKMzl6dHQ3SG4rRG9ERmwreVRCUk8yTlh4VTNSSUdPd2Qz?=
 =?utf-8?B?M01mZVVjRHRGRHNiUGFLU0E4WE1LUW85a1JRWVd0L3R6TFN3NlpKaDVLWHJW?=
 =?utf-8?B?djcyNml1MGF3dFphckNFYTlyVFJmQzRacVRFWkQ5U0Q3R0sxdVJwVFVlVkg1?=
 =?utf-8?B?V0dIVlRqYWZvdURyZFNqZWt0MEt6NFczb1hXTjVJbW5UUklrbnp2T3d5UXY4?=
 =?utf-8?B?K3FJUXBOZXd3dS96UE5FNzJWelNvVGdPeXhuMHBXWFRHUk5qeUVUMFdUWjRK?=
 =?utf-8?B?eThFS0RsM1hob3lNZjg1d0h2U0RJZVBwekoxMktuQWhacWttU1FLdDE5cWZJ?=
 =?utf-8?B?RkVwMStJa1J5Yk5MZWM0ZXVsZ05sWnpqY3FGVy9zaC9ZR1p2UktNaUFOUTNi?=
 =?utf-8?B?cHN5UXZ3akRRWHJ6YWt4NjFJZW5zd2tsLzFHQTVlK1JBZUlOQ25ZN0wrSjhw?=
 =?utf-8?B?Q0dON3BNa3d3U201YUZkNzVZQmkzOHFRZzh1Q2F3eFpHYXFZSkY5czE2R29N?=
 =?utf-8?B?dFJFNkQ1YlNZdEJseTg0MHdkQkZpWUFRRkc3TjJweFhVZmhuU2hPeTZwRTVS?=
 =?utf-8?B?RkdlcTRzclo5RmV0eXIySVVKRG9EczdYUUFacGgxWTc2ZTdjb2tzRGhzT2Nu?=
 =?utf-8?B?cjM4QjF3K3V6b0l1bUpvZkZwZmhZODF0SnIyaXV1NVRJaFd2cXE0WmkyRXVD?=
 =?utf-8?B?RmFpa09lNHRTSlpIUHVUeXFmcmltVWYzM3E4UDliRzJ0blVEQWphZGpZSGt1?=
 =?utf-8?B?RllSQ1lkNUtPMjhEaTNQbE1TWi9oQmFsQXlpdktJOStYelN2d2lSdzQySklv?=
 =?utf-8?B?a1VMRjhsSXpvb0Q2YnZVeWhYZC85ckNYRDZzdVJEVm9XczEvdTRicDNEdnJ1?=
 =?utf-8?B?OURadDFqa1VQZXhUdGJBVUdlbU0yc2I0cEt0UTJQRmMwZ1pqTWlXTWNPUHBD?=
 =?utf-8?B?OGVJK0RkWVJoUFNjK0FQK2Q4VjVyV0RtVEtoZkZMeVpGenQzYVdENEpQRUEy?=
 =?utf-8?B?Nzl6Rm10TmlXKzNpeFNkOWczUkNDREQ0RXlRb1IzcHRMQXJjMTFXc2cyVExR?=
 =?utf-8?B?WFBmRkVVQmtSdm9DYzNyQjA2NUdHMGFaUXlrcVE0akNXVklsbnJQdFBuUUlo?=
 =?utf-8?B?elB3UEVUM1J4aER3aWtMd2Y1Sy9wQW91ZU5ycCt1QUN3N0dxOXljUzNVU3pu?=
 =?utf-8?B?WCtHdW0wRlBYTFJPZ1c4Y0pvaE1tNHI3Mnk5ZDBEU3Nyai9MY1oySlFYSW5q?=
 =?utf-8?B?RU5vV213NVdMTE1xMzhwZjY4dXVtTHVSaitUa2g5RU0yYU9BTTZ3SWZNTVpG?=
 =?utf-8?B?MzhZMy81L3VOT2lzdkdFZ2FvSmNCWWNGbjBhUW85UjVDNWsvbFlBa2pLZWhE?=
 =?utf-8?B?TWRoZHE0emw2VjBYZUhiQktrYmJaZHF6UFI1ckZjUndXd3I2TUtYeThFUUJi?=
 =?utf-8?B?Y1lSOVFsYW1sVU4xZmtsNDhaaXlMQ2Z6WkFrdzJnU3pzNzhjU2lXd3FkNlBp?=
 =?utf-8?B?RUFQa1ZpaGs2RmZEdlBpKy9jWWozM0I4MDNLNjRGZWpiYVRJLzdhckdHT0dy?=
 =?utf-8?B?bHRraW1vQUtIT1cxMnZSWWUxMWJYZXZsNHQ1dTY1UWhoVzhVdFpZK2JLQ29p?=
 =?utf-8?B?U29wOFRFdWFkZWdEL1pQSHlkTDh3V0xWdDZzeHVCTllraUo3dWM1VmEydGha?=
 =?utf-8?Q?69YYv6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 15:22:23.6260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c43e89-2779-43a6-116b-08dd840cfaaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600

On Sat Apr 19, 2025 at 11:07 PM BST, Daniel P. Smith wrote:
> Convert alloc_dom0_vcpu0() to dom0_set_affinity(), making it only set up =
the
> node affinity based on command line parameters passed. At the same time,
> introduce alloc_dom_vcpu0() as the replacement for alloc_dom0_vcpu(). The=
n have
> alloc_dom_vcpu0() call dom0_set_affinity() when the boot domain is the co=
ntrol
> domain, otherwise set the affinity to auto.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/x86/dom0_build.c                 |  4 +---
>  xen/arch/x86/domain-builder/domain.c      | 11 +++++++++++
>  xen/arch/x86/include/asm/dom0_build.h     |  2 ++
>  xen/arch/x86/include/asm/domain-builder.h |  1 +
>  xen/arch/x86/setup.c                      |  5 +++--
>  5 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-b=
uilder/domain.c
> index f2277b9e3cf3..619d36ea0b87 100644
> --- a/xen/arch/x86/domain-builder/domain.c
> +++ b/xen/arch/x86/domain-builder/domain.c
> @@ -9,6 +9,7 @@
>  #include <xen/sched.h>
> =20
>  #include <asm/bootinfo.h>
> +#include <asm/dom0_build.h>
> =20
>  unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>  {
> @@ -27,6 +28,16 @@ unsigned int __init dom_max_vcpus(struct boot_domain *=
bd)
>      return bd->max_vcpus;
>  }
> =20
> +struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
> +{
> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
> +        dom0_set_affinity(bd->d);

Similar as before, this probably wants to be DOMAIN_CAPS_HARDWARE?

I'll adjust while rebasing.

Cheers,
Alejandro

