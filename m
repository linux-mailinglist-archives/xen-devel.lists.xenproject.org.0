Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864B32760E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 03:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91217.172299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGY8m-0003G3-Qa; Mon, 01 Mar 2021 02:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91217.172299; Mon, 01 Mar 2021 02:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGY8m-0003Fh-N9; Mon, 01 Mar 2021 02:18:32 +0000
Received: by outflank-mailman (input) for mailman id 91217;
 Mon, 01 Mar 2021 02:18:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8He=H7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lGY8l-0003Fc-7B
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 02:18:31 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa50b3be-5b33-4c92-88a3-882ee32fdafb;
 Mon, 01 Mar 2021 02:18:28 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 18:18:27 -0800
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2021 18:18:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:18:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 28 Feb 2021 18:18:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 28 Feb 2021 18:18:25 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 02:18:25 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 02:18:24 +0000
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
X-Inumbo-ID: aa50b3be-5b33-4c92-88a3-882ee32fdafb
IronPort-SDR: fBH/Mrjyz3e+Un1gBdPQc1+q6lcWfYRZPR6ij46kiqzK6SBh2x9vg2nrENI8Oc5Mx+GreJmkH1
 kBPY9oKLg6Fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="186388510"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="186388510"
IronPort-SDR: YvwSSqPtcfxGLROnapjH8prtQMyvQ/oSKkKI4A7pqGghZa3gNm4grmKldgw4YVIX4eqLDqyyo8
 J7w5oXRKav3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="397256789"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT67WWLDTj3UydlOggPOcDTvZ9EScpii98WUFweQBl3Fna4xaTPCtrFECj965Od5FRmV3yf8gOWzGdMxBFaMOmp3glBzHwHbl4JntibeU7sRSzO5ZEYoIt1dcvX3r0+rVwf5cs9yEKHleMQv38TsAlGYVhfnqOTWUZnThtCiL/zPVT54AyjGuWTmhvbfBahvpQCHwuJWAWPwcJoTOA0fzjqNGSxVhtaQQtTKcInq0juVd2ADj3efUEPSgLZEspwmifswmFL7Kwr5c4ytOCH2Gt0hH2ae91z+PkZJl5G00E9v8naqVmICQViRUXlB62T1W2WbInFb1boBMnsTBsdPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAu6irp7v+fxrd8gveebhEvkfkKzguA4v1weEOsoW98=;
 b=VqrpazdcFufs1MeGcHXMae6J54CZYHFEuRIKtok/bczKhvVYLnHTcoODReVVIJBB8GMCGyYBfdmk4bS7g+6jhc/klRzYlj/z2clXP80AjjpnCZp0IRmrWLQa+hGRrU3oaZV71kX/ThlfQtAbBp8zw0hTIxgd8zl4uYVa67l5Kp7kNzI72YPya5NK+OQLsoicsY23CKcN5+V28kfQPLV1wNZ9EEu+tVDN5R7kQQ+0n1AJZa+KAS8+eia0uw6aR1eADwniLbIpggdIoQdyE6WfeFacSo6IuhpYGdnP/Z8U35xRlNsqkh8xmJbp2HuqYaxu1t5NQV9O72F/CX6QXQwmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAu6irp7v+fxrd8gveebhEvkfkKzguA4v1weEOsoW98=;
 b=XyS0n83kIGQ2LzvP3BwlSW34ApwWN0LPmp8iGuOb2Cor/bwOFWW60xw4TOVSdTjv7uCGdZ9hdj890nGh+5RsspoHwtg8+rT9GWCbfayu0K7bkAaYPUQ7kyCTqQhYb0O3MRbf6UqreS3NlLVWw2+OE7+sfGfV+NyKeH/EvlWOg0U=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: RE: [PATCH] VMX: use a single, global APIC access page
Thread-Topic: [PATCH] VMX: use a single, global APIC access page
Thread-Index: AQHW/8yZa97+qDgbIE6iwG3wuPN9papSpOiAgAAfJYCAAAsJgIAAAbyAgAASBACAG55hYA==
Date: Mon, 1 Mar 2021 02:18:24 +0000
Message-ID: <MWHPR11MB1886E452B181ACA872B7C6878C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
 <YCUSDSYpS5X+AZco@Air-de-Roger>
 <547b40f2-3b7b-10cb-30f6-9445c784eb0b@suse.com>
 <YCUiniCn+oT9CFwC@Air-de-Roger>
In-Reply-To: <YCUiniCn+oT9CFwC@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5c9546e-88dd-4aa3-5726-08d8dc584b31
x-ms-traffictypediagnostic: CO1PR11MB5091:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB5091190FC543B26593CDEC398C9A9@CO1PR11MB5091.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s05eae9jpGQRN2kiVANFbV5O7OCYlRX+kNqyQuNpMudGRS5zN8DXp4xpbFSZmyEnaKkPM9aF83UpHlklw7YGGGFJzi84R36moz/7T4gFIvfHALlsiS/yVDXj61Dh1FNE5YDNBbzOKBfV243CdJsMAAu9i11kRnRaKWN+adxWelvV6V2pkBYO9a6AUyhbebvYq5RBaDxh97nZ34Pni6L5vS3cQFKeDMwaJx1rH7T1iWKGu5gR9jwFg+X9v2QU7o6OV/EUMKe6Lrbtziz1vw/Z4xTiPaRUkOpyADe/MlNLzL3fvBFfiH9ndmyXNzSh766X7U7wo44a8vHeltfLU7HdvCS0DM4O+iicBAZPMCCFi3g68kZYSYiSyrLmmXUFoFIvdrPaFY7AErZARh0dg32V9ydXu3KQ9rgSt5H1fRUyWGuM1/RBLgLPAyp1AT91H/S7/wUPn6ykgn4g5LcPnLQed5iaO5Jp1HHI+iB5tmRhoFlovU/RQMJvCQLUhxzCHOnbDbxRlAc4LTPU5Rkoq3DQXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(136003)(396003)(346002)(366004)(8936002)(54906003)(71200400001)(55016002)(5660300002)(8676002)(52536014)(86362001)(83380400001)(9686003)(186003)(4326008)(2906002)(316002)(478600001)(26005)(64756008)(53546011)(66446008)(7696005)(66946007)(66556008)(66476007)(76116006)(33656002)(6506007)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dnk3dG9meVFRcDF4MFBFMFYrTWs4UXMxQUhITXlHOUcvbVJlZC9YYXQ0Undq?=
 =?utf-8?B?c3c3Z1Jvb3NLTzFPL0V1K2JFYXRZYjZuZGtQOGdqRzBBT1BwMlExNTZUditj?=
 =?utf-8?B?M2x4Q2Jja1RtSzdEMGtMekdwa0FKWUM3N1E0cEFROUpxM1VLcW05TzVwdDFt?=
 =?utf-8?B?dzdtNXlqVFdKdURaKzdiNDFmZWdiRS84ejhrZ1p1Tk03dFBPSHl0bnEyL2oz?=
 =?utf-8?B?bTZpVGN5RzhFMmpSMm11dmMxNTIvQmtTSEg1cjEwbWhvRjgyYmFBTWRxTEZ3?=
 =?utf-8?B?QTVySkdWQ0pnYXBnNU1yUDN6LzAyMUlZSXJJNEVUaGtKbTg4TnRocGV1Zlpj?=
 =?utf-8?B?N2tvM0tsUXZZK0FHajU3NHBxd3Mvb3VTOXZkOFdZS3k0eG1PWllUYU5RWC9I?=
 =?utf-8?B?azBpcXlYSGFxcUo3NUhuVHpPMDk3eElOV0haRnVGYzE5Sys0NmJhY0c4c0Zl?=
 =?utf-8?B?N1ljQStTSDVLa3liNzBJTS90SnlXYlBUN0FFYVdoVzRGakYwam1GSjlFM3Er?=
 =?utf-8?B?VW9QZWxsQnRocW13dUJWbVdxbEFGREUxQzZSaWRqV3JJUkJZUHo1bEwydjEz?=
 =?utf-8?B?VklZVXdkM2tLeFFTdUlIWHdkeEc3WjQ2a2VNUGVwNjBtRjdNYzBqNU5LTENF?=
 =?utf-8?B?Zm9zWlpjdVJaL2l1c1h6U2JNelZKdHQvRFNVQkZydlZVQU9sa2J0LzRoc2g1?=
 =?utf-8?B?c3VqZXVUaU1ZdHJhZFRkNVl3ZVhTMjl4N1Y5Y0hTaGs5WGpQdUJvakEyQWxZ?=
 =?utf-8?B?RFIrQkMwZ3lOTllTcnRxS1luNUhSd3pjZDFtY2RWNUlQVFViYXc2YWpUUUtl?=
 =?utf-8?B?WU5iQ1lpTFJaRDJmNVA0Uk14S0cwMTEvWEVoVjU0c0RjVGNyRkdpakZiR0tN?=
 =?utf-8?B?ZG4yYTVtd0pOUG5aVDNBeCtEWHAwOVJFZi9XbmRyYzE4WndrQkVYQ1J5R0F5?=
 =?utf-8?B?VmU5TkhqN2ZLdENXS3ZzRDJOVkNzUzREY0phNlhHZkdnbUlLcm5OaEdXRFE0?=
 =?utf-8?B?OEVoV1ZzRjFqejJCL2VBTy9FdG5oak1nMHNxYTR1MlNLbE9QL081eU9ZcmlM?=
 =?utf-8?B?M05meEhxWnkvblhZT2xiKzZDUXNTN0orbUpiaGhrVk5hRW5QN3ZpcFFVWk95?=
 =?utf-8?B?VjJHRmV4Ti9FZmVGeFVnOU9yRW5WTzkvbm9aUnVwR0tlaXVQMWhkNlhzbGts?=
 =?utf-8?B?RlRvSHUwdjBxTFRZOHM4WTdnN2tSRHdmaERlWGQ4RzE5M20ra2VSemZqQWcw?=
 =?utf-8?B?T0NENXFkd1kxMWEzaE5JUlp1a2h6dWRnNm5vTDdKK01jMCtHREdSMXFkMThS?=
 =?utf-8?B?Mkczc09mMUcydWZuTkRSNVFwdTdzRFd4WU8yZjRWRjYvWFowU1krdzVheWti?=
 =?utf-8?B?ejhveGI2d1pTTmlvSE5PSkRsSTVWL2s5WWo4dkxDM2VtTnB4RGdaZi9NTkN0?=
 =?utf-8?B?ZG9aTkhRUzlvOWY2R2dPSmlKeG9pRlR6RGVFQnNUOExZc0RzZFVBeE94T2tx?=
 =?utf-8?B?c2Z2VlMxd3BodFI0eDMvaFJXZUxUdnFtZXliY2RqVnQ2TFhrMG1zblZGZ2JT?=
 =?utf-8?B?d05JYTBFWEpucUVYWFJSOSt1U0VvRWVodDhBbnVybnVWemZJU2l5aHMveHFj?=
 =?utf-8?B?Z3VzYk54TVRsOTd5ZzlLVWJhSGZWVzRpdk5PWVE0ekp4RnpmaFp0VkhPSzE2?=
 =?utf-8?B?SGFSVTJaallWa0w3OWtmcWhVUTJoSkpQQjRKTE9vK2lkL3NDSWhHMWNsOXBR?=
 =?utf-8?Q?y49o12AZIbENJL2uZVakfuXyosa5jLJ1oKedIvC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c9546e-88dd-4aa3-5726-08d8dc584b31
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 02:18:24.8653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqDNa852+T7QxTHZbeTfmbso8gp7LWfcWYiUcK5+ZP8JkgxDfgugSubdKpLVbwerbVfYkV3WpBF7R4SreIEtrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIEZlYnJ1YXJ5IDExLCAyMDIxIDg6MjcgUE0NCj4gDQo+IE9uIFRodSwgRmViIDEx
LCAyMDIxIGF0IDEyOjIyOjQxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDEx
LjAyLjIwMjEgMTI6MTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEZl
YiAxMSwgMjAyMSBhdCAxMTozNjo1OUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiA+
PiBPbiAxMS4wMi4yMDIxIDA5OjQ1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiA+ID4+PiBP
biBXZWQsIEZlYiAxMCwgMjAyMSBhdCAwNTo0ODoyNlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToNCj4gPiA+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCj4gPiA+Pj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCj4gPiA+Pj4+IEBAIC05MzUsNiArOTM1LDkg
QEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgcDJtX2dldF9pb21tdQ0KPiA+ID4+Pj4gICAg
ICAgICAgZmxhZ3MgPSBJT01NVUZfcmVhZGFibGU7DQo+ID4gPj4+PiAgICAgICAgICBpZiAoICFy
YW5nZXNldF9jb250YWluc19zaW5nbGV0b24obW1pb19yb19yYW5nZXMsIG1mbl94KG1mbikpICkN
Cj4gPiA+Pj4+ICAgICAgICAgICAgICBmbGFncyB8PSBJT01NVUZfd3JpdGFibGU7DQo+ID4gPj4+
PiArICAgICAgICAvKiBWTVgnZXMgQVBJQyBhY2Nlc3MgcGFnZSBpcyBnbG9iYWwgYW5kIGhlbmNl
IGhhcyBubyBvd25lci4NCj4gKi8NCj4gPiA+Pj4+ICsgICAgICAgIGlmICggbWZuX3ZhbGlkKG1m
bikgJiYgIXBhZ2VfZ2V0X293bmVyKG1mbl90b19wYWdlKG1mbikpICkNCj4gPiA+Pj4+ICsgICAg
ICAgICAgICBmbGFncyA9IDA7DQo+ID4gPj4+DQo+ID4gPj4+IElzIGl0IGZpbmUgdG8gaGF2ZSB0
aGlzIHBhZ2UgYWNjZXNzaWJsZSB0byBkZXZpY2VzIGlmIHRoZSBwYWdlIHRhYmxlcw0KPiA+ID4+
PiBhcmUgc2hhcmVkIGJldHdlZW4gdGhlIENQVSBhbmQgdGhlIElPTU1VPw0KPiA+ID4+DQo+ID4g
Pj4gTm8sIGl0J3Mgbm90LCBidXQgd2hhdCBkbyB5b3UgZG8/IEFzIHNhaWQgZWxzZXdoZXJlLCBk
ZXZpY2VzDQo+ID4gPj4gZ2FpbmluZyBtb3JlIGFjY2VzcyB0aGFuIGlzIGhlbHBmdWwgaXMgdGhl
IHByaWNlIHdlIHBheSBmb3INCj4gPiA+PiBiZWluZyBhYmxlIHRvIHNoYXJlIHBhZ2UgdGFibGVz
LiBCdXQgLi4uDQo+ID4gPg0KPiA+ID4gSSdtIGNvbmNlcm5lZCBhYm91dCBhbGxvd2luZyBkZXZp
Y2VzIHRvIHdyaXRlIHRvIHRoaXMgc2hhcmVkIHBhZ2UsIGFzDQo+ID4gPiBjb3VsZCBiZSB1c2Vk
IGFzIGFuIHVuaW50ZW5kZWQgd2F5IHRvIGV4Y2hhbmdlIGluZm9ybWF0aW9uIGJldHdlZW4NCj4g
PiA+IGRvbWFpbnM/DQo+ID4NCj4gPiBXZWxsLCBzdWNoIGFuIGFidXNlIHdvdWxkIGJlIHBvc3Np
YmxlLCBidXQgaXQgd291bGRuJ3QgYmUgcGFydA0KPiA+IG9mIGFuIEFCSSBhbmQgaGVuY2UgY291
bGQgYnJlYWsgYXQgYW55IHRpbWUuIFNpbWlsYXJseSBJDQo+ID4gd291bGRuJ3QgY29uc2lkZXIg
aXQgYW4gaW5mb3JtYXRpb24gbGVhayBpZiBhIGd1ZXN0IGFidXNlZA0KPiA+IHRoaXMuDQo+IA0K
PiBIbSwgSSdtIGtpbmQgb2Ygd29ycmllZCBhYm91dCBoYXZpbmcgc3VjaCBzaGFyZWQgcGFnZSBh
Y2Nlc3NpYmxlIHRvDQo+IGd1ZXN0cy4gQ291bGQgSW50ZWwgY29uZmlybSB3aGV0aGVyIHBhZ2Vz
IGluIHRoZSAweEZFRXh4eHh4IHJhbmdlIGFyZQ0KPiBhY2Nlc3NpYmxlIHRvIGRldmljZXMgaW4g
YW55IHdheSB3aGVuIHVzaW5nIElPTU1VIHNoYXJlZCBwYWdlDQo+IHRhYmxlcz8NCg0KMHhGRUV4
eHh4eCByYW5nZSBpcyBzcGVjaWFsLiBSZXF1ZXN0cyB0byB0aGlzIHJhbmdlIGFyZSBub3Qgc3Vi
amVjdCB0bw0KRE1BIHJlbWFwcGluZyAoZXZlbiBpZiBhIHZhbGlkIG1hcHBpbmcgZm9yIHRoaXMg
cmFuZ2UgZXhpc3RzIGluIHRoZSANCklPTU1VIHBhZ2UgdGFibGUpLiBBbmQgdGhpcyBzcGVjaWFs
IHRyZWF0bWVudCBpcyB0cnVlIHJlZ2FyZGxlc3Mgb2YNCndoZXRoZXIgaW50ZXJydXB0IHJlbWFw
cGluZyBpcyBlbmFibGVkICh3aGljaCBjb21lcyBvbmx5IGFmdGVyIGFuIA0KaW50ZXJydXB0IG1l
c3NhZ2UgdG8gdGhpcyByYW5nZSBpcyByZWNvZ25pemVkKS4NCg0KVGhhbmtzDQpLZXZpbg0K

