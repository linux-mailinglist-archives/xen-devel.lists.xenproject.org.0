Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6228BB435B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135981.1472881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Kbz-0003DP-TI; Thu, 02 Oct 2025 14:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135981.1472881; Thu, 02 Oct 2025 14:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Kbz-0003Bd-PR; Thu, 02 Oct 2025 14:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1135981;
 Thu, 02 Oct 2025 14:48:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4Kby-0003BX-E2
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:48:50 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5430b57-9f9e-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 16:48:46 +0200 (CEST)
Received: from DM6PR06CA0097.namprd06.prod.outlook.com (2603:10b6:5:336::30)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Thu, 2 Oct
 2025 14:48:41 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::57) by DM6PR06CA0097.outlook.office365.com
 (2603:10b6:5:336::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Thu,
 2 Oct 2025 14:48:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 14:48:41 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 07:48:40 -0700
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
X-Inumbo-ID: e5430b57-9f9e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5+MpVsrSsJhvEw6Wsps/zfJ7msG7XDfOcFOi1eE0OSfbCaAtxCd5vehaG7NCOZTG4fc8XLaBlyvHM8gA1vfDjUJ4JdX7lWuvT+552uqi8oo8TY92BOPsSYoUtLA119laUW6BCf5w8m4yR/hs6P30gypyGfPMsUWa/ZdbDslZSKbvVk7R/p37AWg9jgsVdK86Q62vEM6QRdf8inNHL6nFNAXp0/O6gdV0z7d7/Jl1ImaNnlQnP7aLr7iKVe6r5S0ZloTzDwC4/WhnLOZq0X/mZNk+iE7rohNAx9eU94I7fehEHoTGm+ysSLiioUR/E7+KlpLbQ1dFZrPW3pousxxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMI/5cmdn41E9kTMamZRErFPV8nZGKb41rRXuToIf3E=;
 b=N/I9RHXHCrPPjh7varTvHTlD03ookoDdbW1hk13cT6H8fZaAbVO/G8PgyM7NYacx9xZBwDaZfyuuPlyKgzS/xlqBmmq/Qfys15VvlJkw3n3FcjPJN+Ou25vbsY1Ai89CuUeJL1sd0QDy9gBJ2KzGBgF8YcMYwRFPvtFUEuFJ0flZg7JASb7C8aEXno8MSnuKuQkzrmbADSS7uV9gvxU8AKB8VPvZ9F3o0vuHS9sZn4mc1mrmxhp1NGat6doUxtjgyy/S4/YJz85/u7bxQsUubBOa7NclaCvZtXItNcUZcoB/2Ex75a4q7Of2uuQPcF3FFwAPPc/RVoYSsjhgcx54lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMI/5cmdn41E9kTMamZRErFPV8nZGKb41rRXuToIf3E=;
 b=gMHtTXWC5eACm4wsZZ4iENjP7yUvNll46P4QWqJhs1KAICloYHPoo1CwJBH801wl+v8R9pklnJEyAF7ky6sUuTTjaI0wqPbhjN81tSZ6KZH8hB4zFgVY3Hhhnm9VVqXInLY2ycx6+N+0GNhvMHjXzUwxf/e1PwGE1IGS5YTmqi0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 Oct 2025 16:48:38 +0200
Message-ID: <DD7X3QFGUK6Y.DTARYWAB2DF@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XTF PATCH v2 2/2] x86: Allow exiting QEMU in TCG/QEMU
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
 <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
 <aN6KrO6LPPJFK17M@Mac.lan>
In-Reply-To: <aN6KrO6LPPJFK17M@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|BL4PR12MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: ca94dc92-6a2a-4195-4703-08de01c2c79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFhKYXNOQUVyWFIxWjZoM3VsNFhBSi9FYld6Zzh6S3ZGUjUwZUF1bzJIQjNs?=
 =?utf-8?B?bDgyeTRJZ1I3SFZNZGt3Tk4yWTVKZ0lHdkxzN0FtMkFrQ0tmYVF1T21tTERF?=
 =?utf-8?B?dDkyLzVSdXdvS3lOcXNZcFkvYXA0OWkrU0VoZlU1RzBZekZWcXhHb1ZIQ1NC?=
 =?utf-8?B?a25aSHVEZnZvUXZpVERMN25MU0xWZkZJZURPNGEzbG5US2VHdm5zVWlYb3pL?=
 =?utf-8?B?Z1FNZDNNZWl0b1V4eStvTlRlT09mT0JuMXU0RzVFNGhIanpBSDdtQ1hVaEd0?=
 =?utf-8?B?ZGdtc0FoY2p1amhlQjgzbU1wekhFOEI1QzVzUFVVK0ZCZzB6K3dJank3ak9q?=
 =?utf-8?B?SmptRUhPWWFvNE5yZjV2TFBPc3JVaGFWN3QwLysxYjlrZThFM2Y1STdCL2F3?=
 =?utf-8?B?eWJmMHlVaWFLcno0RDZaL0YvUUJ2NC92RlkzblA4bFdnUGNmaEdzT0pCK3Jn?=
 =?utf-8?B?R21IenlqUGUzaGk1blF4Nm93TzYrSjREdjRScUYvNmF0SWdCRnl3WXhpdmwv?=
 =?utf-8?B?b2NZdTJuZDZsVGliUWQrMzRUTGN4Ni9qYXBWelljLzN1dWczS0FUWVhYakQ3?=
 =?utf-8?B?SkZBbFNZM1RwMFp1MVltdGRXaE0va1FqYUVSOHZFK05Ma1ladDVOVEQxOGNr?=
 =?utf-8?B?QlV3UFo1MXMwdDdrQWZGMGswYnU0b1ZoOS9ZTEdGdW9kK25jcXMrUWxabkZB?=
 =?utf-8?B?WHNmWXpvdnlUOTRQUDMzM2YzZzlCYjY0Rk5yTlRWRndSN04yTEFVTzRpbjdo?=
 =?utf-8?B?TFBIWWRmcVFKQjVudkxKWXBOZ0xYcmFPVXlKakZ6dDB5YktDWjFyRW8zLy8r?=
 =?utf-8?B?dHZTaC9KVkJwMEFHdmVSVis0WEgvUnJZejF5MjhFclNOVis0VGtnODhuT1o3?=
 =?utf-8?B?aTIyZ01HZ2ZZdUYxUm85aHlJdGFkZFFnOWZyU0wxOVdaTnpGbzcyd0NJcUtE?=
 =?utf-8?B?MWtXR2pLSmJrbXRDOGl5OEVadXpiVmppYjg5cWN0TWlQVTR6eUZ4MmNVNVZM?=
 =?utf-8?B?UGJ1UDAxekVxcURuOVBPS25iZFBTYTRuK0x0RFdqaytmbStlTG5vWVcyVnU5?=
 =?utf-8?B?cHpSdVZGM0NEcWdrV3BDbGVnZHpjZWlKL1pDVDN4Z05hMjZzT1FJVUpIbmYw?=
 =?utf-8?B?Si9EWW12SG8wZElFYzZuTUNPd3lOR0lwM2VLaDlEOW5XZ2Uya1ZSTVZVYllm?=
 =?utf-8?B?NnZDcmhoYlJSd09vdHVwOGxyMlVJRk1NbTZCclNVQnE4czk4L1ZzZE1LOGpw?=
 =?utf-8?B?TGNJbGdXNk91Z0t3K0ZaREtoaGQrTTB5cTI1dGNzVkVpQUNISlRiVzFkTlFY?=
 =?utf-8?B?eGRDSzRRb0JocEZJRHlwTUJKQmpTWlJ1cEQrWmhWQit4cHNQbFcxcGFDaHln?=
 =?utf-8?B?TzhNYmRiZ2RaajhXVXJWUTlVOUwzRUFCb2x4TlArVkJtVHJJTVROVDMxNUx5?=
 =?utf-8?B?Qk1wRmVsM1FPZnI2Y1hwVXJ0Ky93UU5sNCtxSHRVYnIvdFMwQVZnbG1TcGZz?=
 =?utf-8?B?MlZPd25pOTE4QWprVVFUbkNpSWNZNHk3U0trMFFpL1c0bXBqWGs1WTJRa1oz?=
 =?utf-8?B?OXl2Mnp0ajhVdUNtRE1PelNyQ29ORWNRSk81QmxyZDNQWDNZWjFyMk5keWZS?=
 =?utf-8?B?STByY1NkNXdqREYwSllDcGVOOTg0Mk51aTRCdmtTVkNQaXhsd2IyekV6OFB2?=
 =?utf-8?B?dnQvMmFMeVdNWUtkWERqbitQOHZuT0U4dFBnYWwrYkNTZXk0bDkxa1VZd3kr?=
 =?utf-8?B?ZUFobmFLUzkyN2hsTHIwUEIxcng5R1ZSMGhmT0ZzbnN1b0YxamhlZzhkaGVt?=
 =?utf-8?B?ai8yZ0tTZFNmeTZKZi9mNU1YTG1xNm8zTWxhSXNibllnVTQ2aFlDTUNYd2ps?=
 =?utf-8?B?VVUweTY4OWMxOGllRjJia0wzTlpHb1Iyb1IzbEMwdHg1Z1RzTXN5UWd3QThv?=
 =?utf-8?B?RHFYaUxtOGc1MDFJZnhPQTk3SUxnVE1kVWkxUWtLclBWTVBiZFdtWUtPYnFy?=
 =?utf-8?B?c0pDaGMyVVl4b2hNSlI0dGZIUldoNnowbGY3Y3I4cG90NnBqY1V1LzRLUm1Z?=
 =?utf-8?B?MjE3K1hlUTlwS2trdjhVVVNLeVFBZk1yS1h3bjQyY0NzV3FhTGxsUWZ0V0I1?=
 =?utf-8?Q?8RmI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:48:41.6237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca94dc92-6a2a-4195-4703-08de01c2c79e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723

On Thu Oct 2, 2025 at 4:22 PM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 02, 2025 at 03:55:34PM +0200, Alejandro Vallejo wrote:
>> If QEMU has a debug isa-debug-exit device, we can simply write to it
>> to exit rather than spinning after a failed hypercall.
>>=20
>> While at it, reorder an out-of-order include.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  arch/x86/hvm/traps.c    | 16 +++++++++++++++-
>>  arch/x86/pv/traps.c     |  5 +++++
>>  common/lib.c            |  2 +-
>>  common/report.c         |  8 +++++---
>>  include/xtf/framework.h |  3 +++
>>  5 files changed, 29 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
>> index ad7b8cb..b8c4d0c 100644
>> --- a/arch/x86/hvm/traps.c
>> +++ b/arch/x86/hvm/traps.c
>> @@ -1,5 +1,6 @@
>> -#include <xtf/traps.h>
>> +#include <xtf/hypercall.h>
>>  #include <xtf/lib.h>
>> +#include <xtf/traps.h>
>> =20
>>  #include <arch/idt.h>
>>  #include <arch/lib.h>
>> @@ -139,6 +140,19 @@ void arch_init_traps(void)
>>                 virt_to_gfn(__end_user_bss));
>>  }
>> =20
>> +void arch_shutdown(unsigned int reason)
>> +{
>> +    hypercall_shutdown(reason);
>
> This relies on the hypercall page being poised with `ret`, which is
> IMO fragile.  I would rather have it poisoned with `int3` and prevent
> such stray accesses in the first place.

I dont' mind caching Xen presence somewhere, but that involves some code mo=
tion
from setup.c, which I wanted to avoid.

At the core I just want to speed up testmaking by doing it from WSL rather =
than
from a Xen host.

>
>> +
>> +    /*
>> +     * Not running under Xen. Attempt exit via the QEMU ISA debug exit =
device on
>> +     * its default port.
>> +     *
>> +     * QEMU's rc is (reason << 1) | 1, if "-device isa-debug-exit" is s=
et.
>> +     */
>> +    outb(reason, 0x501);
>
> That's kind of weird?  So even if we pass reason =3D=3D 0, the exit code
> from QEMU will be 1 (and error)?
>
> Isn't there anyway to signal a clean shutdown, and hence QEMU exit
> code being 0?

Nope. It's hardcoded in QEMU itself.

reason=3D0 =3D> rc=3D1
reason=3D1 =3D> rc=3D3
reason=3D2 =3D> rc=3D5

... and so on.

I have something like this in my harness to avoid surprises:

  set +e
  qemu-system-x86_64 <...>
  RC=3D"$?"
  printf "\n[QEMU exit] rc=3D${RC} reason=3D$(($RC / 2))\n"

On other test harness I use for personal projects I take the convention tha=
t
rc =3D 1 means success and anything else means failure, but that needs chan=
ges
to the runner to integrate the assumptions somewhere, I don't think hardcod=
ing
my conventions is sensible.

Cheers,
Alejandro

