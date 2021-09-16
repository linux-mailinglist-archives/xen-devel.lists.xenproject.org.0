Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B69140D446
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 10:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188207.337289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmP5-0008UI-6Y; Thu, 16 Sep 2021 08:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188207.337289; Thu, 16 Sep 2021 08:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmP5-0008SI-38; Thu, 16 Sep 2021 08:05:55 +0000
Received: by outflank-mailman (input) for mailman id 188207;
 Thu, 16 Sep 2021 08:05:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQmP3-0008SC-4X
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 08:05:53 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 391dfdb6-36fd-4bed-bbe6-0371b73f4da5;
 Thu, 16 Sep 2021 08:05:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 01:05:45 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2021 01:05:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 01:05:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 01:05:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 01:05:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 01:05:44 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3699.namprd11.prod.outlook.com (2603:10b6:408:83::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 16 Sep
 2021 08:05:41 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 08:05:41 +0000
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
X-Inumbo-ID: 391dfdb6-36fd-4bed-bbe6-0371b73f4da5
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286198014"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="286198014"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="553741054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYtOjjMTiuIp2Ro3qb/DxjmRrSArFGVKbpnH5ARkYucLwGkGSz0usf7AoyFmIGvjtWYVFRraEi3KKRfr/QhfWZGCYtiXzzVnXcIkvihpcMDuP2UDIckToZgzh65DdehLflw6UBfOYki4TET9Dla5MDshLfROkkE2iC+xEXgScjYCS7SYxIR9E/80bLv61UBT/wDsPImDJjDLNzHhT7X/glHC3+Oj+WLouuQnv+NvAAm12McRj/BvjxiG+uobLrPtjiWsV1kZ94aH41qWi+b0mZT9UiPwqFbEK8w4QHnGBzydcFsL/zFHIGFy8/VYsaSOeAfGespQ+jOzf4yHEDQTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O8LK+FM6yRRrBERZwJtz3BrL+nVaynG4glbh+0FvoHo=;
 b=cN11K+v+y6UPUEIHYWOExRRfQIAUj+zRWLVWupCZMHe0WIkm6o750ufgoNsTLAz8MK7lmSYJc4aZ69bWJe/sbzeYmCPX4NEXt+xYYvj4AvO4ttl+yVApWaZ8EjJ2BCUACLGSYkN0hkDSx1xE0ZCq6VZYdhpNE2+sZk+t49qAo1ytVjuwqYf8TYRy85TrtnWhiQaRMaooIh0XSV0/+taQ45bgTaee8k0Fyfc/044pea2dc6nON9Mfaj0aoHLHkXq0xFQ2vjxebKK+hBb2fqNHUsuay2Wq1z51tkuYxf+87Fb399FyrVKzMvO/bCvBE/OzGxR9Ns3DS49jGFxMwtm+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8LK+FM6yRRrBERZwJtz3BrL+nVaynG4glbh+0FvoHo=;
 b=XKevgCXZbnUmPiCT+6gt0lThcLwCfesV7prgf+fwQHdyxV6a9NhMS4KsS9+sPKUpgJ+jg4oYEOQgpEYKWKJ3ge2zKvGtS3UZd34X1I36P6Ha1dTfRdlLYzn2YJzBcAAzZIMNTrZ5ijixAhF3XUCrFt/nOTh6LyLdtIPMKRx4HcA=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: RE: [PATCH 1/4] VT-d: defer "no DRHD" check when (un)mapping devices
Thread-Topic: [PATCH 1/4] VT-d: defer "no DRHD" check when (un)mapping devices
Thread-Index: AQHXqhHWObtnwR6OkEiPWNnUbTtn96umTpdw
Date: Thu, 16 Sep 2021 08:05:41 +0000
Message-ID: <BN9PR11MB5433D08EC8FA6237C79832F88CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
 <afd4520f-7966-eec6-b1dd-9e0c12dc8836@suse.com>
In-Reply-To: <afd4520f-7966-eec6-b1dd-9e0c12dc8836@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44a8e863-e549-4b7a-2574-08d978e8c6e9
x-ms-traffictypediagnostic: BN8PR11MB3699:
x-microsoft-antispam-prvs: <BN8PR11MB36991AA85A02EB0420A1F09D8CDC9@BN8PR11MB3699.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a2PKcd5rE+1mwDbPvm3uT0ChlY66sGIJJmTqYCIY3FPsHNhxJYoxMpfaG8b3Zn/I2qt6/B9P2XOGk350wwLzoWk17HvovNKVGRqjJtd9bATBlr6584dRxvSGQxyc1EnnSDX3PkXyFpEedxjb5Dt5YzBuR7+X0oGYogwCun3jP5+PHg6ifo08s7Ncd/c/5QRR0cTW+bLAy40AM7+0K6nRZJKtYkXF4dHMlaqBFXkscp0z9Vdshelw/Gv2MCH4CLitRwioVEr0wY17QGUHEDUuIitPn4nFRy6jOdseBGdmyT49VJ6sMfMHzFvW9rjNoDA2Vh1SwhhAMLMqGxfG/XoewIdZ2CNOkQqO2hG/5hUjB9X3ruFyzO1JmocSPV/iEDaKqmZA3h2pHYbypsYrjDpJLrnGfx6uBi5/bRNIS0G0Yt/Y9EL7cC4BRF/7DRJkXzENwlyGQXNx05v1BqbFae1sDHOOB+OxNmyHd5kxpsGVeXX9mWRmpTY1DQLPuCYqk3jNJn8XC3dxeAgA3VwlHUipzw6/tHLw/GzafiVsIDuVP9ZAxVJAr8nvCeoSJVkGrT+gAzT5hlUrX0il7y3OyUQucGsZhqcg4XsQG0Cqx+DOad+I64DVorkgEMLqozO0FDYzUQOwQnFS3Ew3IuNZmyR8Pct4skzz99eTDFovHX8lQnR0qxXys0yuoEDNuTzv2euaaCMq8g4y5XBquBOPvrJB8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(86362001)(66446008)(71200400001)(110136005)(76116006)(4326008)(38100700002)(8676002)(7696005)(26005)(55016002)(122000001)(52536014)(8936002)(33656002)(9686003)(2906002)(478600001)(64756008)(6506007)(83380400001)(316002)(66946007)(38070700005)(186003)(66556008)(66476007)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUMwTGhQVHVDd3hrM3BZMHNSWmVFc0x4T2pIdWdTQ05naU02TUdDRE4vUHY1?=
 =?utf-8?B?MXRMWGpGODZkODM5NVdtejhXWWRzd3RxbTA2dm5CYnU4c2hodURXNlRZTGxH?=
 =?utf-8?B?d3NjazVsbTl1MGNaVStNWWtwUlhGWHBmUUxUQ2gzVC84UGl6OVJic3pTazN6?=
 =?utf-8?B?QThDRlUwMHZDMDRjNmYyUTlRakEwanhyODNJZXR5b1hTSEgzNTM5alZnRGlE?=
 =?utf-8?B?UVN1QThBY2lORS9YOWJvc2tRVjRKZUpYOG5xWGRZOVVTVzc5SE9qMUViVitP?=
 =?utf-8?B?OExZdWUzaXUrTTUxM3Bic0xycGwyY2dzQ2xjSG5aelJqZkMvZitMR1BMdk5o?=
 =?utf-8?B?aW5uZTlCMkk1RjZsUldUQW5YdTNaaUs2b1FIKzJ0am1JTi9QR1JOSW1PVnJu?=
 =?utf-8?B?bWhWUGRTK1BnZHQwK0xEV2JsWmpxZmRBWEd6MXN6SjVsa2V4alFOc2huYnJJ?=
 =?utf-8?B?ZnJ2cGtUMHJ6MHhiaTlYalJDc2RWUFJHVHJmdUMzVVVwYThic1dEMTZTZGVB?=
 =?utf-8?B?YnNabnRVMlBNY1krTWJOQXJEa2J0c21uSzlBTXAxQkljaHNXcllEUEhITjhM?=
 =?utf-8?B?QklZT1JabU4rSzBHVzN5azNjNHRxcHhqYk9ueDhDN0kyeTFsTGxaTDZ4Z1Vq?=
 =?utf-8?B?L1Q1ZnVmVmdyRTQ3aS9VSEhTTTBuMmxPTHpyaWR2enBTMHBQVzlXVmUraWgz?=
 =?utf-8?B?VVdJc3lVR0xFWnJvVkdjUWp1ak11UUFlM2luUEZnR3pIb1FZZHp2T1BnMFh6?=
 =?utf-8?B?S25zeW1BSUhEWWNUa053Zm1ldk4wblBjU3BkOHFxV0ROUU1ER29Vbnh0aFpa?=
 =?utf-8?B?RmE1ME5FNm96bDd5cDV1ejJIclBUbkhWTHp2UkRCYW9mOVR0ZmVuNUZZLytl?=
 =?utf-8?B?ZE1SSHY4UXdqaGtnck8xZDZSWTIxaXdJR3VjWnRMRTR6UHdBOHNrNUVSWEhG?=
 =?utf-8?B?Uktrc0NpOGNGNkpwVklKQXhYd0hNdlFQcC9QM1VRZXM1K29YQXhwWkJ5YVBi?=
 =?utf-8?B?Y2J1cFltekcxOTIxSHYxWmVnMnJHbzNjcE91cFBGTzJ2a21wTkU3ZXFLSEpL?=
 =?utf-8?B?ZVlaZmpNRHlYVFJwdzJYMWx2d1E0OCtIMnJXdkZrb0ROamJETEFlMkJxazU1?=
 =?utf-8?B?eUxpSEF0QkRqMWI0NGM0cjl4Y2p1Q2RySXhRa2pjWWJFYXcrT2wwZGI0SExF?=
 =?utf-8?B?UWtDL1RBV0sxazdmdkNXV2ZBVDZZSnNCNDh0dk5mM0g0WkhaVXVuYndEbVQ1?=
 =?utf-8?B?eUJ5OEFXdHNQOWlMV1N4RUJiYnVqcmJ3V3RMaUk4bzhuM0RmdFhHZnByb2Ex?=
 =?utf-8?B?cXJIWHhCRWczTVlJMkZUQTF2TFZLMDN3ZmtveWI4dmQxTjJ6MW10cmx5dEpO?=
 =?utf-8?B?MXRvTHZELzlFL28vSm0xaUdDQkMzWFJCYVdmSkcyaVByQzI0cko5Zm1HVnRD?=
 =?utf-8?B?OFNjdlNJQWpJU1JlNWU5UWUxeHQvQ2crb2szdGcrRFV5M1oyM044RHpUdTl4?=
 =?utf-8?B?VFdOUlFXeTkvN3ZDY3FhVUdETVpUQldEZnE5UE95OEFHcVNTclIyZDQ0QUE2?=
 =?utf-8?B?S3o4U1VmUzBCVjRQQmhWOWZWN1R3TjVpd1JMTHNoL1NVaWM4bjVlZGU4dVJK?=
 =?utf-8?B?a0JPcUpuandBbFNteHQwL21QTUxpdmxLQ2phdGw3S1QwK1RCYkxCNlBwN2Rm?=
 =?utf-8?B?aDVMU2YxTlN1TjRUOW9rRHdkSWQ2a1IzdzhWdXA0SDFTbzlxR0F6WU5QU1ln?=
 =?utf-8?Q?D0JOUIQhk5U5tbymjFbNPA6dlwC1U9zveHs/vpv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a8e863-e549-4b7a-2574-08d978e8c6e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 08:05:41.3957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5YWi9bMmfvlBE2Jg4jSF8aQu3/kZ3SQ5Hka1yL43gi8seSoNsC+PQgtHE6gi9F7ioug75VnbYZB/PWwxJ/nyxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3699
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgU2VwdGVtYmVyIDE1LCAyMDIxIDU6MTIgUE0NCj4gDQo+IElmIGRldmljZXMgYXJlIHRvIGJl
IHNraXBwZWQgYW55d2F5ICh3aGljaCBpcyB0aGUgY2FzZSBpbiBwYXJ0aWN1bGFyIGZvcg0KPiBo
b3N0IGJyaWRnZXMpLCB0aGVyZSdzIG5vIHBvaW50IGNvbXBsYWluaW5nIGFib3V0IGEgbWlzc2lu
ZyBEUkhEIChhbmQNCj4gaGVuY2UgYSBtaXNzaW5nIGFzc29jaWF0aW9uIHdpdGggYW4gSU9NTVUp
Lg0KPiANCj4gV2hpbGUgdGhlcmUgY29udmVydCBhc3NpZ25tZW50cyB0byBpbml0aWFsaXplcnMg
YW5kIGNvbnN0aWZ5ICJkcmhkIg0KPiBsb2NhbCB2YXJpYWJsZXMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
dnRkL2lvbW11LmMNCj4gQEAgLTE0NjAsMTQgKzE0NjAsMTAgQEAgc3RhdGljIGludCBkb21haW5f
Y29udGV4dF91bm1hcChzdHJ1Y3QgZA0KPiAgc3RhdGljIGludCBkb21haW5fY29udGV4dF9tYXBw
aW5nKHN0cnVjdCBkb21haW4gKmRvbWFpbiwgdTggZGV2Zm4sDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICB7DQo+IC0gICAgc3Ry
dWN0IGFjcGlfZHJoZF91bml0ICpkcmhkOw0KPiArICAgIGNvbnN0IHN0cnVjdCBhY3BpX2RyaGRf
dW5pdCAqZHJoZCA9IGFjcGlfZmluZF9tYXRjaGVkX2RyaGRfdW5pdChwZGV2KTsNCj4gICAgICBp
bnQgcmV0ID0gMDsNCj4gICAgICB1OCBzZWcgPSBwZGV2LT5zZWcsIGJ1cyA9IHBkZXYtPmJ1cywg
c2VjYnVzOw0KPiANCj4gLSAgICBkcmhkID0gYWNwaV9maW5kX21hdGNoZWRfZHJoZF91bml0KHBk
ZXYpOw0KPiAtICAgIGlmICggIWRyaGQgKQ0KPiAtICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4g
LQ0KPiAgICAgIC8qDQo+ICAgICAgICogR2VuZXJhbGx5IHdlIGFzc3VtZSBvbmx5IGRldmljZXMg
ZnJvbSBvbmUgbm9kZSB0byBnZXQgYXNzaWduZWQgdG8gYQ0KPiAgICAgICAqIGdpdmVuIGd1ZXN0
LiAgQnV0IGV2ZW4gaWYgbm90LCBieSByZXBsYWNpbmcgdGhlIHByaW9yIHZhbHVlIGhlcmUgd2UN
Cj4gQEAgLTE0NzYsNyArMTQ3Miw3IEBAIHN0YXRpYyBpbnQgZG9tYWluX2NvbnRleHRfbWFwcGlu
ZyhzdHJ1Y3QNCj4gICAgICAgKiB0aGlzIG9yIG90aGVyIGRldmljZXMgbWF5IGJlIHBlbmFsaXpl
ZCB0aGVuLCBidXQgc29tZSB3b3VsZCBhbHNvIGJlDQo+ICAgICAgICogaWYgd2UgbGVmdCBvdGhl
ciB0aGFuIE5VTUFfTk9fTk9ERSB1bnRvdWNoZWQgaGVyZS4NCj4gICAgICAgKi8NCj4gLSAgICBp
ZiAoIGRyaGQtPmlvbW11LT5ub2RlICE9IE5VTUFfTk9fTk9ERSApDQo+ICsgICAgaWYgKCBkcmhk
ICYmIGRyaGQtPmlvbW11LT5ub2RlICE9IE5VTUFfTk9fTk9ERSApDQo+ICAgICAgICAgIGRvbV9p
b21tdShkb21haW4pLT5ub2RlID0gZHJoZC0+aW9tbXUtPm5vZGU7DQo+IA0KPiAgICAgIEFTU0VS
VChwY2lkZXZzX2xvY2tlZCgpKTsNCj4gQEAgLTE0OTcsNiArMTQ5Myw5IEBAIHN0YXRpYyBpbnQg
ZG9tYWluX2NvbnRleHRfbWFwcGluZyhzdHJ1Y3QNCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiAg
ICAgIGNhc2UgREVWX1RZUEVfUENJZV9FTkRQT0lOVDoNCj4gKyAgICAgICAgaWYgKCAhZHJoZCAp
DQo+ICsgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gKw0KPiAgICAgICAgICBpZiAoIGlv
bW11X2RlYnVnICkNCj4gICAgICAgICAgICAgIHByaW50ayhWVERQUkVGSVggIiVwZDpQQ0llOiBt
YXAgJXBwXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgIGRvbWFpbiwgJlBDSV9TQkRGMyhzZWcs
IGJ1cywgZGV2Zm4pKTsNCj4gQEAgLTE1MDgsNiArMTUwNyw5IEBAIHN0YXRpYyBpbnQgZG9tYWlu
X2NvbnRleHRfbWFwcGluZyhzdHJ1Y3QNCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiAgICAgIGNh
c2UgREVWX1RZUEVfUENJOg0KPiArICAgICAgICBpZiAoICFkcmhkICkNCj4gKyAgICAgICAgICAg
IHJldHVybiAtRU5PREVWOw0KPiArDQo+ICAgICAgICAgIGlmICggaW9tbXVfZGVidWcgKQ0KPiAg
ICAgICAgICAgICAgcHJpbnRrKFZURFBSRUZJWCAiJXBkOlBDSTogbWFwICVwcFxuIiwNCj4gICAg
ICAgICAgICAgICAgICAgICBkb21haW4sICZQQ0lfU0JERjMoc2VnLCBidXMsIGRldmZuKSk7DQo+
IEBAIC0xNjUxLDE3ICsxNjUzLDEyIEBAIGludCBkb21haW5fY29udGV4dF91bm1hcF9vbmUoDQo+
ICBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X3VubWFwKHN0cnVjdCBkb21haW4gKmRvbWFpbiwg
dTggZGV2Zm4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQ0KPiAgew0KPiAtICAgIHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZDsNCj4g
LSAgICBzdHJ1Y3QgdnRkX2lvbW11ICppb21tdTsNCj4gKyAgICBjb25zdCBzdHJ1Y3QgYWNwaV9k
cmhkX3VuaXQgKmRyaGQgPSBhY3BpX2ZpbmRfbWF0Y2hlZF9kcmhkX3VuaXQocGRldik7DQo+ICsg
ICAgc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUgPSBkcmhkID8gZHJoZC0+aW9tbXUgOiBOVUxMOw0K
PiAgICAgIGludCByZXQ7DQo+ICAgICAgdTggc2VnID0gcGRldi0+c2VnLCBidXMgPSBwZGV2LT5i
dXMsIHRtcF9idXMsIHRtcF9kZXZmbiwgc2VjYnVzOw0KPiAgICAgIGludCBmb3VuZCA9IDA7DQo+
IA0KPiAtICAgIGRyaGQgPSBhY3BpX2ZpbmRfbWF0Y2hlZF9kcmhkX3VuaXQocGRldik7DQo+IC0g
ICAgaWYgKCAhZHJoZCApDQo+IC0gICAgICAgIHJldHVybiAtRU5PREVWOw0KPiAtICAgIGlvbW11
ID0gZHJoZC0+aW9tbXU7DQo+IC0NCj4gICAgICBzd2l0Y2ggKCBwZGV2LT50eXBlICkNCj4gICAg
ICB7DQo+ICAgICAgY2FzZSBERVZfVFlQRV9QQ0lfSE9TVF9CUklER0U6DQo+IEBAIC0xNjc2LDYg
KzE2NzMsOSBAQCBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X3VubWFwKHN0cnVjdCBkDQo+ICAg
ICAgICAgIHJldHVybiAwOw0KPiANCj4gICAgICBjYXNlIERFVl9UWVBFX1BDSWVfRU5EUE9JTlQ6
DQo+ICsgICAgICAgIGlmICggIWlvbW11ICkNCj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PREVW
Ow0KPiArDQo+ICAgICAgICAgIGlmICggaW9tbXVfZGVidWcgKQ0KPiAgICAgICAgICAgICAgcHJp
bnRrKFZURFBSRUZJWCAiJXBkOlBDSWU6IHVubWFwICVwcFxuIiwNCj4gICAgICAgICAgICAgICAg
ICAgICBkb21haW4sICZQQ0lfU0JERjMoc2VnLCBidXMsIGRldmZuKSk7DQo+IEBAIC0xNjg2LDYg
KzE2ODYsOSBAQCBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X3VubWFwKHN0cnVjdCBkDQo+ICAg
ICAgICAgIGJyZWFrOw0KPiANCj4gICAgICBjYXNlIERFVl9UWVBFX1BDSToNCj4gKyAgICAgICAg
aWYgKCAhaW9tbXUgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ICsNCj4gICAg
ICAgICAgaWYgKCBpb21tdV9kZWJ1ZyApDQo+ICAgICAgICAgICAgICBwcmludGsoVlREUFJFRklY
ICIlcGQ6UENJOiB1bm1hcCAlcHBcbiIsDQo+ICAgICAgICAgICAgICAgICAgICAgZG9tYWluLCAm
UENJX1NCREYzKHNlZywgYnVzLCBkZXZmbikpOw0KDQo=

