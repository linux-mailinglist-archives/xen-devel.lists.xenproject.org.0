Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C917A2C7CFF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 03:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40625.73527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjZGr-0005rp-4D; Mon, 30 Nov 2020 02:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40625.73527; Mon, 30 Nov 2020 02:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjZGr-0005rQ-1D; Mon, 30 Nov 2020 02:50:33 +0000
Received: by outflank-mailman (input) for mailman id 40625;
 Mon, 30 Nov 2020 02:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+J0=FE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kjZGo-0005rG-UU
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 02:50:30 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4178d6ca-2ea6-46da-bb58-05210031a6d7;
 Mon, 30 Nov 2020 02:50:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 18:50:28 -0800
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Nov 2020 18:50:27 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 18:50:27 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 18:50:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 29 Nov 2020 18:50:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 29 Nov 2020 18:50:24 -0800
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 02:50:23 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 02:50:23 +0000
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
X-Inumbo-ID: 4178d6ca-2ea6-46da-bb58-05210031a6d7
IronPort-SDR: 1P3Gxyv0q5E+5OSh8qzwZcRZxQeQOLZwe/DyuXqu76HT3zpFzZtUfiC28gsv9UdDmEoud+iHXZ
 qapbHQ2MBPiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="160345679"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="160345679"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
IronPort-SDR: 3v1W/e3gG/2LaEmiAlJUgA09Rwx7PtNeUPGtcviUrXQiNl/pzFspK+nDkuWFeQhlhqcFDvroB6
 itLL1hM0qQ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372328842"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTNMdMFrrbfex0bE387q1d2I6gj7GBjql6YTQfoNHQAIId086Li7xkz9GHVytADgmMZvdskykAazsJGQBRT9cRLLwzMUUnFoUIVRJNr9+fIQtNEsCQM6FaxWZKDoJciWYqSykzMCb984OwboEsL7pm3vv+0BR6QaBc36E4GldSZXtKSgv5PI3vf99YsmqPbUMNuZ5S69TKmkC+Wy+Qklll+1+goWTHtvtrGOhP1pNI1RT1qtv7BPmaoUxOeWwaexWecZhGiBhIUJZxU7NNRuo7xjXuHJdcEEFrV7zkmXpDR+bvsWdl9d1EqlNlvnSCHIRh6PlKgWrX6E6d1YELSmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxGh980rurTfhXcU3ftPBq57c43XUNnP7P+xNRvGVbk=;
 b=eV+7tODrwQPNOSMfj7s+pdfR6KCPBhfid/NbgWWdbCCCMSgtEZsvBT4wV1GphthsLlq4GoefR0NGgHVbN8luBoje45eLl0W1IlrJ2jqKCvgeblN0X0H/c+OpUIkMSD/xWjCp2/1WAvUXboU4k+l8Upa0Bz6+g/2xQxB+vU7ar+/Lg5zSIWKKZ9u+Z1FccNtL4/T1t6Uyr4h9EGSxkztQCaKcom2vJxBms4RSkc1vYazF3kWvd41dyeEtPugTN6orkiW3hRYI0S5azI6E52RZTMYrCzlaopU3gIxBT3AAU8yt4zAVj5kpR28GAsa1YylFf/DK/grdizlrorLbnY4+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxGh980rurTfhXcU3ftPBq57c43XUNnP7P+xNRvGVbk=;
 b=mY96ZqFvtU17/TmZIOjjyTy2nCWoT2ZL6eGqlBMRM2LuKkK2aY1h5Jbfu6Rv3/BwsoXtUm38pDqQk/tQ5yapU1XxshwBSgYfwvZ45RcK54VjFs1TVg9CTRut8SFIgaZbbOBSiC50m3KK9U60TprT41Iw+iAUhfpwtuSU8roLBJs=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
Thread-Topic: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
Thread-Index: AQHWvoOaSpI/XFJ49Uub3hmiO5sEdqngCfbQ
Date: Mon, 30 Nov 2020 02:50:23 +0000
Message-ID: <MWHPR11MB16456E395CC9B993E0C07EC48CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20201119145216.29280-1-julien@xen.org>
In-Reply-To: <20201119145216.29280-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f170a4a-fe2a-4951-742e-08d894daaf3c
x-ms-traffictypediagnostic: CO1PR11MB5028:
x-microsoft-antispam-prvs: <CO1PR11MB50285EA04850D2D699A18E0D8CF50@CO1PR11MB5028.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hh/Op+FXpv3cM9MZAR0ziLVmj7Z1IN9gsKNEtT2xKCQIfrLZ46QLgUQmEcUuZLXnfYntK5bkHjAl6U0QLq2BVncQ7gxWyZ/ukCJP0wSHiljMQ/X07NxaxGiPVo6jRtjjDauCLRPZqRkNz57+pYR/4uXORJcVHMHydwJwKuG0ms+6ASuFAr8+RZwOMYdHft09sE6A+FZs8GCTFg/HnoqmggBtfbnkpLj2Z/fzplewb838TJ+i4YjRJhL4/raZk0kOMiMmHk+5QcstTYE51rHgCypjYDnAfvKod35acW5X9/rrbjss7gJ6ZGYZyUrJzwjMPmiOD6FhMfHA4v/uBkCX741M/oDUFFox3KJECXw/Mi2gXtikxMEa9zP8RsTpubXKU2NDL7v3+BykhBH0nLH8GA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(71200400001)(9686003)(52536014)(6506007)(4326008)(7696005)(86362001)(8936002)(5660300002)(316002)(76116006)(64756008)(186003)(26005)(966005)(8676002)(2906002)(66446008)(33656002)(110136005)(66476007)(478600001)(66556008)(55016002)(66946007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?l8aQBlvABtbNL/DtlPGZCl6h/cYnPzqBU683PYs8cvi3BqWxTjOMPIO7HlmV?=
 =?us-ascii?Q?JRe/sUrwx+/gyVCacIZ0DeFu/SFfSu5QPQs/MtKMxaGtuhBdYJ/+cYR1qgcH?=
 =?us-ascii?Q?pH33Jn0Sk7SPlqCDsO0zlYyRIIPGHXuw0bndqo2Kvgwyda0MJ3kLn0/2w3zP?=
 =?us-ascii?Q?TpmDruY5IErphcUap7bFZoDPuaaCOwTX263/ZkzwQTIVwo4gqig0hOzvV6tV?=
 =?us-ascii?Q?yOk8QT5xB9Ulp+RPSG7gsnOrF9M2taFoPQpnv4IGPq7SKfKxlLa/xAOsTGdM?=
 =?us-ascii?Q?6l2Dp2SHCNCxYsVvF8gipsWo34NbCM+5IPBq0HSsalIlsCIQpRZjjPRR1PuI?=
 =?us-ascii?Q?jYEnwdmTLveHHaZa63Q0VpDsKqM8i1Au03LUV2yy895qoVcw5jiVGkVrKvPn?=
 =?us-ascii?Q?tzdOufMhxksw4yfI7H+zhhQJHI8dKCmq4kGLOH9RtA5JvDNpjZfFo9pZwLGo?=
 =?us-ascii?Q?XUnKH6pfyTD/K6Oi0pELKaHcfsfZXyxJIUTR0YlwlNPE1ju+JZh+9Vp043oL?=
 =?us-ascii?Q?3ggfz130+dUCQ/pcABOzWE1Y3J5LXv3pKWzuRO8cGpil5MxkrXpjHcspSrGy?=
 =?us-ascii?Q?z+saD1zJovRTz4R93TwhKWFllddhJSgTFYhfMCJeX6Q9xiz3CTLLEZurU5hs?=
 =?us-ascii?Q?TA9Lmd44foDaCJtOQSF8xHYj3N54x7zByLn3J0F2ADAwqoH8V2cEBaAFIYzO?=
 =?us-ascii?Q?7sRI/9wGx86OOY3KZ5z4PYuRb1TWUMkhVCP+JO4auiKwjTCYjD717SPdIeNX?=
 =?us-ascii?Q?dgf0Bp/hRuckqwCL09T4SHFN6Ijg94AvcoywulWZ0l4YpI4srsVZNOIVD3/v?=
 =?us-ascii?Q?83Szt+i+oy4az8DbHOS538EQ/VyXH45TZIL3vP55zJSwWvb03bjs9YfwEpuQ?=
 =?us-ascii?Q?rUovW7TI92JJX57MJi4ayr3ZMM7xn6ddm0+3APnT/2mhmbshC6RI7Y//qyWv?=
 =?us-ascii?Q?AarELN5kXcTOR3QzyPlUeFvr5IQYGWaquKk7L2C1J/0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f170a4a-fe2a-4951-742e-08d894daaf3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 02:50:23.6041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: boWQBMNynXt7pOBMdGZeUHqWKHP9CEdY8uQc/5ZsxAYPIyqont6NnUBOUPLNU5yV5G+49iF1N6sgDWPo0zKPNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com

> From: Julien Grall <julien@xen.org>
> Sent: Thursday, November 19, 2020 10:52 PM
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> When booting Xen with CONFIG_USBAN=3Dy on Sandy Bridge, UBSAN will
> throw
> the following splat:
>=20
> (XEN)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> (XEN) UBSAN: Undefined behaviour in quirks.c:449:63
> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
> (XEN) ----[ Xen-4.11.4  x86_64  debug=3Dy   Not tainted ]----
>=20
> [...]
>=20
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0802c0ccc>] ubsan.c#ubsan_epilogue+0xa/0xad
> (XEN)    [<ffff82d0802c16c9>]
> __ubsan_handle_shift_out_of_bounds+0xb4/0x145
> (XEN)    [<ffff82d0802eeecd>] pci_vtd_quirk+0x3d3/0x74f
> (XEN)    [<ffff82d0802e508b>]
> iommu.c#domain_context_mapping+0x45b/0x46f
> (XEN)    [<ffff82d08053f39e>] iommu.c#setup_hwdom_device+0x22/0x3a
> (XEN)    [<ffff82d08053dfbc>] pci.c#setup_one_hwdom_device+0x8c/0x124
> (XEN)    [<ffff82d08053e302>] pci.c#_setup_hwdom_pci_devices+0xbb/0x2f7
> (XEN)    [<ffff82d0802da5b7>] pci.c#pci_segments_iterate+0x4c/0x8c
> (XEN)    [<ffff82d08053e8bd>] setup_hwdom_pci_devices+0x25/0x2c
> (XEN)    [<ffff82d08053e916>]
> iommu.c#intel_iommu_hwdom_init+0x52/0x2f3
> (XEN)    [<ffff82d08053d6da>] iommu_hwdom_init+0x4e/0xa4
> (XEN)    [<ffff82d080577f32>] dom0_construct_pv+0x23c8/0x2476
> (XEN)    [<ffff82d08057cb50>] construct_dom0+0x6c/0xa3
> (XEN)    [<ffff82d080564822>] __start_xen+0x4651/0x4b55
> (XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x55
>=20
> Note that splat is from 4.11.4 and not staging. Although, the problem is
> still present.
>=20
> This can be solved by making the first operand unsigned int.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

>=20
> CR: https://code.amazon.com/reviews/CR-38873112
> ---
>  xen/drivers/passthrough/vtd/quirks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/passthrough/vtd/quirks.c
> b/xen/drivers/passthrough/vtd/quirks.c
> index a8330f17bc0c..8a81d9c9308b 100644
> --- a/xen/drivers/passthrough/vtd/quirks.c
> +++ b/xen/drivers/passthrough/vtd/quirks.c
> @@ -435,7 +435,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
>      case 0x3728: /* Xeon C5500/C3500 (JasperForest) */
>      case 0x3c28: /* Sandybridge */
>          val =3D pci_conf_read32(pdev->sbdf, 0x1AC);
> -        pci_conf_write32(pdev->sbdf, 0x1AC, val | (1 << 31));
> +        pci_conf_write32(pdev->sbdf, 0x1AC, val | (1U << 31));
>          printk(XENLOG_INFO "Masked VT-d error signaling on %pp\n", &pdev=
-
> >sbdf);
>          break;
>=20
> --
> 2.17.1


