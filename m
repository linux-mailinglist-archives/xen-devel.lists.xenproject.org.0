Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B659864E5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804395.1215359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUyj-00061a-RT; Wed, 25 Sep 2024 16:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804395.1215359; Wed, 25 Sep 2024 16:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUyj-000600-Or; Wed, 25 Sep 2024 16:35:01 +0000
Received: by outflank-mailman (input) for mailman id 804395;
 Wed, 25 Sep 2024 16:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/LJ=QX=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1stUyi-0005zu-FY
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:35:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a1fbda8-7b5c-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 18:34:59 +0200 (CEST)
Received: from DM6PR12CA0031.namprd12.prod.outlook.com (2603:10b6:5:1c0::44)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 16:34:53 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::2) by DM6PR12CA0031.outlook.office365.com
 (2603:10b6:5:1c0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Wed, 25 Sep 2024 16:34:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Wed, 25 Sep 2024 16:34:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 11:34:51 -0500
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
X-Inumbo-ID: 1a1fbda8-7b5c-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lucJJZOKVZNadLlcXQ/+ObKc+uhgfnQ4ePuZcKcVag+NtAi0a3ObnMzimXO7KBpQp7EVGumrN8zj0l7n8PxEc8BKzba1511EJVfWsUF7mh0+lcsH1RZBGD8LzOVDAu7KKiN3QJnEhFU0V2e9mmDtqIU2MiscVe9ecwK6qYfwU9hOUsjGW7UQBLRiRwtZEcbK3eF/6Q5PT9jZJZM+K1IwQmhLVLlc45h4QSLwKuRJmrTDBwCViNxzeMp774Ylzv7QD/Bi6I/yHAIpDHM+m9VuWGO0amnhpxIPV8tSvyVyMjmpf+9cvbg1SLPrTQvWRrQzFqC7MuwvgVweRb/uzTH9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLLGHw2hT/VCMB5LiPTD33CwtbOG3nrcPshqAqMQmAs=;
 b=MJ+SJxSg79QuSM2yk2W592ZW77DfgYIP7ECXCZoT99nJWnKj26C+ZRVm4d9nV3NQcz8TOaTcnKBlmrNm1Wll7vlBdZ1E0vB6Qo4u0fyFHQdISvCypinqIse4RiDKhBJVeZTyL/9NLllNR/9K2d1Bq5f+ilG3mttTQO6nnUdHvNhHg0nI2IPYG4tYIu4iHh0VKMQUcNJTrdTKU2SQ0+FL2QSewbhT64emEF5kSkvBi4jVK3a5BVoSb9ZF7sJD3BOr/zjA5q6vkeD1/fGaIUPAB3+tdMgskAZM/cPOU/lBlswoFWK4VPxXKZtg1N9mtLCJtYaeRgXUKWtgviJ9Qqg6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLLGHw2hT/VCMB5LiPTD33CwtbOG3nrcPshqAqMQmAs=;
 b=QawEekbHrcyBD0toj3op2Xzk9apjEgtTiJjFnZMQA7E+8TCSvOzDcuLKjWOQKFu3HgKC/mVp2g2o9T//hH0jIbp1lgKDqSPzwtk8FoLmbHbR90YEd5MZrxZnA7+vnynYu0EQCZrhAktjGzxkYZeZBlUSPEmb4d1g8DZdgXpETvM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 25 Sep 2024 18:34:48 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <dpsmith@apertussolutions.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
Message-ID: <ZvQ7mf9MbmSyC6RB@zapote>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
 <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3cc48c-649b-4126-f970-08dcdd7ffb80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hj2PcQ1rJZgbdcX0zAm1ZwIKNESwOtT8Cy0hONHvzmtAkPKIqjYAAkJ1I6Ue?=
 =?us-ascii?Q?zRHKHiIAbyHn5b5mHOVIQyWyiNx5RRm1r6c6/yWsn7CJYJ2XHnlqyQCNssQj?=
 =?us-ascii?Q?crLp0ZJnmhKWx4L/M3hdy1N465SSS3Pg7yVZwv+v83qL2ouSYIx2NqfEytAQ?=
 =?us-ascii?Q?1sRcgI/1xYg1o93Nzb1VVNLS+eCeF5lvv4SZaSoCAXa5DdM8i6Mub+fHMag4?=
 =?us-ascii?Q?RVzPobaUKQXgzqkqzTeEEyYnI4Eo1PUER0Hv4mbcJuI7oAq52lz7E7o7xV5v?=
 =?us-ascii?Q?6mp5TLPxnmBWNzL70oxNIpKP2B1Deda1rCX+Vq/VDZJ98DPIfhnHiP0xoZjI?=
 =?us-ascii?Q?6uLRfiIAnBIiPZ6b+1hySDPQd+hB2kpx3E5TnI0D8WoFQ6InHCD/kgQa9jh7?=
 =?us-ascii?Q?FfQ7CbxiUAWvzVimKZx3RjtmOYeYXwBhL54qYKkpT1Y1Th5gndMhtAdN4iIE?=
 =?us-ascii?Q?ob2JV+htIjoWwxdfoJajqyIe5rguNz/lxI/QIiJHPRcF/hX3R/DeCaFe3Aa+?=
 =?us-ascii?Q?j9XwoQrw8Ty2tuVYzxU7u311AGdCD5kGwpVJqMV9VwlWQMiueZ4Q9KPcDQ8f?=
 =?us-ascii?Q?cMl+KG9jnFztss47QKk87Gd1ZloU7ORwE3MGYqoa/zilYzPnMsKiJFTrIohx?=
 =?us-ascii?Q?GRVKXppqjz2+qJX3dgev01wWr7B2E6cprJ2Kas3njICZ6dD3x2Q78Q9O3jaF?=
 =?us-ascii?Q?1JUAxLx/h1sy0AFkK6yTRHyAFZHRieeeQMgGXfCCDYGZk6BR3dNGzrIS1uY0?=
 =?us-ascii?Q?UDSuod1Ym8hSKguUt/Rs78M+kmFTQh+FjeXGB15a9RABKclMNpW3wqSQHn68?=
 =?us-ascii?Q?oa1lxU8gPvk4TJakWDAuU6Ntv+dGJlyEqBKlpNcRBU/Ua+QV5piJcdAt0fB0?=
 =?us-ascii?Q?+o1uAJFmAZ62Wa4KFOiaiiQ/FiynFnu9PKqCn6vvzSyel1cyAln5fX/tUEgI?=
 =?us-ascii?Q?fv21ou6fj+ZMMmGPmc1GUdtlbYoGciVkgDMerYoDKZCO4cSecZyACqU8OR62?=
 =?us-ascii?Q?VATuIh8Bc9MBmrzjwXyCryOvXYwbXT95fDfk/KNgDDjpsoGToYRLSXNqTICd?=
 =?us-ascii?Q?vPbtZ9+3n20hzC6xxapPfIc8aKywENrzgCLEyCdtw4/NBJpWy4OFAqalAe4D?=
 =?us-ascii?Q?O0arjFl55u63CmKcC8Dsd5+O6o8G0HzSr/22DmgO7c6PNAI1QJdHjB4aXtMM?=
 =?us-ascii?Q?8kIGu12nNZbIHn29OWszPP5FXe1M77uPYUxNoNXwxDRxEUfTCr0X02/7jflm?=
 =?us-ascii?Q?yHg3m7N1dd+TdFHCQFLRRlYVVVvjSQHxcayvUALka79TUbkJ1om6e6ttXaWk?=
 =?us-ascii?Q?bW1h8Pr7Uq/1+NMQlduQMkKyyyeH6LX4sKEEhb1Dkq9SxGjg6xcmHUo0tymy?=
 =?us-ascii?Q?yzFD6kXZUwOU/J5j93cvpmYz3V5EW2cG0bHMIj7JKLyW7K5cLZjt7y9DuZiK?=
 =?us-ascii?Q?DoC+dWz7snOSi8Y7j8W3hek1URpOWYXT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:34:52.8792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3cc48c-649b-4126-f970-08dcdd7ffb80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:
> Hi,
> 

Hi Julien,


> On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > 
> > When virtio-pci is specified in the dom0less domU properties, create a
> > virtio-pci node in the guest's device tree. Set up an mmio handler with
> > a register for the guest to poll when the backend has connected and
> > virtio-pci bus is ready to be probed. Grant tables may be used by
> > specifying virtio-pci = "grants";.
> > 
> > [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
> >   Make grants iommu-map cover the entire PCI bus.
> >   Add virtio-pci-ranges to specify memory-map for direct-mapped guests.
> >   Document virtio-pci dom0less fdt bindings.]
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >   docs/misc/arm/device-tree/booting.txt |  21 +++
> >   xen/arch/arm/dom0less-build.c         | 238 ++++++++++++++++++++++++++
> >   xen/arch/arm/include/asm/kernel.h     |  15 ++
> >   3 files changed, 274 insertions(+)
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > index 3a04f5c57f..82f3bd7026 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -276,6 +276,27 @@ with the following properties:
> >       passed through. This option is the default if this property is missing
> >       and the user does not provide the device partial device tree for the domain.
> > +- virtio-pci
> 
> Similar question to the other patches, why is this specific to virtio PCI?
> QEMU (or another device module) is free to emulate whatever it wants behind
> the PCI hosbtridge.

There's no hard limitatino to only virtio-pci devices it's more of a
recommendation that PVH guests should not use "emulated" devices but
there's nothing stopping it.

Perhaps the names of these properties are missleading, I'm happy to
change them if there are better suggestions!

I can also clarify it in the documentation.


> 
> > +
> > +    A string property specifying whether virtio-pci is enabled for the
> > +    domain and if grant table mappings should be used. If no value is set
> > +    this property is treated as a boolean and the same way as if set to
> > +    "enabled".
> > +    Possible property values are:
> > +
> > +    - "enabled"
> > +    Virtio-pci is enabled for the domain.
> > +
> > +    - "grants"
> > +    Virtio-pci is enabled for the domain and an grants IOMMU node will be
> > +    generated in the domains device-tree.
> > +
> > +- virtio-pci-ranges
> > +
> > +    An optional array of 6 u32 values specifying the 2 cells base addresses of
> > +    the ECAM, Memory and Prefetchable-Memory regions for virtio-pci. This is
> > +    useful to avoid memory-map collisions when using direct-mapped guests.
> > +
> >   Under the "xen,domain" compatible node, one or more sub-nodes are present
> >   for the DomU kernel and ramdisk.
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index 09b65e44ae..dab24fa9e2 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -586,6 +586,189 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
> >       return res;
> >   }
> > +static int __init make_virtio_pci_domU_node(const struct kernel_info *kinfo)
> > +{
> > +    void *fdt = kinfo->fdt;
> > +    /* reg is sized to be used for all the needed properties below */
> > +    __be32 reg[(1 + (GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS)
> > +               * 2];
> > +    __be32 irq_map[4 * 4 * 8];
> > +    __be32 *cells;
> > +    char buf[22]; /* pcie@ + max 16 char address + '\0' */
> > +    int res;
> > +    int devfn, intx_pin;
> > +    static const char compat[] = "pci-host-ecam-generic";
> > +    static const char reg_names[] = "ecam";
> > +
> > +    if ( p2m_ipa_bits <= 40 ) {
> > +        printk("PA bits %d is too small!\nvirtio-pci is only supported "
> > +               "on platforms with PA bits > 40\n", p2m_ipa_bits);
> > +        return -EINVAL;
> > +    }
> 
> Please add a comment explaining where does this requires come from. If this
> is the Address layout, then probably be to avoid relying on hardcoded number
> of bits.
>

Oops, sorry, I had actually removed this part from my git branch but I
forgot to regenerated the patch series.

I'll remove it.

Best regards,
Edgar

