Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19CD14CC4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 19:48:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200859.1516676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfMx5-0003lw-Po; Mon, 12 Jan 2026 18:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200859.1516676; Mon, 12 Jan 2026 18:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfMx5-0003kJ-MI; Mon, 12 Jan 2026 18:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1200859;
 Mon, 12 Jan 2026 18:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1UP=7R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfMx3-0003k8-QV
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 18:47:42 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ac9cd09-efe7-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 19:47:39 +0100 (CET)
Received: from SJ0PR13CA0110.namprd13.prod.outlook.com (2603:10b6:a03:2c5::25)
 by BN7PPF9C6E5285F.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6db) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 18:47:31 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::4a) by SJ0PR13CA0110.outlook.office365.com
 (2603:10b6:a03:2c5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Mon,
 12 Jan 2026 18:47:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 18:47:30 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 12:47:27 -0600
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
X-Inumbo-ID: 2ac9cd09-efe7-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3aomvotn7PhLjs2Mtflzzst6dc3d13FN8kncbmWZUVeuF/cFbUgjX6uP8mT8McP+7nvyhoCIlr0CjUQoqDHJ+HXyhlG5LCFJXB7vaR4Avg0RNBEAuJm8zHaRDoxSDWhNkg6k/fEMbSZdDN6lvg7PZsWPgKWxPbpkNHAQLBbdRaAYRvoqLKjGeoU9Ib0HzvoynK3hpgoy0HYTbsRfgDIEiMoAKlSKLcfOhiRUCmSeVSOnU3GOoIGpwVZ4fAlsHOcJ+D+YBCsbtuS8+mNkA7IO1xn5I8U6/D25Z7TbWzUqeJkX8D9RaC+lWEm9tLlhrS5oZRRllI8CkZFlbxZpTwR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cLo5ZJJgR+kUYhxe4pP2dcgzYsXbhOtqolvYjrLMq0=;
 b=K/jqZ0Fx5j5Aajmu5Zc5en/oZjlNstEX1TICgZpVaLmuykz2gGKmyTn1GbuxR0LRUxPf3E5yZhJFhQwzTY/8Osf5OYiRLSGihFMbNuXH3ePsnJ0OMotkk3aaF9Y1x6ffncltMDg0i3/5Qinv+5VsydSFIlTQ8VjE6ijH7l7Su3LiG474aEmxCUFKcb/H0ZlcYkggKGJsVeQEQNMjLtY7EkDFc0zvA9/8oERkzIPW+h02kIO7LO+BRwdVhdRNlpqFT1+yfIVAPG+o1LZbnQwvBuMxbNCKwf0pFX413CZKA40jrdp2E6JIglZtUWJGySK7mg9rfThZS0ERGjIYGIugoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cLo5ZJJgR+kUYhxe4pP2dcgzYsXbhOtqolvYjrLMq0=;
 b=K77cTFgWBXR5rfUdFf2PhGwgmMz8nHykXl0wZdg5g/m1gdhMgYwoANUztFRU3OgxcFKrh4VN2suwq1DTfPXX7xNqNG3xRJEK4t4oGNUrE/vsRmX2r+2MW+bvLfbiM9AK+Hmjp+7UCqmArpIUzraZZqnylG1fbzKO5fVF6K/cmIs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Jan 2026 19:47:24 +0100
Message-ID: <DFMU244K4E7W.6M0TQ5AI1TUE@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove
 microcode loading
X-Mailer: aerc 0.20.1
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
In-Reply-To: <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|BN7PPF9C6E5285F:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e89b3c-e484-4eaf-291d-08de520b0a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkVPanVWK1I0aUlRUTVDYTZZeHhrd1IyN3VOdG5Banp4bWphT0NwSVdETnJo?=
 =?utf-8?B?S1I1MDlva1U4b1BkY2N4MWpiNGFoUzRNYjZBUWhLck0wVVBiS0YrczZRTHlp?=
 =?utf-8?B?ME10c0pYSE11eXgvQk1mSGdPRjdKaW1va3ZadFN2VWNKK0llMmR2emZNUjRE?=
 =?utf-8?B?VFhvQUZGWHlPUmFGQklnN3hubjU2MFNrRVVRUHQwN1U1VHB1U3E1TFBxLzJr?=
 =?utf-8?B?V2ZJamwvMTZEOW1oOXdHcEQ3TkJWdnE1dXMxZWxNem1WVUZ2WHNkMUV4Zk81?=
 =?utf-8?B?TDZuczdiVUN2anMrWWJKWlU2RUplMllCWU1hVHlCcU81MkdWSkkrYXMvU1NY?=
 =?utf-8?B?RTQrM0JPcXlGcTBsTExhdHFDYk9GMGJ6WGNHZWx6Z252dFUwZTZNLzFQRVh6?=
 =?utf-8?B?eDgvYWRHbWhHZFFneEU2QWxoR0xlSldnaDVZbk5laVdlanRla29RMmwzS1d2?=
 =?utf-8?B?bm94SXRBQjcwTDB4aGYyaHVXWmlRTUYwbWZ4Ri95SENMVkorZVg5NGhwRmov?=
 =?utf-8?B?S0VzRGtPRU5xZnR2ZGFxSjhoNWJwWDZBaENZYmNweVRYeUg3ak91ZGlpVWgx?=
 =?utf-8?B?WXlDNG5rRC9EUVQ2UVB5L1Z2U1doY1NOOXNKWWtIV083N2FDMm1HVlhmUkhw?=
 =?utf-8?B?YzRkNDNOTUp6S0dXN3BWbWpOUFRqVlkwT3dUSVFXWnZKUE4zQTdpdGUxRGNs?=
 =?utf-8?B?Ty9nYW5mVWg0a3h0TnRmZCtobWZPdG5lK25ZTXRCMG5LNm5taS9zLzhHaFRy?=
 =?utf-8?B?UWdpWVNaczJZM3hlblEwdzltTXJQa0ppdlRKTDNBUWE1RWYwcHExdjFNbk44?=
 =?utf-8?B?a1dhVTdJdWRUaERjRW9zVy9LQmdDMjZLVHN2SVB0K1VLMDcrR1AzZUNjMWxm?=
 =?utf-8?B?RUFkQTZ3Q2ZmN0p4RUpKWHFCR2ZteGMycGp5TUlVd01DN1F6Y1VKYnlEN1dM?=
 =?utf-8?B?Qmk3dTc1bmFRMGtBMVRWL2IvMUo2NFZNVCtJVW9MRzl0YnN0WjRlakh2OENh?=
 =?utf-8?B?L3RaYjN4bkp6elFCR2Y3Mm1FdXlZOXh5M1J2VXRMTytKTGtZRE5pK0VBRHpY?=
 =?utf-8?B?RzBDZWl0c0pPVTJhdVF5ZmtPVVE2blc5NGNsT0FBOTlpQjFkQXZJbzA4Q2Fm?=
 =?utf-8?B?YzVDYktCNjRia3lIQS9pRkw0OGVsd0haSHdXT3E4MDhPUmxpVElTNXBhd3cy?=
 =?utf-8?B?YkQxd1drK1BRZTBlc2VwTUJuOHpMc3hYWFhwWWs5OWpsREV6aFdjNU5yNWpS?=
 =?utf-8?B?c0haVGIyU1R1T0ZDalc4SjUzSCtlZlZ3RXh0dkNMU2NXTUtRajRBS1J1Ynpy?=
 =?utf-8?B?cWVDRlR4Uk9iNUltdFBKNEpXSmlxdWV6V1UxMHdwOUtWYi9IaUhURXNTWkhm?=
 =?utf-8?B?anZ3L09HN1QrQTlaY3lIbzRReU42Ry9PMFY0RlZiK0t1d1V1N2dHallmZ2hE?=
 =?utf-8?B?d1kyTU1mejFybk9EQVlHZlZlZ1VXY1ZPUGx1U3p5cHN6Z1ZRZjBleDFoNXdm?=
 =?utf-8?B?eHJKWUZOZDhSd05YZGs1UFBmMFg2K3M0VURqYXhHM05JcU1EbExPNVdncHFi?=
 =?utf-8?B?SlEzSlNPblF1NTNQcmk5b1lRWldIUklzVy9uNFhwMkVpMUs1N0lqSlRjc0Qr?=
 =?utf-8?B?bThUN3UrZFMrYWJzMTE2LytjNkRFMlJ4bGVOdkZVZzhpZVR6VS9DNHRja2dS?=
 =?utf-8?B?dG1uZm9rVVRCYjY0ck5wUVZoWFhLK01QOUUyVW5qU3A1cjVabnJxZDV2Z2VT?=
 =?utf-8?B?TDB0WVZvejZIU2ovbFNJTjg4ZnhVVDEvVk93Wi9YL0M3c3FuaWF1RVdTd1Vm?=
 =?utf-8?B?TUJLR1luSXZIelBUOVdnYjMvU0xQVHh1bTVKejRmaGxySEx5aHRBL3RjZVJT?=
 =?utf-8?B?ejRKRVFacy9aanNSY1ptdDRwZnRDbndBYjV2aGhoS3E2RUlKUDdTbUFnRHpJ?=
 =?utf-8?B?RHdqd2YrOGFUMHROT2lJYjRuVjBqMXRkRHlQUktoRFJwTG0wTEQ5WkpPMWpT?=
 =?utf-8?B?cllOdEFzZUY1WWE5clN4dnp2WW5TSWcrUktWTTUwN1pWcVNmU0tsZmVjc0FJ?=
 =?utf-8?B?SmVHUmROL0ZBSC9KNWtZS2tpTXhpNmNaSko5ZWMzV3MzN0tKTXhrZFhRRFZI?=
 =?utf-8?Q?72oY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 18:47:30.4377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e89b3c-e484-4eaf-291d-08de520b0a65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9C6E5285F

On Mon Jan 12, 2026 at 6:15 PM CET, Andrew Cooper wrote:
> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>>  automation/gitlab-ci/build.yaml    |  2 +-
>>  docs/misc/efi.pandoc               |  2 ++
>>  docs/misc/xen-command-line.pandoc  |  4 ++--
>>  xen/arch/x86/Kconfig               | 14 +++++++++++++-
>>  xen/arch/x86/cpu/microcode/amd.c   | 22 +++++++++++++---------
>>  xen/arch/x86/cpu/microcode/core.c  | 25 ++++++++++++++++++-------
>>  xen/arch/x86/cpu/microcode/intel.c | 16 +++++++++-------
>>  xen/arch/x86/efi/efi-boot.h        |  3 ++-
>>  xen/arch/x86/platform_hypercall.c  |  2 ++
>>  xen/common/Makefile                |  3 ++-
>>  10 files changed, 64 insertions(+), 29 deletions(-)
>
> Much nicer in terms of (non) invasiveness.
>
> First, please split the rename of CONFIG_UCODE_SCAN_DEFAULT into an
> earlier patch.

Sure

>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-l=
ine.pandoc
>> index 50d7edb248..866fa2f951 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2748,7 +2748,7 @@ performance.
>>  ### ucode
>>  > `=3D List of [ <integer> | scan=3D<bool>, nmi=3D<bool>, digest-check=
=3D<bool> ]`
>> =20
>> -    Applicability: x86
>> +    Applicability: x86 with CONFIG_MICROCODE_LOADING active
>>      Default: `scan` is selectable via Kconfig, `nmi,digest-check`
>
> You want to include this too:
>
> diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/mi=
crocode-loading.rst
> index a07e25802fab..91668e6f9b3f 100644
> --- a/docs/admin-guide/microcode-loading.rst
> +++ b/docs/admin-guide/microcode-loading.rst
> @@ -23,6 +23,9 @@ TSX errata which necessitated disabling the feature ent=
irely), or the addition
> =C2=A0of brand new features (e.g. the Spectre v2 controls to work around =
speculative
> =C2=A0execution vulnerabilities).
> =C2=A0
> +Microcode loading support in Xen is controlled by the
> +``CONFIG_MICROCODE_LOADING`` Kconfig option.

Ack

> +
> =C2=A0
> =C2=A0Boot time microcode loading
> =C2=A0---------------------------
>
>
> while changing the docs.
>
>> =20
>>  Controls for CPU microcode loading. For early loading, this parameter c=
an
>> @@ -2773,7 +2773,7 @@ microcode in the cpio name space must be:
>>    - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
>>  When using xen.efi, the `ucode=3D<filename>` config file setting takes
>>  precedence over `scan`. The default value for `scan` is set with
>> -`CONFIG_UCODE_SCAN_DEFAULT`.
>> +`CONFIG_MICROCODE_SCAN_DEFAULT`.
>> =20
>>  'nmi' determines late loading is performed in NMI handler or just in
>>  stop_machine context. In NMI handler, even NMIs are blocked, which is
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index c808c989fc..1353ec9a3f 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -331,8 +331,20 @@ config REQUIRE_NX
>>  	  was unavailable. However, if enabled, Xen will no longer boot on
>>  	  any CPU which is lacking NX support.
>> =20
>> -config UCODE_SCAN_DEFAULT
>> +config MICROCODE_LOADING
>> +	bool "Microcode loading"
>> +	default y
>> +	help
>> +	  Support updating the microcode revision of available CPUs with a new=
er
>> +	  vendor-provided microcode blob. Microcode updates address some class=
es of
>> +	  silicon defects. It's a very common delivery mechanism for fixes or
>> +	  workarounds for speculative execution vulnerabilities.
>> +
>> +	  If unsure, say Y.
>
> Please don't re-iterate the default.=C2=A0 It's a waste.=C2=A0 As to the =
main
> text, that's not great for the target audience of a distro packager /
> power user.=C2=A0 How about:
>
> --8<--
> Microcode updates for CPUs fix errata and provide new functionality for
> software to work around bugs, such as the speculative execution
> vulnerabilities.=C2=A0 It is common for OSes to carry updated microcode a=
s
> software tends to get updated more frequently than firmware.
>
> For embedded environments where a full firmware/software stack is being
> provided, it might not be necessary for Xen to need to load microcode
> itself.
> --8<--

Sure. I don't mind.

>
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microc=
ode/core.c
>> index fe47c3a6c1..aec99834fd 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -44,6 +44,9 @@
>> =20
>>  #include "private.h"
>> =20
>> +#define can_apply_microcode(ops) (IS_ENABLED(CONFIG_MICROCODE_LOADING) =
&& \
>> +                                  (ops).apply_microcode)
>
> I don't think this is a useful macro.=C2=A0 It's used 3 times, despite ..=
.
>
>> @@ -613,6 +618,7 @@ static long cf_check ucode_update_hcall_cont(void *d=
ata)
>>      return ret;
>>  }
>> =20
>> +#ifdef CONFIG_MICROCODE_LOADING
>>  int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
>>                         unsigned long len, unsigned int flags)
>>  {
>> @@ -622,7 +628,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) =
buf,
>>      if ( flags & ~XENPF_UCODE_FORCE )
>>          return -EINVAL;
>> =20
>> -    if ( !ucode_ops.apply_microcode )
>> +    if ( !can_apply_microcode(ucode_ops) )
>>          return -EINVAL;
>> =20
>>      buffer =3D xmalloc_flex_struct(struct ucode_buf, buffer, len);
>> @@ -645,6 +651,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) =
buf,
>>       */
>>      return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer=
);
>>  }
>> +#endif /* CONFIG_MICROCODE_LOADING */
>
> ... this use being redundant.=C2=A0 Just expand it for the two other case=
s
> and consistently use IS_ENABLED() in view.

Ack.

>
>> @@ -907,10 +916,12 @@ int __init early_microcode_init(struct boot_info *=
bi)
>>       *
>>       * Take the hint in either case and ignore the microcode interface.
>>       */
>> -    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev =3D=3D ~0 =
)
>> +    if ( !can_apply_microcode(ucode_ops) || this_cpu(cpu_sig).rev =3D=
=3D ~0 )
>>      {
>>          printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
>> -               ucode_ops.apply_microcode ? "rev =3D ~0" : "HW toggle");
>> +               !IS_ENABLED(CONFIG_MICROCODE_LOADING) ? "not compiled in=
" :
>> +               ucode_ops.apply_microcode             ? "rev =3D ~0"    =
    :
>> +                                                       "HW toggle");
>>          ucode_ops.apply_microcode =3D NULL;
>>          return -ENODEV;
>>      }
>
> Don't complicate this messy printk() further.=C2=A0 Just exit early; it's=
 not
> interesting to read "not loading microcode because it's not compiled in".
>
> This is a rare example of a subsystem where it remains partially
> compiled in, and it's even possible to write such a printk().

Ack.

>
>> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/micro=
code/intel.c
>> index 281993e725..d9895018b4 100644
>> --- a/xen/arch/x86/cpu/microcode/intel.c
>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>> @@ -404,21 +404,23 @@ static bool __init can_load_microcode(void)
>>      return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
>>  }
>> =20
>> -static const char __initconst intel_cpio_path[] =3D
>> +static const char __initconst __maybe_unused intel_cpio_path[] =3D
>>      "kernel/x86/microcode/GenuineIntel.bin";
>> =20
>>  static const struct microcode_ops __initconst_cf_clobber intel_ucode_op=
s =3D {
>> -    .cpu_request_microcode            =3D cpu_request_microcode,
>>      .collect_cpu_info                 =3D collect_cpu_info,
>> +#ifdef CONFIG_MICROCODE_LOADING
>> +    .cpu_request_microcode            =3D cpu_request_microcode,
>>      .apply_microcode                  =3D apply_microcode,
>>      .compare                          =3D intel_compare,
>>      .cpio_path                        =3D intel_cpio_path,
>> +#endif /* CONFIG_MICROCODE_LOADING */
>>  };
>> =20
>>  void __init ucode_probe_intel(struct microcode_ops *ops)
>>  {
>>      *ops =3D intel_ucode_ops;
>> =20
>> -    if ( !can_load_microcode() )
>> +    if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) && !can_load_microcode() =
)
>>          ops->apply_microcode =3D NULL;
>>  }
>
> ! ||, surely?

When !CONFIG_MICROCODE_LOADING apply_microcode is already NULL. It's a need=
less
assignment. This is strictly so the compiler can avoid assigning anything.

Functionally it's irrelevant.

>
>
>> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_h=
ypercall.c
>> index 79bb99e0b6..5e83965d21 100644
>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -307,6 +307,7 @@ ret_t do_platform_op(
>>          break;
>>      }
>> =20
>> +#ifdef CONFIG_MICROCODE_LOADING
>>      case XENPF_microcode_update:
>>      {
>>          XEN_GUEST_HANDLE(const_void) data;
>> @@ -327,6 +328,7 @@ ret_t do_platform_op(
>>                                   op->u.microcode2.flags);
>>          break;
>>      }
>> +#endif /* CONFIG_MICROCODE_LOADING */
>
> You mustn't #ifdef out a case like this, because it causes the op to
> fall into the default case, and some of the default chains go a long way
> and make unwise assumptions, like hitting a BUG().

It's normally more convenient for us (AMD) to physically remove code where
possible for coverage reasons, but in this case it probably doesn't matter.

That said, I think we can both agree if dom0 can crash the hypervisor reque=
sting
a non existing op the bug is probably in such a BUG() statement and not
elsewhere. Note CONFIG_VIDEO already removes an op in this way in this very
file. The default case returns with ENOSYS, with BUG() being in helpers for
other data, as far as I can see.

>
> Always use this form:
>
> =C2=A0=C2=A0=C2=A0 if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 // EOPNOTSUPP
>
> and leave the case intact.

... but sure.

>
>> =20
>>      case XENPF_platform_quirk:
>>      {
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index 92c97d641e..1e6c92e554 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -65,7 +65,8 @@ obj-y +=3D wait.o
>>  obj-bin-y +=3D warning.init.o
>>  obj-y +=3D xmalloc_tlsf.o
>> =20
>> -obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma l=
zo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>> +obj-bin-$(CONFIG_MICROCODE_LOADING) +=3D earlycpio.init.o
>> +obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma l=
zo unlzo unlz4 unzstd,$(n).init.o)
>> =20
>>  obj-$(CONFIG_COMPAT) +=3D $(addprefix compat/,domain.o memory.o multica=
ll.o xlat.o)
>> =20
>
> In a prereq patch, please move earlycpio out of common/ into xen/lib/.=C2=
=A0
> It shouldn't be tied to CONFIG_MICROCODE_LOADING like this, and it can
> simply be discarded at link time when it's librified and unreferenced.
>
> ~Andrew

That would preclude having it in the init section though, AIUI.

Cheers,
Alejandro

