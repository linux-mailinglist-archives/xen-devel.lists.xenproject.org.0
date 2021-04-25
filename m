Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BDD36A3E3
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 03:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116966.222869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTRb-0007Op-S8; Sun, 25 Apr 2021 01:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116966.222869; Sun, 25 Apr 2021 01:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laTRb-0007OQ-Ov; Sun, 25 Apr 2021 01:20:19 +0000
Received: by outflank-mailman (input) for mailman id 116966;
 Sun, 25 Apr 2021 01:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSnA=JW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1laTRZ-0007OL-Go
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 01:20:17 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2e02fd6-c2df-46ae-96b0-ccfa22d10ee7;
 Sun, 25 Apr 2021 01:20:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2021 18:20:13 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 24 Apr 2021 18:20:13 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 24 Apr 2021 18:20:12 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 24 Apr 2021 18:20:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sat, 24 Apr 2021 18:20:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sat, 24 Apr 2021 18:20:12 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Sun, 25 Apr
 2021 01:20:07 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 01:20:07 +0000
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
X-Inumbo-ID: b2e02fd6-c2df-46ae-96b0-ccfa22d10ee7
IronPort-SDR: HJDrioq7Pv6+Zh0u7uOwbR6NuIupRut97zA5a+pjw5NnPPm+d8dToX8uCbg2Vre6JQamyY7KQY
 UELNMXqm8xDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9964"; a="196263943"
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="196263943"
IronPort-SDR: cGiTNimvNb28O32//5Xy4w4nLwM7mLWkSJRj0D4uD9QZV2zVV0pjIBZvwTsDLL7Mkwa9ia6R58
 tfP/WWLKAzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="464713636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bk9feyXpqTudJp1Xa9iq64p32OmVQgbBxOdzI/hMq6ugkfi8csQO4DE1FD2LJB45lm5Ui5wbGeuSS35/ocj1QESiZLtQAzD1qrM1JOfwQzFYP7umUVcDUn9VUHaDXZG56rtdwZktLe+r6n4HhwvxagwW+P6EZUWRRfNKvbXyHfAaks35ZPk24QRYOgjot3iANVK9IK66DRlhJhXsR2nlfto3o7mf3eP0gaWoGcpSAzcVzUTol5AeaSX5hVTZPV/zRJaOy+L3RKYAsEu5GKhuG2kjYvpSWJLkLbzqYkiv/WLRc+skrauHwad+KQKWVJ9a+78j2X1u6gtZMjtx08pCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/WSW9N0WNA5Udo4XDhz5W4UR69LQl95DwgYxedeyts=;
 b=D1rF4muYGNMd6eegBRaux6OXzjiM646+P+HYVAKk20s+6n0HVSKMeuR5WxYM2nKjSq5pyMruBZVEkAZd0yHh4ii6kpMKblNwlFnre3FV2Z4iiIMgOTeL4wlUYPZYHHxsyePEGbXs1ydZB06r326/rH35hg18SM4UheIGYb7Lnaw6r1ak4CU5JjvZiRZgGCiUKp3J3cJeXHrGgicBnssg67Me1CepamHlhziDUpyuiuYZzBicjSJJOKxOWxtKAhj5gIFyO+iaIGGWLIdji62Cv/s6LLfKgndivstFXO1N4tZgD+YkFelH3FFYyu4TyAAqbXMY3wh+pGJczUpy9sczKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/WSW9N0WNA5Udo4XDhz5W4UR69LQl95DwgYxedeyts=;
 b=W8d1p5Tl1MHILZsyeepkfbnOEeC7aXSnr/xqM5x3QQLML48XWvNJaxuIMmXk/vMuFXuVSZQFFqhj4BVArB5NbrBismBJIbQkzDU92bB+A7wT4YQSx09E+wBv8+z0d0nfK3Vy5zwnG2AVoVTbArsQ7lGOtzRAGtzRaO8/uOB8Jwg=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Gao, Chao" <chao.gao@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
Thread-Topic: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
Thread-Index: AQHXNde1q1zbhr7NX0K4N/BqLKSfc6q9gkqAgAAIjICAAAq7gIABHqeAgAXCM7A=
Date: Sun, 25 Apr 2021 01:20:07 +0000
Message-ID: <MWHPR11MB1886B6DDB30B81F106A9A1388C439@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <YH7uX7RqqIS4zdBt@Air-de-Roger>
 <3afbdba8-b25c-985c-6c5f-20077cb37d3f@suse.com>
 <YH7+i/JVnmZGTHOF@Air-de-Roger>
 <9276b757-a340-b0f3-3427-13b7bc5dcb9e@suse.com>
In-Reply-To: <9276b757-a340-b0f3-3427-13b7bc5dcb9e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5edef7de-a399-4fbd-ff20-08d907884316
x-ms-traffictypediagnostic: CO1PR11MB4980:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4980A34A19B3068974DDC81A8C439@CO1PR11MB4980.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0H7u+Er5ZjEeQYCIaZdjdD1TsXSx/HpC9hw+0u4mmJuTxs3GHmJi62E+xQosFnAMfFkoyk6AUa/goNrZ967POUWuVy+90n8w0kx3QUHlr5detCzlYLJJaO5hhmHZNWd+lMtv5L8CWM85N/YGoBKao9kSi3eHQ+VsHbBCIxlLN5KpUiQ04CF9ebr3XSMwlEkqP6hK8QM+/AMY1vKlNSD0WSfNeNECb4qz9ApyYV9jfHGWtWTzhXHQHTdgABoj0rUQd3+lM8ZQBdDlOMTJ+iZ/gtSdODJK5HBHcUZEguIWW+jZ7Pt9jG7kBL7eL6jckHN19nwCu9epNX503yU/pDS4G9YINkXTs5QtY0qQGQX92quxAqaCCIEDk0aoWI8MGfJpZIl5YnTFOMgOMa6EMfWKGU+acY0wPBwZ7ZGvBieQOiRp9stwIvlL8ug6exqBac/dPSm7ZgeHNQOx2hUf28e25Omin6YYR1DUSjHEqoqfqDMdWJDy1/16ErwV1+Q3IsN6EtGG1D8D8mcAWM1osnhG8hkppCvSXJAFyfyLGWsN8EQW05W6Gmkw0p0FkuZ4DDH6N++gLzrVOskEr83dgMSSuZj+j6fS05zOB7IOdFQh7I4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(6506007)(53546011)(7696005)(2906002)(83380400001)(86362001)(71200400001)(66556008)(66476007)(64756008)(66946007)(76116006)(66446008)(186003)(5660300002)(52536014)(6636002)(8676002)(38100700002)(8936002)(478600001)(110136005)(4326008)(54906003)(9686003)(55016002)(316002)(122000001)(26005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WkpjZDlzaVlVV3RKMitmUC9QVlJpanVYMVZxNTd3NG9MbTl3R3FSZkN3UTF4?=
 =?utf-8?B?UTRrVVlKYTZqZk8xTVRVSDFRMC9lczV5NFFPLzMveTBVdzFYQ29xbVFwZE1m?=
 =?utf-8?B?cnhSdXJzVWdNVUhlZVlCc3gyQVZ2RGduWC95VytjamIrTUliT2syNU5lT05j?=
 =?utf-8?B?d1BoSW5hRnlOczRjOVFLNFN2bUZGdGZCZ3dJUUxnalo5WVlPdUw0WlhsRk8w?=
 =?utf-8?B?UXBWbUM4UkZUSjk2WFEzRVlDZXNpSk95RFRnWTBGTFhqOTdsV2RqRDFnKzUz?=
 =?utf-8?B?M3pCcE45a0l2QU8yUEVUMVRsbmtzT2Fta1ZMNTJkN2lYSnZzS0JKUzBrOHFw?=
 =?utf-8?B?c3hwbDNycnZsbXpuKzBoVWRFdCtKZms5Tm1kazAzTGZRNm1EbWF3OHBMdjNP?=
 =?utf-8?B?OC9xZDhCeVN4VVVjSzNMKzFrQ000RGoxTWNPQkd0c0hMdVNrSnhzSklkcDdI?=
 =?utf-8?B?RUxhdXdPTWFCcTloMG5rUDBxNGNBOThpTzdsRXEyQjJ0UzB6bE42dkFpV1BG?=
 =?utf-8?B?RTVnZkxucGF0RTdacFVyWTNSS0dhVlVLSUd2ZlhEZm9NMHBXa1EvODlDZE5X?=
 =?utf-8?B?djRHSGpKWC9WcWd3bTNrV0RMbGlVM2tEdUdpeFBmQllPdnNIbjkzQjBtVE9r?=
 =?utf-8?B?anJtY2xEVlNMa1FYN1RyZnVzYllEM3hPeGxBWjBiQmxmR1BSUTVyQ0pEelpi?=
 =?utf-8?B?aVBUTUU0ZStEbGZLdFQ5OXkzTWdDM1BYdjhEd3NPWnFYTms5ZlBEbnNRZk5Q?=
 =?utf-8?B?RWtIckc1bFlDNGZzdS9BWFE3MGpqWVQvaEl1NWVrOVNJUDA4SnFKWEZ2UWps?=
 =?utf-8?B?QS9IS05xNVRHTDZBUnlpRmExU1gyOFJPcG40ZzZ1VDY5YnBYeHZ6c2oxZFpu?=
 =?utf-8?B?djhMSERLQlp6NlpQQSt1bFU1TzB6MDRGTkVQemRjb0FNdE53LzhPS2hnb2pm?=
 =?utf-8?B?TVdnaHlFZ2pIWGRiNHlWNlpLdlRZVzQ4em9aVktYTlgxU3Bob1QxeW1GUkFt?=
 =?utf-8?B?TXRiK1NOM2t4MWFuWFNvMDNGRHFxTlBzSGx2RTcwQ2FCK3UyVjFRaFdJS3Rp?=
 =?utf-8?B?Q2p1aHVsTDNEd2hwRGVsTFE1UWVwR2FieDU1SkhmN3ZzNUR4dWJ2bkMvUHl0?=
 =?utf-8?B?UHZjNXdZSzNiZXVOc1h0aWYrN0crV01KdnVRSUgzaG5zNE5Pc1RWYTJFK2dY?=
 =?utf-8?B?RVN0Uzc4cjNVNFdNdmpGamJqSXpWVGdzdWZWUDZoV01yWUc5UDRoeWZtRmpO?=
 =?utf-8?B?UVBxWmg4ajZwOWozNW5DSmluVUtqZURJU1d6NTlLTlQvREVhZERrSm9qZzFU?=
 =?utf-8?B?TnVnaWRPSno4VHJZcE9jQzczeEx3SlR4ZDJqclo1MWlGUjJhUGp1SE5Pcmdz?=
 =?utf-8?B?Ny95VDJPanYzWGtnNVo4QUVNL3RxZXp3eHdWeEtGUFJVVW1vS051dHlnbHpj?=
 =?utf-8?B?N2dTc0dOV2x4d3hiTENkSGxpYlI2NHA3VHBjVzRodXVEbVZnL1BMYWhqMnN0?=
 =?utf-8?B?Z2FTYnl3ZFJvckJSMTZoeGl1eWNkN24zUXlUL0l6WjJTVXFnbng3aGxlK2li?=
 =?utf-8?B?Zk1DMTRlSFNhc2FuMjc2Qk5peGo2azFrQytlTE1IYkxsT3FUU1BUSWs2RjB1?=
 =?utf-8?B?VFFSNHVoTkF1eWZmaVJudlhmT0dNc1c2TEdSMFlkVHNZM29PRjBRbXFDR2dW?=
 =?utf-8?B?eEQ1dmd0NkFGaTYrcDJhcVBEcXhVcFZLbHpXSGFsN0d5OHJIVXpyL1NYU0dQ?=
 =?utf-8?Q?bk+KjC8pg32FmuMok+WTWfyeiVHFbZtJHX2tgqF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edef7de-a399-4fbd-ff20-08d907884316
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2021 01:20:07.1323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBCLn/IFUS+71msmxkn9AeTk4EmiIRSJE/kg5H8nH9edFdpTRiZK3qyhIz52G847tG+QASEOuzRVHQI/ZObWAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXByaWwgMjEsIDIwMjEgNToyMyBQTQ0KPiANCj4gT24gMjAuMDQuMjAyMSAxODoxNywgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPiBPbiBUdWUsIEFwciAyMCwgMjAyMSBhdCAwNTozODo1
MVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4gT24gMjAuMDQuMjAyMSAxNzowOCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPj4+IE9uIFRodSwgQXByIDAyLCAyMDIwIGF0IDA0
OjA2OjA2QU0gKzA4MDAsIENoYW8gR2FvIHdyb3RlOg0KPiA+Pj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiA+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiA+Pj4+IEBAIC00NDIsNiArNDQyLDIzIEBAIGludCBlbmFi
bGVfcWludmFsKHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11KQ0KPiA+Pj4+ICAgICAgcmV0dXJuIDA7
DQo+ID4+Pj4gIH0NCj4gPj4+Pg0KPiA+Pj4+ICtzdGF0aWMgaW50IHZ0ZF9mbHVzaF9jb250ZXh0
X25vb3Aoc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUsIHVpbnQxNl90DQo+IGRpZCwNCj4gPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHNvdXJjZV9pZCwgdWlu
dDhfdCBmdW5jdGlvbl9tYXNrLA0KPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDY0X3QgdHlwZSwgYm9vbCBmbHVzaF9ub25fcHJlc2VudF9lbnRyeSkNCj4gPj4+
PiArew0KPiA+Pj4+ICsgICAgZHByaW50ayhYRU5MT0dfRVJSIFZURFBSRUZJWCwgIklPTU1VOiBD
YW5ub3QgZmx1c2gNCj4gQ09OVEVYVC5cbiIpOw0KPiA+Pj4+ICsgICAgcmV0dXJuIC1FSU87DQo+
ID4+Pj4gK30NCj4gPj4+PiArDQo+ID4+Pj4gK3N0YXRpYyBpbnQgdnRkX2ZsdXNoX2lvdGxiX25v
b3Aoc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUsIHVpbnQxNl90DQo+IGRpZCwNCj4gPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBhZGRyLCB1bnNpZ25lZCBpbnQg
c2l6ZV9vcmRlciwNCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50
NjRfdCB0eXBlLCBib29sIGZsdXNoX25vbl9wcmVzZW50X2VudHJ5LA0KPiA+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZmx1c2hfZGV2X2lvdGxiKQ0KPiA+Pj4+ICt7
DQo+ID4+Pj4gKyAgICBkcHJpbnRrKFhFTkxPR19FUlIgVlREUFJFRklYLCAiSU9NTVU6IENhbm5v
dCBmbHVzaCBJT1RMQi5cbiIpOw0KPiA+Pj4+ICsgICAgcmV0dXJuIC1FSU87DQo+ID4+Pj4gK30N
Cj4gPj4+DQo+ID4+PiBJIHRoaW5rIEkgd291bGQgYWRkIGFuIEFTU0VSVF9VTlJFQUNIQUJMRSgp
IHRvIGJvdGggbm9vcCBoYW5kbGVycw0KPiA+Pj4gYWJvdmUsIGFzIEkgd291bGQgZXhwZWN0IHRy
eWluZyB0byB1c2UgdGhlbSB3aXRob3V0IHRoZSBwcm9wZXIgbW9kZQ0KPiA+Pj4gYmVpbmcgY29u
ZmlndXJlZCB3b3VsZCBwb2ludCB0byBhbiBlcnJvciBlbHNld2hlcmU/DQo+ID4+DQo+ID4+IElm
IHN1Y2ggYW4gYXNzZXJ0aW9uIHRyaWdnZXJlZCBlLmcuIGR1cmluZyBTMyBzdXNwZW5kL3Jlc3Vt
ZSwgaXQgbWF5DQo+ID4+IGxlYWQgdG8gdGhlIGJveCBzaW1wbHkgbm90IGRvaW5nIGFueXRoaW5n
IHVzZWZ1bCwgd2l0aG91dCB0aGVyZSBiZWluZw0KPiA+PiBhbnkgd2F5IHRvIGtub3cgd2hhdCB3
ZW50IHdyb25nLiBJZiBpbnN0ZWFkIHRoZSBzeXN0ZW0gYXQgbGVhc3QNCj4gPj4gbWFuYWdlZCB0
byByZXN1bWUsIHRoZSBsb2cgbWVzc2FnZSBjb3VsZCBiZSBvYnNlcnZlZC4NCj4gPg0KPiA+IE9o
LCBPSyB0aGVuLiBJJ20gc2ltcGx5IHdvcnJpZWQgdGhhdCBwZW9wbGUgbWlnaHQgaWdub3JlIHN1
Y2ggb25lIGxpbmUNCj4gPiBtZXNzYWdlcywgbWF5YmUgYWRkIGEgV0FSTj8NCj4gDQo+IEhtbSwg
eWVzLCBwZXJoYXBzIC0gd291bGQgYWxsb3cgc2VlaW5nIHJpZ2h0IGF3YXkgd2hlcmUgdGhlIGNh
bGwNCj4gY2FtZSBmcm9tLiBDaGFvLCBJJ2QgYWdhaW4gYmUgZmluZSB0byBmbGlwIHRoZSBkcHJp
bnRrKCktcyB0bw0KPiBXQVJOKCktcyB3aGlsZSBjb21taXR0aW5nLiBCdXQgb2YgY291cnNlIG9u
bHkgcHJvdmlkZWQgeW91IGFuZA0KPiBLZXZpbiAoYXMgdGhlIG1haW50YWluZXIpIGFncmVlLg0K
PiANCg0KTG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPg0K

