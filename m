Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6044FE1A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 06:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225633.389667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUJg-0002WL-Ao; Mon, 15 Nov 2021 05:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225633.389667; Mon, 15 Nov 2021 05:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUJg-0002UZ-7C; Mon, 15 Nov 2021 05:14:04 +0000
Received: by outflank-mailman (input) for mailman id 225633;
 Mon, 15 Nov 2021 05:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmUJf-0002Sp-0O
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 05:14:03 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5bae11d-45d2-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 06:14:00 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 21:13:56 -0800
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2021 21:13:56 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:13:56 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:13:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 21:13:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 21:13:55 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN7PR11MB2691.namprd11.prod.outlook.com (2603:10b6:406:b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 05:13:55 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 05:13:54 +0000
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
X-Inumbo-ID: d5bae11d-45d2-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="233218800"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="233218800"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="493864352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O36v7nDqOIFVgztKjZYKRMIvr2cW20kh4X1V9XexGFVz539C+i7lf7lOR55h2lkwzp+vip2209E7EV6lrOVFZ4qGE/UIeZFziXi7mwo6z5+mCvsgM3NRzyy0g43enwQ/wz9gMLHGQrl7cmAiAGBvgUEXXQxt9o/hevpMvvx4/AXtfQOEYSlaoU4L0IXfvVVWiwKcQVdrUcfddQvxRVPd1x5mv1GMAUgqmHngDl9HB4qi8xgpdKRrCCVBW5mcd6w04Pgry027P/4PQf+oa6CcLuBp6DJS0PZWF/J4RksAKIKOhiulsa7HVCTygzMUsoeowGyH6plChY55THsvTlT2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OvxWANLY4ZhdFsKuZCudz0CT8lIX9H8Zg1dwgSlKdQ=;
 b=gpc6yi2y8rFodNqDLGoHq292sU2D+cQLCng3MMo9NbKbFk05b43KO9OUv3J9aRriQtwwdvMS+vPIUuKVN0w18Lbgbg+6F5sVdqwjj1gHZvM1FlilHDapdJSxl7JFq0I/KFlqB3mV2A5/AdsbD8Zeiz47+B7nooHOSKB72p7A6GvXALDZM0od6Yhe5axubC3rH/SI1Ri545H22iPD7issW+g5U9zfn0EZe6UH2bkw3E5Nz7mXnTWpAl4taeB2a0p1iDLdG31BpUBIyV1jXAJCATP2X/m9dFZJn0NwXgEAXhFYr/GnlF0djt4D3FEXGYqz0ntU9DTc0yCYRx1l05iYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OvxWANLY4ZhdFsKuZCudz0CT8lIX9H8Zg1dwgSlKdQ=;
 b=jcQztA+7gSc9wKxKKiEweMJkdqDprM1f+4CASdYaFb3jEW9WOwj/ALZlnUm/mvl14GjNyCCtvtXRCYVMX4nKsheZnCkw/AdpXn4wdZhIuXwNnK1zykuunZy02dGteIDTTHC+vmSeIuAEruqP6/sWUH9+XeDGA/xChJ48lRipSuI=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Thread-Topic: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Thread-Index: AQHX16ptxP2kemn3HkOptj6NHfmn+qwED8FA
Date: Mon, 15 Nov 2021 05:13:54 +0000
Message-ID: <BN9PR11MB5433B6BF87871527DE20B3448C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
In-Reply-To: <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63b73c85-e5dc-4baf-d743-08d9a7f6b88f
x-ms-traffictypediagnostic: BN7PR11MB2691:
x-microsoft-antispam-prvs: <BN7PR11MB2691172FA18A43604D6E0A128C989@BN7PR11MB2691.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: blZZkllCPhNjIMwh0f7DgJqXB9NYhrk4f+3uOMdGfLsBPKfYJlW84y38FhmhVvzXHTR3jWCjpOMUO1JaVOPP53IWfBW6TLk3S0dw0hagqi2u2/oVbtW37GcKwU4OhPSGgDzc7t/Y9ZBJ1KSxEeH8V9iPZjbOXabjTicArLmYJF6hXtzOcaAaZKBwv1inEp64VR8mckKAgDKTYxt96SYGqVQ6q/w5YNobNEGbY++hs3O4siMrU1gMaB8eSqvn50/dy3MjUmwCr12RCn2vU1uIyb+Jm4zu/lxG3zVf2LeFbKSAElQOYdiPnmeWXAgdum7EwN4WcbgHUBW4xDJmnd5ELxvwSO5RnouLBbklrw1YOIkDEaxp8wYVMDyat6I885SdzVxdPzOoOsG6OOSXt9urGAbeDZnbsNlj5cKA/iInmIezMn76nIebXzYhluE2/gfEZZJJDGOHYei2bzqVsXnLHMlsRmYmnY6W//bgWvCqrZk+RYNcEBGvL+QR5W2+rmQPoU/rqWNbwwtDia0agClQncChKy7Rcs4VchKE1xI+LqqZv0Jev10rPvzze8Y1HMWNsKNM+cOXP4j0s/XUYU6vC0pH3BsU3Q+5WWHEbHV8J7cKsIcJfkOU6kDMKeJujsVLWeSSAqRv7QZLHUZ6057AeYJ+8kwdcogTSfFc0rdRjmnpyXlO4S0ygMVyjvnNH5Wi9N+UiuwqAuW6UP6W8HIMbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8676002)(66946007)(9686003)(66446008)(8936002)(52536014)(71200400001)(82960400001)(2906002)(55016002)(66556008)(76116006)(66476007)(5660300002)(64756008)(38100700002)(122000001)(186003)(26005)(33656002)(86362001)(38070700005)(7696005)(110136005)(316002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGVkRHpXclpIb1FJTTFwaVVqT2NEOFJpNGF4WE5HWmVkM1VpL2dBdU9LWWNs?=
 =?utf-8?B?dURQQW4wMHdCdXVPWlBTOVFRTlNDT1BFeHptUGZhM0Q2bDlNRTJKeXJ5K3FP?=
 =?utf-8?B?RHZlMDg3R1lDZ0NiRFEyVk9BRGh5L1RTS0swQmtMWTJ0NEphYUtVRHQ0b3E5?=
 =?utf-8?B?cnJESzdJa1N2L2drdy9PaXh1ZElFZHd5K012aGNTSGRmMzNYNjluUHViQmlF?=
 =?utf-8?B?OUo0elVHUUNkRWVvRTJ4UkRIakljVnRyZ2xrcDUrV3J4UmtheFcvZEs0MWYw?=
 =?utf-8?B?U2FjamRZdXRBWVRFTkZtamYzQm1YaXU5OHJKWDRab2NQTDJIazNpTHNCS2tk?=
 =?utf-8?B?WFdNVXVqVlV3Y0tRR0VRVGYzY1pSWFdNeTEyeitQSXF3SjFFUlVRUUQyaWxF?=
 =?utf-8?B?ZzRBS01WbGg4QThCdTk2MmpDc2g4UldFeTgxbEJzRzhSMHVOcXpYMmgxeGJ4?=
 =?utf-8?B?MldFb2I3ajJDWjVaSTVlS3V5ck9oYys3Q2VRZVdpWWkzYjF0QzNSbys5R2hK?=
 =?utf-8?B?ak9mNFFnTUdKcjVMaWhYRjRjSVptaFExeWZ5TzZUQ0JWbDZXeGl2aWhieVJj?=
 =?utf-8?B?RHBtazdrL09mcDJOZ012Uk5rd3ZWRTZ0UzFBOXpMRTVUS1l5cVFDRk95YWNr?=
 =?utf-8?B?cjd1WUtQYTNjL1BUdlJ1ZWxRT3BqZFNKWGdNb29ZY3p3ZXZIQUp2ZU41NSsv?=
 =?utf-8?B?c0RFS2JyQlVNM0lPT3k2QnUvMDFYbUVRTjZiTUNuc0FiTlJ0Zk5taktNWktR?=
 =?utf-8?B?aFVFejlGVEI3ayswdVVnbks0MEswQStjSmF5bGF0bWhYczFVZXV2amRHcmNw?=
 =?utf-8?B?SlFNbFhBNXg3MjlnQ3FOdVd6QXJHWW5oZ0dxTGxSSXdoc29mdmlvZmRsNnZp?=
 =?utf-8?B?bmQwSzdxMXlDMk9hTy9UWFpDVG83MVU5d0lHWURGVFlLazd4cE9Vc2VacHFQ?=
 =?utf-8?B?NzVxc1JCNE56MjhBRVlTRWFBK3d3Z0J0ZkNEdGpmNE1zTklHdVJrMlNkY2Vs?=
 =?utf-8?B?Z256dlo0QXhna1Aya0pJb1hISForRzloZUF1ZFNHNE00MUp3OWN6aVNyYjdp?=
 =?utf-8?B?STRMSkhFRDl1ZEd6enVESUxMWExQOWNvOTdIOUpuaG1tTGhQZU5UcGpxajRE?=
 =?utf-8?B?b3dLaWNQcm1zZUpWL2ZibVh4cXM0eUUwaEE5dGFFSDdlbDNUN0RDUVVQSVZh?=
 =?utf-8?B?cEVWYnVnc25rNk9GMGloLzk0QnVFSnRub1FETDNoMmNZZDJ1MXByRVViTVpJ?=
 =?utf-8?B?cUpVSjZ1YXo5Wjl3djlJcTBXOTA3ZmIzdFlDMGMyckVPUjRsZjV4WW5yTmtr?=
 =?utf-8?B?RFpIV3NFMmg3VkVGdUlUV1FIQXhqUGZhMTlFYXpETVVBcDY0L2tlYUJWNGky?=
 =?utf-8?B?WDhJUXpKZ0RBYTV0R3gydWFkMEdxaVFrUzZ5ZEh1VHowTjdnOUJ6dGltZmFM?=
 =?utf-8?B?eXl4WW5pMktLKy94MmlzbVlaSGxLVTNzQ3psL1dqbGZWMEt6TnBMV2NjS0k3?=
 =?utf-8?B?VFdhVXVjay9SVHdicktFMFNQUUEzc2N4dmRzM2tJRE1adnkyM3h1MlZnYW14?=
 =?utf-8?B?RU5oQk5uaEdEZ1RoVU5lV3U5TWxFc3NOdVBCc1ZqSTZDd3BWL2dsYjA5RFBE?=
 =?utf-8?B?RDBENUx0WUNSUk9IZlg3THNUOHFxaWdmQmpEN3lacm9BbGVSMitmVVVwZmU5?=
 =?utf-8?B?cWZzdzhJZ1p5bnNmbnZvcTNjYk01WHVQa1VtVERWMG93YlVCUGRFNm92Z3pE?=
 =?utf-8?B?N2RYT3llYVFNN2tJRnpjT0JiVFFqUSt2Z3h4VkdpakFLNjZmaXlDb0VySWtC?=
 =?utf-8?B?Mm5QSDZmNHRDU1NOQkQxU3pBTlVEbjFlUjZDcExwUDZmRkM5dzJ2WERkQkxt?=
 =?utf-8?B?UU41cjBCVS8xc0lTM1AxT3I4SmNyVWVVNmJiNzBzenNUL2lYZmQzWTRUOXZz?=
 =?utf-8?B?dGVtVDg4cFZiclloeFZjUURnUTB5cnhYZCtMdGJvUFlvSGZPMnJhcm1ydmVB?=
 =?utf-8?B?elphMVpQdkZyZlRwUnFyODRGWEZ0MEdlOU03azM4ZGoxeEZHOXUvRjVDMnZt?=
 =?utf-8?B?TVg5RThDL3VJc294YWZZTGRyT0Z1M3Z1OUd6TmNLZFM3emtlaFNPNndEK0F4?=
 =?utf-8?B?clN0bVByemlPcFhSRjk1blpibnV6bjZGY2ZRQjlMakdlUUI1KzBJQmpNQjJV?=
 =?utf-8?Q?j+VqbW2ti5bxIWZXty8SMiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b73c85-e5dc-4baf-d743-08d9a7f6b88f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 05:13:54.8768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62omyqiFgFddR5LYo5gk9zi5wLUUkUWp3o878MciD+VhcxwUw39GGhTYYaQvEB+pIE233JNRt0rIHaj6R/394A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2691
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMTIsIDIwMjEgNTo0OCBQTQ0KPiANCj4gTWVyZWx5IHNldHRpbmcgYml0IDAgaW4g
dGhlIGJpdG1hcCBpcyBpbnN1ZmZpY2llbnQsIGFzIHRoZW4gRG9tMCB3aWxsDQo+IHN0aWxsIGhh
dmUgRElEIDAgYWxsb2NhdGVkIHRvIGl0LCBiZWNhdXNlIG9mIHRoZSB6ZXJvLWZpbGxpbmcgb2YN
Cj4gZG9taWRfbWFwW10uIFNldCBzbG90IDAgdG8gRE9NSURfSU5WQUxJRCB0byBrZWVwIERJRCAw
IGZyb20gZ2V0dGluZw0KPiB1c2VkLg0KPiANCj4gRml4ZXM6IGI5YzIwYzc4Nzg5ZiAoIlZULWQ6
IHBlci1pb21tdSBkb21haW4taWQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTEy
NTcsMTYgKzEyNTcsMTkgQEAgaW50IF9faW5pdCBpb21tdV9hbGxvYyhzdHJ1Y3QgYWNwaV9kcmhk
Xw0KPiAgICAgIGlmICggIWlvbW11LT5kb21pZF9iaXRtYXAgKQ0KPiAgICAgICAgICByZXR1cm4g
LUVOT01FTTsNCj4gDQo+ICsgICAgaW9tbXUtPmRvbWlkX21hcCA9IHh6YWxsb2NfYXJyYXkodTE2
LCBucl9kb20pOw0KPiArICAgIGlmICggIWlvbW11LT5kb21pZF9tYXAgKQ0KPiArICAgICAgICBy
ZXR1cm4gLUVOT01FTTsNCj4gKw0KPiAgICAgIC8qDQo+IC0gICAgICogaWYgQ2FjaGluZyBtb2Rl
IGlzIHNldCwgdGhlbiBpbnZhbGlkIHRyYW5zbGF0aW9ucyBhcmUgdGFnZ2VkIHdpdGgNCj4gLSAg
ICAgKiBkb21haW4gaWQgMCwgSGVuY2UgcmVzZXJ2ZSBiaXQgMCBmb3IgaXQNCj4gKyAgICAgKiBJ
ZiBDYWNoaW5nIG1vZGUgaXMgc2V0LCB0aGVuIGludmFsaWQgdHJhbnNsYXRpb25zIGFyZSB0YWdn
ZWQgd2l0aA0KPiArICAgICAqIGRvbWFpbiBpZCAwLiBIZW5jZSByZXNlcnZlIGJpdC9zbG90IDAu
DQo+ICAgICAgICovDQo+ICAgICAgaWYgKCBjYXBfY2FjaGluZ19tb2RlKGlvbW11LT5jYXApICkN
Cj4gKyAgICB7DQo+ICsgICAgICAgIGlvbW11LT5kb21pZF9tYXBbMF0gPSBET01JRF9JTlZBTElE
Ow0KPiAgICAgICAgICBfX3NldF9iaXQoMCwgaW9tbXUtPmRvbWlkX2JpdG1hcCk7DQo+IC0NCj4g
LSAgICBpb21tdS0+ZG9taWRfbWFwID0geHphbGxvY19hcnJheSh1MTYsIG5yX2RvbSk7DQo+IC0g
ICAgaWYgKCAhaW9tbXUtPmRvbWlkX21hcCApDQo+IC0gICAgICAgIHJldHVybiAtRU5PTUVNOw0K
PiArICAgIH0NCj4gDQo+ICAgICAgcmV0dXJuIDA7DQo+ICB9DQoNCg==

