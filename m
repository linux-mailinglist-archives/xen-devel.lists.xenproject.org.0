Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A92A9EFAD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970618.1359264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9N0z-0002w0-He; Mon, 28 Apr 2025 11:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970618.1359264; Mon, 28 Apr 2025 11:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9N0z-0002tB-E3; Mon, 28 Apr 2025 11:51:13 +0000
Received: by outflank-mailman (input) for mailman id 970618;
 Mon, 28 Apr 2025 11:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1Z=XO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9N0x-0002sy-Ck
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:51:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2418::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e3247c-2427-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 13:51:09 +0200 (CEST)
Received: from BL0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:91::36)
 by MN0PR12MB6221.namprd12.prod.outlook.com (2603:10b6:208:3c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 11:51:03 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::12) by BL0PR05CA0026.outlook.office365.com
 (2603:10b6:208:91::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 28 Apr 2025 11:51:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 11:51:02 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 06:50:57 -0500
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
X-Inumbo-ID: 12e3247c-2427-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gx9M+9+kbP12dS3FN2ML1wBzOfIHYea74vFuSvlXFwps0CRQtWTy33TtXaGpfF93K9oem/7Yy/TBFXr2PrI/Azc5eH+ciVKELvqxp3PxU/TX3jk8OFqUKmCWIDmOrKsSHzxc5YEC41YUv5bYJ4wRKefWhmKUJgfzWsks2l8JEFuTNtzxLPHJ6KRgTcNNWC5WfcwQRnWQBs/zAEJILzNrnAN2dsx9I5A2hyBA9zo5K0rbmRKThxBi82Ztjlku8SnWLGNhO3Trzzi+33JP44qzpfs431ch10BOV/PJEcOzZ9mEvk4wjvf45Otmcqqahk4KD3fDk+CcZy81aywX9456GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS8fdUWWkq7VZacX2yGgRBM51zTyE/wsYy1jqPyvOzE=;
 b=w+WpuWh3PDY1UALlMy3/bsOCNT5Vvt3aO+KTxSdzE8JAOeJ2/WndQ99nHqZjm+MrO1AhNSRgteoXYZI+4U7LX1R4PyloFk+BGYCw4rNaLvKNfSVtsG0KtC/1zNrwIP19NRXR/mlOgff7E5wRstX0jtuyK8OIENBX+X98zYsvQ9UjY+d55v/Um+9tmKA7M2dkfZ0esdQgoAfQoo6aTyzd76eK3fu6uMpaUSP6JUJ/dPEnWbSnGsjNi3jbkVHkZDT56KuA5/A0W8bP9Rf1mr6l7c5taJ2N0z6/22kcWCs0WxtBkZ53AMijOWVQ1abZHy/I31hVcP+Z7UYlW4nesEvFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS8fdUWWkq7VZacX2yGgRBM51zTyE/wsYy1jqPyvOzE=;
 b=AudjcOD+LJhApBlTA6i68Mwufw1IlLMbAF3ZvkEMsAD4lUQCrT24MSJbfIhgc6uSHG2k+qr2RW3hdKM2yAGwAzGhoXwPgRg0CiKgi1AJlQisaJz7Fn1cbu1RmYTEvR7oC34piv5qkPM/4EXVTx+jE9/CAXnCllthD4cR8oomS30=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Apr 2025 12:50:55 +0100
Message-ID: <D9I904ZOCMVN.31C4DUMXROGDK@amd.com>
CC: <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, "Alexander M . Merritt" <alexander@edera.dev>
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
From: Alejandro Vallejo <agarciav@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Ariadne Conill
	<ariadne@ariadne.space>, Wei Liu <wl@xen.org>
X-Mailer: aerc 0.20.1
References: <20250425234331.65875-1-ariadne@ariadne.space>
 <aA9NMJVbyXeMOOY-@macbook.lan> <D9I7TPLT0EJD.3F5P95H69CT5K@amd.com>
 <97d28edb-4274-408f-a825-d09fa771e21d@citrix.com>
In-Reply-To: <97d28edb-4274-408f-a825-d09fa771e21d@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|MN0PR12MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 70942c3b-ce4e-44bc-aee6-08dd864af333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QSt3SFJiZk94d3A0Z2k5SzZhUWthUjcxZlJycStKOXUvMUZvRC81cU1TUFh0?=
 =?utf-8?B?TktkYVQxUzh3SUk2NUNkZElUSmVmdk9wVVY3UGgyL0dsNUhJU21zRU9vc3NL?=
 =?utf-8?B?amN5UjlwNU9iTWg1RVRiV0M5QjhTbGhaeVFyNzd1RUNOSHozQTVkclZDM1lw?=
 =?utf-8?B?UVpxODVWMFI3UkNkSGRGNWpSRlFkS3hsMnlQMWNla1B2b2ZrTklQcm4wc0lR?=
 =?utf-8?B?WTRueFQ2Ly9udXZEc2VYT0I5NXRKTytFZ0lEMmU2RjRpMzZ3VG1pZDdKZXhw?=
 =?utf-8?B?VC96T2hQZUNZaFVibzJ6anBSb0JUSEdDU3JUSERJaXhoVWE2N1ZzZXp5TlNh?=
 =?utf-8?B?RlhoZWFybFBrNzVlTVlDbjVDQ054SVJyK3hhaUhUZjd0VDFGMFFDdHN4S1Uw?=
 =?utf-8?B?VTFrNUR6bFFTcUR4aEdQWWVYQ2o5NDJEYnV0TUdFandSM3k5ZEsyMEExaHJv?=
 =?utf-8?B?em9wMXRWd3NwdWdNMDMza01GWEpZMHdjTkkxZXpIM21MY05yKzcyaE8zVGE0?=
 =?utf-8?B?MksyWm1EdGlDUVd6UHphWFlyMVFWZ3B5b2haOWIyNG9kUFBRZ05Gc29MYkkw?=
 =?utf-8?B?N1poenhLM3FwS0x5a0xPMXJCczRWbVVhNll2eHhSQ2VmNnJ6ZkFqcERCUjdw?=
 =?utf-8?B?eENaYitLOEV2SDhxVHphWk9MK2Y5dFlzbFpsMTQ3VEhsTlplSE9Bc01MeVNw?=
 =?utf-8?B?U0RJdEFzL3dnTXQweVJ6MmRFZUEzNitNa3BwK1hIUVdIWmVmUEt5MjB0NE1C?=
 =?utf-8?B?WElKTkIvc1hkV2dWdWR3MVd6SnBOdk91OGJHTEIrMHdCQnJ6cnFYUTE3Zk42?=
 =?utf-8?B?VmpUVytQV2VYTU1lZzB0Y2d3ODdkcUxCeG80UHkvK0NBT245VkZxVzZweXNH?=
 =?utf-8?B?Q2ppY1BFRGRoWE5IUzB3OVVFQnRYSU9jSVJxTkVIbzVaUXNxdSt6bURPcXp5?=
 =?utf-8?B?WHJhVHF2ZWRHNmxzMDVlQlhnS1BRZUJYcEpuY0NyYlBtdDhtVHBUSWdTNXBv?=
 =?utf-8?B?S3lHRjJMK0UvUit1OTd0eERjWENPdzc1U0NIZWJHYXY0KzlRVUUxL1dlQnh1?=
 =?utf-8?B?YnlDTVFYdUxWSEthSGl1ZkxzbTZVeG1aS2t5bkNSY3ExNHJpK3BkR1lQMS92?=
 =?utf-8?B?Z3QvNzFFMkdhYmlYYTJuZGRVcFRFUHFYYlY1K3piYTg5VWpQWFVqM3J5U1Uw?=
 =?utf-8?B?cDMwYjQ2aEtQZVhoUGRVWFpkMnIvVmEvSHVBUHd6cjJtK1NVYXZlYy9BYjlO?=
 =?utf-8?B?anJSblpaT0l6YUtTVWYvSUhodjRKVVlINWNOdEd1TmF1b3lMWFhlb1Npb2Iv?=
 =?utf-8?B?aVUyRFhvMWNpTlFXV1puSVZlQzIwUkNnVkN0T1ROOG9hRHBPeFBUNnE1eCtD?=
 =?utf-8?B?VUp2bXZENWdyb29PcXRQSjlOVlNaV2t6ajQ4MzhVaHRqdWlZZ2Z6bW1HYzdI?=
 =?utf-8?B?WTY4NHlZU2c4dFRVQTlhQXIyWFNNRzIzQ3I3NGJmWjNyZFNZaWk0NXdKcmwx?=
 =?utf-8?B?VHpvaFJKUEp1YnorVHV5R2p2SDNPMWNjR0ZhbVRRaTluamI1N0tWbGJ6ZFVY?=
 =?utf-8?B?YkF1ZHUxNmpvekdKUlNaQnF1eHJqMnc3WE9QREFORkNhcmZXcFBVYkNJS3Uw?=
 =?utf-8?B?R251VXNHZ2JKWmcvelZHWmxIcktBblducDJHeWRSY3NrZ2YrNVpZV0hvOWJw?=
 =?utf-8?B?dkhLcWpjWlBvYUdhdy8vSTFmay83WnhjaVFvNlFYZ3p3WndjWnAwSytRSFdo?=
 =?utf-8?B?UlI2bFMwSnY0TDg0T2J0Y3liU0NhcGNOR0lVL2ZLMXNITnRCbTZ1VXBneE1Z?=
 =?utf-8?B?dThHdm5HK2ZHQWh6dVRiSmFoYTlHMDZLVEFDc0tyaXVHY0hkK1RlcmhmWTdv?=
 =?utf-8?B?emFLS3UzUU0rT09vWWg3THpiUm8wU0d3QklCalJNc21pb2RnNzNVcGs2WGtz?=
 =?utf-8?B?WFdROTYrRFNnRFU1akM4MFR4eXIvWC90bWo0d0NScDhNWG0xMTBDSXBzS1Ey?=
 =?utf-8?B?U1JKMC9MTTdObG0wN1JIWmxKOW0xTFZtNnRjQTljVktYeVhlZ2o4QlZZYVM1?=
 =?utf-8?Q?269XRf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:51:02.1998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70942c3b-ce4e-44bc-aee6-08dd864af333
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6221

On Mon Apr 28, 2025 at 12:07 PM BST, Andrew Cooper wrote:
> On 28/04/2025 11:55 am, Alejandro Vallejo wrote:
>> On Mon Apr 28, 2025 at 10:41 AM BST, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Apr 25, 2025 at 04:43:31PM -0700, Ariadne Conill wrote:
>>>> Previously Xen placed the hypercall page at the highest possible MFN,
>>>> but this caused problems on systems where there is more than 36 bits
>>>> of physical address space.
>>>>
>>>> In general, it also seems unreliable to assume that the highest possib=
le
>>>> MFN is not already reserved for some other purpose.
>>>>
>>>> Changes from v1:
>>>> - Continue to use fixmap infrastructure
>>>> - Use panic in Hyper-V setup() function instead of returning -ENOMEM
>>>>   on hypercall page allocation failure
>>>>
>>>> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
>>>> Cc: Alejandro Vallejo <agarciav@amd.com>
>>>> Cc: Alexander M. Merritt <alexander@edera.dev>
>>>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>>>> ---
>>>>  xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
>>>>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
>>>>  2 files changed, 7 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/h=
yperv/hyperv.c
>>>> index 6989af38f1..0305374a06 100644
>>>> --- a/xen/arch/x86/guest/hyperv/hyperv.c
>>>> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
>>>> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>>>>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>>>>      if ( !hypercall_msr.enable )
>>>>      {
>>>> -        mfn =3D HV_HCALL_MFN;
>>>> +        void *hcall_page =3D alloc_xenheap_page();
>>>> +        if ( !hcall_page )
>>>> +            panic("Hyper-V: Failed to allocate hypercall trampoline p=
age");
>>>> +
>>>> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_pag=
e);
>>> This likely wants to be a dprintk, and possibly also print the
>>> physical address of the used page?  And no period at the end of the
>>> sentence IMO.
>>>
>>> I think Xen might have used the last page in the physical address
>>> range to prevent HyperV from possibly shattering a superpage in the
>>> second stage translation page-tables if normal RAM was used?
>>>
>>> However I don't know whether HyperV will shatter super-pages if a
>>> sub-page of it is used to contain the hypercall page (I don't think it
>>> should?)
>> I think it's quite unlikely.
>
> It will shatter superpages.
>
> The overlay is not part of guest memory, and will hide whatever is
> behind it while it is mapped, which will force a 4k PTE in EPT/NPT.

That's an implementation detail. They can very well copy the trampoline
to guest memory when there is such (and save the previous contents
elsewhere) and restore them when disabling the trampoline. It's a
trivial optimisation that would prevent shattering while being fully
compliant with the TLFS.

The actual physical location of the trampoline is fully undefined. It
is defined to be an overlay; but that's a specification, not an
implementation.

>
> Thinking about it, a better position would be adjacent to the APIC MMIO
> window, so at 0xfee01000.=C2=A0 The APIC MMIO window is forced to be a 4k
> mapping too, and the rest of the 2M window is normally empty.
>

Sounds like an assumption waiting to be broken. Just like the last page
of guest-physical was.

Cheers,
Alejandro

