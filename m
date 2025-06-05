Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2666ACF644
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 20:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007363.1386691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNF45-0004XM-Hm; Thu, 05 Jun 2025 18:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007363.1386691; Thu, 05 Jun 2025 18:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNF45-0004Vv-E7; Thu, 05 Jun 2025 18:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1007363;
 Thu, 05 Jun 2025 18:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNF43-0004Vp-30
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 18:11:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8675f907-4238-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 20:11:40 +0200 (CEST)
Received: from SJ0PR13CA0103.namprd13.prod.outlook.com (2603:10b6:a03:2c5::18)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 18:11:33 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::c5) by SJ0PR13CA0103.outlook.office365.com
 (2603:10b6:a03:2c5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.8 via Frontend Transport; Thu, 5
 Jun 2025 18:11:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 18:11:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 13:11:31 -0500
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
X-Inumbo-ID: 8675f907-4238-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY6EKDzeJ+Adj5OtlwYMavbjnL2v50vpazeC2C/eK64Kht3xfW8svOQoMdo9PmDINaKdJ483df0TbF4i3xE0zpSIR+YvEAKa7RLSgBvqHeftYpawJ4OOthKn+CH4curop1weI3m/POR+zn+UbRXvOLnOi6uyyjSqLca09NostajiRO2XJtoD2huBxkypUXyuxqfO07ExB/vsnEFBEiweDWVYfxp+REM9IKW07BAsD+8s4a4FiJVOd8XPHB8zA3ce6zjnW1fVEhchoqlfy7vFfq275H+Zhor2bJ3bLSjnr8gGeQzkEUNX8MmOhxf5hwP9tuwmrDBR0Gf6kfgpOdqNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6hEQ0Ew2urFydC8CohtLWSYByzbPs1HBrvhTlbfXdo=;
 b=KrOtF/K3XLHCgekTfMYvvJRihmJB7ihgUtHmrO/cacmo6+XrlVkh1nz58SUKnivKigJRWys6w/OGGq0xwR7SD0Hh4EmhX7yFY05C2TPJpjOjTe0khaHS7auxyLEXwqeDPFsdavsJhG+BdesOkDc+BuRdpXguLIVeL4SRFu+26Z44kU2hHSr4epP/sRer+v0+Qwy3t6mmNEcVUF/RCrHdUIMyTwsRXjf7fyBJP5vdP3BNhc9zv5Kb1bvM11w2IPp/SB9AZVbVpCu2ud4L4xwynDlkiD3j3NGaM1ASc+20omBl+w+eCeNS+Pt/u+1AUImOEf6V3o/dzRBAbCZ9dypEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6hEQ0Ew2urFydC8CohtLWSYByzbPs1HBrvhTlbfXdo=;
 b=aGLBe+Htc3RWnJpecDK05vTAEV80dkF4z9y7y6n5XSJgrkZY6p7BO0gGvr40zXCiLMbdNw7rSLMX7kvx+7uPejXbbm+7NpZVDPifA5hOLZdEVj05O3S7da1CTfMECu7uHVYHnp+D8wi62xA5a0Wnn1fB379hcLTYYC7wZWzqbkY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 20:11:29 +0200
Message-ID: <DAESW7Z62J87.2BR21MATNU16C@amd.com>
Subject: Re: [PATCH 15/19] xen/dt: Move bootinfo-independent helpers out of
 bootinfo-fdt.c
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-16-agarciav@amd.com> <aDpPyk6MHv+4bseE@kraken>
In-Reply-To: <aDpPyk6MHv+4bseE@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eca36b0-5f7a-440b-9d47-08dda45c678c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0E5dlMwT1RFcE96V3hMd2VDcCt5STRNeHkwSktwN3I4VnF4aWhJU2Y4UFQ2?=
 =?utf-8?B?UlRkRzZzTFhRb0NHUHdydWxpc0JFN2ZUM2JIcTNUL3loc2I4dGFVTVlvbjlo?=
 =?utf-8?B?SDNRdm95SktTZ3Z3NENoOStXekZUYkM2KzFLMG83S3Brdm55THdRb2IxaXhO?=
 =?utf-8?B?ODF5K2pjNC94akNWbElPVC9zbnZ3di9wQVBYWFRRY04xcUFxUmNNTC9ydXlS?=
 =?utf-8?B?SGZyQ244RDJwREprbExJYWdEZ2dlbTB5NG1iM053Yyt0Z0xsNFgvQWVVRGl4?=
 =?utf-8?B?dGRrKzk3TVFnRDFMWUxkcDMxZkJaWDRmRFFYRGpJcFZXKzc0TUtxMlNtMTZ1?=
 =?utf-8?B?dWlCaHp3YTFvU0JmMjB0NXU1RGxkaUs3RW8vSHF3ekp4VUFPL210bENaNjZw?=
 =?utf-8?B?VS9QU2Q5N1dJcVc3WU8wdmpXcSt0ZlVnMm1tdTRtSGg1VnlQL3VtS1VTNWhx?=
 =?utf-8?B?M0FxMk9TbitEVThIUVRjcnFndjBueUhSTGpVdnlsNjZMZFArZ2ltTnBKYVVS?=
 =?utf-8?B?N1BwZHA5S25wUDcveWNnbXJlZUk4OXVXMVFRaGF4SERnOFV5RGZqOEJoQzdC?=
 =?utf-8?B?ZWkyNHh5cFFkWUpIMGVuOEF1WjJXSEhHTDJYbU1ZNE5LV0M3c20wcllKRy9j?=
 =?utf-8?B?ajMrcjdGTXV0cmZUSlhXZGVBRGZvbkZ0TXVzbVpiNzc5K0VOS2V5RnZoNjBN?=
 =?utf-8?B?SXZPY3ZZUnZrQkVkOHhzK2FWY21wRm1laElObS9xcEUrdmZHc1BteHp2Q3hv?=
 =?utf-8?B?d0VJbmNBWUVSSWRMSVBkZklHb3R0SUhQNDJ0ZnRUQ2VFbUZaL09XRXQ5TmI5?=
 =?utf-8?B?Unc1MXpNV2l6bEFzSmJoTFlZU2xMRDJvT1dQZkQvWUVWTUloZm1yTnJTalF0?=
 =?utf-8?B?ZUFWUEpxRnF6WjlZVVVkWmROTCtyVDlyTXpKb2VCK2xOV1Q1UW1ZN0dFWkdZ?=
 =?utf-8?B?OEN5WWhYekVDL0ZSYmRtS282VVc3ZWw4YTlON0tlcmFKWWw3bDNWb1JGMUZG?=
 =?utf-8?B?Rjl0MVErbGhxMktibzUrbk1pM0NxTGMweGRPS2F3RmdWZTMvREtXcDVvVkQw?=
 =?utf-8?B?VFV3bkI0RTY2Z01lYXNiUGxhV1BXSWVQNXhHdU9NZDF2N1VxdnlpSFNBRHpV?=
 =?utf-8?B?cUxKZjhUdkp0bTRjVTZCSTg0c3h4dWJYMHBEOXM4bGpzYTBkajRoMm11c2x3?=
 =?utf-8?B?SkYrNG9nN0c1U2h1RHZ4dUkwUjNPWVR1bEhSazYxckdNcitvK3VBZkZTYXdL?=
 =?utf-8?B?d3krYWF3WXlSTDJ2QUVkcGZTdW85ME8wSjBJVjE0Vm1iZXRBc2xhQzhMUkF6?=
 =?utf-8?B?OTZxem03NnZmRlJua2MvQ0Vlc29tSDBnaVpGblZ6SkVIWFZ6ajlwN1JIS05R?=
 =?utf-8?B?UHVjT1ltV1krUDhGOExVeFE4eU5CeVlVMCtDMmVGUWRtL3NjU3RkSEU0OGs5?=
 =?utf-8?B?cWEwclc3SmlpV29LZlRuOXREUDI2K0pLWDBHU01HY3c3eU5FLzYvaGo2S1Uw?=
 =?utf-8?B?QXRVVWdXTWhOS210MWEyYXdPL1NpWmgrdHdtbDF0RFVqUkNkWm9HbjlrWFkr?=
 =?utf-8?B?dDVySGRGT2FKUzhRSTlya0FWaEhFd3AzS01QRzdzTXBEMzlMSmdKQzg0U0FC?=
 =?utf-8?B?bzFZWVVlZzVUaSs5QnBrVlNZTU5TWms3bjFhcmc1Nzd0VDlpS3p2VjJlRXR3?=
 =?utf-8?B?c1o1M2FXNHhlenhpVkFEVXAyZGZQcWhJRXowMGYvS2puTVB5akhWWHRQRC9I?=
 =?utf-8?B?U25CT3N0T3hzQXFWZmRraWc0cDJ5Qi9GYTdScVVCWXRRd0dROU5QVXB3M3Mx?=
 =?utf-8?B?bEhaOCtLMlJiUmdWb3lZSVZvVmU2d1dxc3ZnN09ET0JZa2NnZzh0Y3JrNDN6?=
 =?utf-8?B?NWJCejNPZjdSYmh2WjR5WVM3VUcvVjBZSG9lMWxDS3JWbFRLMzdvSVdoUTVn?=
 =?utf-8?B?SjFsR1B0cGRBZUVuS1IyYmpZeFRUSk5VamVJU0pnd2owU2Nid3lzZWFRQS83?=
 =?utf-8?B?WkdzVzgvck1lZk4xQTgwWVhZUEZ1NnFzOFFFdEI3a3M4OXVJUWRMeWZmSVEv?=
 =?utf-8?Q?XbxpJJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 18:11:33.6367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eca36b0-5f7a-440b-9d47-08dda45c678c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005

On Sat May 31, 2025 at 2:39 AM CEST, dmkhn wrote:
> On Fri, May 30, 2025 at 02:02:23PM +0200, Alejandro Vallejo wrote:
>> ... back into bootfdt.c
>>=20
>> These will be required by x86 later on to detect modules in the early sc=
an of
>> the FDT. They are independent of bootinfo, so it's cleaner for them to e=
xist in
>> a separate file.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/common/device-tree/Makefile       |   1 +
>>  xen/common/device-tree/bootfdt.c      |  97 ++++++++++++++++++++++++
>>  xen/common/device-tree/bootinfo-fdt.c | 104 --------------------------
>>  3 files changed, 98 insertions(+), 104 deletions(-)
>>  create mode 100644 xen/common/device-tree/bootfdt.c
>>=20
>> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Ma=
kefile
>> index bb6d5ddec5..922c5bba9b 100644
>> --- a/xen/common/device-tree/Makefile
>> +++ b/xen/common/device-tree/Makefile
>> @@ -1,3 +1,4 @@
>> +obj-y +=3D bootfdt.init.o
>>  obj-y +=3D bootinfo-fdt.init.o
>>  obj-y +=3D bootinfo.init.o
>>  obj-y +=3D device-tree.o
>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/b=
ootfdt.c
>> new file mode 100644
>> index 0000000000..5decf17faf
>> --- /dev/null
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -0,0 +1,97 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#include <xen/bootfdt.h>
>> +#include <xen/bug.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +
>> +uint32_t __init device_tree_get_u32(const void *fdt, int node,
>> +                                    const char *prop_name, uint32_t dfl=
t)
>> +{
>> +    const struct fdt_property *prop;
>> +
>> +    prop =3D fdt_get_property(fdt, node, prop_name, NULL);
>> +    if ( !prop || prop->len < sizeof(u32) )
>> +        return dflt;
>> +
>> +    return fdt32_to_cpu(*(uint32_t*)prop->data);
>> +}
>> +
>> +int __init device_tree_for_each_node(const void *fdt, int node,
>> +                                     device_tree_node_func func,
>> +                                     void *data)
>> +{
>> +    /*
>> +     * We only care about relative depth increments, assume depth of
>> +     * node is 0 for simplicity.
>> +     */
>> +    int depth =3D 0;
>> +    const int first_node =3D node;
>> +    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
>> +    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
>> +    int ret;
>> +
>> +    do {
>> +        const char *name =3D fdt_get_name(fdt, node, NULL);
>> +        u32 as, ss;
>> +
>> +        if ( depth >=3D DEVICE_TREE_MAX_DEPTH )
>> +        {
>> +            printk("Warning: device tree node `%s' is nested too deep\n=
",
>> +                   name);
>
> Use XENLOG_WARNING?
>
>> +            continue;
>> +        }
>> +
>> +        as =3D depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_C=
ELLS_DEFAULT;
>> +        ss =3D depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELL=
S_DEFAULT;
>> +
>> +        address_cells[depth] =3D device_tree_get_u32(fdt, node,
>> +                                                   "#address-cells", as=
);
>> +        size_cells[depth] =3D device_tree_get_u32(fdt, node,
>> +                                                "#size-cells", ss);
>> +
>> +        /* skip the first node */
>> +        if ( node !=3D first_node )
>> +        {
>> +            ret =3D func(fdt, node, name, depth, as, ss, data);
>> +            if ( ret !=3D 0 )
>> +                return ret;
>> +        }
>> +
>> +        node =3D fdt_next_node(fdt, node, &depth);
>> +    } while ( node >=3D 0 && depth > 0 );
>> +
>> +    return 0;
>> +}
>> +
>> +void __init device_tree_get_reg(const __be32 **cell, uint32_t address_c=
ells,
>> +                                uint32_t size_cells, paddr_t *start,
>> +                                paddr_t *size)
>> +{
>> +    uint64_t dt_start, dt_size;
>> +
>> +    /*
>> +     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-=
bit.
>> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
>> +     */
>> +    dt_start =3D dt_next_cell(address_cells, cell);
>> +    dt_size =3D dt_next_cell(size_cells, cell);
>> +
>> +    if ( dt_start !=3D (paddr_t)dt_start )
>> +    {
>> +        printk("Physical address greater than max width supported\n");
>
> I would add current and expected dt_start values to the printout.
>
>> +        WARN();
>> +    }
>> +
>> +    if ( dt_size !=3D (paddr_t)dt_size )
>> +    {
>> +        printk("Physical size greater than max width supported\n");
>> +        WARN();
>> +    }
>> +
>> +    /*
>> +     * Xen will truncate the address/size if it is greater than the max=
imum
>> +     * supported width and it will give an appropriate warning.
>> +     */
>> +    *start =3D dt_start;
>> +    *size =3D dt_size;
>> +}
>> diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-t=
ree/bootinfo-fdt.c
>> index bb5f45771e..736f877616 100644
>> --- a/xen/common/device-tree/bootinfo-fdt.c
>> +++ b/xen/common/device-tree/bootinfo-fdt.c
>> @@ -112,39 +112,6 @@ static bool __init device_tree_is_memory_node(const=
 void *fdt, int node,
>>      return true;
>>  }
>>=20
>> -void __init device_tree_get_reg(const __be32 **cell, uint32_t address_c=
ells,
>> -                                uint32_t size_cells, paddr_t *start,
>> -                                paddr_t *size)
>> -{
>> -    uint64_t dt_start, dt_size;
>> -
>> -    /*
>> -     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-=
bit.
>> -     * Thus, there is an implicit cast from uint64_t to paddr_t.
>> -     */
>> -    dt_start =3D dt_next_cell(address_cells, cell);
>> -    dt_size =3D dt_next_cell(size_cells, cell);
>> -
>> -    if ( dt_start !=3D (paddr_t)dt_start )
>> -    {
>> -        printk("Physical address greater than max width supported\n");
>> -        WARN();
>> -    }
>> -
>> -    if ( dt_size !=3D (paddr_t)dt_size )
>> -    {
>> -        printk("Physical size greater than max width supported\n");
>> -        WARN();
>> -    }
>> -
>> -    /*
>> -     * Xen will truncate the address/size if it is greater than the max=
imum
>> -     * supported width and it will give an appropriate warning.
>> -     */
>> -    *start =3D dt_start;
>> -    *size =3D dt_size;
>> -}
>> -
>>  static int __init device_tree_get_meminfo(const void *fdt, int node,
>>                                            const char *prop_name,
>>                                            u32 address_cells, u32 size_c=
ells,
>> @@ -205,77 +172,6 @@ static int __init device_tree_get_meminfo(const voi=
d *fdt, int node,
>>      return 0;
>>  }
>>=20
>> -u32 __init device_tree_get_u32(const void *fdt, int node,
>> -                               const char *prop_name, u32 dflt)
>> -{
>> -    const struct fdt_property *prop;
>> -
>> -    prop =3D fdt_get_property(fdt, node, prop_name, NULL);
>> -    if ( !prop || prop->len < sizeof(u32) )
>> -        return dflt;
>> -
>> -    return fdt32_to_cpu(*(uint32_t*)prop->data);
>> -}
>> -
>> -/**
>> - * device_tree_for_each_node - iterate over all device tree sub-nodes
>> - * @fdt: flat device tree.
>> - * @node: parent node to start the search from
>> - * @func: function to call for each sub-node.
>> - * @data: data to pass to @func.
>> - *
>> - * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
>> - *
>> - * Returns 0 if all nodes were iterated over successfully.  If @func
>> - * returns a value different from 0, that value is returned immediately=
.
>> - */
>> -int __init device_tree_for_each_node(const void *fdt, int node,
>> -                                     device_tree_node_func func,
>> -                                     void *data)
>> -{
>> -    /*
>> -     * We only care about relative depth increments, assume depth of
>> -     * node is 0 for simplicity.
>> -     */
>> -    int depth =3D 0;
>> -    const int first_node =3D node;
>> -    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
>> -    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
>> -    int ret;
>> -
>> -    do {
>> -        const char *name =3D fdt_get_name(fdt, node, NULL);
>> -        u32 as, ss;
>> -
>> -        if ( depth >=3D DEVICE_TREE_MAX_DEPTH )
>> -        {
>> -            printk("Warning: device tree node `%s' is nested too deep\n=
",
>> -                   name);
>> -            continue;
>> -        }
>> -
>> -        as =3D depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_C=
ELLS_DEFAULT;
>> -        ss =3D depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELL=
S_DEFAULT;
>> -
>> -        address_cells[depth] =3D device_tree_get_u32(fdt, node,
>> -                                                   "#address-cells", as=
);
>> -        size_cells[depth] =3D device_tree_get_u32(fdt, node,
>> -                                                "#size-cells", ss);
>> -
>> -        /* skip the first node */
>> -        if ( node !=3D first_node )
>> -        {
>> -            ret =3D func(fdt, node, name, depth, as, ss, data);
>> -            if ( ret !=3D 0 )
>> -                return ret;
>> -        }
>> -
>> -        node =3D fdt_next_node(fdt, node, &depth);
>> -    } while ( node >=3D 0 && depth > 0 );
>> -
>> -    return 0;
>> -}
>> -
>>  static int __init process_memory_node(const void *fdt, int node,
>>                                        const char *name, int depth,
>>                                        u32 address_cells, u32 size_cells=
,
>> --
>> 2.43.0
>>=20
>>=20

As I answered to Daniel, as I'd rather not introduce functional changes in
code motion commits. I draw the line at trivial retyping (e.g: u32->uint32_=
t)

Otherwise it's just very confusing to future readers.

Cheers,
Alejandro


