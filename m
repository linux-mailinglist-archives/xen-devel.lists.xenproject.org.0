Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79CB984A25
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 19:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803261.1213762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st94s-0002SG-IZ; Tue, 24 Sep 2024 17:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803261.1213762; Tue, 24 Sep 2024 17:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st94s-0002QF-F4; Tue, 24 Sep 2024 17:11:54 +0000
Received: by outflank-mailman (input) for mailman id 803261;
 Tue, 24 Sep 2024 17:11:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoKa=QW=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1st94r-00010G-J8
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 17:11:53 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 169e1bac-7a98-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 19:11:51 +0200 (CEST)
Received: from BN9PR03CA0808.namprd03.prod.outlook.com (2603:10b6:408:13f::33)
 by CY5PR12MB6371.namprd12.prod.outlook.com (2603:10b6:930:f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Tue, 24 Sep
 2024 17:11:47 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::63) by BN9PR03CA0808.outlook.office365.com
 (2603:10b6:408:13f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Tue, 24 Sep 2024 17:11:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 17:11:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Sep
 2024 12:11:46 -0500
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
X-Inumbo-ID: 169e1bac-7a98-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVlT0SEGx4Lw2r0K1SzHE5jRP2q6KinZUrYGNOKK+OuJ0TyEhwUlO6SD6bXAiMg14iDjvfYhacj7C0R0OcsfrnZFW6FmDD1PGemgojc4/I2xBrWRRBJ8WMlOb3aNqge1VFufDH843Z2lLkPMYRDnNBxZuw93e4X1ZADw5A3EMRx61vfiRpgn9hezxctXWU6N09iw8XWkGp4aTsBQHD7j93Y2lpXSF5TawcTZUc+cYK2JrYP2LG1ZRJKKd/qV/gkkypB/+V/hFRabFqURfHQy5MwWcigBJKkiOJo8pRMzkwkwoNa8moaTwfNDKN36OuL1p+4T2MXSAM0/C0LUDTYHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlPrTEz8wHFhdYjr41B8e88hFngiwqnen+WM8gyV6ck=;
 b=XKAw/v84pj2Bdzg4nIPVZ18iVJeTAwrbtk8kVzYcgCaxW89WZAK4zCbX0snxoq2/MJYR/UUW+/frrCXjEK/yYaOLIc8SDAFkhAt53tUIDDQFIQ2GsX95LGIQshakdyyeM/R+M4zSekawkvPZ3LJu+zAXke16gApUYzkxJZb0TNq+vhgyV5LJ7IlnpEOYHnjp3KfMZN+gy/6yHGcAgAuOZi5yftSdye7Zu1nTWZaMX6Cs8xkx/+tGOepmVdZXNh8cayuS3JkqHpGYUqDNmC0rj/MgoF1v1CShJJqYzwAbysn3oxcP2/Ltl+MOZJ14DHuIKR9rf154Rai/ve89YI7hcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlPrTEz8wHFhdYjr41B8e88hFngiwqnen+WM8gyV6ck=;
 b=W8YsQ2BZjM0Kjd/TZCT33/uyDKoRBNbs5ung7HpViF3EqgYmHFro7ESaKhKIUUvhhSU5xYMmbighhH54nq11Fmaux7VI7DFqG1em9EizJd/occ6eIdvw5dqCgVanvNedZ8Ab8axlH7GJMstM08bwgixeu1q65mKFq7xOvlyAb4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 24 Sep 2024 19:11:41 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 2/6] xen/arm: Reserve resources for virtio-pci
Message-ID: <ZvLyzZ8n-QgrYOCW@zapote>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-3-edgar.iglesias@gmail.com>
 <465cb8b5-5f46-42ce-be8f-a38c1c23a805@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <465cb8b5-5f46-42ce-be8f-a38c1c23a805@xen.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CY5PR12MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: cc99a0de-ce0c-44da-1ef2-08dcdcbbf90d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4GN9bv5pjLC6o7MdES+UTIvSueu30iQKaPIH/i1HbA+VgGVy6DzgZ8x1TL3Q?=
 =?us-ascii?Q?do6+J7iPhqIsfRjXYe0Z9mh4DGTzOX14xeWLa+2/SlbdU6TuX/xV5ve+AWN9?=
 =?us-ascii?Q?3l56CiT7Nzpod4xAhhRjjsSBkZkNVpUdT2AtrF+S+wxaFJcadSCaWy4PQm9m?=
 =?us-ascii?Q?LaP1Lrj56PaqOcKiQ0qEJNa1lV5B16Dlmu2gAr66Ya91o2B5QS//4ZWlNbq/?=
 =?us-ascii?Q?48C7Po6Xptl+Q5qbyi8rFOKMtMLkbQxQZrStvZXfjSA70FTAr8YJkcT0/Tun?=
 =?us-ascii?Q?htVw+pGgJLK35ja7EuRJKpYmUkaw4fv3sEIyRRbVNG/vanTLKmc5TQn4rkKH?=
 =?us-ascii?Q?6RumSRzSsfidflPHr0tsRb42J8qX4zorlPMDx1/6FOKMlAjlJacb+n30mOfx?=
 =?us-ascii?Q?D3E0usgCDgR+C6X5BaFnIy8sc4ALxU2Msn2dV74TuvmkD2UZCXnQdN0fFFHi?=
 =?us-ascii?Q?O29fshSOfAkV8PRz0nAt+WxQ3WDZFHhuzVhbGLXEmOSHqIuXbTd+tfQVbnRG?=
 =?us-ascii?Q?PXNrcu9Cxt+TlhRBZWISdtYiHv9vfD/6A/rc6hCFbjz5t094q29NV/Pmb/yB?=
 =?us-ascii?Q?QNUadRwvnAElrp+fduibjt4t265ty2XgXfk+p3KAqU2A+NH9npED8T6xpi9+?=
 =?us-ascii?Q?dv8GEDX0wIeEMqjbAjGlfI4NC962ovek2bHe4++kkMPDffQUINdnuQhlPdzB?=
 =?us-ascii?Q?gc4/1VVjkYlnrMTbj0qCBwQcUnLoEu0BG4RIeZoi5wbTHBzPXWRsLnYjfwNZ?=
 =?us-ascii?Q?/ryI/VVfpR9BhfIOAQAv0ExHBgtS8+hGzUK/OMA0ZPkyMHv7L7Ri/jj8FdfW?=
 =?us-ascii?Q?qfHac7GnpIlVR8lEl7KH4+1shFN+ZclDjsWfyzXm1IiQC1WQd8Vvo3nUPq3z?=
 =?us-ascii?Q?Kv5cTfJkAG+ojc80vrdpSylMN617hurNfN7f3TGKTwB9Rtv/jsaS4x6nxXff?=
 =?us-ascii?Q?czkrFVBNnknZgt3uPvvXef2Adoeq5YfmJQ1hH2a9Xmmw2kNBPo2+5OAkk4Aw?=
 =?us-ascii?Q?saIXiXauvPh3NUVtIOA5BFXKEJnFQ0/A+gOZM29HbHmnTuq8mazfZszLiiZU?=
 =?us-ascii?Q?LWYW4Lnv/Quis9DF+rZTkov/z0FYdlE7LpLFxRDT0utCpoQRbWq4aXj5yjZL?=
 =?us-ascii?Q?3Kk+LEkTZk9GhMXmiP47C7jQzlu+4+dZYnjKbZN8c4NcOVtGxezc/2QcZ5Xt?=
 =?us-ascii?Q?vkxvr32/7YC5KhfLAX0j/fCPpsMSB5gIzLN/1XbVhgSGYWqabtIuhoeFlql/?=
 =?us-ascii?Q?HkXBqDZ7EXDfNeD2QxrS3VVsnnfY42O8R423zJ7iV1eCyZrbWaLGBSB1CKb+?=
 =?us-ascii?Q?RQxrhncdcgDcS3KOkdjMhyVswAmjsujSPUVUPCYWyAWnolB9vKwPdqaTvvl2?=
 =?us-ascii?Q?DPAt//HV61leEBt+FuearpqKiS2W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 17:11:47.4524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc99a0de-ce0c-44da-1ef2-08dcdcbbf90d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6371

On Tue, Sep 24, 2024 at 05:35:20PM +0100, Julien Grall wrote:
> Hi Edgar,
> 
> On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Reserve memory ranges and interrupt lines for an externally
> > emulated PCI controller (e.g by QEMU) dedicated to hosting
> > Virtio devices and potentially other emulated devices.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >   xen/include/public/arch-arm.h | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> > 
> > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> > index e19f0251a6..654b827715 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -494,6 +494,20 @@ typedef uint64_t xen_callback_t;
> >   #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 952GB of RAM @ 8GB */
> >   #define GUEST_RAM1_SIZE   xen_mk_ullong(0xee00000000)
> > +/* Virtio PCI - Ordered by decreasing size to keep things aligned */
> > +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE  xen_mk_ullong(0x43000000)
> > +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE  xen_mk_ullong(0x0f000000000)
> > +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE  xen_mk_ullong(0x100000000)
> > +
> > +#define GUEST_VIRTIO_PCI_ECAM_BASE      (GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE + \
> > +                                         GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE)
> > +#define GUEST_VIRTIO_PCI_ECAM_SIZE      xen_mk_ullong(0x10000000)
> > +
> > +#define GUEST_VIRTIO_PCI_MEM_TYPE         xen_mk_ullong(0x02000000)
> > +#define GUEST_VIRTIO_PCI_MEM_BASE         (GUEST_VIRTIO_PCI_ECAM_BASE + \
> > +                                           GUEST_VIRTIO_PCI_ECAM_SIZE)
> > +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x00002000000)
> 
> Why is this specific to virtio PCI? However, I am not entirely convinced we
> should have a second PCI hostbridge exposed to the guest for a few reasons:
>   1. This require to reserve yet another range in the address space (could
> be solved with a more dynamic layout)
>   2. From your instructions, the guest needs to explicitly do a PCI rescan.
> 
> So rather than having a second hostbridge, have you considered to extend the
> existing hostbridge (implemented in Xen) to support a mix of physical PCI
> device and virtual one?
>

Thanks Julien,

It's briefly come up in a couple of discussions but I haven't looked
carefully at it. It is a good idea and it's probably worth prototyping
to see what the gaps are in hypercall interfaces, QEMU support etc.

Cheers,
Edgar


