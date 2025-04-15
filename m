Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C000FA89C59
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953695.1348140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eUj-0002df-3z; Tue, 15 Apr 2025 11:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953695.1348140; Tue, 15 Apr 2025 11:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eUj-0002cA-17; Tue, 15 Apr 2025 11:30:25 +0000
Received: by outflank-mailman (input) for mailman id 953695;
 Tue, 15 Apr 2025 11:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=moIN=XB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4eUi-0002c4-0O
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:30:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2412::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00f1ae75-19ed-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 13:30:17 +0200 (CEST)
Received: from DM6PR08CA0045.namprd08.prod.outlook.com (2603:10b6:5:1e0::19)
 by SN7PR12MB7450.namprd12.prod.outlook.com (2603:10b6:806:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:30:12 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::f9) by DM6PR08CA0045.outlook.office365.com
 (2603:10b6:5:1e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Tue,
 15 Apr 2025 11:30:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 11:30:11 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 06:30:09 -0500
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
X-Inumbo-ID: 00f1ae75-19ed-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jX+/5NCTi6MMGdMIkI+NbXL/z0hreaZxI0j0vi2pWx5eZCfBsGswhEio016nMUWdPcsEPQl8ycohvhnlO7yfvL5Pe3TUe79ANQZqEfUEpvw7LYnQ7WQmWaOvZCHRZ2b/Cn+xrddblFM93/DdpKIuqxpm+mI4s+4fazGb6jSwsvhdlOJzHJ2AihyECHTPwXEy3FMRd7qj3BScrKZHO1yKGHh8jo5vdg+kqFKfIKJ2UkHSwaAq9PGC+4wHb+4y6cDkqLJ2UR17/ZxHIEH7LbYGRdYAvx3fCxBiGnHcRN6oGPl7jO2I2kzXyAgpwjccQZ3H9GZMRSqb/rcbWRCqMYpVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdTQNjf+VgUX7VAhqcNa0cFGyH1w/Dfx1UHX/MDtVpo=;
 b=hP6epBNcvD/pG3pT6F2PeTbPT4N3FRjdZz8nitbBusg7YKMX+vlN3wUNnZs1GYoRiXmXSGLhN5uFIORwBO0c3/5n7/N0a8t44WIX3QctkgDOzSe7VC98jEvaiLV2oQGrvm5xn8R7rY393i3Gg9mFqsm+RDTDCzsvPXOfyoSdbCAqeHmvCj2feCUmi+lT9cAVjF/gwkmUT01IL8o/5nJiTxcdRvcmUZXFfrNavbEd9RlAjUqCHPuOl60KfXTBbMIBtWEMJGiTbQsYTRUFCE0YT4FsVz1raa0sXawocUuL5W8iUom4JC15avaGmO8TTQV6497dOvq3oH+p8XmmXCA2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdTQNjf+VgUX7VAhqcNa0cFGyH1w/Dfx1UHX/MDtVpo=;
 b=B5oExZlzCgMOo6iDhmNfex/LJwhtU229f7HDG5togsn9t2x5oNxbSAIQJKa/bV/l3BKtqQy7jF0dyVHfNKtggDlOIOUVTvsTvxXsYAnpr6MMpcrBkJNCLSJh/YQMWUyaH1fjH83WMQuDu5QG/4URaDIVGe0q+Kvt9EwCD1NfSHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Apr 2025 12:30:08 +0100
Message-ID: <D976F4QPLMB9.2AZGDR11JD5OI@amd.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, <xen-devel@lists.xenproject.org>,
	"consulting@bugseng.com" <consulting@bugseng.com>
Subject: Re: [PATCH v3 08/16] x86/hyperlaunch: Add helpers to locate
 multiboot modules
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-9-agarciav@amd.com>
 <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
 <D96EI9O4XII2.195QNQNT1T3FG@amd.com>
 <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
 <D96K3ZYDCY4D.11Q4T2TZLNNEU@amd.com>
 <ea28d057-5fd5-4cc2-8833-5427015a4190@suse.com>
In-Reply-To: <ea28d057-5fd5-4cc2-8833-5427015a4190@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SN7PR12MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b16d25-0523-4c14-32c6-08dd7c10e265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck9PekdqR3J1Z0xTeGpLbmZmYkc5c2pLWC9KdU5keTlvcTlNc2NtYUlDWWE5?=
 =?utf-8?B?ZzVSZ1BpNlRaMzYyUk9DYnFBL0thWmc0RU5ocUh0dURvNG4xWW9YOVhNK0hG?=
 =?utf-8?B?byt6UkRvVUJ1eldsZ2ZBTmhCZTBrVWtCamRnTmUvREwyQWJkdWcxY3FTNG5Y?=
 =?utf-8?B?amZWMlBDNFFHRjlsQkcwVDdlMHByei9udVpNamdCYkN2OUN0UUlQZmFZM1R1?=
 =?utf-8?B?VkNHZzZWZlNnZFBDQ21jRFZWSnd1Z2c5WHdOWmpKYXA2aVh4T0JtWm5MejNJ?=
 =?utf-8?B?Yisxa3gzZW9mOHNNeDh3Si95OUVpUVhBREtSNDhVemV0MFI5akN3OWJ3MGIw?=
 =?utf-8?B?MHZZTGZHOVhKdUMwMGdHdTJTWkFNejhoTWxTZ1A0aW96L2FDNzVNaWswNXVM?=
 =?utf-8?B?b29aTHpUQ0tzWTNQaDFnZ2trNndJbmViQ3YyNWlHUVdVajIxUktzNjM3eVRE?=
 =?utf-8?B?d0l1UEJtaThqRFNoZzFoZUVUWUppUitqWUNrNGVXRDhtdXZnMko5VDF5NGRo?=
 =?utf-8?B?Y1NCNnVUNUhSMEhxQ2x3eko5cm1HVUJtZGJpZTRXTE9KR29EZWJhdURGY3Bw?=
 =?utf-8?B?Qklna0Iwc3IxYlBlNjJKVVlOeEJ5M1ZOVk8vRjVDbGRNTFZMcVFVQU5UVUUv?=
 =?utf-8?B?UDg4UFRyblJocjFtcEd4bnR2RDhJdXEwaWRpc2NLL2FLcU9lYmtmbzI4Mms0?=
 =?utf-8?B?NjIwSitxS05hdXZRTnVBbk44cFhsQWhiK3hNRFM3ZDVnN1Joekkwc2pZd05x?=
 =?utf-8?B?STdXajNLdFh3c0djL3htcEJwa3BxUDJST08yRk1OMFF4aWlReGpjbjNURFVh?=
 =?utf-8?B?L2orZU9lTnhIMExOampBYkJGWTkyMmhwTGIyWTVzanBaRzZmUVN2b282eFdW?=
 =?utf-8?B?MVR6NldGS0k2QWdsekE5V0gyb2tMbUJKNzJuK1k1ZTZ2K2FWNURPaU5nUnda?=
 =?utf-8?B?TmhWTUsxajRGb2g0cnJNTzlLUGsxcGhCcjJKV1hrU3l3bWVIQkJwenFzOUU1?=
 =?utf-8?B?VWtlS2cvVEZWLzRvSnF2dEFPY1ZpMDNkdUJKaThZS09aWHZucjU0YXdLaURK?=
 =?utf-8?B?SW9xTEVqRHZBSmNVNDdVSzBkNUg3VWVjNWlvMDZyTXorcXc0dmpZYXdCY2pu?=
 =?utf-8?B?bGJxdE5YQUtnTTR6T0UyUy9IN1ZoUVFQekh4U0RtVENpc3ZPV2t1U2daZEhI?=
 =?utf-8?B?Q1k3cURHeitmdjh0THlZM2FaSnVBWTlFRjQ0ZDllc3pIbTRlUDhqNHl5blJo?=
 =?utf-8?B?MFFmTC9LRkRoeHYzMEJPLzRRK1cyNmorOGptNGI5T1BDZTgzZVFiaUE4aUJV?=
 =?utf-8?B?TjhibWpkZnI4WW1Ia1FRUEFVVk1aTkdYN0xJSkdleG83VUVHWkppK3NiNDlE?=
 =?utf-8?B?Y29CYkFTSm40SXg3VklQcXd3S3BIREVsMExvOUF1REVzaXBIZXVBWWdsSFhP?=
 =?utf-8?B?Qm5paUNXOUR0OUFNWTBTMmhZdDhZRklpTE1DT3N2aXpPNVl1WHdBYzRib0Zk?=
 =?utf-8?B?dnNXUmhQeXBaeng0bTlIcWI0TXgvWjdRdDQzRnJKamdOQzE2OHlkRzJ2ZHFa?=
 =?utf-8?B?NVhSbmUvclQwSms2N0pic2E0SjdEQzVxaWo1WTlIazBPRk9FVGV3T1ZpdXdG?=
 =?utf-8?B?SWxSMVlOKzRSbFQ0d1BtOXB2UUNoQWhsS1NHQ3I4b3IyY29iTzdGUlhkVm1p?=
 =?utf-8?B?KzllNkl6SXdCTE5oUDMvNGtsbTh1YzVOU1NFYmdTOWY3bWV4Y1pETlBmdnNK?=
 =?utf-8?B?cENjazRsa2NqZmFvVjVWR0Q2NlBnS0JTNGFQTU9vdExCQWxWNGFoUmlva2ZX?=
 =?utf-8?B?N3czc2dIZldicGJzUnVwR2dsanVWc2ljMTZvelBMYU9KMkVTQm04MjN4THNk?=
 =?utf-8?B?QUN4SFN2VERWbE1yd3BVOGtWNmg4NUpMNkdGS1RmNDVWeHhWR1lCVjlyODFS?=
 =?utf-8?B?bWRkdVRYMGFQYXpOTE5NV0JKV0pPb0ZjWitBS0h3aHFad1hVenZrVmhLUWlE?=
 =?utf-8?B?RllDNG5pZjkzd2E3OTk3dEp6bFYySVdsMUVnRCt4NzlydkxhZUxXQ0F0ZjBB?=
 =?utf-8?Q?dTyZg/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:30:11.5144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b16d25-0523-4c14-32c6-08dd7c10e265
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7450

On Tue Apr 15, 2025 at 7:05 AM BST, Jan Beulich wrote:
> On 14.04.2025 20:01, Alejandro Vallejo wrote:
>> On Mon Apr 14, 2025 at 4:05 PM BST, Jan Beulich wrote:
>>> On 14.04.2025 15:37, Alejandro Vallejo wrote:
>>>> On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
>>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>>> +/*
>>>>>> + * Locate a multiboot module given its node offset in the FDT.
>>>>>> + *
>>>>>> + * The module location may be given via either FDT property:
>>>>>> + *     * reg =3D <address, size>
>>>>>> + *         * Mutates `bi` to append the module.
>>>>>> + *     * module-index =3D <idx>
>>>>>> + *         * Leaves `bi` unchanged.
>>>>>> + *
>>>>>> + * @param fdt           Pointer to the full FDT.
>>>>>> + * @param node          Offset for the module node.
>>>>>> + * @param address_cells Number of 4-octet cells that make up an "ad=
dress".
>>>>>> + * @param size_cells    Number of 4-octet cells that make up a "siz=
e".
>>>>>> + * @param bi[inout]     Xen's representation of the boot parameters=
.
>>>>>> + * @return              -EINVAL on malformed nodes, otherwise
>>>>>> + *                      index inside `bi->mods`
>>>>>> + */
>>>>>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>>>>>> +                                     int address_cells, int size_ce=
lls,
>>>>>> +                                     struct boot_info *bi)
>>>>>
>>>>> Functions without callers and non-static ones without declarations ar=
e
>>>>> disliked by Misra.
>>>>
>>>> Can't do much about it if I want them to stand alone in a single patch=
.
>>>> Otherwise the following ones become quite unwieldy to look at. All I c=
an
>>>> say is that this function becomes static and with a caller on the next
>>>> patch.
>>>
>>> Which means you need to touch this again anyway. Perhaps we need a Misr=
a
>>> deviation for __maybe_unused functions / data, in which case you could
>>> use that here and strip it along with making the function static. Cc-in=
g
>>> Bugseng folks.
>>=20
>> It's a transient violation, sure. Do we care about transient MISRA
>> violations though? I understand the importance of bisectability, but
>> AUIU MISRA compliance matters to the extent that that the tip is
>> compliant rather than the intermediate steps?
>
> Thing is that quite a few rules are blocking now. I haven't checked wheth=
er
> the one here (already) is; if it isn't, we can't exclude it will be by th=
e
> time this patch is committed. If then the next patch isn't committed
> together with it, we'd face a CI failure.
>
>> Another option would be to fold them this patch and the next together
>> after both get their R-by. As I said, I assumed you'd rather see them in
>> isolation for purposes of review.
>
> As it looks it's all plain code additions, so reviewability would merely
> mildly suffer from patch size. But afaict there would be no loss of clari=
ty.
>
>>>>>> +    /* Otherwise location given as a `reg` property. */
>>>>>> +    prop =3D fdt_get_property(fdt, node, "reg", NULL);
>>>>>> +
>>>>>> +    if ( !prop )
>>>>>> +    {
>>>>>> +        printk("  No location for multiboot,module\n");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>>>>>> +    {
>>>>>> +        printk("  Location of multiboot,module defined multiple tim=
es\n");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret =3D read_fdt_prop_as_reg(prop, address_cells, size_cells, &=
addr, &size);
>>>>>> +
>>>>>> +    if ( ret < 0 )
>>>>>> +    {
>>>>>> +        printk("  Failed reading reg for multiboot,module\n");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    idx =3D bi->nr_modules + 1;
>>>>>
>>>>> This at least looks like an off-by-one. If the addition of 1 is reall=
y
>>>>> intended, I think it needs commenting on.
>>>>
>>>> Seems to be, yes. The underlying array is a bit bizarre. It's sizes as
>>>> MAX_NR_BOOTMODS + 1, with the first one being the DTB itself. I guess
>>>> the intent was to take it into account, but bi->nr_modules is
>>>> initialised to the number of multiboot modules, so it SHOULD be alread=
y
>>>> taking it into account.
>>>>
>>>> Also, the logic for bounds checking seems... off (because of the + 1 I
>>>> mentioned before). Or at least confusing, so I've moved to using
>>>> ARRAY_SIZE(bi->mods) rather than explicitly comparing against
>>>> MAX_NR_BOOTMODS.
>>>>
>>>> The array is MAX_NR_BOOTMODS + 1 in length, so it's just more cognitiv=
e
>>>> load than I'm comfortable with.
>>>
>>> If I'm not mistaken the +1 is inherited from the modules array we had i=
n
>>> the past, where we wanted 1 extra slot for Xen itself. Hence before you
>>> move to using ARRAY_SIZE() everywhere it needs to really be clear what
>>> the +1 here is used for.
>>=20
>> Ew.  Ok, just looked at the code in multiboot_fill_boot_info and indeed
>> the arrangement is for all multiboot modules to be in front, and Xen to
>> be appended. But bi->nr_modules only lists multiboot modules, so
>> increasing that value is therefore not enough (or
>> next_boot_module_index() would fail).
>>=20
>> I need to have a proper read on how this is all stitched together.  I
>> may simply swap BOOTMOD_XEN with the next entry on append. Though my
>> preference would be to _not_ have Xen as part of the module list to
>> begin with. Before boot_info that was probably a place as good as any,
>> but this would be much better off in a dedicated field.
>>=20
>> I don't see much in terms of usage though. Why is it being added at all?
>
> For hyperlaunch I fear it's you who needs to answer this question. For
> pre-hyperlaunch it's (primarily?) for consider_modules(), iirc. See two
> of the three comments ahead of its non-recursive invocations.
>
> Jan

There's no specific need for it on hyperlaunch AFAIK. Fixing
consider_modules to not require Xen being on the list of modules is easy
enough on both arm and x86 (it's a matter of passing the boot_info in
full rather than array + size), but I fear there may be more instances of
such checks.

I'll let it be for the time being and take a mental note to untangle
it later on. For this I'll simply ensure the append logic maintains Xen
at the back, as a sentinel of sorts for the module list, and document
that behaviour in the boot_info itself.

Cheers,
Alejandro

