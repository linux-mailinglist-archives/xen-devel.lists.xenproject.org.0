Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA83BE09C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 03:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151798.280465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0wTT-0004E3-ID; Wed, 07 Jul 2021 01:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151798.280465; Wed, 07 Jul 2021 01:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0wTT-0004Ab-EW; Wed, 07 Jul 2021 01:35:39 +0000
Received: by outflank-mailman (input) for mailman id 151798;
 Wed, 07 Jul 2021 01:35:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uasl=L7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1m0wTS-0004AT-F5
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 01:35:38 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3763c456-724a-4d5e-845b-d465e0fd566e;
 Wed, 07 Jul 2021 01:35:34 +0000 (UTC)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 18:35:33 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jul 2021 18:35:32 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 18:35:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 18:35:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 6 Jul 2021 18:35:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 6 Jul 2021 18:35:31 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR1101MB2146.namprd11.prod.outlook.com (2603:10b6:405:50::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 01:35:30 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::fd4b:cdde:6790:134]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::fd4b:cdde:6790:134%8]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 01:35:30 +0000
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
X-Inumbo-ID: 3763c456-724a-4d5e-845b-d465e0fd566e
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="230959392"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; 
   d="scan'208";a="230959392"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; 
   d="scan'208";a="423159842"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhfE0jGlZ5HKB6x3RLetdkTLNpNkdYqQnBmfDlGXr0Z+z4XsdPVa2JzoEkVjmQ3lrtZg2PtsVcAOOaQAwjt8GYGEpgb1+2RBUyp61zPuCXoTxw3tzzSy+IFB5hGfDPczi6vVGdWTZ1f0Ke228U+TVFJeJu5Lj7HC87rurtRfKFLwReMhw+HKMr07JhSDKkCYsk5RheJZ0Ac+VlQAV7cSOJDyWPMYiSzF+5yqkMnJdBTMfSJRuARusjQBpjDwOkBfomIXQlQBUdrQAuxjHbqG/f12iPO6XbelZN6fti0edKBjzBDZij9OiPT6lrqoU+ki9iGc3nTVz4IRYPDcPkooVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvXAQNkeq/K1e4VNMs1Mat8zbNFyJKAE0QW1J9na4t4=;
 b=fFAl3YHfetIB+n30OdX2ViEQTXXBf6yR31NaQfl2PYbQutGB9qxqm7eVvb3rLCSrwleCyHq5x8wTQLY14hTKjcYebg6G+BvOX+p3zW7WuOcnxU2nEO2zFlXyGaocML0OiROICbFFsm+hGMPyiDobf8+cls+G8NQx+idvSymR1lH0vw0cuEvTnxUBiXz2nfc/nyMZJU3VONIaxUAirVF3cpYJclP0bndXqHlkvFLtidMCDbiLX+wNKP9vJyg/gQV6gA1b1XdB4UgNb8CNnUoocvGquQu/jHL6Hw1GqpwUGHs1IZ4zzmyUgwxfJWWjyMD9MHCxfqTidG/QwM7y6DD5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvXAQNkeq/K1e4VNMs1Mat8zbNFyJKAE0QW1J9na4t4=;
 b=tQmSNvqU6BH3D2gHTUg4Rf1ON3WIVwWy/7at6lUa7XmBNSNax6Kb0QBscKJplDsSJYjLQ5tg1Fv4ekpIGdnjhvNjPY3baa7Mx9BcG9mcEiPVQoSR72hsg3NYR7RTeUNXCS21omGS/JEy91vHeCdsL+kzcrSfNHQ0m3oN2Qbl3TA=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>
Subject: RE: [PATCH 07/16] x86/P2M: p2m_{alloc,free}_ptp() and
 p2m_alloc_table() are HVM-only
Thread-Topic: [PATCH 07/16] x86/P2M: p2m_{alloc,free}_ptp() and
 p2m_alloc_table() are HVM-only
Thread-Index: AQHXcbgpk0b+361jIk+Tsj/Wl7GPf6s2vTRg
Date: Wed, 7 Jul 2021 01:35:30 +0000
Message-ID: <BN9PR11MB54330E8E2A36577B1C39217B8C1A9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <fcd39881-e225-d1a7-a168-9aa9fd9a7735@suse.com>
In-Reply-To: <fcd39881-e225-d1a7-a168-9aa9fd9a7735@suse.com>
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
x-ms-office365-filtering-correlation-id: 67bccf20-0c33-4bb9-d2f6-08d940e781ce
x-ms-traffictypediagnostic: BN6PR1101MB2146:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR1101MB2146B485C3B9DDC1FBB480B18C1A9@BN6PR1101MB2146.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wu8B9vMkCRNVEBbUMcTEV2SLsq9xR93iAUOhk/w49rU2fcu69IhLxnZGZIjI+huqwGq+D7Yb5H/iUrUfhUyABbdN9hskjjaeyHHjL39Zf2oKh3dWfCKvBGyM2hdqg5xd8wQa/tbeCT6iq/dUdQdrd9l3CBsXALqlLvni8Umcsrpmfsb5Kq5ccJJc6mGoP9DhA78Ifl5WnB+HTUJ6Bv/U2n9SVr9PuewdaKw1+El2Y1V0C415c3az2wbHs1lP4Nf883d0qmSEZgbKm/rS2eWv0Zlpw1dJgEJw5jo/ZXcNVaarhAS1sdTPD6dwTk5OQIOhd2YkHEiVrpKzDvaX0KaQCbaYxBhbtjfTGPQnNEnHTyZPQ7qoBvt/ekKm8BiY9998Rx5xKWqDsKKSbIPlLp40xuuaOGjiv5/Z0Lp9UJQiWKJ5CszPzAT2Fcma32DU64XvvdRGA9+325DbEf3RGEMFjJ2OuPHzCiuOPQiGAOwXsbn3BCzHMRKguqBcfKkq0TYe73jYjDtV5GEmkfiBJSyY4+Xz9UlaGeOJ0IeNDEYLmbI0zFm5ibJ89QDOgvzhXKkcubQ38dWFOpOlw6PI3FVrx7u0LAK+yAsrHT5fy/TSwex5m5CGchNlecEN8XQ4Fr97F8XQ/KLGfE38u1LWXXNvHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(66946007)(478600001)(122000001)(33656002)(38100700002)(76116006)(7696005)(6506007)(8936002)(64756008)(66446008)(186003)(86362001)(55016002)(66556008)(66476007)(2906002)(52536014)(8676002)(9686003)(5660300002)(71200400001)(4326008)(26005)(110136005)(83380400001)(316002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmwydE8rYlUxaWlFQ3hzVVVvaXc2M1hlMGJBS1lSS1RpdGxFekpxNmFIR01p?=
 =?utf-8?B?THYzd3lGdWxCc2M1YmxDT0laL0VncHVsSUpjZWdEV3ZCWXUrYU5ZOUswMXE3?=
 =?utf-8?B?eEhUQVlKSURFc1lSNjhUN0h5U1ZEVWRueldTNEJRT1IwOGZBRndqby90Rk80?=
 =?utf-8?B?TGNCRkc4OUZhVnhxRTN6T1pFai93bDd6aDh3ZUZPcjRFUFJEcm9ucjVuZS9a?=
 =?utf-8?B?Ym9uZzhNaUlIR2VPWUdaUFk5ZlZqWHEvdmE3dENUb3JJcEk3N3AvTU1aVzJu?=
 =?utf-8?B?TXhTRGQzSmpacFNCZjhGZG9BZ0w4WlozMnZ1M0UyWVcrT2NrcEV5RW9EZFhH?=
 =?utf-8?B?b2FhMjFYSEZFbXRSN0cwYmQxNDR4OE9zbXpTMjZ3QUp6NVpZcm1KSGdaRzdp?=
 =?utf-8?B?eW8rT2RRRldqMmZtTXVTNTVCNmlETGprOU9UU3VNdjl6QkpSRVVoWXlZcEp4?=
 =?utf-8?B?c3RrMzdEYW1ZT0hLUXNIZmFqcGppYzFFS0J6bmg3V2NwekxoMUVVUDltcmJE?=
 =?utf-8?B?T3pVMERWSVl3dkxKdWpuc1hoSldhZVE0cXdhMlRNZjJxM2ZTKytlMjUxSDI4?=
 =?utf-8?B?b0t6a0gwbXpIMGZCR1lXV2p4d0JqTldyY2RwaEJCV3dsQXc2M2RuVEtjb1J6?=
 =?utf-8?B?TURZYm5obUgrQktoQTdvTmZpV0t2eHpVLzhXR3Joak1XWlJ4Nyt4bDVDR1lI?=
 =?utf-8?B?ZGYwUjFhc2Z2VUFFbXVYZmNqd3M5RTBlNHhmYUI3RWVPZm9GQ1RkK0xsSlBE?=
 =?utf-8?B?bTBpcFRueWVaQUpjUHpEcFBsOW9hOW5IQTc0Z05jSy9ocE9ROG5Rb1ZpWmdv?=
 =?utf-8?B?WW9sTlNFZ2pLZGxpL3o5RFBxRXJJb2ExT2JRZ3ArQUwwWHllaEd4V2pSc1h5?=
 =?utf-8?B?eUJQenJlM0Y3NjZaZXZUcGZiV0tPRDRvSGtlRDdRdXExNUdDNVVMMXFmOWJN?=
 =?utf-8?B?M1E2cC9OMjdzVXdzNE1peXdhNXJZMThvWUxRWHBhQzFHSVh4Q0U0T0xoQ0F4?=
 =?utf-8?B?ZnE0RSsvZjFCcmJxUkhRWVRvUGZhSC9TOGxXWW5maU1IMXI5QjUyYXBrbFcr?=
 =?utf-8?B?VzJXdFg2TENtaHVnVk80V0U2SFNSdTFDQXRjMWhBWGJtSFNTRW9ETjNVVGM0?=
 =?utf-8?B?TUFiVHhtenlOMXNLRUwxNHdpK2FTM05yZXRLc3BBUjRQcUlTcnZWamRVR2pS?=
 =?utf-8?B?bFcraEN6K2tSWUR2TzZMRWkzUmtGZkxvZ1VjVjRpM3RYVndiNDJYT2R0UFlI?=
 =?utf-8?B?cmpJZ2RvVExOUDJMNlFOaVIrL1VaWXZoU2tPRlhoVkJDdXBTZnBwNkRWNDhv?=
 =?utf-8?B?bGxGTXRKZ3VrdXlqM2ZMUlJmOVZ1c3ZjOEd2UUtCTkdmdFZJU3FVSUtWK1lx?=
 =?utf-8?B?KzJNSlJLejdkaEdhQTFtVmh1cW9rVFltS2NxMTd2RGNMY0swT1VGNC9RQlJJ?=
 =?utf-8?B?Y3MxK2FOZWYvRFhpdVFTRHNTYXQ2UUk2eVBRZVVLL3h3Q2VWSW13MVBhc0Fz?=
 =?utf-8?B?dVEwd0x6QjlMYXhHcU9VeHVIVW8xdnIvK0dRN0dWMU4rblhYbEhaWFgxMkVO?=
 =?utf-8?B?U3hSdjUybXYwa2FNb1FRenFyd1RwcW9Pc2FnY2Z6YjBCTXFrR0I5dm1aaFRX?=
 =?utf-8?B?QmJCcW1xZVpLRDdaS045eFBPaEwxTk55MU1VSG1XYjJ6aU1FaGd4MnFhTXJk?=
 =?utf-8?B?bEpGTnpEN0grUnZrMjJqZGZqNWN6VURyWG9kQ1NOSmZYc1Nxa3JVc0YzMXRw?=
 =?utf-8?Q?p5gJyS5p/j//hEjX9EjrOvYBifWsYpz3uHVNk3x?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bccf20-0c33-4bb9-d2f6-08d940e781ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 01:35:30.8257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LpDK2Uh9SoJaEa8RnrNuGkIWCHNHKu4+VTCu2UQU/+GGrhoTcuw22gOG4LipaqpPezp5zscZMk+w/hY/tmmENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2146
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEp1bHkgNiwgMjAyMSAxMjowOSBBTQ0KPiANCj4gVGhpcyBhbHNvIGluY2x1ZGVzIHRoZSB0d28g
cDJtIHJlbGF0ZWQgZmllbGRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPiArKysgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4gQEAgLTk0LDcgKzk0LDkgQEAgc3RhdGljIGludCBwMm1f
aW5pdGlhbGlzZShzdHJ1Y3QgZG9tYWluDQo+ICAgICAgaW50IHJldCA9IDA7DQo+IA0KPiAgICAg
IG1tX3J3bG9ja19pbml0KCZwMm0tPmxvY2spOw0KPiArI2lmZGVmIENPTkZJR19IVk0NCj4gICAg
ICBJTklUX1BBR0VfTElTVF9IRUFEKCZwMm0tPnBhZ2VzKTsNCj4gKyNlbmRpZg0KPiANCj4gICAg
ICBwMm0tPmRvbWFpbiA9IGQ7DQo+ICAgICAgcDJtLT5kZWZhdWx0X2FjY2VzcyA9IHAybV9hY2Nl
c3Nfcnd4Ow0KPiBAQCAtNjI4LDYgKzYzMCw3IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRf
cGFnZV9mcm9tX2dmbigNCj4gIH0NCj4gDQo+ICAjaWZkZWYgQ09ORklHX0hWTQ0KPiArDQo+ICAv
KiBSZXR1cm5zOiAwIGZvciBzdWNjZXNzLCAtZXJybm8gZm9yIGZhaWx1cmUgKi8NCj4gIGludCBw
Mm1fc2V0X2VudHJ5KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIGdmbl90IGdmbiwgbWZuX3QgbWZu
LA0KPiAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXIsIHAybV90eXBl
X3QgcDJtdCwgcDJtX2FjY2Vzc190IHAybWEpDQo+IEBAIC02NjcsNyArNjcwLDYgQEAgaW50IHAy
bV9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybQ0KPiANCj4gICAgICByZXR1cm4gcmM7
DQo+ICB9DQo+IC0jZW5kaWYNCj4gDQo+ICBtZm5fdCBwMm1fYWxsb2NfcHRwKHN0cnVjdCBwMm1f
ZG9tYWluICpwMm0sIHVuc2lnbmVkIGludCBsZXZlbCkNCj4gIHsNCj4gQEAgLTc0Niw2ICs3NDgs
OCBAQCBpbnQgcDJtX2FsbG9jX3RhYmxlKHN0cnVjdCBwMm1fZG9tYWluICpwDQo+ICAgICAgcmV0
dXJuIDA7DQo+ICB9DQo+IA0KPiArI2VuZGlmIC8qIENPTkZJR19IVk0gKi8NCj4gKw0KPiAgLyoN
Cj4gICAqIGh2bSBmaXhtZTogd2hlbiBhZGRpbmcgc3VwcG9ydCBmb3IgcHZoIG5vbi1oYXJkd2Fy
ZSBkb21haW5zLCB0aGlzDQo+IHBhdGggbXVzdA0KPiAgICogY2xlYW51cCBhbnkgZm9yZWlnbiBw
Mm0gdHlwZXMgKHJlbGVhc2UgcmVmY250cyBvbiB0aGVtKS4NCj4gQEAgLTc1NCw3ICs3NTgsOSBA
QCB2b2lkIHAybV90ZWFyZG93bihzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtDQo+ICAvKiBSZXR1cm4g
YWxsIHRoZSBwMm0gcGFnZXMgdG8gWGVuLg0KPiAgICogV2Uga25vdyB3ZSBkb24ndCBoYXZlIGFu
eSBleHRyYSBtYXBwaW5ncyB0byB0aGVzZSBwYWdlcyAqLw0KPiAgew0KPiArI2lmZGVmIENPTkZJ
R19IVk0NCj4gICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsNCj4gKyNlbmRpZg0KPiAgICAgIHN0
cnVjdCBkb21haW4gKmQ7DQo+IA0KPiAgICAgIGlmIChwMm0gPT0gTlVMTCkNCj4gQEAgLTc2Mywx
MSArNzY5LDE2IEBAIHZvaWQgcDJtX3RlYXJkb3duKHN0cnVjdCBwMm1fZG9tYWluICpwMm0NCj4g
ICAgICBkID0gcDJtLT5kb21haW47DQo+IA0KPiAgICAgIHAybV9sb2NrKHAybSk7DQo+ICsNCj4g
ICAgICBBU1NFUlQoYXRvbWljX3JlYWQoJmQtPnNocl9wYWdlcykgPT0gMCk7DQo+ICsNCj4gKyNp
ZmRlZiBDT05GSUdfSFZNDQo+ICAgICAgcDJtLT5waHlzX3RhYmxlID0gcGFnZXRhYmxlX251bGwo
KTsNCj4gDQo+ICAgICAgd2hpbGUgKCAocGcgPSBwYWdlX2xpc3RfcmVtb3ZlX2hlYWQoJnAybS0+
cGFnZXMpKSApDQo+ICAgICAgICAgIGQtPmFyY2gucGFnaW5nLmZyZWVfcGFnZShkLCBwZyk7DQo+
ICsjZW5kaWYNCj4gKw0KPiAgICAgIHAybV91bmxvY2socDJtKTsNCj4gIH0NCj4gDQo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21t
L3NoYWRvdy9jb21tb24uYw0KPiBAQCAtMjcwMCw4ICsyNzAwLDEwIEBAIGludCBzaGFkb3dfZW5h
YmxlKHN0cnVjdCBkb21haW4gKmQsIHUzMg0KPiAgIG91dF9sb2NrZWQ6DQo+ICAgICAgcGFnaW5n
X3VubG9jayhkKTsNCj4gICBvdXRfdW5sb2NrZWQ6DQo+ICsjaWZkZWYgQ09ORklHX0hWTQ0KPiAg
ICAgIGlmICggcnYgIT0gMCAmJiAhcGFnZXRhYmxlX2lzX251bGwocDJtX2dldF9wYWdldGFibGUo
cDJtKSkgKQ0KPiAgICAgICAgICBwMm1fdGVhcmRvd24ocDJtKTsNCj4gKyNlbmRpZg0KPiAgICAg
IGlmICggcnYgIT0gMCAmJiBwZyAhPSBOVUxMICkNCj4gICAgICB7DQo+ICAgICAgICAgIHBnLT5j
b3VudF9pbmZvICY9IH5QR0NfY291bnRfbWFzazsNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmMNCj4gQEAgLTMzOSwxMiArMzM5LDE0IEBAIHN0YXRpYyB1aW50NjRfdCBkb21haW5fcGdk
X21hZGRyKHN0cnVjdA0KPiANCj4gICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmhkLT5hcmNo
Lm1hcHBpbmdfbG9jaykpOw0KPiANCj4gKyNpZmRlZiBDT05GSUdfSFZNDQo+ICAgICAgaWYgKCBp
b21tdV91c2VfaGFwX3B0KGQpICkNCj4gICAgICB7DQo+ICAgICAgICAgIHBhZ2V0YWJsZV90IHBn
dCA9IHAybV9nZXRfcGFnZXRhYmxlKHAybV9nZXRfaG9zdHAybShkKSk7DQo+IA0KPiAgICAgICAg
ICByZXR1cm4gcGFnZXRhYmxlX2dldF9wYWRkcihwZ3QpOw0KPiAgICAgIH0NCj4gKyNlbmRpZg0K
PiANCj4gICAgICBpZiAoICFoZC0+YXJjaC52dGQucGdkX21hZGRyICkNCj4gICAgICB7DQo+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wMm0uaA0KPiBAQCAtMjAyLDkgKzIwMiw2IEBAIHN0cnVjdCBwMm1fZG9tYWluIHsNCj4gICAg
ICAvKiBMb2NrIHRoYXQgcHJvdGVjdHMgdXBkYXRlcyB0byB0aGUgcDJtICovDQo+ICAgICAgbW1f
cndsb2NrX3QgICAgICAgICAgIGxvY2s7DQo+IA0KPiAtICAgIC8qIFNoYWRvdyB0cmFuc2xhdGVk
IGRvbWFpbjogcDJtIG1hcHBpbmcgKi8NCj4gLSAgICBwYWdldGFibGVfdCAgICAgICAgcGh5c190
YWJsZTsNCj4gLQ0KPiAgICAgIC8qDQo+ICAgICAgICogU2FtZSBhcyBhIGRvbWFpbidzIGRpcnR5
X2NwdW1hc2sgYnV0IGxpbWl0ZWQgdG8NCj4gICAgICAgKiB0aGlzIHAybSBhbmQgdGhvc2UgcGh5
c2ljYWwgY3B1cyB3aG9zZSB2Y3B1J3MgYXJlIGluDQo+IEBAIC0yMjMsOSArMjIwLDYgQEAgc3Ry
dWN0IHAybV9kb21haW4gew0KPiAgICAgICAqLw0KPiAgICAgIHAybV9hY2Nlc3NfdCBkZWZhdWx0
X2FjY2VzczsNCj4gDQo+IC0gICAgLyogUGFnZXMgdXNlZCB0byBjb25zdHJ1Y3QgdGhlIHAybSAq
Lw0KPiAtICAgIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCBwYWdlczsNCj4gLQ0KPiAgICAgIC8qIEhv
c3QgcDJtOiBMb2ctZGlydHkgcmFuZ2VzIHJlZ2lzdGVyZWQgZm9yIHRoZSBkb21haW4uICovDQo+
ICAgICAgc3RydWN0IHJhbmdlc2V0ICAgKmxvZ2RpcnR5X3JhbmdlczsNCj4gDQo+IEBAIC0yMzMs
NiArMjI3LDEyIEBAIHN0cnVjdCBwMm1fZG9tYWluIHsNCj4gICAgICBib29sICAgICAgICAgICAg
ICAgZ2xvYmFsX2xvZ2RpcnR5Ow0KPiANCj4gICNpZmRlZiBDT05GSUdfSFZNDQo+ICsgICAgLyog
VHJhbnNsYXRlZCBkb21haW46IHAybSBtYXBwaW5nICovDQo+ICsgICAgcGFnZXRhYmxlX3QgICAg
ICAgIHBoeXNfdGFibGU7DQo+ICsNCj4gKyAgICAvKiBQYWdlcyB1c2VkIHRvIGNvbnN0cnVjdCB0
aGUgcDJtICovDQo+ICsgICAgc3RydWN0IHBhZ2VfbGlzdF9oZWFkIHBhZ2VzOw0KPiArDQo+ICAg
ICAgLyogQWx0ZXJuYXRlIHAybTogY291bnQgb2YgdmNwdSdzIGN1cnJlbnRseSB1c2luZyB0aGlz
IHAybS4gKi8NCj4gICAgICBhdG9taWNfdCAgICAgICAgICAgYWN0aXZlX3ZjcHVzOw0KPiANCg0K

