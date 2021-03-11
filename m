Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE61336A37
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 03:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96326.182123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKBFz-0008Da-WF; Thu, 11 Mar 2021 02:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96326.182123; Thu, 11 Mar 2021 02:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKBFz-0008D8-PB; Thu, 11 Mar 2021 02:40:59 +0000
Received: by outflank-mailman (input) for mailman id 96326;
 Thu, 11 Mar 2021 02:40:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rwq=IJ=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lKBFy-0008D3-Ta
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 02:40:59 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1192f5cd-4e1e-4515-8508-e3e606c46966;
 Thu, 11 Mar 2021 02:40:56 +0000 (UTC)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 18:40:54 -0800
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2021 18:40:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 18:40:54 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 18:40:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 10 Mar 2021 18:40:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 10 Mar 2021 18:40:53 -0800
Received: from BN6PR11MB1875.namprd11.prod.outlook.com (2603:10b6:404:104::11)
 by BN6PR11MB1876.namprd11.prod.outlook.com (2603:10b6:404:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 02:40:52 +0000
Received: from BN6PR11MB1875.namprd11.prod.outlook.com
 ([fe80::90ec:1b70:5912:9849]) by BN6PR11MB1875.namprd11.prod.outlook.com
 ([fe80::90ec:1b70:5912:9849%4]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 02:40:52 +0000
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
X-Inumbo-ID: 1192f5cd-4e1e-4515-8508-e3e606c46966
IronPort-SDR: vw1POjGvmW8LpC93zxO67us6CGhtSdnfoSgyTDj6TjBS089gEDTCNhYv8yN9Hos0DE4fmJ1I87
 92QWkQaLG4/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="175708783"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="175708783"
IronPort-SDR: ylBhABGwZSI6FBfpgwEN5zrGchEdqpV07EAR+ZZqTA2w//ojiQq5l0pM2pI2pKIh6LU4NQ/vXJ
 +RJRyViz1sWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="372179054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5+QAv48N3ynlHXLoSuVrWcm+lAQYkk/ASHoLWmL/nusAyVgiZdmKrFyI2nNhtq7ZTDM6IGfAu++xaIyMYPDj2wInomxVaIzoYirLfRAn7SBbpU/F8cgPbuiHcUA/nFhCAfC+70bxiLXYS+L5O8e6sHmSRQFLOKyPtsNMR2mZb1xGHLV1PW/1xeWPnl9lfN/diW8men/2Rom5Ris6N6nqxU5lW2X0C1UJ4aYLJYkyA7EdVx+PG+CwQzYL6dE59PaArGztcoJFPnW9OWULyjQnftro2chyBf8/nrqW/BitIMudZkSa+ZyTrgpkeDzMyWDpp3Y8KChkKywuLUmEgKlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4iXIGfX03N97NoGYLbSJLmjOCG1peSV2LSXtX6XFfw=;
 b=fU8YW6eSzFjjAILJLWDgBQHy2uNYNZ/GQZmVf+XJAUlehmgLG+9yIFFsMJ8qwLlZRQ+Eu4MnCGUi5BoRDC5WxOwgkw+148RI1/qbtLk2jZBR7W1w1Wv3yPgION5UG2FwNn541vWdAsGQED8lgQ6iOL4SpykPKLWRlDJ9bExgfL8gPNdskEnIjHr0m6tOCX3/7PxE5pnF+DRv6wNLwC4zVZWlDlq4UPh9a6nIAWbTw5OYCDKbqAjswqt8b7A4n1a73PptCCKtCgPQqAVWdxS48cUCqbYfyMrZsV1R5w0BJXxkIAuEui6iKLnP2I0LOCqM4sSsz3R7M60blzMiVtzsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4iXIGfX03N97NoGYLbSJLmjOCG1peSV2LSXtX6XFfw=;
 b=MWNf0fOhurrtDKiVEbE2XHkL/B8eTnD7LKsFnXxg50pyV+awxLQa28mULX1RZ/guAXH0erN7j2rW7tNWRJ3wXeT0XPa5GqsHPSrAr86SSPbuqnH0sfSVVSen8fTFGX6AacvnQRpULWFsxdQQLN2VyaiOrvV/9QmSd3SxqUGbSXA=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH for-4.15] vtd: make sure QI/IR are disabled before
 initialisation
Thread-Topic: [PATCH for-4.15] vtd: make sure QI/IR are disabled before
 initialisation
Thread-Index: AQHXE+l+DcjZa4vV7kWyWy/YUMLF56p+F/Gw
Date: Thu, 11 Mar 2021 02:40:52 +0000
Message-ID: <BN6PR11MB1875FB780952497EABD38B538C909@BN6PR11MB1875.namprd11.prod.outlook.com>
References: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3100a907-5479-497e-9077-08d8e4371657
x-ms-traffictypediagnostic: BN6PR11MB1876:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB1876F7C33CFAB9F88BCF2D318C909@BN6PR11MB1876.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S9R6DeMGLAvwn1zlAyE83F9c+GrYSMhJ8gGn/spuw0gHZTTJFz3KrdymQgJ4Ne4GPaaPLu7uvosUo8Z6u8OYH2F7h7jrPqlcL8pDrwbRru9r0krF5N3hJY3cQJVw+o4MPfBkTGO6HHpXMXYT6A8tCEeMoh6mUz4U+bIkpIIVMvOplgpa1sPsP5LgAx4U6z3CTL4b//MNVM9Po4cslagcfrYzKSkpYu+VqPMAUpSVP/aztNE61IlXmm+Xo7Myr/JFVXf+aLOoVu4/R2v3Vz/tPno1JkfkV1kfgNpxJGvZlvXJNP3KmwTtPl4WxZvr0+jyk0bp5AoJrBnNTs7fPKxfCMyprNDxfG4oM/DADQerFYJnVUQSJEiOGj57bW9juiGHj5DLSnXUgHr2Jw6n94Bp8APbRb+9XcKiGpyuVOdC38qIDW7yci0jRQiiaIIjky06LVBMgtbbcnCR3Spn3GVSgY8n1WmTMJIAB9QK6MKhH850jOs/K7SZzYaDhgcj3lpPQFWGYtyNAlCgFuOzaUO9Iw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(346002)(39860400002)(376002)(54906003)(33656002)(9686003)(8676002)(4326008)(2906002)(86362001)(26005)(83380400001)(5660300002)(55016002)(316002)(66446008)(66946007)(8936002)(64756008)(66556008)(76116006)(186003)(66476007)(6506007)(52536014)(110136005)(7696005)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ONmk5lNZ+uo7qA2znfqxP/9GmhVcUK1IHpdFt1Tm1JPyFXSx5zIDUqqyAXn+?=
 =?us-ascii?Q?qAqrVxTCE5uJhIyKUjXmIONwzp/ZE4b0V9oOcWrgFBwSPcvBjTFUBcLKIG/x?=
 =?us-ascii?Q?bkveG/6WsFLRA2rffmm4wwWyoB17hdLxBEn+szShXSIbwRdLd8m235RM69Qm?=
 =?us-ascii?Q?kSAafkdhSu+4fqGk1selpjcHKTg59T93uFOPdHbn2U7HB/n92up+rfik9tbW?=
 =?us-ascii?Q?bbi8s9H40TQ12wZGdSU5CWi09RkL0VX/TtZTHNAZPOeAxaPTzddm7KyIgnH8?=
 =?us-ascii?Q?Gl/HH2zhgP80Ko3XQQDVW5kumCJwk0JXkVBGORkxNIH75KO6ovR/zwYcPKEC?=
 =?us-ascii?Q?NzF2aJYjBLfV618zcLmD5/9aCV7CZHwDu8PZ9atKpPALzsqOVBjlRc2a+7Pj?=
 =?us-ascii?Q?CPU0AjbtCpZnMrmqhkMSg6LdWIjgGDsyGLqLeFG3Td0W46YbiPp+vYfmU0hD?=
 =?us-ascii?Q?ozAgtVa4wUO6P2jCv7BmyhT/uoKsFtyF77ILlt6m2pAQy8Wwsz5MNixo/bhb?=
 =?us-ascii?Q?QbynVVHb7Yx3iYxg1L32jKqf7lMFrGs+x2Arwe2r8nYrRVN4rpZokymWg/jr?=
 =?us-ascii?Q?MaCbDj4wOTj/Hq8MiONQxkan9QgBPBXw5h9RqkSB2akTfzFJTnUgKTT0f167?=
 =?us-ascii?Q?f4du6j+Zjel3adp7j511lFd8+kL4FFEO2eWZVrykVqHWX2hZXvc3/dD7kxPX?=
 =?us-ascii?Q?v2+PdomeGD8DFnzCT08Re/UQC58MyarH4pLH/OzdnUynfXZi3Q6GDjI8OJYJ?=
 =?us-ascii?Q?6yDLruuMOlsr7zJDzvGGHXegQ0gWh5rc2/URV6Fr9rFPjHW5vX1atD4wbLmX?=
 =?us-ascii?Q?scEaYFAx3u0Rs4bQ7+5XAzp11DXwL8I7PBW1eNk+sZM1MYWjFNx6ZfMyrONL?=
 =?us-ascii?Q?/wRgbw8GCFVprGJxeX7JT/nbStD9n2XDiRl44kFiwupNuLwOxzqCB70/kfMB?=
 =?us-ascii?Q?yi0Ofwn1d2xaRzpUJ2VUKyj40xFIcxbjNrSyRIkBYQUqSiMqJanuPktbIann?=
 =?us-ascii?Q?corouGVUSG4dWp8JQqGwYbSXxto5CssH/ZnFPqh5SrgT0Z+v3mtdOLDuFCnO?=
 =?us-ascii?Q?oBwFG4Eqh4GLAk57Hm00gclDptAoCbz+4KBeVwG5yjID4Y9ReEdpiAAS69cD?=
 =?us-ascii?Q?zMjfcG8JmxW54mDaOjdm7dttjtOFZ+5sTrlDdV+AEbL5OcGnqLmjMj2oFFJz?=
 =?us-ascii?Q?DxXoYBg9mT2RsTCo+bA2fEFfnHfyKPuQVxP+s0rEQPYazJlNn695dH8l040L?=
 =?us-ascii?Q?yM85VFCa2FKM4yREgzt4UiObKZlssuRXd5bzYKZ5V5A8qxjD8ZUwqMahb8R/?=
 =?us-ascii?Q?UDBEW3gG1KAS2mWjHCxCadIY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3100a907-5479-497e-9077-08d8e4371657
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 02:40:52.1127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: icJxJaWwkgAaYlXUicVQ7DEICrnL8gnMTgpNs9124N4vamgmXF8NKg7YyIMaGmELAEMd+pj9ZOOVe8krhlFtTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1876
X-OriginatorOrg: intel.com

> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: Monday, March 8, 2021 3:00 PM
>=20
> BIOS might pass control to Xen leaving QI and/or IR in enabled and/or
> partially configured state. In case of x2APIC code path where EIM is
> enabled early in boot - those are correctly disabled by Xen before any
> attempt to configure. But for xAPIC that step is missing which was
> proven to cause QI initialization failures on some ICX based platforms
> where QI is left pre-enabled and partially configured by BIOS.
>=20
> Unify the behaviour between x2APIC and xAPIC code paths keeping that in
> line with what Linux does.
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  xen/arch/x86/apic.c                 |  2 +-
>  xen/drivers/passthrough/vtd/iommu.c | 12 +++++++++++-
>  xen/include/asm-x86/apic.h          |  1 +
>  3 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
> index 7497ddb..8ab8214 100644
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -47,7 +47,7 @@ static bool __read_mostly tdt_enabled;
>  static bool __initdata tdt_enable =3D true;
>  boolean_param("tdt", tdt_enable);
>=20
> -static bool __read_mostly iommu_x2apic_enabled;
> +bool __read_mostly iommu_x2apic_enabled;
>=20
>  static struct {
>      int active;
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index d136fe3..4aa7a31 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2080,7 +2080,7 @@ static int __must_check init_vtd_hw(void)
>      u32 sts;
>=20
>      /*
> -     * Basic VT-d HW init: set VT-d interrupt, clear VT-d faults.
> +     * Basic VT-d HW init: set VT-d interrupt, clear VT-d faults, etc.
>       */
>      for_each_drhd_unit ( drhd )
>      {
> @@ -2090,6 +2090,16 @@ static int __must_check init_vtd_hw(void)
>=20
>          clear_fault_bits(iommu);
>=20
> +        /*
> +         * Disable interrupt remapping and queued invalidation if
> +         * already enabled by BIOS in case we've not initialized it yet.
> +         */
> +        if ( !iommu_x2apic_enabled )
> +        {
> +            disable_intremap(iommu);
> +            disable_qinval(iommu);
> +        }
> +
>          spin_lock_irqsave(&iommu->register_lock, flags);
>          sts =3D dmar_readl(iommu->reg, DMAR_FECTL_REG);
>          sts &=3D ~DMA_FECTL_IM;
> diff --git a/xen/include/asm-x86/apic.h b/xen/include/asm-x86/apic.h
> index 8ddb896..2fe54bb 100644
> --- a/xen/include/asm-x86/apic.h
> +++ b/xen/include/asm-x86/apic.h
> @@ -24,6 +24,7 @@ enum apic_mode {
>      APIC_MODE_X2APIC    /* x2APIC mode - common for large MP machines
> */
>  };
>=20
> +extern bool iommu_x2apic_enabled;
>  extern u8 apic_verbosity;
>  extern bool directed_eoi_enabled;
>=20
> --
> 2.7.4


