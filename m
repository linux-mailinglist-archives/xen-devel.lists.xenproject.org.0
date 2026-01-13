Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F464D1A1E4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202025.1517629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfh0S-0000eY-Dn; Tue, 13 Jan 2026 16:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202025.1517629; Tue, 13 Jan 2026 16:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfh0S-0000d5-B7; Tue, 13 Jan 2026 16:12:32 +0000
Received: by outflank-mailman (input) for mailman id 1202025;
 Tue, 13 Jan 2026 16:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfh0Q-0000cx-4y
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:12:30 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a77c2d6c-f09a-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 17:12:28 +0100 (CET)
Received: from MN0P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::22)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bea) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 16:12:19 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::f6) by MN0P221CA0012.outlook.office365.com
 (2603:10b6:208:52a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 16:12:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:12:19 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 10:12:18 -0600
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
X-Inumbo-ID: a77c2d6c-f09a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD7LVDJwJgpy1pRR6rBHAdnUys3k0MpZXPP2UfzDdCw/kEkRQ0DYHUg/CnM/bKFzoWuXLZV6bMdnz8r2ed8SATD7kVvvF7yUA8j/VU2CUfLHkIiOOkM0hNy3CyfwuuddlUdyPsC3hdghZ92lRq/UqP9DEksl4IUq+ui1/91aB07+6WkfrfTf4moPlyt0y2K4uGziYwMHCYotPN1Wi2du32riq8xV9usmHovi669Dy+N9mLfWWVLnnyNXX1GEN3A7YS9qnvnF20ge4caQ6lDhi+Azc65gzc+dwHjVvdRO7dPRCTEy6V4y6ULs2ZviwAh5H5s1+sukh1QNktCZ3eAqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWNOwq1lrhQvLqw3PU5BGCqafDNlZIEQ6aIGHgr/KpE=;
 b=lyQpeBflycrJFCJmsPqh5RnGBf9tjd2lWo1S92VBFY9YhRfnUBXEAWSLgEJHhuYVTg8U8V2lNmrgGBBaJNpe2Uacf2tu3e2gQZiqDDZlAAmwMK9DjhMERiOz7wy8PfBYP1+BXcIOmBTcfZ3YXpQKGl4x0KDMcb2NzRrlcUMNe4U4dqc7jYyRBrYV4yCgHhjxbXKtjLg/I2CsHp8BmppX0QWEsPlNWi3PLg3nDANj6AZQtlaK1xehDuP0UGmiO9iIvo8oudCEqLM+6Lq39Au74IzG0sPBtk49akDBuM/TVWUYQUZdbkq5fZQ0xa13h36v2eZW/LrQ7iUjuRo5IK+NOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWNOwq1lrhQvLqw3PU5BGCqafDNlZIEQ6aIGHgr/KpE=;
 b=JpSR11irIHdUNOlkk8bd82YzIPXqXK0OirCH5zQxTqhKbkA4Xd/XUv7s7Yop6PMHfOCk2FxXSuulkBDHf8oxh+jXzied2hPEqwSyNYayumVzO4AqR8j3Jm1HEnWAy+tFfbqAS4RhWA6ngIQR3uGI7dS9nQ1cxIjyedA4kkpr06c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2026 17:12:11 +0100
Message-ID: <DFNLDTH4EKQS.1UL1S5Q9OEQ5O@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 4/4] x86/ucode: Add Kconfig option to remove
 microcode loading
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-5-alejandro.garciavallejo@amd.com>
 <0706617f-fdb8-47c1-94f4-6aa92abd07ec@suse.com>
In-Reply-To: <0706617f-fdb8-47c1-94f4-6aa92abd07ec@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bb0dd5-a3c6-4932-3ea9-08de52be8720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEVJbTJmb0RJNTd6RGRRWDIyMERlbzZuL2REN0lCVVhwenRJbFMxL0U4MUJL?=
 =?utf-8?B?QUxFWmJuMTB0T0RNbXNUWXlHNVBLbWR4UElyd1AvbS9oN1ROYzFVZWJCUTVa?=
 =?utf-8?B?MnRISFZJdkZMcTdickdxTjdSbGZlUEU0cWlmdkJCSk10ZzVHREk0TkQ5QktI?=
 =?utf-8?B?NHJIOHVJVEVBMTV6eGJOcEM3SUxiVXB5RVVheTN0bG0zOFYyYUxrWEVwQ2cx?=
 =?utf-8?B?RXBheWVkNWhDaHl6R0ZVeTc5N3cwc1c1MUVzRmc1eXliSEt4MzRwUGljckNl?=
 =?utf-8?B?SFpWZDJhTGhaN05Pb1R3cEwrS2poYjJrVFl5STV1QkVXQVJBVWVyRnhFMEJN?=
 =?utf-8?B?K0VaQWFnbnpxNXB2V3ZRMk53b1BXcFNBendWLzl3Q2ZLS1kwb2JzSk5JOHAz?=
 =?utf-8?B?WFhPLzBVZDVHTzlJaTdtUUpTQzIzUHF0alNhdWNvbzFENlZMWTdJK2s0aTM2?=
 =?utf-8?B?bWZUT2g0M0RnNnJPYjRXaURjckdMeFZaQXk4VVZiUnExY0FMb0NHZXFBOUZU?=
 =?utf-8?B?VWhZb2ZicW96ZWVaRmVqbWNvRnh5OFEwbWtiTzlocWluc3JiVGNoSnA5TXNN?=
 =?utf-8?B?VHJ6VmF3YXhmUDJUdjl1M2IxSHk3aWFlZTJjMXFzMjlXazlnOVRQYTBISklz?=
 =?utf-8?B?OTlVanpMQ0RnSVpEcG9ZSVltZWxvV3BYbG03Wm9JV2dCRG50UllRbXI2OVE3?=
 =?utf-8?B?VWw4czl0MytsS3FvTDlqWmxlNHlDZmIzdll5amhjeVhKRlErazVlZFJTckpJ?=
 =?utf-8?B?YXNIaS8xWEE2a0dUaUpFdU56UE1EVCszTGZVWEd2VERrbEMzdEI5QkFjME0y?=
 =?utf-8?B?YlpTazdqY0JsTzd3RmwzT2tXTEIyUjJ0NHlaSlY1K1l1b0t5Z1l4ME5XemUy?=
 =?utf-8?B?R1VxaWR0bm1OSGNqemZ2cUhUOG5BbS9sKzZKMlNJRlJHUzBHMEl1YVp4b2Nv?=
 =?utf-8?B?MWhSc1Jjbm1pOHFGZVB2TFZWUUJUMmpGWU01QStmYWxKYlJkVjJRNEhONmUr?=
 =?utf-8?B?dElvenhUMFViQXAwYk42TkFXYUZjaUdsWVBpZSs1U1RielhCak1mK0tpNktR?=
 =?utf-8?B?QjB0YStLQ1BYWXVnMWZBeU5YSHdqdVhPODRQeHczSys2VmRoRHgyQXdvejU5?=
 =?utf-8?B?aFBLTUZqcTBoRlc4Rm1xNjVHdVRFUm9Ba1hGWG1wY0wwYWVSY3d0WEVLVENi?=
 =?utf-8?B?YUZSY1RzZWdvRkNRcFBCbVJKNldkdE56NEtickx1anZVRW9KVkM5QUNkR2Fi?=
 =?utf-8?B?RnFZYmx2TkRVbFpoYXJoZWVndTkrcEUvd3doa2w3bW50QlF4UFd2OTEyRmNy?=
 =?utf-8?B?N3ZxTlcrVXgxaVM2NTFaV0tNRjJCNGkxTEhDaFFkMCtaaFdBc0plNWhmQVMw?=
 =?utf-8?B?TUJRdlNXT3NhR2N1TUFXUkhNL3JwQ3JVZ3lWNlNCcGZlMWpPYkNqaVBTaVI4?=
 =?utf-8?B?Qlp4elI1ZzEyUmxkU1dnd2YxVkw3OWZUMzhVT1Z5eWhOSTBmQzRUNmswOC9P?=
 =?utf-8?B?QVBjTE83ZVRTcVhVRGFnME8zditLbW0zRzRFM0hLVHA2WnBEeHRtTnBlR1Zm?=
 =?utf-8?B?SjBzQ1RvcnBqVVdhZ0c5cCtzTWlPU05xeTZ2SXRqLzdlNkFFRUxUdERMSmFh?=
 =?utf-8?B?TWJCUWQ2QTdhODdieWhHYzhOWGpGWXlld01uRzN1MWZFV1JKVk85TUtwdmJU?=
 =?utf-8?B?SkFEODg0RnpTREdMVUtHcXltZFU1VnBGQ3BkTHVJNGcwRFl0OGU0SXJ6Vit6?=
 =?utf-8?B?SGdoc2FROTFhc0Ywc1c2SXVaRDk1VnBFU0xKcFFwY0VNcXdqSGs0SVNoN04w?=
 =?utf-8?B?K1BuK3FTNjZiMk5FTTlwcHkrR2V6Ui9IS1h1TGlaekhwdVg2bzc2dTd6MER4?=
 =?utf-8?B?TWYyWlJKY2hUYWE4aEZFMllQa1BsYkJPbVUzRjBSbHZCUUNNcllHZ0tUdm1t?=
 =?utf-8?B?eVZveHBjUDVkd1M3L05yUlh1Z1pFZ0VlVHdCN0Nab3VHZE9HeHJsMW1EME9n?=
 =?utf-8?B?TU5JR1IwT04ydGVrd3R3OGFJeWRxVmR5TUFDNUJ0L2U3c1N4ODhhWHF6Nmd2?=
 =?utf-8?B?cEQ0bDBWbVU1QjhlMXI1UUZ2QjBheWZ2dEh0OElSWUZ4WDYvVnhkd25lZWQ1?=
 =?utf-8?Q?6Z/4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:12:19.7053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bb0dd5-a3c6-4932-3ea9-08de52be8720
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86

On Tue Jan 13, 2026 at 4:27 PM CET, Jan Beulich wrote:
> On 13.01.2026 13:21, Alejandro Vallejo wrote:
>> @@ -469,7 +471,7 @@ struct ucode_buf {
>>      char buffer[];
>>  };
>> =20
>> -static long cf_check ucode_update_hcall_cont(void *data)
>> +static long cf_check __maybe_unused ucode_update_hcall_cont(void *data)
>>  {
>>      struct microcode_patch *patch =3D NULL;
>>      int ret, result;
>
> Why this change when ...
>
>> @@ -613,6 +615,7 @@ static long cf_check ucode_update_hcall_cont(void *d=
ata)
>>      return ret;
>>  }
>> =20
>> +#ifdef CONFIG_MICROCODE_LOADING
>
> ... this can simply be moved up accordingly? After all ...
>
>>  int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
>>                         unsigned long len, unsigned int flags)
>>  {
>> @@ -645,6 +648,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) =
buf,
>>       */
>>      return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer=
);
>
> ... this is the only user of that other function.

To minimise the scope of the ifdef. It's hard to know where things start/en=
d
when they cover several functions. This way it's (imo) clearer.

I don't mind much though.

>
>> --- a/xen/arch/x86/cpu/microcode/intel.c
>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>> @@ -408,17 +408,20 @@ static const char __initconst intel_cpio_path[] =
=3D
>>      "kernel/x86/microcode/GenuineIntel.bin";
>> =20
>>  static const struct microcode_ops __initconst_cf_clobber intel_ucode_op=
s =3D {
>> -    .cpu_request_microcode            =3D cpu_request_microcode,
>> +    .cpu_request_microcode            =3D MICROCODE_OP(cpu_request_micr=
ocode),
>>      .collect_cpu_info                 =3D collect_cpu_info,
>> -    .apply_microcode                  =3D apply_microcode,
>> -    .compare                          =3D intel_compare,
>> -    .cpio_path                        =3D intel_cpio_path,
>> +    .apply_microcode                  =3D MICROCODE_OP(apply_microcode)=
,
>> +    .compare                          =3D MICROCODE_OP(intel_compare),
>> +    .cpio_path                        =3D MICROCODE_OP(intel_cpio_path)=
,
>>  };
>
> While I appreciate the intention with MICROCODE_OP(), I'm not really happ=
y
> with function pointer members left in place just for them to be NULL
> everywhere. What if a call site remains unguarded? With PV guests that
> would be a privilege escalation XSA.

I see where you're coming from, but these are already NULL if microcode
loading is not exposed by the underlying hypervisor (if any), or is blocked=
 by
hardware in Intel, so arguably that worry is orthogonal to this.

Also, only a privileged domain can perform late microcode loading, so the X=
SM
check would prevent any such XSA from coming to pass. dom0 crashing the sys=
tem
on a bad hypercall (while wrong) would just be unfortunate, not a security
issue, as far as I can tell.

I could indeed get rid of it all. But that'd cause a sea a ifdefs anywhere =
the
fields are accessed, which is contrary to the current intent of relying on =
DCE
for readability.

Cheers,
Alejandro

