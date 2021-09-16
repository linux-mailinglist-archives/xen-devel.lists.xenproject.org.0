Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C040D3D8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 09:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188158.337234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQluM-0001jx-5F; Thu, 16 Sep 2021 07:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188158.337234; Thu, 16 Sep 2021 07:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQluM-0001hZ-1c; Thu, 16 Sep 2021 07:34:10 +0000
Received: by outflank-mailman (input) for mailman id 188158;
 Thu, 16 Sep 2021 07:34:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQluK-0001hT-F3
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 07:34:08 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 790959e6-16c0-11ec-b5af-12813bfff9fa;
 Thu, 16 Sep 2021 07:34:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 00:34:05 -0700
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2021 00:34:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:34:05 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:34:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 00:34:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 00:34:04 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR1101MB2145.namprd11.prod.outlook.com (2603:10b6:405:51::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 07:33:57 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:33:57 +0000
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
X-Inumbo-ID: 790959e6-16c0-11ec-b5af-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286193492"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="286193492"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="530076911"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+GR2XNOBi99kb5iXTS97gmA2V4/v35N+M6cSG35mDze6o6Cwgt4A6MIO80Z6D4RiBmS8NyiSv8stsmUTS+GR0lyxZ36H8X2BlAeyV1xS4PEH3H0Hit4K1WyzNanEoRDkUaCSllUDJGYPZ4vyobZWDUnQ2ga2XJLA+EsFiLyTy958ZXdTrbEtPiUU/ja7Ht8VQEZ6+mKlDqhrQO40ej1bOKug4J6vwAAbQrBhrXz3L18rBFkD77TrDvjpf4azlKsVWbGc+tJxY1WfFEdM2GWCH1pcltBDMCPbt0746h5pK/lT6szymosui0GQUl/KtitHrhHF3p/jadcrhwbU42MDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OJGXHW0s1Fyiyy7krPVWeIvnojJmgYgs09w5r3j8a8A=;
 b=JuaN8+iwyilosb1wbV9yI8dEPdvWlv0wbmacWHd+Lda+a+usIDAH9L707DQPBR3b+8BXEnbYHHN7yTWXOt3KEmVp3gefMVrv0ULQ5w2GRb3OrdD9rbUC1T8jZNvlR5Ejv+MqYGWSL/7uEphXFf3ShIuSRvlmyawVSIBzznDt9VCUHMi6GjJIDgsGAlqtBnWiKhpoMDa5HY3Z0xEmx1IsFeuNSx7SMlAslHVeYtwKoYLpBCNQhYqxJqJz703U+8VdUfYbGHdBr7FsnU4+QJ/YYkL9OixX13piEe61YaWjnKWCPT+NWMSPbV/4d4TeZPgMjuY2Jgd83OZ7pI/DCvKUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJGXHW0s1Fyiyy7krPVWeIvnojJmgYgs09w5r3j8a8A=;
 b=wGaMI4bLXOpo2owSE//76bx3fqNYI0cf99CTnNqKlekEQwnyHG9qvastvueJ5U6h2knxJecBuefB3s4NN8h5jQBfsLP9QptyukDpHPnXNsVYBg7ND4xWeK5YHgEo1k0wicaNi+TBcoDj9bZwgr8rt9if6FBUh6GhvyLgBM0Td7k=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH 15/17] IOMMU: page table dumping adjustments
Thread-Topic: [PATCH 15/17] IOMMU: page table dumping adjustments
Thread-Index: AQHXmPQtySERcVTCKU+CLBLd1PeNTKuCttiAgCOxiVA=
Date: Thu, 16 Sep 2021 07:33:57 +0000
Message-ID: <BN9PR11MB5433F917721197AE7109C3798CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <d6b3d7e4-7ea0-387c-86d1-1fb3c59688fe@suse.com>
 <666ce0fd-5bc1-f12c-4a13-93bf441a4ce4@suse.com>
In-Reply-To: <666ce0fd-5bc1-f12c-4a13-93bf441a4ce4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44f2779e-dfd9-401c-6784-08d978e45844
x-ms-traffictypediagnostic: BN6PR1101MB2145:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR1101MB2145CF7C8B3165367441BAAE8CDC9@BN6PR1101MB2145.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DFMbTl6eRMHA6yVsEz2BBc21Q1Cf9uGgJ64u7Xx5OclRmCGaJpTOg3DMzq5uociLxeKpe3vdrMpY/lGSRTRkONsYoIFrEJR4KOR1gBZIGg2R1sEj6UKPuSkBI3Yf3QoGFUrkRiIFv1INzteMBdTOemjrlln0Yx3NwNRffoOP/jm2JVu/MRn1x9L0cuKn/yi2br9o59tQdIUUcsZzkBZTizyYEBMjJkh/bPhbQs72CGF4SVwqTkaDHPc4boq9RhTOEukurCFO8lfW2SdyJb9NBtEaI6KvCciEQ/WvIOT5ZLf6YjTfS9thTb8c0bZO9dR9thtDkkHLCi9hN9jjhFXt8SzKo5zhieBW234k/UorswJ8w+EkA7ML7wRcpO0Q+/cIwuDug4elKZhIiWS45/U/uMX6n1QbrwDIuAgIvMhsJv7vIXQoju0jrmjAfrDnbZ0aHyZpzeRp49AbwnWGbAy10Zc0PH4WyAUnAUj1EI60Nqwpx0BdaJj8Ysv8exxf++YdKQEsEYQRs1dicFKZ0uBecN3G459I4TCxUhgZ/aiWdADK/htXWooMnjvc+zENC9UrDmDWM0mHw7lMk3/PL5F5tuxzxq3i5nE8WMVAL/HWVp9mRBsCP3hXZGEzuxtq35/RvIKqlswnP8jbuhpSME6n4ZmxoQwLk9UQStHyQMsaAsGpiFXLX/JOqdaS93r3jzUGb6GIpG73IrqI8h07lF1k7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(8676002)(7696005)(8936002)(53546011)(4326008)(2906002)(38070700005)(83380400001)(71200400001)(6506007)(316002)(52536014)(478600001)(38100700002)(54906003)(110136005)(186003)(5660300002)(26005)(55016002)(9686003)(76116006)(66476007)(66946007)(66556008)(66446008)(64756008)(86362001)(33656002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Lyt3S0puUXFaOUFGWVUySnBWaGg0Yk90VGdzT1RQU2V4R2kwL1JKM0JBcDdq?=
 =?utf-8?B?bGJoRlFVT2VBQlhsRkJ4elJPTHcrRTUzcXhiNk5yWGVqMWwxQ3dTYVlnNjl0?=
 =?utf-8?B?dXR0bXdGV094OGhXUGUzeUtza0JFWkU4UkZoYmpPcUwrc0R5QUVIS2hxOFVB?=
 =?utf-8?B?Z2gya3FuU2RORGRLZlg5OVJ4SDR4QXZXcVFvdlNTSGtyOHBtYlo2c2ZsRHcr?=
 =?utf-8?B?MFdIQjhUcjBERS9rc2hab0swby9JdU1Nazd3Tjg5MFpPTDZKcHJ3amp0Z3NF?=
 =?utf-8?B?VXJjcUgyQ1Z0dlRIaGorSk9oQkRPZlJJUm1nRW1DMXcxL1Q5QXVoODhSRGIx?=
 =?utf-8?B?MjJ0dTJwNDVmaFdvdXA0NTROQUYvdXFpNzlIcjRtWk5PQlk2U0FEWWlGL3ZQ?=
 =?utf-8?B?aXFMU0RUT1Z0UEFNbndPUm1mZnNUbytwZVRvU3J5dHhJb3laSENJcjFKVWE0?=
 =?utf-8?B?Nlk1QlNuWUo3LzZrM01iSkMzRnVEMVlrRHVocG5OQ3NUQ1FGM28zS1dxY0pJ?=
 =?utf-8?B?VDAwYkdFYWowMkZudHF4ajEvYnZ2UkhKTVMva3dSVGp1djNSeUFJVnZnTnRF?=
 =?utf-8?B?bWttSjUwcUtmcitYQ0Q2VFpLZzkwOVFzK3dtcTNSUDZRQ1BEV00rY2xlYWRL?=
 =?utf-8?B?Tk1CcGt5SDV3VHlhRWNKUHhmZjBVbnZWMDlXcDZyS3lqc0JJblNHbWd5ekVC?=
 =?utf-8?B?Uks3SHZaS0wyZGxGRnh5Z1ZYTEs3cEo3SHRmNis4L29LeDV3czJBczZxZVZU?=
 =?utf-8?B?aC9FQnplYkdYMW1UUTJKdG10SXlpbEFiUzY5OWQ0czVMS2FPSTI0eXB1dGJS?=
 =?utf-8?B?ZDhtK1dra1pMeVd1alpoT2UrRUhXOFhoN3VLRjROWlhpMjcwTXU5bitFdndP?=
 =?utf-8?B?R3pQeEtVbUxINmtTenl4U3JNVnlzZjh1UDlGZEV5blNxcGlnUElGeFJFdW9T?=
 =?utf-8?B?dkhTRExha3MxR3plcGk1M1YzaUZvSjdYVlE0Q2FHZnROdUNubjVsWHgrWkpB?=
 =?utf-8?B?TERkU2NRcGIyVmpxR1M2N3lnVXBVa0JwUVZYYURLaDcrOWluMFN6YlR6anpy?=
 =?utf-8?B?TWJkZkpESlF5Nk5CZXJhYktFcTB4U3RWRUtQS3U3Znc0d3VjRTM3OU00SEo0?=
 =?utf-8?B?NGxvVHZGMzg5R3k3WkRDSFhXdDZjZENwM09HQm40S09wY2syUzdEUHpQL0RP?=
 =?utf-8?B?a05RZllUQ1ZIWnpmSFdUSS9GeWtEeVd2L3dmekcySExQd2VXL2RIM1ZvZUtF?=
 =?utf-8?B?WGtGSXc1RS9yU0pSV2xETzZ1UHpSV2tRQ21CSlEzYXJ5NzlQZUFFY2FoaTVY?=
 =?utf-8?B?VzQ3NjV6RnBmdmhWcTZ4ZmJ4ZUg3cmJvd0psYlRSa25HVEpsbk9FejBDUS83?=
 =?utf-8?B?V1BibTdoRERvSDAzN3JpOHp5WjlicDU1VkhaWWdBYTVPeE9IVHhmYmxrZ1RL?=
 =?utf-8?B?N1EzRUJiQXZUbWRuemRNQ3J0ZnpLZXFiN0ZubFE5RkZRSGMwS1NZYUpHUE4r?=
 =?utf-8?B?OEpTcEVXaTJldHQ5TTYyaGc3UmpKOXV0aTRWV0NNYmtVaC9Ec0VkQVZRQ1dn?=
 =?utf-8?B?VHNwSHptYU9GaDhWSXlnVExpSEtmb1Z6eXIxbjVQcEdOY1drTDZyWFpJeTdQ?=
 =?utf-8?B?WUZRRXd0ZnRPNzNJNzB1OGxEaFpCTG55RWZWR2p1RVVvQnZEcWxSeDJ5a2dT?=
 =?utf-8?B?b1FFZWR5anZNQ0xSNEdoeDFZSzRqVUg4RG1FbFR2d1AyV294UUhwYUpBSTVk?=
 =?utf-8?Q?bBzVfZAk1e4HuoiYolAcpToYLeNAsEQPjrzRRg/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f2779e-dfd9-401c-6784-08d978e45844
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:33:57.7559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTVq6RwcLIZYBenmYKdDzrz4F7xrOJBVx6VY45kGh4/2Njskv+JxWUF6NkqumsDOEn5x8I/ZlvuT9tYvR1BkuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2145
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyNCwgMjAyMSAxMDoyOSBQTQ0KPiANCj4gT24gMjQuMDguMjAyMSAxNjoyNiwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+ID4gRm9yIG9uZSBub25lIG9mIHRoZSB0aHJlZSBJT01NVSBpbXBs
ZW1lbnRhdGlvbnMgb24gQXJtIHNwZWNpZnkgYQ0KPiBkdW1waW5nDQo+ID4gaG9vay4gR2VuZXJh
bGl6ZSBWVC1kJ3MgImRvbid0IGR1bXAgc2hhcmVkIHBhZ2UgdGFibGVzIiB0byBjb3ZlciBmb3IN
Cj4gPiB0aGlzLg0KPiA+DQo+ID4gRnVydGhlciBpbiB0aGUgcGFzdCBJIHdhcyB0b2xkIHRoYXQg
b24gQXJtIGluIHByaW5jaXBsZSB0aGVyZSBjb3VsZCBiZQ0KPiA+IG11bHRpcGxlIGRpZmZlcmVu
dCBJT01NVXMsIGFuZCBoZW5jZSBkaWZmZXJlbnQgZG9tYWlucycgcGxhdGZvcm1fb3BzDQo+ID4g
cG9pbnRlcnMgY291bGQgZGlmZmVyLiBVc2UgZWFjaCBkb21haW4ncyBvcHMgZm9yIGNhbGxpbmcg
dGhlIGR1bXAgaG9vay4NCj4gPiAoSW4gdGhlIGxvbmcgcnVuIGFsbCB1c2VzIG9mIGlvbW11X2dl
dF9vcHMoKSB3b3VsZCBsaWtlbHkgbmVlZCB0bw0KPiA+IGRpc2FwcGVhciBmb3IgdGhpcyByZWFz
b24uKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiANCj4gU2hvdWxkIGhhdmUgQ2MtZWQgS2V2aW4gb24gdGhpcyBvbmUgYXMgd2VsbDsg
bm93IGFkZGVkLg0KPiANCj4gSmFuDQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4NCg0KPiANCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiA+IEBA
IC02NDAsMTIgKzY0MCw5IEBAIGJvb2xfdCBpb21tdV9oYXNfZmVhdHVyZShzdHJ1Y3QgZG9tYWlu
ICoNCj4gPiAgc3RhdGljIHZvaWQgaW9tbXVfZHVtcF9wYWdlX3RhYmxlcyh1bnNpZ25lZCBjaGFy
IGtleSkNCj4gPiAgew0KPiA+ICAgICAgc3RydWN0IGRvbWFpbiAqZDsNCj4gPiAtICAgIGNvbnN0
IHN0cnVjdCBpb21tdV9vcHMgKm9wczsNCj4gPg0KPiA+ICAgICAgQVNTRVJUKGlvbW11X2VuYWJs
ZWQpOw0KPiA+DQo+ID4gLSAgICBvcHMgPSBpb21tdV9nZXRfb3BzKCk7DQo+ID4gLQ0KPiA+ICAg
ICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOw0KPiA+DQo+ID4gICAgICBmb3Jf
ZWFjaF9kb21haW4oZCkNCj4gPiBAQCAtNjUzLDcgKzY1MCwxMyBAQCBzdGF0aWMgdm9pZCBpb21t
dV9kdW1wX3BhZ2VfdGFibGVzKHVuc2lnDQo+ID4gICAgICAgICAgaWYgKCBpc19oYXJkd2FyZV9k
b21haW4oZCkgfHwgIWlzX2lvbW11X2VuYWJsZWQoZCkgKQ0KPiA+ICAgICAgICAgICAgICBjb250
aW51ZTsNCj4gPg0KPiA+IC0gICAgICAgIG9wcy0+ZHVtcF9wYWdlX3RhYmxlcyhkKTsNCj4gPiAr
ICAgICAgICBpZiAoIGlvbW11X3VzZV9oYXBfcHQoZCkgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiAr
ICAgICAgICAgICAgcHJpbnRrKCIlcGQgc2hhcmluZyBwYWdlIHRhYmxlc1xuIiwgZCk7DQo+ID4g
KyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsgICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAg
ICAgZG9tX2lvbW11KGQpLT5wbGF0Zm9ybV9vcHMtPmR1bXBfcGFnZV90YWJsZXMoZCk7DQo+ID4g
ICAgICB9DQo+ID4NCj4gPiAgICAgIHJjdV9yZWFkX3VubG9jaygmZG9tbGlzdF9yZWFkX2xvY2sp
Ow0KPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ID4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gPiBAQCAtMjgzNSwxMiAr
MjgzNSw2IEBAIHN0YXRpYyB2b2lkIHZ0ZF9kdW1wX3BhZ2VfdGFibGVzKHN0cnVjdA0KPiA+ICB7
DQo+ID4gICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsN
Cj4gPg0KPiA+IC0gICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkNCj4gPiAtICAgIHsNCj4g
PiAtICAgICAgICBwcmludGsoVlREUFJFRklYICIgJXBkIHNoYXJpbmcgRVBUIHRhYmxlXG4iLCBk
KTsNCj4gPiAtICAgICAgICByZXR1cm47DQo+ID4gLSAgICB9DQo+ID4gLQ0KPiA+ICAgICAgcHJp
bnRrKFZURFBSRUZJWCIgJXBkIHRhYmxlIGhhcyAlZCBsZXZlbHNcbiIsIGQsDQo+ID4gICAgICAg
ICAgICAgYWdhd190b19sZXZlbChoZC0+YXJjaC52dGQuYWdhdykpOw0KPiA+ICAgICAgdnRkX2R1
bXBfcGFnZV90YWJsZV9sZXZlbChoZC0+YXJjaC52dGQucGdkX21hZGRyLA0KPiA+DQo+ID4NCg0K

