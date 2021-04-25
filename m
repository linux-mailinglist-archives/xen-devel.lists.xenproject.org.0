Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D736A3D6
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 03:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116952.222845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTFo-0005Pb-DY; Sun, 25 Apr 2021 01:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116952.222845; Sun, 25 Apr 2021 01:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTFo-0005P4-9h; Sun, 25 Apr 2021 01:08:08 +0000
Received: by outflank-mailman (input) for mailman id 116952;
 Sun, 25 Apr 2021 01:08:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSnA=JW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1laTFm-0005Ox-Tl
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 01:08:06 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc04f40e-0c3a-462e-88e3-f85743dbd91b;
 Sun, 25 Apr 2021 01:08:00 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2021 18:07:59 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2021 18:07:57 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 24 Apr 2021 18:07:57 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 24 Apr 2021 18:07:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sat, 24 Apr 2021 18:07:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sat, 24 Apr 2021 18:07:56 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1840.namprd11.prod.outlook.com (2603:10b6:300:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Sun, 25 Apr
 2021 01:07:55 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 01:07:54 +0000
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
X-Inumbo-ID: dc04f40e-0c3a-462e-88e3-f85743dbd91b
IronPort-SDR: Zmb0g3+2S4ZlQX3ervQ4vsbvMN9dZ1gCYdbBpqrKTp1Qz/HZTQD8g+95gzH33fplMuEPWP0mzJ
 M4dq+xsAeGyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9964"; a="196263549"
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="196263549"
IronPort-SDR: AePcSC5nwzceo1taRPFG3fApFP83A/Q6gzJIdEWFc6zWDYOdI4EN+yN8gG4oueal7Clno6B+PF
 DOK7DONtF9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="446910220"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWAnLMXNRlHnb+NcWL3zTQhM3Z/sbjjv0xkr9Fd0UgkgpoCUpt70Vmq3cD2mmyn4vB4NK/vetyWTkOnbmdVM12fAP14nl3yMj6gy0WxnpFD0RDLqA6DlzH2dsk5CX5zn6Xn8sUWq2VYbpnsyRTK5IOX1PvEZitXt2o2ShK78KERxScdgIVjI2WbN0dE7OQ08oR2ia505KpXNZHmh98KhR2BsdQ0PRvzrUHVquJgFEZyezC7yPNavJEOqmCtr9pK6bO9zkVwvfBNJacjOeWIkn8h0jlYwWrB+Vx8mt2gmGI4HVzBP3jOAP+V8HvfYcvwMyHAuIN3OAT0PuJrEVyRkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRyCHxZeb86c0G1/R7IXEyOhBEkPaNpAVBEwvRoSyno=;
 b=i2+2GhgRkx7lIDFcwwEGjwEuSQscrxpuOmFZf0sCgfbt+fDuQCBDHJMnCB+61pl+oEyrqFvNLhw2y0pwVeKvUhe6SSWO7Yu5rMTBnNSB+ISXCCXoVJm0bjj3XCC5a2JteELf6P0mKXaa0M7QSUdbWJJ1do/wRpP3uBAa+iVtMCbx9SJ2SzLLR2g5fUadpYir7XqNIwDFlkHMAy0cpT39/F2y9zrI8nDH0ELtUfRptq673I4U5gLndrviCNcA5VNPRBNQrwskLeVP04PnNQdE2hFwtEmOps1fiPW/otuvw25qvMAFRetbb7V6HRgaeAfj/9yg9Mk9Jm+lC4fZxEX1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRyCHxZeb86c0G1/R7IXEyOhBEkPaNpAVBEwvRoSyno=;
 b=fsLxKFT3IfyG1RdvCcsLGoLydom3JLQGnJ3Aemi0oUKTZX+ueIG9z5o8X83tOoI6SfYfGh6RyK5QCA1oNUIbAIwxGO3UNQf+joD9YO25lYVG7W9ueqB7FEKxNPg79z1csRQiPXqNFcldDKFQDTRWJfY6yzFbLpWiBg+/ncE0ylU=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH v5 2/2] x86/intel: insert Ice Lake-SP and Ice Lake-D model
 numbers
Thread-Topic: [PATCH v5 2/2] x86/intel: insert Ice Lake-SP and Ice Lake-D
 model numbers
Thread-Index: AQHXMd7GTVAjJC2DV0yy3tll9lVDHKrEevtQ
Date: Sun, 25 Apr 2021 01:07:54 +0000
Message-ID: <MWHPR11MB18860623069EA111BAFD94C78C439@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
 <1618481062-16094-2-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1618481062-16094-2-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ced85643-3e66-4879-6d3c-08d907868ea5
x-ms-traffictypediagnostic: MWHPR11MB1840:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB184041E9708462DD01E4D6E38C439@MWHPR11MB1840.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nJMdOoziVukTAslwa7bbGVcTnwf3Z6Rh/2ESX1f9r9jIsc9eZfUKZ0libWbzACgAh0YzQv9cNZGaJdAA/TQfPBcKQg3ucTzQvrKH7zylNen99f0W6A3f5zlp22CCGWzP893UFpM+IjzZckcLVBGBN6xG4Ic910IwDMe1PLIpcIGGkRu+nf9alwHdAFjb0ltS2/1xLkrUS6bJ7xHbyoJR+0xnZguWoqXLL53ZKl3ONtrRwhyB5rYtdIIs4wpy79F/1BSwYw9BByiFjjuGP/tFxUtnckjJLmmyOAyTeg/tMcNikt+4q5jIxdSSiII4198gKFNQisi24DNwRXB3J8bIHcuM2mmQJ+x+zYtH22PtkDTnnke2Y+SiX/dcrFBDjXD9L3GG5L0tkMftqUqTInXUpRsutHs0GuxwfCjx5hzRy8KEhvez1Vn7g2Q63t0OzzUwdE0xa3oAaimvPbX3FSdHqfwhSkxG7GlMbHo2pIFQ+k58G7JWN/AoTcJtVqLbRWbdRXZm5W/L0+jDTWkpqlun6/dLxTM7GSFEq9QlYDaIS0KbF+0zTNnQruBnSewBTqnZAe0xxczfNMmFLBhOBRp8bWHts5M/4YiDWzXePJNvBQo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(66446008)(64756008)(66946007)(86362001)(110136005)(33656002)(66476007)(66556008)(8676002)(71200400001)(5660300002)(38100700002)(4326008)(54906003)(6506007)(76116006)(26005)(55016002)(7696005)(316002)(2906002)(83380400001)(122000001)(8936002)(478600001)(52536014)(9686003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fEcKLmwQu3KXVujnEynVTS+rH7WFbGzqH2ZpVUGNTtew9tUwQg4ur32eEkay?=
 =?us-ascii?Q?+XESIOco9x8gK/AgDCY4RsLf30Qm7Nzf5M3AD2d5Y+Js8WSE1DH8i/pfAocE?=
 =?us-ascii?Q?COYQEpFgCio9rqAySb96YX6FP8QiLeVmu0adW83wbqr3B9ywLAHX7J/MqDR8?=
 =?us-ascii?Q?BslcwLyiEC1o3UjDXlBFWzn0/R0o1jA9KB2N/IBD4zgX8PXJp+KtOQpAqSSh?=
 =?us-ascii?Q?3wyZWfKHo9lvYlfeyiT/xBNVGxN7crdzCd+6cOYPATRvue2lh7KoZ7/zExkp?=
 =?us-ascii?Q?5VrBV14vTHl7qhjL6lCcIzxwX0jTXz4dxLH/fQRTnRdkkrJH0iUWboBmQhmM?=
 =?us-ascii?Q?63PsAuAnLan9isrnZdwNFMK2iusEMxtga2wfCiq9jVairoQ39zzdwvAkj/7l?=
 =?us-ascii?Q?0A1CK7H2/X5eYWpED1j5F61GIJszFy1srluPGM2dVCJQvR/J6mk6lLZYQFiy?=
 =?us-ascii?Q?suhPCq40d7d6ryClBMZRfjDHK21/dil7YoI9FVvi3nuQ4zdWoy+tQeeMenuT?=
 =?us-ascii?Q?CqNnUbwusm6PfK3tISZJtxuRWnm5xdUe+cbrMFRG6Z7wvoPqZikPiIrwNOav?=
 =?us-ascii?Q?uDX73nZFOzugJRtabmwJGm9YJJ1yQprV65ZxeGQbuoO6IZ/6YJt8PN9l9e7L?=
 =?us-ascii?Q?jTIWAxeXSf2OqvRz4uGQ9LtUBLbeL3UG0KjOy5IWDx+cNyiPTfRXEFP9XwJe?=
 =?us-ascii?Q?8X0+PNmbwXiCHWmzKxXi1/wbfTj2aRl2lv9sEHf9iOIiANXph4gEJu/gkOg7?=
 =?us-ascii?Q?xLC9VPrZO6OIiOc1XQBTX02axgaaMEwhjXsl/p8Lgkto7h6bpfZ+0kQNH1il?=
 =?us-ascii?Q?9Haq4dZvNCZ8tWJsjZj3QWZndYbthGUgtTosGOlCJkKL5vtbxFIWH10KY35K?=
 =?us-ascii?Q?HQk/jM2jR+eBjxGWzTGQtSZgIvn3XiwF1sAuyaqDmwBeOqOkHh73nMalkBhr?=
 =?us-ascii?Q?OXB6N5PF6NFt+wFO2JKga7wlfujM4M5rdwLCByWAe4zwiul/xE+xNkNlcP+D?=
 =?us-ascii?Q?4aGyhIO6M6n2XhVuvWL/QOVcVp67KPYZzXr6pAXi8CF+chDos0pksW9hpruv?=
 =?us-ascii?Q?qEgzWNZxMcu1qns+4ZPwl9rnr+E7vxYDgmITcE1i7pFuxNHdZ5Nag4W8+PZV?=
 =?us-ascii?Q?gSWuyuo7YK4oFmBIFCl3nga5fecwJfyS0Uv515Pj0i8K01C4vPXyQx2WtlTC?=
 =?us-ascii?Q?zZ62k3M8CuEsGhSLdcOigid+Lo259L7vkp30eSYm49KMbwJjvSJMGX8rgpVP?=
 =?us-ascii?Q?5W8t+1AfQfMgKg6iondjK75f+FYBCeNFA5/QaK2W6rEKG+k9x5CCKBnlRsMl?=
 =?us-ascii?Q?gZYKcDmvYY5wSpW0POV2hzEx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced85643-3e66-4879-6d3c-08d907868ea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2021 01:07:54.8904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZ3UCSAliTse/z2ZI/ADiG9NJJuXKvQ4JshWNwkp/4Q8lsqUFMDIpvVPgrxufmIOhlPFV2MDE3IoiCPLa1AdQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1840
X-OriginatorOrg: intel.com

> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: Thursday, April 15, 2021 6:04 PM
>=20
> LBR, C-state MSRs should correspond to Ice Lake desktop according to
> SDM rev. 74 for both models.
>=20
> Ice Lake-SP is known to expose IF_PSCHANGE_MC_NO in
> IA32_ARCH_CAPABILITIES MSR
> (as advisory tells and Whitley SDP confirms) which means the erratum is
> fixed
> in hardware for that model and therefore it shouldn't be present in
> has_if_pschange_mc list. Provisionally assume the same to be the case
> for Ice Lake-D.
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
> No changes in v5.
>=20
> Changes in v4:
> - now based on SDM update
> - new LBR (0x1e0)does not seem to be exposed in the docs
>=20
> Changes in v3:
> - Add Ice Lake-D model numbers
> - Drop has_if_pschange_mc hunk following Tiger Lake related discussion
> ---
>  xen/arch/x86/acpi/cpu_idle.c | 2 ++
>  xen/arch/x86/hvm/vmx/vmx.c   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index c092086..d788c8b 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -181,6 +181,8 @@ static void do_get_hw_residencies(void *arg)
>      case 0x55:
>      case 0x5E:
>      /* Ice Lake */
> +    case 0x6A:
> +    case 0x6C:
>      case 0x7D:
>      case 0x7E:
>      /* Tiger Lake */
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 30c6a57..91cba19 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2990,7 +2990,7 @@ static const struct lbr_info
> *last_branch_msr_get(void)
>          /* Goldmont Plus */
>          case 0x7a:
>          /* Ice Lake */
> -        case 0x7d: case 0x7e:
> +        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
>          /* Tiger Lake */
>          case 0x8c: case 0x8d:
>          /* Tremont */
> --
> 2.7.4


