Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B5BB4BDE
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 19:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136097.1472920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4NQ0-0000vP-J4; Thu, 02 Oct 2025 17:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136097.1472920; Thu, 02 Oct 2025 17:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4NQ0-0000so-Fp; Thu, 02 Oct 2025 17:48:40 +0000
Received: by outflank-mailman (input) for mailman id 1136097;
 Thu, 02 Oct 2025 17:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4NPz-0000si-5J
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 17:48:39 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05441d63-9fb8-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 19:48:37 +0200 (CEST)
Received: from MN2PR20CA0060.namprd20.prod.outlook.com (2603:10b6:208:235::29)
 by PH0PR12MB8823.namprd12.prod.outlook.com (2603:10b6:510:28e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 17:48:31 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:235:cafe::b1) by MN2PR20CA0060.outlook.office365.com
 (2603:10b6:208:235::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 17:48:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.1 via Frontend Transport; Thu, 2 Oct 2025 17:48:30 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 10:48:29 -0700
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
X-Inumbo-ID: 05441d63-9fb8-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tx18uIR4HkH9fakXU7iaAPvnVKZbvBcZgfnvMpadjdRo/gA4C4Z74Od42RD2dBjiyk7k+vm+by3Ipbhn2cfAnp6hgjPVXbtfVD9U4OVCegeqSZUCSfaIEmXuXFoc8K9i70GrWqoH0t0t7IgGMbeN7L0H76g9kbxEZeORrHgocMrpztTm9nVw0wI6aCQIrvhHq5rKMa+6jF+M1mWfGcw228H8IRgpUqtd2dUQ5m2+TZ7log63/Fyl6/NW5JaawWO++JBZOXMC5SgxfmqcpFdlQvrvzT2QL/xI+KbpP7yQfPdFZHxCx3fc3XvbXiSP1//LbCwaXNXEfM1bJBLWCXiDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQjmL+6R6uN/1jbPoqK/xe1z2ADs/up8KNeDrd3UZaM=;
 b=YHL7tepYMJlgfDkCJeJivq7akPPB9/qdo6OYtbRKepghkbitmvdXUOGDjnV7ucKoUwYrmZdLb/hc7O2RnO7afI25k4kvVfag7MDq41U24JofT/YjKFcON8TnYQVM3OrMi84vsaQ2STwMnso3qDAyzrgzZaLxDzktsiDagVYS/T7ljV8A64ESiRL4i4lSGijuutXIYJFj9eGPDY+sEmUejxP/RGQywSSNBQoKoL8mjnA2UkcrKyywwKHmjlgLS7a/illSZB1n2Bng5sY+tGM9D2t8dg4BpJ6EU3+kEQjpE71PXzCnjruzqvfrDJePAQkEZBtBW/ziBcGZ+FaGXwsnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQjmL+6R6uN/1jbPoqK/xe1z2ADs/up8KNeDrd3UZaM=;
 b=Do4i9XWuE3T7UTlWIeD7aZ8pri/lf4GAY2hH7OQrd4CSyI4OUIt+4J+2Dsk33+rNqZcJynPBdjVp4+X8Y+LXoDKEYlv87i5iFWSIwyBt0/xggz6h2wbCQvTxjh3SEqjHg5k9g2o37n/opVk+Ve/q2LGZEkLzupa3LDBW8LlG3f8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 Oct 2025 19:48:28 +0200
Message-ID: <DD80XF7EVPJ9.1WTMKC34DSW65@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XTF PATCH v2 2/2] x86: Allow exiting QEMU in TCG/QEMU
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
 <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
 <aN6KrO6LPPJFK17M@Mac.lan> <DD7X3QFGUK6Y.DTARYWAB2DF@amd.com>
 <aN6cQBwiM36q_75E@Mac.lan>
In-Reply-To: <aN6cQBwiM36q_75E@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|PH0PR12MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de092d9-6288-4c83-7474-08de01dbe67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1ZoeDZlcFBvTjVrMHI1QXdiRG0reUJOQy9GYk5ZZmlBUzBCZ3RXbW5Jd3V0?=
 =?utf-8?B?UDR5TVliaUVzWU9IRzBHdk90cVkveHJhVFpRb2ZPV1V0MkxXZ01FV3pDTUdO?=
 =?utf-8?B?SW0vQTVuRkd0aFJqci9KNTVCazRIM0YzZndrdDVqSW45R1RldFNjbGNrckN0?=
 =?utf-8?B?UHVabFZrOFZDRDBwKzA3K1BUbFVob1hsQ0JHeXVFc0Jna0tlemV0M0xYS1Bq?=
 =?utf-8?B?dEdIcDNrdHNUMCtXSEtVUkJCdXRYVWlPcE9xcGN1TFJtWXI4UisxTGNyVysz?=
 =?utf-8?B?ZUpoV0VmaDBtVUg2dHNPMEN4ZURxdjVva3FaUHM0TDZjWGFIOEQrcHdDUm5O?=
 =?utf-8?B?b2srUU02cHluWlRYRGUvT05lV0dmbFd6bEd1dUVqL2M1MVh3STBqM3dsUUwv?=
 =?utf-8?B?Q055SHBybXd0MXNSNzdWUTJ3MHhEdmVrSHc1NkdkR0ppUElTR3IzOFMrQUxZ?=
 =?utf-8?B?OVlUUlhCdzJkYnh5ZDRJdTJwY0g5QjIwY2w3Rnk4K3ZrSTFJdzNYMkJkbGJF?=
 =?utf-8?B?Y1Z4cmRWZmV4YmFSTzU4aDZLS3Q3ZmNFbldsb3djeHpsZTBLWEcreFBHZGVG?=
 =?utf-8?B?bWZZUkMvVVp0MkNKQ0g4UUhkSUd4RkllQUJqV0JVVnFLcVJKcGZOdHo3c1Rr?=
 =?utf-8?B?OGt3NWg0dUFjSm90Nmd5Q1ZjbDdPNjR1Y2ZXNXd1ZFJtOXMyR2dpbm5kcFU1?=
 =?utf-8?B?UTk0eUVDYTZrbEozRjBhSWw2YXBHd0JGS2xwVE1GR1FiY3RhSE1QdVBWcm1Z?=
 =?utf-8?B?OHM1REVBU3N5MzZoSVNrNUV6dlMwbFgrZmhBK0hOd20rekJUcFhuaGpHNFg5?=
 =?utf-8?B?dVRrTnR3cEI5WTlCbjZiZWxieGlTT0lhV3BKR0x5T0gvek9QVXdkcWV3NWRv?=
 =?utf-8?B?QjZIS3JMM2djMkxUU1JsN0dnenQ2SVBTVlJMczNlSGM5L1RjK3NZTTE0aDV3?=
 =?utf-8?B?UVJETmVqOEdyTWYxUjNBdWJpaEQvSGJSMEpHaE43ZnlEQWlYZytoVDhubzR5?=
 =?utf-8?B?NXl1K3FvQ2lmME5HVVRQTE5pSzM5bTRwRStoUmNqUEtHd0l2N2xBOGFydCsx?=
 =?utf-8?B?Ullpd3hrTmN3dnd4cTM0M0VPdUtEQkQrK1RZcUNZbGJHYkxqWmphajBWOXRv?=
 =?utf-8?B?WUFIOUZ3Wm4yZzVVWitwYTNyVXNxbmE2aDNLYzhPZmpPRCtMVTdiSVZYVXlT?=
 =?utf-8?B?aG5LOFRNWlFNRWl3RVdEYll2YTJwWUpvMzNDRU4xREgyMkducTRLdERTNXBI?=
 =?utf-8?B?cVllQzZZek9Rc1RReHZEckZYL1d0WkwzNUZXQll6ZGZLRkxyYXh0MXFoQmkr?=
 =?utf-8?B?bFlORnVKcGl5SGxlUWFFYzM2dTRIbEhBQmV3aE1KTHBGcTlidS9XQW5UT3du?=
 =?utf-8?B?V3piVkQwR3MzTExteUorNERKQUpyb0lLSktNb0ZBcTQzRTJxSnJKcDU0Rkpl?=
 =?utf-8?B?aFQwZjEreGp1QkhlL3E4Q3BUMkphVGxROE1VZVhOVFA4RDBoam81aU1rQWcr?=
 =?utf-8?B?MUlrcGI1TWpTZnhHN0hxMGxPNDQ1YjBVRzNKd1VpMmN1cUZsZnlBdk9nWTJY?=
 =?utf-8?B?Njc4OUV4cElZVVdxejlzaCt4cUIzVm8yd1UrcWo1eDVUM2tKaEpVSTY3eldh?=
 =?utf-8?B?M3ViTERDMlN1cUdubkQwa2hwcUVhV3hrNTRUSytnMll2ZkNxbzBqcGNPbmZK?=
 =?utf-8?B?OGFlY09ic3dSRHpETGRlL2NPYmdjQ3BkdmVqL3VLMEhVN2pUQ1dMaEMyUENP?=
 =?utf-8?B?SHhQL0xSUzVRL0poN1hGVU0rY0N4VWtrVDRGZFFmQStPZHJtY0JrU1VmY09R?=
 =?utf-8?B?OHJTYTBrbHZ4aFNLUmNoejVCNllEcU9XQzkxMm5GSGEzbnBIYm91QTdiSlgx?=
 =?utf-8?B?NUdhTVhuRFBUeEM2WUtUMnRxeGErUjdRSFUvL3F4Sy85WVhOQ0phb1NRNUtr?=
 =?utf-8?B?Rk5tNjlsRU5vNTViak9kVm04blRrTkJLL0dFV2pWNDl2bmlZWHh1Rlc3bmNy?=
 =?utf-8?B?YzQ5TEMwRHEvdmlyd1dOMkNiektiL2MxZ0NiUktHODc2ejJvcXJKVU05S3U2?=
 =?utf-8?B?VGNGRXNQYzRYZnN5VzJDaXZVYmZIYmgxZGNVanRZQ3ZEdHcvRm5zdTFtRGFO?=
 =?utf-8?Q?BFgk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 17:48:30.9079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de092d9-6288-4c83-7474-08de01dbe67b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8823

On Thu Oct 2, 2025 at 5:37 PM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 02, 2025 at 04:48:38PM +0200, Alejandro Vallejo wrote:
>> On Thu Oct 2, 2025 at 4:22 PM CEST, Roger Pau Monn=C3=A9 wrote:
>> > On Thu, Oct 02, 2025 at 03:55:34PM +0200, Alejandro Vallejo wrote:
>> >> If QEMU has a debug isa-debug-exit device, we can simply write to it
>> >> to exit rather than spinning after a failed hypercall.
>> >>=20
>> >> While at it, reorder an out-of-order include.
>> >>=20
>> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> >> ---
>> >>  arch/x86/hvm/traps.c    | 16 +++++++++++++++-
>> >>  arch/x86/pv/traps.c     |  5 +++++
>> >>  common/lib.c            |  2 +-
>> >>  common/report.c         |  8 +++++---
>> >>  include/xtf/framework.h |  3 +++
>> >>  5 files changed, 29 insertions(+), 5 deletions(-)
>> >>=20
>> >> diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
>> >> index ad7b8cb..b8c4d0c 100644
>> >> --- a/arch/x86/hvm/traps.c
>> >> +++ b/arch/x86/hvm/traps.c
>> >> @@ -1,5 +1,6 @@
>> >> -#include <xtf/traps.h>
>> >> +#include <xtf/hypercall.h>
>> >>  #include <xtf/lib.h>
>> >> +#include <xtf/traps.h>
>> >> =20
>> >>  #include <arch/idt.h>
>> >>  #include <arch/lib.h>
>> >> @@ -139,6 +140,19 @@ void arch_init_traps(void)
>> >>                 virt_to_gfn(__end_user_bss));
>> >>  }
>> >> =20
>> >> +void arch_shutdown(unsigned int reason)
>> >> +{
>> >> +    hypercall_shutdown(reason);
>> >
>> > This relies on the hypercall page being poised with `ret`, which is
>> > IMO fragile.  I would rather have it poisoned with `int3` and prevent
>> > such stray accesses in the first place.
>>=20
>> I dont' mind caching Xen presence somewhere, but that involves some code=
 motion
>> from setup.c, which I wanted to avoid.
>
> I think it's very likely that at some point we will need to cache this?
>
> enum {
>     NATIVE,
>     XEN,
>     QEMU,
>     ...
> } hypervisor_env;
>
> Or similar.

Maybe NATIVE, XEN_VIRT and NON_XEN_VIRT? I see no reason to distinguish bet=
ween
TCG, KVM and any other accelerator; and QEMU is imprecise because we use fo=
r
HVM. You could imagine chainloading XTF from GRUB to test the HVM env.

>
>> At the core I just want to speed up testmaking by doing it from WSL rath=
er than
>> from a Xen host.
>
> Right.  I was pondering whether we want a QEMU target, but
> realistically QEMU should be able to run all the hvm* variants.
>
>> >
>> >> +
>> >> +    /*
>> >> +     * Not running under Xen. Attempt exit via the QEMU ISA debug ex=
it device on
>> >> +     * its default port.
>> >> +     *
>> >> +     * QEMU's rc is (reason << 1) | 1, if "-device isa-debug-exit" i=
s set.
>> >> +     */
>> >> +    outb(reason, 0x501);
>> >
>> > That's kind of weird?  So even if we pass reason =3D=3D 0, the exit co=
de
>> > from QEMU will be 1 (and error)?
>> >
>> > Isn't there anyway to signal a clean shutdown, and hence QEMU exit
>> > code being 0?
>>=20
>> Nope. It's hardcoded in QEMU itself.
>>=20
>> reason=3D0 =3D> rc=3D1
>> reason=3D1 =3D> rc=3D3
>> reason=3D2 =3D> rc=3D5
>>=20
>> ... and so on.
>
> Hm, OK, I think it's lacking there's no way to signal a clean exit,
> but I guess QEMU had a reason for this.

Seems pretty obvious it was intentional. As to what the intention was, your
guess is as good as mine.

Cheers,
Alejandro

