Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720A327638
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 03:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91227.172335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGYhb-0007Hm-8C; Mon, 01 Mar 2021 02:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91227.172335; Mon, 01 Mar 2021 02:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGYhb-0007HQ-58; Mon, 01 Mar 2021 02:54:31 +0000
Received: by outflank-mailman (input) for mailman id 91227;
 Mon, 01 Mar 2021 02:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8He=H7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lGYhZ-0007HL-TZ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 02:54:29 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cab11424-ae6d-451e-b4cf-ad2687b85987;
 Mon, 01 Mar 2021 02:54:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 18:54:27 -0800
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 28 Feb 2021 18:54:27 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:54:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 28 Feb 2021 18:54:27 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.55) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 28 Feb 2021 18:54:26 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2224.namprd11.prod.outlook.com (2603:10b6:301:52::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 02:54:24 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 02:54:24 +0000
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
X-Inumbo-ID: cab11424-ae6d-451e-b4cf-ad2687b85987
IronPort-SDR: I2PTngH+kXPIMRNcrNXfHe6EDrSWYAFvA64uKKuvGCIVkrah/h7ZbSsT5yDEdi/mOJvA6Xca0o
 /ykXjbOi1OLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="182938083"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="182938083"
IronPort-SDR: 7Om0hpx9mFJOY15MbI61vDhaZTFw6Cd40pbu4tdkP24dMZNbbBElfyAgXMFr1xNiQQy55G32g3
 4kX7cM++6w8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="366559411"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKXWYf86QudRxWalkgLHEKcxX23PiYkmE7BY5DNjfp1RIWglUfNCm0VCWjDMiiGgU96UNY83bes9f03ZoaZZkbT7c6yXSv8wPvjoavuSJFPsc20mmnX+10BgAzsLgZiF9PlkoPiSVxbQTfEIX72eZ+HfNw+BEZXZ7/rRH4TpOGcQgU3JJdB/dDPubD4qHq9fTx+AqYb4nfuJxM/KBgG+FSCoShYsan0i2otjJOVcR9SgeGzRdDgJfkCcDYMIGCujhovblSIeHvOYuQdjOoGch++7C0/9JaMqCaWBnEk/+BlYj7tMiccVs4bFbzomoZU73sgb9XzoFZScp4gl9DpPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZxTLy4zDG/KoZLGFJYJg7VHVh0CrYyXqnkOjpTcIbM=;
 b=Kz5rWz7Bc7GszNqooGY1inQOonI2h71xkthSQ4O3Wsi/Gx0CZB8rGZTHkUkp/rs2M9ZAsbeunJ/T0or8RZNU/ZhRwee5urEPvIxKLfVgRpS4kHItWPTRn8GQRwu9H0cSzgZOhzJMKxfUKvMBo9wbhQGrv3XsEIHEWC1fKupdnGXZbu/nYiekTIEyU666jzamuR+OIoSpI6zCA+PVRxvL3bYHPej1GQJ9t3U/RX2lNoKiVGoVix1MGzaLNdwu2BrxUQZAf76qutkvlRisDX7Yt0RgWrmCh0UX2zwLcvz9+x2xpDJgrjxukoH5g5XebJ/4IefjKHzNsE7cv/EuWSv2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZxTLy4zDG/KoZLGFJYJg7VHVh0CrYyXqnkOjpTcIbM=;
 b=CyVGi42i6laArrt//h6bABdBwDGCfrjxElHkj2cvjbI3aEeM0LVTUS0FLcbdtvq+E1sWoIexQKIidvvh2AROQpObyMQlxoOLitxLLEzu522UNw/2wgPlWD8+C6MYaarNS43CkRO8Qw6FtKhtnoxMx74KqbRkI9iiv1XMY795yYo=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "hongyxia@amazon.co.uk" <hongyxia@amazon.co.uk>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>, Jan Beulich
	<jbeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: RE: [PATCH for-4.15 v5 3/3] xen/iommu: x86: Clear the root page-table
 before freeing the page-tables
Thread-Topic: [PATCH for-4.15 v5 3/3] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
Thread-Index: AQHXDC4c+ANUTO2s/0S1EiKjaE2Gtqpuc4ZA
Date: Mon, 1 Mar 2021 02:54:23 +0000
Message-ID: <MWHPR11MB18863C7E6DD57B1915C806D78C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210226105640.12037-1-julien@xen.org>
 <20210226105640.12037-4-julien@xen.org>
In-Reply-To: <20210226105640.12037-4-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af38ba33-a6ff-4a48-68a5-08d8dc5d522c
x-ms-traffictypediagnostic: MWHPR1101MB2224:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB222440FC2E440F9B72B155908C9A9@MWHPR1101MB2224.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C70i+GBMkXR4qo9IKPpfB1vyUNBl+RGZe+cAR9f1fXTTcoOSp5D7xqntodeXP1LEttq5nGPZjSmMaH7v+UBaeLcaftAT26jJVJ2LBiArjhex2JnteAgQDrh+5lH/l2KzW8XOy0I1iuHdORxYdwM65MP6BwGVHM/953wWdoqNu+A7BX4+B5zrYi4rrrJrJEA1L/DHl+9Nwl/k+w/bLLANqUzEYrJLkRol7+WV4dAPy2lbiR6xgzsubHHh5WqNtSRwc7fB+xk5vxsG9wyPBLGcWntW9vp1T1oiDR8PbYMOJAhhEqlhQ27jGYSV2FIP9GKGc/HailukJZcP+tNbvaluNzUuDtrNhmBuCiOkwrJmKt2wIt3DW3QcR9uef7WdfIOGlXRlasrWVUBsfKSOzHDSq64ikwWwNXHnn2LO6AaIUtkBhOihuiGTCCTNcJXDYfqLYl21sc8z9McMUJ2cZfAGP2Nx9ptjRsR+Zq8ZljX3lj2TkpurJbhmf+tTD7cfopVDE8swFzImIWUJU+DN4AyzYA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(346002)(396003)(136003)(33656002)(186003)(71200400001)(26005)(55016002)(9686003)(8676002)(8936002)(7696005)(86362001)(478600001)(54906003)(110136005)(4326008)(52536014)(5660300002)(83380400001)(6506007)(316002)(66556008)(64756008)(66446008)(76116006)(66476007)(2906002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5xZbJz/vfie1WMBtStTnIqFeWn3C22Q4tbvP2vy7JsnIeO0ne5TZsKg/8cAP?=
 =?us-ascii?Q?vgT+4txR2h+7rl++GVrkbmAOnv6MZ6T/gqYW1YhA67B5/gslcQc6mYRbfDfx?=
 =?us-ascii?Q?O07uzLXMS3FunDirrIwbw59w8uLg/YwI28MQHQIIb05XfxEDvxEPDPnOwzrO?=
 =?us-ascii?Q?eHwh5gZFYnhYIRxoTOoq+t/oeRaROP57aBlMouo0pmQLb7XPzxWeN3a0mTsI?=
 =?us-ascii?Q?j8Ek0xUL2P98ZrW9lhdNgqSfgDROzaROl3cbKrUs8l/h6E573oNM+od1kFS0?=
 =?us-ascii?Q?CGM771cL80Rm5bX/az5HgP33UukkJRbfOxeHVPWAijekrErjOq0zS91dI9vH?=
 =?us-ascii?Q?BPRUlBgkZ4uKUZtmPmyB6bMzd52+FwtKb4hQ1CA21PPACJp0tyyNGw6XoCAH?=
 =?us-ascii?Q?dq2CMfYukd+S74UscqOuQ6mgRvhLewYPxyxXoB721i7jhBCgfdlp0tvhv9Dc?=
 =?us-ascii?Q?sav324gRs9ciIlO6s/RbgmFEYzNQEq6ImC4yLU2w/hB88goa6TQZ+AB2bK9M?=
 =?us-ascii?Q?+feRaP+caxU9qjXUHNK87hKfufQCw1RtQWpN7psPVEEH0XH71w1r2TmFnuhk?=
 =?us-ascii?Q?bWmKKEyJDFDqOj8dyvVQYPHZ3yC77TPr2GqnEcMGCl51gnSuLk5BajkphmMM?=
 =?us-ascii?Q?U7CnkFX39+2VhgnOTSBC9Aqh5RQL0/PMR/xV+7sQ9Rp/Fee3JEz6Q9GW/CAb?=
 =?us-ascii?Q?E72XaYokstAJG3JZxxb+TXIijziS4LVpXwyRNXkA571eOueLdVAvubVytpib?=
 =?us-ascii?Q?s4XEejs4wtuWbqrnJqf5yOe1L1L1N5k8j3HWmSWDiRlEzxS9avdxo5xadHRh?=
 =?us-ascii?Q?Cv2ex4By9qKtTa0Uqu324ZkpJ97nKAzBvoGVWI7t3dOo6U3z6nV+TKz7OcoC?=
 =?us-ascii?Q?NXj6u8AwX7ysc4gb7Mhfl4eQL3j4JMuc/swvmBTMCgtPZFwxfE+1ZiB9g8Yt?=
 =?us-ascii?Q?jzUKmb+W34wR3baWJ2Wb7yPcDguUT9RfKiReUiFL+jzjg7iToTonCYQokvZB?=
 =?us-ascii?Q?jOwzXFXY6Jcf9ENDbXgmTe04ospprJdUscciAbF+51+FgwBwb5J7Tm4pbEGq?=
 =?us-ascii?Q?VHhH8H79n9cTzBLqgHkniIf60jDLO8QLkmps09Cl9DEwva555CW12bf57cXi?=
 =?us-ascii?Q?QWHQ5486mVYMikMIDnzjRrgLTBQ8PDmla5CTkxBtSkDXW1BRr8gCTuZac+fw?=
 =?us-ascii?Q?FaTVUvx50OQMBNdEQynz7KQvDZocq3mDR2OHfyvfYw/MnXe/6x/oLUwHK4rS?=
 =?us-ascii?Q?/zy+qWnV0C+c4yRGbw0oSC7wXA112zKiH5jXZKgP9VHZb96rqFHh9YTSIf0q?=
 =?us-ascii?Q?FrCrhkqLkI9NvexUb4QkGvXw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af38ba33-a6ff-4a48-68a5-08d8dc5d522c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 02:54:24.0077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNn23MbGZXo8rApACwhA6kbh7yPQ0WUYxCQUw7cFiwC/XPjEINZwG/X6j4llX0SR+s5++/LuD+LIqtqsRAt0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2224
X-OriginatorOrg: intel.com

> From: Julien Grall <julien@xen.org>
> Sent: Friday, February 26, 2021 6:57 PM
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The new per-domain IOMMU page-table allocator will now free the
> page-tables when domain's resources are relinquished. However, the
> per-domain IOMMU structure will still contain a dangling pointer to
> the root page-table.
>=20
> Xen may access the IOMMU page-tables afterwards at least in the case of
> PV domain:
>=20
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04025b4b2>] R
> iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
> (XEN)    [<ffff82d04025b695>] F
> iommu.c#intel_iommu_unmap_page+0x5d/0xf8
> (XEN)    [<ffff82d0402695f3>] F iommu_unmap+0x9c/0x129
> (XEN)    [<ffff82d0402696a6>] F iommu_legacy_unmap+0x26/0x63
> (XEN)    [<ffff82d04033c5c7>] F mm.c#cleanup_page_mappings+0x139/0x144
> (XEN)    [<ffff82d04033c61d>] F put_page+0x4b/0xb3
> (XEN)    [<ffff82d04033c87f>] F put_page_from_l1e+0x136/0x13b
> (XEN)    [<ffff82d04033cada>] F devalidate_page+0x256/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d8d6>] F mm.c#put_page_from_l2e+0x8a/0xcf
> (XEN)    [<ffff82d04033cc27>] F devalidate_page+0x3a3/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d807>] F mm.c#put_page_from_l3e+0x8a/0xcf
> (XEN)    [<ffff82d04033cdf0>] F devalidate_page+0x56c/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d6c7>] F mm.c#put_page_from_l4e+0x69/0x6d
> (XEN)    [<ffff82d04033cf24>] F devalidate_page+0x6a0/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d92e>] F put_page_type_preemptible+0x13/0x15
> (XEN)    [<ffff82d04032598a>] F domain.c#relinquish_memory+0x1ff/0x4e9
> (XEN)    [<ffff82d0403295f2>] F domain_relinquish_resources+0x2b6/0x36a
> (XEN)    [<ffff82d040205cdf>] F domain_kill+0xb8/0x141
> (XEN)    [<ffff82d040236cac>] F do_domctl+0xb6f/0x18e5
> (XEN)    [<ffff82d04031d098>] F pv_hypercall+0x2f0/0x55f
> (XEN)    [<ffff82d04039b432>] F lstar_enter+0x112/0x120
>=20
> This will result to a use after-free and possibly an host crash or
> memory corruption.
>=20
> It would not be possible to free the page-tables further down in
> domain_relinquish_resources() because cleanup_page_mappings() will only
> be called when the last reference on the page dropped. This may happen
> much later if another domain still hold a reference.
>=20
> After all the PCI devices have been de-assigned, nobody should use the
> IOMMU page-tables and it is therefore pointless to try to modify them.
>=20
> So we can simply clear any reference to the root page-table in the
> per-domain IOMMU structure. This requires to introduce a new callback of
> the method will depend on the IOMMU driver used.
>=20
> Take the opportunity to add an ASSERT() in arch_iommu_domain_destroy()
> to check if we freed all the IOMMU page tables.
>=20
> Fixes: 3eef6d07d722 ("x86/iommu: convert VT-d code to use new page table
> allocator")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

>=20
> ---
>     Changes in v5:
>         - Add Jan's reviewed-by
>         - Fix typo
>         - Use ! rather than =3D=3D NULL
>=20
>     Changes in v4:
>         - Move the patch later in the series as we need to prevent
>         iommu_map() to allocate memory first.
>         - Add an ASSERT() in arch_iommu_domain_destroy().
>=20
>     Changes in v3:
>         - Move the patch earlier in the series
>         - Reword the commit message
>=20
>     Changes in v2:
>         - Introduce clear_root_pgtable()
>         - Move the patch later in the series
> ---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 +++++++++++-
>  xen/drivers/passthrough/vtd/iommu.c         | 12 +++++++++++-
>  xen/drivers/passthrough/x86/iommu.c         | 13 +++++++++++++
>  xen/include/xen/iommu.h                     |  1 +
>  4 files changed, 36 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 42b5a5a9bec4..085fe2f5771e 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -381,9 +381,18 @@ static int amd_iommu_assign_device(struct domain
> *d, u8 devfn,
>      return reassign_device(pdev->domain, d, devfn, pdev);
>  }
>=20
> +static void amd_iommu_clear_root_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd =3D dom_iommu(d);
> +
> +    spin_lock(&hd->arch.mapping_lock);
> +    hd->arch.amd.root_table =3D NULL;
> +    spin_unlock(&hd->arch.mapping_lock);
> +}
> +
>  static void amd_iommu_domain_destroy(struct domain *d)
>  {
> -    dom_iommu(d)->arch.amd.root_table =3D NULL;
> +    ASSERT(!dom_iommu(d)->arch.amd.root_table);
>  }
>=20
>  static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
> @@ -565,6 +574,7 @@ static const struct iommu_ops __initconstrel
> _iommu_ops =3D {
>      .remove_device =3D amd_iommu_remove_device,
>      .assign_device  =3D amd_iommu_assign_device,
>      .teardown =3D amd_iommu_domain_destroy,
> +    .clear_root_pgtable =3D amd_iommu_clear_root_pgtable,
>      .map_page =3D amd_iommu_map_page,
>      .unmap_page =3D amd_iommu_unmap_page,
>      .iotlb_flush =3D amd_iommu_flush_iotlb_pages,
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index b549a71530d5..475efb3be3bd 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1726,6 +1726,15 @@ out:
>      return ret;
>  }
>=20
> +static void iommu_clear_root_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd =3D dom_iommu(d);
> +
> +    spin_lock(&hd->arch.mapping_lock);
> +    hd->arch.vtd.pgd_maddr =3D 0;
> +    spin_unlock(&hd->arch.mapping_lock);
> +}
> +
>  static void iommu_domain_teardown(struct domain *d)
>  {
>      struct domain_iommu *hd =3D dom_iommu(d);
> @@ -1740,7 +1749,7 @@ static void iommu_domain_teardown(struct
> domain *d)
>          xfree(mrmrr);
>      }
>=20
> -    hd->arch.vtd.pgd_maddr =3D 0;
> +    ASSERT(!hd->arch.vtd.pgd_maddr);
>  }
>=20
>  static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn=
,
> @@ -2731,6 +2740,7 @@ static struct iommu_ops __initdata vtd_ops =3D {
>      .remove_device =3D intel_iommu_remove_device,
>      .assign_device  =3D intel_iommu_assign_device,
>      .teardown =3D iommu_domain_teardown,
> +    .clear_root_pgtable =3D iommu_clear_root_pgtable,
>      .map_page =3D intel_iommu_map_page,
>      .unmap_page =3D intel_iommu_unmap_page,
>      .lookup_page =3D intel_iommu_lookup_page,
> diff --git a/xen/drivers/passthrough/x86/iommu.c
> b/xen/drivers/passthrough/x86/iommu.c
> index ad19b7dd461c..b90bb31bfeea 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
>=20
>  void arch_iommu_domain_destroy(struct domain *d)
>  {
> +    /*
> +     * There should be not page-tables left allocated by the time the
> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
> +     * called unconditionally, so pgtables may be uninitialized.
> +     */
> +    ASSERT(!dom_iommu(d)->platform_ops ||
> +           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
>  }
>=20
>  static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> @@ -273,6 +280,12 @@ int iommu_free_pgtables(struct domain *d)
>      /* After this barrier, no new IOMMU mappings can be inserted. */
>      spin_barrier(&hd->arch.mapping_lock);
>=20
> +    /*
> +     * Pages will be moved to the free list below. So we want to
> +     * clear the root page-table to avoid any potential use after-free.
> +     */
> +    hd->platform_ops->clear_root_pgtable(d);
> +
>      while ( (pg =3D page_list_remove_head(&hd->arch.pgtables.list)) )
>      {
>          free_domheap_page(pg);
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 863a68fe1622..d59ed7cbad43 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -272,6 +272,7 @@ struct iommu_ops {
>=20
>      int (*adjust_irq_affinities)(void);
>      void (*sync_cache)(const void *addr, unsigned int size);
> +    void (*clear_root_pgtable)(struct domain *d);
>  #endif /* CONFIG_X86 */
>=20
>      int __must_check (*suspend)(void);
> --
> 2.17.1


