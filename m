Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D95327636
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 03:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91224.172323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGYft-0007Al-SP; Mon, 01 Mar 2021 02:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91224.172323; Mon, 01 Mar 2021 02:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGYft-0007AP-Oo; Mon, 01 Mar 2021 02:52:45 +0000
Received: by outflank-mailman (input) for mailman id 91224;
 Mon, 01 Mar 2021 02:52:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8He=H7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lGYfs-0007AK-5d
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 02:52:44 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9be897fb-1e24-42fa-b63f-0ea08d55cee7;
 Mon, 01 Mar 2021 02:52:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 18:52:41 -0800
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga002.jf.intel.com with ESMTP; 28 Feb 2021 18:52:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:52:40 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:52:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 28 Feb 2021 18:52:40 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.57) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 28 Feb 2021 18:52:39 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2224.namprd11.prod.outlook.com (2603:10b6:301:52::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 02:52:36 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 02:52:36 +0000
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
X-Inumbo-ID: 9be897fb-1e24-42fa-b63f-0ea08d55cee7
IronPort-SDR: 4cevuxp8ExrZAmVtRar53iIZhLNvNxpW3AbhCpl4pXBD8S4nzgfgWuXZ4YEV59lJRnkfv16rUM
 MsLfK0r1tHfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="205938084"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="205938084"
IronPort-SDR: bgA17OzRQcppSLiy27xALfUYr7jCA7mEYJf8nMtjcL7xvH8n1ZV2RtZ7aw+lSVs90mFTw1TU2R
 FBq4aIhoVBRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="382882638"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNxKvc/9TE396I0IM28K4ECYRvx4TiEEBx/LUDm1OZHw7hbn6LceCWem09tii02XGmusc1p+daLUFn0HZcT2nsbjd2Imo7U0eaqCmZ7mR12cruqzKx04TzfT/oHmc68q2wIkdKh09ZFaRLzywlbT4+QS5Cwno+qxOu9sQavOv9V5SoEbbyGCIRe1Xyv1KEXSaepR8pAP2nnBbpl6DWlCunj4FwaiiCZYw9iN9WLSAXnQ+PGRqMrRebJQk5WW0kRWHxnbfY144jIys7O8UKHAekKHZ0gSc+vdtZV3uD5I8xuRrsmqYd294GSHrTyuj7U9mtKgrU3Cw0pr1KejBQ8cSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aILytKuA4trhDczi4N5AjWd4nrddsCiPITIvjPKRfNQ=;
 b=FckQgO1nMYKBWorMGEfJRSDPJMRVGfjxV+jMmAO1THwW9Bxu0Wf5/62VDCWiZVO3J+d9gJ9GaQ6SSuSghKUzemchDmR6LetNe7WGznkMEY8kyLEVAi5zu3+au3PxpPqhwgA64GPr9KQWFchqB32rCHco8pXlRArIoI6RTpVYrfk/nmKXR4d9B8QrvD4M94+K7bP+MvvNxZFwpG41Q4TiYAqmqRvtRYKSDFcGhl4fnhw6tS9RDW8YWE9gZZyqqX9yK9l/ifxxrt0dW3z8LAK5J6kVNpK4W5pewLWHWvr6CjpRd4JRvK7BEU0IprPBPPfECmPcf8xtVcX5Q6Q3cyJ3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aILytKuA4trhDczi4N5AjWd4nrddsCiPITIvjPKRfNQ=;
 b=U1jSm76XNSGN4SrdLT1WrYVbsTnlSK8Ix3zvr9C7xzUoPobfdRS+L5csmZifenYfkrb0xLLv9g+IQH41KF4DuND4zm54ajQ75rYHwu2Cj8tZr72kz+NhB0YNzlTvMjpL0pQ9rFprrw1D8MnX8MiUMlFKZbg574DUt/Y2WcRyEso=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "hongyxia@amazon.co.uk" <hongyxia@amazon.co.uk>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>, Jan Beulich
	<jbeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: RE: [PATCH for-4.15 v5 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
Thread-Topic: [PATCH for-4.15 v5 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
Thread-Index: AQHXDC4avJrRD3TJLUOJC7HwMM6WPqpubplg
Date: Mon, 1 Mar 2021 02:52:35 +0000
Message-ID: <MWHPR11MB188687FACAAD8910B5DCC4CA8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210226105640.12037-1-julien@xen.org>
 <20210226105640.12037-3-julien@xen.org>
In-Reply-To: <20210226105640.12037-3-julien@xen.org>
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
x-ms-office365-filtering-correlation-id: c835b1fa-ce4a-4780-84d4-08d8dc5d11c0
x-ms-traffictypediagnostic: MWHPR1101MB2224:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB2224A92089B34F86B5840C9E8C9A9@MWHPR1101MB2224.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0UMGl0tm86S61QIYXX0oq7SK945e147LZPXLNA+qxMlBRNEQ9+NmB4p9E2mWSA7Z3EwDf+og05PLbj5Xk8pxLnojGl/aIEnGl2DnFjtryxxPk75BhVdgAjjV6kiuXkT+iD3gtnoDGMRTOTyaW/8jVXCXHRQZKt9LNFS1IdyXtQ7TZkISRv/SaGOKw8lxMKjXUBMT2rq+buEDmVFCLmXpnb878sVYfiMwNNmSg+40qlnh/xHdF6VbrBNMXaydpS6+WuCMn3sw/1fEMCcBgnVa2DaoX1HOWvGXWfJwkUH5JUoWAOCG55GhmoHheYC/m0FfHHSkse5xMVvMqjingmslkzhn0SENsReqwLdg26/YNme8wdK8Tm5sa6wHW5Arf1wEvQ4eO+yGPFpcRnvkn3XB1xpd13mfneJsMcQlNNwlzldCEaH3foXLdKgHbCMpdKW6hKrp/XsUUmHqhHmB/scbd3L09kO8c62ZdaTIWJazO5uyn/0BJVHwbEYVi0qxLuiZKbXBAdqaqAfI42ms6zJsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(39860400002)(376002)(366004)(110136005)(54906003)(4326008)(7696005)(86362001)(478600001)(316002)(6506007)(66556008)(66946007)(2906002)(64756008)(66446008)(76116006)(66476007)(52536014)(5660300002)(83380400001)(186003)(33656002)(26005)(71200400001)(8936002)(8676002)(55016002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wdQ3022aojlsjnEcQjKo7ZBWd3RLCZJfeloxWWfcukBcuy775CrnH5iy/Yfs?=
 =?us-ascii?Q?X8cpKYxlGP7EDdKAJZthRvqtNuiuep+10KOyV6GSyheAeA/D8/MPCd/tITYl?=
 =?us-ascii?Q?PQtbsMKxVJQ+Dz1Zl6F+CC/x41hBlgPRJtUiGjJFPB7QnNBEF6FoSNACIN5A?=
 =?us-ascii?Q?IeUULdadvS0a4kRcxM3snXy80xUJtH/j4JMqy9SiNIohr6h284ppmlcCVsMP?=
 =?us-ascii?Q?UP76CIFnvNLaiccA7+1WQ4WH2+lOmqxXakM+VnivQ4/YFpWYJ6yya7nQ/coY?=
 =?us-ascii?Q?Xs9OZNqnwrAQ46rFNuOOd/uvZYzr6JhFHyv+fr+y4cqJRKI9fSQ1DkW/AJbA?=
 =?us-ascii?Q?Nyc82IbhNmwKD5qoId0OAjlZSlEVc7azoQsr2OVOyWI7iZL/wNBABukSODnD?=
 =?us-ascii?Q?CeQG7vY6rctruv/RYYtzHoMAYrKc5rwx+9IXsdppHJcSMeY9IDOQlutujiC1?=
 =?us-ascii?Q?lwOjzpBb0Tqlzyyc3eaEJoEzAqs8JjjGrXbN4YNDZSJajvMMfG6+kRtgooQJ?=
 =?us-ascii?Q?ku+lSeLOh2/qEu7Sgb5b8vBFIaSxY8VIKBD8FpCG+pzl2qcx/jihHX2zGs+f?=
 =?us-ascii?Q?33Hlg2mCUPW3s2nopYxWMMANHIlgfE5TQsOiK4kDCoaJzMYFz4H9F5W7nrO/?=
 =?us-ascii?Q?E+IOhdi52kTo5ZQ/6JUoaVXjE1Jxr1U8BWsSQuAGxEcVMM2fX8mTMqPYSPqn?=
 =?us-ascii?Q?HVK03AKBxbNY0ZOmjzfyZFWG5Hvtj/pdwOiJP//PYLAuheqJXzg27DZ3gUTM?=
 =?us-ascii?Q?UQRgpseZzbfQOksFD+78yDHV8+4EjbNo47Nn4Kqvus1TYBKN+ArLKgTWe6Ys?=
 =?us-ascii?Q?UHwmoCMAFiqKlfvgpRlgQgDj4MLZVqsmikrCCvolswIcl3o2npRVGRVyIljT?=
 =?us-ascii?Q?dBktgeRYF8U3aI6A/bKPjdYOIsdzGWfeKscJPqDsevvLUkNtvv75WM8dS0og?=
 =?us-ascii?Q?cLa3QJzOB/dfc50rXKOnRDJvaUVw5sPKozhccWXtRJSQRuqgiBTvPvGrpo19?=
 =?us-ascii?Q?/qPQ62iEdaXejahFEeXbO831WwK142RfZVXWMupct3e8vTJV28UJ/Vp23vMI?=
 =?us-ascii?Q?tPelOELJSMEtA+05WSlcxYkVET8jM3ZYkRun4k9HIQZsjpIfby4ttoxQLZ9h?=
 =?us-ascii?Q?xVjb5prdZfJGxfULZOzGI34nf0dNMi/J8glsqW4U9XiJctYOGsY/iMhG3YUz?=
 =?us-ascii?Q?i2vDA4YCWJF0/UQPfk3IKhBD8QQ3BXxuH3cHg5RsP6EMKJnBmf++lRs3IMlJ?=
 =?us-ascii?Q?u0b9MxTx/pV3XUDvY/F2gZUX4aFXH1GA8NezJwBpPgFn2Jf7s4vOgyUPhGZJ?=
 =?us-ascii?Q?4FieGV9rwBCX76M2R75rafIB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c835b1fa-ce4a-4780-84d4-08d8dc5d11c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 02:52:35.9804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8SNATN64n4ZAi7EgPjgIm3h1lUG1mXFOapouCoATPnoJenRBP7twms5ylPedEEJFlM1NA/mbHBjWLU80/8XtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2224
X-OriginatorOrg: intel.com

> From: Julien Grall <julien@xen.org>
> Sent: Friday, February 26, 2021 6:57 PM
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The new x86 IOMMU page-tables allocator will release the pages when
> relinquishing the domain resources. However, this is not sufficient
> when the domain is dying because nothing prevents page-table to be
> allocated.
>=20
> As the domain is dying, it is not necessary to continue to modify the
> IOMMU page-tables as they are going to be destroyed soon.
>=20
> At the moment, page-table allocates will only happen when iommu_map().
> So after this change there will be no more page-table allocation
> happening because we don't use superpage mappings yet when not sharing
> page tables.
>=20
> In order to observe d->is_dying correctly, we need to rely on per-arch
> locking, so the check to ignore IOMMU mapping is added on the per-driver
> map_page() callback.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

>=20
> ---
>=20
> As discussed in v3, this is only covering 4.15. We can discuss
> post-4.15 how to catch page-table allocations if another caller (e.g.
> iommu_unmap() if we ever decide to support superpages) start to use the
> page-table allocator.
>=20
> Changes in v5:
>     - Clarify in the commit message why fixing iommu_map() is enough
>     - Split "if ( !is_iommu_enabled(d) )"  in a separate patch
>     - Update the comment on top of the spin_barrier()
>=20
> Changes in v4:
>     - Move the patch to the top of the queue
>     - Reword the commit message
>=20
> Changes in v3:
>     - Patch added. This is a replacement of "xen/iommu: iommu_map: Don't
>     crash the domain if it is dying"
> ---
>  xen/drivers/passthrough/amd/iommu_map.c | 12 ++++++++++++
>  xen/drivers/passthrough/vtd/iommu.c     | 12 ++++++++++++
>  xen/drivers/passthrough/x86/iommu.c     |  3 +++
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c
> b/xen/drivers/passthrough/amd/iommu_map.c
> index d3a8b1aec766..560af54b765b 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -285,6 +285,18 @@ int amd_iommu_map_page(struct domain *d, dfn_t
> dfn, mfn_t mfn,
>=20
>      spin_lock(&hd->arch.mapping_lock);
>=20
> +    /*
> +     * IOMMU mapping request can be safely ignored when the domain is
> dying.
> +     *
> +     * hd->arch.mapping_lock guarantees that d->is_dying will be observe=
d
> +     * before any page tables are freed (see iommu_free_pgtables()).
> +     */
> +    if ( d->is_dying )
> +    {
> +        spin_unlock(&hd->arch.mapping_lock);
> +        return 0;
> +    }
> +
>      rc =3D amd_iommu_alloc_root(d);
>      if ( rc )
>      {
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index d136fe36883b..b549a71530d5 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1762,6 +1762,18 @@ static int __must_check
> intel_iommu_map_page(struct domain *d, dfn_t dfn,
>=20
>      spin_lock(&hd->arch.mapping_lock);
>=20
> +    /*
> +     * IOMMU mapping request can be safely ignored when the domain is
> dying.
> +     *
> +     * hd->arch.mapping_lock guarantees that d->is_dying will be observe=
d
> +     * before any page tables are freed (see iommu_free_pgtables())
> +     */
> +    if ( d->is_dying )
> +    {
> +        spin_unlock(&hd->arch.mapping_lock);
> +        return 0;
> +    }
> +
>      pg_maddr =3D addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1);
>      if ( !pg_maddr )
>      {
> diff --git a/xen/drivers/passthrough/x86/iommu.c
> b/xen/drivers/passthrough/x86/iommu.c
> index 58a330e82247..ad19b7dd461c 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -270,6 +270,9 @@ int iommu_free_pgtables(struct domain *d)
>      if ( !is_iommu_enabled(d) )
>          return 0;
>=20
> +    /* After this barrier, no new IOMMU mappings can be inserted. */
> +    spin_barrier(&hd->arch.mapping_lock);
> +
>      while ( (pg =3D page_list_remove_head(&hd->arch.pgtables.list)) )
>      {
>          free_domheap_page(pg);
> --
> 2.17.1


