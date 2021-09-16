Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1240D3CC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 09:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188150.337222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlqL-0000O4-Jz; Thu, 16 Sep 2021 07:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188150.337222; Thu, 16 Sep 2021 07:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlqL-0000Ku-GU; Thu, 16 Sep 2021 07:30:01 +0000
Received: by outflank-mailman (input) for mailman id 188150;
 Thu, 16 Sep 2021 07:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQlqK-0000Ko-11
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 07:30:00 +0000
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bec81154-986e-45cc-b80f-d8ecf05fd8b3;
 Thu, 16 Sep 2021 07:29:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 00:29:12 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2021 00:29:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:29:11 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:29:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 00:29:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 00:29:09 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3602.namprd11.prod.outlook.com (2603:10b6:408:8e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 07:29:05 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:29:05 +0000
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
X-Inumbo-ID: bec81154-986e-45cc-b80f-d8ecf05fd8b3
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220622244"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="220622244"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="553730497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQB1uwW1sMv4/gxwoZ7VgTtSNv0/ExVwDFxrGt4u4a7O/e4C7GAjs5hNm4s5S27KKv2ixDzeCF2RKyQAc/eFnUJS1iYJbWTmq+/3ytql91MonPeo2azw5PmSrkzckRQld084soxWGZTpF0qrB8xKYmzEXnJMV0Y+j8lmefldglwt5EzhHMTPVNilFMqI9TWiD6+8AKFbND4+8wKnPkWUdY1JsWfj/rKbaQc3pKDWWjoatp/m6xtydYWE0xFCH77o4gfPMjkmrWZPf/1ttR/Anz53tdWhDKm0xxDIomIsJ/6v92KQ07QsscOS9rBcXdzOlt6bPgS49snUxIFfs3+JHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Vid34ud0rFRa4Wkk82svfoB2ymr9OfvkJrroyZKvVtc=;
 b=TzL+xHTVRSBQ0Me6P9+OloVS33Qpa9FfCSv4Ny7HCa2QbsLcVlX4Q6kcqS1OdafzjQDvwf8yNpageA+MerODGtajMoZO+S+gt/JKyww0ObiFd4FcKMFNq468wu8U8x/6j0vTU5ao5SgFKu/6YhY6zfpvTNz5ZsTfaNq0oXeoEFci+fY9dondNTF31rYxh8r+rNhg7sIl2WQH/g5vgzPvUamSGgIQ6xGNDOh/hOIDXRJ7Ko25a/e+0Qt/MxpQvFxANYM+/P3i8PxLVZy/5j82kQxNHmg6VspX1SI9TddQdysTxpeO/YDmGEiGiC8cs7kOtxTxYXpaoiq0r5KOvJlKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vid34ud0rFRa4Wkk82svfoB2ymr9OfvkJrroyZKvVtc=;
 b=Vvwoof6kZjK7AS1aF0QvAcd1EO8yrx8Ih2dmsryHDFef3/94iK5Dwvb8E5XhROrsBDakKCKuIstHomipyAjM/LPHIssnaZH2lEfN0eh2uX8izHLamnbIM9qAGK1VFGbBHXdX9cio4m9CEa8cZSi7mf5dlQe7TqGAS9Am6p7L8Qo=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
Thread-Topic: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
Thread-Index: AQHXmPQ6RAwx6Qn8tEyqmw4lz+vBDqumZRwQ
Date: Thu, 16 Sep 2021 07:29:05 +0000
Message-ID: <BN9PR11MB543311E87C32397FB82583A48CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
In-Reply-To: <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ad4db60-c6ac-4132-643f-08d978e3aa46
x-ms-traffictypediagnostic: BN8PR11MB3602:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN8PR11MB3602F97C1E9E6296120ECCFB8CDC9@BN8PR11MB3602.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:240;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j9/IVTlgij95ebhTKHdqdlt6SQ2PZiwQEM49E8itDxe4ztdIXkYQ4TYLcnluOTt6BDN8JetlmnBenU5J+QPGe0FVEIUpcfPS7+oWtVsDC5NEkvNXwVib5KRd6hOgK3mkLDv/s7NILYu5KyY0Ud/c9L7+SA9urhfyXyTP3gx8OMhYuQAN90CoK8NbpuA7t9fP4Ix7NeD6uryPgwc1WmeWiUlZW02DPKceLguqO1oouxvmcwtNjlArblGdQF9HyH9v3/w9gnZUlIXK4kFXJq30ddCehXoOCVQ0uvjfky9L9Vz+b6Rkr22UJpgQwT1s3s8bD9rIeXRV4tUUo31AF97ZFJQ2KdKpBiEA3KWveSButTSrX5bfgh5oyZylmVnrl+idiaREo2R257RJgqPwuidOH3JVBcCenVpANV7vVWh9PC1TAL7DTvcz7tk7BMWRFKkMNwbYdSd2PFHY2D8TjEIJ+/UDTAar3QqYxqbQ5+QOdmJuFciWUsM9sCzMF+J6uW5HCiCOQQLuwgcHC/JDXFdtD5J5F4pqLfRyBTgN4+aBowduBwVPj5/6wvC6rDjBoXasOC+33St6WHQYQQHydUTs6rUZinJCjBe/Zm3DpirtBPazba3OErie6FmtPH91eYmvb/HHwSYX9OlGZaUYKrG2FZn5KtOdauzsRwAo6sk4zgvz704qEP/pZOsvhxFq7YsANYzOFvimGiVwgds11wzJkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(86362001)(9686003)(66446008)(66946007)(478600001)(71200400001)(54906003)(5660300002)(33656002)(76116006)(6506007)(186003)(52536014)(7696005)(66476007)(316002)(110136005)(38100700002)(55016002)(2906002)(8676002)(64756008)(26005)(66556008)(38070700005)(8936002)(122000001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1ZYWTVXTjdjeG1MaHZsdVdFSVhRdW5IWmJnZEE1Ymt2dkh5bmx1blRNLzVY?=
 =?utf-8?B?WVdJZGdEWFk5azVraTF2TTNqRlhTaWhobGtDRVhzdzlDSlFYalc4Q0UvZUR2?=
 =?utf-8?B?VVFNQ0JJaGdNemFRdjhUUk81ZnM4c08ybGx6RmxUdnVtTkw1MkY0UUhJalNK?=
 =?utf-8?B?MW1oY3hiMnQxMzJxTDJrK2VvVjlpMEhGeHVvMHJpQml4OEpCUThlcEhrNm9T?=
 =?utf-8?B?Q3lMSWRWdlJyRGU3TUJaa0laa3UvdytjY092RU5TQzNQek5Hd3p2RXBYblJZ?=
 =?utf-8?B?bDFwM1FzZ0FFV0dFa3RmV0EvWjVScHRwU1pYVFIrYzVMTDhxNERvK1ROZ0Yz?=
 =?utf-8?B?STdmSnBhaFNSU0lhUU1zMWRJZUVXUXk1T2pjcTZyaFRxVWRaY0VEdnB1RGg5?=
 =?utf-8?B?alR2Y241RGQxSndFK3MrZUdDbm5iVGpoYlRwUDhqcnAvRWdqUUFkcGdDVWg4?=
 =?utf-8?B?OG5WNi9hRnVTbjN2S1V6c2tXcThhQkhyZWFhYUdxMkk4YVJmbjdHL2hpKzdL?=
 =?utf-8?B?N1MrVHVjOUhrSkMvRmltRU9vYjZnQWFSMlZMWXcxKytkcFNycnpmbUVYWFJF?=
 =?utf-8?B?TFg2WDdSOFA1S1JFWVlBNVRhQVdwak5vR2gwd3JXM2l3d0Y5L0Q5dGdBejk0?=
 =?utf-8?B?RjZLbWphdWJlUFVSSkNqUzRtWDREZ2ExdmJTY2pkU0U5OFdUTzk0bXY1cWJ5?=
 =?utf-8?B?VCsxWjN6QnJwV1hZVkpSTkJZWXg2M25PRDRrV0Iyb3U2M0hpLzlFMmRwZ2Mr?=
 =?utf-8?B?d0lZRFRaNERiVXNKOTJBalFSY1lFbjFjWmlaOFdXbGcyTDg2dHNzQ0lpZkpL?=
 =?utf-8?B?d21DcU1zdU9FTmxKaUFJYkg4TmZBRUtZcmRtay92QWdEdFZ6ckplQThHT2Yz?=
 =?utf-8?B?RTc5dWUvM2c4d2d5dGl3QmlBTy9jOXFGZWZGVlRVaERoamJOQkNHSjE4ZVlB?=
 =?utf-8?B?Y1JYVnVSdVh2TFBxb0FjanowTitoU1huTGZRazFTZE5lOUN3VnlVUHNVZ3hJ?=
 =?utf-8?B?MHIwLzFyS2thbUU3QTZ4a3VRYmtubUROWkFoL1BCcjlWWm05Q050NkVqYXpn?=
 =?utf-8?B?V0xnYU9YMTNWb3hLbVIxZHArZVVzNG1GV3hmTHNaVWgwbDJQL014SXJSOGZn?=
 =?utf-8?B?VlZrQWJBWGxuMDhSS2Q4akxneTNzTGF0c0t5Z1BnV1NOdmpJVWJ0KzQ0OGs0?=
 =?utf-8?B?NXVlRDNLU0pmMzRJQ1NnM1FWQXB2Ulg3WVpYSXdlQzZsK2RheVNYZjZGc2ph?=
 =?utf-8?B?Q1ZIZnVwM0t5d0JXR2dDU3RWSDBlVkJvSTBRWXVOVEFCbXcyZUI1cG5sRVpF?=
 =?utf-8?B?ZXdHZzBIL0c5ZFFwWUl5alBxRHZPRkw3ZW1nRHhyN3htd2xmdk5za2pxa0xJ?=
 =?utf-8?B?OTNVUmdsYklLUzdjQ2JpcVFoSlgwQzdqckwxbTVTeTd3ZlhHVWx0VHZxSERH?=
 =?utf-8?B?R1IrTzJaSzAzRjc3aVJOcjI4b3NMMm5ZTGpaanRNVXg4YVcwaFBHZ0ZQcmlJ?=
 =?utf-8?B?RC9xZVBUUUlLamhoQ3ZHUncyVG1MVTdEK0kvMVM2SHpwMnVwcTY0RnRFcXhG?=
 =?utf-8?B?U2U3N3lLUHlnSUlXRktCK3FkNzBLWXJybXh5K3RxLytiTExZZWdxS1k0UGVt?=
 =?utf-8?B?WUlLajFBb0NvNGNkNHQwd3pETUdveEFDaU52c1pYWXJJWEZBc0dhLzAvWWxh?=
 =?utf-8?B?Y1hjZDZRVmYzWkJvcWdjYXRGakp4UmZ6VndxUGY3NEJoeHgvZnVBTVFwUU1R?=
 =?utf-8?Q?98+di8i2A2hJxTPBq0si8kpRIlDnq4T3ulZAtr5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad4db60-c6ac-4132-643f-08d978e3aa46
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:29:05.8687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soaraCOs9ie8UgZBn2Q00Ve1+nufbTFo2kyVI8DAJhVlzJd2AEVPp9Qyw3FNn0DH2dGlxixESd1rmb/+JM+nbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3602
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyNCwgMjAyMSAxMDoyOCBQTQ0KPiANCj4gbWFwX2RvbWFpbl9wYWdlKCkgZXQgYWwg
bmV2ZXIgZmFpbDsgbm8gbmVlZCB0byBjaGVjayB0aGVpciByZXR1cm4gdmFsdWVzDQo+IGFnYWlu
c3QgTlVMTCwgYW5kIG5vIG5lZWQgdG8gY2FycnkgZGVhZCBwcmludGsoKXMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+IEBAIC01MzAsMTIgKzUzMCw2IEBA
IHN0YXRpYyB2b2lkIGFtZF9kdW1wX3BhZ2VfdGFibGVfbGV2ZWwoc3QNCj4gICAgICAgICAgcmV0
dXJuOw0KPiANCj4gICAgICB0YWJsZV92YWRkciA9IF9fbWFwX2RvbWFpbl9wYWdlKHBnKTsNCj4g
LSAgICBpZiAoIHRhYmxlX3ZhZGRyID09IE5VTEwgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgcHJp
bnRrKCJBTUQgSU9NTVUgZmFpbGVkIHRvIG1hcCBkb21haW4gcGFnZSAlIlBSSXBhZGRyIlxuIiwN
Cj4gLSAgICAgICAgICAgICAgICBwYWdlX3RvX21hZGRyKHBnKSk7DQo+IC0gICAgICAgIHJldHVy
bjsNCj4gLSAgICB9DQo+IA0KPiAgICAgIGZvciAoIGluZGV4ID0gMDsgaW5kZXggPCBQVEVfUEVS
X1RBQkxFX1NJWkU7IGluZGV4KysgKQ0KPiAgICAgIHsNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMNCj4gQEAgLTI4MDAsMTIgKzI4MDAsNiBAQCBzdGF0aWMgdm9pZCB2dGRfZHVtcF9w
YWdlX3RhYmxlX2xldmVsKHBhDQo+ICAgICAgICAgIHJldHVybjsNCj4gDQo+ICAgICAgcHRfdmFk
ZHIgPSBtYXBfdnRkX2RvbWFpbl9wYWdlKHB0X21hZGRyKTsNCj4gLSAgICBpZiAoIHB0X3ZhZGRy
ID09IE5VTEwgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgcHJpbnRrKFZURFBSRUZJWCAiIGZhaWxl
ZCB0byBtYXAgZG9tYWluIHBhZ2UgJSJQUklwYWRkciJcbiIsDQo+IC0gICAgICAgICAgICAgICBw
dF9tYWRkcik7DQo+IC0gICAgICAgIHJldHVybjsNCj4gLSAgICB9DQo+IA0KPiAgICAgIG5leHRf
bGV2ZWwgPSBsZXZlbCAtIDE7DQo+ICAgICAgZm9yICggaSA9IDA7IGkgPCBQVEVfTlVNOyBpKysg
KQ0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvdXRpbHMuYw0KPiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvdXRpbHMuYw0KPiBAQCAtMTA2LDExICsxMDYsNiBA
QCB2b2lkIHByaW50X3Z0ZF9lbnRyaWVzKHN0cnVjdCB2dGRfaW9tbXUNCj4gICAgICB9DQo+IA0K
PiAgICAgIHJvb3RfZW50cnkgPSAoc3RydWN0IHJvb3RfZW50cnkgKiltYXBfdnRkX2RvbWFpbl9w
YWdlKGlvbW11LQ0KPiA+cm9vdF9tYWRkcik7DQo+IC0gICAgaWYgKCByb290X2VudHJ5ID09IE5V
TEwgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgcHJpbnRrKCIgICAgcm9vdF9lbnRyeSA9PSBOVUxM
XG4iKTsNCj4gLSAgICAgICAgcmV0dXJuOw0KPiAtICAgIH0NCj4gDQo+ICAgICAgcHJpbnRrKCIg
ICAgcm9vdF9lbnRyeVslMDJ4XSA9ICUiUFJJeDY0IlxuIiwgYnVzLCByb290X2VudHJ5W2J1c10u
dmFsKTsNCj4gICAgICBpZiAoICFyb290X3ByZXNlbnQocm9vdF9lbnRyeVtidXNdKSApDQo+IEBA
IC0xMjMsMTEgKzExOCw2IEBAIHZvaWQgcHJpbnRfdnRkX2VudHJpZXMoc3RydWN0IHZ0ZF9pb21t
dQ0KPiAgICAgIHZhbCA9IHJvb3RfZW50cnlbYnVzXS52YWw7DQo+ICAgICAgdW5tYXBfdnRkX2Rv
bWFpbl9wYWdlKHJvb3RfZW50cnkpOw0KPiAgICAgIGN0eHRfZW50cnkgPSBtYXBfdnRkX2RvbWFp
bl9wYWdlKHZhbCk7DQo+IC0gICAgaWYgKCBjdHh0X2VudHJ5ID09IE5VTEwgKQ0KPiAtICAgIHsN
Cj4gLSAgICAgICAgcHJpbnRrKCIgICAgY3R4dF9lbnRyeSA9PSBOVUxMXG4iKTsNCj4gLSAgICAg
ICAgcmV0dXJuOw0KPiAtICAgIH0NCj4gDQo+ICAgICAgdmFsID0gY3R4dF9lbnRyeVtkZXZmbl0u
bG87DQo+ICAgICAgcHJpbnRrKCIgICAgY29udGV4dFslMDJ4XSA9ICUiUFJJeDY0Il8lIlBSSXg2
NCJcbiIsDQo+IEBAIC0xNTEsMTEgKzE0MSw2IEBAIHZvaWQgcHJpbnRfdnRkX2VudHJpZXMoc3Ry
dWN0IHZ0ZF9pb21tdQ0KPiAgICAgIGRvDQo+ICAgICAgew0KPiAgICAgICAgICBsID0gbWFwX3Z0
ZF9kb21haW5fcGFnZSh2YWwpOw0KPiAtICAgICAgICBpZiAoIGwgPT0gTlVMTCApDQo+IC0gICAg
ICAgIHsNCj4gLSAgICAgICAgICAgIHByaW50aygiICAgIGwldSA9PSBOVUxMXG4iLCBsZXZlbCk7
DQo+IC0gICAgICAgICAgICBicmVhazsNCj4gLSAgICAgICAgfQ0KPiAgICAgICAgICBsX2luZGV4
ID0gZ2V0X2xldmVsX2luZGV4KGdtZm4sIGxldmVsKTsNCj4gICAgICAgICAgcHRlLnZhbCA9IGxb
bF9pbmRleF07DQo+ICAgICAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShsKTsNCg0K

