Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F983B26D7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 07:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146388.269345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHy7-0002DQ-C5; Thu, 24 Jun 2021 05:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146388.269345; Thu, 24 Jun 2021 05:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHy7-0002Ba-8q; Thu, 24 Jun 2021 05:32:03 +0000
Received: by outflank-mailman (input) for mailman id 146388;
 Thu, 24 Jun 2021 05:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXyq=LS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lwHy6-0002BU-33
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 05:32:02 +0000
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 697d7019-1779-4e11-9d5d-75c00d0c37d0;
 Thu, 24 Jun 2021 05:32:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 22:32:00 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2021 22:32:00 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 22:31:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 22:31:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 22:31:58 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 05:31:55 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4242.024; Thu, 24 Jun
 2021 05:31:55 +0000
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
X-Inumbo-ID: 697d7019-1779-4e11-9d5d-75c00d0c37d0
IronPort-SDR: DuZpDOoSbiW2FTecW7idsJCL04fUPoFSwcWN6V9HxF24ggWGMy1J4tSdFiTpHrIpNDfOTaXr8e
 8kVWN18Pd+sA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="187780309"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="187780309"
IronPort-SDR: Lj5Fg4CvjkAFXz0aMGoM+06KB+SPkoTvIarg1K75N3yr3mKluEkusAOp3BuBBYSKu1aLr7ttCk
 SXxfY3oq0SrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="490986794"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4ynksWP83zvP8z/f5T+XZ+i9bRdLtd2GLawQ4xhAD6UcDQHJIv65VD25jFhKhK9+xa//GmUfSkcBoWrkUVbLY1RVJpXPsF7VnqDQBCSMKuwltqzsoilMPvlq2JNdc4uMjSYHh4wP8NQnT+EZLjThNLBQdB4iOBKiQNpBadeHLztp7KAtQdQqjRqZosN7+EYZ+O2eOUpslzsgFu+yu7mHe2zxEqE9c6+7w/G/TCzLJU4FGTqOKdJN3GlFg6b5/G9ebiQtXRYVNK5lS5+1ntVdzDG1SVo1AF2tKrj3qfqAO91nbepKtrsN/zSwm+0l7FZbfoy/ICwyNbJsJIYtHvPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw0NNNPf+YdLoMRpj5oeIHakIeM8LzpNM2Bz7Honjfo=;
 b=DGBVUu+XbVhyS7AockZ2hyepdV8zjsBx1f354KgxTJbpk2jcEnrJ0N9gUN8jFebrbq1DKE1prdugpTneMXJkxusd//HYAGUPxLu5ImPm/0FjcD7Low3Z6V0eFupeb41/HAMgwoTUeoeIPQBWDf/kv0qL6wti5TiPu15VF0XHr6/mTCsnRgUIaGtdxY1vMjRbnwGgKnrh+OU6YwG5anFLuVdWjQSYuaHmv0uGQRz3P0BVR7QOD44ug48Z/wyJRtUkWUOE94k2RAMbJXX3EGGJ9Uwvmo6q7Bk6Hd/Ry9GHLThJ6ahMvXdHN2ttSHa/8H4mMeYY/DlwCIQa/8RJSU4rvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw0NNNPf+YdLoMRpj5oeIHakIeM8LzpNM2Bz7Honjfo=;
 b=XsDYKLU5OxfHCWG83KW0esbLLv7baGBLeJTPWuMNEM/5SevmLwja4bhbjG38BO4/cUtlwaN9xFNhd+LyenVgQ22QKpPGBmVQPZu7hPTBXKoO1CmGFEiry2Hf30BquyiztZMMC5/sR8UwWaZ3oV9iNbsdeGznGGwV30mF15y1YWg=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH 7/9] VT-d: centralize mapping of QI entries
Thread-Topic: [PATCH 7/9] VT-d: centralize mapping of QI entries
Thread-Index: AQHXXRH9xEyZTXpMY0a5atXgjiDN6KsiujIA
Date: Thu, 24 Jun 2021 05:31:55 +0000
Message-ID: <MWHPR11MB18865ECDDB47B086ECC377A38C079@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <b1aba243-e05e-1f50-d85d-00f60703b62b@suse.com>
In-Reply-To: <b1aba243-e05e-1f50-d85d-00f60703b62b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.142.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b661298a-2e1b-44cd-9065-08d936d160eb
x-ms-traffictypediagnostic: CO1PR11MB4833:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB4833AC65C84824AC29B053BE8C079@CO1PR11MB4833.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 31kIvxi/bDRu9enT2rKY6jxeEEYz7R3FfbVEFmHxDTkfe10VhqVMwd7tOxIBG3/bim7/0H5YRHDJtrtG+ealeq6ZObbXjjlzCTu3Fr+F3Y6brERQcb3yovdDcgNj3HZ08f7yp+bh7wTvbW2rWFu03BXISDs51DXAJMldHLaT80j4cwgvx5MCy0bjVZ3dOP2RgAUeBwBGXKuAfY+4ebpPy8aanLiCcXQh/ykaDN9cZO7FaygtvKvwcD3VU7aUbe5oClLT14VDB4W6zsmLuHdaxEvmrRZqNXvkEnxPRnTO25Og53ga33vAKnF1hUfGBbiybH8Fyp6+lFVDGWUGRWLAYFKla6o2eW4zStMK5N/cQ7GzYfSElEz10+j8YbckZL212IL1tA4D6uCxiXqATsk85TSMgmSVlTA+9sIYV0nqVyQHxrJkbr6JA1heyApFM2baV61GkwNzGOnR6BouUGlbTbGT+dzx4NG6UHVhxuJkzHhEvK3mEgEeuUdIocKeN9xVkaCmRQfVXTc54KfiFrXBOe9f/q2r40ziwTV200dfvc7Qf99o2BAzLrCWMyGuFB92XOzfYd+zQRZRGvWUA/JhOnVZxuekhnQpwMGbMsEOUyg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(39860400002)(136003)(86362001)(52536014)(38100700002)(5660300002)(122000001)(316002)(9686003)(8676002)(26005)(55016002)(33656002)(6506007)(7696005)(4326008)(186003)(71200400001)(2906002)(8936002)(76116006)(66946007)(66556008)(54906003)(478600001)(64756008)(66446008)(66476007)(110136005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUZhM0N2cy9nNzEzS1ZaTWJLNUd2M3JFalg5bWJZQnEzU1hickdzWTFrQUI1?=
 =?utf-8?B?bDd4Z2MrWnFDeVAzai90SnQzYlc4Ynd3UDQ0cUJGT3dmb1hxU1pHbmpxQ2l3?=
 =?utf-8?B?elhEaE5hdTY3NDR6cmhKOVVPRUQyRDBsbWdzZSsycWg1UExLcnBQR1pHVGdv?=
 =?utf-8?B?cDVOSUR1NkNZTENnb1Y4VVh2NVB1NUxPN3k3VXNQMDVuVFltam1lZXhlZ2JW?=
 =?utf-8?B?UkZwN3RpVndRTWxyN0J5MnpFeWRIYXZYbDVkU0FtU2gzSDlSNlhGMW02YzJC?=
 =?utf-8?B?SEdXZXlaTStHNHdTWFFJczRiclRhbGNsMnpQbStpZTd1Q3dGRlpxMk4zVDJG?=
 =?utf-8?B?TndldHZ1bC9Va1N1UlpGNklLaU1nbEZDUWZGaTVxSWRzWFVUZ3pSWGtTSXMw?=
 =?utf-8?B?K0N5akZDelVnd3RYcFprM09nQ211VTlpT1p2aXlKZFg3eWR4alNZWjRxV2dz?=
 =?utf-8?B?WFd0N3ArWWJscW53S3dVVUhBYVpNbVpLWVFLcmlscUlQOVdJRnRITHRvT0du?=
 =?utf-8?B?MVNxQkNEQkd6Y1AzWGdHS3d0SGNSTEttbmNxRjB2aXdsSGRkZ29LaGRVSDZS?=
 =?utf-8?B?c0FUS0JTNHhObVJWVWFhMndrNkhYM3ZHdWJHcXk5V3BWMTdSaGlEUUJDR2Ry?=
 =?utf-8?B?UGxJcDdKQXphY00rZUlXaHptWHRFVEJ6RTZjRmM2VmV0ekpSZHMzMVRKMnli?=
 =?utf-8?B?azlZd1ZtTlAvejJncVdJRnBrbnRFTUYrcGxEOE1xWGoraVRpTEVFOUJhbUlo?=
 =?utf-8?B?Rk1ud3AzN2hOVkFxTTNaOURMQytWZUFIRnNGSHVFMHBYbW0wQmJXdEMwM3oy?=
 =?utf-8?B?Vm01Zys3a1hpV2tRWG1oek1vV0VJYXlwdG83UEpLazRwL3NYTE9qNEhWODV5?=
 =?utf-8?B?elZBc1h2QmIrM1BkOXVCb0VYYjBsNHRlM3hJWVFxSkJxMTV1MTE3OEwxNDli?=
 =?utf-8?B?MjJqUzlodnhNbGhnL2p4UkY3TSs4Y1hManZVaE1MeFpDc0VrMlJzU3UwZC8z?=
 =?utf-8?B?bktvV1lhUFJsOS9qNXNXR01XeDZxaXNtUUhGK0xhclBCaUVSMXMwL3BQMHB2?=
 =?utf-8?B?V3pGZUdwKzYyTktsTTQxcTlLQllIZVJOWlpvdVU5VHVEN004UGc4bUlVWGpS?=
 =?utf-8?B?RTBQcWgvQzhCWnE0WXZnT0QvNWNaMGhQVVk3MmNjcjJpZTUrNXVsSmtOdkNh?=
 =?utf-8?B?L1lpMStyVjlDajFENHJjVm50MmJUaFU2K2MzYlpmcXhvTlYwTE01R1A2eVN6?=
 =?utf-8?B?KzlXNEI4TER4R3NmTjgvTVkzQ0V5RGhWbGlaMWRTNUx2Q0FZMW1RazJLOVUx?=
 =?utf-8?B?alkwdThQcnBiVWZDWHRKMjNPeHF2cVZEdTlIK0hadnhTQWpjbmpxNHdaT2hJ?=
 =?utf-8?B?ZDVlZzdENS94d2E4cUpmTjh0bUM4QkdBc0YwMVJDL3FwYytWb1Z0dXRsL0dV?=
 =?utf-8?B?Qk5VWUxEV3YzZThWMWxYZHg0ZTJWNzlyQ2FYVXJvVXlCL0hXdms4ZkxKZk5Y?=
 =?utf-8?B?QWZKUlZSZDFUUGtuVGQzSXlYYWd4R2pCT0sxZGhHejl6L0dKK2owMUxSWlZ1?=
 =?utf-8?B?STBwWkgvQ3ZYR0haUTdyaDZOMjExR2EyMytNYklnM0swWVJNOGZsYXk3OGtT?=
 =?utf-8?B?VkFsOUlPVmg5RVYyQXdydW1INHNseUFCVmlRUVpMQnR3TFQ3K1BNLzU3Z3VI?=
 =?utf-8?B?d05sK2dKcnl2b3lCMk40aFdFVHNpSzBOK0s0d21UMU4zeTR6VlNFamhkNitU?=
 =?utf-8?Q?q6DnT5jzZD+Hc3dCx5TmLewrEB6fxAvvugi/guS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b661298a-2e1b-44cd-9065-08d936d160eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:31:55.0661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGs7vr0Agth6yMPFyDv2IymIqthNOhXa+0WzN4QVe8dzEnfL6Ftw3SbfO1eC663K7BCbCCJTXdpoP39XMsLFJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVuZSA5LCAyMDIxIDU6MzAgUE0NCj4gDQo+IEludHJvZHVjZSBhIGhlbHBlciBmdW5jdGlv
biB0byByZWR1Y2UgcmVkdW5kYW5jeS4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkNCj4gdG8gZXhwcmVz
cyB0aGUgbG9naWMgd2l0aG91dCB1c2luZyB0aGUgc29tZXdoYXQgb2RkIFFJTlZBTF9FTlRSWV9P
UkRFUi4NCj4gQWxzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byB1bmlmb3JtbHkgdW5tYXAgYWZ0
ZXIgdXBkYXRpbmcgcXVldWUgdGFpbA0KPiBhbmQgZHJvcHBpbmcgdGhlIGxvY2sgKGxpa2Ugd2Fz
IGRvbmUgc28gZmFyIG9ubHkgYnkNCj4gcXVldWVfaW52YWxpZGF0ZV9jb250ZXh0X3N5bmMoKSku
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoN
ClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiAtLS0N
Cj4gSSB3b25kZXIgdGhvdWdoIHdoZXRoZXIgd2Ugd291bGRuJ3QgYmUgYmV0dGVyIG9mZiBwZXJt
YW5lbnRseSBtYXBwaW5nDQo+IHRoZSBxdWV1ZShzKS4NCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC92dGQvcWludmFsLmMNCj4gQEAgLTY5LDYgKzY5LDE2IEBAIHN0YXRpYyB2b2lkIHFpbnZhbF91
cGRhdGVfcXRhaWwoc3RydWN0IHYNCj4gICAgICBkbWFyX3dyaXRlbChpb21tdS0+cmVnLCBETUFS
X0lRVF9SRUcsIHZhbCA8PCBRSU5WQUxfSU5ERVhfU0hJRlQpOw0KPiAgfQ0KPiANCj4gK3N0YXRp
YyBzdHJ1Y3QgcWludmFsX2VudHJ5ICpxaV9tYXBfZW50cnkoY29uc3Qgc3RydWN0IHZ0ZF9pb21t
dSAqaW9tbXUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBpbmRleCkNCj4gK3sNCj4gKyAgICBwYWRkcl90IGJhc2UgPSBpb21tdS0+cWlu
dmFsX21hZGRyICsNCj4gKyAgICAgICAgICAgICAgICAgICAoKGluZGV4ICogc2l6ZW9mKHN0cnVj
dCBxaW52YWxfZW50cnkpKSAmIFBBR0VfTUFTSyk7DQo+ICsgICAgc3RydWN0IHFpbnZhbF9lbnRy
eSAqZW50cmllcyA9IG1hcF92dGRfZG9tYWluX3BhZ2UoYmFzZSk7DQo+ICsNCj4gKyAgICByZXR1
cm4gJmVudHJpZXNbaW5kZXggJSAoUEFHRV9TSVpFIC8gc2l6ZW9mKCplbnRyaWVzKSldOw0KPiAr
fQ0KPiArDQo+ICBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBxdWV1ZV9pbnZhbGlkYXRlX2NvbnRl
eHRfc3luYyhzdHJ1Y3QgdnRkX2lvbW11DQo+ICppb21tdSwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiBkaWQsIHUxNiBzb3VyY2Vf
aWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1OCBmdW5jdGlvbl9tYXNrLA0KPiBAQCAtNzYsMTUgKzg2LDExIEBAIHN0YXRpYyBpbnQg
X19tdXN0X2NoZWNrIHF1ZXVlX2ludmFsaWRhdGUNCj4gIHsNCj4gICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOw0KPiAgICAgIHVuc2lnbmVkIGludCBpbmRleDsNCj4gLSAgICB1NjQgZW50cnlfYmFz
ZTsNCj4gLSAgICBzdHJ1Y3QgcWludmFsX2VudHJ5ICpxaW52YWxfZW50cnksICpxaW52YWxfZW50
cmllczsNCj4gKyAgICBzdHJ1Y3QgcWludmFsX2VudHJ5ICpxaW52YWxfZW50cnk7DQo+IA0KPiAg
ICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9jaywgZmxhZ3MpOw0KPiAg
ICAgIGluZGV4ID0gcWludmFsX25leHRfaW5kZXgoaW9tbXUpOw0KPiAtICAgIGVudHJ5X2Jhc2Ug
PSBpb21tdS0+cWludmFsX21hZGRyICsNCj4gLSAgICAgICAgICAgICAgICAgKChpbmRleCA+PiBR
SU5WQUxfRU5UUllfT1JERVIpIDw8IFBBR0VfU0hJRlQpOw0KPiAtICAgIHFpbnZhbF9lbnRyaWVz
ID0gbWFwX3Z0ZF9kb21haW5fcGFnZShlbnRyeV9iYXNlKTsNCj4gLSAgICBxaW52YWxfZW50cnkg
PSAmcWludmFsX2VudHJpZXNbaW5kZXggJSAoMSA8PCBRSU5WQUxfRU5UUllfT1JERVIpXTsNCj4g
KyAgICBxaW52YWxfZW50cnkgPSBxaV9tYXBfZW50cnkoaW9tbXUsIGluZGV4KTsNCj4gDQo+ICAg
ICAgcWludmFsX2VudHJ5LT5xLmNjX2ludl9kc2MubG8udHlwZSA9IFRZUEVfSU5WQUxfQ09OVEVY
VDsNCj4gICAgICBxaW52YWxfZW50cnktPnEuY2NfaW52X2RzYy5sby5ncmFudSA9IGdyYW51Ow0K
PiBAQCAtOTgsNyArMTA0LDcgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgcXVldWVfaW52YWxp
ZGF0ZQ0KPiAgICAgIHFpbnZhbF91cGRhdGVfcXRhaWwoaW9tbXUsIGluZGV4KTsNCj4gICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+cmVnaXN0ZXJfbG9jaywgZmxhZ3MpOw0KPiAN
Cj4gLSAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2UocWludmFsX2VudHJpZXMpOw0KPiArICAgIHVu
bWFwX3Z0ZF9kb21haW5fcGFnZShxaW52YWxfZW50cnkpOw0KPiANCj4gICAgICByZXR1cm4gaW52
YWxpZGF0ZV9zeW5jKGlvbW11KTsNCj4gIH0NCj4gQEAgLTExMCwxNSArMTE2LDExIEBAIHN0YXRp
YyBpbnQgX19tdXN0X2NoZWNrIHF1ZXVlX2ludmFsaWRhdGUNCj4gIHsNCj4gICAgICB1bnNpZ25l
ZCBsb25nIGZsYWdzOw0KPiAgICAgIHVuc2lnbmVkIGludCBpbmRleDsNCj4gLSAgICB1NjQgZW50
cnlfYmFzZTsNCj4gLSAgICBzdHJ1Y3QgcWludmFsX2VudHJ5ICpxaW52YWxfZW50cnksICpxaW52
YWxfZW50cmllczsNCj4gKyAgICBzdHJ1Y3QgcWludmFsX2VudHJ5ICpxaW52YWxfZW50cnk7DQo+
IA0KPiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9jaywgZmxhZ3Mp
Ow0KPiAgICAgIGluZGV4ID0gcWludmFsX25leHRfaW5kZXgoaW9tbXUpOw0KPiAtICAgIGVudHJ5
X2Jhc2UgPSBpb21tdS0+cWludmFsX21hZGRyICsNCj4gLSAgICAgICAgICAgICAgICAgKChpbmRl
eCA+PiBRSU5WQUxfRU5UUllfT1JERVIpIDw8IFBBR0VfU0hJRlQpOw0KPiAtICAgIHFpbnZhbF9l
bnRyaWVzID0gbWFwX3Z0ZF9kb21haW5fcGFnZShlbnRyeV9iYXNlKTsNCj4gLSAgICBxaW52YWxf
ZW50cnkgPSAmcWludmFsX2VudHJpZXNbaW5kZXggJSAoMSA8PCBRSU5WQUxfRU5UUllfT1JERVIp
XTsNCj4gKyAgICBxaW52YWxfZW50cnkgPSBxaV9tYXBfZW50cnkoaW9tbXUsIGluZGV4KTsNCj4g
DQo+ICAgICAgcWludmFsX2VudHJ5LT5xLmlvdGxiX2ludl9kc2MubG8udHlwZSA9IFRZUEVfSU5W
QUxfSU9UTEI7DQo+ICAgICAgcWludmFsX2VudHJ5LT5xLmlvdGxiX2ludl9kc2MubG8uZ3JhbnUg
PSBncmFudTsNCj4gQEAgLTEzMywxMCArMTM1LDExIEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNr
IHF1ZXVlX2ludmFsaWRhdGUNCj4gICAgICBxaW52YWxfZW50cnktPnEuaW90bGJfaW52X2RzYy5o
aS5yZXNfMSA9IDA7DQo+ICAgICAgcWludmFsX2VudHJ5LT5xLmlvdGxiX2ludl9kc2MuaGkuYWRk
ciA9IGFkZHIgPj4gUEFHRV9TSElGVF80SzsNCj4gDQo+IC0gICAgdW5tYXBfdnRkX2RvbWFpbl9w
YWdlKHFpbnZhbF9lbnRyaWVzKTsNCj4gICAgICBxaW52YWxfdXBkYXRlX3F0YWlsKGlvbW11LCBp
bmRleCk7DQo+ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPnJlZ2lzdGVyX2xv
Y2ssIGZsYWdzKTsNCj4gDQo+ICsgICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdlKHFpbnZhbF9lbnRy
eSk7DQo+ICsNCj4gICAgICByZXR1cm4gaW52YWxpZGF0ZV9zeW5jKGlvbW11KTsNCj4gIH0NCj4g
DQo+IEBAIC0xNDcsMTcgKzE1MCwxMyBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBxdWV1ZV9p
bnZhbGlkYXRlDQo+ICAgICAgc3RhdGljIERFRklORV9QRVJfQ1BVKHVpbnQzMl90LCBwb2xsX3Ns
b3QpOw0KPiAgICAgIHVuc2lnbmVkIGludCBpbmRleDsNCj4gICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzOw0KPiAtICAgIHU2NCBlbnRyeV9iYXNlOw0KPiAtICAgIHN0cnVjdCBxaW52YWxfZW50cnkg
KnFpbnZhbF9lbnRyeSwgKnFpbnZhbF9lbnRyaWVzOw0KPiArICAgIHN0cnVjdCBxaW52YWxfZW50
cnkgKnFpbnZhbF9lbnRyeTsNCj4gICAgICB1aW50MzJfdCAqdGhpc19wb2xsX3Nsb3QgPSAmdGhp
c19jcHUocG9sbF9zbG90KTsNCj4gDQo+ICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmlvbW11LT5y
ZWdpc3Rlcl9sb2NrLCBmbGFncyk7DQo+ICAgICAgQUNDRVNTX09OQ0UoKnRoaXNfcG9sbF9zbG90
KSA9IFFJTlZBTF9TVEFUX0lOSVQ7DQo+ICAgICAgaW5kZXggPSBxaW52YWxfbmV4dF9pbmRleChp
b21tdSk7DQo+IC0gICAgZW50cnlfYmFzZSA9IGlvbW11LT5xaW52YWxfbWFkZHIgKw0KPiAtICAg
ICAgICAgICAgICAgICAoKGluZGV4ID4+IFFJTlZBTF9FTlRSWV9PUkRFUikgPDwgUEFHRV9TSElG
VCk7DQo+IC0gICAgcWludmFsX2VudHJpZXMgPSBtYXBfdnRkX2RvbWFpbl9wYWdlKGVudHJ5X2Jh
c2UpOw0KPiAtICAgIHFpbnZhbF9lbnRyeSA9ICZxaW52YWxfZW50cmllc1tpbmRleCAlICgxIDw8
IFFJTlZBTF9FTlRSWV9PUkRFUildOw0KPiArICAgIHFpbnZhbF9lbnRyeSA9IHFpX21hcF9lbnRy
eShpb21tdSwgaW5kZXgpOw0KPiANCj4gICAgICBxaW52YWxfZW50cnktPnEuaW52X3dhaXRfZHNj
LmxvLnR5cGUgPSBUWVBFX0lOVkFMX1dBSVQ7DQo+ICAgICAgcWludmFsX2VudHJ5LT5xLmludl93
YWl0X2RzYy5sby5pZmxhZyA9IGlmbGFnOw0KPiBAQCAtMTY3LDEwICsxNjYsMTEgQEAgc3RhdGlj
IGludCBfX211c3RfY2hlY2sgcXVldWVfaW52YWxpZGF0ZQ0KPiAgICAgIHFpbnZhbF9lbnRyeS0+
cS5pbnZfd2FpdF9kc2MubG8uc2RhdGEgPSBRSU5WQUxfU1RBVF9ET05FOw0KPiAgICAgIHFpbnZh
bF9lbnRyeS0+cS5pbnZfd2FpdF9kc2MuaGkuc2FkZHIgPSB2aXJ0X3RvX21hZGRyKHRoaXNfcG9s
bF9zbG90KTsNCj4gDQo+IC0gICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdlKHFpbnZhbF9lbnRyaWVz
KTsNCj4gICAgICBxaW52YWxfdXBkYXRlX3F0YWlsKGlvbW11LCBpbmRleCk7DQo+ICAgICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPnJlZ2lzdGVyX2xvY2ssIGZsYWdzKTsNCj4gDQo+
ICsgICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdlKHFpbnZhbF9lbnRyeSk7DQo+ICsNCj4gICAgICAv
KiBOb3cgd2UgZG9uJ3Qgc3VwcG9ydCBpbnRlcnJ1cHQgbWV0aG9kICovDQo+ICAgICAgaWYgKCBz
dyApDQo+ICAgICAgew0KPiBAQCAtMjQ2LDE2ICsyNDYsMTIgQEAgaW50IHFpbnZhbF9kZXZpY2Vf
aW90bGJfc3luYyhzdHJ1Y3QgdnRkXw0KPiAgew0KPiAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7
DQo+ICAgICAgdW5zaWduZWQgaW50IGluZGV4Ow0KPiAtICAgIHU2NCBlbnRyeV9iYXNlOw0KPiAt
ICAgIHN0cnVjdCBxaW52YWxfZW50cnkgKnFpbnZhbF9lbnRyeSwgKnFpbnZhbF9lbnRyaWVzOw0K
PiArICAgIHN0cnVjdCBxaW52YWxfZW50cnkgKnFpbnZhbF9lbnRyeTsNCj4gDQo+ICAgICAgQVNT
RVJUKHBkZXYpOw0KPiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9j
aywgZmxhZ3MpOw0KPiAgICAgIGluZGV4ID0gcWludmFsX25leHRfaW5kZXgoaW9tbXUpOw0KPiAt
ICAgIGVudHJ5X2Jhc2UgPSBpb21tdS0+cWludmFsX21hZGRyICsNCj4gLSAgICAgICAgICAgICAg
ICAgKChpbmRleCA+PiBRSU5WQUxfRU5UUllfT1JERVIpIDw8IFBBR0VfU0hJRlQpOw0KPiAtICAg
IHFpbnZhbF9lbnRyaWVzID0gbWFwX3Z0ZF9kb21haW5fcGFnZShlbnRyeV9iYXNlKTsNCj4gLSAg
ICBxaW52YWxfZW50cnkgPSAmcWludmFsX2VudHJpZXNbaW5kZXggJSAoMSA8PCBRSU5WQUxfRU5U
UllfT1JERVIpXTsNCj4gKyAgICBxaW52YWxfZW50cnkgPSBxaV9tYXBfZW50cnkoaW9tbXUsIGlu
ZGV4KTsNCj4gDQo+ICAgICAgcWludmFsX2VudHJ5LT5xLmRldl9pb3RsYl9pbnZfZHNjLmxvLnR5
cGUgPSBUWVBFX0lOVkFMX0RFVklDRV9JT1RMQjsNCj4gICAgICBxaW52YWxfZW50cnktPnEuZGV2
X2lvdGxiX2ludl9kc2MubG8ucmVzXzEgPSAwOw0KPiBAQCAtMjY4LDEwICsyNjQsMTEgQEAgaW50
IHFpbnZhbF9kZXZpY2VfaW90bGJfc3luYyhzdHJ1Y3QgdnRkXw0KPiAgICAgIHFpbnZhbF9lbnRy
eS0+cS5kZXZfaW90bGJfaW52X2RzYy5oaS5yZXNfMSA9IDA7DQo+ICAgICAgcWludmFsX2VudHJ5
LT5xLmRldl9pb3RsYl9pbnZfZHNjLmhpLmFkZHIgPSBhZGRyID4+IFBBR0VfU0hJRlRfNEs7DQo+
IA0KPiAtICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShxaW52YWxfZW50cmllcyk7DQo+ICAgICAg
cWludmFsX3VwZGF0ZV9xdGFpbChpb21tdSwgaW5kZXgpOw0KPiAgICAgIHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmlvbW11LT5yZWdpc3Rlcl9sb2NrLCBmbGFncyk7DQo+IA0KPiArICAgIHVubWFw
X3Z0ZF9kb21haW5fcGFnZShxaW52YWxfZW50cnkpOw0KPiArDQo+ICAgICAgcmV0dXJuIGRldl9p
bnZhbGlkYXRlX3N5bmMoaW9tbXUsIHBkZXYsIGRpZCk7DQo+ICB9DQo+IA0KPiBAQCAtMjgwLDE2
ICsyNzcsMTIgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgcXVldWVfaW52YWxpZGF0ZQ0KPiAg
ew0KPiAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgICAgdW5zaWduZWQgaW50IGluZGV4
Ow0KPiAtICAgIHU2NCBlbnRyeV9iYXNlOw0KPiAtICAgIHN0cnVjdCBxaW52YWxfZW50cnkgKnFp
bnZhbF9lbnRyeSwgKnFpbnZhbF9lbnRyaWVzOw0KPiArICAgIHN0cnVjdCBxaW52YWxfZW50cnkg
KnFpbnZhbF9lbnRyeTsNCj4gICAgICBpbnQgcmV0Ow0KPiANCj4gICAgICBzcGluX2xvY2tfaXJx
c2F2ZSgmaW9tbXUtPnJlZ2lzdGVyX2xvY2ssIGZsYWdzKTsNCj4gICAgICBpbmRleCA9IHFpbnZh
bF9uZXh0X2luZGV4KGlvbW11KTsNCj4gLSAgICBlbnRyeV9iYXNlID0gaW9tbXUtPnFpbnZhbF9t
YWRkciArDQo+IC0gICAgICAgICAgICAgICAgICgoaW5kZXggPj4gUUlOVkFMX0VOVFJZX09SREVS
KSA8PCBQQUdFX1NISUZUKTsNCj4gLSAgICBxaW52YWxfZW50cmllcyA9IG1hcF92dGRfZG9tYWlu
X3BhZ2UoZW50cnlfYmFzZSk7DQo+IC0gICAgcWludmFsX2VudHJ5ID0gJnFpbnZhbF9lbnRyaWVz
W2luZGV4ICUgKDEgPDwgUUlOVkFMX0VOVFJZX09SREVSKV07DQo+ICsgICAgcWludmFsX2VudHJ5
ID0gcWlfbWFwX2VudHJ5KGlvbW11LCBpbmRleCk7DQo+IA0KPiAgICAgIHFpbnZhbF9lbnRyeS0+
cS5pZWNfaW52X2RzYy5sby50eXBlID0gVFlQRV9JTlZBTF9JRUM7DQo+ICAgICAgcWludmFsX2Vu
dHJ5LT5xLmllY19pbnZfZHNjLmxvLmdyYW51ID0gZ3JhbnU7DQo+IEBAIC0yOTksMTAgKzI5Miwx
MSBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBxdWV1ZV9pbnZhbGlkYXRlDQo+ICAgICAgcWlu
dmFsX2VudHJ5LT5xLmllY19pbnZfZHNjLmxvLnJlc18yID0gMDsNCj4gICAgICBxaW52YWxfZW50
cnktPnEuaWVjX2ludl9kc2MuaGkucmVzID0gMDsNCj4gDQo+IC0gICAgdW5tYXBfdnRkX2RvbWFp
bl9wYWdlKHFpbnZhbF9lbnRyaWVzKTsNCj4gICAgICBxaW52YWxfdXBkYXRlX3F0YWlsKGlvbW11
LCBpbmRleCk7DQo+ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPnJlZ2lzdGVy
X2xvY2ssIGZsYWdzKTsNCj4gDQo+ICsgICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdlKHFpbnZhbF9l
bnRyeSk7DQo+ICsNCj4gICAgICByZXQgPSBpbnZhbGlkYXRlX3N5bmMoaW9tbXUpOw0KPiANCj4g
ICAgICAvKg0KDQo=

