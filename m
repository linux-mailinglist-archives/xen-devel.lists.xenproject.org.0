Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A12C7DD5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 06:30:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40654.73571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjbkT-0003mN-Dr; Mon, 30 Nov 2020 05:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40654.73571; Mon, 30 Nov 2020 05:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjbkT-0003ly-9u; Mon, 30 Nov 2020 05:29:17 +0000
Received: by outflank-mailman (input) for mailman id 40654;
 Mon, 30 Nov 2020 05:29:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+J0=FE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kjbkR-0003lt-32
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 05:29:15 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c48df58-2b87-4c33-83a8-c3c927fe9f4d;
 Mon, 30 Nov 2020 05:29:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 21:29:11 -0800
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 29 Nov 2020 21:29:11 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 21:29:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 29 Nov 2020 21:29:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 29 Nov 2020 21:29:06 -0800
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB0062.namprd11.prod.outlook.com (2603:10b6:301:67::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Mon, 30 Nov
 2020 05:29:05 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 05:29:04 +0000
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
X-Inumbo-ID: 0c48df58-2b87-4c33-83a8-c3c927fe9f4d
IronPort-SDR: Q7dwKLrQ+8fdn6geJsxAXnW4tXcUupubgd7OKwHRpk6zRvDf2eWSZj9/q9jhkoNdrdIaGhYCuO
 tg44IoTdSs6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="169085058"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="169085058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
IronPort-SDR: 8Paml2sERhA37Xoy8etT+2NHB3ErD+WXbNhIYPvrWEE/ySe4xaf2JAVamgMp5MXJNziLpOjfA5
 F+8hBbuhN9JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="480518396"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLpp9LdTKPFVIDNVfqcjm6DE8qoJuDBo2UDg9CFKxQsDfpkhU6vhAdFbL2UJWz4zgBrR2Q9pAcTa4IuPyCPsFfcJ4yp2KbaO07kGwj2iOTp1cMVhnlDO6NAsWThBWleqJZPpAwLWK0ZnxU0iUR1EJ952lPoLE1HdAsnBCrFyyRnIUuCDFybhU5ErXd3vGlWTIIZxe5J1PNKfY4hEz+4o1UVo2966L72SB0cqqsGbyjW/7u34aLSUKH8VS/7tEunc+Wwh2l+TLmA6nwJMCrvGjeOJdcTqvMd6NLs36A5iuDROwbwoLQrrNVtVm15C7EF7iVcqiumQ2gJJo17oEXbEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwiZdpkwPU4vE6pIVVS1yOCxygQ4CsnKQvP7+mgCbqo=;
 b=EMNRqzlm1vVhSZenO4PbUCMzr5DKvgWVS66iP0LYwFycEPMLDPJl5O5zOABxWnl8VIO1zNVXX/k28iX3x9H1zQxbw8JD8f5YufadMnPhAcoL8LTVjxU6uMC1B5bgd52MpO/s+GxL1NIpYt2NseLDkylty4He+vo8Rq8BDM+OhIWqtWj/95kcvf3lv11Nhq/6CyxhYoLHFrYx/bLxP7aTzImjiCLkQbFdez0Xv+Xnw2TEs+IBOzX0IWZTLqLjYYYRxD0W1vIPhJLhD6X3tvUdGGh5r8gxeC/kJNla8GHnmoWWEuCrD/dYzhv5n6IS/gq+3qEP1quKbFT3tX9+tgPZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwiZdpkwPU4vE6pIVVS1yOCxygQ4CsnKQvP7+mgCbqo=;
 b=mpUWtFpu10SqWnEPQyVpflUkfoXeNRAthl3+pQjkRF2W+gNX6GweEPeglMElC1KvTF0sdS75vpRlVK3NKXTXIoI4VgkYAwXQHqXRjnsqpfrK2W69zFuSRPVsdCIgHOkpVEsmO7v796abzE6LHKECSBIYP6DjIfcWEdlXEExfYTI=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: Paul Durrant <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v10 7/7] vtd: use a bit field for dma_pte
Thread-Topic: [PATCH v10 7/7] vtd: use a bit field for dma_pte
Thread-Index: AQHWv0CPiyT+mTsyP0CyAKicZjEQmKncLtqAgAP+YuA=
Date: Mon, 30 Nov 2020 05:29:04 +0000
Message-ID: <MWHPR11MB16456F6B57ED225135D2EC218CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-8-paul@xen.org>
 <24774b4e-3ae8-2941-24ee-722acea69657@suse.com>
In-Reply-To: <24774b4e-3ae8-2941-24ee-722acea69657@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b776f18c-6b17-4a6b-b4d9-08d894f0da3c
x-ms-traffictypediagnostic: MWHPR11MB0062:
x-microsoft-antispam-prvs: <MWHPR11MB00624B359BFDA478D84DB7248CF50@MWHPR11MB0062.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R2sHnfLz5mJJzV7kIqhGZ21Ya4/6/mmjEQ7atIdwRQUD71/nHJgjUJlBFiEdjReTfr9NNWWPm2K47T8rzF6GXDMuRcAWSJY85N4mygPnncTB5lnxw6noVNbgyC1MB7QthdHH5msG3/SglSXpB8KTUROE+I8+Ol9h9EOtMoRc4oqWAW68FvQduker/bWfMSU6FjLNeLkf6gxQ4Mg4swlEeLCO73A4HZeKXtZbym5Jif6iFXWySX9ZgvoUFVg0lKTi74u4aLdDWLDrh7hQ4+huulP7ATVEBjUrJfemcR0N7gd4Ka1k0Nf+JxpIR1OXTgIV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(55016002)(9686003)(33656002)(66446008)(316002)(76116006)(66946007)(66476007)(66556008)(64756008)(86362001)(4326008)(8676002)(7696005)(71200400001)(2906002)(8936002)(54906003)(110136005)(5660300002)(186003)(53546011)(6506007)(26005)(83380400001)(478600001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OWlGNFdXdHNoWTFIcjZhKy93b0JDY2pmR0Z4OTB2d3U3VjBRM3JSOVdDTXdq?=
 =?utf-8?B?NE1RemErOTRmYkJ1dlJZTU5EMW4ybW9lamwrWWtGNVZiR2VIU1RBQnE1OFBo?=
 =?utf-8?B?am9hQ09Tc3JZaER6aDgyTUFpS1RWbkdYYStPOW9WWWRScld0b3pMbThXQWpm?=
 =?utf-8?B?NHRhb0FMQnFKd1pLYW5vNk9ZYnVkR3lXSTBNU2VlMnBMaXF3VWd0ZyswdlJG?=
 =?utf-8?B?RzA0TEZYa1RCcWxBL1ppbHUyajNvWmJXeHgra2NsQ2JkL1JyT0VhUG9pZlRn?=
 =?utf-8?B?cW4rTHVic0hFL3NkK2tXdkpSaE4rRnJnK2Z5N200N1J4WjVoSFZoTHhvckhm?=
 =?utf-8?B?S2JQYW01aU93d2x0NDU4dUNWdEtVZStQRkZRSzhoaTBKU2tCeXdic0k4SWJx?=
 =?utf-8?B?aWVOZEVZcS9uazNjWmgyajZEaS9Ga2YvL2FaeXVjalNidmRhS08xMHlwbVJG?=
 =?utf-8?B?eC9sWHNkTFIwdnNEVVdla0pZcjhaYWpXTTFSZHV0aUtiYVNTMFpuMkNLZUFQ?=
 =?utf-8?B?ZTdQdVc5OUtIYzZGSWVZR3VuemdkdE5NYkVyK0VtNFNPWi9ieVJxM29tU2VF?=
 =?utf-8?B?bUQ5eVdORnZ1SS9BZnNjNEQ4cW96MUc2VW54ZjFmaHNxV2xQbG4vdmpBRit6?=
 =?utf-8?B?dzhETWlXd2N2TlNmV3ljVVcrMmd0YWRFRGZMSFFRU29FOEF0ampOa1hMcHJN?=
 =?utf-8?B?R05WM0pIbTloK2NQdnY5NDlzd3V6NE5SRzhwNWw3cm9Bd0FYM2xJZk96Y2l3?=
 =?utf-8?B?dmVvZ0RjSHVKeGlyOUtNWWpVeUZHNzlacDZzdFpraHUxSEdCNHpvYnlKMzZ2?=
 =?utf-8?B?cXdhZTZka2dVMGxxZEREVWE4WGV6WDh2c1ZVeDdCOG1CazYvWndNeU9IOFU1?=
 =?utf-8?B?c0MxdkxKNmRtdThScHZXOGMxVURPcjlNQkRjQ1BoVWpQV3FtRkNDMTdNNU5N?=
 =?utf-8?B?R0RJQkJFckM1M3ducFhHKzJFbUowNTJYWStpMVg3NWtSdCtQQkgrVW5JOXdL?=
 =?utf-8?B?ME5PdmpOdUdxazdzWmFLN3JvYUYwaVlralNlVjNYaHBTUWNCRndwakw4UWY2?=
 =?utf-8?B?clNSTjNhWkk5SE5NRjl6ZkFzVmZraE1QYzRUMURrWTlhbkJUbXZPS05lMHNX?=
 =?utf-8?B?L0tnQ01RQzk2V0lvdFZacWFWNm40OXRML3Z2NTZWRzJraGRaTVJ3WkUybm9V?=
 =?utf-8?B?S04vdjRyVVYrOHQzU0VqOVlKUzdxRzVldFBQQW1LbVN0NHlRMlFuY3BrcE00?=
 =?utf-8?B?b2tZYStYa0tHZFFUSnJLdEhDWXBsbUdmUGhjVXVpdVNNb2g5d2E3MlAvT3ov?=
 =?utf-8?Q?UseWEVroNOMmY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b776f18c-6b17-4a6b-b4d9-08d894f0da3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 05:29:04.6239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOfZUiawuGVHp1xeBQbFcbnTS+4fGY2UfzP6hvCGn7IbUGVfcx1So9PChhbSa9dttbjyYBbYQx7ETYnZFYxbpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0062
X-OriginatorOrg: intel.com

PiBGcm9tOiBCZXVsaWNoDQo+IFNlbnQ6IFNhdHVyZGF5LCBOb3ZlbWJlciAyOCwgMjAyMCAxMjow
MiBBTQ0KPiANCj4gT24gMjAuMTEuMjAyMCAxNDoyNCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
IEBAIC03MDksMjAgKzcwOSwyMyBAQCBzdGF0aWMgdm9pZCBkbWFfcHRlX2NsZWFyX29uZShzdHJ1
Y3QgZG9tYWluDQo+ICpkb21haW4sIHVpbnQ2NF90IGFkZHIsDQo+ID4gICAgICBwYWdlID0gKHN0
cnVjdCBkbWFfcHRlICopbWFwX3Z0ZF9kb21haW5fcGFnZShwZ19tYWRkcik7DQo+ID4gICAgICBw
dGUgPSBwYWdlICsgYWRkcmVzc19sZXZlbF9vZmZzZXQoYWRkciwgMSk7DQo+ID4NCj4gPiAtICAg
IGlmICggIWRtYV9wdGVfcHJlc2VudCgqcHRlKSApDQo+ID4gKyAgICBpZiAoICFwdGUtPnIgJiYg
IXB0ZS0+dyApDQo+IA0KPiBJIHRoaW5rIGRtYV9wdGVfcHJlc2VudCgpIHdhbnRzIHRvIHN0YXks
IHNvIHdlIHdvdWxkIGhhdmUgdG8gdG91Y2gNCj4gb25seSBvbmUgcGxhY2Ugd2hlbiBhZGRpbmcg
c3VwcG9ydCBmb3IgeC4NCj4gDQo+ID4gICAgICB7DQo+ID4gICAgICAgICAgc3Bpbl91bmxvY2so
JmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+ID4gICAgICAgICAgdW5tYXBfdnRkX2RvbWFpbl9w
YWdlKHBhZ2UpOw0KPiA+ICAgICAgICAgIHJldHVybjsNCj4gPiAgICAgIH0NCj4gPg0KPiA+IC0g
ICAgZG1hX2NsZWFyX3B0ZSgqcHRlKTsNCj4gPiAtICAgICpmbHVzaF9mbGFncyB8PSBJT01NVV9G
TFVTSEZfbW9kaWZpZWQ7DQo+ID4gKyAgICBwdGUtPnIgPSBwdGUtPncgPSBmYWxzZTsNCj4gPiAr
ICAgIHNtcF93bWIoKTsNCj4gPiArICAgIHB0ZS0+dmFsID0gMDsNCj4gPg0KPiA+ICAgICAgc3Bp
bl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+ID4gICAgICBpb21tdV9zeW5jX2Nh
Y2hlKHB0ZSwgc2l6ZW9mKHN0cnVjdCBkbWFfcHRlKSk7DQo+IA0KPiBKdXN0IGFzIGFuIG9ic2Vy
dmF0aW9uIC0gaW4gYW4gZWFybGllciBwYXRjaCBJIHRoaW5rIHRoZXJlIHdhcyBhDQo+IGNvZGUg
c2VxdWVuY2UgaGF2aW5nIHRoZXNlIHRoZSBvdGhlciB3YXkgYXJvdW5kLiBJIHRoaW5rIHdlIHdh
bnQNCj4gdG8gc2V0dGxlIG9uZSBvbmUgd2F5IG9mIGRvaW5nIHRoaXMgKGZsdXNoIHRoZW4gdW5s
b2NrLCBvciB1bmxvY2sNCj4gdGhlbiBmbHVzaCkuIEtldmluPw0KPiANCg0KQWdyZWUuIEdlbmVy
YWxseSBzcGVha2luZyAndW5sb2NrIHRoZW4gZmx1c2gnIGlzIHByZWZlcnJlZCBzaW5jZQ0Kc3Bp
bmxvY2sgZG9lc24ndCBwcm90ZWN0IGlvbW11IGFueXdheS4NCg0KPiA+IEBAIC0xNzc1LDE1ICsx
Nzc4LDEyIEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrDQo+IGludGVsX2lvbW11X21hcF9wYWdl
KHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwNCj4gPiAgICAgIHBhZ2UgPSAoc3RydWN0IGRt
YV9wdGUgKiltYXBfdnRkX2RvbWFpbl9wYWdlKHBnX21hZGRyKTsNCj4gPiAgICAgIHB0ZSA9ICZw
YWdlW2Rmbl94KGRmbikgJiBMRVZFTF9NQVNLXTsNCj4gPiAgICAgIG9sZCA9ICpwdGU7DQo+ID4g
LQ0KPiA+IC0gICAgZG1hX3NldF9wdGVfYWRkcihuZXcsIG1mbl90b19tYWRkcihtZm4pKTsNCj4g
PiAtICAgIGRtYV9zZXRfcHRlX3Byb3QobmV3LA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAo
KGZsYWdzICYgSU9NTVVGX3JlYWRhYmxlKSA/IERNQV9QVEVfUkVBRCAgOiAwKSB8DQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICgoZmxhZ3MgJiBJT01NVUZfd3JpdGFibGUpID8gRE1BX1BURV9X
UklURSA6IDApKTsNCj4gPiAtDQo+ID4gLSAgICAvKiBTZXQgdGhlIFNOUCBvbiBsZWFmIHBhZ2Ug
dGFibGUgaWYgU25vb3AgQ29udHJvbCBhdmFpbGFibGUgKi8NCj4gPiAtICAgIGlmICggaW9tbXVf
c25vb3AgKQ0KPiA+IC0gICAgICAgIGRtYV9zZXRfcHRlX3NucChuZXcpOw0KPiA+ICsgICAgbmV3
ID0gKHN0cnVjdCBkbWFfcHRlKXsNCj4gPiArICAgICAgICAuciA9IGZsYWdzICYgSU9NTVVGX3Jl
YWRhYmxlLA0KPiA+ICsgICAgICAgIC53ID0gZmxhZ3MgJiBJT01NVUZfd3JpdGFibGUsDQo+ID4g
KyAgICAgICAgLnNucCA9IGlvbW11X3Nub29wLA0KPiA+ICsgICAgICAgIC5hZGRyID0gbWZuX3go
bWZuKSwNCj4gPiArICAgIH07DQo+IA0KPiBXZSBzdGlsbCBoYXZlbid0IHNldHRsZWQgb24gYSBu
ZXdlciBnY2MgYmFzZWxpbmUsIHNvIHRoaXMga2luZCBvZg0KPiBpbml0aWFsaXplciBpcyBzdGls
bCBub3QgYWxsb3dlZCAoYXMgaW46IHdpbGwgYnJlYWsgdGhlIGJ1aWxkKSBmb3INCj4gc3RydWN0
LXMgd2l0aCB1bm5hbWVkIHN1Yi1zdHJ1Y3QtcyAvIHN1Yi11bmlvbi1zLg0KPiANCj4gPiBAQCAt
MjYxMSwxOCArMjYxMSwxOCBAQCBzdGF0aWMgdm9pZA0KPiB2dGRfZHVtcF9wYWdlX3RhYmxlX2xl
dmVsKHBhZGRyX3QgcHRfbWFkZHIsIGludCBsZXZlbCwgcGFkZHJfdCBncGEsDQo+ID4gICAgICAg
ICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOw0KPiA+DQo+ID4gICAgICAgICAgcHRl
ID0gJnB0X3ZhZGRyW2ldOw0KPiA+IC0gICAgICAgIGlmICggIWRtYV9wdGVfcHJlc2VudCgqcHRl
KSApDQo+ID4gKyAgICAgICAgaWYgKCAhcHRlLT5yICYmICFwdGUtPncgKQ0KPiA+ICAgICAgICAg
ICAgICBjb250aW51ZTsNCj4gPg0KPiA+ICAgICAgICAgIGFkZHJlc3MgPSBncGEgKyBvZmZzZXRf
bGV2ZWxfYWRkcmVzcyhpLCBsZXZlbCk7DQo+ID4gICAgICAgICAgaWYgKCBuZXh0X2xldmVsID49
IDEgKQ0KPiA+IC0gICAgICAgICAgICB2dGRfZHVtcF9wYWdlX3RhYmxlX2xldmVsKGRtYV9wdGVf
YWRkcigqcHRlKSwgbmV4dF9sZXZlbCwNCj4gPiArICAgICAgICAgICAgdnRkX2R1bXBfcGFnZV90
YWJsZV9sZXZlbChwZm5fdG9fcGFkZHIocHRlLT5hZGRyKSwgbmV4dF9sZXZlbCwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNzLCBpbmRlbnQgKyAxKTsN
Cj4gPiAgICAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgIHByaW50aygiJSpzZGZuOiAlMDhs
eCBtZm46ICUwOGx4XG4iLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgaW5kZW50LCAiIiwNCj4g
PiAgICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKShhZGRyZXNzID4+IFBBR0VfU0hJ
RlRfNEspLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpKGRtYV9wdGVf
YWRkcigqcHRlKSA+PiBQQUdFX1NISUZUXzRLKSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAo
dW5zaWduZWQgbG9uZykocHRlLT5hZGRyKSk7DQo+IA0KPiBDb3VsZCB5b3UgYWxzbyBkcm9wIHRo
ZSBubyBsb25nZXIgbmVlZGVkIHBhaXIgb2YgcGFyZW50aGVzZXMuIEkNCj4gZnVydGhlciBzdXNw
ZWN0IHRoZSBjYXN0IGlzbid0IG5lZWRlZCAoYW55bW9yZT8pLiAoT3RvaCBJIHRoaW5rDQo+IEkg
cmVjYWxsIG9kZGl0aWVzIHdpdGggZ2NjJ3MgcHJpbnRmKCktc3R5bGUgZm9ybWF0IGNoZWNraW5n
IGFuZA0KPiBkaXJlY3QgcGFzc2luZyBvZiBiaXRmaWVsZHMuIEJ1dCBpZiB0aGF0J3MgYSBwcm9i
bGVtLCBJIHRoaW5rDQo+IG9uZSBvZiB0aGUgZWFybGllciBvbmVzIGFscmVhZHkgaW50cm9kdWNl
ZCBzdWNoIGFuIGlzc3VlLiBTbw0KPiBwZXJoYXBzIHdlIGNhbiB3YWl0IHVudGlsIHNvbWVvbmUg
YWN0dWFsbHkgY29uZmlybXMgdGhlcmUgaXMgYW4NCj4gaXNzdWUgLSBxdWl0ZSBsaWtlbHkgdGhp
cyBzb21lb25lIHdvdWxkIGJlIG1lIGFueXdheS4pDQo+IA0KPiA+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5oDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmgNCj4gPiBAQCAtMjQ0LDM4ICsyNDQsMjEgQEAgc3RydWN0IGNvbnRleHRf
ZW50cnkgew0KPiA+ICAjZGVmaW5lIGxldmVsX3NpemUobCkgKDEgPDwgbGV2ZWxfdG9fb2Zmc2V0
X2JpdHMobCkpDQo+ID4gICNkZWZpbmUgYWxpZ25fdG9fbGV2ZWwoYWRkciwgbCkgKChhZGRyICsg
bGV2ZWxfc2l6ZShsKSAtIDEpICYgbGV2ZWxfbWFzayhsKSkNCj4gPg0KPiA+IC0vKg0KPiA+IC0g
KiAwOiByZWFkYWJsZQ0KPiA+IC0gKiAxOiB3cml0YWJsZQ0KPiA+IC0gKiAyLTY6IHJlc2VydmVk
DQo+ID4gLSAqIDc6IHN1cGVyIHBhZ2UNCj4gPiAtICogOC0xMTogYXZhaWxhYmxlDQo+ID4gLSAq
IDEyLTYzOiBIb3N0IHBoeXNjaWFsIGFkZHJlc3MNCj4gPiAtICovDQo+ID4gIHN0cnVjdCBkbWFf
cHRlIHsNCj4gPiAtICAgIHU2NCB2YWw7DQo+ID4gKyAgICB1bmlvbiB7DQo+ID4gKyAgICAgICAg
dWludDY0X3QgdmFsOw0KPiA+ICsgICAgICAgIHN0cnVjdCB7DQo+ID4gKyAgICAgICAgICAgIGJv
b2wgcjoxOw0KPiA+ICsgICAgICAgICAgICBib29sIHc6MTsNCj4gPiArICAgICAgICAgICAgdW5z
aWduZWQgaW50IHJlc2VydmVkMDoxOw0KDQonWCcgYml0IGlzIGlnbm9yZWQgaW5zdGVhZCBvZiBy
ZXNlcnZlZCB3aGVuIGV4ZWN1dGUgcmVxdWVzdCBpcyBub3QNCnJlcG9ydGVkIG9yIGRpc2FibGVk
Lg0KDQpUaGFua3MNCktldmluDQoNCj4gPiArICAgICAgICAgICAgdW5zaWduZWQgaW50IGlnbm9y
ZWQwOjQ7DQo+ID4gKyAgICAgICAgICAgIGJvb2wgcHM6MTsNCj4gPiArICAgICAgICAgICAgdW5z
aWduZWQgaW50IGlnbm9yZWQxOjM7DQo+ID4gKyAgICAgICAgICAgIGJvb2wgc25wOjE7DQo+ID4g
KyAgICAgICAgICAgIHVpbnQ2NF90IGFkZHI6NTI7DQo+IA0KPiBBcyBwZXIgdGhlIGRvYyBJIGxv
b2sgYXQgdGhpcyBleHRlbmRzIG9ubHkgdG8gYml0IDUxIGF0IG1vc3QuDQo+IEFib3ZlIGFyZSAx
MSBpZ25vcmVkIGJpdHMgYW5kIChpbiBsZWFmIGVudHJpZXMpIHRoZSBUTSBvbmUuDQo+IA0KPiBD
b25zaWRlcmluZyB0aGUgZGlmZmVyZW5jZXMgYmV0d2VlbiBsZWFmIGFuZCBpbnRlcm1lZGlhdGUN
Cj4gZW50cmllcywgcGVyaGFwcyBsZWFmLW9ubHkgZmllbGRzIGNvdWxkIGdhaW4gYSBicmllZiBj
b21tZW50Pw0KPiANCj4gSmFuDQoNCg==

