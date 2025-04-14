Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FFA88BA3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 20:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951166.1347280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4OoC-0003TU-0D; Mon, 14 Apr 2025 18:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951166.1347280; Mon, 14 Apr 2025 18:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4OoB-0003Qg-So; Mon, 14 Apr 2025 18:45:27 +0000
Received: by outflank-mailman (input) for mailman id 951166;
 Mon, 14 Apr 2025 18:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4OoA-0003Qa-SM
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:45:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eb11b5a-1960-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 20:45:24 +0200 (CEST)
Received: from SJ0PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:33f::6)
 by CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 14 Apr
 2025 18:45:17 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::a0) by SJ0PR05CA0031.outlook.office365.com
 (2603:10b6:a03:33f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.10 via Frontend Transport; Mon,
 14 Apr 2025 18:45:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:45:16 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 13:45:12 -0500
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
X-Inumbo-ID: 9eb11b5a-1960-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9WxEnKVA2sP7if9xwvXtViBu7nXrBtXAYBzg0qBcUREyRMD+x4fNxu+3wWOK2HBWhCYGz2BXp1wM4Bk9+M575TmBcMbJzoT748njlkV/vKOx2D9qVOew9+XhhGsVgJHk7y4y4ypETfezxPpw/jQjntcIX/OJ2uuCbPPBHpwwO5S3rtscgIu1vazc355d8a7la4A0gVNhhAqJFo+dZb2Sw1eBfQGWMdIZgJ0saHmBbY7R08oVw7vPnLvLiiLIVIEYqTH8GoeCfSc9+mlXjTVc3W6Hq+aVcr0+5XLkYHmrrj5JnpeifXKaQKUPj7ohd9o5Du/mlluWSL18ZMhGiPNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu5GyWWSYbNyXmv+d+nKhn8sEiyrOnMKh8oNuetT1No=;
 b=mQYCVGIf1Bl4kdMUKwuvCP8aWrCQywVBho8E2KGrvTz5V5svdNXzCJYi2lrg0aVW6onqp8odFnLfg1xMV7WiMcbBIAyClbXW6I8ppwzMtsB1DvJWcZxATgtglEcfWnSfi6KiJCr+YZlMZObAzY70toInFhlUyfDdNWAAfwEF4MRXPZZVV+wAFvCT059uK3WHicw2aog0CS73Q0lV+JYmJtbGUrfJlE+3clx+YoSmW+eyin1YJYjDelxr2RWJkYkhFz8E0l9OfPyQgFfgwDPqVB7wF2eNt8IcknJmqpqO27JOEwkfqQwj+FI9mVh/oQkqincZnKO6Lrn5v98JBdP4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu5GyWWSYbNyXmv+d+nKhn8sEiyrOnMKh8oNuetT1No=;
 b=J+BxOeOcNgXcdAZJSPtZ+mdBsr+NF4Wt6ZnuaqOfoxqf97WXtYycrLrBuHjuqonbxzKl3HsqebP/yydyU9e7iwq6DrSG22mW6dFV7b59LcciQYFelN0sQQRWntgUmoilVRNP80zC0USo+anySJf28hoFArXaE3ekQPuED4pbRgM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 19:45:11 +0100
Message-ID: <D96L1OXNGDGW.24AIUUW51EP3E@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device
 tree
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-14-agarciav@amd.com>
 <zz01k2KPjivL5-avbZJmfIKFKTodzbdL80XbXNBdrZP_7Kk9oips4Ox0aG-MYZUe74V8Rm5gHDbLjdUNlZLzmYD0MboIVY5XeUq_DmYXz6s=@proton.me>
In-Reply-To: <zz01k2KPjivL5-avbZJmfIKFKTodzbdL80XbXNBdrZP_7Kk9oips4Ox0aG-MYZUe74V8Rm5gHDbLjdUNlZLzmYD0MboIVY5XeUq_DmYXz6s=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e32a44-e418-4699-fb71-08dd7b847f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnNKdlBFUWdjd0xGRE9WUlVVa1g1UWJJTVlmTFlSSlAyNldGMzFEcFE0NUZJ?=
 =?utf-8?B?VHRPa01xVGtVeVpxT3FmcDJkeXd5bkhSNXhwenZrQzMvSmVJd3d4YlJpSVhE?=
 =?utf-8?B?cTkwUUdzbFM5SFpiRE5sS0FjNGRaci9QcE9QckJWWWNObDNxbFh3aml2WlFZ?=
 =?utf-8?B?QlB6NUkyMmxReTE4UFl6SVgyRVBxRjhDMXhpNEdWcFJvcFY3NkcreHM3aDRa?=
 =?utf-8?B?bDYxMWlYMjBrYkNKRmFrUWhjSGt3TjhxeGg4TTlwbFp1TFA3Y0VEZGZvaVBU?=
 =?utf-8?B?Rmxwc09CTC85Y1RmQkp0VHAyQThjcThhUFdZVFBXc2d4T1pWRUplSnVUU2xK?=
 =?utf-8?B?WXcyaEp3akVmajFkS0RuWmNGa291RlRxL3Nmell4Ty9tU2xiUElWdWVKc2w2?=
 =?utf-8?B?U3VmSkZFNlp3MlNKS1RqaWgwWkk2Z3JreUZKZk1mOXc1UjVleTdERnVoMElH?=
 =?utf-8?B?WlNpTGp2ZXYwYjZ5L0RyNW4wV1JWUHh4QnRXTW1Va1ZzeWdPcjlIUFZzSzUw?=
 =?utf-8?B?cUUwc29Za0JMemVEeXI0RlovcHo4d01JTDF0V01PQ3I5d2tqUmQwdEhPdE1T?=
 =?utf-8?B?T1FUck5MZEYrUmU4clBwS2U4OSttQi85UlVGMnNMT2tSV1UxU3laNmEvcmp2?=
 =?utf-8?B?a1ZDNnVhRGZqVjBZR1ZRTjhyUmVndm9IQTY5OTBLRk5RWmR6V2ptNVBadFNn?=
 =?utf-8?B?MXhvTlpSYkJyZnJMY05QSC8zWmd3MjBoSXNKTVNzRUx4YVcyMzg4STg4TkFJ?=
 =?utf-8?B?c01CdE1SbEEzQk1sbzUxNTErVmJQTUhuMUE5bjFMdDQ2aUtyYTZSVU52c3BN?=
 =?utf-8?B?NHZXbEZBYjl2WHREMkxVS1hzeXk2Q0s3dHpjdDZzYVppTkZsQS9Zd20wWWtw?=
 =?utf-8?B?TGNnbUVMT2MySnNGaTk4bmo5V3UxZXpMeEhBbjNqT2luSk1TeVRORXgyWVZn?=
 =?utf-8?B?aEpiZll6UFlDajVMMlRkQnBob1JITWhXWGRudGF1ZzhCeFY4eFY4SWJTTGVa?=
 =?utf-8?B?VmJHUVZybkNEOXpneFhTTGszc0RuQlloU2d2N0lhTzgxTzhOZ3dOSjRFUDNt?=
 =?utf-8?B?bGVRY1VoZHRtVGQyYjI1SVZMSCtKNWIyVmxPYUJHa1p4ZWJveEJUUVpIcnA3?=
 =?utf-8?B?dnozbGpRUDJyODE4emI0LytnRlVHY1ZnNTFKTGFGWDJnQVJwL1VVeHppU01F?=
 =?utf-8?B?VjNtMVRDdXRIb0tqS0lzTUk1UFRKQWF3TnYzTmZWbE9ndDJSVjVtNFF4VmYr?=
 =?utf-8?B?Wk5lVmM2aWJ2NmxVb0FoaTZWRlJCMHZqQk92Ym03MTdHYW1HZGwrY2ZYMzda?=
 =?utf-8?B?S0NQTnBha0Z4cVVwQ0lZWnRXeTIwaHBBZmxBdk02WE45SlE1cFVMaFM5V2pk?=
 =?utf-8?B?VWFuM2E5dWVtckRUUGVTNTN0b0hBbFV5bzJ2SkR4ZFhDWVErL2JHUHJQK0Ns?=
 =?utf-8?B?Y2kxcGViQksxTFFyUDVGcmVESlBadWkzMVJSSHZLemRpald6aFByQjNPV2Rp?=
 =?utf-8?B?cVhlaWdVZjAza0VIWVp0WU1SL3RUc2JxTEpxZkhJZXBNR1RLSCsrZ2szR1Jz?=
 =?utf-8?B?Y01QRWVqZWxzMzY3MDdQaDkzVjc2Y2NhSExPYkhuMVBpUGFaVEpLWlRTRzZK?=
 =?utf-8?B?VzIwL2hNaExQN09XS1pYQW8yek9lMm1IYlIrdkE1MEttWWVYRXZreXMxaFpO?=
 =?utf-8?B?K3M0QUhrcVZ4cERtazl6dUZkWEwwdkpQUVptbnBsNFNOSnYzcWw2a1Yvd29H?=
 =?utf-8?B?aHBlOGpub1Z2b0JvcGM5Tkx3TmZSbGRVZ3NLaExwb1drdkRkMVY4OHh6am1o?=
 =?utf-8?B?TE1mSCs3aXU3dTBjVVZCZGp5VTlqejAzVExoK2lrcHR1N1Z1STBqS21LaFpD?=
 =?utf-8?B?ZE00c3p4ZWgzaDNueElyVzdwNUZ4YThLbmExR0F5aGZjV3NTQ0wvU3RJOWxj?=
 =?utf-8?B?b3o3YUI1NmhITUIxRzBCMmpnWTU2eWtESTJoUXlFd3VOZFNQODFoR3dEUXE5?=
 =?utf-8?B?WDZVMXBLYTlGVENtV0c2eG0xN1ZPVWJIeDE2OU5xU0ZWcWdQalk5MzNSZ3Vh?=
 =?utf-8?Q?NDRExt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:45:16.0065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e32a44-e418-4699-fb71-08dd7b847f7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215

On Wed Apr 9, 2025 at 11:24 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Enable selecting the mode in which the domain will be built and ran. Thi=
s
>> includes:
>>=20
>> - whether it will be either a 32/64 bit domain
>> - if it will be run as a PV or HVM domain
>> - and if it will require a device model (not applicable for dom0)
>>=20
>> In the device tree, this will be represented as a bit map that will be c=
arried
>> through into struct boot_domain.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> ---
>> xen/arch/x86/domain-builder/fdt.c | 19 +++++++++++++++++++
>> xen/arch/x86/include/asm/boot-domain.h | 5 +++++
>> xen/arch/x86/setup.c | 3 ++-
>> 3 files changed, 26 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index 4c6aafe195..da65f6a5a0 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -193,6 +193,25 @@ static int __init process_domain_node(
>> bd->domid =3D (domid_t)val;
>>=20
>> printk(" domid: %d\n", bd->domid);
>>=20
>> }
>> + else if ( strncmp(prop_name, "mode", name_len) =3D=3D 0 )
>> + {
>> + if ( fdt_prop_as_u32(prop, &bd->mode) !=3D 0 )
>>=20
>> + {
>> + printk(" failed processing mode for domain %s\n", name);
>> + return -EINVAL;
>> + }
>> +
>> + printk(" mode: ");
>> + if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
>>=20
>> + {
>> + if ( bd->mode & BUILD_MODE_ENABLE_DM )
>>=20
>> + printk("HVM\n");
>> + else
>> + printk("PVH\n");
>> + }
>> + else
>> + printk("PV\n");
>> + }
>> }
>
> I would re-write so the positive condition is processed first, e.g.:
>
>     if ( bd->mode & BUILD_MODE_PARAVIRT )
>         printk("PV\n");
>     else if ( bd->mode & BUILD_MODE_ENABLE_DM )
>         printk("HVM\n");
>     else
>         printk("PVH\n");
>
> I think it will reduce indentation and make code block a bit easier to re=
ad.
>

For sure. You're absolutely right.

> Also, if there are more uses for printing string representation of a
> boot module mode in the future, perhaps move it to a separate function?
>
> What do you think?

If there's more existing cases I'm happy to unify them, but otherwise
I'd rather keep the code inlined to avoid too much indirection.

Cheers,
Alejandro

