Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22752C7D25
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 04:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40640.73552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjZab-0008MX-7Q; Mon, 30 Nov 2020 03:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40640.73552; Mon, 30 Nov 2020 03:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjZab-0008M8-4K; Mon, 30 Nov 2020 03:10:57 +0000
Received: by outflank-mailman (input) for mailman id 40640;
 Mon, 30 Nov 2020 03:10:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+J0=FE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kjZaZ-0008M3-AE
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 03:10:55 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cc251ae-1d71-4b8a-bf78-78b97bf8fd91;
 Mon, 30 Nov 2020 03:10:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 19:10:50 -0800
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2020 19:10:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 19:10:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 29 Nov 2020 19:10:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 29 Nov 2020 19:10:34 -0800
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 03:10:33 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 03:10:33 +0000
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
X-Inumbo-ID: 6cc251ae-1d71-4b8a-bf78-78b97bf8fd91
IronPort-SDR: k2AObQjIeTRb/BAFQd9ctPsElNBPse6qkVX1+3UQq/rys8O/GiJNdVYznFnwZf2XkyTDwd9bzR
 YXoe6ZbgsKsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="172675774"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="172675774"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
IronPort-SDR: MOmYRUgNlTdV+DtfnCOZaqzCA7+gM7SMMG4mDQZFqDG/KVPmLpj5jjajAxZu3sUbSL1WX/hUoC
 FyO2YKXjadUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="366950873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjhOVFmAHRpJMZcGyYvT74eVMFnbLxXxF8ZCyYDYzMXQdYYyyPtTRSLams5iRb2EoM9vlZdi8WFdtBqFdj8PH+jmrUMqfEV/Rm1fznGoXb2as+REXfqd6vQz5SSBN0RiattX5EsYr9Sp37coZ7WX9xF9EYR7qpAZZD2IMilR6SsljemgoCFnSQEfA5ourlF6Zo1EaSLsa9ljkBRjt1lzCLAAcDnxodtd5LZ/dx7WSxs4tlGQqQr1uzPCd2fTOJLy4diQMI7vnjwzzdQifC0wMnrMcgiswjV8k7TyDLVgeOc6zHjwZjWFCl40JmChepUTMtzWAV9BDoK5vqdmanj9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X/vZqpv07GZ/6Qj2tD8PpokEI2VUZ1i12TylnoiR70=;
 b=kuCQeipLti0kTNrxIPLwGr5pQAspq9b5ANF/gl+MZ+DIfxN+TFDfK5rIcwQrkTKX0tQQojysHKf7eYYpAAVnPMDj+K1nCz6mYrIL3ImxmetAsjbwx8REST7wD7wHzVA1wiq8oDJqUEusK3U5gfOJPVegVk2bcLMsmfF0RVIQNEPeBFEACJLa/RpEASQhyuVsJmdijCKiP1Ya4rKstUvdHXku0nWh2SMqhIYTFdm1rABfEUzJXXpkTZK7dmaDO7rDLhiemUvf45Fl1XBOVTiEUi5Fx6srsASzsBiThiWpMQcyorpa6Lo/+vlSru6gINMSG8SSbJ/Y14NessqytO/55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X/vZqpv07GZ/6Qj2tD8PpokEI2VUZ1i12TylnoiR70=;
 b=NIcTH4r0qV0odm6HivvG+MOU28UnwNWtqUDhbpLpqS13HHFQyjYPS04alUiBfOHSj6mnKetkdGyGCNVnmwHAKXYLF3Rgpu8gZfTrbQOBuxV9PI+an5XsuILfZICrXIgKQTtm79AwjHkwTCU52vUjvYmVZ0bxQ0t6t9mP//DKh/Q=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>
Subject: RE: [PATCH v10 6/7] vtd: use a bit field for context_entry
Thread-Topic: [PATCH v10 6/7] vtd: use a bit field for context_entry
Thread-Index: AQHWv0CO1PZZYlXYt0GC2y4nZ5YxkKngDZkw
Date: Mon, 30 Nov 2020 03:10:33 +0000
Message-ID: <MWHPR11MB16457F22A1940E866803819D8CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-7-paul@xen.org>
In-Reply-To: <20201120132440.1141-7-paul@xen.org>
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
x-ms-office365-filtering-correlation-id: fe57ec27-b2b2-4d1b-1621-08d894dd8079
x-ms-traffictypediagnostic: MW3PR11MB4569:
x-microsoft-antispam-prvs: <MW3PR11MB4569F88A51EE3BF2AD4CAE148CF50@MW3PR11MB4569.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mtn75AaV4orWtomuUbC3PxGazP2OHYBzjmGrLYFXrmb/gJ989RWV1Ib1xbCz2+Ej4FvOgVqhMjAMf7Yb9tvuUIIcQ16wQtIqCALDwSkq78xKXKihxmye36kcn9UaFxdBnJUGSeOZJSUy1+XcZgn5WXA9SkWGJ2EoCeq72Ut0rFmMia5+TuUTGfCyKMRJQZZjG7NfW6n4t3fSFfvcOZ1opXRKx6WyFVNDIAhMNOUz+t9OHQq12kAqhkYFty0s9mMP0lE69DLrC1+ImXwueYTPZeHdMJKRo97MTngWurX2NpfZcRFyygy+/evZ8m0UGvwEWrsxb1LNAnQ9Nl6cWoOaiQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(55016002)(110136005)(26005)(9686003)(316002)(186003)(71200400001)(86362001)(6506007)(7696005)(4326008)(66446008)(66476007)(66556008)(64756008)(8936002)(5660300002)(66946007)(52536014)(33656002)(83380400001)(2906002)(478600001)(76116006)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+RH9PAEywEPO5YOX27Y288/91tRhGsDcEWBLTT/7PQHVjmWP5kakM4ESpAFT?=
 =?us-ascii?Q?lErvmjoCUxRnSP3P9cbjiVWG447ZSiIOGI7FdJvY/xqyczMocxMAo2Fuxb0P?=
 =?us-ascii?Q?uR9QLSzmqyaAQswjPoSkrvBk8wjOjXpVL92Fb8FgeE906bKR9yrg8zWTHUYo?=
 =?us-ascii?Q?KYidokJNZfuyFcYPWWROiIjqd6Ly0qn8xhzdzHbIxRewX44lKb6hfyZHgi7J?=
 =?us-ascii?Q?rmhA5WklRzaLfyx7ov0E8VVAiDe5vjF0gqtTqcBlXxUOKwldyiPrRAkCYgPA?=
 =?us-ascii?Q?jzKSw+LjuE0kU42MhgBDbtGtruwehlsUtCWSocDx/sK9rMGyjXDtn+idUthT?=
 =?us-ascii?Q?pTHcXh5oiR0uzRkkBrVwYfsxmUxews8B3JWTPsA1VqK6aLHg3kNSqByD9U4Z?=
 =?us-ascii?Q?rVmPrB2radDZT5ClWZp5Jij31kAWLvGILrX6k/TUOqP4ZVq1oFD26bE23lEc?=
 =?us-ascii?Q?+6EIqL1pgrbcL/zIcYQNtxcC3+3HSndEdQ26LWJ4ivYg/0L72C0ocgPRrBsR?=
 =?us-ascii?Q?SP5UycbFlqMOtbRTp3/f2IBx8SAEGq0derVZvRn12EP9NafA7qXfUxIBiMQ2?=
 =?us-ascii?Q?i3mYW0OmzthVI2xIOjQlbaZBvn3bnZxQb4fOvOa7oWfIORYZbitR16grtyXs?=
 =?us-ascii?Q?gvx0p5H3mtIM4Cc9X1cgkd5FM5nqkN/kmnEcoVokXWd+SlZJ1MsNRS3TsnPv?=
 =?us-ascii?Q?5YApFwdYwLOq+CZIMnDjIaRMEg1T4MONwovbmp1tppNiUeOqZr+R5DvK01jI?=
 =?us-ascii?Q?0+9I7P0fL1CJ4n9+8Ek4lQbTramUJFkFdyEYjsA951K6uD0olhBce2jPUTR7?=
 =?us-ascii?Q?jObv8habjJ5iPkflwqGAO5+Zwk1U8+WlTc+FBJk6MN7N30//ryMFxyRAv77u?=
 =?us-ascii?Q?RKoxIq2cag2wmRe/dv/lQtn9zuTiYyjFwWlKzUtV96Zm9QlayUyh8xdHjhSl?=
 =?us-ascii?Q?g9NjD3i4SM/ljZGqBgKEp+rx+DKaKsAeIKFFWxjqHnw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe57ec27-b2b2-4d1b-1621-08d894dd8079
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 03:10:33.6647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bywwW1H+XfyRle6FqbwOgSh6FDpKJ4mul+v4P0Gb3YrXI7TuwiJAdSOMe9rVW32jLLnsWuDurj7b6qI7EeT68A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-OriginatorOrg: intel.com

> From: Paul Durrant <paul@xen.org>
> Sent: Friday, November 20, 2020 9:25 PM
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> This removes the need for much shifting, masking and several magic
> numbers.
> On the whole it makes the code quite a bit more readable.
>=20
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
> Cc: Kevin Tian <kevin.tian@intel.com>
>=20
> v10:
>  - Remove macros in favour of direct field access
>  - Adjust field types
>  - Add missing barriers
>=20
> v4:
>  - New in v4
> ---
>  xen/drivers/passthrough/vtd/iommu.c   | 36 +++++++++++----------
>  xen/drivers/passthrough/vtd/iommu.h   | 45 +++++++++++++--------------
>  xen/drivers/passthrough/vtd/utils.c   | 10 +++---
>  xen/drivers/passthrough/vtd/x86/ats.c |  6 ++--
>  4 files changed, 47 insertions(+), 50 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index 1a038541f0a3..fdb472ad6515 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -86,8 +86,6 @@ static int domain_iommu_domid(struct domain *d,
>      return -1;
>  }
>=20
> -#define DID_FIELD_WIDTH 16
> -#define DID_HIGH_OFFSET 8
>  static int context_set_domain_id(struct context_entry *context,
>                                   struct domain *d,
>                                   struct vtd_iommu *iommu)
> @@ -121,21 +119,22 @@ static int context_set_domain_id(struct
> context_entry *context,
>      }
>=20
>      set_bit(i, iommu->domid_bitmap);
> -    context->hi |=3D (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFS=
ET;
> +    context->did =3D i;
> +
>      return 0;
>  }
>=20
>  static int context_get_domain_id(struct context_entry *context,
>                                   struct vtd_iommu *iommu)
>  {
> -    unsigned long dom_index, nr_dom;
>      int domid =3D -1;
>=20
>      if (iommu && context)
>      {
> -        nr_dom =3D cap_ndoms(iommu->cap);
> +        unsigned long dom_index, nr_dom;
>=20
> -        dom_index =3D context_domain_id(*context);
> +        nr_dom =3D cap_ndoms(iommu->cap);
> +        dom_index =3D context->did;
>=20
>          if ( dom_index < nr_dom && iommu->domid_map )
>              domid =3D iommu->domid_map[dom_index];
> @@ -1338,7 +1337,7 @@ int domain_context_mapping_one(
>      context_entries =3D (struct context_entry *)map_vtd_domain_page(madd=
r);
>      context =3D &context_entries[devfn];
>=20
> -    if ( context_present(*context) )
> +    if ( context->p )
>      {
>          int res =3D 0;
>=20
> @@ -1382,7 +1381,7 @@ int domain_context_mapping_one(
>=20
>      if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
>      {
> -        context_set_translation_type(*context, CONTEXT_TT_PASS_THRU);
> +        context->tt =3D CONTEXT_TT_PASS_THRU;
>      }
>      else
>      {
> @@ -1397,11 +1396,11 @@ int domain_context_mapping_one(
>              return -ENOMEM;
>          }
>=20
> -        context_set_address_root(*context, pgd_maddr);
> +        context->slptptr =3D paddr_to_pfn(pgd_maddr);
>          if ( ats_enabled && ecap_dev_iotlb(iommu->ecap) )
> -            context_set_translation_type(*context, CONTEXT_TT_DEV_IOTLB)=
;
> +            context->tt =3D CONTEXT_TT_DEV_IOTLB;
>          else
> -            context_set_translation_type(*context, CONTEXT_TT_MULTI_LEVE=
L);
> +            context->tt =3D CONTEXT_TT_MULTI_LEVEL;
>=20
>          spin_unlock(&hd->arch.mapping_lock);
>      }
> @@ -1413,9 +1412,10 @@ int domain_context_mapping_one(
>          return -EFAULT;
>      }
>=20
> -    context_set_address_width(*context, level_to_agaw(iommu-
> >nr_pt_levels));
> -    context_set_fault_enable(*context);
> -    context_set_present(*context);
> +    context->aw =3D level_to_agaw(iommu->nr_pt_levels);
> +    context->fpd =3D false;
> +    smp_wmb();
> +    context->p =3D true;
>      iommu_sync_cache(context, sizeof(struct context_entry));
>      spin_unlock(&iommu->lock);
>=20
> @@ -1567,17 +1567,19 @@ int domain_context_unmap_one(
>      context_entries =3D (struct context_entry *)map_vtd_domain_page(madd=
r);
>      context =3D &context_entries[devfn];
>=20
> -    if ( !context_present(*context) )
> +    if ( !context->p )
>      {
>          spin_unlock(&iommu->lock);
>          unmap_vtd_domain_page(context_entries);
>          return 0;
>      }
>=20
> -    context_clear_present(*context);
> -    context_clear_entry(*context);
> +    context->p =3D false;
> +    smp_wmb();
>      iommu_sync_cache(context, sizeof(struct context_entry));
>=20
> +    context->val =3D 0; /* No need to sync; present bit is already clear=
ed */
> +
>      iommu_domid=3D domain_iommu_domid(domain, iommu);
>      if ( iommu_domid =3D=3D -1 )
>      {
> diff --git a/xen/drivers/passthrough/vtd/iommu.h
> b/xen/drivers/passthrough/vtd/iommu.h
> index b14628eec260..33b1abf98526 100644
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -198,37 +198,34 @@ struct root_entry {
>          };
>      };
>  };
> +#define ROOT_ENTRY_NR (PAGE_SIZE_4K / sizeof(struct root_entry))
>=20
>  struct context_entry {
> -    u64 lo;
> -    u64 hi;
> -};
> -#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
> -#define context_present(c) ((c).lo & 1)
> -#define context_fault_disable(c) (((c).lo >> 1) & 1)
> -#define context_translation_type(c) (((c).lo >> 2) & 3)
> -#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
> -#define context_address_width(c) ((c).hi &  7)
> -#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
> +    union {
> +        __uint128_t val;
> +        struct { uint64_t lo, hi; };
> +        struct {
> +            /* 0 - 63 */
> +            bool p:1;
> +            bool fpd:1;
> +            uint64_t tt:2;
>=20
> -#define context_set_present(c) do {(c).lo |=3D 1;} while(0)
> -#define context_clear_present(c) do {(c).lo &=3D ~1;} while(0)
> -#define context_set_fault_enable(c) \
> -    do {(c).lo &=3D (((u64)-1) << 2) | 1;} while(0)
> -
> -#define context_set_translation_type(c, val) do { \
> -        (c).lo &=3D (((u64)-1) << 4) | 3; \
> -        (c).lo |=3D (val & 3) << 2; \
> -    } while(0)
>  #define CONTEXT_TT_MULTI_LEVEL 0
>  #define CONTEXT_TT_DEV_IOTLB   1
>  #define CONTEXT_TT_PASS_THRU   2
>=20
> -#define context_set_address_root(c, val) \
> -    do {(c).lo &=3D 0xfff; (c).lo |=3D (val) & PAGE_MASK_4K ;} while(0)
> -#define context_set_address_width(c, val) \
> -    do {(c).hi &=3D 0xfffffff8; (c).hi |=3D (val) & 7;} while(0)
> -#define context_clear_entry(c) do {(c).lo =3D 0; (c).hi =3D 0;} while(0)
> +            unsigned int reserved0:8;
> +            uint64_t slptptr:52;
> +
> +            /* 64 - 127 */
> +            unsigned int aw:3;
> +            unsigned int ignored:4;
> +            unsigned int reserved1:1;
> +            unsigned int did:16;
> +            uint64_t reserved2:40;
> +        };
> +    };
> +};
>=20
>  /* page table handling */
>  #define LEVEL_STRIDE       (9)
> diff --git a/xen/drivers/passthrough/vtd/utils.c
> b/xen/drivers/passthrough/vtd/utils.c
> index 5f25a86a535c..4bca160bc663 100644
> --- a/xen/drivers/passthrough/vtd/utils.c
> +++ b/xen/drivers/passthrough/vtd/utils.c
> @@ -129,17 +129,17 @@ void print_vtd_entries(struct vtd_iommu *iommu,
> int bus, int devfn, u64 gmfn)
>          return;
>      }
>=20
> -    val =3D ctxt_entry[devfn].lo;
> -    printk("    context[%02x] =3D %"PRIx64"_%"PRIx64"\n",
> -           devfn, ctxt_entry[devfn].hi, val);
> -    if ( !context_present(ctxt_entry[devfn]) )
> +    printk("    context[%02x] =3D %"PRIx64"_%"PRIx64"\n", devfn,
> +           ctxt_entry[devfn].hi, ctxt_entry[devfn].lo);
> +    if ( !ctxt_entry[devfn].p )
>      {
>          unmap_vtd_domain_page(ctxt_entry);
>          printk("    ctxt_entry[%02x] not present\n", devfn);
>          return;
>      }
>=20
> -    level =3D agaw_to_level(context_address_width(ctxt_entry[devfn]));
> +    level =3D agaw_to_level(ctxt_entry[devfn].aw);
> +    val =3D pfn_to_paddr(ctxt_entry[devfn].slptptr);
>      unmap_vtd_domain_page(ctxt_entry);
>      if ( level !=3D VTD_PAGE_TABLE_LEVEL_3 &&
>           level !=3D VTD_PAGE_TABLE_LEVEL_4)
> diff --git a/xen/drivers/passthrough/vtd/x86/ats.c
> b/xen/drivers/passthrough/vtd/x86/ats.c
> index fec969ef75bb..cb057ced3cf7 100644
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -76,7 +76,6 @@ static bool device_in_domain(const struct vtd_iommu
> *iommu,
>  {
>      struct root_entry *root_entry, *root_entries;
>      struct context_entry *context_entry, *context_entries =3D NULL;
> -    unsigned int tt;
>      bool found =3D false;
>=20
>      if ( unlikely(!iommu->root_maddr) )
> @@ -92,11 +91,10 @@ static bool device_in_domain(const struct
> vtd_iommu *iommu,
>=20
>      context_entries =3D map_vtd_domain_page(root_entry->ctp);
>      context_entry =3D &context_entries[pdev->devfn];
> -    if ( context_domain_id(*context_entry) !=3D did )
> +    if ( context_entry->did !=3D did )
>          goto out;
>=20
> -    tt =3D context_translation_type(*context_entry);
> -    if ( tt !=3D CONTEXT_TT_DEV_IOTLB )
> +    if ( context_entry->tt !=3D CONTEXT_TT_DEV_IOTLB )
>          goto out;
>=20
>      found =3D true;
> --
> 2.20.1


