Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A8A88282
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950262.1346648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4K0b-0004Bf-Ur; Mon, 14 Apr 2025 13:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950262.1346648; Mon, 14 Apr 2025 13:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4K0b-00049C-Ra; Mon, 14 Apr 2025 13:37:57 +0000
Received: by outflank-mailman (input) for mailman id 950262;
 Mon, 14 Apr 2025 13:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4K0a-000496-DS
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:37:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:2417::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa159395-1935-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 15:37:54 +0200 (CEST)
Received: from SA0PR11CA0032.namprd11.prod.outlook.com (2603:10b6:806:d0::7)
 by IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 13:37:46 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::45) by SA0PR11CA0032.outlook.office365.com
 (2603:10b6:806:d0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Mon,
 14 Apr 2025 13:37:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 13:37:45 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 08:37:44 -0500
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
X-Inumbo-ID: aa159395-1935-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2DJJDCGRJdUixkxAKyKSp2Hg9FeH80fcJ/Ypbf7jEpRFX9BTsbXfNjqegVfv7DNbu9w5Rfj2qhi+eJJ/Fb5PoPUhsuo+T2GmygGzz7ZSVR2eTP6QATG6Zq/Tqg1hfED8QB26trdaVG3qHcFkuvQC32SSriKiMXUDHDNctjQKbcyWw/lpvQnjkGCJAxKLMReqgJ6ps9Dsf/NiKvsowekJh6bWhmGkDPX0GY4Zd5T1m1Ehx4VzUe+989juhcU2K/oALu9+TVS4DKbz1wHQ10Pr3m8bYGn0RaGE0Lg4eVr1DsnhaWBXkTMW/KA6H/hzlhd0lDCmIlvnfLiYIg5/VGksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1ADJvy8ZyG3htA2/I/CSmhaoL1GG8yBZDf7AzyfySc=;
 b=C2B32GgfxfLndyTZurXzyBXbfpB1q1hGj/xui7/OXv8rMy81CNBO6QY1UF3WoBRwigXd0z73jV8h59ojWeg779DkdICjurl/xjbQizIOCEFX/wO3a5U21q2XE6Qw31itdtsmJOf18/F1DS8ycIXVXqUmC3uOGzR6g6/6c8br3XL6c7K+b07ayoMBLjySRjs2ltltwJyuvaojS2IBZsgieeFP1yg2JluBQtr8eqrwrrJ4O0cgLtw1AXuxa8Hko8kUWylgRqp9pKwCnrefKGnp4XQtDVG6fR2peln3MwNt78PpN4EQ/T+Mk5d660ORet5Mr+5QbbEZVAVV13GzFmpUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1ADJvy8ZyG3htA2/I/CSmhaoL1GG8yBZDf7AzyfySc=;
 b=ZTRyATJssS0oMV9EU3GppOUHRo8EwlD64I3XAQGeg5oc9H9VzhfUIuzgGAHKnQk/XS8EEg2gF91BRWZzh1XKYisXizQvfr1P09ij3jYKFMisrGAIaGeZbAqiL98AwSckWcdbAec9vZ2PkPmTMrsGWcgXk3Nj1V1A57SdvU44oD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 14:37:42 +0100
Message-ID: <D96EI9O4XII2.195QNQNT1T3FG@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 08/16] x86/hyperlaunch: Add helpers to locate
 multiboot modules
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-9-agarciav@amd.com>
 <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
In-Reply-To: <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|IA1PR12MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 506c17af-8b50-4c12-ec17-08dd7b598a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkRkU25LNVBKQS9aQ2ZkMkg3L1dVTGRiV2lWTkRlOEE4c0FqbFVMMC8rZjlL?=
 =?utf-8?B?aG0wTTFmL3M3WlR1cGZMUllEeHVDanVpR01UcjZNWFk1KzlIRmdhazJhdG5H?=
 =?utf-8?B?Mkg0WnN1YnJJZWRzbnhQYTgybTVHV21RZVkwYjg0Y20zQ1g4aTJMQUc1dzAw?=
 =?utf-8?B?NWFiYzVWVWRoZmRNZ2l2QmRzT3djaEQ4TDF1UHcxbkQwUVZFb2ZzMlQ1K0Jq?=
 =?utf-8?B?WlVnVGlWU1g1ZmVRTHBRcDVWbFRjT01JKytnRlNFNGNyek43eUxhY3Nla2p2?=
 =?utf-8?B?Mng0MFp3ZEZyek9ZeVRwNmx5ZFFSYm5nRzR4bUU1amZUaWpYRXJVeFVoSFNv?=
 =?utf-8?B?Q3UyY1hQNzVKREhIUStDQmk2QWpEdllnOHNPWTAwUHR4OENPZERCWVZXWkNJ?=
 =?utf-8?B?ZWFHUlEzWUNYRUpxL0c4Zmp3TTRQdjhZbzBiL09UdHlwTWI5REFSRTQzM1VK?=
 =?utf-8?B?TEVhMEoxd050NGQyZ0FzU0dRR2VSNjhrdHZHNENrMGRDWUZnV3A5WDFvYVBV?=
 =?utf-8?B?VWRISE0yVUZlb3NtQ1hkcG44NlNkSmtERC95clVUaGUwYkVDSkozeExiUTly?=
 =?utf-8?B?TzhRMEZqYksvZnpWc2puUTlnVXVoMnB2Y3YrUWl6MnI1UC9GMkRpL05KVGZ1?=
 =?utf-8?B?RXhHSElVZ1R6RkZRS0UvUVl3QmJzN3VOVW5sN2c3bXlXUTBESjRQazE2RWo5?=
 =?utf-8?B?dDRvamM3U3RuZDI0UVBSNmQ5VDY0anl6bVVteldrYy83SWpQckVuSmJEYXk2?=
 =?utf-8?B?M2gxdGxYL1B6VmhxSlRjYVpSek9FbjBSSlhsVkpNSzFBVlhXWG45N3ZNNy8w?=
 =?utf-8?B?TStNNDNXN2lYVzNvMW9mRXlvU2lFQWw1SWV4WVJPWGJPclcvSE5Ea2k5eFlQ?=
 =?utf-8?B?NlVOcHptZ2p1bWVLajZ2SmdpWDFHc1dmNzdZOXlJTVMzVFQ5QW54S2tDSTVQ?=
 =?utf-8?B?bGxKV2pTeDVtUlk1QklreTZwRmI1WkZBQ00wWFFwbEIySHlJWnVZajgwdFRP?=
 =?utf-8?B?U2xRME45Tjk5dTU4TmR0dS84TFlUVlFqK1RTSlI4aWczbWo3cENJdytOcHcz?=
 =?utf-8?B?anBSbmtXc3F6RkUxbWx1WmdPNkNLSmFIZEhMZjlJRlZtMzJmV1I2UkRoajlM?=
 =?utf-8?B?clYxOHFvLzNIUHRSMUlPc3JnanRmUjhtMWFLWjFjUVp6K0p4amZRbGF3QkNi?=
 =?utf-8?B?bmRqVDN6OFh6d2xiVytadFRCZGlGSHNvS2t6UTBXa0JndHZMbzR3bDhsS0dj?=
 =?utf-8?B?T0FpV1BwOWdnTDA3ODVMMkx4TmlEZjViTmFsQjdqSytFcU40T2VucWtXQ0s0?=
 =?utf-8?B?L2luaGFVbXVnaTM3SGJUSFZlc2pBRERhQ05zT0psVUlNVHZQMzNrSkllMCtS?=
 =?utf-8?B?b0w0UWZub25PaGFldXpvZUs4Vkg1eVRLSS90ZmtzN25RNDZNWjdOSFE4b1Qr?=
 =?utf-8?B?c0Z1KzFiZzhTRTlXMWxNVFNQc29GWU5OQnd6UHRrYlhUZHpBeElHWmZUcXlK?=
 =?utf-8?B?eUVMaG52VVBUVzl3bzFGU2dKV2Y4bWp2T1J5VUcvZFd6UC9ocW5FanJQd0lU?=
 =?utf-8?B?QmUvYzdYVzVyYnpuakY1eS9TVHE0NHVSWFl0VWx2RDBwZ2hha05NWjNYNG4v?=
 =?utf-8?B?NmQySEVVSW5nd290NTNRbVoraTVrSTFyV0NsS3o0M29aRDRhYmIvR0o1QlZJ?=
 =?utf-8?B?OWZncWx4WnJtZFlmSnhuWFZsRVVyL3BQVDAvYXc2YkdlMjNRbkE1T29nQWd6?=
 =?utf-8?B?TWJQUjF4bHdiZzhaK2VRbWJDTGpuckQrRmc3VHo5UE1GWWRGdGxaY3hDNERS?=
 =?utf-8?B?RU1POGdMcWJ5ZUtWcDY0WTVvN3ZudTNCc1RnQVRXcWdnRmh5RThLYjVFdzg5?=
 =?utf-8?B?Nm9vK0NrZTArUHBubldGa3F3RkdaZmhVWnR1YTI3VWxueURaRXJBM2dqTWpG?=
 =?utf-8?B?aXUrY0VJazdybDBXWko0QUptUHl1R2xJbURYTGFRTGE0M0ZJTy8xdkZ5c2lK?=
 =?utf-8?B?ZkxLUmIraGthaWg3VFRQYkhqSHpvQXlEMFBzeFdYWlRmYUozeGtIbVNjb0la?=
 =?utf-8?Q?yaXTJy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:37:45.6202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 506c17af-8b50-4c12-ec17-08dd7b598a2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8285

On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -13,6 +13,148 @@
>> =20
>>  #include "fdt.h"
>> =20
>> +/*
>> + * Unpacks a "reg" property into its address and size constituents.
>> + *
>> + * @param prop          Pointer to an FDT "reg" property.
>> + * @param address_cells Number of 4-octet cells that make up an "addres=
s".
>> + * @param size_cells    Number of 4-octet cells that make up a "size".
>> + * @param p_addr[out]   Address encoded in the property.
>> + * @param p_size[out]   Size encoded in the property.
>> + * @returns             -EINVAL on malformed property, 0 otherwise.
>> + */
>> +static int __init read_fdt_prop_as_reg(const struct fdt_property *prop,
>> +                                       int address_cells, int size_cell=
s,
>> +                                       uint64_t *p_addr, uint64_t *p_si=
ze)
>> +{
>> +    const fdt32_t *cell =3D (const fdt32_t *)prop->data;
>> +    uint64_t addr, size;
>> +
>> +    if ( fdt32_to_cpu(prop->len) !=3D
>> +         (address_cells + size_cells) * sizeof(*cell) )
>> +    {
>> +        printk("  Cannot read reg %lu+%lu from prop len %u\n",
>> +            address_cells * sizeof(*cell), size_cells * sizeof(*cell),
>> +            fdt32_to_cpu(prop->len));
>> +        return -EINVAL;
>> +    }
>> +
>> +    switch ( address_cells ) {
>
> Nit: Brace on its own line please.

Sure

>
>> +    case 1:
>> +        addr =3D fdt32_to_cpu(*cell);
>> +        break;
>> +    case 2:
>> +        addr =3D fdt64_to_cpu(*(const fdt64_t *)cell);
>> +        break;
>> +    default:
>> +        printk("  unsupported sized address_cells\n");
>
> Depending on how likely this or ...
>
>> +        return -EINVAL;
>> +    }
>> +
>> +    cell +=3D address_cells;
>> +    switch ( size_cells ) {
>> +    case 1:
>> +        size =3D fdt32_to_cpu(*cell);
>> +        break;
>> +    case 2:
>> +        size =3D fdt64_to_cpu(*(const fdt64_t *)cell);
>> +        break;
>> +    default:
>> +        printk("  unsupported sized size_cells\n");
>
> ... this path is to be hit, perhaps also log the bogus size? Then again, =
this
> being passed in, isn't it an internal error if the wrong size makes it he=
re?
> I.e. rather use ASSERT_UNREACHABLE()?

*_cells are DTB properties, so it's more of an input error.

Ack to log the sizes, will do.

>
>> +        return -EINVAL;
>> +    }
>> +
>> +    *p_addr =3D addr;
>> +    *p_size =3D size;
>> +
>> +    return 0;
>> +}
>
> The function as a whole looks somewhat similar to fdt_get_reg_prop(). Wha=
t's
> the deal?

The latter shouldn't be there. It's leftover from code motion and a
merge.

>
>> +/*
>> + * Locate a multiboot module given its node offset in the FDT.
>> + *
>> + * The module location may be given via either FDT property:
>> + *     * reg =3D <address, size>
>> + *         * Mutates `bi` to append the module.
>> + *     * module-index =3D <idx>
>> + *         * Leaves `bi` unchanged.
>> + *
>> + * @param fdt           Pointer to the full FDT.
>> + * @param node          Offset for the module node.
>> + * @param address_cells Number of 4-octet cells that make up an "addres=
s".
>> + * @param size_cells    Number of 4-octet cells that make up a "size".
>> + * @param bi[inout]     Xen's representation of the boot parameters.
>> + * @return              -EINVAL on malformed nodes, otherwise
>> + *                      index inside `bi->mods`
>> + */
>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>> +                                     int address_cells, int size_cells,
>> +                                     struct boot_info *bi)
>
> Functions without callers and non-static ones without declarations are
> disliked by Misra.

Can't do much about it if I want them to stand alone in a single patch.
Otherwise the following ones become quite unwieldy to look at. All I can
say is that this function becomes static and with a caller on the next
patch.

>
>> +{
>> +    const struct fdt_property *prop;
>> +    uint64_t addr, size;
>> +    int ret;
>> +    int idx;
>> +
>> +    ASSERT(!fdt_node_check_compatible(fdt, node, "multiboot,module"));
>> +
>> +    /* Location given as a `module-index` property. */
>> +    prop =3D fdt_get_property(fdt, node, "module-index", NULL);
>> +
>> +    if ( prop )
>> +    {
>> +        if ( fdt_get_property(fdt, node, "reg", NULL) )
>> +        {
>> +            printk("  Location of multiboot,module defined multiple tim=
es\n");
>> +            return -EINVAL;
>> +        }
>> +        return fdt_cell_as_u32((const fdt32_t *)prop->data);
>
> No concerns here of there being less than 4 bytes of data?

v4 moves the property accessors earlier so this is a safe access.

>
>> +    }
>> +
>> +    /* Otherwise location given as a `reg` property. */
>> +    prop =3D fdt_get_property(fdt, node, "reg", NULL);
>> +
>> +    if ( !prop )
>> +    {
>> +        printk("  No location for multiboot,module\n");
>> +        return -EINVAL;
>> +    }
>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>> +    {
>> +        printk("  Location of multiboot,module defined multiple times\n=
");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret =3D read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr=
, &size);
>> +
>> +    if ( ret < 0 )
>> +    {
>> +        printk("  Failed reading reg for multiboot,module\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    idx =3D bi->nr_modules + 1;
>
> This at least looks like an off-by-one. If the addition of 1 is really
> intended, I think it needs commenting on.

Seems to be, yes. The underlying array is a bit bizarre. It's sizes as
MAX_NR_BOOTMODS + 1, with the first one being the DTB itself. I guess
the intent was to take it into account, but bi->nr_modules is
initialised to the number of multiboot modules, so it SHOULD be already
taking it into account.

Also, the logic for bounds checking seems... off (because of the + 1 I
mentioned before). Or at least confusing, so I've moved to using
ARRAY_SIZE(bi->mods) rather than explicitly comparing against
MAX_NR_BOOTMODS.

The array is MAX_NR_BOOTMODS + 1 in length, so it's just more cognitive
load than I'm comfortable with.

>
>> +    if ( idx > MAX_NR_BOOTMODS )
>> +    {
>> +        /*
>> +         * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented b=
y 32bits,
>> +         * thus the cast down to a u32 will be safe due to the prior ch=
eck.
>> +         */
>> +        BUILD_BUG_ON(MAX_NR_BOOTMODS >=3D (uint64_t)UINT32_MAX);
>
> Because of idx being a signed quantity, isn't INT_MAX the required upper
> bound? The latest then the somewhat odd cast should also be possible to
> drop.

It is, yes. Having a theoretical limit of 2**31-1 rather than 2**32-1 doesn=
't worry
me in the slightest.

>
>> +        printk("  idx %d exceeds maximum boot modules\n", idx);
>
> Perhaps include STR(MAX_NR_BOOTMODS) as well?
I'll print ARRAY_SIZE(bi->mods) instead. Otherwise it will be very
confusing.

>
>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -13,6 +13,63 @@kkk
>> =20
>>  #include <xen/libfdt/libfdt.h>
>> =20
>> +static inline int __init fdt_cell_as_u32(const fdt32_t *cell)
>
> Why plain int here, but ...
>
>> +{
>> +    return fdt32_to_cpu(*cell);
>> +}
>> +
>> +static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
>
> ... a fixed-width and unsigned type here? Question is whether the former
> helper is really warranted.
>
> Also nit: Stray double blank.
>
>> +{
>> +    return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[=
1]);
>
> That is - uniformly big endian?

These helpers are disappearing, so it doesn't matter. This is basically
an open coded:

  fdt64_to_cpu(*(const fdt64_t *)fdt32)

And, yes. DTBs are standardised as having big-endian properties, for
better or worse :/

>
>> +}
>
> Marking such relatively generic inline functions __init is also somewhat
> risky.=20

They were originally in domain-builder/fdt.c and moved here as a result
of a request to have them on libfdt. libfdt proved to be somewhat
annoying because it would be hard to distinguish accessors for the
flattened and the unflattened tree.

I'd personally have them in domain-builder instead, where they are used.
Should they be needed somewhere else, we can always fator them out
somewhere else.

Thoughts?

>
>> +/*
>> + * Property: reg
>> + *
>> + * Defined in Section 2.3.6 of the Device Tree Specification is the "re=
g"
>> + * standard property. The property is a prop-encoded-array that is enco=
ded as
>> + * an arbitrary number of (address, size) pairs.  We only extract a sin=
gle
>> + * pair since that is what is used in practice.
>> + */
>> +static inline int __init fdt_get_reg_prop(
>> +    const void *fdt, int node, unsigned int addr_cells, unsigned int si=
ze_cells,
>> +    uint64_t *addr, uint64_t *size)
>> +{
>> +    int ret;
>> +    const struct fdt_property *prop;
>> +    fdt32_t *cell;
>> +
>> +    /* FDT spec max size is 4 (128bit int), but largest arch int size i=
s 64 */
>> +    if ( size_cells > 2 || addr_cells > 2 )
>> +        return -EINVAL;
>> +
>> +    prop =3D fdt_get_property(fdt, node, "reg", &ret);
>> +    if ( !prop || ret < sizeof(u32) )
>
> No uses of u32 et al in new code please. Question anyway is whether this =
isn't
> meant to be sizeof(*cell) like you have it ...
>
>> +        return ret < 0 ? ret : -EINVAL;
>> +
>> +    if ( fdt32_to_cpu(prop->len) !=3D
>> +	 ((size_cells + addr_cells) * sizeof(*cell)) )
>
> ... here. Or maybe it's to be sizeof(prop->len)?
>
> Also nit: Hard tab slipped in.
>
>> +        return -EINVAL;
>> +
>> +    cell =3D (fdt32_t *)prop->data;
>> +
>> +    /* read address field */
>> +    if ( addr_cells =3D=3D 1 )
>> +        *addr =3D fdt_cell_as_u32(cell);
>> +    else
>> +        *addr =3D fdt_cell_as_u64(cell);
>> +
>> +    cell +=3D addr_cells;
>> +
>> +    /* read size field */
>> +    if ( size_cells =3D=3D 1 )
>> +        *size =3D fdt_cell_as_u32(cell);
>> +    else
>> +        *size =3D fdt_cell_as_u64(cell);
>> +
>> +    return 0;
>> +}
>
> Does this really want/need to be an inline function?
>
> Jan

This function is gone in v4.

Cheers,
Alejandro

