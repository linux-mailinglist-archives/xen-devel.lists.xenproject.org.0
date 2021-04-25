Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7436A3DD
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 03:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116956.222856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTHz-0006HR-Qi; Sun, 25 Apr 2021 01:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116956.222856; Sun, 25 Apr 2021 01:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTHz-0006H0-NJ; Sun, 25 Apr 2021 01:10:23 +0000
Received: by outflank-mailman (input) for mailman id 116956;
 Sun, 25 Apr 2021 01:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSnA=JW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1laTHx-0006Go-R7
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 01:10:21 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaaf6924-c5b4-424b-a73e-4e581f2df216;
 Sun, 25 Apr 2021 01:10:20 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2021 18:10:19 -0700
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 24 Apr 2021 18:10:18 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 24 Apr 2021 18:10:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 24 Apr 2021 18:10:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sat, 24 Apr 2021 18:10:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sat, 24 Apr 2021 18:10:17 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1840.namprd11.prod.outlook.com (2603:10b6:300:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Sun, 25 Apr
 2021 01:10:16 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 01:10:16 +0000
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
X-Inumbo-ID: aaaf6924-c5b4-424b-a73e-4e581f2df216
IronPort-SDR: ioOIO+BTcrUQF7jhCxbkHlfr1CAsgu3J+fPHAefhecyKKGd2BnhgK0vXECj7X5zA6lAxC59qS1
 aC9VWXz01LcA==
X-IronPort-AV: E=McAfee;i="6200,9189,9964"; a="216896652"
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="216896652"
IronPort-SDR: VBeTIbqsZz23ETQh6XAnM6ZHWdqIDYWawRNXR9Nqx8PZeToI3mKP+RFyaD5tm2M9xjuY3usKpX
 B9kZwiKAVWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="535869252"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/9kHF+OPuYtvDLoDU93Mx/Ytby3pWbYH9x/zNGoTi8kU1BJpIVd2eE+ye14eirb7tE0eUu3yFkG4wPyWyEnLM5d93EYtdM5VCLmX3B7+xN3lmS8+isZjyE20AV9JQFjmCk6dmoXSMIjPPMW/tgd7sVCLuZPkNc3QvYcvdKJSD90kh+QYrpE0i7hWd3BRus4V4KaBXEMPbEkg8dng4pydEagiMwkiTypghL2N0DV5k154CRxM/stqa4UrDMPw+FvJyR3F0n+1T+mnG/nTDEBGWVpYVIoFSyQyJnSmbMZsLZRzeAjvyf5hryjZxgNzGHnqRRj4KgJjDoeqXBgrBM3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pz75R9i1uLcgRh7sOihE+t3Fk3xYyqxHGE8sI8n/Rg=;
 b=gMuC69AvbUjmSffagVJW4rQNDUutIuzVjbbvJQwGCD6DpX1Eh4Ww+VDp3y+PHMsj1hclTgET1zhOR0+WguG7yiEmWf++D3aKctb5rB+WHd0SfK/LH6lpaSLH0cqZGCTMXdTHPxKh+oRTlYm6CmYFZEoGkxDpRdgYKsXOmjSYEZbpdUNmaGq1ZWJYv4izyRwi4I4Jyx36BCnfjsCJ+kQVwKOx4OlxtrNEQp3Gv/Nop1KZKyWmR0UBCxFpOM2bRVPMQJBLvZ+BoiyiUB+/BFEFob0ZseuX5X/cPeqeWjHDFU0TCZqTEa6wWv4Jh0KEZJK95BnloHClQRX0rEapAggnyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pz75R9i1uLcgRh7sOihE+t3Fk3xYyqxHGE8sI8n/Rg=;
 b=jT3AE4CLju2VHlx5kZLs42YI0hFRTIsSs8Ic+PIslu7lh4h7N0y6Fkz8shpbQuHo9GIjP6WvvZ8txq13MwSOD5lb1QacXRnucjfE63kt2l+5hDgK0OlKF8LKNfli1/hugVLVsXaPrL59qPLkvomhb8O22aZqKeGSWyZWeitUCX8=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH] x86/vPMU: Extend vPMU support to version 5
Thread-Topic: [PATCH] x86/vPMU: Extend vPMU support to version 5
Thread-Index: AQHXMIoR1jV8zFesQ0OCx12H13L7jKrEfksw
Date: Sun, 25 Apr 2021 01:10:15 +0000
Message-ID: <MWHPR11MB18862FC0F7D25E072113CF048C439@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <1618334701-8263-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1618334701-8263-1-git-send-email-igor.druzhinin@citrix.com>
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
x-ms-office365-filtering-correlation-id: 251bdd90-4def-4889-96dd-08d90786e2c2
x-ms-traffictypediagnostic: MWHPR11MB1840:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB18404722EF7F04D8D02DD8488C439@MWHPR11MB1840.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:268;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hw+/8q9Vloy2R//Hde07RbC7PgLDUNWFuwz256Cl9bkzW6eNOPm/Ld4pDfP7finc9QRqSyXIRPl0yA2PPzr2/5yXgYE+CD/YeqSKpPs7CmpDVETbvQIobemPFCRaYzaFenz6yaTEheK2vWbc01zxSXMC426PLbSiyHXQ7MOUW1/cz5ArTYhdSnB8bW5G+Lha6BlRqVvx+YuDQL1LyI2oggC3UTVD5G9wKbjhO/bnJPIYGJ/FRsdLndCW3wmCgQHgWaTaaDDx8OuUSDM5VQipwDx+tUJyvWi6aqSCfoDOHf0jM7K/Ozp3BBvDXNAiEB0q7LqMxRsxP+KSJ+Wos22d0ulBAJKjBO5+ChgZ4SG3te2FqFRjfYs03Pay5Q2a7dpZE/nmUYIDvu0MASGvRBYETSnz6ck4ov+l6qA17hExdXd6EEOmCxq1YF0WY3jitcVsNcX/8tl+l8K8Kioe3dxepGaFbG8bS0j0GewLeVQwBMQUph29QlbEF3+rVwrEEv23kPhWhjmLryWmvCT1jXaB6rdGd+YqY9wGZww5982VUR7NSfxwChzJY8TLYtmluxbWZbHLk75R6JftFukJh2utljCuPQBxQm1e0X+aq/elHaA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(66446008)(64756008)(66946007)(86362001)(110136005)(33656002)(66476007)(66556008)(8676002)(71200400001)(5660300002)(38100700002)(4326008)(54906003)(6506007)(76116006)(26005)(55016002)(7696005)(316002)(2906002)(83380400001)(122000001)(8936002)(478600001)(52536014)(9686003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?peI96gYsF1rDvOAu/1uEFKne4skaXU9knsp4LIysTVByBG6MuOaos1O5uTDC?=
 =?us-ascii?Q?eH7yiz2ij4VCF1EpILlcWJ1pxiO30Ewvk7Tas6V5byc1heQues2mQc+iaDK8?=
 =?us-ascii?Q?gJSYzc7TN0aBZq7b+TDJwdnkjoPRE6/oaJuSPxWRDSQsbNfcw0DM+572SIqZ?=
 =?us-ascii?Q?WRIiUlD7FdUs76wTTkQlV7f551Rm37Vt3Ntp8HUJFZ33KE2tjyYQYHJLGIph?=
 =?us-ascii?Q?u9Vt4pU9g8EWybUYWqS40WwHenUwAoTuwqMKTURLnTBeOicqqN02LMAy+9Y0?=
 =?us-ascii?Q?q1S/304HJ21fJYITce5IiortKqe91CvOpfNJi+Rdz2H9P8VPqOFglERVsKKs?=
 =?us-ascii?Q?qcQRfxqeSV4D57hji7bHgzv25C9bQk6HIdalLfXkQkRrnoYnIIIPU7r2pEgg?=
 =?us-ascii?Q?eVi/2vWPexw9ewekPELyQ8XzWwMOs64eFFlOMF0CXdIN5u42Z66vncaochiZ?=
 =?us-ascii?Q?C3JI/DYkV7xhpp5lKlKROq51fljIeazTExKTNss9enaoZJNbSoZqntQJGeJ9?=
 =?us-ascii?Q?ZvKmGr+nFbMqTGKjl4kJ3J8nZW7FT0bIo8NwrzmMUrnuweSefJpW2V2fqzE4?=
 =?us-ascii?Q?8JHguj9qGzd8/jLTPG3Txj713bQ5iLsEswP0jJ2QjircaEZyLLJdgkW12k4o?=
 =?us-ascii?Q?344zvfx1F5lde0TvlrDoabWDH7siN3O63+h5Ljo+nZsBAWEUo+PRyyPTTo3t?=
 =?us-ascii?Q?7gRHHEu9X9ofJoD+KG/IoymrWRwrBMIxM8FkDqMgDIhGxY0v49mFaAG+455P?=
 =?us-ascii?Q?uudsayB9AbtRIOzAP93kwb/HYFkwN2E39r3XPR1tIB6L+W4ms3uk3z3lE4kd?=
 =?us-ascii?Q?ntKyL65zTMvKTaOljx7JY5jJ/vSyVfd1f2DqtRpIeQ4qktVafl7KodExMO4h?=
 =?us-ascii?Q?CITfW2i/RayoA1oE5lw6MZ1gb+4sqV4LfAFttz7R7eOTPzF2Ye6IpdT25/yS?=
 =?us-ascii?Q?gGyVJbjOX9DIzcafQohw9gircfM40K1rXVj74vU0p2+bje2kaYq1OxgtxA8c?=
 =?us-ascii?Q?dVb7rCSB+vWzlRfqz2NofRC6D7Y6iZSpW/bqGwGXcQGBqmVVrUvC0i2pHRM8?=
 =?us-ascii?Q?DR8DIUu1nRdm8pOu65IVC5HjwDFQxCUramv1N9JVkSZh26PVybnzBAbfksAP?=
 =?us-ascii?Q?tVLkvTefg1Ae85pD4Wp0u7f1HvPfu29LMmgS8qNTiz3z/8Rrkd00y7pbez+e?=
 =?us-ascii?Q?A3D1yTNBlZx0OaKMAyYa3WIGEhAc9Aa21nn/7vmxn9B6uZQx7BC09ozn25KF?=
 =?us-ascii?Q?C4NrYwaAoCel9MS1pysHigVt2ZKEZIpWDdZNDSsvDJ9f+3hraQWbkPb41Wv0?=
 =?us-ascii?Q?0BnSlRhoHjfhIn2L8f1qtxiY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251bdd90-4def-4889-96dd-08d90786e2c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2021 01:10:16.0231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9JSrBmLx/uZa+IkMMHqDs0ha/4Tpv0QzO2hwVexcMMuJsZhoyhgIZUiQ4sjMv5ffwq0kCpyKivyU4X7muLpww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1840
X-OriginatorOrg: intel.com

> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: Wednesday, April 14, 2021 1:25 AM
>=20
> Version 5 is backwards compatible with version 3. This allows to enable
> vPMU on Ice Lake CPUs.
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  xen/arch/x86/cpu/vpmu_intel.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/cpu/vpmu_intel.c
> b/xen/arch/x86/cpu/vpmu_intel.c
> index 6e97ce7..0dfc256 100644
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -839,7 +839,7 @@ int vmx_vpmu_initialise(struct vcpu *v)
>          return 0;
>=20
>      if ( v->domain->arch.cpuid->basic.pmu_version <=3D 1 ||
> -         v->domain->arch.cpuid->basic.pmu_version >=3D 5 )
> +         v->domain->arch.cpuid->basic.pmu_version >=3D 6 )
>          return -EINVAL;
>=20
>      if ( (arch_pmc_cnt + fixed_pmc_cnt) =3D=3D 0 )
> @@ -909,8 +909,9 @@ int __init core2_vpmu_init(void)
>      switch ( version )
>      {
>      case 4:
> -        printk(XENLOG_INFO "VPMU: PMU version 4 is not fully supported. =
"
> -               "Emulating version 3\n");
> +    case 5:
> +        printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported.=
 "
> +               "Emulating version 3\n", version);
>          /* FALLTHROUGH */
>=20
>      case 2:
> --
> 2.7.4


