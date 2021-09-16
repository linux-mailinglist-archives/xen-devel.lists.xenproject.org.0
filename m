Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B640D45F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 10:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188225.337311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmcG-0002VC-Te; Thu, 16 Sep 2021 08:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188225.337311; Thu, 16 Sep 2021 08:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmcG-0002Sh-Pq; Thu, 16 Sep 2021 08:19:32 +0000
Received: by outflank-mailman (input) for mailman id 188225;
 Thu, 16 Sep 2021 08:19:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQmcF-0002SX-9i
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 08:19:31 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d060a8ec-16c6-11ec-b5b3-12813bfff9fa;
 Thu, 16 Sep 2021 08:19:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 01:19:29 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2021 01:19:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 01:19:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 01:19:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 01:19:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 01:19:28 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB1458.namprd11.prod.outlook.com (2603:10b6:405:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 08:19:27 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 08:19:27 +0000
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
X-Inumbo-ID: d060a8ec-16c6-11ec-b5b3-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="222567978"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="222567978"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="545434477"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErgSmgREHEjzNwR+R6oo5RtYb1FE1AcUPh5mUCh7/8ttl0f4l9eYQzssYgvbZub5TFDi4EG6T615CEvkWGTqGV8GwGKbeWH3jyys3CC/W0NQmNT4Pi0YxUjidZYAPcE+CH6zhOHrqvv1jOQSdF2ywj572bhNFRPr75hy2WruamFGf7VKsLDjGugRsXVgRHmlzi/VJEyNDdSdjEG14Ch43BO48vGzodvDA8pSJ1hw9ORORTEFlzFdGlPSEWCpLPxk0NBMWmMBLd/oG9H86gjMtp9r04+NA6O5Z1UEgmnf5yPWd3qA3oZ/OkctDrY2kRNvWtpmgxzgl1HCJprxPFjPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vni7LZgLSjFb2OcXU8M1HmqnLKzm+Z+/DPBs9mlrFZ8=;
 b=HCJ/gsUxHPad3K/v/ChoCP6EeoVOAOex0b9JZE02A8wpQ6JBuSusYBMfbYyTf/AN3dv7E93J3Z1ZsoONwUDPV3663E4j2nSxgBf2j/EeJ0+oef1GCvWoL8/KkxTYoIrARbpWVrLLRQ7ATNwrAnQY9BWE220j8mALsntP/1+uyeRhugp85Uh/BKtIjpMqF+CvZ3OKVg0+LIVz900v38TEDZKvsr21klW0ePqzuXgkew6Y2my40z9AAhJbV0IvBGiieudTIl7lEtM8aZkUc/5/WHl408nIV67UuG/Lhu9ZnjPQBvZY/nMIPAZtPh+Bz4zBHqkT0VDUWxrQ2aUA+gdIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vni7LZgLSjFb2OcXU8M1HmqnLKzm+Z+/DPBs9mlrFZ8=;
 b=LCjrEGt8xQemBHASq43denHwDPjf4NHrdDKvaf96awRYSiVqSJIXVIMRaB5CIjR06ptCyzPBdh8gleUAsxrWyOE/uBRBUbwbuYL4v3K7rafO0XA3JXd1Cc1Z/OikX+lnfltTJjw7GUgLAvHrKnFl6yOLXttcqNedVR5Pn+oyP80=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: RE: [PATCH 3/4] VT-d: skip IOMMU bitmap cleanup for phantom devices
Thread-Topic: [PATCH 3/4] VT-d: skip IOMMU bitmap cleanup for phantom devices
Thread-Index: AQHXqhH+i+85PO0Ft0uMLVDjFxaknaumUujA
Date: Thu, 16 Sep 2021 08:19:27 +0000
Message-ID: <BN9PR11MB5433D6D1475F2E710A02D4D28CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
 <57c75e32-df31-c886-b2b2-86d0f82a57d0@suse.com>
In-Reply-To: <57c75e32-df31-c886-b2b2-86d0f82a57d0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5414abf0-3964-4ec7-6c10-08d978eab326
x-ms-traffictypediagnostic: BN6PR11MB1458:
x-microsoft-antispam-prvs: <BN6PR11MB1458E014A1E4CE95B286B53E8CDC9@BN6PR11MB1458.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPbJcGWrON81aNR8mDInjPDyOuwaEO8jNHgeDOTy02/6/yjGWZI9qZe30SSUYfdVFn9iKdCyZCMswIzar+HJoBdj5+Jo8+LVXxRHvWKfTo3JxkpzGSYd0w/TNIxUtmWh9/F5j8OC1yGIjXJAPgGi+VpFKJvPo0tuErb7arO9vaoa/+yOx+OsmoaMIqi2wsfzncHReyTuT5p/9vwACs8SGU2pRc30DDweJz+0dmKSTry5cZrXELF/fNHI0KcEJbCvNJofyXF9QK5M6gBSFZqpK6E7/t+Tzigec5fO7AxFP32Fv/Lxy/cqQsVlSbDyXjWHpBXwMfFJrpNgITJyuiUrXFLBNulI1/K/ztxDxo66IVRqp6i6uVMDUwDYvSFr21GszPu5FgSV0Hc3vSs9DfZ7sU32GYrOiQ1PoUI8kjGw0IAeijYDjlpUVLuaDuakqNvNhzxFhnrFUpyUq5zmVZkIKkV0j9BdLQ7ZNB3011buMGUn/PHM44HZe/d45wjnQCdK1FpLsnwbfg0g/RINvamLZmFJuV71iVWu581KKr/Se8tleqyQKhRml+y1q1vfon2nae8M6UkZg2MCOpBKRk3oiMtv5CLHPNpLJbVqQnAH9/39Fq4JOpIvJx/T2H+cUxWbeOrliQsotSY8L+BAEtX/h77aUX+OgmYWf7rgtjsx9IpPa900c6nDYHyRyP3WZ//OS84nDq0c3eJaxBfOKlEFng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(8936002)(52536014)(26005)(8676002)(38070700005)(508600001)(55016002)(9686003)(4326008)(76116006)(2906002)(33656002)(66556008)(66446008)(66476007)(64756008)(66946007)(186003)(7696005)(5660300002)(6506007)(38100700002)(316002)(110136005)(4744005)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTdpSnRiWmsyQXEwOXd3RURjOVgwUVQybURtempiWXo5SzRqU1Nqd0RySnRQ?=
 =?utf-8?B?a0pJTjJ2QWV0cWIvUWlaZ3RMN0lVZUE4Slg0NDZLZEZwQnY4MGR6SS9YTlJJ?=
 =?utf-8?B?bUhLTG5GV0NVNlczbWtCS1Q2UlJDcm9wM1FlOU1jL2FnRG9NWmFWNlhnYnlE?=
 =?utf-8?B?bG5SRTBCZmMxZFhrWlRkMjY3VGowWDBiWk9SYkpBU3Rnb0loMlFpR2NEL1RL?=
 =?utf-8?B?ek54NkJRWTdhbS8yZnZGV1l6ODlBbzcwK3FHL0pZOTJxeXRTZURaNWlPSCti?=
 =?utf-8?B?ZUo3cXM3bm03eUNXWmEyQStjMFVPaUFuN2RUWXpMNTI1blY4ZFBkY25DYll5?=
 =?utf-8?B?K3JZVmlVQXo5ZXRKdit1MnE4aERXYWpEbzRYWlB6MlJ3Y2RnWHdkNnRRaUFF?=
 =?utf-8?B?RU5NaGtjME5rd1U3aWg2ek5xSUNabWJoQlFFbVl4SVpOb1FqdklXMk8rcFg1?=
 =?utf-8?B?Sjd2dGcvY2R2bENHNWxCSHIrT3VvaFlsS3BMMm9QakFXV3o4UVRxNlgyQURP?=
 =?utf-8?B?ZG93MGVtK2c4aFc0Z2Q4SFhFU3BzeU5yM2JKVTJyRE9qWGdHOUt4WE9hc1cy?=
 =?utf-8?B?elFURGNYbmdhTjFSejRIYmZzcmpYTEtoOWdBb2ZQSElkaVFTNGUvYythLzNK?=
 =?utf-8?B?OEorNktodXhMWEpDdzZtY2ttd01lS3FWYjYzTzRvWE83ak5nQ0pacG9ROUw4?=
 =?utf-8?B?OUhiclNaeGN6VUhKMnUrUVdsdmpPYVBhZVBVaWpqR0pUUmNWVkd1dnpuVlE2?=
 =?utf-8?B?OFdPMHpYcjVtamYyOCtYWFZYeGpqenYyY2drNWNUL20vVWhpaHFBRzFobEM1?=
 =?utf-8?B?S3ZJQWZ6UzQ5VVlRR1VLWTA4Rm1odEdCb1ZuZE0zdEQrL3RwcUVjTEwza1NU?=
 =?utf-8?B?d2dOQ3lJQi9Uamd3SjdsS29ieldoK2ozbGduQk5lc3dJQUhSY3NXRU0vMDl0?=
 =?utf-8?B?U05GNjV2V3RUVmowbSt5V1FJNjVxRUc4MEhEK21ZS2dHbmhyQmpscTlMQXV2?=
 =?utf-8?B?MHZnOE5QTmdINllCVlZhRDlWWVV3T09QU0owZ0twSmJJWnN1amdvTDdqdVQz?=
 =?utf-8?B?cGtva1JsT0FGZ3JIZVAwM2FLbzI0YTNoYmRVcGhRVTRTZi95ZlppTlgwUERn?=
 =?utf-8?B?eWxzYzZoNmFTdTQwb0Zqdi9CcFNLS0hLdWRvengrSzY5T0YyaXdPNDJmaUND?=
 =?utf-8?B?UUxCVUk5ZUF5NUNXTW5RZFZ1cDYxeHFJRXpFNFNtcjNJaU94TVhZN1RteXRR?=
 =?utf-8?B?ZXovT2JjQ1VkTzJjNDhoZ1ZiOTNvNUNXSnlVRzhJZGUyUkZYZzJuRWtjNkdU?=
 =?utf-8?B?cS9KSllxb1libUdWYXd0VHdQdlBQemJ1M2IwWlp6cm1YV0JBbVRibXArM01m?=
 =?utf-8?B?a1puRnRYNys2dVdENFl1RjBKL09XWkp3aFRlQmQ4YXI1c0V2UGVzMUJjZjFV?=
 =?utf-8?B?SU9CNCt3bHY2TURKVjNmUk5DOXcyQWp6ZFU4bldtL1hNY3k3YUR6Mlk1SlFy?=
 =?utf-8?B?clFuTjZVczhDMXlaVENUVjIvTGV0UEprbVlENG9TN1NqQ05adkRVMnJMUS9M?=
 =?utf-8?B?ZG1ITG5aVm5OcmpHZk1vN21lNGlUS1ZxaGlhRDFTbWxrUkxaTGdqaXRXRW1P?=
 =?utf-8?B?c0RSWUNPOEdIOEc3clFGUDVnZ2k2MmRHSTNmSmZpc2thS3N5YTdnaEhpa05H?=
 =?utf-8?B?Zkk2dFBYN3ozUDZ2R1NCZEJpbDk1cHZGZHBseXBzTWdiRUY1UjBqQk1BSUJX?=
 =?utf-8?Q?rlUK1bO6KWyGr104uMlxCA3g45ETORjWJ1euSPs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5414abf0-3964-4ec7-6c10-08d978eab326
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 08:19:27.1860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCmlBZSx6R3hecGpRyEiSjxHGrJx0Ws5oj3+5TCaBwDfTND1aj0TjXToAFsUWzRIH9ex7A7sScmA5CNqsQ+X+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1458
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgU2VwdGVtYmVyIDE1LCAyMDIxIDU6MTMgUE0NCj4gDQo+IERvaW5nIHRoZSBjbGVhbnVwIGFs
c28gZm9yIHBoYW50b20gZGV2aWNlcyBpcyBhdCBiZXN0IHJlZHVuZGFudCB3aXRoDQo+IGRvaW5n
IGl0IGZvciB0aGUgY29ycmVzcG9uZGluZyByZWFsIGRldmljZS4gSSBjb3VsZG4ndCBmb3JjZSBt
eXNlbGYgaW50bw0KPiBjaGVja2luZyBhbGwgdGhlIGNvZGUgcGF0aHMgd2hldGhlciBpdCByZWFs
bHkgaXM6IEl0IHNlZW1zIGJldHRlciB0bw0KPiBleHBsaWNpdGx5IHNraXAgdGhpcyBzdGVwIGlu
IHN1Y2ggY2FzZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4g
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTE3MzMsNyAr
MTczMyw3IEBAIHN0YXRpYyBpbnQgZG9tYWluX2NvbnRleHRfdW5tYXAoc3RydWN0IGQNCj4gICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgfQ0KPiANCj4gLSAgICBpZiAoIHJldCB8fCBR
VUFSQU5USU5FX1NLSVAoZG9tYWluKSApDQo+ICsgICAgaWYgKCByZXQgfHwgUVVBUkFOVElORV9T
S0lQKGRvbWFpbikgfHwgcGRldi0+ZGV2Zm4gIT0gZGV2Zm4gKQ0KPiAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiANCj4gICAgICAvKg0KDQo=

