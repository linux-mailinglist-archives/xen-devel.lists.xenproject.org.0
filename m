Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12C429CB2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 06:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206719.362357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma9aL-0005AS-U2; Tue, 12 Oct 2021 04:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206719.362357; Tue, 12 Oct 2021 04:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma9aL-000582-QF; Tue, 12 Oct 2021 04:40:17 +0000
Received: by outflank-mailman (input) for mailman id 206719;
 Tue, 12 Oct 2021 04:40:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amut=PA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ma9aJ-00057w-Ra
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 04:40:16 +0000
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5a21374-e404-4a92-82a6-e5f867fb35d4;
 Tue, 12 Oct 2021 04:40:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 21:40:11 -0700
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 11 Oct 2021 21:40:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 21:40:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 21:40:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 21:40:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 21:40:10 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3700.namprd11.prod.outlook.com (2603:10b6:408:89::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 04:40:07 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%9]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 04:40:07 +0000
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
X-Inumbo-ID: d5a21374-e404-4a92-82a6-e5f867fb35d4
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="225811169"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="225811169"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="524068733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxKrZia/TlW9aexlPblbb/Xq6NtzR1TadVkbr9Y8647Lg8t2UOG/pwvvm/uzFQY2t06f6jkyZj91x9YygPc+AxDPxD/KZjWGglQlqq/loAzvA/xqg9SZz+G3FFkuC++tuRomuCD+0x22NJKenwFJIaAMSKGgvpSTDHC+ZtwrI2dM3q6ST7GvKv7N5t9UNpC8nM8yhywLz/LvvBlCq8P7ruce0Gm1466ajhHe1xn6KyRuOObsytIFd3NT7bXboATdPycPpzHntyhFlPr0FOXCXI+/+y28lgWMrwDeN9SaH0XjcVhkNNu4HG9REMeEWkXpmqW6MY08P5YVaC59lMtrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCFKs9erdRcacidxxprgWQWJ+ULIZ4pcgNIxefaRizA=;
 b=GORpbdqm43rFEtd0Qrv9cSHID6fDD+gJXj6g0Aya8Blu/YgUL/VzZkpJW+fhsRoe86gnbJYn68BsB+hAlQO94532V5xgtUPi8V/qWlTIX2L46jMUlddGBKFeyF0DPAXw0pk8rvT5HeADdmni8OVIanuQ5aEBdDh65C+zd84N8nXB5y7DQ73DsfOl/vXhziG9phM6PCp81oSgqkr3TnDgo1gaM2FH3AVbgb87FHij5DgRtVH6OYVjjErMnixXjfRoZm58kvTzMCkmOf/5k3W1by0CwDRYMRr/zdnquB2Tj0m0yZRbIwHowPClcly/k27Ld0dZqXTYdljJNZHuhRT3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCFKs9erdRcacidxxprgWQWJ+ULIZ4pcgNIxefaRizA=;
 b=ltlAlQ2RPXpi7WUsStNrF9q9LHgFA1CIMpee0Zz9PcpnGKFQzPQ31eJXUMkMCqBXbSRwKwRm/D+lmWmZFt3VM9LCpssmPG2MS+VH9TTHDqmZyLHtOf+mZep8n97o7EZ5bRj6U380LoLHjiBBdWXLR186FxyWZek/9rKJ8Vc5A2k=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>
Subject: RE: [PATCH 2/2] VT-d: Tylersburg isoch DMAR unit with no TLB space
Thread-Topic: [PATCH 2/2] VT-d: Tylersburg isoch DMAR unit with no TLB space
Thread-Index: AQHXvnz7yqUSecH0tE2jO7udKupRsKvOx/6Q
Date: Tue, 12 Oct 2021 04:40:07 +0000
Message-ID: <BN9PR11MB54332C8D22C30EBF151133338CB69@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
 <a385938d-243e-1790-da1f-be7c4f5f2c3f@suse.com>
In-Reply-To: <a385938d-243e-1790-da1f-be7c4f5f2c3f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13ef5e4e-37c2-45e0-0e01-08d98d3a5e35
x-ms-traffictypediagnostic: BN8PR11MB3700:
x-microsoft-antispam-prvs: <BN8PR11MB3700472FB1E663ACECC85F268CB69@BN8PR11MB3700.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qr9sdjAJ3/x4YNdt5+ntAn3dRi2u+wTK9CVi9PoC1u09RUIfJZouCeoka98DJ3o7hABnoqUe94vhPoePgzJWJVxMCWMp3Byk+9XFmyu4kHGBZqfGJEvcqnjMUWGnVhz2NPp2yox2iQx27aUGn3/Ym9JMMxhkgGMp6iO2PnebGBkLVYnq4L0MBwhm+jNPvB/Tg+/fctrMzxy050kuhzkb7rnyIR0pAv08eS+e9RVYRcicX33DgBEOhChTJ0GnhHb3oPdhPHljej+ttkLFrxz81/cAtvx16cr+YHhJ91YqCftk96i+c8/XNa+Dmj4cLz03EbuRWcaAEtv3W16pSmZvdTNKk6NGhg0TYBK0Jm0cP4w+O+kV3BxUO7ZWqR8iXvF1Wl7IGPgPzOF5ofSsDnjMubmMcnxr8OT1JJtZ/rzYypEhd5yGTTWRnV5BgveDiDc/tZf7TCscC1Kh+0zmTEVq7TEXGdK08/l6zr3FQ0y0K7TBSQ4ZJv2Y2IrEuZ/1BvhGS3J4iqE65mM0sez9oKgGtX63SKIODXN24kiGx7VhrvKa7SmO+6OTgRUBfpT65QN4MWqtpF/NQN3yg8+G5W9YgLDvZyDQUQeMpClQsnmjC0txQeRqjgs8qykQ+328U4gYHFelGsB5AlooPN68ORMMXI7P2KSMUz9/7k2xpCrHkQxTYdiF7BNJI3NKLdu/49CpWoWYGaNl9hsV9l5hikEJGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(2906002)(64756008)(66556008)(71200400001)(6506007)(7696005)(186003)(26005)(38100700002)(83380400001)(66446008)(9686003)(122000001)(76116006)(38070700005)(86362001)(316002)(66476007)(8676002)(5660300002)(4326008)(508600001)(110136005)(33656002)(66946007)(55016002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WncwclI5Zy9ObTJ3ekhYd3RpakZuRTVjenhlM0prWTRiNXB2aUVrODJWSC9X?=
 =?utf-8?B?czV2eFVzZzQrWGsxTkRzVE8yeFZ2WGMzRTcwN2JLWm9CWHFuSWxxMTc0RGNz?=
 =?utf-8?B?bjlHTVRsVUs1STJDWkUwRzN2aTNMR3lBSm5DK3BIMjdzVjJkWXo3bE02c3pG?=
 =?utf-8?B?YlNMYlB3V3ZqTCs5d1F6NjNnRnJYQXRFd1pXWWJxZHN4YkZ4blJ5cVk4M29h?=
 =?utf-8?B?eitHc0lnWElKbVZaK1Q4SmUycVFJRnhETWd5dVlac1ZWMTRKWEpQaXZZZVJt?=
 =?utf-8?B?SlVPckpLc3Nwc0l2NDRTWDdsWWMydkZ6VHJVMzV2UlQvYjBCMitxQmxNOVpI?=
 =?utf-8?B?TGJXZ3V0OHlyemw0bnhPSFVzU2VCTGQwTWh4QTBLSWNMa0RHblZERE9LOVlU?=
 =?utf-8?B?dzJ2cjBManVOMk5hRU5zVmJZKyt5TUFsNm9ORHRPRVdaR01lVnJ3WVVadW91?=
 =?utf-8?B?dnBtMmFQQTBGTWFkUEVCSjVLWUNzb2RUY3FUZHFmVCt1VDRIeUJjS2ROQUI3?=
 =?utf-8?B?TDJXYUhSblh2MUsxRWZRME5tMjE0UlhJSTNiNlN1TnJCMCtnakVNQjdvZmpm?=
 =?utf-8?B?RGV0WGNGYzd4UW5nZFc3c0dWM0tzbytQelZaR3RjSVhvUE5iRFlTTWJEcGtV?=
 =?utf-8?B?YjlibXpPRWF0MHZuYTBFbUFmQTlNUE1FdWdsdXpnWUZCU3ltYy9sOWZ6SC8z?=
 =?utf-8?B?bEhNNGd2Y2FWRTBPZ010V29SbnI5ZStKOWx0QUZUQ25DaFZObE1HNzJ2dlJu?=
 =?utf-8?B?a2xRWFRwUVQ0Y1dqeTJGUG5rQlVNY0hkRHNranpzVXNaSDFNTlArQVRHWUtz?=
 =?utf-8?B?Rmg1SnZjd1VxUHhXNlpKNzJueHN4NmphM3c3Z3p5aTY3UGR1dDZBamd4WUxK?=
 =?utf-8?B?NlJ4SW9jK3ZESGFtYjQrV0k4OTFEUlFSSDFTdHl1UzhJUStvUElRbnR6UkNZ?=
 =?utf-8?B?bXhwcmltaVh0YTJmWURNRkdUeHdDbThmS2RzR3BMS0JhdGxzc3dtUXgwNUxl?=
 =?utf-8?B?TkhTbHJiR3NibDlsRDBrYTlTUSt0WGFVb3lCUlRrQmpOQzYxSWVKR3NlK0s3?=
 =?utf-8?B?dWNVald3K2lsYXdJVHJpRG9YRk9nOWNCeVB0TmE5ZXgxd29WUkd4WjEzTDBG?=
 =?utf-8?B?YXdHL2VlT0M4Q2J6cVNhbHY4RmRsTEh0TEVNa2twU28wTFJzOXBYdGZiSHBQ?=
 =?utf-8?B?R2lTZDdyQmQwMnFocjZEWjBWSGpoWVJFNmxTVDd5c1c3S1Z1UEgxNzY0UXpV?=
 =?utf-8?B?WVhIWVNTemxuT09DVENMMHMvNTFoOXhpL0FZYTZvc3dDS3dRTTlsQThXV3Na?=
 =?utf-8?B?RHlsdjQ1NWhHUCtaeTlIeGwyWFB6UWNUamt6RUg3WmtlZklhYnY1QkhCSXE3?=
 =?utf-8?B?Nlc2Y2RLMzBwRjhDb3lXb0lKQVpEYzN2WDRrOUFuUWpzQTh0YWcwbDlNYkJQ?=
 =?utf-8?B?QytIeUFVcWFyUmpNL0lzUlV3VUQ2bFBCUDBka3lkSWdVdjlCcnhPRWlKb2VX?=
 =?utf-8?B?YkxCNGNiT0wvdmUzRU81MTBMZWlocmtxbktCdVNQaG1jM2dXZllxc2Y3eTkw?=
 =?utf-8?B?aGZhOEM5SWI3VjVOR3djbTV1RHFmZURkVnBhaXVEWnYvUmNNOFlnSGFDQ2lt?=
 =?utf-8?B?aFFOd2Q3eHhFVTNqcHBwNHZib3VSWGRtNjRJNEt6WU5tYjZaZzlYM096cDZO?=
 =?utf-8?B?cFhMR2pTSXUreG9Nd3BoOWs2anFsYy9oU1gxVVgzUWVSNjZlVVdRbThnamVs?=
 =?utf-8?Q?eLj8x08ewIQjUfhgGXGPEeeUR+HpyF4JMj/RWpe?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ef5e4e-37c2-45e0-0e01-08d98d3a5e35
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 04:40:07.7352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUWJEItk0PR9IC1w74wJhmLVsInXbeWVW0sB8M0E6gdCGR/w9O1NBd0qt+206je44m6QwSEYaCzrqqS+0sGuGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3700
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
T2N0b2JlciAxMSwgMjAyMSA0OjUwIFBNDQo+IA0KPiBCSU9TZXMsIHdoZW4gZW5hYmxpbmcgdGhl
IGRlZGljYXRlZCBETUFSIHVuaXQgZm9yIHRoZSBzb3VuZCBkZXZpY2UsDQo+IG5lZWQgdG8gYWxz
byBzZXQgYSBub24temVybyBudW1iZXIgb2YgVExCIGVudHJpZXMgaW4gYSByZXNwZWN0aXZlDQo+
IHN5c3RlbSBtYW5hZ2VtZW50IHJlZ2lzdGVyIChWVElTT0NIQ1RSTCkuIEF0IGxlYXN0IG9uZSBC
SU9TIGlzIGtub3duDQo+IHRvIGZhaWwgdG8gZG8gc28sIGNhdXNpbmcgdGhlIFZULWQgZW5naW5l
IHRvIGRlYWRsb2NrIHdoZW4gdXNlZC4NCj4gDQo+IFZhZ3VlbHkgYmFzZWQgb24gTGludXgnZXMg
ZTBmYzdlMGI0YjVlICgiaW50ZWwtaW9tbXU6IFlldCBhbm90aGVyIEJJT1MNCj4gd29ya2Fyb3Vu
ZDogSXNvY2ggRE1BUiB1bml0IHdpdGggbm8gVExCIHNwYWNlIikuDQo+IA0KPiBUbyBsaW1pdCBt
ZXNzYWdlIHN0cmluZyByZWR1bmRhbmN5LCBmb2xkIHBhcnRzIHdpdGggdGhlIElHRCBxdWlyayBs
b2dpYy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gLS0tDQo+IFJGQzogVGhpcyByZXF1aXJlcyBNTUNGRyBhdmFpbGFiaWxpdHkgYmVmb3Jl
IERvbTAgc3RhcnRzIHVwLCB3aGljaCBpcw0KPiAgICAgIG5vdCBnZW5lcmFsbHkgZ2l2ZW4uIFdl
IG1heSB3YW50L25lZWQgdG8gZS5nLiAoYWIpdXNlIHRoZQ0KPiAgICAgIC5lbmFibGVfZGV2aWNl
KCkgaG9vayB0byBhY3R1YWxseSBkaXNhYmxlIHRyYW5zbGF0aW9uIGlmIE1NQ0ZHDQo+ICAgICAg
YWNjZXNzZXMgYmVjb21lIGF2YWlsYWJsZSBvbmx5IGluIHRoZSBjb3Vyc2Ugb2YgRG9tMCBib290
aW5nLg0KDQptYWtlIHNlbnNlDQoNCj4gUkZDOiBXaGlsZSBmb2xsb3dpbmcgTGludXggaW4gdGhp
cyByZWdhcmQsIEknbSBub3QgY29udmluY2VkIG9mIGlzc3VpbmcNCj4gICAgICB0aGUgd2Fybmlu
ZyBhYm91dCB0aGUgbnVtYmVyIG9mIFRMQiBlbnRyaWVzIHdoZW4gZmlybXdhcmUgc2V0IG1vcmUN
Cj4gICAgICB0aGFuIDE2IChJIGNhbiBvYnNlcnZlIDIwIG9uIHRoZSBvbiBtYXRjaGluZyBzeXN0
ZW0gSSBoYXZlIGFjY2Vzcw0KPiAgICAgIHRvLikNCg0KbWUgZWl0aGVyLiBTaW5jZSB5b3UgYWxy
ZWFkeSBvYnNlcnZlZCAyMCBvbiBvbmUgc3lzdGVtLCBjaGFuZ2luZyB0aGUNCmNoZWNrIHRvID49
MTYgbWFrZXMgbW9yZSBzZW5zZS4NCg0KVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZToNCg0KCVJl
dmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiANCj4gSSBh
c3N1bWUgYW4gaW1wbGljYXRpb24gaXMgdGhhdCB0aGUgZGV2aWNlIGluIHRoaXMgY2FzZSB0aGVu
IG1heSBub3QgYmUNCj4gcGFzc2VkIHRocm91Z2ggdG8gZ3Vlc3RzLCBidXQgSSBkb24ndCBzZWUg
dXMgZW5mb3JjaW5nIHRoZSBzYW1lIGFueXdoZXJlDQo+IGZvciBncmFwaGljcyBkZXZpY2VzIHdo
ZW4gIm5vLWlnZngiIGlzIGluIHVzZS4gWWV0IGhlcmUgSSB3b3VsZCB3YW50IHRvDQo+IGZvbGxv
dyB3aGF0ZXZlciBwcmUtZXhpc3RpbmcgbW9kZWwgLi4uDQo+IA0KPiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvZXh0ZXJuLmgNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2V4dGVybi5oDQo+IEBAIC0xMDAsNiArMTAwLDcgQEAgaW50IG1zaV9tc2dfd3JpdGVf
cmVtYXBfcnRlKHN0cnVjdCBtc2lfZA0KPiAgaW50IGludGVsX3NldHVwX2hwZXRfbXNpKHN0cnVj
dCBtc2lfZGVzYyAqKTsNCj4gDQo+ICBpbnQgaXNfaWdkX3Z0X2VuYWJsZWRfcXVpcmsodm9pZCk7
DQo+ICtib29sIGlzX2F6YWxpYV90bGJfZW5hYmxlZChjb25zdCBzdHJ1Y3QgYWNwaV9kcmhkX3Vu
aXQgKik7DQo+ICB2b2lkIHBsYXRmb3JtX3F1aXJrc19pbml0KHZvaWQpOw0KPiAgdm9pZCB2dGRf
b3BzX3ByZWFtYmxlX3F1aXJrKHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11KTsNCj4gIHZvaWQgdnRk
X29wc19wb3N0YW1ibGVfcXVpcmsoc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUpOw0KPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtNzUwLDI3ICs3NTAsNDMgQEAgc3RhdGljIHZv
aWQgaW9tbXVfZW5hYmxlX3RyYW5zbGF0aW9uKHN0cg0KPiAgICAgIHUzMiBzdHM7DQo+ICAgICAg
dW5zaWduZWQgbG9uZyBmbGFnczsNCj4gICAgICBzdHJ1Y3QgdnRkX2lvbW11ICppb21tdSA9IGRy
aGQtPmlvbW11Ow0KPiArICAgIHN0YXRpYyBjb25zdCBjaGFyIGNyYXNoX2ZtdFtdID0gIiVzOyBj
cmFzaCBYZW4gZm9yIHNlY3VyaXR5IHB1cnBvc2VcbiI7DQo+IA0KPiAgICAgIGlmICggZHJoZC0+
Z2Z4X29ubHkgKQ0KPiAgICAgIHsNCj4gKyAgICAgICAgc3RhdGljIGNvbnN0IGNoYXIgZGlzYWJs
ZV9mbXRbXSA9IFhFTkxPR19XQVJOSU5HIFZURFBSRUZJWA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIiAlczsgZGlzYWJsaW5nIElHRCBWVC1kIGVuZ2luZVxu
IjsNCj4gKw0KPiAgICAgICAgICBpZiAoICFpb21tdV9pZ2Z4ICkNCj4gICAgICAgICAgew0KPiAt
ICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPIFZURFBSRUZJWA0KPiAtICAgICAgICAgICAg
ICAgICAgICJQYXNzZWQgaW9tbXU9bm8taWdmeCBvcHRpb24uICBEaXNhYmxpbmcgSUdEIFZULWQg
ZW5naW5lLlxuIik7DQo+ICsgICAgICAgICAgICBwcmludGsoZGlzYWJsZV9mbXQsICJwYXNzZWQg
aW9tbXU9bm8taWdmeCBvcHRpb24iKTsNCj4gICAgICAgICAgICAgIHJldHVybjsNCj4gICAgICAg
ICAgfQ0KPiANCj4gICAgICAgICAgaWYgKCAhaXNfaWdkX3Z0X2VuYWJsZWRfcXVpcmsoKSApDQo+
ICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHN0YXRpYyBjb25zdCBjaGFyIG1zZ1tdID0gImZp
cm13YXJlIGRpZCBub3QgZW5hYmxlIElHRCBmb3IgVlQNCj4gcHJvcGVybHkiOw0KPiArDQo+ICAg
ICAgICAgICAgICBpZiAoIGZvcmNlX2lvbW11ICkNCj4gLSAgICAgICAgICAgICAgICBwYW5pYygi
QklPUyBkaWQgbm90IGVuYWJsZSBJR0QgZm9yIFZUIHByb3Blcmx5LCBjcmFzaCBYZW4gZm9yDQo+
IHNlY3VyaXR5IHB1cnBvc2VcbiIpOw0KPiArICAgICAgICAgICAgICAgIHBhbmljKGNyYXNoX2Zt
dCwgbXNnKTsNCj4gDQo+IC0gICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgVlREUFJF
RklYDQo+IC0gICAgICAgICAgICAgICAgICAgIkJJT1MgZGlkIG5vdCBlbmFibGUgSUdEIGZvciBW
VCBwcm9wZXJseS4gIERpc2FibGluZyBJR0QgVlQtZA0KPiBlbmdpbmUuXG4iKTsNCj4gKyAgICAg
ICAgICAgIHByaW50ayhkaXNhYmxlX2ZtdCwgbXNnKTsNCj4gICAgICAgICAgICAgIHJldHVybjsN
Cj4gICAgICAgICAgfQ0KPiAgICAgIH0NCj4gDQo+ICsgICAgaWYgKCAhaXNfYXphbGlhX3RsYl9l
bmFibGVkKGRyaGQpICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHN0YXRpYyBjb25zdCBjaGFyIG1z
Z1tdID0gImZpcm13YXJlIGRpZCBub3QgZW5hYmxlIFRMQiBmb3Igc291bmQNCj4gZGV2aWNlIjsN
Cj4gKw0KPiArICAgICAgICBpZiAoIGZvcmNlX2lvbW11ICkNCj4gKyAgICAgICAgICAgIHBhbmlj
KGNyYXNoX2ZtdCwgbXNnKTsNCj4gKw0KPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcg
VlREUFJFRklYICIgJXM7IGRpc2FibGluZyBJU09DSCBWVC1kDQo+IGVuZ2luZVxuIiwNCj4gKyAg
ICAgICAgICAgICAgIG1zZyk7DQo+ICsgICAgICAgIHJldHVybjsNCj4gKyAgICB9DQo+ICsNCj4g
ICAgICAvKiBhcHBseSBwbGF0Zm9ybSBzcGVjaWZpYyBlcnJhdGEgd29ya2Fyb3VuZHMgKi8NCj4g
ICAgICB2dGRfb3BzX3ByZWFtYmxlX3F1aXJrKGlvbW11KTsNCj4gDQo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xdWlya3MuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvcXVpcmtzLmMNCj4gQEAgLTEwMCw2ICsxMDAsNjkgQEAgc3RhdGljIHZvaWQgX19p
bml0IGNhbnRpZ2FfYjNfZXJyYXRhX2luaQ0KPiAgICAgICAgICBpc19jYW50aWdhX2IzID0gMTsN
Cj4gIH0NCj4gDQo+ICsvKg0KPiArICogUVVJUksgdG8gd29yayBhcm91bmQgY2VydGFpbiBCSU9T
ZXMgZW5hYmxpbmcgdGhlIElTT0NIIERNQVIgdW5pdCBmb3INCj4gdGhlDQo+ICsgKiBBemFsaWEg
c291bmQgZGV2aWNlLCBidXQgbm90IGdpdmluZyBpdCBhbnkgVExCIGVudHJpZXMsIGNhdXNpbmcg
aXQgdG8NCj4gKyAqIGRlYWRsb2NrLg0KPiArICovDQo+ICtib29sIGlzX2F6YWxpYV90bGJfZW5h
YmxlZChjb25zdCBzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQgKmRyaGQpDQo+ICt7DQo+ICsgICAgcGNp
X3NiZGZfdCBzYmRmOw0KPiArICAgIHVuc2lnbmVkIGludCB2dGlzb2NoY3RybDsNCj4gKw0KPiAr
ICAgIC8qIE9ubHkgZGVkaWNhdGVkIHVuaXRzIGFyZSBvZiBpbnRlcmVzdC4gKi8NCj4gKyAgICBp
ZiAoIGRyaGQtPmluY2x1ZGVfYWxsIHx8IGRyaGQtPnNjb3BlLmRldmljZXNfY250ICE9IDEgKQ0K
PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gKw0KPiArICAgIC8qIENoZWNrIGZvciB0aGUgc3Bl
Y2lmaWMgZGV2aWNlLiAqLw0KPiArICAgIHNiZGYgPSBQQ0lfU0JERjIoZHJoZC0+c2VnbWVudCwg
ZHJoZC0+c2NvcGUuZGV2aWNlc1swXSk7DQo+ICsgICAgaWYgKCBwY2lfY29uZl9yZWFkMTYoc2Jk
ZiwgUENJX1ZFTkRPUl9JRCkgIT0gUENJX1ZFTkRPUl9JRF9JTlRFTCB8fA0KPiArICAgICAgICAg
cGNpX2NvbmZfcmVhZDE2KHNiZGYsIFBDSV9ERVZJQ0VfSUQpICE9IDB4M2EzZSApDQo+ICsgICAg
ICAgIHJldHVybiB0cnVlOw0KPiArDQo+ICsgICAgLyogQ2hlY2sgZm9yIHRoZSBjb3JyZXNwb25k
aW5nIFN5c3RlbSBNYW5hZ2VtZW50IFJlZ2lzdGVycyBkZXZpY2UuICovDQo+ICsgICAgc2JkZiA9
IFBDSV9TQkRGKGRyaGQtPnNlZ21lbnQsIDAsIDB4MTQsIDApOw0KPiArICAgIGlmICggcGNpX2Nv
bmZfcmVhZDE2KHNiZGYsIFBDSV9WRU5ET1JfSUQpICE9IFBDSV9WRU5ET1JfSURfSU5URUwgfHwN
Cj4gKyAgICAgICAgIHBjaV9jb25mX3JlYWQxNihzYmRmLCBQQ0lfREVWSUNFX0lEKSAhPSAweDM0
MmUgKQ0KPiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gKw0KPiArICAgIHZ0aXNvY2hjdHJsID0g
cGNpX2NvbmZfcmVhZDMyKHNiZGYsIDB4MTg4KTsNCj4gKyAgICBpZiAoIHZ0aXNvY2hjdHJsID09
IDB4ZmZmZmZmZmYgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5H
IFZURFBSRUZJWA0KPiArICAgICAgICAgICAgICAgIiBDYW5ub3QgYWNjZXNzIFZUSVNPQ0hDVFJM
IGF0IHRoaXMgdGltZVxuIik7DQo+ICsgICAgICAgIHJldHVybiB0cnVlOw0KPiArICAgIH0NCj4g
Kw0KPiArICAgIC8qDQo+ICsgICAgICogSWYgQXphbGlhIERNQSBpcyByb3V0ZWQgdG8gdGhlIG5v
bi1pc29jaCBETUFSIHVuaXQsIHRoYXQncyBmaW5lIGluDQo+ICsgICAgICogcHJpbmNpcGxlLCBi
dXQgbm90IGNvbnNpc3RlbnQgd2l0aCB0aGUgQUNQSSB0YWJsZXMuDQo+ICsgICAgICovDQo+ICsg
ICAgaWYgKCB2dGlzb2NoY3RybCAmIDEgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgcHJpbnRrKFhF
TkxPR19XQVJOSU5HIFZURFBSRUZJWA0KPiArICAgICAgICAgICAgICAgIiBJbmNvbnNpc3RlbmN5
IGJldHdlZW4gY2hpcHNldCByZWdpc3RlcnMgYW5kIEFDUEkgdGFibGVzXG4iKTsNCj4gKyAgICAg
ICAgcmV0dXJuIHRydWU7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgLyogRHJvcCBhbGwgYml0cyBv
dGhlciB0aGFuIHRoZSBudW1iZXIgb2YgVExCIGVudHJpZXMuICovDQo+ICsgICAgdnRpc29jaGN0
cmwgJj0gMHgxYzsNCj4gKw0KPiArICAgIC8qIElmIHdlIGhhdmUgdGhlIHJlY29tbWVuZGVkIG51
bWJlciBvZiBUTEIgZW50cmllcywgZmluZS4gKi8NCj4gKyAgICBpZiAoIHZ0aXNvY2hjdHJsID09
IDE2ICkNCj4gKyAgICAgICAgcmV0dXJuIHRydWU7DQo+ICsNCj4gKyAgICAvKiBaZXJvIFRMQiBl
bnRyaWVzPyAqLw0KPiArICAgIGlmICggIXZ0aXNvY2hjdHJsICkNCj4gKyAgICAgICAgcmV0dXJu
IGZhbHNlOw0KPiArDQo+ICsgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HIFZURFBSRUZJWA0KPiAr
ICAgICAgICAgICAiIFJlY29tbWVuZGVkIFRMQiBlbnRyaWVzIGZvciBJU09DSCB1bml0IGlzIDE2
OyBmaXJtd2FyZSBzZXQgJXVcbiIsDQo+ICsgICAgICAgICAgIHZ0aXNvY2hjdHJsKTsNCj4gKw0K
PiArICAgIHJldHVybiB0cnVlOw0KPiArfQ0KPiArDQo+ICAvKiBjaGVjayBmb3IgU2FuZHlicmlk
Z2UgSUdEIGRldmljZSBJRCdzICovDQo+ICBzdGF0aWMgdm9pZCBfX2luaXQgc25iX2VycmF0YV9p
bml0KHZvaWQpDQo+ICB7DQoNCg==

