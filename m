Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B0B36A3D7
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 03:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116949.222832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTFG-0005KX-36; Sun, 25 Apr 2021 01:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116949.222832; Sun, 25 Apr 2021 01:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTFF-0005KA-Vo; Sun, 25 Apr 2021 01:07:33 +0000
Received: by outflank-mailman (input) for mailman id 116949;
 Sun, 25 Apr 2021 01:07:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSnA=JW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1laTFE-0005K5-Uw
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 01:07:33 +0000
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9de98bd-40dd-4a5f-bf90-3516c347dadf;
 Sun, 25 Apr 2021 01:07:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2021 18:07:27 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga005.jf.intel.com with ESMTP; 24 Apr 2021 18:07:27 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 24 Apr 2021 18:07:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sat, 24 Apr 2021 18:07:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.56) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sat, 24 Apr 2021 18:07:26 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1840.namprd11.prod.outlook.com (2603:10b6:300:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Sun, 25 Apr
 2021 01:07:25 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 01:07:25 +0000
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
X-Inumbo-ID: a9de98bd-40dd-4a5f-bf90-3516c347dadf
IronPort-SDR: /yz9CIr3KbenASjIdvViSKMGvGwajklPmwjfiIscR26HNlYTfjumJPWITvgvqzFdpvegznwq3U
 0vgVbFHMN+Mw==
X-IronPort-AV: E=McAfee;i="6200,9189,9964"; a="175688369"
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="175688369"
IronPort-SDR: VT1JM0+AjG3ynR9DHkCT0MkyKC1c3mn6AsgWOmQP5RA7CW2W0OoZVuR/jPkJ+sBIOX27ISWMPe
 JvLFBomZwn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="603856175"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGO7iRwAqL7esG95mz5BXBYhDBSkbKat5Gat9v0BCtUpsrB57xqzcH2oxRIWsdPhIaKwiY3OZY5tpXwmwydW7H76/pC6uJZtSo+sw4/jaDXf8jEggJVraQiKQCsGmvKr0+59SINMwMrJgHiX1V/O9Kz+1sfOoC/CDV2u8zmJMXdH5Qj1UxnSiByNkHyqYT7egVmvSfT/GApQti4EAfS7s9KImunPjBSwAvo+tnG2r/7YXhFukdFE+NO0vgemkfy+2LZ7cqkOvIVWTx7DQ0YbKNoH5mWux6t4Dvz9bOLZf/TqdNq6jhzsZz01gx+whf2VxdxGl6l+X+XQW1GijLqM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L9IDF1wo8fsdO8mmhW6cMKtoG6+H0Br5XorqTsh0Fg=;
 b=lKkR3IzRkXmIExfrRaFWTjZZk77EEG2f6p1JgVg3sdAk/RXPRHzbnQTfIRRjPBOeTyuZEMv/h4n416czvoPM8bCImR5yCZdLmqJIymmUSOeQPvNY8XddEYS0vME3KX9VFliKX5ELTgYak0EO4xf2Z+AJVzIOam2WqluuQ28wFwpWyWSburO4CwP5TneyhuxlI7wxlW+MEHOCc17u8wjcZKVziJnNNe44CLLX0KGSCwLNr63moC0vlt81ciQWNpok21LHP/2UGWRIy0D9Mld8uuCVvgJLZZ7Nj3cnGXmWQ9woyxVXEwHdRpvKwUQ1Xg8Y7y+CUvls2fyWXp7PX3uaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L9IDF1wo8fsdO8mmhW6cMKtoG6+H0Br5XorqTsh0Fg=;
 b=KLWf4IlfYY6PA7y88t3YrhbKOgnN4vlvPtb9SrzNFAgvTmJCo7Ms7Pa7FTW78ACUeOc/59xKguLmmUQNKIpKvEkwLJi8yOOveedxh7BDAXKBq4XkPeEyf8XD7o0qw3yeg8xb4c3ENXnr8BSul6qK0YVufrZUMXXDoXwrCO7mL+c=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH v5 1/2] x86/vtx: add LBR_SELECT to the list of LBR MSRs
Thread-Topic: [PATCH v5 1/2] x86/vtx: add LBR_SELECT to the list of LBR MSRs
Thread-Index: AQHXMd7OCBXv5dx1tEmSENL+Sd9wparEetQA
Date: Sun, 25 Apr 2021 01:07:24 +0000
Message-ID: <MWHPR11MB1886B4AEB0921371EF676A6F8C439@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
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
x-ms-office365-filtering-correlation-id: 759d4286-3bc5-401c-9dcd-08d907867cd2
x-ms-traffictypediagnostic: MWHPR11MB1840:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1840B5DF4ED0F8D0B3100A938C439@MWHPR11MB1840.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a7vidAQnNcpoSGYS7WhHzHIRXOBIOCzxWriGuP7AAYNcqGK46npRxqN1t8azEdnHrCPEkQVP2cTaURIbOEj2+gDQqaJom0GJrboI2MIhZpW+Kf0TjgwSWRWO8GggLXCr/IhSC6RQ7Dwq9ARxabnyby3cvqjUia6MOST37tJL81cMcQzb25BwvvLrq4Bxa09/FMPPMmkdV9ZXwX6o5Y36TRiedlDekXVt/tQIGLuHacXyo3a5YcM2pwKnvLBS0/1yhkmtOQzdL15oh9P1ldt5NvCLl1Vvb5oAkQeVRNviOoLR1Z3AVt+MlV6NjdxhdE/Xd+YB8LKJFnlkU5RrQkQx95qdW/ePgaAO1aXemWlg1N73RYnZLlnoBeTmwHc2Zea9e98yR4HuhfaC8NSOQLpvhX1ZPP3fXj6YufNvFQSIrwVROF99tP1J/SNsykafIW7aJdaYD8CcIA2GaeTSQ+D7M+RQuAhfycmCjUdKyMH4UUbrkcNGWVI1XwN7w9FtJ4VCMC8TDuDt2jZRGOVomSyYNpa60mYwAWMDHYs37OZ9+PXJf0A7g2mv+PeKeHQQD1FvXZy3CwNb012fQh2EQ7EeIPwWKYV/yWKPHySnS376UdE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(66446008)(64756008)(66946007)(86362001)(110136005)(33656002)(66476007)(66556008)(8676002)(71200400001)(5660300002)(38100700002)(4326008)(54906003)(6506007)(76116006)(26005)(55016002)(7696005)(316002)(2906002)(83380400001)(122000001)(8936002)(478600001)(52536014)(9686003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZSG+eC0pXivLSk3IMwJ0LUoozEj6MmjUF9lBK7qa9lfyTzIduYF7oLHxHs6a?=
 =?us-ascii?Q?JfcQS907yYTRX4t2x4AAi1tu2sdzr9wOVgJ/yzCWyrzmyNUpc2SpJBUmTKyT?=
 =?us-ascii?Q?iOKcsBD8XFQ/bOd1+2V1EHVlVtnneAtIWcqmgzHs2x+EqhbdokOutMZQp1wP?=
 =?us-ascii?Q?KtMCIFUuKQPCR7UdaaKzQ6VRTO7p2JibRm2Uuz7ZO2iTIXxAXhkApFANQ3Cv?=
 =?us-ascii?Q?fDxQP4fGiMeSjafrryHA9B+cT3eF4KoHXVh7Fn68hWWIdRS3lRPCOQ8BwXzj?=
 =?us-ascii?Q?4OP6U2cUd2ACBF2SgI7ZUJMtlL/MbHOJ4wJgh1Unj6HgKpu8Qubbku0hFN5Q?=
 =?us-ascii?Q?y/TMwg0w9wTCpooMx22z9n7aIw5zvze6pbwgAX0gRAFjABW2cw6qDdQ3/hU6?=
 =?us-ascii?Q?Oi7UQcJL8sYL0KVcpGzzpiUuny6YDh1XcK76BeVJPSbglh+AiYj9m/NAn93b?=
 =?us-ascii?Q?eg1z7g95S8+CGELUiuW0UMfRMsEX63hoxLrGoKabitX91UccCB/b6Jn/z97l?=
 =?us-ascii?Q?7jHPOKo7M19CaIllKhviOVNXXCYhQq+s3GMslEh/Q+SseFIyL8rqrM1IMBmC?=
 =?us-ascii?Q?HI89kOCpX2v6q5Ly/toKSM+ZKRLmZ1z/zrqmLtThnn1dMG1paZEicqpkDobc?=
 =?us-ascii?Q?bu0nPVsSmXrFfVSOcjciR13+ITnkubsYcix+tHpYVrKaVpgv90NeKX/4wpCO?=
 =?us-ascii?Q?Gi4byMJudx8fFs3SB9H6J5mf6CFeafaGjkXwcgRUBgTEMRIbOhIU4TOSxr7L?=
 =?us-ascii?Q?sXwgOIpgbGKR6lWTqndRY4fs8LWieSLHqwFBUqg4DGiVPOHKXYgRGN9zWk6d?=
 =?us-ascii?Q?D/Rx+JHfOmkKUYEQwotwB37/S2YShe0hjOUWsa+7aVf/Eu0SeAqAr7HkxsGX?=
 =?us-ascii?Q?2FFBIIeWF/YV8ODObu1FzUBX9REvYUkWgDp8xNvqG40UicYu1GI0A9wLcHD6?=
 =?us-ascii?Q?W/ma/oCIluO/pWFzsX6HjYgbGETMiu6wi9PxbfBdn/rnRqD4hdxKnEbXmIKJ?=
 =?us-ascii?Q?4IfeDSXUcaecAvAAVWqF11hM6ytbPWTmB8mdiEPNY5h976pBjALayw7ORIah?=
 =?us-ascii?Q?z1TqYwGlHdLSmJIXi3bS1YZ0GVTveSoekjST8roiSnYDQXdHb3pBjgpZJwq6?=
 =?us-ascii?Q?eOXudxT/LCgBn3eHMnpdE1E7w22bHix1wB0Bn1kM8jM+uLj7BFIX2RwisqWb?=
 =?us-ascii?Q?AODbSO7pk+47MYhcsulJlaoNhjrIu1BMHmYeXhJzwjjZ8+QaO07xaMkG59AO?=
 =?us-ascii?Q?4m0pr08RFvyEe40USAwUp+0B0//KyUhguYK3fn2/L+51BOsrOdMCQomDuh5O?=
 =?us-ascii?Q?Us5kR8KM1KWoeDC201awf3m8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759d4286-3bc5-401c-9dcd-08d907867cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2021 01:07:24.9466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eoTf4I/+UK6//lAZYbPNjJJKM3qSD3l/TLh69cV8LzKZIMFWEbQHOWlHSOUHjoXC7xzS2e1e46MQRi/WoE/1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1840
X-OriginatorOrg: intel.com

> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: Thursday, April 15, 2021 6:04 PM
>=20
> This MSR exists since Nehalem / Silvermont and is actively used by Linux,
> for instance, to improve sampling efficiency.
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
> Changes in v5:
> - added Silvermont+ LBR_SELECT support
>=20
> New patch in v4 as suggested by Andrew.
> ---
>  xen/arch/x86/hvm/vmx/vmx.c      | 20 ++++++++++++++++----
>  xen/include/asm-x86/msr-index.h | 10 ++++++++--
>  2 files changed, 24 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 835b905..30c6a57 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2915,14 +2915,16 @@ static const struct lbr_info {
>  }, nh_lbr[] =3D {
>      { MSR_IA32_LASTINTFROMIP,       1 },
>      { MSR_IA32_LASTINTTOIP,         1 },
> -    { MSR_C2_LASTBRANCH_TOS,        1 },
> +    { MSR_NHL_LBR_SELECT,           1 },
> +    { MSR_NHL_LASTBRANCH_TOS,       1 },
>      { MSR_P4_LASTBRANCH_0_FROM_LIP,
> NUM_MSR_P4_LASTBRANCH_FROM_TO },
>      { MSR_P4_LASTBRANCH_0_TO_LIP,
> NUM_MSR_P4_LASTBRANCH_FROM_TO },
>      { 0, 0 }
>  }, sk_lbr[] =3D {
>      { MSR_IA32_LASTINTFROMIP,       1 },
>      { MSR_IA32_LASTINTTOIP,         1 },
> -    { MSR_SKL_LASTBRANCH_TOS,       1 },
> +    { MSR_NHL_LBR_SELECT,           1 },
> +    { MSR_NHL_LASTBRANCH_TOS,       1 },
>      { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
>      { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
>      { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
> @@ -2934,10 +2936,19 @@ static const struct lbr_info {
>      { MSR_C2_LASTBRANCH_0_FROM_IP,
> NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
>      { MSR_C2_LASTBRANCH_0_TO_IP,
> NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
>      { 0, 0 }
> +}, sm_lbr[] =3D {
> +    { MSR_IA32_LASTINTFROMIP,       1 },
> +    { MSR_IA32_LASTINTTOIP,         1 },
> +    { MSR_SM_LBR_SELECT,            1 },
> +    { MSR_SM_LASTBRANCH_TOS,        1 },
> +    { MSR_C2_LASTBRANCH_0_FROM_IP,
> NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
> +    { MSR_C2_LASTBRANCH_0_TO_IP,
> NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
> +    { 0, 0 }
>  }, gm_lbr[] =3D {
>      { MSR_IA32_LASTINTFROMIP,       1 },
>      { MSR_IA32_LASTINTTOIP,         1 },
> -    { MSR_GM_LASTBRANCH_TOS,        1 },
> +    { MSR_SM_LBR_SELECT,            1 },
> +    { MSR_SM_LASTBRANCH_TOS,        1 },
>      { MSR_GM_LASTBRANCH_0_FROM_IP,
> NUM_MSR_GM_LASTBRANCH_FROM_TO },
>      { MSR_GM_LASTBRANCH_0_TO_IP,
> NUM_MSR_GM_LASTBRANCH_FROM_TO },
>      { 0, 0 }
> @@ -2991,6 +3002,7 @@ static const struct lbr_info
> *last_branch_msr_get(void)
>              return sk_lbr;
>          /* Atom */
>          case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
> +            return at_lbr;
>          /* Silvermont */
>          case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
>          /* Xeon Phi Knights Landing */
> @@ -2999,7 +3011,7 @@ static const struct lbr_info
> *last_branch_msr_get(void)
>          case 0x85:
>          /* Airmont */
>          case 0x4c:
> -            return at_lbr;
> +            return sm_lbr;
>          /* Goldmont */
>          case 0x5c: case 0x5f:
>              return gm_lbr;
> diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-
> index.h
> index 43d26ef..020908f 100644
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -606,15 +606,21 @@
>  #define NUM_MSR_C2_LASTBRANCH_FROM_TO	4
>  #define NUM_MSR_ATOM_LASTBRANCH_FROM_TO	8
>=20
> +/* Nehalem (and newer) last-branch recording */
> +#define MSR_NHL_LBR_SELECT		0x000001c8
> +#define MSR_NHL_LASTBRANCH_TOS		0x000001c9
> +
>  /* Skylake (and newer) last-branch recording */
> -#define MSR_SKL_LASTBRANCH_TOS		0x000001c9
>  #define MSR_SKL_LASTBRANCH_0_FROM_IP	0x00000680
>  #define MSR_SKL_LASTBRANCH_0_TO_IP	0x000006c0
>  #define MSR_SKL_LASTBRANCH_0_INFO	0x00000dc0
>  #define NUM_MSR_SKL_LASTBRANCH		32
>=20
> +/* Silvermont (and newer) last-branch recording */
> +#define MSR_SM_LBR_SELECT		0x000001c8
> +#define MSR_SM_LASTBRANCH_TOS		0x000001c9
> +
>  /* Goldmont last-branch recording */
> -#define MSR_GM_LASTBRANCH_TOS		0x000001c9
>  #define MSR_GM_LASTBRANCH_0_FROM_IP	0x00000680
>  #define MSR_GM_LASTBRANCH_0_TO_IP	0x000006c0
>  #define NUM_MSR_GM_LASTBRANCH_FROM_TO	32
> --
> 2.7.4


