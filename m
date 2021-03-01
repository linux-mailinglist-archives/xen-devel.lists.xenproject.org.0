Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EAB32793B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91349.172633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdwY-0001pT-Qk; Mon, 01 Mar 2021 08:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91349.172633; Mon, 01 Mar 2021 08:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdwY-0001p3-Ld; Mon, 01 Mar 2021 08:30:18 +0000
Received: by outflank-mailman (input) for mailman id 91349;
 Mon, 01 Mar 2021 08:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8He=H7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lGdwX-0001ov-Fd
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:30:17 +0000
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79aa9515-8652-4759-8f21-edc7f9329439;
 Mon, 01 Mar 2021 08:30:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 00:30:12 -0800
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 01 Mar 2021 00:30:12 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Mar 2021 00:30:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 1 Mar 2021 00:30:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 1 Mar 2021 00:30:12 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 08:30:11 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 08:30:11 +0000
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
X-Inumbo-ID: 79aa9515-8652-4759-8f21-edc7f9329439
IronPort-SDR: cjfPUpDtib6lwKCd30c0C9KGTDcugerQxAumtP+X1g2G2OoWVlZ6iM9rJhCy5M0uB1XJ6yKhh3
 yjcGxvpdVA8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="166270899"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="166270899"
IronPort-SDR: pYocEsMr9L3MAwltRmJe3HfRScGLILrch5bTP0gzmhbHQBf5wTUjouo5dpw3zwKiXBvkwLrYcR
 y/8ErJbms+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="585422223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJIaigB2Rl8s7mZIabCTvBWhmzjTyMMHKRxmqIIEpE+qFjOvEAmlmuevzCuSkJi1KvnspDoOSNV6u6wkiaKVedciNWZTWp9Jniq1zGM9Z4fdyISNX+uC+rpXNjgkewf0ul8nkKJFQ6/T/rRigx8JpvxXuTxf7m6W1gEZLfwsHWNtF8wO+3muYXNsTKU8135QDkzYVY1UCLvqpu5BwTxLb0TbsUqIb9JnS/EWiwemmw5CfljRiFT+2GzpDbWOavoWNnZPXz85IXhS9aNerl6gCKFwFv/2QSUp+0HZCh93j+B3hwaZ+vhIBl2ajOh/rpIQwBi5hfDO4jqHnx08nJi9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu+o87Y+YoIAgqdFwKdtjzbEgxiI6CuKtU/sUct9ZN8=;
 b=KKLIclr7/RZiedqd/fEnVxCZbbLEevVVnZIeKjvTudwK4RJZu35epBAEXzmRuRKgDAwP0quL+YoQuKSYfAiGAFeYQDLzcBZ4olRVKgtbAm3yRc6RMelpcLG0q32s9K+U7FL3+w056Yfnh21L1DBFw6cyJYem7bhM5gCaXHxGWESYkuggxS7pETC7Tiai9eVLxpoyy09/hasnyMOe7/GPCm5LZR1trAlbASIWLp9gafp/tBc57172uUJ5mU6M4qK7fP4EdBbuly9ciz5TfKOgR4nmh+6LInUZICWlojq+Ye147JTflUm4Bo/gUay66ErvwOyLxTFm/ocKDj7q+bJ+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu+o87Y+YoIAgqdFwKdtjzbEgxiI6CuKtU/sUct9ZN8=;
 b=Nt+FybPXTPZ9WN3Ie0CX+CK6pQ83mI/qn7twAzCW6RRBeMJ5CQcIMAXw5yL6EmCBwktragKOq5hmVaQKFz67Cv6suwU3qZ2Vpp05ideMr+KvXxO8ynLOxdoTYFVoNkeMi2cVhwXCQ7UvPa95Uy6yd2F30+Bs2pfUphMpdirRKGI=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH] VMX: use a single, global APIC access page
Thread-Topic: [PATCH] VMX: use a single, global APIC access page
Thread-Index: AQHW/8yZa97+qDgbIE6iwG3wuPN9papSpOiAgAAfJYCAAAsJgIAAAbyAgAASBACAG55hYIAAZWcAgAABLbA=
Date: Mon, 1 Mar 2021 08:30:11 +0000
Message-ID: <MWHPR11MB18860667A153820C2CB8D55B8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
 <YCUSDSYpS5X+AZco@Air-de-Roger>
 <547b40f2-3b7b-10cb-30f6-9445c784eb0b@suse.com>
 <YCUiniCn+oT9CFwC@Air-de-Roger>
 <MWHPR11MB1886E452B181ACA872B7C6878C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <a11878e2-312c-a49a-ebe2-122906fc8d38@suse.com>
In-Reply-To: <a11878e2-312c-a49a-ebe2-122906fc8d38@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08f9edbc-a2f7-4f89-a51d-08d8dc8c3abc
x-ms-traffictypediagnostic: CO1PR11MB4979:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB4979B387E03EA64A926B79A68C9A9@CO1PR11MB4979.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z0v/3RVXSSRRMiCrqUjuAh+pTxp1gI+F5bG2i5bDaWPO+HZywaDH4fYPCM2QSgtJ2rWQrU54Tt6wCQMn+9SXMmmrdLT1JhjKWvjXJBTfTr/dpem3k6aVBZRWDIa6OH3MrRL9PYmlBpyFnYJL0IAPSL/aHH/hj7bK6XKg1MMmwEMHpcUfhyF/f+YSN2548ODuAT44cmMFe76XGK3dFE8HqSYfcYp1a4Xtqu/5IoYqhV/GuxEpWQ3hZSRxRqmI5+6EEkyikYHfYwcAwcjcsYKs1S6uIbvu7T1C+TQ9o+STGVKaDSBERPc8GZ7DC8AdpAsZOD458Bmobs416wW0gPxbiv+TZ5Hg0T2y/WdEX9crgQw0n6mxnk4Fa4G48Q1dJVkbd9Ae9mnQogY+VYlvzdiDqLh9pNftW0xsWIrYDnjQbtoTg4MwtiQ4WyycacSUsEumle1fSfbWvR3ryO7XSPN/xmmYrMWfFHh1cpCLA5gg5WXLA3fTcgV28z6mJCjGnWE/zcspWUGj9lHHKJaNCxVIdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(396003)(366004)(376002)(7696005)(83380400001)(86362001)(6916009)(8936002)(52536014)(66946007)(33656002)(53546011)(5660300002)(76116006)(64756008)(66556008)(66476007)(66446008)(6506007)(9686003)(2906002)(71200400001)(186003)(55016002)(26005)(54906003)(4326008)(8676002)(316002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RXFibXFEYjduSlQ4RWEvMmVIanRKeVA3U1N5Vm9rQXZ1ZktrMjk4aWpjMHRF?=
 =?utf-8?B?OWdqbVBuZWJOdVpGZ2F2Y3hPMnhtUXEzY1JJTmM1c3VGLzNnOGlKRkp4UXlD?=
 =?utf-8?B?M2M5elRQa2c2SldJUUlkR1JFdnVUN1VNMG5Ra1Z1SzZZUmUrZngxRU1HOUQr?=
 =?utf-8?B?STlBNFdONmlPRHU1enpnN2psRHNCb2R0dEtweE83MjdmZFNqcEV1YmZSUGRz?=
 =?utf-8?B?emp4MHMxYWVBR1NhSWZEUmtJRmNIMy9Qd1ZCMzh5UlJUR21TQ1Y1T1B0QVZC?=
 =?utf-8?B?d251QWNyZThxVHV2aVVKaElxT2NOd08yeThrU3F3Z3N0NkREVm9WR1hodmVJ?=
 =?utf-8?B?MFY1Nm1kdTRLQm5mTVUxN2NLNC9YR042UzVzcnY1OC9FczQ1aXVXOFRaZHF3?=
 =?utf-8?B?QmxmdjNaTVVmM1FOWHNGcHVodUR0Wk1KSklUaWt1djlJTDdvT0MreWxUTUxr?=
 =?utf-8?B?L0VCZllUQ2xhVUhQdUlORnkrS2hxelBtQUdCaVlVQ0p5VkdXNENpZG9HeVRh?=
 =?utf-8?B?TmtydEd0c2d5S1VzbUNBVlY1NnhKYjI3WGNtYzJ4aUpuRHVaQUlIdmR2dCs1?=
 =?utf-8?B?NWE2dmRIdjM2UWhDbjlEQ2pOT1dzK0oxdkQyRm1SSWEwOW5KYXM3c0ZFbVBQ?=
 =?utf-8?B?aXk0RDNGZzNIZlJuV1dtUGR4NWptZkkwQmhYUFdON2xBTmlOck1KcXBER2Nm?=
 =?utf-8?B?UHF1KzM5YWRlYlQ5U3BKUE0rSUxHOXdudTZ4TGsyYXdJSDE5YkFwa0RuNVo5?=
 =?utf-8?B?YWtZbEFmWnNMR3hwK0tUclBHN1dXMnJDWG4zdUtTZDRsZGdBWHp5MUFXbGl3?=
 =?utf-8?B?SHNteURPN21pUmw1RU8xZ3ZML2FyU3BGckpGMVhVdk9BNHRRWFBZQ3Q2NkxP?=
 =?utf-8?B?RXZwQkg2WDdmVmtNbHoyN2hzWGVDU08vQitWS01FSm5hQWFFeWlTRGZYayt4?=
 =?utf-8?B?SjR4aFdoaUl6dE1kNURwdzQxekllcGdLV1EwT1RheFR0amFueThhaUVqUVJJ?=
 =?utf-8?B?T25oRlZJL3BmS0NIYXl6NHRmRU9Tc2l4QWpKaDh1amZjU0t5dWordWtVZnoy?=
 =?utf-8?B?QlRvNmNLdkYyMHVUbWtsY2F4V1YrVXg2MDNKU24xOEo2WTJNalFkZnJ6VDdm?=
 =?utf-8?B?cE5uWEVQelZDY2pKUFduUGlFRzQvcFBWc3B2U3BJNFRWQ2pEM3p5NFVxcmw5?=
 =?utf-8?B?VG9zTVNWSjRVTlVxTzJuRkZPSmk2blBDVmhJU044NGE0azk4VXF2M1R5d3Yw?=
 =?utf-8?B?NlVNeElFdlh4VnJVUXVTQnJ3ZXRwdU83WEEraUlIbkZPRTJud3pXMThDY3JU?=
 =?utf-8?B?SmwyblZKWFN1VndVWGVmeDAvYU9YVkRzVFN1ak9CeVhzS1RVejV0UElhdUEr?=
 =?utf-8?B?L1NqTlIwcjQyOUdPRG1QUTNOSE9KSk1JMS9MSDhDelExdXV5dEI4dWlrSm5E?=
 =?utf-8?B?SWd1Vm10Znk5aUw3VDg5QWFpOWdVc3JnSHZVTlU2eDRsTHhGN011MkNGa25i?=
 =?utf-8?B?VlUvWmlPWGQwbWRzUUJhb2JhU20yV202Sm40M0d2SjVCNjQ1U0pkSkpQekNa?=
 =?utf-8?B?T1haclViSHV4cndMclFpcTNDcm0xcS9ZQXZVdlhWd3BRWjZVT3lxVjFKcXlw?=
 =?utf-8?B?c1RDS01BVXJ5VDhZWUsvZytWSEtrakx5OUVoMExYVFB3VHNCMkdxWFduLzhZ?=
 =?utf-8?B?U0dDTUlLdmZCTFpYamtXaHpRTEZQMlA5ZXc4eHJ1QzgvZmErRWxFOWVvZ3BM?=
 =?utf-8?Q?DDWobDTCOkD+k2EmltNKH5BQodBMaAn7O8nnvpk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f9edbc-a2f7-4f89-a51d-08d8dc8c3abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 08:30:11.0639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y5UZ7znBtQDO1OD+td+hNvQT//2hP/oqsSEHvGVDsSZCTI0liBl9gx97WGKspge7HkJr15Rfy6jeZseinr7EzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWFyY2ggMSwgMjAyMSA0OjE2IFBNDQo+IA0KPiBPbiAwMS4wMy4yMDIxIDAzOjE4LCBUaWFuLCBL
ZXZpbiB3cm90ZToNCj4gPj4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxMSwgMjAyMSA4OjI3IFBNDQo+
ID4+DQo+ID4+IE9uIFRodSwgRmViIDExLCAyMDIxIGF0IDEyOjIyOjQxUE0gKzAxMDAsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPiA+Pj4gT24gMTEuMDIuMjAyMSAxMjoxNiwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToNCj4gPj4+PiBPbiBUaHUsIEZlYiAxMSwgMjAyMSBhdCAxMTozNjo1OUFNICswMTAw
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+Pj4gT24gMTEuMDIuMjAyMSAwOTo0NSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4gPj4+Pj4+IE9uIFdlZCwgRmViIDEwLCAyMDIxIGF0IDA1OjQ4
OjI2UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvcDJtLmgNCj4gPj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3Ay
bS5oDQo+ID4+Pj4+Pj4gQEAgLTkzNSw2ICs5MzUsOSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGludCBwMm1fZ2V0X2lvbW11DQo+ID4+Pj4+Pj4gICAgICAgICAgZmxhZ3MgPSBJT01NVUZfcmVh
ZGFibGU7DQo+ID4+Pj4+Pj4gICAgICAgICAgaWYgKCAhcmFuZ2VzZXRfY29udGFpbnNfc2luZ2xl
dG9uKG1taW9fcm9fcmFuZ2VzLA0KPiBtZm5feChtZm4pKSApDQo+ID4+Pj4+Pj4gICAgICAgICAg
ICAgIGZsYWdzIHw9IElPTU1VRl93cml0YWJsZTsNCj4gPj4+Pj4+PiArICAgICAgICAvKiBWTVgn
ZXMgQVBJQyBhY2Nlc3MgcGFnZSBpcyBnbG9iYWwgYW5kIGhlbmNlIGhhcyBubyBvd25lci4NCj4g
Pj4gKi8NCj4gPj4+Pj4+PiArICAgICAgICBpZiAoIG1mbl92YWxpZChtZm4pICYmICFwYWdlX2dl
dF9vd25lcihtZm5fdG9fcGFnZShtZm4pKSApDQo+ID4+Pj4+Pj4gKyAgICAgICAgICAgIGZsYWdz
ID0gMDsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBJcyBpdCBmaW5lIHRvIGhhdmUgdGhpcyBwYWdlIGFj
Y2Vzc2libGUgdG8gZGV2aWNlcyBpZiB0aGUgcGFnZSB0YWJsZXMNCj4gPj4+Pj4+IGFyZSBzaGFy
ZWQgYmV0d2VlbiB0aGUgQ1BVIGFuZCB0aGUgSU9NTVU/DQo+ID4+Pj4+DQo+ID4+Pj4+IE5vLCBp
dCdzIG5vdCwgYnV0IHdoYXQgZG8geW91IGRvPyBBcyBzYWlkIGVsc2V3aGVyZSwgZGV2aWNlcw0K
PiA+Pj4+PiBnYWluaW5nIG1vcmUgYWNjZXNzIHRoYW4gaXMgaGVscGZ1bCBpcyB0aGUgcHJpY2Ug
d2UgcGF5IGZvcg0KPiA+Pj4+PiBiZWluZyBhYmxlIHRvIHNoYXJlIHBhZ2UgdGFibGVzLiBCdXQg
Li4uDQo+ID4+Pj4NCj4gPj4+PiBJJ20gY29uY2VybmVkIGFib3V0IGFsbG93aW5nIGRldmljZXMg
dG8gd3JpdGUgdG8gdGhpcyBzaGFyZWQgcGFnZSwgYXMNCj4gPj4+PiBjb3VsZCBiZSB1c2VkIGFz
IGFuIHVuaW50ZW5kZWQgd2F5IHRvIGV4Y2hhbmdlIGluZm9ybWF0aW9uIGJldHdlZW4NCj4gPj4+
PiBkb21haW5zPw0KPiA+Pj4NCj4gPj4+IFdlbGwsIHN1Y2ggYW4gYWJ1c2Ugd291bGQgYmUgcG9z
c2libGUsIGJ1dCBpdCB3b3VsZG4ndCBiZSBwYXJ0DQo+ID4+PiBvZiBhbiBBQkkgYW5kIGhlbmNl
IGNvdWxkIGJyZWFrIGF0IGFueSB0aW1lLiBTaW1pbGFybHkgSQ0KPiA+Pj4gd291bGRuJ3QgY29u
c2lkZXIgaXQgYW4gaW5mb3JtYXRpb24gbGVhayBpZiBhIGd1ZXN0IGFidXNlZA0KPiA+Pj4gdGhp
cy4NCj4gPj4NCj4gPj4gSG0sIEknbSBraW5kIG9mIHdvcnJpZWQgYWJvdXQgaGF2aW5nIHN1Y2gg
c2hhcmVkIHBhZ2UgYWNjZXNzaWJsZSB0bw0KPiA+PiBndWVzdHMuIENvdWxkIEludGVsIGNvbmZp
cm0gd2hldGhlciBwYWdlcyBpbiB0aGUgMHhGRUV4eHh4eCByYW5nZSBhcmUNCj4gPj4gYWNjZXNz
aWJsZSB0byBkZXZpY2VzIGluIGFueSB3YXkgd2hlbiB1c2luZyBJT01NVSBzaGFyZWQgcGFnZQ0K
PiA+PiB0YWJsZXM/DQo+ID4NCj4gPiAweEZFRXh4eHh4IHJhbmdlIGlzIHNwZWNpYWwuIFJlcXVl
c3RzIHRvIHRoaXMgcmFuZ2UgYXJlIG5vdCBzdWJqZWN0IHRvDQo+ID4gRE1BIHJlbWFwcGluZyAo
ZXZlbiBpZiBhIHZhbGlkIG1hcHBpbmcgZm9yIHRoaXMgcmFuZ2UgZXhpc3RzIGluIHRoZQ0KPiA+
IElPTU1VIHBhZ2UgdGFibGUpLiBBbmQgdGhpcyBzcGVjaWFsIHRyZWF0bWVudCBpcyB0cnVlIHJl
Z2FyZGxlc3Mgb2YNCj4gPiB3aGV0aGVyIGludGVycnVwdCByZW1hcHBpbmcgaXMgZW5hYmxlZCAo
d2hpY2ggY29tZXMgb25seSBhZnRlciBhbg0KPiA+IGludGVycnVwdCBtZXNzYWdlIHRvIHRoaXMg
cmFuZ2UgaXMgcmVjb2duaXplZCkuDQo+IA0KPiBGb3IgbXkvb3VyIGVkdWNhdGlvbiwgY291bGQg
eW91IG91dGxpbmUgd2hhdCBoYXBwZW5zIHRvIGRldmljZQ0KPiBhY2Nlc3NlcyB0byB0aGF0IHJh
bmdlIHdoZW4gaW50ZXJydXB0IHJlbWFwcGluZyBpcyBvZmY/IEFuZA0KPiBwZXJoYXBzIGFsc28g
d2hhdCBoYXBwZW5zIHRvIGFjY2Vzc2VzIHRvIHRoaXMgcmFuZ2UgdGhhdCBkb24ndA0KPiBtYXRj
aCB0aGUgcGF0dGVybiBvZiBhbiBNU0kgaW5pdGlhdGlvbiAoZHdvcmQgd3JpdGUpPyBJIGRvbid0
DQo+IHRoaW5rIEkndmUgYmVlbiBhYmxlIHRvIHNwb3QgYW55dGhpbmcgdG8gdGhpcyBlZmZlY3Qg
aW4gdGhlIGRvY3MuDQo+IA0KDQpJbiBWVC1kIHNwZWMgIjMuMTQgSGFuZGxpbmcgUmVxdWVzdHMg
dG8gSW50ZXJydXB0IEFkZHJlc3MgUmFuZ2UiDQotLQ0KT24gSW50ZWzCriBhcmNoaXRlY3R1cmUg
cGxhdGZvcm1zLCBwaHlzaWNhbCBhZGRyZXNzIHJhbmdlIDB4RkVFeF94eHh4IGlzIA0KZGVzaWdu
YXRlZCBhcyB0aGUgaW50ZXJydXB0IGFkZHJlc3MgcmFuZ2UuIFJlcXVlc3RzIHdpdGhvdXQgUEFT
SUQgdG8gDQp0aGlzIHJhbmdlIGFyZSBub3Qgc3ViamVjdGVkIHRvIERNQSByZW1hcHBpbmcgKGV2
ZW4gaWYgdHJhbnNsYXRpb24gDQpzdHJ1Y3R1cmVzIHNwZWNpZnkgYSBtYXBwaW5nIGZvciB0aGlz
IHJhbmdlKS4NCi0tDQpUaGUgZm9sbG93aW5nIHR5cGVzIG9mIHJlcXVlc3RzIHRvIHRoaXMgcmFu
Z2UgYXJlIGlsbGVnYWwgcmVxdWVzdHMuIA0KVGhleSBhcmUgYmxvY2tlZCBhbmQgcmVwb3J0ZWQg
YXMgSW50ZXJydXB0IFJlbWFwcGluZyBmYXVsdHMuDQrigKIgUmVhZCByZXF1ZXN0cyB3aXRob3V0
IFBBU0lEIHRoYXQgYXJlIG5vdCBaTFIuDQrigKIgQXRvbWljcyByZXF1ZXN0cyB3aXRob3V0IFBB
U0lELg0K4oCiIE5vbi1EV09SRCBsZW5ndGggd3JpdGUgcmVxdWVzdHMgd2l0aG91dCBQQVNJRC4g
DQotLQ0KDQpJbnRlcnJ1cHQgcmVtYXBwaW5nIGRlY2lkZXMgaG93IHRvIGludGVycHJldCB0aGUg
Zm9ybWF0IG9mIHRoZQ0KcmVjb2duaXplZCBpbnRlcnJ1cHQgbWVzc2FnZSBhbmQgd2hldGhlciB0
byBnbyB0aHJvdWdoIElSVEUsDQphcyBleHBsYWluZWQgaW4gIjUuMS40IEludGVycnVwdC1SZW1h
cHBpbmcgSGFyZHdhcmUgT3BlcmF0aW9uIjoNCi0tDQpBbiBpbnRlcnJ1cHQgcmVxdWVzdCBpcyBp
ZGVudGlmaWVkIGJ5IGhhcmR3YXJlIGFzIGEgRFdPUkQgc2l6ZWQgDQp3cml0ZSByZXF1ZXN0IHRv
IGludGVycnVwdCBhZGRyZXNzIHJhbmdlcyAweEZFRXhfeHh4eC4NCuKAoiBXaGVuIGludGVycnVw
dC1yZW1hcHBpbmcgaXMgbm90IGVuYWJsZWQgKElSRVMgZmllbGQgQ2xlYXIgaW4gR2xvYmFsIA0K
U3RhdHVzIFJlZ2lzdGVyKSwgYWxsIGludGVycnVwdCByZXF1ZXN0cyBhcmUgcHJvY2Vzc2VkIHBl
ciB0aGUgQ29tcGF0aWJpbGl0eSANCmludGVycnVwdCByZXF1ZXN0IGZvcm1hdCBkZXNjcmliZWQg
aW4gU2VjdGlvbiA1LjEuMi4xLg0K4oCiIFdoZW4gaW50ZXJydXB0LXJlbWFwcGluZyBpcyBlbmFi
bGVkIChJUkVTIGZpZWxkIFNldCBpbiBHbG9iYWwgU3RhdHVzIA0KUmVnaXN0ZXIpLCBpbnRlcnJ1
cHQgcmVxdWVzdHMgYXJlIHByb2Nlc3NlZCBhcyBmb2xsb3dzOg0KLi4uDQotLQ0KDQpUaGFua3MN
CktldmluDQo=

