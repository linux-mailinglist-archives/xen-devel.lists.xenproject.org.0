Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C23EE4B9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 05:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167569.305894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFpMj-00028I-Vo; Tue, 17 Aug 2021 03:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167569.305894; Tue, 17 Aug 2021 03:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFpMj-00025n-R6; Tue, 17 Aug 2021 03:02:13 +0000
Received: by outflank-mailman (input) for mailman id 167569;
 Tue, 17 Aug 2021 03:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4v/q=NI=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mFpMi-00025h-8S
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 03:02:12 +0000
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68858d98-639c-4784-ad3e-f9e173a4420b;
 Tue, 17 Aug 2021 03:02:08 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 20:02:07 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 16 Aug 2021 20:02:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 20:02:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 20:02:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 16 Aug 2021 20:02:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 16 Aug 2021 20:02:05 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB4067.namprd11.prod.outlook.com (2603:10b6:405:7e::35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 03:02:04 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::1508:e154:a267:2cce]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::1508:e154:a267:2cce%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 03:02:04 +0000
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
X-Inumbo-ID: 68858d98-639c-4784-ad3e-f9e173a4420b
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="215709529"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="215709529"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="471015191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMUxxbxMg9RjDa4ygZ6qfV/Yk6/UJxeNvUL6XUyMahJSw55jj1Ggpxp3VAaQ9wUZEQdTARuwuUfPPL9pW4jaXfFIxgZQdravSFN/JDSvoyspqPtWDz8nTkfBRigLy4+uzbf4O9GUf+IgVFei5rypAQ/wCawNXDzb/Jjj7JuaG6XMVFyR70IsS/97YctvDlFL2R3HgdpaA0xSfDHD6i/7Ot29A1WAhhIv39MLLRoca6HJ1YfxABI/H18QNA92fXvxH+tlZw7k0HGvheoli0ltrYSSdireF0HcdPSpgRLQ0U+elGqochB4kACnoOnMxspC1ri9bXn8Q2fxC51iJBQbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNBcUqM3NGHvMDBx0zO/72O8x9CRUxq9U9yQxEQoqu8=;
 b=oAxE8TDF37jbt+xW3WRZPKbT3gQIDi8JUa3/T8JfujzqGT9m3CviYQqTUaauxHhT3iAn6RsCJiU4nRnCRtYgmw2+cFGtWYFY9oEzrkzvh+d71tm1ketnq43LnGj82CK9Wcq2zb6kkmfxtMmrKBi7xuiSUj4hbmHP3t9e2UsNxflBPYzNXlsjHqvdirFsD0gIoaQnO22lMQ/ykp69ZTy7OseDP79VLagIe0lDd3dh+5zGnU7fjYDoLJMfKDNQKia2Cgo4gQEP4z+/OTir6CCQ5582Qmo+SXcjLVPsFSapwuxvnq6p3NOxAf3VjgEd3eGrgPPpwpeOXsXE6VmWNDVBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNBcUqM3NGHvMDBx0zO/72O8x9CRUxq9U9yQxEQoqu8=;
 b=blBQFRO4LwbdkezX8idtZ/7V26ebN8uYTpiebwpZn0G8XKJdNXsQ8B710DIMCO0Ss2bTVuEKGWac5CbFh79vxdfZ/zHl21tWbyaO78OqjKn08+7rVxDvFvKRm19WatZ8SEShLWeT9thezBjzPzSnGX9DZcUjggJsFkXCQp0ARG8=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH] VT-d: Tylersburg errata apply to further steppings
Thread-Topic: [PATCH] VT-d: Tylersburg errata apply to further steppings
Thread-Index: AQHXiFilr7+Zxq88bkiPwPH18UOdyqt3F7Ag
Date: Tue, 17 Aug 2021 03:02:03 +0000
Message-ID: <BN9PR11MB5433A716C7895AB5AEFAAFC88CFE9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
In-Reply-To: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
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
x-ms-office365-filtering-correlation-id: 4f8b634a-76a5-4f70-8d94-08d9612b6416
x-ms-traffictypediagnostic: BN6PR11MB4067:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB4067E57C3E80D1CD86BCD9AE8CFE9@BN6PR11MB4067.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oi8gwZkysqnbQ4I57RIKvgEvAf5ewc6rZrYXtvNSDQmnxGCHZkCujfRVyc1ggjZbmdlMUvTo0YH8QiOCyGg8bMb+M9VQeqsxyo5c14XXtNQPv1YTo8JN9ghIXQkmEJ4i8NPvojWh9I4B2GS9mGbY+Wiz1b9xpbKn9LlAGZ+CevGtZJ7UDKqzXBXboDoGT+NRtwv67+edEjRFSz4qh8z+GfAi9BRCF47EDk8M3H31FId5ieuhPhuu/QZJVVi+dGEnM7msmJfgKkJECfoVKPZdr4rNsbVc5F4TsPkmO6sWUjpoLbl2LhGR2bjK+Da5EKyTvu7O81HWw0fOj8CbN1RrqdRFYnD246RoP2aaWGb+wLKTc2qXdmfmNCCMUEurjLi8iH6eiYGEyMkaHg/IcOV+EG3Til05JFav8aeGD7qwMLym2bqSXmDsF+lzSdVwOEjWVEewuYMiA1muiJOgQiqUwEbWe84SKxjDo3tJwAjLyTaxugn/EPesgLFt2H8UPX72KVio0vPzkaMtchEbBFJe3bUpfPE+GCNtc0tE8FW2e+lA5XSjle5nUemWisNkNheKaLnk9IEQ2e0anoo7HbSutMX0yifqF+2kXCg3REkNBg6JJPs0GhB85t4C+RI3z5ct0s4LULRaB0GQzsDu4e6QEcs/1V2dtiskdmBbWOGIr+2jzIaurelBzopRGvM/9BwPUu/X04SgY7ZEaBKtFX3NHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(83380400001)(38070700005)(6506007)(316002)(26005)(86362001)(186003)(71200400001)(38100700002)(52536014)(122000001)(55016002)(8936002)(66446008)(66556008)(5660300002)(4326008)(66946007)(7696005)(478600001)(2906002)(110136005)(64756008)(8676002)(33656002)(76116006)(66574015)(66476007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUU4QU1pMFVtaSsvNGJmYjFhOHpEODZQU2c2SUp0NDQ1QWNTaWx3RVV3bGJs?=
 =?utf-8?B?bDBBamJ2ekd2QkkrVTJaR1BCTXk1L0JscU0xMnMydkxHNkdWUEJMZ3JDMXdJ?=
 =?utf-8?B?YTBrQ1FXVEgzdjdsbmVBQ2s2Q3JVM2dKQXp1Z2QzL0cyUDMxOU1DUzJKMlE2?=
 =?utf-8?B?dUZmY05CMzJPYm00L3RLOTl1YjArNEduQjNDVURBc0tMSUVLVXc3N0Y3eW94?=
 =?utf-8?B?MkladWFLZWExc0Rad2NiR29wVG5ndis0QzY4OXQwcms3ajhJTVMrTlNCSFZW?=
 =?utf-8?B?czV4Z1l0MkplVk5abzJoOUpxVEMrQjExenRnajFLQmczQ3JOVWkzM3BoZ1hp?=
 =?utf-8?B?OWNhdmtCRjVGWmJ6Sit5ZEZ6N3hQUStrQ2xrbk1yYk45eWcwZElXSURpVHFn?=
 =?utf-8?B?RWwxWUg3cVAwQkhYcVdVblIwMVdxbS8vc2t5WEtEaktpRmVISmxwZGRyc0pm?=
 =?utf-8?B?K1VZS044VXF5cWxzSzg5ZURleFFHL0lLUzZ2c2JVNERPNzBtWWg1ZEYvTkpZ?=
 =?utf-8?B?SnNlK05PQ0JBT3NJL0xXeWdqU3VDTm0vNTV1S3prbTArQXphRXZtbmErSC83?=
 =?utf-8?B?L2UzUUtkTk5RV2JScTFlOFF4K0xHbG9mWFZ2aEZ6cmRuamNGTGJHVjFza0FU?=
 =?utf-8?B?d1ZBeWZhRWErZFEyZ0xHVWk4Q3paWGYvQ0RyUkRUMjNCdXN4dm9JTU1OZ1VB?=
 =?utf-8?B?VTFWdkFjMzZKUzRsMmo5bnJJK0N2aHBuSGJhQ0haOGJXY0M2bm5XM2IydmJl?=
 =?utf-8?B?MEYxeTREUFVDdEp6TkUrOURlZ09ZNE5IU2JXVXN1dFpmaXMwdW1JUmtEd2hj?=
 =?utf-8?B?NTFEcDJxeTlpd1g2RHdvc3hoYkdadE0zbng1N0kyc3Z1NzBvZzdkbE1aQnEx?=
 =?utf-8?B?azZsM1RmemV5cVV5MnBSMFdtTm5jNG9nVGJLMWxFcXpvbHVVS2FIenhvczBL?=
 =?utf-8?B?bERWUWtjdUU4VzYyRjMrd1l2enlGVGs1WTRENUtqSVZmQ04wcGtRbU44YXRW?=
 =?utf-8?B?VzgzdEttbVRBb2R4Wkh6Nm9rTzRBYlpQeko0d0MzRTRXWkVKbFhtVFB6Ty9o?=
 =?utf-8?B?Rmk3cjBPTkEyYk0vL1VaTDNTSUtqUHdvWmFYZTg0VzZxOVc0MldleGJuSlA5?=
 =?utf-8?B?RUhmOXN2Q292TXZrU1pKK3h5ZHdzQy9JWGRrUng2azg3YkozL3M4UG8zT3Jo?=
 =?utf-8?B?b1lwbFBwbDNCVWxpQ2x1U282QUJTTkNvd1AzaERsMWxVM245NWlFczhkMitT?=
 =?utf-8?B?SXIvVWpaSTdvSml2Q01sc2dWQzRoQnRmZXVadEh2aVdSN3BOUklRZkxIMEZK?=
 =?utf-8?B?V202azJ2VkQ0OC8xUzVtZWNOT1llZHZuZWorYVVSYmdLdEdnRXNCTkFKcjQx?=
 =?utf-8?B?NGNWdmViS21sTEl3VWRDd243TjN4OUpoRXE1OU5xR2tWRzZKbGg0ejk2R0po?=
 =?utf-8?B?eStkRHVSVWVXTTBITDhVVUFEbFVtRmJpS1pIV3Ryd2VITld5Qm1JQUJ0Ujlh?=
 =?utf-8?B?Vjc4V2dWVDlicjR2N20xU3I3NTd0VHR3NjR5YVlZc3BRcE96RXkyakpmRHZO?=
 =?utf-8?B?aldWcXpmYXBNaUJwT3RZWk8wN0pTeVBLMlpjcUQ4dWR1SGliMGdxMEt0NGov?=
 =?utf-8?B?bnRwRUxUVi8wZXd1V1Fyck03VlFXNTJVc3hINEpNdkttTENBbHVIZGFTZm15?=
 =?utf-8?B?MjFHZGRMckJYdVFmeHFzUVdEVStXVDgveTdwVDhJWk9MZUF5RklGTmN4Zk80?=
 =?utf-8?Q?em0eKoxS8zcZUOPbHK12IXD7QOg0RbLCmAPA3HD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8b634a-76a5-4f70-8d94-08d9612b6416
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 03:02:03.9357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: plUJG0npYe8sY0ehtSHjtbfsKnjCKmtLklHyvfp/e2dRrw6ViLbmlJqB4Stlm4U49UGUpBAry/gBqtfnCNDIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4067
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAzLCAyMDIxIDc6MTQgUE0NCj4gDQo+IFdoaWxlIGZvciA1NTAwIGFuZCA1NTIwIGNo
aXBzZXRzIG9ubHkgQjMgYW5kIEMyIGFyZSBtZW50aW9uZWQgaW4gdGhlDQo+IHNwZWMgdXBkYXRl
LCBYNTgncyBhbHNvIG1lbnRpb25zIEIyLCBhbmQgc2VhcmNoaW5nIHRoZSBpbnRlcm5ldCBzdWdn
ZXN0cw0KPiBzeXN0ZW1zIHdpdGggdGhpcyBzdGVwcGluZyBhcmUgYWN0dWFsbHkgaW4gdXNlLiBF
dmVuIHdvcnNlLCBmb3IgWDU4DQo+IGVycmF0dW0gIzY5IGlzIG1hcmtlZCBhcHBsaWNhYmxlIGV2
ZW4gdG8gQzIuIFNwbGl0IHRoZSBjaGVjayB0byBjb3Zlcg0KPiBhbGwgYXBwbGljYWJsZSBzdGVw
cGluZ3MgYW5kIHRvIGFsc28gcmVwb3J0IGFwcGxpY2FibGUgZXJyYXRhIG51bWJlcnMgaW4NCj4g
dGhlIGxvZyBtZXNzYWdlLiBUaGUgc3BsaXR0aW5nIHJlcXVpcmVzIHVzaW5nIHRoZSBETUkgcG9y
dCBpbnN0ZWFkIG9mDQo+IHRoZSBTeXN0ZW0gTWFuYWdlbWVudCBSZWdpc3RlcnMgZGV2aWNlLCBi
dXQgdGhhdCdzIHRoZW4gaW4gbGluZSAoYWxzbw0KPiByZXZpc2lvbiBjaGVja2luZyB3aXNlKSB3
aXRoIHRoZSBzcGVjIHVwZGF0ZXMuDQo+IA0KPiBGaXhlczogNjg5MGNlYmM2YTk4ICgiVlQtZDog
ZGVhbCB3aXRoIDU1MDAvNTUyMC9YNTggZXJyYXRhIikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IEFzIHRvIGRpc2FibGluZyBqdXN0IGludGVy
cnVwdCByZW1hcHBpbmcgKGFzIHRoZSBpbml0aWFsIHZlcnNpb24gb2YgdGhlDQo+IG9yaWdpbmFs
IHBhdGNoIGRpZCkgdnMgZGlzYWJsaW5nIHRoZSBJT01NVSBhcyBhIHdob2xlOiBVc2luZyBhIGxl
c3MNCj4gaGVhdnkgd29ya2Fyb3VuZCB3b3VsZCBvZiBjb3Vyc2UgYmUgZGVzaXJhYmxlLCBidXQg
dGhlbiB3ZSBuZWVkIHRvDQo+IGVuc3VyZSBub3QgdG8gbWlzZ3VpZGUgdGhlIHRvb2wgc3RhY2sg
YWJvdXQgdGhlIHN0YXRlIG9mIHRoZSBzeXN0ZW0uIEl0DQo+IHVzZXMgdGhlIFBIWVNDQVBfZGly
ZWN0aW8gc3lzY3RsIG91dHB1dCB0byBkZXRlcm1pbmUgd2hldGhlciBQQ0kgcGFzcy0NCj4gdGhy
b3VnaCBjYW4gYmUgbWFkZSB1c2Ugb2YsIHlldCB0aGF0IGZsYWcgaXMgZHJpdmVuIGJ5ICJpb21t
dV9lbmFibGVkIg0KPiBhbG9uZSwgd2l0aG91dCByZWdhcmQgdG8gdGhlIHNldHRpbmcgb2YgImlv
bW11X2ludHJlbWFwIi4NCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9x
dWlya3MuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcXVpcmtzLmMNCj4g
QEAgLTI2OCwyNiArMjY4LDQyIEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3NuYl90aW1lb3V0
KGNvbnMNCj4gIH0NCj4gIGN1c3RvbV9wYXJhbSgic25iX2lnZF9xdWlyayIsIHBhcnNlX3NuYl90
aW1lb3V0KTsNCj4gDQo+IC0vKiA1NTAwLzU1MjAvWDU4IENoaXBzZXQgSW50ZXJydXB0IHJlbWFw
cGluZyBlcnJhdGEsIGZvciBzdGVwcGluZyBCLTMuDQo+IC0gKiBGaXhlZCBpbiBzdGVwcGluZyBD
LTIuICovDQo+ICsvKg0KPiArICogNTUwMC81NTIwL1g1OCBjaGlwc2V0IGludGVycnVwdCByZW1h
cHBpbmcgZXJyYXRhLCBmb3Igc3RlcHBpbmdzIEIyIGFuZA0KPiBCMy4NCj4gKyAqIEZpeGVkIGlu
IHN0ZXBwaW5nIEMyIGV4Y2VwdCBvbiBYNTguDQo+ICsgKi8NCj4gIHN0YXRpYyB2b2lkIF9faW5p
dCB0eWxlcnNidXJnX2ludHJlbWFwX3F1aXJrKHZvaWQpDQo+ICB7DQo+IC0gICAgdWludDMyX3Qg
YnVzLCBkZXZpY2U7DQo+ICsgICAgdW5zaWduZWQgaW50IGJ1czsNCj4gICAgICB1aW50OF90IHJl
djsNCj4gDQo+ICAgICAgZm9yICggYnVzID0gMDsgYnVzIDwgMHgxMDA7IGJ1cysrICkNCj4gICAg
ICB7DQo+IC0gICAgICAgIC8qIE1hdGNoIG9uIFN5c3RlbSBNYW5hZ2VtZW50IFJlZ2lzdGVycyBv
biBEZXZpY2UgMjAgRnVuY3Rpb24gMCAqLw0KPiAtICAgICAgICBkZXZpY2UgPSBwY2lfY29uZl9y
ZWFkMzIoUENJX1NCREYoMCwgYnVzLCAyMCwgMCksIFBDSV9WRU5ET1JfSUQpOw0KPiAtICAgICAg
ICByZXYgPSBwY2lfY29uZl9yZWFkOChQQ0lfU0JERigwLCBidXMsIDIwLCAwKSwgUENJX1JFVklT
SU9OX0lEKTsNCj4gKyAgICAgICAgLyogTWF0Y2ggb24gRE1JIHBvcnQgKERldmljZSAwIEZ1bmN0
aW9uIDApICovDQo+ICsgICAgICAgIHJldiA9IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGKDAsIGJ1
cywgMCwgMCksIFBDSV9SRVZJU0lPTl9JRCk7DQo+IA0KPiAtICAgICAgICBpZiAoIHJldiA9PSAw
eDEzICYmIGRldmljZSA9PSAweDM0MmU4MDg2ICkNCj4gKyAgICAgICAgc3dpdGNoICggcGNpX2Nv
bmZfcmVhZDMyKFBDSV9TQkRGKDAsIGJ1cywgMCwgMCksIFBDSV9WRU5ET1JfSUQpICkNCj4gICAg
ICAgICAgew0KPiArICAgICAgICBkZWZhdWx0Og0KPiArICAgICAgICAgICAgY29udGludWU7DQo+
ICsNCj4gKyAgICAgICAgY2FzZSAweDM0MDM4MDg2OiBjYXNlIDB4MzQwNjgwODY6DQo+ICsgICAg
ICAgICAgICBpZiAoIHJldiA+PSAweDIyICkNCj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsN
Cj4gICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyBWVERQUkVGSVgNCj4gLSAgICAg
ICAgICAgICAgICAgICAiRGlzYWJsaW5nIElPTU1VIGR1ZSB0byBJbnRlbCA1NTAwLzU1MjAvWDU4
IENoaXBzZXQgZXJyYXRhICM0NywNCj4gIzUzXG4iKTsNCj4gLSAgICAgICAgICAgIGlvbW11X2Vu
YWJsZSA9IDA7DQo+ICsgICAgICAgICAgICAgICAgICAgIkRpc2FibGluZyBJT01NVSBkdWUgdG8g
SW50ZWwgNTUwMC81NTIwIGNoaXBzZXQgZXJyYXRhICM0NyBhbmQNCj4gIzUzXG4iKTsNCj4gKyAg
ICAgICAgICAgIGlvbW11X2VuYWJsZSA9IGZhbHNlOw0KPiArICAgICAgICAgICAgYnJlYWs7DQo+
ICsNCj4gKyAgICAgICAgY2FzZSAweDM0MDU4MDg2Og0KPiArICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19XQVJOSU5HIFZURFBSRUZJWA0KPiArICAgICAgICAgICAgICAgICAgICJEaXNhYmxpbmcg
SU9NTVUgZHVlIHRvIEludGVsIFg1OCBjaGlwc2V0ICVzXG4iLA0KPiArICAgICAgICAgICAgICAg
ICAgIHJldiA8IDB4MjIgPyAiZXJyYXRhICM2MiBhbmQgIzY5IiA6ICJlcnJhdHVtICM2OSIpOw0K
PiArICAgICAgICAgICAgaW9tbXVfZW5hYmxlID0gZmFsc2U7DQo+ICAgICAgICAgICAgICBicmVh
azsNCj4gICAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgIGJyZWFrOw0KPiAgICAgIH0NCj4gIH0N
Cj4gDQoNCg==

