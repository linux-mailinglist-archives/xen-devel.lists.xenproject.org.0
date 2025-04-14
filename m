Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE5A88A9A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 20:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951108.1347239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4O7X-00075c-Sd; Mon, 14 Apr 2025 18:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951108.1347239; Mon, 14 Apr 2025 18:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4O7X-00072w-OD; Mon, 14 Apr 2025 18:01:23 +0000
Received: by outflank-mailman (input) for mailman id 951108;
 Mon, 14 Apr 2025 18:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4O7W-0006sm-4b
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:01:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2414::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76b61413-195a-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 20:01:19 +0200 (CEST)
Received: from SJ0PR13CA0047.namprd13.prod.outlook.com (2603:10b6:a03:2c2::22)
 by IA0PPF44635DB8D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 18:01:15 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::f9) by SJ0PR13CA0047.outlook.office365.com
 (2603:10b6:a03:2c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.8 via Frontend Transport; Mon,
 14 Apr 2025 18:01:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:01:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 13:01:12 -0500
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
X-Inumbo-ID: 76b61413-195a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2Px/0X2Ql3aqAtNrMN5dJzU06Lt072QJ5wkSJrFu3UTey8p0+0Un0Hk8RvcJS63fRVpUQr9F5I0MVD5mmijwl1fVFxjKHnsi4D1zx2qaF9PbxxONzXeXpguEH/3rcmz2thr3wiDM6stxvc6r5mMeca7P7vW2wD/CFxp0egFdG4VPZoPrClF1QeqDBc02kg4DP0xNcSBvXTf/9vBvU720VDbeL08FSy4BWq5Z5IAdKrtaoEL/KehQ5EijyhC9xRbbQgBKStwN3uMQSmJIVuAbPMzZXpDXCYhRQaJlrSLMwKYFcyp2zIiO/83pTJ93IKa1bJOlTScx9JsZh0eb08c/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN5ymXQoYah6472IumIDgZsMt8kkI5QK2ON77HR7ZOQ=;
 b=UWBxkchFxzw0/muadiTsUjGy/UjQpR5++3qWO9+Bli81QV1YmHjmKES0V7PdVvKJ/djIN9/Ngj/ZjyHgRkodZuCBVU+UrU+38KqBeCyj16TDQVMjdbvylMpvBasQ5F7shD9tYg0kTOtBKn+lW4V5gOzsXUoycKjax0XKUtxrfQ0F0Yn7uS8vlqxSY71MAMpWiKwqADhTOQLh5HK1yTD5B5lQ9Uxayrlk60lv44WzEgR2coLA2gzvCCbgCmypyE7VTBUKnFaIt9g/39+xL8412PX8wyn6z0BIBsfx+X1ktStPrq6fVaNLLeV674wcOzCkZGmZZQraXl8UyYIGcxzTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN5ymXQoYah6472IumIDgZsMt8kkI5QK2ON77HR7ZOQ=;
 b=PCFX6uMtFC5ALAAUn1wrBK14iZ24OrdtuwQLJf+T51iSBibvKJUZtNBxNr103Uobxf2mpXNm91NPE8Zim0X+8nNwrAmO9By6u1bUHPnK6iAQW4U1s+6E6L4CnWJP5OxFaYcviUeU635NdGxC46tkj/ocrGVY/kgQkqJH6/I0ihM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 19:01:11 +0100
Message-ID: <D96K3ZYDCY4D.11Q4T2TZLNNEU@amd.com>
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
In-Reply-To: <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|IA0PPF44635DB8D:EE_
X-MS-Office365-Filtering-Correlation-Id: ad48c50c-09c6-481f-0e1a-08dd7b7e5913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2N4bHRtLzU3VjF1bjRnWER0YUV6M2tXUDRXOCtWcnNsUWFGaVpEb2dVWmpN?=
 =?utf-8?B?bVhMVmNpL29nR0FjcnMvMEdOSExiWDY1M3NHOGxYZi9BUnNaSGpOYVJEalVz?=
 =?utf-8?B?RThyNnZWR043bStSOWVpNlVWQVZYd25Yck1ramptblJOYXRXSXdTQldoTDhG?=
 =?utf-8?B?RXZVMW0wT2JwVDJYeHBQd2U5YzI2cnlKYXhVWHMwc0JrTG1vbEdSOXZuaEJI?=
 =?utf-8?B?UG5PSGhyODZpdTJ4MHVCVHpRWTROWjJCaTU3L2RlSFhPUFdtd05rM3FvOXAz?=
 =?utf-8?B?UUsxa000dWhnUmRibFIzMTlZZ3FxdXlMa3RtZWpaUjhSaHhTL3dTWGJ5YWgz?=
 =?utf-8?B?eXVpQVlmRnRZV0s2ZWZXeVhLelJkanV4ZDBVNXBKRzlHOTZzdVFQVzNNOU5j?=
 =?utf-8?B?R3lVQWJ6N3VGL05oVDZDay9iOHRMNnVUVmdxTXZBWGNjdWkxOHBUMjFObjNq?=
 =?utf-8?B?Z0ZmejJnMDJjYk9iTElMVnJod05NdGtsb1c2NnhCcjMwdkc3N1ozaFNNNFBJ?=
 =?utf-8?B?Q0M2SjZ0d2tPUXRpWjJKVk9Eam5hblZmTEJZSk10akNMUWVIWmpBa0haL0pL?=
 =?utf-8?B?VHhqTHNDWFMvNjVRdHB4WFI3MDBoSkJvc0VjdGgwdnV4MkZSOWE1cGgxazFu?=
 =?utf-8?B?QmlZWmhscnJKS2krT3YxWjN5blJpQVgxREtURmJ2Ty9ZZ1lTK1BJZDV3U3JK?=
 =?utf-8?B?Ni9jclpWU3daQ1h2cEpiUTJGTHlGcDRCd1BHNmhXOEh4d3NNckFPdU0zdGQ1?=
 =?utf-8?B?bGtyZHN5eUFQWUNPMjh3L3lXaWhWLy9yZHBLRlo2NE9LblhaRVNHaWE0aDFU?=
 =?utf-8?B?VGpCNXJ0T3FzU1pJQkV3MHZGZ3hhS1F3OGNmNERYbXE0WkJlL0V0OE1RRnY2?=
 =?utf-8?B?YVhpcUdpK1E5VzdNbDNQTjB1aVhZcklZYllRWXpVbzBYOU03Q1ZsL1VlM2c4?=
 =?utf-8?B?SFA5cEc4ZVBTRTEvZUlkdXlDR1kvM1pNOVNBcFo3eWxCcURTVWFZQnBQd1BU?=
 =?utf-8?B?Y251aUJjcjR3cGVFc092dEk3Y2pKUFlkeFQxNWYxZm4yakp6MUJvVm11VnlM?=
 =?utf-8?B?VW5UR3U3UVdDWEVsS3h6Rk9wUWI0aGljazlwWmdXVlROM2xtWG9TR0JkQks1?=
 =?utf-8?B?cjJ3SERsWUhFOTVkbEhpajRib2psYVFqbTdCN1hoZjNUTURKbHliQlcwSVhp?=
 =?utf-8?B?UENZQlpBMzJjWEc1bml2SmU2QmtScjdKaCtQMFpENzJ1NGcxMEV0bXY5Z05N?=
 =?utf-8?B?bExZSURDR0tsSXNlbFdGUVM2aStkQk04Nm9zRDEwYi9oZXpPZ0xhVjlRM1Qv?=
 =?utf-8?B?UHJGZ0JBL21VN3g5QVA1Wk5PdGVrbHBJOWlWNzYxbU9VT2NyWFFVZEhEeERV?=
 =?utf-8?B?aHVVOEx5QmpYclc5bm0wNEtteEcvNnUwMHRKbCtYalFmbERReTdjRmdBcVlo?=
 =?utf-8?B?U1Z5Si9FYXJLMFNvNHppazU0OXNBZ2VmckhwQTVUTTVJQ2o0L3BFQVBSWmto?=
 =?utf-8?B?WmFrT01NSGJHWkZVR2s0TEtoR0EzbmRqaGlpRFdFTWFHc08rYSt2OHZzTVZ0?=
 =?utf-8?B?c092Q2huR3gwL3lGY2dCek5ycFM2aitscENUMnZ5TlRsSmRTK0NLaTF5bFM5?=
 =?utf-8?B?bFphM2JNWWNNMTVUSUdvMWMzQW5NUEJaMVF4RVNuV0JRTEZYWWQ3M0d2QnRF?=
 =?utf-8?B?MVpqNGhHQW5uOGJ3cndRa1NqdFRuZHZGR3R6Uk9pYi81amw3OCtMbS85d2tM?=
 =?utf-8?B?R2o1bjYzdHAxV0laYVlTZEFZaTVWSWFtWWtSOHJzdnY0NndtQ0tiR3lwbjVX?=
 =?utf-8?B?d2dpYUYvUjBOMEdZcmpkU3BEYmd4bHFhZUdlODFhVUlUM1BTYjRVZDZYcGJI?=
 =?utf-8?B?SlFQRmZBcEhqY0lncEF3Y3doNUxrTzJ0cThDazJHWGN6cGxHRnJxUmUyTzhT?=
 =?utf-8?B?Ti9sdk5WSHNremtFSjlLNS9wSFVrNGdVOVJmMWd5N1FjWmt4UVhZSjlGeGNw?=
 =?utf-8?B?c3ZJaFBKaXc2NElKRFFlL3RIQ29qNjBNMk0vOXI2a205UkhXU0haYzVoTXV1?=
 =?utf-8?Q?/4MHSs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:01:14.5588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad48c50c-09c6-481f-0e1a-08dd7b7e5913
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF44635DB8D

On Mon Apr 14, 2025 at 4:05 PM BST, Jan Beulich wrote:
> On 14.04.2025 15:37, Alejandro Vallejo wrote:
>> On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> +/*
>>>> + * Locate a multiboot module given its node offset in the FDT.
>>>> + *
>>>> + * The module location may be given via either FDT property:
>>>> + *     * reg =3D <address, size>
>>>> + *         * Mutates `bi` to append the module.
>>>> + *     * module-index =3D <idx>
>>>> + *         * Leaves `bi` unchanged.
>>>> + *
>>>> + * @param fdt           Pointer to the full FDT.
>>>> + * @param node          Offset for the module node.
>>>> + * @param address_cells Number of 4-octet cells that make up an "addr=
ess".
>>>> + * @param size_cells    Number of 4-octet cells that make up a "size"=
.
>>>> + * @param bi[inout]     Xen's representation of the boot parameters.
>>>> + * @return              -EINVAL on malformed nodes, otherwise
>>>> + *                      index inside `bi->mods`
>>>> + */
>>>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>>>> +                                     int address_cells, int size_cell=
s,
>>>> +                                     struct boot_info *bi)
>>>
>>> Functions without callers and non-static ones without declarations are
>>> disliked by Misra.
>>=20
>> Can't do much about it if I want them to stand alone in a single patch.
>> Otherwise the following ones become quite unwieldy to look at. All I can
>> say is that this function becomes static and with a caller on the next
>> patch.
>
> Which means you need to touch this again anyway. Perhaps we need a Misra
> deviation for __maybe_unused functions / data, in which case you could
> use that here and strip it along with making the function static. Cc-ing
> Bugseng folks.

It's a transient violation, sure. Do we care about transient MISRA
violations though? I understand the importance of bisectability, but
AUIU MISRA compliance matters to the extent that that the tip is
compliant rather than the intermediate steps?

Another option would be to fold them this patch and the next together
after both get their R-by. As I said, I assumed you'd rather see them in
isolation for purposes of review.

>
>>>> +    /* Otherwise location given as a `reg` property. */
>>>> +    prop =3D fdt_get_property(fdt, node, "reg", NULL);
>>>> +
>>>> +    if ( !prop )
>>>> +    {
>>>> +        printk("  No location for multiboot,module\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>>>> +    {
>>>> +        printk("  Location of multiboot,module defined multiple times=
\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret =3D read_fdt_prop_as_reg(prop, address_cells, size_cells, &ad=
dr, &size);
>>>> +
>>>> +    if ( ret < 0 )
>>>> +    {
>>>> +        printk("  Failed reading reg for multiboot,module\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    idx =3D bi->nr_modules + 1;
>>>
>>> This at least looks like an off-by-one. If the addition of 1 is really
>>> intended, I think it needs commenting on.
>>=20
>> Seems to be, yes. The underlying array is a bit bizarre. It's sizes as
>> MAX_NR_BOOTMODS + 1, with the first one being the DTB itself. I guess
>> the intent was to take it into account, but bi->nr_modules is
>> initialised to the number of multiboot modules, so it SHOULD be already
>> taking it into account.
>>=20
>> Also, the logic for bounds checking seems... off (because of the + 1 I
>> mentioned before). Or at least confusing, so I've moved to using
>> ARRAY_SIZE(bi->mods) rather than explicitly comparing against
>> MAX_NR_BOOTMODS.
>>=20
>> The array is MAX_NR_BOOTMODS + 1 in length, so it's just more cognitive
>> load than I'm comfortable with.
>
> If I'm not mistaken the +1 is inherited from the modules array we had in
> the past, where we wanted 1 extra slot for Xen itself. Hence before you
> move to using ARRAY_SIZE() everywhere it needs to really be clear what
> the +1 here is used for.

Ew.  Ok, just looked at the code in multiboot_fill_boot_info and indeed
the arrangement is for all multiboot modules to be in front, and Xen to
be appended. But bi->nr_modules only lists multiboot modules, so
increasing that value is therefore not enough (or
next_boot_module_index() would fail).

I need to have a proper read on how this is all stitched together.  I
may simply swap BOOTMOD_XEN with the next entry on append. Though my
preference would be to _not_ have Xen as part of the module list to
begin with. Before boot_info that was probably a place as good as any,
but this would be much better off in a dedicated field.

I don't see much in terms of usage though. Why is it being added at all?

Cheers,
Alejandro

