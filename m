Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A53B144C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 08:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146149.268867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvwqJ-000400-Th; Wed, 23 Jun 2021 06:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146149.268867; Wed, 23 Jun 2021 06:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvwqJ-0003x9-QK; Wed, 23 Jun 2021 06:58:35 +0000
Received: by outflank-mailman (input) for mailman id 146149;
 Wed, 23 Jun 2021 06:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8be=LR=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lvwqH-0003x3-N7
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 06:58:33 +0000
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 142b4de3-a896-4164-9013-af052d2d2c42;
 Wed, 23 Jun 2021 06:58:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 23:58:26 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2021 23:58:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 22 Jun 2021 23:58:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 22 Jun 2021 23:58:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 22 Jun 2021 23:58:25 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2271.namprd11.prod.outlook.com (2603:10b6:301:52::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 06:58:18 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4242.024; Wed, 23 Jun
 2021 06:58:18 +0000
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
X-Inumbo-ID: 142b4de3-a896-4164-9013-af052d2d2c42
IronPort-SDR: 8lOAmD+vDMOvBACwSeFHakU6vrziYgvhiXnqfpkCbUWRFJgigIB27QOPIE6G4ErsuYn10Gp2PT
 DrRo2fFE8Tfw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="187588573"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="187588573"
IronPort-SDR: X5ekwXbp+GAE5lm5gNQm/LljaXnTKIojtQrpOC99tu/qXSNQa1L5xJbiCprGfkmqj3CNsfnkso
 6kSwPudY2laQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="556875686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8fMbqibm7qsV2sRxiXvEjKlSxKPnx/BCRs8jAuODGkYxvD+Zm4hIORJp4bX96VJgLSDfXk7mrzr9F/pzEx7n4SnYYTCSZPCrIKBs21bmV/PrmUhR8DlxRmqw3AKBlVX2bYA9zp9CQBNVCc4QraqS17TMU/uIvoBwSVWsbrYszyMFEY4P0HETB8GIX2RebVhL+HbzJwEWEgIU0UycOKpOZDfeeH30kmxJiarU23R1JNWfjpKMouMlT6BExEyzjErWixPTYyZCAhhBsVqtPB1qLxRRbDXfO569cm6EgAZeMZJhjnrC9zzu/5ohagaj5o2lFUIODMiaKD0HdeJwrhQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKbibNmf6U+HXj1UKcHd0r7LDzPyMPoJUg6UneLdkKo=;
 b=jIYbxuv4PMKCQP42PsORapbsBaMNZIdcTavwT4cED0idzM8X8NjrWrXRP1F8rsfthn1ZtGOplUrzGScXaJGlnl6PXj407ZzE3e2LFv5wmY6Ub2x6UjOG+ZmNYod4VGujGXaDoNXN7anht/5R5Z6GuryAj7PksMADlTYvFrID9XmCCUikfHok0BL1TEmmFsfhymqCwNYz48ucFu0XrGNFJ8XXeo2XBQCoMC/hGIKp4orWNSdWAhjqsRoNXL6Tll2RPauGC4pK24UvGTya6djPECqhtL0bxgEyUyQOBMZwtMMUf2cAP6HBT54u+EnZE0/7DRPgFtCJyc6C0aGQdVAaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKbibNmf6U+HXj1UKcHd0r7LDzPyMPoJUg6UneLdkKo=;
 b=g/vUSPRwyH5M9yBCtm8ctyrQDPkRhnD9V7qLM35M1mj13ibOHGWT5rwEBpPty9tGkpwBTFM+UdNACdjCqKRG1D5nx/TZLCCbRnh9twnPPBnQXC97zNXHO8hkgO3TnwIUfY9eTax/xtTVknPy2pIBbEuw5ZCmYUCulGMXZrbv5PE=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Ping: [PATCH 0/9] IOMMU: XSA-373 follow-on
Thread-Topic: Ping: [PATCH 0/9] IOMMU: XSA-373 follow-on
Thread-Index: AQHXXRF3+9Tikxxns0WkinxCJ12rU6shPlYAgAABsLA=
Date: Wed, 23 Jun 2021 06:58:18 +0000
Message-ID: <MWHPR11MB1886112723E7E2192D22733F8C089@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <e4037580-4c37-13ea-7667-625a2211aaa3@suse.com>
In-Reply-To: <e4037580-4c37-13ea-7667-625a2211aaa3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.143.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d039d7c6-376c-4997-eadf-08d9361447fc
x-ms-traffictypediagnostic: MWHPR1101MB2271:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB227132C03AE48EF4FFE6715D8C089@MWHPR1101MB2271.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: za43FJtlH/vpeGlUN2wtW1zrejpOLIti5dfd3lHY0A2H4RAerA8OyoD+8VKE2ymj3JgqKAEl8UkPb+VAM6GbxCV6BayBtraF3aJ9iBqa7HTlO5Ttz/Lrx7r9iEsBUAA2OTLDHXW4cAOtJxCIYJ9DrHA6fGV12MM7NDrfwXUdIBElnIT5SwMpbzJHEmuZXbS5IN0F2aLNNj5qGlNXrWQXIkT5EZiZDhDXUrNSM7cm3wpWVuyw9duil5miBy1c0tcf8jd2hu4k2BU5gPmugS/q3rxDd8J/EFCExnFSkWmqMK0BZp9aUvCTugeHWTt7HfayMhFEw07rBalACTyzTtoZuahE0BwOqH8DZGZ2un3D0/xT8OxzVS72dCb1jImllKhKnPVR05eaOmF3TEoFa+3eGxeKJYXgolPY9tChTAVz+aT8jx7pYWNGGwuGD7+VoHmwJYe6L/F/VAWaIMZwlgYXofoO3MfNqg3cy+Zt0a/89ZEV3KVL9g39a+Do18RqP0Xqd6Erdv0MVEzi1Q0pLWa2z6Twi/T7+KiYhtpCkG9bYZZpa62gNvxWV6U3tgZW7ZS4cNxkeWZbS8onO9niJ8fepl8IrrK/mHHqlkj+Bmyulh4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(39860400002)(376002)(136003)(2906002)(186003)(66946007)(26005)(76116006)(8936002)(52536014)(4326008)(122000001)(66476007)(86362001)(7696005)(5660300002)(38100700002)(478600001)(9686003)(6506007)(71200400001)(66556008)(55016002)(8676002)(316002)(54906003)(33656002)(53546011)(110136005)(83380400001)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVVvZkVvbDJKcDJyL1djMTZuRVd2QnNQYU11czFkdTROT21aNXZydzRHNjJK?=
 =?utf-8?B?WWlSOTFmYmluc3BiNDczbkErWkNUMUxZOFJLN3E3REdoUVQwclBFeHo3R1Ar?=
 =?utf-8?B?M1dIS09Xc2FzNW94ZjZiWGNYWDJwTThENVhHK0VUeitYTXNnQVVLQVhrM09a?=
 =?utf-8?B?cklTaEdlcFA1VUExS0F1SlRQZklZQ0diUThzOWtheXUwWFNVbDA2d0RjSjhy?=
 =?utf-8?B?elZPNVQ4ZkFnbWYyeUlZT3NWRnJmOVdrZTFqdmlXcFZ3MHdhM2U0dThWWDNQ?=
 =?utf-8?B?K05tYmwyMWQ5TEx6cFJRaXJaV3E1V2ppUU9qTUJLM1BOK0pVOVhCanFIajNj?=
 =?utf-8?B?cFlpOHVxcmNjZm5qUmFwYnlkYTRWdTFYVHJvRENDYk93RjJVczZrSXZER0ZP?=
 =?utf-8?B?cW5aYXdrbTIrSStQUG4zU3pDck1EUGNxZzk2amoyZGZGSlk1UlQxME1YakxJ?=
 =?utf-8?B?Sm1QenI0TGE1dEYya2dYbHJpTzdnZmE5WnAvNW5sTDFyU2NtVWM1aFdkUlpO?=
 =?utf-8?B?VlVlbytxR0JhWU1ERXh5UnBEdUV6WjVENHhXQXVMeFdEbDNHSFJnejd3K2FU?=
 =?utf-8?B?MUFDTERNOWtsd2N0MnFOTTI3ZVdnaXp6L3c1Q3lNc2l1NndRNVhnTGJPRndS?=
 =?utf-8?B?V1FHYnlDYU5mNUNTMzZEcHp5eGJZZGJlWFZzRExvUUxCSVBwM1hUTE83VWxv?=
 =?utf-8?B?dE1lUmVqQk5sTHgreHVMN25vMFBGT0ZDclR2OHF5TVl6cHRGeld6TEh3VlF4?=
 =?utf-8?B?dFNFcVhZRytFZWJHNzNjSlowWlQ3NGwyUXRhNEM0UWloY2xrY3ptSnRFb3F5?=
 =?utf-8?B?dFlmWTU5UTFXTDY3cmxvblRMQWVMTnJQMTNZbUtMZ1BtaDloKzlEOEdZdklv?=
 =?utf-8?B?V05DTjRnUjZUc3gzbHhwaloycGJ4NmZOaEhOMHVJZVVYYndyUklQRlh3eGFq?=
 =?utf-8?B?dzRra09GYVlXNDh5S3hGU3RmVDc2Y0RhSEh3aDY1R1B1K2pSa3JPbFo5ZXFX?=
 =?utf-8?B?dzVYMk1sRmNWVGV2YkNyMnQvR1p4QVMwVVhoQ010VG0rQUlEZXViL3J1U0Na?=
 =?utf-8?B?NlFYT3dIRTI3QTQ5bU1UVUhqMjFacXJsamdieTg3bHozbWpCTm5XUVU0Qkk2?=
 =?utf-8?B?akQxVmxjSDBlOVo3VUZqeWtXalJ4Mmk4N0FvMFJUNEVIaDJsRHUyQThLQ0pY?=
 =?utf-8?B?dWRJeXgwYkxMWjdFSU1QelE5ME1pdmtvUEJ2TElUZlgydkw2ZkxsbGlCRjlu?=
 =?utf-8?B?SkxNR0RCREpoOFZjSnA5cy9IMlRRZlhKcUFsQWFFVXJhUTlOOTExWkdCMmlB?=
 =?utf-8?B?YUlPY3JUZHk0Q3E5WUlSTXd4WVAxRGc3YzkyUmdtN25EenZCTGRkY2Y0dlVu?=
 =?utf-8?B?aVV5MkFCOEtUaC9rU2d1WnB5MWhLZHRzd2JjWUF1Vk11RHlQbVJVNmVOdXdV?=
 =?utf-8?B?dnNhTWNsQUFiWjBYOUQ3VTVISFNZNVNqY0FRTi9uRWJNNThSVlRQUitVN2h5?=
 =?utf-8?B?bzc1WjVOSnU0QU9lYms5QThEWGJBMEhmMVRvN1FZQmhyN2kyeExiZnhWN2lx?=
 =?utf-8?B?VTFDZVpwODRpUFJOQVdUYkV5aHhDeVkxU01uZmtCa3NFc2ZWUWZNeFQ0ckJF?=
 =?utf-8?B?ZU1LeGlqcXdKQmZhdGsyOHk2U0xTRS9taUpKQ21tMXl1RDVHTEJTUTl0SGQy?=
 =?utf-8?B?Tnd4Y0hPaVorVUZ5SHZxR1VwWGZ1b0tNSUdqMmxQMWxtY2hBVGM1TURKb3Bp?=
 =?utf-8?Q?cQQa0ByWpguk1W6FWl5QlkrbNN3DNKmCbjn2VTc?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d039d7c6-376c-4997-eadf-08d9361447fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 06:58:18.2989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 17NZvoC8d9j6pYDj7ijGv1P63rixBsmIZYQozeVJANWFtSBK9sTLZvkAfXw7x8LNqVexj/rqwmHPP7beZgdWTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2271
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVuZSAyMywgMjAyMSAyOjUyIFBNDQo+IA0KPiBPbiAwOS4wNi4yMDIxIDExOjI1LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4gPiBBIG51bWJlciBvZiBmdXJ0aGVyIGFkanVzdG1lbnRzIHdlcmUg
bGVmdCBvdXQgb2YgdGhlIFhTQSwgZm9yIG5vdA0KPiA+IGJlaW5nIGEgc2VjdXJpdHkgY29uY2Vy
biAoYW55bW9yZSBpbiBzb21lIG9mIHRoZSBjYXNlcywgd2l0aCB0aGUNCj4gPiBjaGFuZ2VzIHB1
dCBpbiBwbGFjZSB0aGVyZSkuIFRoaXMgaXMgdGhlIGNvbGxlY3Rpb24sIHBvc3NpYmx5DQo+ID4g
bG9va2luZyBhIGxpdHRsZSByYW5kb20gaW4gd2hhdCBpdCBjb250YWlucy4NCj4gPg0KPiA+IDE6
IEFNRC9JT01NVTogcmVkbyBhd2FpdGluZyBvZiBjb21tYW5kIGNvbXBsZXRpb24NCj4gPiAyOiBB
TUQvSU9NTVU6IHJlLXdvcmsgbG9ja2luZyBhcm91bmQgc2VuZGluZyBvZiBjb21tYW5kcw0KPiAN
Cj4gRm9yIHRoZXNlIHR3byBJIGhhdmUgdjIgbGFyZ2VseSByZWFkeS4NCj4gDQo+ID4gMzogVlQt
ZDogdW5kbyBkZXZpY2UgbWFwcGluZ3MgdXBvbiBlcnJvcg0KPiA+IDQ6IFZULWQ6IGFkanVzdCBk
b21pZCBtYXAgdXBkYXRpbmcgd2hlbiB1bm1hcHBpbmcgY29udGV4dA0KPiA+IDU6IFZULWQ6IGNs
ZWFyX2ZhdWx0X2JpdHMoKSBzaG91bGQgY2xlYXIgYWxsIGZhdWx0IGJpdHMNCj4gPiA2OiBWVC1k
OiBkb24ndCBsb3NlIGVycm9ycyB3aGVuIGZsdXNoaW5nIFRMQnMgb24gbXVsdGlwbGUgSU9NTVVz
DQo+ID4gNzogVlQtZDogY2VudHJhbGl6ZSBtYXBwaW5nIG9mIFFJIGVudHJpZXMNCj4gPiA4OiBW
VC1kOiBkcm9wL21vdmUgYSBmZXcgUUkgcmVsYXRlZCBjb25zdGFudHMNCj4gDQo+IEtldmluLCBh
bnkgd29yZCBvbiB0aGVzZT8NCg0Kd2lsbCB0YWtlIGEgbG9vayBsYXRlciB0b2RheSBvciB0b21v
cnJvdy4NCg0KPiANCj4gPiA5OiBJT01NVS9QQ0k6IGRvbid0IGxldCBkb21haW4gY2xlYW51cCBj
b250aW51ZSB3aGVuIGRldmljZSBkZS0NCj4gYXNzaWdubWVudCBmYWlsZWQNCj4gDQo+IFBhdWws
IGFueSBmZWVkYmFjayBvbiB0aGlzIG9uZT8NCj4gDQo+IFRoYW5rcywgSmFuDQoNCg==

