Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07E3FC046
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 03:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175373.319557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKs8h-00072m-9x; Tue, 31 Aug 2021 01:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175373.319557; Tue, 31 Aug 2021 01:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKs8h-0006xO-6I; Tue, 31 Aug 2021 01:00:35 +0000
Received: by outflank-mailman (input) for mailman id 175373;
 Tue, 31 Aug 2021 01:00:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Op=NW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mKs8f-0006aR-VJ
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 01:00:34 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2bca2c6-9902-4bbc-b847-352bcd15dae9;
 Tue, 31 Aug 2021 01:00:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 18:00:29 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 30 Aug 2021 18:00:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 30 Aug 2021 18:00:29 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 30 Aug 2021 18:00:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 30 Aug 2021 18:00:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 30 Aug 2021 18:00:28 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 01:00:28 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 01:00:28 +0000
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
X-Inumbo-ID: d2bca2c6-9902-4bbc-b847-352bcd15dae9
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="215251221"
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; 
   d="scan'208";a="215251221"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
   d="scan'208";a="576956978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGfejvDrKqrhr86UwL5srymMUyxUI6pxk71woginHJGXtYRITQW2RRVBSGX8nppwhSN3PN5i7lGEMelY5GjKBGdEGWW3WIYdaZFKosYb9avMCumbNG5DaA5drqYZEiy0X82qNqB+OxcROSBGPBze6b/0d0jJ/AF0NBIPtjADVjOjpwIHYpeYdZ/V18PTMSJQRB8NSnc7QgRDpHU9RBxbPrxP63kiNB6k5ZNc/2q4U6c8EcCA7wMaNll8aXXbGWBYn6ZlNIHf4w1LQrXSwCIfMuyIRyStH8Ib1ZjBPBuQ05mQ8CbDGFhvpmGwnLr3ijij3FT3LDPy7RiFFvPKBqGQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp55JUaMS6yw0JgWnAsXUVMp0CyOF5IQ41DEMTcVP7I=;
 b=L3UW8aXeDGjGN2LFQ4kgofr9LT0y7I+wZ9kqLGoC/NwLc4FU6ZKyl9idrFRwdUr8deqi2KmTyfZrkDkhxKs7rO6LP99QfFv0du0yvOBJ3Lt0Us2HkFt2wTj9Yvg+X5LPdxg8t11zDgt2Bm1xJwIKVhokpGBTx2uhhf8YVS7F8qlxp9cvq3Df3GTl6B4dqGq+MH5aySdwsiFhEwJ6MlkKhiWPeldncllJTPFss/EvGT8PYNrAf4e8oGg3JMN6ZB4SgbDTDxyuWj5rPh3GI4g0bBrp6cHm84jpdqPs0I2d2TCykbaM2Vysq6qmXR4y+veYwcuvK96Pw1qm+49OL2I79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp55JUaMS6yw0JgWnAsXUVMp0CyOF5IQ41DEMTcVP7I=;
 b=d3OQQp+VguwCX78XEjyhaezuLDzlVtNffuVmKfCYpd+tEWdkfswjcOwb9h9LVJ6i3BnWdyaX1ydynLw7QsNHAEY+H6aR8xbPEIiwkz83gESEXtJfC+K0u1YPm/zNbxXtTAcFTnWPAoTDc9KB4rEagU5UcjLQakzXkL9HfDILEzg=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH] x86/EPT: drop "tm" field of EPT entry
Thread-Topic: [PATCH] x86/EPT: drop "tm" field of EPT entry
Thread-Index: AQHXnapmw5pEM+l2WEeL0iRylnOjequMy7ww
Date: Tue, 31 Aug 2021 01:00:27 +0000
Message-ID: <BN9PR11MB5433628C2E0E4482F9F1EBBA8CCC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <4e4363ce-fb8a-b2ed-3a01-75efebb3ba3e@suse.com>
In-Reply-To: <4e4363ce-fb8a-b2ed-3a01-75efebb3ba3e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e42777a6-bedc-4a85-e227-08d96c1ab91c
x-ms-traffictypediagnostic: BN9PR11MB5529:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB55299F6EEE9947BF0CCEA4C48CCC9@BN9PR11MB5529.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 26DQ79LjEd4DfM2zo2JPcDigSsZlSCEP8IikvbDSOVebFfSzPMrxMzzoHGmhitzaRouv0J+kTGii5PxCjTATx9k2QOrSs08B/rB0eBbs9t3BqJQknr2Q8FldJbLJmnjhJQgc3Lkth5eqjM6Oxj/YFA47VUGEMSLCDbxGlixmwNn2DU4/97HJvEosw5Bn8Lt2ECWpirB2InxZXQ7ijiYFGW6oEXN84xmvgb/7vsZqhEvYqIuXgHNrlD0yiFVf80rPjAqGv8Rk+kdoOk9BahNqP901TzgRVuuGB4a62G0V9VsVpRmOdnD15m1tBBbuLuFaMFMooHdo/ffEgnpHR8oUKqw/uuODMIhRQe0MTJeShqYqGGHLPTr/fIXzowAovoCBlQV4gr81MghlvxlsqF3Wi2Xp5YTtxPX7DHR7JJN4oO1jLo1HzxW4/gYVx6freaInv+bSgPRAgA/aRYmQ8EJAkITppmrwXptQZMeEcRcoyMNhhwY6oTWgbT/B/9R+ByYw48dkVphdaejFR2XaJUaRYoCL7/B4cDn3SFfUb4v93hjtl8t0bqG7O1f2YKsc+SJYxEQGC/BPNhUpJWinUDEo+GiIUAkwyxocYhdxg0kj6hTUyAsy+O+MHhDFKdirA0yzQqmQpkCXmvCWLTcdaZBY/4znSq6dO7KmTedGfVEN5Re0i2VV/8WgwZP8z2dsn7Kd4lr7PiyXuQec5juwJt7JMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(8676002)(2906002)(478600001)(122000001)(38100700002)(8936002)(83380400001)(4744005)(38070700005)(4326008)(52536014)(5660300002)(7696005)(26005)(71200400001)(66946007)(9686003)(107886003)(55016002)(66556008)(33656002)(316002)(6506007)(110136005)(86362001)(64756008)(66446008)(66476007)(186003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXVDSVVWaDVhT210dWFUSG9yTm1DV1MzZUU4aTJDN2h1NHQ4UzI2MkthR0Ex?=
 =?utf-8?B?QVhHQnV5L0JVbEFzREtEa0dmaXcwRnNSZUVRblBNV2xwaTFuUzRScWx6N1V4?=
 =?utf-8?B?SHJCYktjaFc1eWNmRWFUbG5tVHZrd0pIakZXdXE5LytzTzFMVGNnckRkd01Z?=
 =?utf-8?B?b1pHYjRQYkFuR3ZCUUJ3VTBDblpPbDhLNERwNStwOGF3OEhTOGc4bjhHaGpo?=
 =?utf-8?B?VmdQczFJeUpPbHpyTlBJYWxlWTZWRURhMURzUGt6cVBSZFNyNW9xcTBaUC82?=
 =?utf-8?B?NUloNnFsWFBVazNEa3dmTDNYelE5UTRGeXZNazRkUGhkU2QvVWtMb29aYzlX?=
 =?utf-8?B?bHhXUkRaZ2pLVjkxVHlmK2FQaUV2S3RYeDY1aFVNUVdCd1RSWEZVSmwrSVdw?=
 =?utf-8?B?cG92ZlpqLzRkQ0JqL1ZvOEJwUnN4YmNHaVBEdWJ2cGprZDZncWdWRnAvN1M1?=
 =?utf-8?B?Wlg5R2VNVXh4Y2pWd1ZkV2VpaXM4bFlQSzh2V2p1QzVURXlLNnNBa01ZMGli?=
 =?utf-8?B?SzR2ZjlDWnhhY3FsSUs5aUJVb0N2VCtNaEh5UGlQSVozc0h3Tll1QVpOS2dZ?=
 =?utf-8?B?MHBlN0FTM3gyMUF5SW5ScDRMZmZWcFBsTWlQZ05icW91QktSRktoMmVaZzdD?=
 =?utf-8?B?UEhPdkRZNit0U21Nd2lKVEZ0UmR3TmNrWGc3akY4VGtVb3hhbUlPT1dFcEUv?=
 =?utf-8?B?UXlmTVJHTy9xWlFmcXVJaWhqb3U4a1UwM3hvelIrbU9yYkZJL3BGeGJIZTV6?=
 =?utf-8?B?TU1iOXZXSURiTGRmYWo2STdRWUlPbXQ2STA3bTFJT2pUU0lqUzNEaXZRSDkz?=
 =?utf-8?B?cFpxbGljb3JOQ2Z6Ynd5Tnp3VnNMdkJkL0wwZllUVUNXSHdpZjJsT1N4Y1Y0?=
 =?utf-8?B?eHJsYWVPRVRtYkZzaURmZTYybFlRbCtnek41eW4vc0JCR1BtR2NEVllFeUpN?=
 =?utf-8?B?aVp0Z0FuWkNxeGNNOVF4Qnowd29QR3JtOVVtN2dRMnp6N2ZML3U3aWJRdTVt?=
 =?utf-8?B?OGRtQk9wTEtJSW9JN29ZNXBZUE5Ia0hSeFpOZzZQYmpqZG9FU1d6U3BLeTVN?=
 =?utf-8?B?K1Vsb0EvcXJpejJDMk5RVEYxY05yTVJ2a3FnTndLWkdHRTVDQm1rUVRWMWEz?=
 =?utf-8?B?MnR6SnEwVWFzTEtJekNUWHhrblVyOXVCU0ZqYkp5cnYzYTkvR25mNXRJRUlk?=
 =?utf-8?B?T0RxbFV5UmNFR1pBUUZnT200Q1NFU1kxekZOZ0FxZS96MisvOFpnME1Bc2RW?=
 =?utf-8?B?RU1TRFlEWWRZeUVPSjJFTnc2YmxXaC9vKzdUazdjQjBVNHgzR21aL092WmZa?=
 =?utf-8?B?YUZwd0tlb3dZdzBhSjRHMy9vMkpRVFhOQjdOTmFiVEVGODdWWGJ0NDdNbEQv?=
 =?utf-8?B?RTJjZ3ViUGVKby9KS1Jvd1MvdHFrYmxSZ3BBem8zQmxadFl2WDBFTUQ0cm9Q?=
 =?utf-8?B?T2g1WTF3YVFYL2dIdG5zaGcxWjdReUdVK2trNGJ5NGFLTmpTTktMMHFqbUJq?=
 =?utf-8?B?b3ZRVHRvenVKbEhvanFQeklSZlVncHhDd01wek5JZHJGdndCenFFcTAxSnoy?=
 =?utf-8?B?T3NwUjUrSWxXczRiMjN6UEN4SzVjVHY1WE10cE81UmlnWk1BOGpUaWNQb0Fm?=
 =?utf-8?B?cllodWozZisxQzJOWm1DWUdmUXdOUHlOVVQyM251TS9teElubVd6dG1ibXdY?=
 =?utf-8?B?cVFnUUx1MHFoZ1AzdmRMelkyODFheVVOblZKSHZMTXJTWE15dktlZlA2dG9H?=
 =?utf-8?Q?I+ijq+U19ZUPLYZCGza6QNmD21W4GBcAz4j3Sp+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42777a6-bedc-4a85-e227-08d96c1ab91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 01:00:27.9377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kapp9hNry0wezexC9/IjaMaJsKDRkEE0fWUr5YST6s967pShZSMrxsD6x/T5E1kLbFoAVyGCPeC1p1Hrq4I6qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5529
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXVndXN0IDMwLCAyMDIxIDEwOjIyIFBNDQo+IA0KPiBWVC1kIHNwZWMgMy4yIGNvbnZlcnRlZCB0
aGlzIGJpdCAoYmFjaykgdG8gcmVzZXJ2ZWQuIFNpbmNlIHRoZXJlJ3Mgbm8NCj4gdXNlIG9mIGl0
IGFueXdoZXJlIGluIHRoZSB0cmVlLCBzaW1wbHkgcmVuYW1lIGl0IGFuZCBhZGp1c3QgaXRzIGNv
bW1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0K
PiANCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZteC5oDQo+ICsrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bXguaA0KPiBAQCAtNDYsOCArNDYsNyBAQCB0eXBl
ZGVmIHVuaW9uIHsNCj4gICAgICAgICAgbWZuICAgICAgICAgOiAgIDQwLCAvKiBiaXRzIDUxOjEy
IC0gTWFjaGluZSBwaHlzaWNhbCBmcmFtZSBudW1iZXIgKi8NCj4gICAgICAgICAgc2FfcDJtdCAg
ICAgOiAgIDYsICAvKiBiaXRzIDU3OjUyIC0gU29mdHdhcmUgYXZhaWxhYmxlIDIgKi8NCj4gICAg
ICAgICAgYWNjZXNzICAgICAgOiAgIDQsICAvKiBiaXRzIDYxOjU4IC0gcDJtX2FjY2Vzc190ICov
DQo+IC0gICAgICAgIHRtICAgICAgICAgIDogICAxLCAgLyogYml0IDYyIC0gVlQtZCB0cmFuc2ll
bnQtbWFwcGluZyBoaW50IGluDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2hh
cmVkIEVQVC9WVC1kIHVzYWdlICovDQo+ICsgICAgICAgIF9yc3ZkICAgICAgIDogICAxLCAgLyog
Yml0IDYyIC0gcmVzZXJ2ZWQgKi8NCj4gICAgICAgICAgc3VwcHJlc3NfdmUgOiAgIDE7ICAvKiBi
aXQgNjMgLSBzdXBwcmVzcyAjVkUgKi8NCj4gICAgICB9Ow0KPiAgICAgIHU2NCBlcHRlOw0KDQo=

