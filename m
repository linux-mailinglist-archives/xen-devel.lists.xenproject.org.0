Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC0F2C96C6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 06:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41571.74827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjxzX-0002ur-4H; Tue, 01 Dec 2020 05:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41571.74827; Tue, 01 Dec 2020 05:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjxzX-0002uS-0S; Tue, 01 Dec 2020 05:14:19 +0000
Received: by outflank-mailman (input) for mailman id 41571;
 Tue, 01 Dec 2020 05:14:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dyvC=FF=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kjxzV-0002uL-IN
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 05:14:17 +0000
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93725f7a-dd98-4abe-9a7e-3d8b78546769;
 Tue, 01 Dec 2020 05:14:15 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 21:14:13 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2020 21:14:13 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 21:14:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 21:14:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 21:14:13 -0800
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1567.namprd11.prod.outlook.com (2603:10b6:301:d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Tue, 1 Dec
 2020 05:14:12 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 05:14:12 +0000
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
X-Inumbo-ID: 93725f7a-dd98-4abe-9a7e-3d8b78546769
IronPort-SDR: XkMNV1+2CrEGkgM/4VsJNHGa/3sUKEybaEjGOngtXOJiIxB+AlBgd5uLCsNyHok1LYLpjYW0n9
 +0MKC96LiaZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="257476237"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="257476237"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
IronPort-SDR: Y3smGJXVsL4fdnji/rGLWpdc9DGdRbZRQ2hchFG0Y9h2/jOpAeyNn5C3RKtX9xyJyAfwi1h+dL
 lFyDVQPDONKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="538870292"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lETtPNVhmMDWh7FWaiDGq9kIGR0D0WVXL2g/rkD/Mh1/2GcPO86+Azi5DcbBiLXkhXizsnCh3XyUu9bQznkXN5kPG4dAXAXxN3Po38jE6mqs/Gpyy1Yr+d4P8Py1pR5GWhwX5ZkZ6OH97B0OKxd91JS5jS0rTNUIDJ8zW4mGgE8A/3kX0UmOjpW8iRdDq5jzoSDoha8GjeKMloKQBbSdci/jPp/QFp9WsXSECMVJz8Gj0gx8ujO82s8/CYC97m/tegB+7QZH/MQj3HjsDtwVcx/qHVXatzExe0hH+IPOgx25KVUNYMqjrSmwjigd7qwkKeFjjKS3WEkaHOf3N0TjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrMHMsU9ngcsF76fZaDCMsSaDHV0e/vGyRm24Rw2OTk=;
 b=czPxKyh4H6u5PAOJ0iIzV2G2UTPd1hVrhKnQmxz46mzhh9BBtvkP/uX6tm5K10yz0pV/qSZk6FDiRELRNL5DvakQqc8PcYOTss2nR5iTmtgmm1b8kY51ZP5Q5iQAfPCwJiQD5pIWSAKgcyw73ibWWdfK/IBPaYDlYFTl/JZCvinuzjAUdsuGHDA7BrXFh+9fok5PBVXSWRt3C04XtPrG8N5Pf2O2MCMj8auIV69yw3lpCNp3oILIE8cMhu1B7bi8mopaU1NbOBXWWmFpvi5793tFT0GNaL9RkkFdGeikBXg8a+w3y+EmGA6Ip0FoU7NMrmFPw7D0++QCEfm1ZbkcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrMHMsU9ngcsF76fZaDCMsSaDHV0e/vGyRm24Rw2OTk=;
 b=J7PsWmTJ+6o12Do3ytS5wE9eU/sWkleECVrjl9d7grSMkdDHE3SL7zX79bsN5qjw5JCpi+ZMoopTZDI+o8Vx5HJT5XjxfWboHBSoyapxKPy6h6m0DAhLDvgnJJaNKE+RuNfZ0OyBU3/ymVdn3xza9rj4SL7GNJNIFoRTSBgluPI=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <pdurrant@amazon.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v10 5/7] vtd: use a bit field for root_entry
Thread-Topic: [PATCH v10 5/7] vtd: use a bit field for root_entry
Thread-Index: AQHWv0COaWiEdvBtMUu0J5DvTo0K7angCUXAgABza4CAAUYrEA==
Date: Tue, 1 Dec 2020 05:14:12 +0000
Message-ID: <MWHPR11MB16454C8AA702124013BE89F68CF40@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-6-paul@xen.org>
 <MWHPR11MB164520264945AF959D7A3ED28CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
 <5962cbc3-5aaf-7855-e00d-fb525441f454@suse.com>
In-Reply-To: <5962cbc3-5aaf-7855-e00d-fb525441f454@suse.com>
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
x-ms-office365-filtering-correlation-id: 3df7bc9f-be6c-4013-0c97-08d895b7f0bc
x-ms-traffictypediagnostic: MWHPR11MB1567:
x-microsoft-antispam-prvs: <MWHPR11MB1567019EE62FBDBD93ED9A3E8CF40@MWHPR11MB1567.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: loJhw/8ykJr34ImqOGHJNNWJwvTTkyrz8KnsxIKfHTH96MM8YRIEYHiuYBO/tXaB4jBB12loCLD+B0yVUXkiWkjidlOD7VUAB7mBG5y6iHuyJUtPb6qDELtu+bi7BEV1GYvHLbuFc4eHCdVCFzhEW/Ihi3/I1/jPv1hphFsnUXnamIQkkZjA/wSLytOzGgyOIEgeKdwfC0sYiKZlIEbIlcx7jrxWb1b3aw65e7XIVyMWO0Hq0CJTBrM2RpI/5lZsD9WIIU/t5rNlW5YseICUlHnZZYVB6hgdG7DK0/FhvQIbb7hVbTGz/vXwrnvWrp2ueU3H8xhnlauHZ4Qm1CbEog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(8936002)(4744005)(2906002)(6916009)(33656002)(76116006)(4326008)(54906003)(86362001)(71200400001)(8676002)(186003)(478600001)(26005)(316002)(5660300002)(66446008)(83380400001)(7696005)(66556008)(53546011)(66946007)(66476007)(52536014)(64756008)(9686003)(6506007)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TWY1MVhiZ001MGN1MUhPSVRhdE9QYjN0Q2VoSVlCNEIrMWE0Q2doanhzTFZK?=
 =?utf-8?B?VGJub0Y2dmFUL3ZEWUZ0WndsM3l6eWkrZzBWeno3MStyYStKc3MxSWhTVjVv?=
 =?utf-8?B?cUszRnZVdllva2lSaldFVjRROHpFb0hkK29xbmt2RnY4ZmdvQ0hMMVpXSUFn?=
 =?utf-8?B?cm14M0xxY1RwTWhrU2YxcmJQeCtHTXd6RnFTREVuYXJKVjJ5ODFVaHp0bDNh?=
 =?utf-8?B?eE9HZFlEOVR3blk4RDdtSTJvd05zK3hlNjFXZjJwbm1kOE5FelQ3eXF6RXVL?=
 =?utf-8?B?eUx3L2ZWeWQ3VzVvT2xGVWdHRlVsWkxXTHVHMkU4eG1oaHRWenJrQ3FMazRj?=
 =?utf-8?B?aGF6QlNGeGoyVlUybzZERlBOM3MyaURFdXU5WElyb0p0K3VZZEJpOENTMktC?=
 =?utf-8?B?Z0k5dVJnWXdoeTZ0QTcxbW9pTXNzMC9uSHFDM1FFaVYxczRobHVNWUp4MzEr?=
 =?utf-8?B?czV1a3c1NTJVbW9LSjBDbnNFVVFET2tHVHQxYnRqNmYrRTVPMkdUYU1qR3Bo?=
 =?utf-8?B?aVdlZ3VldjRvaFR5RWlXMjQ4ZThROUpwVXlPVExrVGNKTUI3MzZISjBzRndw?=
 =?utf-8?B?UjY2RE1hbGdKcThZZ3haaUZtUm1SZEFMazg4VHpJRFVDVTM4YnBRNHNVTUp5?=
 =?utf-8?B?WnFId3M3SDBERGd0WThCQUthb2h4dDh5QU5NN3VjbUpRRkNMdndWTXRHUjNu?=
 =?utf-8?B?aFJiRTFxQ244ekNGcHlMZGZvc2JUa0lJRHc1MHJpRGF4dEl3MkxpclZNb1Mz?=
 =?utf-8?B?UHZjQW1nTTExdCtCQkh6UmpuYWRhbmRnRHpHSHBHMkhIQW9UNUl4MGVnY1Rn?=
 =?utf-8?B?N3ZpUHRFNkJvRVhFNXdMekhkUkVkTW02VEY5NzhFRE9FZFQ1N0QvVisvRGFR?=
 =?utf-8?B?M2tiNWVmQ1U0aStvbjNOVmFCOGY5RDBsNXlQcjhFRjBXRTNMVWs5SmpIWVZJ?=
 =?utf-8?B?Wk1CQUN0S01RV29TOXRjM2dHajNuMVM4RlFoRm5rUXJKQ1BvZjhnN2pNcWFm?=
 =?utf-8?B?VWZRM0dReE9SZ2tPQU9VNWRJckxPY0poMlJOLytCTlRlUWZ0R3l5eTNvRmNs?=
 =?utf-8?B?cjRiemloS3VGUU11dzNHNXM5NGorL2RyRE16aDhmdnU4bG5maUkrMzB5aUZl?=
 =?utf-8?B?YlduYmY2SWlqY1pPV0RYWGlnNWRWUTFLTlFuWW5ZVkprUzMyVjNOT1pwTVV2?=
 =?utf-8?B?NHJVbkgyVVZlVks1WjFhdnF0dUF4R2Uya1BERmpXM2RKSnZzWWYzcnBTYnpz?=
 =?utf-8?B?NXhSMG9yNVhhNmpyMHpreHd6OGlPQlpIRlVWc3BmQUdQT25UN0gra2FHNGJm?=
 =?utf-8?Q?Vd52VsWN3kmZ8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df7bc9f-be6c-4013-0c97-08d895b7f0bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 05:14:12.1395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QTh6hjw/34+YCtL+twLJpA3u6ymkmE3M5Bg+xOiA1U5jMqQyAs+2YTxrS6lVz6/QK7GqWRKY7i7dTjiFmDW1rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1567
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
Tm92ZW1iZXIgMzAsIDIwMjAgNTo0NiBQTQ0KPiANCj4gT24gMzAuMTEuMjAyMCAwNDowNiwgVGlh
biwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0K
PiA+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDIwLCAyMDIwIDk6MjUgUE0NCj4gPj4NCj4gPj4g
RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+Pg0KPiA+PiBUaGlz
IG1ha2VzIHRoZSBjb2RlIGEgbGl0dGxlIGVhc2llciB0byByZWFkIGFuZCBhbHNvIG1ha2VzIGl0
IG1vcmUNCj4gY29uc2lzdGVudA0KPiA+PiB3aXRoIGlyZW1hcF9lbnRyeS4NCj4gPj4NCj4gPj4g
QWxzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byB0aWR5IHVwIHRoZSBpbXBsZW1lbnRhdGlvbiBv
Zg0KPiA+PiBkZXZpY2VfaW5fZG9tYWluKCkuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IA0KPiBCZXNpZGVzIHRoaXMgbG9va2luZyBhIGxpdHRs
ZSBvZGQgKGNhbiBiZSBlYXNpbHkgZml4ZWQgb2YgY291cnNlKQ0KPiBJIHdvbmRlciB3aGV0aGVy
IGJvdGggaGVyZSBhbmQgZm9yIHBhdGNoIDYgeW91IGhhZCBzZWVuIG15IHJlcXVlc3RzDQo+IGZv
ciBzbWFsbGlzaCBjaGFuZ2VzLCBhbmQgd2hldGhlciB5b3UgbWVhbnQgdG8gb3ZlcnJpZGUgdGhv
c2UsIG9yDQo+IHdoZXRoZXIgeW91ciBSLWIgd2lsbCBjb250aW51ZSB0byBhcHBseSB3aXRoIHRo
ZW0gbWFkZS4NCj4gDQoNCkxldCBteSBSLWIgY29udGludWUgdG8gYXBwbHkuIFRob3NlIGFyZSBz
bWFsbCBjaGFuZ2VzLg0KDQpUaGFua3MNCktldmluDQo=

