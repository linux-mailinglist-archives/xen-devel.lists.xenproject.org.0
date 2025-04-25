Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390CEA9C98A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968020.1357726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IZQ-0005O7-9T; Fri, 25 Apr 2025 12:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968020.1357726; Fri, 25 Apr 2025 12:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IZQ-0005Mf-6a; Fri, 25 Apr 2025 12:54:20 +0000
Received: by outflank-mailman (input) for mailman id 968020;
 Fri, 25 Apr 2025 12:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8IZO-0005MU-Ps
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:54:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2415::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a82c91-21d4-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:54:15 +0200 (CEST)
Received: from MW4PR04CA0228.namprd04.prod.outlook.com (2603:10b6:303:87::23)
 by CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 12:54:10 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::91) by MW4PR04CA0228.outlook.office365.com
 (2603:10b6:303:87::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Fri,
 25 Apr 2025 12:54:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 12:54:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 07:54:07 -0500
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
X-Inumbo-ID: 63a82c91-21d4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPgPAoxhY6BD/oqQ0O3/m0Dia8mgL+WWu/tLvNtwNsR2yU+etoUyuyr3HyoGHAAIii9Tn576pQXzKX3H3HxDoOfB0dxX5RFQv04sFC9ZN7XxMs66YMaymz72MGYU5I2GwD+3p72t46TszCNxR6+iBVE2SDSS9idDr7AcQIgtQzt0bPADNNfZ9B+CwmLk0tmIUx4zF7m/9Gbop4oHxtZZtvF7HiA08DanPBf5MM5D2FVW+UF9icSRBBXY/dSKe5kuAN/YEDL1Ic8toT+uL3lbzSYZwvgo3e680ndym1OSxCGU9IcxnEwsjnWetVtJLGEPnEmHvuoNpyfgLvmnyurvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpA0IsOcL84k4K+IiDU2FFoW7pmc4NixteRXMA26fP4=;
 b=RvegQIwJysy+e86tYHFbYQ3LWiHR82Hv2QVPO7VaRy41YZmZZlv8B+OLHw0hgLR6zFf85bKR2SuyN7pqlF2TuG7+pMMyvBGSOtw1MPQswsqC8IJg5SYphXqfEzNd7L2Y38MneAARWAipbxP7N6wfd495b6M5YJYnyf+qC7lidCpfjCuttis3KZCKiwuj+DO21cRSC/NgnPATZrIs6UVjQPpKefUEFR4FS9dwfU0JxN7WksWgC/Mzf5uXiiCa0T19tFqsRRqH7o99caE+6i6aMvTNvX3zFEm+sVzNgTqG7O77VEsjYXDPl0xL3ZT7Q8wS4D7NFWb6dIwlCov0S/6fwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpA0IsOcL84k4K+IiDU2FFoW7pmc4NixteRXMA26fP4=;
 b=PmB7tg6dd8jhOgS3uC4oAUebnY6XvqXO8s+pr1gdb2j+ZNlUNymxE4DRr59bI+Xbf+lbT4w9HyFJsZBpQaYersMVk1oFLI4guSIGeSOYEPinoynoD6DLEOFXsKP8Kf/r1W1/izU5d3webaZc7NkIenot6RpnNmTogT3BBBTPa1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 13:54:06 +0100
Message-ID: <D9FQGVAF15CN.11IV12O8WFG0C@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvmloader: fix usage of NULL with cpuid_count()
From: Alejandro Vallejo <agarciav@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20250424125813.96449-1-roger.pau@citrix.com>
 <D9FPTG9VXGV2.3OT1N6UFNG2WI@amd.com> <aAuDvqxihXBI9u2k@macbook.lan>
In-Reply-To: <aAuDvqxihXBI9u2k@macbook.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|CH3PR12MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c17ae63-5183-4ab8-96e7-08dd83f8453c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWhaMlIvN2pvbFJKcmdjVGNkak1rQVhFc3RrOHhvT0k3S3F2cmY4b3lCK1Nt?=
 =?utf-8?B?aDFoTkY3cHdaekVhdkZVc0xPQmdSODIxd1RTUVZETVArOUxGdXlSTGVUL1pD?=
 =?utf-8?B?RFJpM29YVGZrUUtrQ0s1TXdGdkE0WGJmay94cHk1SnkvcnhFbnozazRCdkxT?=
 =?utf-8?B?b0N3dkcvOERDTjJZT2R2azZDWFNWNDlyZ253bXd6TEJBeFlGTlMxYzQ1Nk4x?=
 =?utf-8?B?b1V6ZmhxQ0VJZGtwSFNxWmhWR2RieWk5Y09ZeWl1RDhMQk96a2doWmN4dlRR?=
 =?utf-8?B?bW9leUxqbE1lY2dRRUNVdEx5bzZBelhWTHhzL21kSFJlMWt6Sno1Nmh3aGpn?=
 =?utf-8?B?N0hudkJLVnBnNFY1a1V2VUI1VGJXdFRQTzNEU3hZVGhIRXhwZVRNSXBhQ1JT?=
 =?utf-8?B?TjQ4a2hKcUlrVEcwSUNzZ09VVVFOcUJyOEc0aHFWck9XcjMrVHhhR0Z5ajFn?=
 =?utf-8?B?amtZRjJwZFRFbXBWcnJOOUtHQ0tEeUlPVmNrcW9tdnhROHArOXoxMEN1TVlV?=
 =?utf-8?B?TkpnZ0c5aGJxL3o1QU1NWXYybEpzZWkzOXBXNWFzRDdqeE9pay9OVDJtejc5?=
 =?utf-8?B?VDIzZy9tMmJXMStwNDNXN0d0QTk5NzR3WjFobW91RHR6ZGlxbWp1SmRCTVV6?=
 =?utf-8?B?czhXS1hoMnVRdHBRTnNFNGxScE9SaXlpSmh1c3ZtQ1NXRTNvSHo4YXM0V2Nt?=
 =?utf-8?B?OXUwVTA2NENKRERNUW84OExtMENaNXMwMWU5QktZcSttL0FZYi9RRlNYNTlO?=
 =?utf-8?B?WWlVb1lEZEYyT2ZsSlYwdEJRWDVGWmJaZHRtQ3Rua2NIUmlFTzEyTHFUVFJx?=
 =?utf-8?B?VGI2WFF4RFlUTkpVdzI4Y2d0RGtmcWIxd3FFbmdteEs2UVlCN2V3M0ZqWFZj?=
 =?utf-8?B?OW1kZC80blNuL2NTVzZaM3dnZktqU3hiTnhoMHA2dERPTXdMamhBNS84UTNa?=
 =?utf-8?B?RWdtSWhyNHg2d205NDFFMEhWR0RqMTdPS0xlbUgzZk5TcFpnSWJVM2xqbkhF?=
 =?utf-8?B?bi9LYUVLWVZsajVXckZBTU1oVTFKYlF0WnRmdXpaUFpycUNLVlU4cGR2WnV1?=
 =?utf-8?B?SElsd3ZXclhwTkJVVXovT2t4b2I3NUdFb0dwQjdLbW1LdFJkTHZzNTdjYkJz?=
 =?utf-8?B?N0F1aGZEcHRvUEl2d0NrRzJqMFcxL1RxU3lSUkVRbG96WDBnQ1FIYXZFSzds?=
 =?utf-8?B?aFpWU2tSeDNwekVBL1JlQWVEVFluMWdRbm1BL2s4N3NXSHR5WW5XeW9nRFcw?=
 =?utf-8?B?NVpSNFZQL0xZWXpIZGxHUE93OGJvU2pUWVZtaGlmRkZVWm5MbGVQMXl2ZUdP?=
 =?utf-8?B?cjZCSndrdVdKY3RNeEFEemRQaDB6a3hYS0MyaWdQYW50czdRYzIvSUs5blE5?=
 =?utf-8?B?SVFBWnJ5eENmMFRRTlJEajE0TVQwVXJsMnpDUWVEZHp1NUsxbENhOXdIc2Qy?=
 =?utf-8?B?b0R4VjBOazJubXJXWWhOdlJrbDhMZnd6MkFWQWZSMnFBQTF4R1RiMDRDaDlh?=
 =?utf-8?B?QmJWQkhGQ3JDeTZVQUZXM0JxVUVBN3R6OEFxMmRmY3JPb1I1SHJqbzc2TXZQ?=
 =?utf-8?B?R1FHaGJ1M2RIUDdwWXBlMk9WNG5nWk1ac0VaaURCclRuZFJIMzlKd3NhU2s2?=
 =?utf-8?B?MGYrU2VaWWpQaUZLWEwwbitwSTZXK1BZMUN5Uzlobm5JVWFlYVROVkNUOEUx?=
 =?utf-8?B?T3BqMXR0cUpRVEhqZHViSDZpdWlDTHNXMURIeWV0dTc2bUJNeXlycjdqT0wx?=
 =?utf-8?B?R3FiNlFMa2V0cWJXeUFVeUpWOVdQMU4valhoVXMvbGV5M1dOMWhzL0JJamNw?=
 =?utf-8?B?bk12S08wZHpFaXFaWmJHZGVROFpXVzF6WnlFci95VnlVUWlKU1lmR21kWFBW?=
 =?utf-8?B?cGtJcGZRME4xdFl1UTZwMmNhMnhaVmdQRVdQR2RYc05IZGg2WG9LSjN1K1Z5?=
 =?utf-8?B?ZlJkc1dRbDdQN2FiWnJ4VDhXRFJmdWV4VnZCdUVPS2dXQXhTakRKbXJybVJy?=
 =?utf-8?B?eWUzdnA1Q25RRE80b0xHcjdqeWlicElnVFRVWVU3Unh5NzhXa2pwVHFtNWFk?=
 =?utf-8?Q?0MDB9+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 12:54:09.1799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c17ae63-5183-4ab8-96e7-08dd83f8453c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8659

On Fri Apr 25, 2025 at 1:44 PM BST, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 25, 2025 at 01:23:30PM +0100, Alejandro Vallejo wrote:
>> On Thu Apr 24, 2025 at 1:58 PM BST, Roger Pau Monne wrote:
>> > The commit that added support for retrieving the APIC IDs from the APs
>> > introduced several usages of cpuid() with NULL parameters, which is no=
t
>> > handled by the underlying implementation.  For GCC I expect this resul=
ts in
>> > writes to the physical address at 0, however for Clang the generated c=
ode
>> > in smp.o is:
>> >
>> > tools/firmware/hvmloader/smp.o: file format elf32-i386
>> >
>> > Disassembly of section .text:
>> >
>> > 00000000 <smp_initialise>:
>> >        0: 55                            pushl   %ebp
>> >        1: 89 e5                         movl    %esp, %ebp
>> >        3: 53                            pushl   %ebx
>> >        4: 31 c0                         xorl    %eax, %eax
>> >        6: 31 c9                         xorl    %ecx, %ecx
>> >        8: 0f a2                         cpuid
>> >
>> > Showing the usage of a NULL pointer results in undefined behavior, and
>> > clang refusing to generate further code after it.
>> >
>> > Fix by using a temporary variable in cpuid_count() in place for any NU=
LL
>> > parameter.
>> >
>> > Fixes: 9ad0db58c7e2 ('tools/hvmloader: Retrieve APIC IDs from the APs =
themselves')
>> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>=20
>> Ugh, that's on me. I was sure I saw the pattern in Xen (from where the
>> code came from), but clearly I hallucinated.
>>=20
>> > ---
>> > Could also be fixed by using the temporary variable in the call sites,
>> > however that's more code in the call sites at the expense of less chec=
king.
>> > I don't think the extra NULL check logic in cpuid_count() is that bad.
>> >
>> > Overall the solution proposed in this patch is safer going forward, as=
 it
>> > prevent issues like this from being introduced in the first place.
>>=20
>> Might be worth moving this same extra checks onto Xen's cpuid. There's
>> no shortage of `junk` variables at the callsites.
>>=20
>> > ---
>> >  tools/firmware/hvmloader/util.h | 11 +++++++++++
>> >  1 file changed, 11 insertions(+)
>> >
>> > diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloade=
r/util.h
>> > index 644450c51ceb..765a013ddd9e 100644
>> > --- a/tools/firmware/hvmloader/util.h
>> > +++ b/tools/firmware/hvmloader/util.h
>> > @@ -190,6 +190,17 @@ static inline void cpuid_count(
>> >      uint32_t *ecx,
>> >      uint32_t *edx)
>> >  {
>> > +    uint32_t tmp;
>> > +
>> > +    if ( !eax )
>> > +        eax =3D &tmp;
>> > +    if ( !ebx )
>> > +        ebx =3D &tmp;
>> > +    if ( !ecx )
>> > +        ecx =3D &tmp;
>> > +    if ( !edx )
>> > +        edx =3D &tmp;
>> > +
>>=20
>> A somewhat more compact alternative that doesn't require tmp would be:
>>=20
>>   eax =3D eax ?: &leaf;
>>   ebx =3D ebx ?: &leaf;
>>   ecx =3D ecx ?: &leaf;
>>   edx =3D edx ?: &leaf;
>
> But that performs the write unconditionally?  It might be more compact
> code-wise, but might incur in an unneeded store?

Pretty sure it would all optimise to very similar, if not identical code.

>
>> It clobbers `leaf`, but only after it's no longer relevant.
>
> My preference was to use a explicitly tmp variable, but I could switch
> to using leaf if that's the preference.  Given that Andrew has already
> Acked the current version I'm tempted to just go with what has already
> been Acked.

That's perfectly fine. It was merely a cosmetic nit. LGTM as it is too.

>
> Thanks, Roger.

Cheers,
Alejandro

