Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CDCACB9AA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 18:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003664.1383257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM84x-0008AZ-3g; Mon, 02 Jun 2025 16:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003664.1383257; Mon, 02 Jun 2025 16:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM84w-000898-Vv; Mon, 02 Jun 2025 16:32:02 +0000
Received: by outflank-mailman (input) for mailman id 1003664;
 Mon, 02 Jun 2025 16:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM84v-000892-7i
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 16:32:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2414::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a9a553e-3fcf-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 18:31:59 +0200 (CEST)
Received: from MW4PR04CA0153.namprd04.prod.outlook.com (2603:10b6:303:85::8)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 2 Jun
 2025 16:31:56 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:303:85:cafe::b8) by MW4PR04CA0153.outlook.office365.com
 (2603:10b6:303:85::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Mon,
 2 Jun 2025 16:31:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 16:31:55 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 11:31:52 -0500
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
X-Inumbo-ID: 1a9a553e-3fcf-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tH+tlCfpCVqB/GoQ0Ts326/R0+b9s881TxocRXkrlwPopKVu2NL1qb/g6LDR3yDG7hiLTueiJKgmiLLKqkYDgG+pFUmP9+hAJHhzZFTF+b9wGor7OdpkyCQaSdQaItpONEZ6cykLnP8i3hnDcQgP5aNkw1xT/Y0NKaU5K2/IE6yQiy/E0eJve1AB8lgEJepw875tiY7nGq1fOBOiv8let9V4vVh4fsBHhXG7jOji+WOi3CljrSVVo1o3bgF2IiL4Z50REqrxreu0iBltGs6mKeFsuhAinZDVM/X11YgnSHmFJ1pQPz7aeVRuL+1Y5XFVhLUg0ioL3SwQ+ffUq+WvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slY+IyKFFQxbitcaY/U014p/ejMGRRzdUKhAgDaPrxM=;
 b=trLr0qodTG4CDMykSD5kbuTy/X/dolx0Nh8fAeGiccpfr2MUH1p5L0N/wXR3Yv0fPjO8ERXNDeCzuyB83XlTGK1KR5wNdLMpLgak3in7oIlKP3NmvdtpHuYAu1TiQROqgrtuFyNASZw40BUnVJvtde111txmnY7oqln5+AYM3trEqWkxwehvrtNJ709XleegpoAlKKsGCg5jUQ+dKduTezJRqMfc1i2TRNQvdmY0ZYUMg+Uz6MneMpCU1WTYOVUvP+W3xbh21QwHOlDftr9Dku8DG2hoIfJgJXutmnEk/nG3uB3UJnFEegFV9abw6e2HfWnPX/m8cepQzO6d7UE/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slY+IyKFFQxbitcaY/U014p/ejMGRRzdUKhAgDaPrxM=;
 b=iq4xfN+n1Vb3mynQt4/2rMEr304OY/ROqCTonXy3naH1gAdvrucC1St2gSS7ZkEVvWawLwgLzQ6ZxjbyQEeslfhnbnAd0+rekWR8vV0Y6OwAJo15S8AYx5U/f0CGTLkUmN6RYYfnYKITLJhdwDAr4gWg25BNCfwfoTJxG3W7xc4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 18:31:49 +0200
Message-ID: <DAC6W9WLECP9.VW50J1E585JG@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 10/19] x86: Replace boot_module with bootmodule
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-11-agarciav@amd.com>
 <alpine.DEB.2.22.394.2505301814450.1147082@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505301814450.1147082@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ff021a-a406-41db-ffb3-08dda1f2fd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1Q4RXRteXZJSldRY3AvaFlNeXNLdVl5UWRQczNhUkt3bjJNVlIzMGErWGVk?=
 =?utf-8?B?ZWJ2cnZJWXF5c2JhakNTSDhRSEN0aVlJU3ptdWdIb1U0NVJaUFJFR2ZtUHhU?=
 =?utf-8?B?VWp5STk2V3BHUDd2TGduTUpOTUlSYmdXSUJ2dElRSGpRYnFSVW1oeWFJOXpF?=
 =?utf-8?B?elJoWm9qRm11anE4U2tYUzZuRE1pOTdnM3ErNWNBaXFPdm9DREowOHl2c1JG?=
 =?utf-8?B?M1kzN3BJZHMwZzNCNkJUejZrd3pXQS9BTW1OQTBJYm11ZTFZWHpaM3B4cjBP?=
 =?utf-8?B?TjlvWEFQaGdodFJNUWdYYkl6NXM5OHpsTWVhdUlPcy9mQ3daOHozSUpsMy9N?=
 =?utf-8?B?NXpNbnNRdXlnVDhyZDZVOWVZWHFTdUlWaHM0WU4rMlJUaFBqcnNDZWlWVC9B?=
 =?utf-8?B?YXlzTXRyT1NkODdYemtDZm5Ga1Juc0ZMbzdwT3p3dVM2eGtTK3RkV1ZmWWJ5?=
 =?utf-8?B?eU5KNGV5ZjREYlAvWlc5ekVyYjgwbUZlakZaUHJEY0RZdSs5NS9EZGhyM3U2?=
 =?utf-8?B?SW9mYW5JTkV1S3pYVU5xRHp6b3ZRZklISmlWejJCMFVlR1Zxbk13SkVCa3ZJ?=
 =?utf-8?B?VGRqV1VHc3R3SWtNMXpwVVZvQk5Hbks5RTBPRGFFa01iZUFZVzhoQ2RyS0xr?=
 =?utf-8?B?bTg1MFlyUkc5b2haVHpPcURLM09MUlJ1bmN6dFpQSlJIZ1hZTW42MmNwOFA0?=
 =?utf-8?B?cXRDUm5iWUxkVko1YVN2aFpNdGx4cGxsb2lkY3JPQmQxMWVDSG1zOG1FdzFO?=
 =?utf-8?B?Y3lDMTdXMXlYTTJydGpCdEhrb09Sd1pWc0JzSmVwQ0R0NUNCWUliZSttdHFM?=
 =?utf-8?B?NkRPMmN1K3o3d3d1TnR0dDY0dEVhVTAxbmV1U1BhMGtaYUFTem00QXUzN1NK?=
 =?utf-8?B?Uno4UzUxc2Nnb1VhVitFRllwSmtEeGt3Q08yT3FWTTE4V1lsSko2RUE2RjVG?=
 =?utf-8?B?YlBVNVk3Y094b2t6Y1I2NWZvTm1yeHpka1lIOTJKUEF1MWt3cEN5TC9DcUM4?=
 =?utf-8?B?bnZwVERjTTUvRkdzamkxYWRUNVkrdDRFVG55MTc2QXV1MFV6Ump2SndUZXpQ?=
 =?utf-8?B?MWhKMWpuVEhBSjBSN2JVUTVnMXd0T1BTd0FWMFFzdUoveHNOWnNuUkhBQnhS?=
 =?utf-8?B?NmJPQTZSMjVXZmlwcWdRanp2NDlmNG4wYldQUjB2Z1NQWDZLcmxEc1Znd2U2?=
 =?utf-8?B?THFUUkpzeWJ0U3NZMkNaaHowMVBjcGhuRmRHejZOWGEzdi9vTkNPZTJPSzZX?=
 =?utf-8?B?RC9qSjZacE1jdzNqelZVcmRpdWNhS0p2NWs0bDc2V1BsdXd6cEdWaGF2TC9q?=
 =?utf-8?B?N1djaVZwVHNJZzQ4UTI5NWxVa1Znc0hUM2I5dmR3dFhYbXMwdW5qb3VQVmhY?=
 =?utf-8?B?TzVwaXlhVDlSR3E4MDdxZ3MxVit2VGdlRmxyZEFkeHdFVThQRmJYQlcwZ1p5?=
 =?utf-8?B?Y0hnVmtmOFRsczVwejJGZmE5TXhURVpDQ3Q5aU85Tlh5RkRIRUliVjdNT2V2?=
 =?utf-8?B?V3NWSGZyc0FCM0o2N1hMMnN6UDJpbGZBSnR5bmJnbkZ0d0lCQW9YNXpVNUg2?=
 =?utf-8?B?MTlKUmVXTVZXemVDSm1NRWV1cm9nTUNXZy8wRGtLOW9NWXRTWGllVUNodmdz?=
 =?utf-8?B?WnpyUHZQMThzNkRDV2lVTnU3Y3RiaVYxSlJFTkpka2JKV25iRVcyT2V5MVJq?=
 =?utf-8?B?eVRPUlljWGxpa01UNmZ5SnZ4N3pMb2RwYm1Wd3MvRFVnYklxakJBVnhVNDFj?=
 =?utf-8?B?MjBhcFpJcHFlMmlucGJiRUVtWkI1ckJZcmlEeUNLVnU1VWJMa3hVRmNUckt0?=
 =?utf-8?B?UU5GNnllU2dDajFuVDJNanhDWU90ayt5TERvaEh1aEdKRlVvSGgrNDF1OE9P?=
 =?utf-8?B?ZzFqa3ZJNU1CNCt0WVhHaFp4TnlENnBjdHI3M05wWkZWaTJ4K0VZOWd3Zm1j?=
 =?utf-8?B?NjU0SmlHK1dSYmVrSFJqamR0TFNmM1ZIL05wcURHS3VsOWlyNnRQWkdRSlZM?=
 =?utf-8?B?SWV2d0NnTzE4SXJLVXU2SWNsd3ZrMzk5MS9ydWE0a1NOWm9NUzNjOVo5d3lF?=
 =?utf-8?Q?hdtcEg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:31:55.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ff021a-a406-41db-ffb3-08dda1f2fd30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913

On Sat May 31, 2025 at 3:15 AM CEST, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Alejandro Vallejo wrote:
>> These types resemble each other very closely in layout and intent, and
>> with "struct bootmodule" already in common code it makes perfect sense
>> to merge them. In order to do so, add an arch-specific area for
>> x86-specific tidbits.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/arch/x86/cpu/microcode/core.c      |  9 ++--
>>  xen/arch/x86/hvm/dom0_build.c          | 10 ++---
>>  xen/arch/x86/include/asm/boot-domain.h |  4 +-
>>  xen/arch/x86/include/asm/bootfdt.h     | 52 +++++++++++++++++++++++
>>  xen/arch/x86/include/asm/bootinfo.h    | 58 +++-----------------------
>>  xen/arch/x86/include/asm/setup.h       |  6 +--
>>  xen/arch/x86/pv/dom0_build.c           |  8 ++--
>>  xen/arch/x86/setup.c                   | 52 ++++++++++++-----------
>>  xen/include/xen/bootfdt.h              |  9 ++++
>>  xen/xsm/xsm_policy.c                   |  4 +-
>>  10 files changed, 113 insertions(+), 99 deletions(-)
>>  create mode 100644 xen/arch/x86/include/asm/bootfdt.h
>>=20
>> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/a=
sm/bootfdt.h
>> new file mode 100644
>> index 0000000000..c00de8c09b
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ARCH_X86_BOOTFDT_H__
>> +#define __ARCH_X86_BOOTFDT_H__
>
> With the new convention this is just X86_BOOTFDT_H

Ah, right. I forgot about that. Sure.

>> +#include <xen/types.h>
>> +
>> +struct arch_bootmodule
>> +{
>> +    /*
>> +     * Module State Flags:
>> +     *   relocated:   indicates module has been relocated in memory.
>> +     *   released:    indicates module's pages have been freed.
>> +     *   fdt_cmdline: indicates module's cmdline is in the FDT.
>> +     */
>> +    bool relocated:1;
>> +    bool released:1;
>> +    bool fdt_cmdline:1;
>
> This is not actually used or needed in this patch?

Bah. This is a later addition in the dom0 DTB series. I pulled it
here too by mistake. Good catch.

Cheers,
Alejandro=20

