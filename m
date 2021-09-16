Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA2A40D40A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 09:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188192.337278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQm73-0005WS-BM; Thu, 16 Sep 2021 07:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188192.337278; Thu, 16 Sep 2021 07:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQm73-0005T1-7h; Thu, 16 Sep 2021 07:47:17 +0000
Received: by outflank-mailman (input) for mailman id 188192;
 Thu, 16 Sep 2021 07:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQm71-0005Sv-NS
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 07:47:15 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e92a364-16c2-11ec-b5b0-12813bfff9fa;
 Thu, 16 Sep 2021 07:47:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 00:47:13 -0700
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2021 00:47:13 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:47:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:47:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 00:47:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 00:47:09 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB1940.namprd11.prod.outlook.com (2603:10b6:404:104::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 07:47:03 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:47:03 +0000
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
X-Inumbo-ID: 4e92a364-16c2-11ec-b5b0-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="244884110"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="244884110"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="434409150"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHH27T6bs60giYHvD92wYMyXlhFvlmd7RxH/Bwvad8gLLBtMWPg91EqN1VVimb6nHyJiTV3/kjTQqkBr/oUgRRCHh1l8tUGpqWRhOeK5AffMJuHglUF1cM/D7mI/bsfxmMhC2VI0ZjOKwYjkiuDsVLUX2xLeM3toKNlDfTgB14zKnqtlxAXZUl7PS+1ysefqYzRq0kKcOLl89ZbsabGaMXgfGNzXqRXW6pPsnP/U1AQsm2fFLplEghLPocnjfmURdIH4TqaKCQ/wGEd+CDurjV1bOBvfwbj/uWaTD0Rw3bzmlu9Ddqdu/3/9Y32Hw4vvCohJdXx34kyvuU/qzp9o3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vgCAzWP8V6/yozaFZCPwrdB/RaDEFfOcI6TTLa2lfog=;
 b=iEyNhWmQOQpMQs16HTXI9WVOfijGF81w7062bQunWkLlDc2j6C+2XDMTncjGblg5+IVAdYJEg9Be5Em+/nzxafJL27AalLxbGnwBVSKfeGXzQymKiX7eE1d4a5oqY7L7IPFBfDsCk1ObtxtWwaiKNq7EWp9HjEraYXUePu0HdYlq+5la74rBYhZc9TWNRKQa2kf5I7xTtKU29tyKhw0Ocp0Tmqla7E6G7I2Hy2Ck4RV948Y3jmRvavgCAAKGMFLQZEEVHww+v06ntx1zvbFyKotNeh8JNQ8hFQ4904TEH9Zp0uO3wya/vPFs7rqPJ1aWEECtgaZIJfWJP7HjiCFR1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgCAzWP8V6/yozaFZCPwrdB/RaDEFfOcI6TTLa2lfog=;
 b=QmIK+4sGS8RyqPg0J2qo4tBFI+ajT6KTBg4yVanvUWGxyStyLWH0fhf5KFUa0SskRAxZvQkYrHRoQnPZk2KvE1RsoMtVTHDRjEPq4t8fkNVLNndDtdjPXHRgx+5xlm/XRzEzpoFxVR2H/FtwX0NXBnBZfJfju1fWGnn66tNqXnQ=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Ping: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
Thread-Topic: Ping: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
Thread-Index: AQHXmPQ6RAwx6Qn8tEyqmw4lz+vBDqulLEeAgAE+cwA=
Date: Thu, 16 Sep 2021 07:47:03 +0000
Message-ID: <BN9PR11MB5433D8A22A830BE9C2D715B58CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
 <9fb1d554-8fcc-fc0c-2b0c-52756001d36d@suse.com>
In-Reply-To: <9fb1d554-8fcc-fc0c-2b0c-52756001d36d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c2b2a74-9495-49c6-c8fe-08d978e62cb3
x-ms-traffictypediagnostic: BN6PR11MB1940:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB19409D444EF5BF4A5B7A31268CDC9@BN6PR11MB1940.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 00L6s7MVImJuL2oebegtMG45KK8BDZVt3JIdiyZJlIWGMyJp7nBlzM2e8Aa/mVNiSHAqpyaNawNMLdFmwLj2GRg2kEbtJ6dKDScvdTUHnTnTehsWQcCQihqRRC7BHI8Dg0waAhyWdg1crRyBK8giyu5gHBGFb6BsmsLnTRmmG4bLbXAf7VcwdklvU48fxFy8CPTGkO/qS02EK/QZFCQQNEoVmjSUHf27i+eRx/wdoG4NJ5GihtM7YzWO2SBHRZn31G50H7Q8LxAe7iOl910j5HpbL72CZ0nvIMU1mRI+ksFxiCth2wQvhhyEd48QRb5jb76KMu3acaeyIMrlwqm7pYHijIlfqqpWx7dmfCsWqn+bYudqfm5sqY1n37eCrWNPN/T/YGyOe50+bqMgnKnORv5SG9vaXmcmG4/IUazz5JeGz8ZA58AzEi2uov3CwfqYIF6GUsgFs2uNU5iIdYoMsyvLltX4EGiPcJSIXamev12ujjmVaQoV7RAqDe/hJIYAKrlOukUQxcnK2FqOr9NpmeTokCZx8/BG4K/WYWnWDElu94LMWNm7+r5qVWuxcxCa65MdRjYnnB7Rbx/8AJ22w6m1t+dpHmGkiUF6udP8zdgZfcdQcnS8fipfFQQjvnSC8w8GBKloxm2OUu4wm7vBp8fEKlwYJldsqm5NIsvW0VKrPqu255FEySWZlkCE+xLIDWYE2C3nXuR7MC3Y63U9fQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(4744005)(54906003)(38100700002)(316002)(122000001)(38070700005)(86362001)(6916009)(478600001)(9686003)(55016002)(8936002)(71200400001)(8676002)(26005)(52536014)(5660300002)(6506007)(53546011)(186003)(7696005)(2906002)(76116006)(4326008)(66556008)(66446008)(66476007)(64756008)(66946007)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3BsQWsvcWJkOTNOUDVUOElBaXFDcmt6UzdtdFViNlBGWUpQQkM0UExIRDhx?=
 =?utf-8?B?cmtuSVMvQk94L2ZQL3YzSUxubDJvRUp3bEljVGRmQU85cFJzVmpWK1lWTWg0?=
 =?utf-8?B?Zm1FM3VOQUI0aHdoQU81SEFCQUFrVnZ6aG5yQnd4UnpyS0F4ZDR5UGxqN3Jx?=
 =?utf-8?B?ZEptYXlNeFltK0JFMFl0M0RsK2xRajJOZk9DTTRCSUxpSTVlQVVZYmpvMjMz?=
 =?utf-8?B?dHd1b2dvY3FXMjJIeUxleUNKOHZhSC9XQ3ZQNzNwcnFGdTk3VGk5TkNNUjZ6?=
 =?utf-8?B?a3hxbkIwQUtoMHM5SHBHSEZYNi96dFFkZTZNMTQ4L3UvbTRPL3FxbmNHREZl?=
 =?utf-8?B?R2Z6Y2thTmJPQnV5UTNsY2ZERkpxVjkrN3BIWDRCbEl5Nk9QTTdaSjFZZEtE?=
 =?utf-8?B?c0pPWEttTzN6elEyNFRGVGI1bHlsemdjTmh2M3RiazVMYjB0dDRZcmFWYTV6?=
 =?utf-8?B?QldJZDNZZE5qSFNXbEwyUGV5S2NKdFBXT0s2bHRyVHpQbmdvcVV6aU95TzBR?=
 =?utf-8?B?YldQeU5ZRENPMWNrbUtKMFNVTXJOc1JJMEJjTzhiTlR2QnphNkZRK0U1RlpF?=
 =?utf-8?B?YXZmdzdwZ3V5RWV2am91LzdVVlorc0ZlV2xyNkNpNGZuTlRQNmgzMXZpbDRX?=
 =?utf-8?B?UCt1TlRvWHF5amZBRXJTTTBLeWJhODkyU3R4eUZTZkJWYWx6UjdOREh6NnN6?=
 =?utf-8?B?OW15NGszNWRWbTUwWEhTR0Z6MjdhUWxRZ1JEZHFCTEIyekwyMG9tanZkSVhn?=
 =?utf-8?B?RW9iSGl2OEZyajVNekdnNURpQ3BtZzR5NWM1ZElmZUd5d2crNzBwcVVIMC9l?=
 =?utf-8?B?Wnplc1JiVE1aTEZERDI5UVVyZEMwQ0daVXJXbUJmR0cyQzNHUzlxRkQ1MVZr?=
 =?utf-8?B?V2ZDUDNhcXRXWFVncllWNlVuS2VFY2Jkb1NoWHRzb3JBSS9pSCtORFFrUlNm?=
 =?utf-8?B?SVEySVcxcGZ2ajR0aHZFaTdiZld3cGUvOWhXTEtwZFNaL2JFUU05bUxuNnNn?=
 =?utf-8?B?eXFkaGdXNzIwVSsrZEpZZHhiZ2VvbUtRWGZlWnRwbmMzdTFITytGemt3eUJP?=
 =?utf-8?B?U0x2d0g3bm1PTEt2bno4Zlg1UzVuZkd4R1BzMTY0Y3BZSmhiSjJvMkQxNS82?=
 =?utf-8?B?QU9LMXVwMzExY1V4TGc2d2Mrd2MzNlR2OUdERmJmU0pwbjlHSEcwL0ExNFVW?=
 =?utf-8?B?NzdVbWI4YUxOWkxrWTZHdHJNR3V3MGcwYWFMMTZUTlJPUFRBbW5aSEN4Undj?=
 =?utf-8?B?UURVblBVOUZGUVNSS2UwTXMyV01BSmd1REk4Y3NsR1hrS0s5NFA4RUw3cmIz?=
 =?utf-8?B?QldSTkl2ekhxcVlENDZNdERPTVAxOW1SSFhLbzBaeDY0MWJwMVNCT2owRjla?=
 =?utf-8?B?QXlzaDlHaU9TQXBkUVhWWGgxamFoUEtlMTM2NEpZRlRDaEV0K2lQbFNZZ2dk?=
 =?utf-8?B?YlZMM0JLaUhBdzNHdTV4L0NKQVRNd2QrekFkMUJDR2k2a0V3d3ZibnpiV1ZK?=
 =?utf-8?B?d2dPNlpJclBkOWN6bzkzNXN3dGF5MUlLUWhKa1NkeFY0OWY3UnRjNjY2Q1N0?=
 =?utf-8?B?UEJVeHpXUXh1d3Rsakl3S1lTMUxtNTF6WGFGS3k0TjFONGowK25rUlZ4d3Ew?=
 =?utf-8?B?V1g3S05DV2N2Yk5zQzM1cE82VzJRS2FiVTczZVczVWhxOWo0QWlMcGpBSjU0?=
 =?utf-8?B?VENGVVRaZzI4WGdoMEVXaFIxMzNoUjJLcU02UXRRb0drUDhKcHZhRGhnNEN1?=
 =?utf-8?Q?IsQrCE7pitTeWyszwC6mQh962wE/pRvZmJ5e/Nk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2b2a74-9495-49c6-c8fe-08d978e62cb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:47:03.6212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtfUTDfVkOFtW2Ol53zAUWWeC63ZHbty2UbrzUfhZmTi/DlNFnRMcf69nfwTZgbJf2M5yox8vdx7oniyj9Ds0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1940
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgU2VwdGVtYmVyIDE1LCAyMDIxIDg6NDIgUE0NCj4gDQo+IEtldmluLA0KPiANCj4gT24gMjQu
MDguMjAyMSAxNjoyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gbWFwX2RvbWFpbl9wYWdlKCkg
ZXQgYWwgbmV2ZXIgZmFpbDsgbm8gbmVlZCB0byBjaGVjayB0aGVpciByZXR1cm4gdmFsdWVzDQo+
ID4gYWdhaW5zdCBOVUxMLCBhbmQgbm8gbmVlZCB0byBjYXJyeSBkZWFkIHByaW50aygpcy4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
DQo+IG1heSBJIGdldCBhbiBhY2sgKG9yIG90aGVyd2lzZSkgb24gdGhpcyBwYXRjaCBwbGVhc2U/
IElkZWFsbHkgYWxzbw0KPiBmb3Igc29tZSBvdGhlciBWVC1kIHNwZWNpZmljIG9uZXMgaW4gdGhp
cyBzZXJpZXM/IEknZCByZWFsbHkgbGlrZQ0KPiB0byBnZXQgaW4gYXQgbGVhc3Qgc29tZSBwYXJ0
cyBvZiB0aGlzIHNlcmllcywgYmVmb3JlIHN1Ym1pdHRpbmcgYW4NCj4gZXZlbiBsYXJnZXIgdjIu
DQo+IA0KDQpJIGhhdmVuJ3QgZm91bmQgdGltZSB0byBjaGVjayB0aGUgZW50aXJlIHNlcmllcyBp
biBkZXRhaWwuIE9ubHkgYWNrZWQNCmEgZmV3IG9uZXMgd2hpY2ggbG9vayBvYnZpb3VzLg0KDQpU
aGFua3MNCktldmluDQo=

