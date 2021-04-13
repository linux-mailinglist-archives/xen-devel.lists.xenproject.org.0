Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7065635D578
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 04:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109492.208993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW9AR-00089g-N7; Tue, 13 Apr 2021 02:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109492.208993; Tue, 13 Apr 2021 02:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW9AR-00089H-Jw; Tue, 13 Apr 2021 02:52:43 +0000
Received: by outflank-mailman (input) for mailman id 109492;
 Tue, 13 Apr 2021 02:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fw58=JK=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lW9AQ-00089C-5k
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 02:52:42 +0000
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 571cc4fb-6fe5-4a41-8c75-f89ead5870b9;
 Tue, 13 Apr 2021 02:52:41 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:52:40 -0700
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 12 Apr 2021 19:52:40 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 12 Apr 2021 19:52:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 12 Apr 2021 19:52:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 12 Apr 2021 19:52:39 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1663.namprd11.prod.outlook.com (2603:10b6:301:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Tue, 13 Apr
 2021 02:52:34 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 02:52:34 +0000
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
X-Inumbo-ID: 571cc4fb-6fe5-4a41-8c75-f89ead5870b9
IronPort-SDR: j1UZXAjbmp0lrETWFzRgE4xU9R/vKpk4D5/U7clvxfDjMjEWnqjqCtVTxszT6P906pqern+suf
 16OhZAxY1wuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="192194657"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="192194657"
IronPort-SDR: 05ZLCTlBQPW7/R2xxJ+3E4a4UAGCL9HR7k8eHy8ggOip3kuyBv/nOXVtHr0xOqWo1Zz2CRWAAr
 KyjYzzP1s1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="424064572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUoVuXdkNTmILCdrH2WFaVjWHTT7fRPAJSsJFW86JusHIPfY+3H9/2J4EL11FxYNI7cRN2MBu4Q769KSwjguAF1hWcNnnbsioje74gf5TiWWOsnkZqYkY9J80Yln8BSmitT3M9HIzDU/Fbf+S7UAK76YxbfirAW8Q4Zen2XatQDofVEHA7X7fYHhX5n23TokmiNVQp6ic5fDXb80aTPrc6Glo9y9omzdJzckBX8oywu8ctcOA6wuvbpq1YCVJL3OLzQem/kpi/Sxdwkw8gJpSsuyDXf9gHiC2kk1ppkKG+ATEsHRF4HC1LVv75tVlaXRr6THTy1tn4rbD4oWECjrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsGR47VZ6LlNbIF+aGq5d+PZreWpD7X5loHU2IL/6Ts=;
 b=YM6Ph651NPxAdYoUx1/ckJhts6sG/xMkoQ7DVHaDXS+AiONWVoNlWD1s0QAf96mwmhxFdMq5pngRWdz5JVPNbaHHoQTDiL4B/LSGFUNtPCZJA6zwVSd0IRD1FP2LCcF2Tiko5QAaJi+dZKkwzsNCYf5PaT1+5py/B1T+OB03qQy5DTuZ+QA0P87usrgXdEUJQXxW42NFb9q5dgkDMLX7NlGGr+Tpq7mcxzt8fkwB+xz/g3nSH8kiKuShkmqF3+cfU3l+ioUHmV2rKmTLxWBfVBa4nT8yDmhyPIXQa8iX4I3WqikiknjcNRhDM47G2erA2qAbU4PjZjzEa7kg+TUgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsGR47VZ6LlNbIF+aGq5d+PZreWpD7X5loHU2IL/6Ts=;
 b=qNCqda4ihdCwaJemk1zZUmR1ragmAZyNpN27sVWByza3N1vlFOrrdc2v32e9bOPSjTj/kTkGc9+pDklRKc2ML4FLzLWgLt+Vv1/x8t1XhLDaHURZr7sfFf7FSX4cNQWQMoxqWriuAX0zwncco0Q6yxN3EfO6jZ2wgYHINmzsoIQ=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH] x86/EPT: minor local variable adjustment in
 ept_set_entry()
Thread-Topic: [PATCH] x86/EPT: minor local variable adjustment in
 ept_set_entry()
Thread-Index: AQHXL4+7dnXIvXPTUkGtk5FNTmUwKqqxwNuw
Date: Tue, 13 Apr 2021 02:52:33 +0000
Message-ID: <MWHPR11MB188634433DD490CFD73F347A8C4F9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <c682ec9a-c339-a929-1c91-c20bf53d9722@suse.com>
In-Reply-To: <c682ec9a-c339-a929-1c91-c20bf53d9722@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e339e28-e40b-4ea3-a30f-08d8fe273049
x-ms-traffictypediagnostic: MWHPR11MB1663:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1663DB2A28DE75137DE071368C4F9@MWHPR11MB1663.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ApTu/jmtUJnrodaOBok9qpkcw7Kqbrqs/sfyL0e+jao56wobqQb44BJD8ViJXHP6xN8BIQjQYHTlbiDr9HKLL1S4Se0kGMDTw8bZkSS5RlcrT4GQmSb7ZWRvZNnkQxc2r7hz58CgDe1Y3b9IYvLHbLiM2z96pKAKI5+MdopylUxjmXOgyP3+CRblU5fY2qWn7TTEQeyr9QaziD+0ivKJdDqwB2ZO+35y9H5TKt8/Xs/R3cb8zkt3q/Zeo+SxSed8O4nvai7l6XJK2MxWW68J9OrkN+6WXI51udEvIk29yKBTZACOwttA9jhu0fuMW5SinQzqvwfZaHjUeLT1bTUqG74CI8tFp8ZWUqlAP2PV0JE0ULZX5X41MfWEYtMfvXsCPTyLP5tuB6+mSR3l7l4o+fbTD2NZLuBB2zvQyfcZt4e7ba1bsnHIOiA4TwU1ZX6V44uRl60vNx/DjiKJ7ZRw12OfiGys+WA51t+l2RyGyP1TcXhmgJ6UwXtxC5paCr1Kr372mkkjYdn97Ga6Iefpqohn5Z2i6b41Msi+BGV9eYD98CAtEXX2b7IYtcYvm7WBSuGXP5AwGG9YbfvSMyBqyDp8cXvZ1dfAdqKg1y6tvio=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(136003)(346002)(366004)(8936002)(86362001)(8676002)(4326008)(110136005)(316002)(38100700002)(2906002)(33656002)(6506007)(478600001)(122000001)(9686003)(26005)(83380400001)(7696005)(55016002)(186003)(5660300002)(66446008)(54906003)(66476007)(64756008)(76116006)(66946007)(66556008)(71200400001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SnZuQTVBTDlETlN3dHQ2SmtiMHFjUVpIcDE4WVBBZllheitRVUs0K0tuNmwy?=
 =?utf-8?B?NnRqOUFhSlgxWitqbWxnbmhWbmN3TjJ3L056K2V6YkxlOUVGV3ZRUmJqa2dR?=
 =?utf-8?B?c1c1TTgrS3l0aW9iVCs3U0RLbTZzOWVjU1FnR3hrUWRQKzNPbTN2WXBTOVRN?=
 =?utf-8?B?MXMrai94bGpGcEFWMzlHVnoyYTdWUm9vUlVwTVlRQzJlU0ZkN2lnWHdLMURH?=
 =?utf-8?B?M1dhcU1OY3NoNllwai9DWFYxb2cyRW9pbHFMTytGUy9Zc1lobGdCRSt6NDcy?=
 =?utf-8?B?VWFSMU5lSjQwaVVzZjE4Q0V4a2IvakpHMUhUNFFIZmRBSVBmMG5UNFI5dFhJ?=
 =?utf-8?B?UnFMREZOOFVXL0pvSjZhbzhxSGk1czFkWnovdHl5WkNhSDNBY3JFQkVabEJo?=
 =?utf-8?B?SFFxWk1TM0tlNUpoYnUrY3FxSEUvTjl0Uk9uQ2RRTGowdm94eC9ZazQ4UHcw?=
 =?utf-8?B?cUNnWmcrNGd4QUxkYWMwT0JWQ0hYMHFxM0owWml1WnZPU3BkVzkzMkxObUw4?=
 =?utf-8?B?Zit3KzNTMXlFNGRiTXJSWmtzazJMTDBVYkhmdlNncE0vdExTa0l1NlRoT256?=
 =?utf-8?B?QVR0aU4yajhhYVU4WGo2QzRuTndrS2I5QjhjM2lCbWMzQWVUMlNDb0M5bjY0?=
 =?utf-8?B?L0o4ekZvU1hHNklLZ3ZuY2NFOXBWVk1wc1FOMjN5MXhwRmQ0ZkNRd3kvU3ly?=
 =?utf-8?B?dDFxUTk2YlpBMDZXVFFTWTBCeDFvd3NaZXNoQ0ZYZ0Q5TFhXd1RLOEdmOGI1?=
 =?utf-8?B?R3BCZmdOR2NwR1BJb3lheTJaWU04cFBTM1o0cjRINDdoZGQ2eURYNFZDdWk4?=
 =?utf-8?B?bWZEeGJkZCtsdWJBUExmQ1hscnBlOHgraVNRQXdRdTRzUTdIR054V3lsTkFW?=
 =?utf-8?B?N3dhSHhMV3FPMkcvUzhPaUtHOHlpeWlTZmc1bUJpRnFmVVlUVW5Dc2R1M3o0?=
 =?utf-8?B?dWpwYVlxZzdORVE5a3BMSTBzQyt5citpdW9UcHM3cG13Ly9SUjNNdlhGTzRM?=
 =?utf-8?B?a3hqU3NQcGZUK2lSb2wyLzFwNHdic1B4ZEtFdUZBYmdkbVVrbVBnZGJUeFJT?=
 =?utf-8?B?eEtsRUFzU0JFdmloK2NadU51cFQ2QkVzQ0l4azEwekNwYi9TWG9pdTl1T1hq?=
 =?utf-8?B?WGlRU05IdmJBWVovanJxMGtPZ1NhRUNxM0xGdVZlc3BLWXh2UWNVdkdJUTdi?=
 =?utf-8?B?cnp1dUQxWlZpeDNJZlVWY2g5NGRHWDZ2cmdxb3hSUXh2TFNseSt4TmxxVTFO?=
 =?utf-8?B?ZlpsVTh0a3NZdHFicFBrV29WOXFyMER0aXpPbVNrT0lUc0MvQk10TzZHbVQ0?=
 =?utf-8?B?cUVXbE05dTdqUVBXaGQvdWFVbXZxbWh2cGQvYys3Q3paUlZvQ3pLMnJXbjBH?=
 =?utf-8?B?TkN3MjBUY013VUJhTkdhRjZBZUJMWEF6ME45V09yL1lEeldQSUtDdTFpQm1L?=
 =?utf-8?B?Q3VWWGZyaWtYd3dKa3VqdTU0dDI0Kyt5Z1BsL2hpTnVwYnlJQmFPUTdjOHdx?=
 =?utf-8?B?NW50V3FKd1FKY2NkK3ZhRnFxbStlekFlWnBOU0t1TFRpcGs5elNJY1pHRTF1?=
 =?utf-8?B?UTZ6SXl0RHBxNXNMdWdBWHlBTWMrM3JZWnNQbU5RcHRyaXpxYTlJeFdFbjdv?=
 =?utf-8?B?U056SC9TeXBUSDdURlFFaERSdUg5czZuOCtSZ3ZMZzBSQU1oWGxNUDhDaDFi?=
 =?utf-8?B?VWpONGE4dEZwOU5QZ3c3NHVuWHJxbk5uR0NrcWtCR1pEOC95cE9jTFJxVUZn?=
 =?utf-8?Q?K8BmwL7PVPyj8aGS53L0uqx452Z9hPmiYokS9VC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e339e28-e40b-4ea3-a30f-08d8fe273049
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 02:52:33.9037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhfAM+MT7iN9WAk1p08ZaZll/2CO6Z96+z5myRz2B00qj54TDcvwxE/t9rc4EA6QqT/qM2h1i6n88bt/qET3eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1663
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMTIsIDIwMjEgNzozNCBQTQ0KPiBOb3QgaGF2aW5nIGRpcmVjdF9tbWlvICh1c2VkIG9u
bHkgb25jZSBhbnl3YXkpIGFzIGEgbG9jYWwgdmFyaWFibGUgZ2V0cw0KPiB0aGUgZXB0ZV9nZXRf
ZW50cnlfZW10KCkgaW52b2NhdGlvbiBoZXJlIGluIGJldHRlciBzeW5jIHdpdGggdGhlIG90aGVy
DQo+IG9uZXMuIFdoaWxlIGF0IGl0IGFsc28gcmVkdWNlIGlwYXQncyBzY29wZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IA0KPiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vcDJtLWVwdC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMN
Cj4gQEAgLTY3Nyw4ICs2NzcsNiBAQCBlcHRfc2V0X2VudHJ5KHN0cnVjdCBwMm1fZG9tYWluICpw
Mm0sIGdmDQo+ICAgICAgdW5zaWduZWQgbG9uZyBmbl9tYXNrID0gIW1mbl9lcShtZm4sIElOVkFM
SURfTUZOKSA/IChnZm4gfA0KPiBtZm5feChtZm4pKSA6IGdmbjsNCj4gICAgICBpbnQgcmV0LCBy
YyA9IDA7DQo+ICAgICAgYm9vbF90IGVudHJ5X3dyaXR0ZW4gPSAwOw0KPiAtICAgIGJvb2xfdCBk
aXJlY3RfbW1pbyA9IChwMm10ID09IHAybV9tbWlvX2RpcmVjdCk7DQo+IC0gICAgdWludDhfdCBp
cGF0ID0gMDsNCj4gICAgICBib29sX3QgbmVlZF9tb2RpZnlfdnRkX3RhYmxlID0gMTsNCj4gICAg
ICBib29sX3QgdnRkX3B0ZV9wcmVzZW50ID0gMDsNCj4gICAgICB1bnNpZ25lZCBpbnQgaW9tbXVf
ZmxhZ3MgPSBwMm1fZ2V0X2lvbW11X2ZsYWdzKHAybXQsIG1mbik7DQo+IEBAIC03OTAsOCArNzg4
LDEwIEBAIGVwdF9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgZ2YNCj4gDQo+ICAg
ICAgaWYgKCBtZm5fdmFsaWQobWZuKSB8fCBwMm1fYWxsb3dzX2ludmFsaWRfbWZuKHAybXQpICkN
Cj4gICAgICB7DQo+ICsgICAgICAgIHVpbnQ4X3QgaXBhdCA9IDA7DQo+ICAgICAgICAgIGludCBl
bXQgPSBlcHRlX2dldF9lbnRyeV9lbXQocDJtLT5kb21haW4sIGdmbiwgbWZuLA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGkgKiBFUFRfVEFCTEVfT1JERVIsICZpcGF0
LCBkaXJlY3RfbW1pbyk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aSAqIEVQVF9UQUJMRV9PUkRFUiwgJmlwYXQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcDJtdCA9PSBwMm1fbW1pb19kaXJlY3QpOw0KPiANCj4gICAgICAgICAgaWYg
KCBlbXQgPj0gMCApDQo+ICAgICAgICAgICAgICBuZXdfZW50cnkuZW10ID0gZW10Ow0K

