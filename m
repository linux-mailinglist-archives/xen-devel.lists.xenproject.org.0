Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF0325DEC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 08:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90094.170409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFXDE-00021d-Et; Fri, 26 Feb 2021 07:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90094.170409; Fri, 26 Feb 2021 07:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFXDE-00021C-Be; Fri, 26 Feb 2021 07:06:56 +0000
Received: by outflank-mailman (input) for mailman id 90094;
 Fri, 26 Feb 2021 07:06:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7C3z=H4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lFXDD-000217-40
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 07:06:55 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4284846-b40c-4c9c-8768-4b1dee8efdfa;
 Fri, 26 Feb 2021 07:06:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 23:06:50 -0800
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2021 23:06:48 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Feb 2021 23:06:47 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Feb 2021 23:06:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Feb 2021 23:06:46 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Feb 2021 23:06:46 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 07:06:45 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.020; Fri, 26 Feb 2021
 07:06:45 +0000
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
X-Inumbo-ID: f4284846-b40c-4c9c-8768-4b1dee8efdfa
IronPort-SDR: rAAaw3KLm8Wi1H9bgSYeYFGMrCKvCi893UQdW9ptVStxSHAaZku95s1+zgCW+2kN8uBtAHQXex
 X+gTSuIge49Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="172933295"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; 
   d="scan'208";a="172933295"
IronPort-SDR: 81yUy2mej71ymMlOwA/ufYfSwQUlAFaD+v3nn0Q7R+LFJK/OMvjdgiZownspi0f1yLVsmVPjS8
 7mPrPya04acw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; 
   d="scan'208";a="501200034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHErMpdkELMUUAO39HMOjWjIa1P9Kc4j44x4Hdj5+Fi3bTRmb11aswvJW7+Iil3suqrfrESVYeJG6hME0qMgCb3XqYoK3nI7aNkdwk2JCT1KiVtE2F3kLeuFqhT8AxUYItUk9LpT+jO7l7pFjAL8405i8X/QXTDlW1qbV0zccFkTeiMxCohPjb8duBHltl+FlbtTQ6tfFmYTzGklRE3WDbypXcN0JVoxsXuPA2kC9aTkkrDZ8CZERhmFC23BcVdsaw4EzZeg2OWPJ6SRhaZ4BYlVQnm+g2Dzk5dp1tAvWTuUpRVBttLZ/zFNzkRKsX6oWH/Wbn0sHmQM07LO3EEfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoXytlSl0K1AXeXOek857oZH2IypKcyG+OGvMWS2mww=;
 b=iFyIuH/g5ghD5Pekqn7NnajakTEdoTE8yxeVso/gD0UgSPdyPutObdEVH3NdTV9ItMZfVyZ3gOQCIbM3w6XOG/xqE7DaY8qr9JNnSUBXwFZnYW3RschUIvo08TSs2LdSfDSzBmw40rqmNC23GHfP/WqeZ0i/LCeGzbhSbdKMrdwUZh1niU8v5A2YsLlBBdji+phSN/SjE+9zkDvCCfYI4bhZz5z4JNzUqw64ZsVLTsscAvVCaC7A2D74UVr5d/1f+zw+aB5gDLHaehvdS0oORhH+Ab7PNI3uBZGyHIVVFG1sG26ldu0o357WS6zd9gP0h6xrSlrmpKP6rG7j/Me6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoXytlSl0K1AXeXOek857oZH2IypKcyG+OGvMWS2mww=;
 b=Ql8H+PXjC5ZtyPP7T6RPnT0xI+t+GanlICgUvpOYSk1WwI3yiD2kzCt6iaxA8FW2zo585Qu/P4V7CWTvJGyqJGbXmXR8/9rsSjjVef+eslLU9ApJWqTZpdzBm2K27AdmtT9dbdZVro+iSlJHBO15Wk0JnJ1pcnMS2zzIZjAGT0s=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page
Thread-Topic: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access
 page
Thread-Index: AQHXCQl5Ge7Qk928g0a5oin2oF6ik6poksSAgAF27OA=
Date: Fri, 26 Feb 2021 07:06:45 +0000
Message-ID: <MWHPR11MB1886328CDB4FDBC61EF2BF818C9D9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
 <94ac725c-ae3a-5380-aaa0-c8523074b581@suse.com>
In-Reply-To: <94ac725c-ae3a-5380-aaa0-c8523074b581@suse.com>
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
x-ms-office365-filtering-correlation-id: 9b4122cf-427f-434c-e364-08d8da251406
x-ms-traffictypediagnostic: CO1PR11MB4852:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB48522215B2B3A90013D4AFC58C9D9@CO1PR11MB4852.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfAS1+e9NvJKVoJuPHSTyj8nPKEDLoIY4P70jYRrUFd5Pz24O6HB5q0Mh1aDFO0fS6sEeDcHwuM4D5KHitvNN3CIHe80i3Y6t0MSFpUm1Yj2Jo5OR9/2WQAH4oY6lGy1i63nhEqChVM53Na0rVO3hPM9b9cKVgFcxnWpjy2IsD8Pv/SIR076E52vUp175R9nAAORExg6O0O/4CWcldcZY7axe9Bj+du/TEG/wDlP6zA8lBhketCjqR8sLepcUA6BrhMrCdBsjrOHrVQ/diaj1TsKigSUvetmPJpzMlefyOtWF/32LEGxDWjzEWKBR6TLpCihdzE9fLAOfavGVyYXbR2jPskNrkwQAEzLh85JRUS7TTw7yHm63VJlTAzzApoj/GoNyehJZo3Pm6u/r7i/UBzkJZMHWf+Vkn2mzjQInbFOVz1F+EfbIJSdh4W/0eUEmuskLSQAm8ijN9wNFi71dQ8M5Y41RVMJ1dsiS0ppIgOcKKQ2mKPf1+M3DX95Ic9ag99BNIdoQS0lH0neb682Jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(39860400002)(366004)(136003)(6506007)(53546011)(71200400001)(33656002)(110136005)(54906003)(66946007)(64756008)(66476007)(316002)(76116006)(4326008)(55016002)(9686003)(2906002)(7696005)(478600001)(66446008)(86362001)(5660300002)(52536014)(8936002)(26005)(66556008)(8676002)(4744005)(6636002)(186003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eTBxVjY3MnAvNlNkVFllVW9PS0VXdjhyaUZydjZOL29lWk8yMStNd0ZyYWo2?=
 =?utf-8?B?YVBCNXl5Wk1rU01DbVhxTUw3ZG04NWRNRnpxdW1DejNlcWlPc0R2MER5aFJt?=
 =?utf-8?B?UEtiRWVlOVNnZE90dzJCWHh4SnVyMms2VXQ0enNKR3hBcVZ6WlEwSzFTVVpv?=
 =?utf-8?B?WnFXaDdOem5uRUFlQlFBTlQ3QzJoVHVSNU1YeTBuSDM2YVNpTXNZZm05a1Aw?=
 =?utf-8?B?L3RsZ2x3RGVCUUNleHF6cWRHNUtsYkQ3UGJFSUtvWDNTbEtYbFZtOGlSbVM3?=
 =?utf-8?B?MEFXQWMwTGJvVVd3R2FzSDJEMEdsZnV1cm5UTXd6Y2hzaEtqWHlKb0VOVUV4?=
 =?utf-8?B?RE1oYXUybXREdVRNMkhFTDlVR2h6dytCbkdqUkdzMkN1eElUdzJhb3pES2o3?=
 =?utf-8?B?M2haM29aU0lMVmZMZGQyTllGbGkxZ0dscW54bG1aK1NkK3RUSWhYdnNZQnZG?=
 =?utf-8?B?cnE2bmd2VGJpYlhBM2xXSFB5VlhYWERmYWhEWnF1N3BUODdKdGVCb3MzME1v?=
 =?utf-8?B?Q3NiNGpYbEF1VldRMDJCcDFmdDg4WXNaM3NGWHd6SlY4bC9oWlVocVVXMXpa?=
 =?utf-8?B?NTlZd3E2RnVhNFg4endqdkFxM3NMTFBpdG1sQkd1ZXlWV0VvdVVNR1RYbzZq?=
 =?utf-8?B?U05zMWVPVUhJZEtnTCtIeGNJcEozVnpvUFY1Q3B4Q242U2tlKzhCakpBYUFm?=
 =?utf-8?B?bFo3TnJWU0Z6VUZKc0wvenRhQjZma0ZCRnA4SC84U1ZqVCszby90TVBkOVN6?=
 =?utf-8?B?VFdBOXJXYitrU1hxZm9ScW1hUCs2VCtJaDBRNVFlYm9sL2hKc1l2U2hVdU1x?=
 =?utf-8?B?cFkvQnlyaHhuNmM5azVEMkRCdUJWSDNhRHlRelRlKzMwZURVZi8ralhkcVNI?=
 =?utf-8?B?Q3ZpbXUxMHlZSEwybnR3d3FJUWw5b2FGU3pOblJDVHJUMEtxNkRrOGRLa0h1?=
 =?utf-8?B?MXF0UndtVyttaGNNNzVLK0NaQkJvenJyTXJyNzNibHhjUUVuRlBDRitsSFVY?=
 =?utf-8?B?dHhOMEhpWTdOUUhkNHVXbjRUbjI2MisxN3Jvd09FMkxPaHoveWF0MlhCb1dI?=
 =?utf-8?B?L1BoZW4wWTdWNXcvRjZ1SFU1RlZLSHladlRydWFpYlpPczFOanZ5bEZ5eFAz?=
 =?utf-8?B?c1lnTFM4Vks1RGltbGR6bVNxd2dXTDJqelFUZW5pcXB2ZTRlK2NscmpNVExZ?=
 =?utf-8?B?US9RVXdOeVU5RzAwUTZLVnMxdUZ5bHB5RkYxTUpzeDVMRGR0VmdWWmVDZmx4?=
 =?utf-8?B?SVgyZjEzYzFnanRwWHV2NlhYZ3BDSzhRTkI5cHl2TEN1VERkYU1lYlRUOVJk?=
 =?utf-8?B?M2lkdW5ud2lmWS90ZXE5c0xyTyswNGZzbDZqREZuRFJFMEZOMHhnTmJRalJs?=
 =?utf-8?B?WElraC9hOVluaVdpUjdsa2J4N09wTzd3WTNwRDY1Yk9EZXRXTFEwU0QwejFy?=
 =?utf-8?B?VWhrRElmVHVCZy9Eb3Z1cHpjZC9PU25QZjV6NHAyUVZiRWNnTEp4RDlCWFZo?=
 =?utf-8?B?cTNDZ1dXTW9YZFhOVXpGYjJvdUl6VGFxcmFpNmt0bUdjdDBEVnNDNnZSc21B?=
 =?utf-8?B?RWxuZm50NDZKNHhKZHZkWlU5T2NiU3QvWTZvTWd0Skd3K2xNL1FSV2Vwemxl?=
 =?utf-8?B?R3AzWjFNOE85TkJ2Ui83OWs1VFNpZXlpcVJtcmU3bEZBYUF1M3U3Q21VSjZN?=
 =?utf-8?B?NWtOZXV4cFZiMm5QeDluT2JkbmZOUmdsbVhUWnUvRENrbzJ6ZzNrRVRLN0w0?=
 =?utf-8?Q?sOCCBp+yOc8VKtOZiix3bBeUdkmzSTx3kmy+5Ur?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4122cf-427f-434c-e364-08d8da251406
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 07:06:45.5007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hkCjnHBsC88drcOS3XKHHhAU0mIfe8F1Qvcb58fUGvVTbryMUHl8tpCMewUnuXpWZH1iMUBFVfGP9DGFsd7//Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSAyNSwgMjAyMSA0OjQ0IFBNDQo+IA0KPiBPbiAyMi4wMi4yMDIxIDExOjU2LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0K
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+ID4gQEAgLTQyOCw2ICs0Mjgs
MTQgQEAgc3RhdGljIHZvaWQgdm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cg0KPiA+ICAgICAg
dm14X2ZyZWVfdmxhcGljX21hcHBpbmcoZCk7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9p
ZCBkb21haW5fY3JlYXRpb25fZmluaXNoZWQoc3RydWN0IGRvbWFpbiAqZCkNCj4gPiArew0KPiA+
ICsgICAgaWYgKCBoYXNfdmxhcGljKGQpICYmICFtZm5fZXEoZC0+YXJjaC5odm0udm14LmFwaWNf
YWNjZXNzX21mbiwNCj4gX21mbigwKSkgJiYNCj4gPiArICAgICAgICAgc2V0X21taW9fcDJtX2Vu
dHJ5KGQsIGdhZGRyX3RvX2dmbihBUElDX0RFRkFVTFRfUEhZU19CQVNFKSwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4sIFBB
R0VfT1JERVJfNEspICkNCj4gPiArICAgICAgICBkb21haW5fY3Jhc2goZCk7DQo+ID4gK30NCj4g
DQo+IEhhdmluZyBub3RpY2VkIHRoYXQgaW4gcGF0Y2ggMiBJIGFsc28gbmVlZCB0byBhcnJhbmdl
IGZvcg0KPiBlcHRfZ2V0X2VudHJ5X2VtdCgpIHRvIGNvbnRpbnVlIHRvIHJldHVybiBXQiBmb3Ig
dGhpcyBwYWdlLCBJJ20NCj4gaW5jbGluZWQgdG8gYWRkIGEgcmVzcGVjdGl2ZSBhc3NlcnRpb24g
aGVyZS4gV291bGQgYW55b25lIG9iamVjdA0KPiB0byBtZSBkb2luZyBzbz8NCj4gDQo+IEtldmlu
LCBKdW4gLSBJJ2QgbGlrZSB0aGlzIHRvIGFsc28gc2VydmUgYXMgYSBwaW5nIGZvciBhbiBhY2sN
Cj4gKHdpdGggb3Igd2l0aG91dCB0aGUgc3VnZ2VzdGVkIEFTU0VSVCgpIGFkZGl0aW9uKS4NCj4g
DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==

