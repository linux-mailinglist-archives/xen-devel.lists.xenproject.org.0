Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E6987B14
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 00:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805909.1217160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwls-0008Qr-WB; Thu, 26 Sep 2024 22:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805909.1217160; Thu, 26 Sep 2024 22:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwls-0008Ow-Sn; Thu, 26 Sep 2024 22:15:36 +0000
Received: by outflank-mailman (input) for mailman id 805909;
 Thu, 26 Sep 2024 22:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kHCS=QY=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1stwlr-0008Oo-6T
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 22:15:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2414::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87b7e6a-7c54-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 00:15:32 +0200 (CEST)
Received: from BY3PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:39b::18)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 22:15:25 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::5) by BY3PR05CA0043.outlook.office365.com
 (2603:10b6:a03:39b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8 via Frontend
 Transport; Thu, 26 Sep 2024 22:15:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 22:15:24 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 17:15:23 -0500
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
X-Inumbo-ID: d87b7e6a-7c54-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/DzrLqMx1U2N7lal+T7hxhMdUYndJtZJwuvNCPVu1huA8Z1Pi4Xz86ZadO5k8AuQW/5XQYE9Q8fEZdlvEMYcUzRrQ1X7ODmmF/snUHjAu6Q2k/vUF0wTVeULujvSe0FzQvXS265IQKqWb4XgVRGiXZvAUgpmEa6aAQFZXeL9Vbqa3I23gDQtQEIa39Rox+XsnbKB4uUlr1ZYf61l2fqTW3zATsuhfXpGvwp/oB0lbRBHZiCkuyUHfcUpnB2c6I3LpbeeuqW2pVwjVXKAPnA0o5FQeZv7xl+T3MqhpeFKpGXG8Ixqm8V/LXEVzi79zW9jODjO46USILRDKtx16r1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNBglZd8rXaP+NVJs/oUaQrFRCVIqbu9V1boBQWwTFU=;
 b=PKuioW25N2tjIHBV69gtp04Ts+P0VcbxKWb3qKw1syxZBrPM1VYo64Gn8dKC5BcgrgN6FdAqz+KAaf1yOz8EjVpMqzvim8tNLYXFAIgDxB4x0/DtfzFx73WbtNmvohmOs+v5ifhJI0M099L2bIL3j5W+t08fbqqEke0IogdA9g4+imtinvKn/JJF0MOjUisSjn1fN407PRP2mGHR+UvGUASRGOnx1GRRacOMH7V9sIL93mnMMDRi65YaL4RbyqT9rHLF4rNTHTPY6B0tFbVL4klwuAHe1D95zk/xlhZK1QStIOXC0603x4PNowv1EYxP0KDPgsKjlQRTrJXuTKvo2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNBglZd8rXaP+NVJs/oUaQrFRCVIqbu9V1boBQWwTFU=;
 b=gsbL71YXTzBnpGcUkXqAN+VuFGL1Ur3xINfBwYoumiQUzfFLusQwCp0Hy5BObbKPxPFTr/t/Yg9b76yASmzxnBRN7GOjbxaRwvSetL24H7ufMnFJZVnrSF/0DSzxOcOg1jpfkcm8s4FKq1TP21cC0I7fBPF2FCD3Z5Cn6xrV/ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 27 Sep 2024 00:15:19 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <dpsmith@apertussolutions.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
Message-ID: <ZvXc95XgfR-qrKfd@zapote>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2409241641250.1417852@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2409241641250.1417852@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 844f356b-66f4-4f49-5c1f-08dcde78b84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4z7vMP5mUIRWqtrXo6BlWXbtqD9cGPpLRHAqtKYuML/rkmQ8xir9rPrathbN?=
 =?us-ascii?Q?d/a+/IE2iX9KIsRTuDnZ6XUZ0+U29sDkqELMubKvTW49tzFMgM9kli+q9lVH?=
 =?us-ascii?Q?JUPvwS4Z30q3Z0npX2ohAgNeiHPFZRgHfV9FlZrhP7F3/ZxfcMH3YNgqNWDD?=
 =?us-ascii?Q?2fiYZ6Tois9SiN2xxisdXTC6sz4OvS76uEiICwMQZrLxeQ+8BOqwtwCJibm6?=
 =?us-ascii?Q?O7Vhq65CDa2/5RJjb7L1OEGQ34j5Qs8/hbISP74sZ2gfWfb9gX/sfM47SU3P?=
 =?us-ascii?Q?BXFY8bKUpiXtlTqppampq09qsA3MNQ0rsieaJIYbMO5ev5u6reWr+O7DHVYn?=
 =?us-ascii?Q?0UsiUFqBNRDdiTvfOtcgl6jUhRnVSS7KhVk1MbtCngSUFzaC8JQ4zdgzdQiC?=
 =?us-ascii?Q?wgNA1dvIdrNc/N2ZEIN2bwCOgAUjZQxfbOtSotPtl79vENLj+oNoUtEIKCK9?=
 =?us-ascii?Q?7P4Eas8Agq1wr6Ti6Rq3y/sDruSxwqX1DLxxsCG9+dzN8FF7qr/XuUSdNxJB?=
 =?us-ascii?Q?PDA+j2p6sedzRpiI6YKmk4IW8mLWstiLG2NX/khG4vJ034ySKcEgYhV4kXd9?=
 =?us-ascii?Q?LJf94fKSEZfajvEWbQO45QbpassWUFmblbFP76sljzDmRpmyjlL5UGaTBDIT?=
 =?us-ascii?Q?aLVrPx/Js0SnpBEthbOgrWfPr0XYgduqAAOxWWv13ISxHiMfw8oLKv5n1z8P?=
 =?us-ascii?Q?ompdBVY84a8jXL5Qq/dJdLcHZSzUXc+C83S4+TuIDHtNmeF6f8gfIGTB6ibh?=
 =?us-ascii?Q?LrCXjVlb8K1foPfoxeHCD6vXfvuxiK2mDAwjS7TlrmZ6qAvDuXkjfRQKBHYi?=
 =?us-ascii?Q?sPk4zA1Z0oY3xabv9Ph9SZlGypzGCRLkFzVUCpUXhAB7ZFTQd5BfHMrnW1MR?=
 =?us-ascii?Q?zmk8a4tCw+BIjb6phNxKnQ1WfkMPpnNGJeK7uvTElTKyiXm/DMwENS9GoU2O?=
 =?us-ascii?Q?BwyRIL5CqHqEXxT1slAtgpet6UfbKE6ZInU+srl0Agdx6hcDPN2hC1CTluTA?=
 =?us-ascii?Q?ZMwZofKtt7+3CP9wHzVUfACNTLs4+rWZ5S8aUGQ3bVAoWxnuK0rW87+HgXw/?=
 =?us-ascii?Q?ZoN44/HFoVwMwislFluklbWY26klim/4+2AvPIsqxgevs1ZjE+dVyvxG/0Jk?=
 =?us-ascii?Q?0CkLMqTHmX1EyC2SZ5OAc68sXM1ghbhQuBFWwGboDRbu8jsSVHgZ1yf2eJLa?=
 =?us-ascii?Q?0DY/QklIZwOMijC8LNIQQ4KbV++eMONOtE00ubeFhNUxpdWVb8T+gPKG7S/n?=
 =?us-ascii?Q?TRrNCHfTtS+0dQLWFwZvq1OrEVADZN1K0/Po0CdLdSsLw7SM++vsdZ8i97Y4?=
 =?us-ascii?Q?k4fbXMRXeRos9x+T4WO+ra+tHtVYOdl2z1/nwy02cCJH1cRfczZELnTu8R25?=
 =?us-ascii?Q?lLCPQ6iXoY4vLm2Yh3aQ4hTUJA4HwDzjU3aB3WGevk4QipARgxQ5/0G7tOUI?=
 =?us-ascii?Q?YRCVXr23hRJI+3XLJ8YIGF1hIGXYgvjc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 22:15:24.8012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 844f356b-66f4-4f49-5c1f-08dcde78b84f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168

On Tue, Sep 24, 2024 at 04:55:15PM -0700, Stefano Stabellini wrote:
> On Tue, 24 Sep 2024, Edgar E. Iglesias wrote:
> > From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > 
> > When virtio-pci is specified in the dom0less domU properties, create a
> > virtio-pci node in the guest's device tree. Set up an mmio handler with
> > a register for the guest to poll when the backend has connected and
> > virtio-pci bus is ready to be probed. Grant tables may be used by
> > specifying virtio-pci = "grants";.
> > 
> > [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
> >  Make grants iommu-map cover the entire PCI bus.
> >  Add virtio-pci-ranges to specify memory-map for direct-mapped guests.
> >  Document virtio-pci dom0less fdt bindings.]
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  docs/misc/arm/device-tree/booting.txt |  21 +++
> >  xen/arch/arm/dom0less-build.c         | 238 ++++++++++++++++++++++++++
> >  xen/arch/arm/include/asm/kernel.h     |  15 ++
> >  3 files changed, 274 insertions(+)
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > index 3a04f5c57f..82f3bd7026 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -276,6 +276,27 @@ with the following properties:
> >      passed through. This option is the default if this property is missing
> >      and the user does not provide the device partial device tree for the domain.
> >  
> > +- virtio-pci
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
> >  Under the "xen,domain" compatible node, one or more sub-nodes are present
> >  for the DomU kernel and ramdisk.
> >  
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index 09b65e44ae..dab24fa9e2 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -586,6 +586,189 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
> >      return res;
> >  }
> >  
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
> > +
> > +    snprintf(buf, sizeof(buf), "pcie@%lx", kinfo->virtio_pci.ecam.base);
> > +    dt_dprintk("Create virtio-pci node\n");
> > +    res = fdt_begin_node(fdt, buf);
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property_string(fdt, "device_type", "pci");
> > +    if ( res )
> > +        return res;
> > +
> > +    /* Create reg property */
> > +    cells = &reg[0];
> > +    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> > +                       kinfo->virtio_pci.ecam.base, GUEST_VIRTIO_PCI_ECAM_SIZE);
> > +
> > +    res = fdt_property(fdt, "reg", reg,
> > +                       (GUEST_ROOT_ADDRESS_CELLS +
> > +                        GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property(fdt, "reg-names", reg_names, sizeof(reg_names));
> > +    if ( res )
> > +        return res;
> > +
> > +    /* Create bus-range property */
> > +    cells = &reg[0];
> > +    dt_set_cell(&cells, 1, 0);
> > +    dt_set_cell(&cells, 1, 0xff);
> > +    res = fdt_property(fdt, "bus-range", reg, 2 * sizeof(*reg));
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property_cell(fdt, "#address-cells", 3);
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property_cell(fdt, "#size-cells", 2);
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property_string(fdt, "status", "okay");
> > +    if ( res )
> > +        return res;
> > +
> > +    /*
> > +     * Create ranges property as:
> > +     * <(PCI bitfield) (PCI address) (CPU address) (Size)>
> > +     */
> > +    cells = &reg[0];
> > +    dt_set_cell(&cells, 1, GUEST_VIRTIO_PCI_MEM_TYPE);
> > +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.mem.base);
> > +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.mem.base);
> > +    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, GUEST_VIRTIO_PCI_MEM_SIZE);
> > +    dt_set_cell(&cells, 1, GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE);
> > +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.pf_mem.base);
> > +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.pf_mem.base);
> > +    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE);
> > +    res = fdt_property(fdt, "ranges", reg, 14 * sizeof(*reg));
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property(fdt, "dma-coherent", "", 0);
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_property_cell(fdt, "#interrupt-cells", 1);
> > +    if ( res )
> > +        return res;
> > +
> > +    /*
> > +     * PCI-to-PCI bridge specification
> > +     * 9.1: Interrupt routing. Table 9-1
> > +     *
> > +     * the PCI Express Base Specification, Revision 2.1
> > +     * 2.2.8.1: INTx interrupt signaling - Rules
> > +     *          the Implementation Note
> > +     *          Table 2-20
> > +     */
> > +    cells = &irq_map[0];
> > +    for (devfn = 0; devfn <= 0x18; devfn += 8) {
> > +        for (intx_pin = 0; intx_pin < 4; intx_pin++) {
> > +            int irq = GUEST_VIRTIO_PCI_SPI_FIRST - 32;
> > +            irq += ((intx_pin + PCI_SLOT(devfn)) % 4);
> > +
> > +            dt_set_cell(&cells, 1, devfn << 8);
> > +            dt_set_cell(&cells, 1, 0);
> > +            dt_set_cell(&cells, 1, 0);
> > +            dt_set_cell(&cells, 1, intx_pin + 1);
> > +            dt_set_cell(&cells, 1, kinfo->phandle_gic);
> > +            /* 3 GIC cells.  */
> > +            dt_set_cell(&cells, 1, 0);
> > +            dt_set_cell(&cells, 1, irq);
> > +            dt_set_cell(&cells, 1, DT_IRQ_TYPE_LEVEL_HIGH);
> > +        }
> > +    }
> > +
> > +    /* Assert we've sized irq_map correctly.  */
> > +    BUG_ON(cells - &irq_map[0] != ARRAY_SIZE(irq_map));
> > +
> > +    res = fdt_property(fdt, "interrupt-map", irq_map, sizeof(irq_map));
> > +    if ( res )
> > +        return res;
> > +
> > +    cells = &reg[0];
> > +    dt_set_cell(&cells, 1, cpu_to_be16(PCI_DEVFN(3, 0)));
> 
> Hi Edgar, what is this PCI_DEVFN(3, 0)  device?


Hi Stefano,

This is for the interrupt-map-mask, since the swizzling pattern
repeats itself for every fourth device, we only need to describe
entries 0 - 3 and can mask out the rest.

I the next version (which will be quite different) I'll try to make
this clearer.


> 
> 
> > +    dt_set_cell(&cells, 1, 0x0);
> > +    dt_set_cell(&cells, 1, 0x0);
> > +    dt_set_cell(&cells, 1, 0x7);
> > +    res = fdt_property(fdt, "interrupt-map-mask", reg, 4 * sizeof(*reg));
> > +    if ( res )
> > +        return res;
> > +
> > +    if ( kinfo->virtio_pci.mode == VIRTIO_PCI_GRANTS )
> > +    {
> > +        cells = &reg[0];
> > +        dt_set_cell(&cells, 1, 0x0);
> > +        dt_set_cell(&cells, 1, GUEST_PHANDLE_IOMMU);
> > +        dt_set_cell(&cells, 1, 0x0);
> > +        dt_set_cell(&cells, 1, 0x10000);
> > +        res = fdt_property(fdt, "iommu-map", reg, 4 * sizeof(*reg));
> > +        if ( res )
> > +            return res;
> > +    }
> > +
> > +    res = fdt_property_cell(fdt, "linux,pci-domain", 1);
> > +    if ( res )
> > +        return res;
> > +
> > +    res = fdt_end_node(fdt);
> > +    if ( res )
> > +        return res;
> > +
> > +    if ( kinfo->virtio_pci.mode == VIRTIO_PCI_GRANTS )
> > +    {
> > +        snprintf(buf, sizeof(buf), "xen_iommu");
> 
> I don't think underscores are allowed in device tree node names


Will fix, thanks.


> 
> 
> 
> > +        res = fdt_begin_node(fdt, buf);
> > +        if ( res )
> > +            return res;
> > +
> > +        res = fdt_property_string(fdt, "compatible", "xen,grant-dma");
> > +        if ( res )
> > +            return res;
> > +
> > +        res = fdt_property_cell(fdt, "#iommu-cells", 1);
> > +        if ( res )
> > +            return res;
> > +
> > +        res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
> > +        if ( res )
> > +            return res;
> > +
> > +        res = fdt_end_node(fdt);
> > +    }
> > +
> > +    return res;
> > +}
> > +
> >  /*
> >   * The max size for DT is 2MB. However, the generated DT is small (not including
> >   * domU passthrough DT nodes whose size we account separately), 4KB are enough
> > @@ -693,6 +876,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
> >              goto err;
> >      }
> >  
> > +    if ( kinfo->virtio_pci.mode )
> > +    {
> > +        ret = make_virtio_pci_domU_node(kinfo);
> > +        if ( ret )
> > +            goto err;
> > +    }
> > +
> >      ret = fdt_end_node(kinfo->fdt);
> >      if ( ret < 0 )
> >          goto err;
> > @@ -744,11 +934,24 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
> >      return 0;
> >  }
> >  
> > +static u64 combine_u64(u32 v[2])
> 
> Let's make this a static inline or a macro. I can't believe we don't
> have one already.

Yes, I'll try what Stewart suggested.

Cheers,
Edgar

