Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7632CDF0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 08:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93036.175572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHilX-0005Mi-22; Thu, 04 Mar 2021 07:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93036.175572; Thu, 04 Mar 2021 07:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHilW-0005MJ-Ud; Thu, 04 Mar 2021 07:51:22 +0000
Received: by outflank-mailman (input) for mailman id 93036;
 Thu, 04 Mar 2021 07:51:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctrG=IC=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lHilV-0005ME-0l
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 07:51:21 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e496c94-a208-4d20-8d42-8c11be1ed978;
 Thu, 04 Mar 2021 07:51:17 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 23:51:15 -0800
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 03 Mar 2021 23:51:15 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 3 Mar 2021 23:51:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 3 Mar 2021 23:51:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 3 Mar 2021 23:51:14 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 07:51:13 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.031; Thu, 4 Mar 2021
 07:51:12 +0000
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
X-Inumbo-ID: 7e496c94-a208-4d20-8d42-8c11be1ed978
IronPort-SDR: QFQdcMwgTqG0wPiNjkoA5ExfB+nHOK0tjm+GY+gQQHmNyHt4rthQx7iZSomcxD1VhEPlCJjQ9o
 zGBjHsZSdN2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="183987839"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="183987839"
IronPort-SDR: KWjhXRXCityOAZpAK4ZkP2aB0aztzNMeFSfx+80q8dK9IMh9NuB0Q2cQCDqV2nU3qTlXPOL2xI
 fF5rGtkubnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="407659330"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKUyYK6S7UkPJqRpS3qITfc9ALun7d4wwvEtLke5eosSWnSHc+ObhndsAqw/z0KMIh6eerq6FzCFZYXb77LpXlIu08lF2PoF7DfRn64tLyPNCwWVObCrFpcwfvetQIYADpJFKfVSbjovHuGJf04kMcPNywCVQT17Kwd2hOZk1yA1c16zIfLWlowgyBui1YGnfQt11LfK37itcPOvxuE4k+qpVQ6BbihpzXLshFU9bMLbA8kqNHYW4JXx2S91o7fnoQT80XA0lrWSRYJSaKnS03mBMYH+GfVGrFA9nLuJ9Wro13jGWp3kAn+NgnR3JgQQ6jQTsKA/kuW4UrDnXAOCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxgJzFs0tRBBf4a6bUY+PB6jxjVfNGu0WK0yLzcXvoA=;
 b=QQhBdfp1aXleqWJ/fyp4LAmiXVq52aSy7P1UnF7J6PQEBH0UeEACTGkoYVNayrMPsFIqU2Hja+gAn0kQwNXA3P31if+X3MBVxuzvw/t6dL0Is3HMrTyIT3LJhJU+tnw94Ckvbszz4eA7zp2TMGfMP9XTHBogenVlEifdWw++qxu0BlPhIjYtdvKHqbXY/mBoYJ5XiI//2/CSc1kbjdpodBcefE/dzioHFJKODw7bh1rNN1ul6DYUeiLCQZMkpF0iBS9RaoCWlYVzehEI7x0jfgQon18XIgdeamxQ6dbxJt8LoVyOGRlNHnizCoG1SMGwBTMN+gZhp6eltBx+0RhK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxgJzFs0tRBBf4a6bUY+PB6jxjVfNGu0WK0yLzcXvoA=;
 b=qc6wEy3zcxGX5Hiu52lIcazqDuv60x8Au/yo9NWbdd5HnWslAhSxSjOANC8vQT48LW6OTl6RnUeSiaB5oUjMNTuFjL4Y/lfktrhzOnwX2Klotuy42nKHIGzrDnKfrh1l9bfSCGqiMZCBpRnOJVb2SzzgQQYrkX9/YE8HQrS+QDg=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH] VMX: use a single, global APIC access page
Thread-Topic: [PATCH] VMX: use a single, global APIC access page
Thread-Index: AQHW/8yZa97+qDgbIE6iwG3wuPN9papSpOiAgAAfJYCAAAsJgIAAAbyAgAASBACAG55hYIAAZWcAgAABLbCAABuaAIAEjifQ
Date: Thu, 4 Mar 2021 07:51:12 +0000
Message-ID: <MWHPR11MB18862455480F82E19D8558458C979@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
 <YCUSDSYpS5X+AZco@Air-de-Roger>
 <547b40f2-3b7b-10cb-30f6-9445c784eb0b@suse.com>
 <YCUiniCn+oT9CFwC@Air-de-Roger>
 <MWHPR11MB1886E452B181ACA872B7C6878C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <a11878e2-312c-a49a-ebe2-122906fc8d38@suse.com>
 <MWHPR11MB18860667A153820C2CB8D55B8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <a0595a8f-b3ad-c901-15d9-cae0b538858a@suse.com>
In-Reply-To: <a0595a8f-b3ad-c901-15d9-cae0b538858a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27ad954e-bfcb-4502-be75-08d8dee24835
x-ms-traffictypediagnostic: CO1PR11MB5108:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB5108B54D52D8188AC0AE4AD28C979@CO1PR11MB5108.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: apuHNXyPGwgt3UfcrqzksiRVgbc/fV8y9wjc7UwRf2YgtTosJA3Qi5O8GlZndtzdV5GiXfr+yn8CB58n/XTpRgs8U4Daqc5Nu6dzFJVbXTy/97GHE2yPIviL7ieJDMprN2dF5vd5S8QK4QlWc5j9BgTg7huQyeSM4mwyJFbA04+vQUecIIkzHmeb2vI8JGDZD6nHhZZKZCIz/PM8AD7Ldsm44dN8JBPPiyoz0ot5tqyaW4/rwRvAEAI/oRPZPivhpyLmtx+0+emdjl4VJNXU1YaCoh7bGgIe9In4riZHC2jV9OMWKu8RzdewDR9UoQvhrwXkn8Fa+EC0BwiXh5XmP2jLVBnXwi7lPWFLX+0BSK7cjP5yM+NJm4NFjjcikVxbYiNeBHFAygCej5uQCmEOfb6wysHbRfoGAGLTJCJCZXoB+MyRlmlChKnvAKyWK+vOkBFzOMiflPCF8BV77eJgkka0DcG/Jq6Lse7ifXAo95CGqZcQrMh9q2670Pj7wbQMuF7DzblfyVrL14HiR4veBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(396003)(346002)(39860400002)(316002)(55016002)(7696005)(86362001)(4326008)(66446008)(6916009)(54906003)(9686003)(8936002)(8676002)(33656002)(71200400001)(2906002)(66556008)(26005)(5660300002)(52536014)(83380400001)(76116006)(66946007)(53546011)(6506007)(478600001)(66476007)(64756008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZUsxY2RBbTFZbGZnbmt1QXFLYnVZdHNVQUE0RVZoQmdDcVVBTjIza3ZucHZS?=
 =?utf-8?B?QmZZWmRlRFYyZ1pZdDV6VEtOSjFsY3Zwd0NtZ05EY2dEZXJqZmxkU3BZSmYv?=
 =?utf-8?B?RWZyR2xxeGg4UE1OOUR4N3V5Y2NFa2xTSXBKRys1RldhY01OZkpQM3l0SXV5?=
 =?utf-8?B?UFM1ei9RVHhTTEZxYzZ3bjJvcWFGZEJDYUJrTzE5UnVNVzNrQzNyTk1iRHRW?=
 =?utf-8?B?b3ByQ2hhdDR0VzZXZit1Mitab3JkWndIcmJ5ckNzZUdjNGlKdjRYNTgySWJz?=
 =?utf-8?B?MDFhWnRBSlBDSmNnUjVoL0JCZnQ2dmErMmV0ZGxucUhUSkZRT1ZRWUxDWnV4?=
 =?utf-8?B?M0RGbzF2S1BSYXFuTzYvaGw4VXNuTkplSmVQMVR6QmZOYnRKckhKWDRJMEs4?=
 =?utf-8?B?NmtFMGpYY1N4QXJPSkx5cUJJTndQeEd6OEZMeGFwTkNIcTUzb05aYlZQTWpU?=
 =?utf-8?B?dlJlc1RmSFk2dlVCTFh0OGVyUVlRam1jRHpjS0gwdFNkdUZsL2dUWE5ZZHp2?=
 =?utf-8?B?djRYbHhIdHd4N3lwd1JYTXlqdC9adExwL3J1d053QWxTT1dmZUN6OEJWb2ZU?=
 =?utf-8?B?RTJVM3ZhRHV2WVFIRE1YMHJSSXgxMHpWSDhqSHlqZk9ZWkNVUm5RckNMNllz?=
 =?utf-8?B?bWhzZGtLMEY3bVhQRm1zYWgxcHFNUFJaSjlmaERzUGNzZ1RxSmNQcmcxYmRr?=
 =?utf-8?B?NGJHTXdMWDVoT2h1R010cU1aRm1pTERhVEV2VnUxK3FvcUZuajFYdzEvRW1r?=
 =?utf-8?B?N1BZc0lZS0JDTTVWN0wvYVp3VWN2U2JjVmhHaStndW0wQ3Bzc0tKMUUwOHVY?=
 =?utf-8?B?d1hFWjRGVUpKQmhIclFJd2ZnSjdBc1BaWTc5bDNhaXc2eUt4UGgzSldJZUtz?=
 =?utf-8?B?eFl2YTVHWGhoeTQ2TzRVVDQ2SHRpMzNhS0ZqTXU1TG1UdjlhandvYUdGdXhn?=
 =?utf-8?B?YXVhdjJ0SlVTWXFuV2VVbDdOcjNhZThQb1pmRUlaYTFvdE5rUGhLT1Z1SWtT?=
 =?utf-8?B?c3NxL0J1UFBtazVSSW9YZGxCY3JOK1RjazlHTlh3anRjeUVrYng1QXFYdzl3?=
 =?utf-8?B?Y0xueWptTFVOTWFWK2VmckJaVEE0QmlaajhrS2tDSkdDY1pwVXJ4Q3ZETy84?=
 =?utf-8?B?ZVVQc3djVWZrSkJjQ1NvMllzdzFyUGhpRE8xMU1kYnJkZEFqZXMzYmVTRGZB?=
 =?utf-8?B?OGxIQjVqQTdONHphVERpMWdsQkpxd3BrMU1CYWdSbG0vZGpZVSthV296Qy9l?=
 =?utf-8?B?UjNHUEl0VVEvOXBTdDN3Ym83TU54aHJFZjV0NFZOV1pWbjFWOW1PU0EvZnVR?=
 =?utf-8?B?dkNBc2RlcUd1SHhLclRwZ1ZETkp3YlYyeGlUY2RIQjEvQW4xQjF6RVlXUTdM?=
 =?utf-8?B?QUhEMWtMWHNYZWRvTEZ5ODUvZ1VaVUV0cHBxbDFpL1RxVU5INHpVcFFrbVFs?=
 =?utf-8?B?bHVXNzRKOXk1a1RNSEh4dmtqdmdRTlZWRTZLRjJWazRLOThoOHdhZkRaRld5?=
 =?utf-8?B?amYzc29OMXJFSVQrdHBTVFNRWGxTUXBKU1JZcG9QaGcyNWExTG9BekRvaWds?=
 =?utf-8?B?REZBZHRyTThkTG9nK2hKK1IxbFVzd3JLZXdjQjZIa25zVHdXZGxMQlV2VDBZ?=
 =?utf-8?B?Wk9Qc1lYRkhJVm04dng3TWdjcFpnT1daV3l3UGlhQWZOOEtIaTRIZVQwcXk1?=
 =?utf-8?B?YnEvdERjNnlBRkViUmRvNlZQeEZHTnhsRGdZdnpVK2wzK3pzRTJSMTBicW1I?=
 =?utf-8?Q?74rnNT79gbGXZQotgB4mZmub32+GIC5ZMt5a3QU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ad954e-bfcb-4502-be75-08d8dee24835
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 07:51:12.7282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohm6dpgIvuP2sWmt0eWtpLPjkIwDYef7un+AyYwF7NPK4t9xIQC6Ny2WGdBHL4If6igz9TVsCIVz8OWWDsPK1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWFyY2ggMSwgMjAyMSA1OjU5IFBNDQo+IA0KPiBPbiAwMS4wMy4yMDIxIDA5OjMwLCBUaWFuLCBL
ZXZpbiB3cm90ZToNCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiA+PiBTZW50OiBNb25kYXksIE1hcmNoIDEsIDIwMjEgNDoxNiBQTQ0KPiA+Pg0KPiA+PiBPbiAw
MS4wMy4yMDIxIDAzOjE4LCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPj4+PiBGcm9tOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4+PiBTZW50OiBUaHVyc2RheSwg
RmVicnVhcnkgMTEsIDIwMjEgODoyNyBQTQ0KPiA+Pj4+DQo+ID4+Pj4gT24gVGh1LCBGZWIgMTEs
IDIwMjEgYXQgMTI6MjI6NDFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+Pj4+IE9u
IDExLjAyLjIwMjEgMTI6MTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+ID4+Pj4+PiBPbiBU
aHUsIEZlYiAxMSwgMjAyMSBhdCAxMTozNjo1OUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4gPj4+Pj4+PiBPbiAxMS4wMi4yMDIxIDA5OjQ1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
PiA+Pj4+Pj4+PiBPbiBXZWQsIEZlYiAxMCwgMjAyMSBhdCAwNTo0ODoyNlBNICswMTAwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4gPj4+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJt
LmgNCj4gPj4+Pj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCj4gPj4+Pj4+
Pj4+IEBAIC05MzUsNiArOTM1LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgcDJtX2dl
dF9pb21tdQ0KPiA+Pj4+Pj4+Pj4gICAgICAgICAgZmxhZ3MgPSBJT01NVUZfcmVhZGFibGU7DQo+
ID4+Pj4+Pj4+PiAgICAgICAgICBpZiAoICFyYW5nZXNldF9jb250YWluc19zaW5nbGV0b24obW1p
b19yb19yYW5nZXMsDQo+ID4+IG1mbl94KG1mbikpICkNCj4gPj4+Pj4+Pj4+ICAgICAgICAgICAg
ICBmbGFncyB8PSBJT01NVUZfd3JpdGFibGU7DQo+ID4+Pj4+Pj4+PiArICAgICAgICAvKiBWTVgn
ZXMgQVBJQyBhY2Nlc3MgcGFnZSBpcyBnbG9iYWwgYW5kIGhlbmNlIGhhcyBubw0KPiBvd25lci4N
Cj4gPj4+PiAqLw0KPiA+Pj4+Pj4+Pj4gKyAgICAgICAgaWYgKCBtZm5fdmFsaWQobWZuKQ0KPiAm
JiAhcGFnZV9nZXRfb3duZXIobWZuX3RvX3BhZ2UobWZuKSkgKQ0KPiA+Pj4+Pj4+Pj4gKyAgICAg
ICAgICAgIGZsYWdzID0gMDsNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gSXMgaXQgZmluZSB0byBo
YXZlIHRoaXMgcGFnZSBhY2Nlc3NpYmxlIHRvIGRldmljZXMgaWYgdGhlIHBhZ2UgdGFibGVzDQo+
ID4+Pj4+Pj4+IGFyZSBzaGFyZWQgYmV0d2VlbiB0aGUgQ1BVIGFuZCB0aGUgSU9NTVU/DQo+ID4+
Pj4+Pj4NCj4gPj4+Pj4+PiBObywgaXQncyBub3QsIGJ1dCB3aGF0IGRvIHlvdSBkbz8gQXMgc2Fp
ZCBlbHNld2hlcmUsIGRldmljZXMNCj4gPj4+Pj4+PiBnYWluaW5nIG1vcmUgYWNjZXNzIHRoYW4g
aXMgaGVscGZ1bCBpcyB0aGUgcHJpY2Ugd2UgcGF5IGZvcg0KPiA+Pj4+Pj4+IGJlaW5nIGFibGUg
dG8gc2hhcmUgcGFnZSB0YWJsZXMuIEJ1dCAuLi4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBJJ20gY29u
Y2VybmVkIGFib3V0IGFsbG93aW5nIGRldmljZXMgdG8gd3JpdGUgdG8gdGhpcyBzaGFyZWQgcGFn
ZSwgYXMNCj4gPj4+Pj4+IGNvdWxkIGJlIHVzZWQgYXMgYW4gdW5pbnRlbmRlZCB3YXkgdG8gZXhj
aGFuZ2UgaW5mb3JtYXRpb24NCj4gYmV0d2Vlbg0KPiA+Pj4+Pj4gZG9tYWlucz8NCj4gPj4+Pj4N
Cj4gPj4+Pj4gV2VsbCwgc3VjaCBhbiBhYnVzZSB3b3VsZCBiZSBwb3NzaWJsZSwgYnV0IGl0IHdv
dWxkbid0IGJlIHBhcnQNCj4gPj4+Pj4gb2YgYW4gQUJJIGFuZCBoZW5jZSBjb3VsZCBicmVhayBh
dCBhbnkgdGltZS4gU2ltaWxhcmx5IEkNCj4gPj4+Pj4gd291bGRuJ3QgY29uc2lkZXIgaXQgYW4g
aW5mb3JtYXRpb24gbGVhayBpZiBhIGd1ZXN0IGFidXNlZA0KPiA+Pj4+PiB0aGlzLg0KPiA+Pj4+
DQo+ID4+Pj4gSG0sIEknbSBraW5kIG9mIHdvcnJpZWQgYWJvdXQgaGF2aW5nIHN1Y2ggc2hhcmVk
IHBhZ2UgYWNjZXNzaWJsZSB0bw0KPiA+Pj4+IGd1ZXN0cy4gQ291bGQgSW50ZWwgY29uZmlybSB3
aGV0aGVyIHBhZ2VzIGluIHRoZSAweEZFRXh4eHh4IHJhbmdlIGFyZQ0KPiA+Pj4+IGFjY2Vzc2li
bGUgdG8gZGV2aWNlcyBpbiBhbnkgd2F5IHdoZW4gdXNpbmcgSU9NTVUgc2hhcmVkIHBhZ2UNCj4g
Pj4+PiB0YWJsZXM/DQo+ID4+Pg0KPiA+Pj4gMHhGRUV4eHh4eCByYW5nZSBpcyBzcGVjaWFsLiBS
ZXF1ZXN0cyB0byB0aGlzIHJhbmdlIGFyZSBub3Qgc3ViamVjdCB0bw0KPiA+Pj4gRE1BIHJlbWFw
cGluZyAoZXZlbiBpZiBhIHZhbGlkIG1hcHBpbmcgZm9yIHRoaXMgcmFuZ2UgZXhpc3RzIGluIHRo
ZQ0KPiA+Pj4gSU9NTVUgcGFnZSB0YWJsZSkuIEFuZCB0aGlzIHNwZWNpYWwgdHJlYXRtZW50IGlz
IHRydWUgcmVnYXJkbGVzcyBvZg0KPiA+Pj4gd2hldGhlciBpbnRlcnJ1cHQgcmVtYXBwaW5nIGlz
IGVuYWJsZWQgKHdoaWNoIGNvbWVzIG9ubHkgYWZ0ZXIgYW4NCj4gPj4+IGludGVycnVwdCBtZXNz
YWdlIHRvIHRoaXMgcmFuZ2UgaXMgcmVjb2duaXplZCkuDQo+ID4+DQo+ID4+IEZvciBteS9vdXIg
ZWR1Y2F0aW9uLCBjb3VsZCB5b3Ugb3V0bGluZSB3aGF0IGhhcHBlbnMgdG8gZGV2aWNlDQo+ID4+
IGFjY2Vzc2VzIHRvIHRoYXQgcmFuZ2Ugd2hlbiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGlzIG9mZj8g
QW5kDQo+ID4+IHBlcmhhcHMgYWxzbyB3aGF0IGhhcHBlbnMgdG8gYWNjZXNzZXMgdG8gdGhpcyBy
YW5nZSB0aGF0IGRvbid0DQo+ID4+IG1hdGNoIHRoZSBwYXR0ZXJuIG9mIGFuIE1TSSBpbml0aWF0
aW9uIChkd29yZCB3cml0ZSk/IEkgZG9uJ3QNCj4gPj4gdGhpbmsgSSd2ZSBiZWVuIGFibGUgdG8g
c3BvdCBhbnl0aGluZyB0byB0aGlzIGVmZmVjdCBpbiB0aGUgZG9jcy4NCj4gPj4NCj4gPg0KPiA+
IEluIFZULWQgc3BlYyAiMy4xNCBIYW5kbGluZyBSZXF1ZXN0cyB0byBJbnRlcnJ1cHQgQWRkcmVz
cyBSYW5nZSINCj4gPiAtLQ0KPiA+IE9uIEludGVswq4gYXJjaGl0ZWN0dXJlIHBsYXRmb3Jtcywg
cGh5c2ljYWwgYWRkcmVzcyByYW5nZSAweEZFRXhfeHh4eCBpcw0KPiA+IGRlc2lnbmF0ZWQgYXMg
dGhlIGludGVycnVwdCBhZGRyZXNzIHJhbmdlLiBSZXF1ZXN0cyB3aXRob3V0IFBBU0lEIHRvDQo+
ID4gdGhpcyByYW5nZSBhcmUgbm90IHN1YmplY3RlZCB0byBETUEgcmVtYXBwaW5nIChldmVuIGlm
IHRyYW5zbGF0aW9uDQo+ID4gc3RydWN0dXJlcyBzcGVjaWZ5IGEgbWFwcGluZyBmb3IgdGhpcyBy
YW5nZSkuDQo+ID4gLS0NCj4gPiBUaGUgZm9sbG93aW5nIHR5cGVzIG9mIHJlcXVlc3RzIHRvIHRo
aXMgcmFuZ2UgYXJlIGlsbGVnYWwgcmVxdWVzdHMuDQo+ID4gVGhleSBhcmUgYmxvY2tlZCBhbmQg
cmVwb3J0ZWQgYXMgSW50ZXJydXB0IFJlbWFwcGluZyBmYXVsdHMuDQo+ID4g4oCiIFJlYWQgcmVx
dWVzdHMgd2l0aG91dCBQQVNJRCB0aGF0IGFyZSBub3QgWkxSLg0KPiA+IOKAoiBBdG9taWNzIHJl
cXVlc3RzIHdpdGhvdXQgUEFTSUQuDQo+ID4g4oCiIE5vbi1EV09SRCBsZW5ndGggd3JpdGUgcmVx
dWVzdHMgd2l0aG91dCBQQVNJRC4NCj4gPiAtLQ0KPiANCj4gQWgsIEkgc2VlLiBUaGF0J3MgKGFj
Y29yZGluZyB0byB0aGUgY2hhbmdlIGJhcnMpIGEgcmVsYXRpdmVseSByZWNlbnQNCj4gYWRkaXRp
b24uIFNvIHRoZSBhYm92ZSBjbGFyaWZpZXMgdGhpbmdzIGZvciB0aGUgIVBBU0lEIGNhc2UuIEFt
IEkNCj4gaW50ZXJwcmV0aW5nDQo+IA0KPiAiUmVxdWVzdHMtd2l0aC1QQVNJRCB3aXRoIGlucHV0
IGFkZHJlc3MgaW4gcmFuZ2UgMHhGRUV4X3h4eHggYXJlDQo+ICB0cmFuc2xhdGVkIG5vcm1hbGx5
IGxpa2UgYW55IG90aGVyIHJlcXVlc3Qtd2l0aC1QQVNJRCB0aHJvdWdoDQo+ICBETUEtcmVtYXBw
aW5nIGhhcmR3YXJlLiBIb3dldmVyLCBpZiBzdWNoIGEgcmVxdWVzdCBpcyBwcm9jZXNzZWQNCj4g
IHVzaW5nIHBhc3MtdGhyb3VnaCB0cmFuc2xhdGlvbiwgaXQgd2lsbCBiZSBibG9ja2VkIGFzIGRl
c2NyaWJlZA0KPiAgaW4gdGhlIHBhcmFncmFwaCBiZWxvdy4NCj4gDQo+ICBTb2Z0d2FyZSBtdXN0
IG5vdCBwcm9ncmFtIHBhZ2luZy1zdHJ1Y3R1cmUgZW50cmllcyB0byByZW1hcCBhbnkNCj4gIGFk
ZHJlc3MgdG8gdGhlIGludGVycnVwdCBhZGRyZXNzIHJhbmdlLiBVbnRyYW5zbGF0ZWQgcmVxdWVz
dHMgYW5kDQo+ICB0cmFuc2xhdGlvbiByZXF1ZXN0cyB0aGF0IHJlc3VsdCBpbiBhbiBhZGRyZXNz
IGluIHRoZSBpbnRlcnJ1cHQNCj4gIHJhbmdlIHdpbGwgYmUgYmxvY2tlZCB3aXRoIGNvbmRpdGlv
biBjb2RlIExHTi40IG9yIFNHTi44Lg0KPiAgVHJhbnNsYXRlZCByZXF1ZXN0cyB3aXRoIGFuIGFk
ZHJlc3MgaW4gdGhlIGludGVycnVwdCBhZGRyZXNzDQo+ICByYW5nZSBhcmUgdHJlYXRlZCBhcyBV
bnN1cHBvcnRlZCBSZXF1ZXN0IChVUikuIg0KPiANCj4gcmlnaHQgaW4gdGhhdCBfd2l0aF8gUEFT
SUQgdHJhbnNsYXRpb24gZW50cmllcyBmb3IgdGhpcyByYW5nZSB3b3VsZA0KPiBzdGlsbCBiZSB1
c2VkLCBzbyBsb25nIGFzIHRoZXkgdHJhbnNsYXRlIHRvIGFuIGFyZWEgb3V0c2lkZSBvZiB0aGUN
Cj4gRkVFeHh4eHggcmFuZ2U/IElmIHNvIHRoaXMgd291bGQgbWVhbiB0aGF0IHdpdGggUEFTSUQg
KHdoZW5ldmVyIHdlDQoNCnllcw0KDQo+IGdldCB0byBlbmFibGluZyB0aGlzIG1vZGUgb2Ygb3Bl
cmF0aW9uKSB3ZSdkIG5lZWQgdG8gYXZvaWQgc2hhcmluZw0KPiBwYWdlIHRhYmxlcywgYW5kIHdl
J2QgbmVlZCB0byBzdXBwcmVzcyBtaXJyb3Jpbmcgb2YgRVBUIGluc2VydGlvbnMNCj4gZm9yIHRo
aXMgcmFuZ2UgaW4gdGhlIElPTU1VIHBhZ2UgdGFibGVzLiAoQWxsIG9mIHRoaXMgaW5kZXBlbmRl
bnQNCj4gb2YgdGhlIHBhcnRpY3VsYXIgY2hvaWNlIG9mIHRoZSBBUElDIGFjY2VzcyBwYWdlLikN
Cj4gDQoNCk9yIHlvdSBjYW4gc3RpbGwgc2hhcmUgcGFnZSB0YWJsZXMgYXMgbG9uZyBhcyBubyBE
TUEgd2lsbCB0YXJnZXQgYXQNCnRoaXMgcmFuZ2UgKHdoaWNoIHNob3VsZCBiZSB0aGUgbm9ybWFs
IGNhc2UgYW5kIGFueSBpbmFkdmVydGVudA0Kb3IgbWFsaWNpb3VzIGF0dGVtcHQgaXMgYmxvY2tl
ZCBhbnl3YXkpLg0KDQoNClRoYW5rcw0KS2V2aW4NCg==

