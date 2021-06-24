Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36AD3B26CA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 07:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146382.269334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHvA-0000p7-Pl; Thu, 24 Jun 2021 05:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146382.269334; Thu, 24 Jun 2021 05:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHvA-0000mQ-LX; Thu, 24 Jun 2021 05:29:00 +0000
Received: by outflank-mailman (input) for mailman id 146382;
 Thu, 24 Jun 2021 05:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXyq=LS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lwHv8-0000mK-TT
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 05:28:58 +0000
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f9db4f5-aef3-4c27-b411-3e91f1db7158;
 Thu, 24 Jun 2021 05:28:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 22:28:50 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2021 22:28:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 22:28:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 22:28:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 22:28:48 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 05:28:44 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4242.024; Thu, 24 Jun
 2021 05:28:44 +0000
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
X-Inumbo-ID: 5f9db4f5-aef3-4c27-b411-3e91f1db7158
IronPort-SDR: 7Jc7IJCI/WWpY6d5zGrCQV756M0TcgoqIInKNVOlPfIpc+HPqorHdgLA/RbBfH0yMJmlD5cbEL
 9Z5J8CaCKrgA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="187086500"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="187086500"
IronPort-SDR: KyRX9+06cNR1o+63fO8S4jLdFrIpO15HrhAnbTgFnOAa9zSamlc3C9QPw2wTXUQIfQUOYICZXa
 xp4OF6t/2R1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="487617230"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsqaWuYsUydJ/DTUXQyhErla4PNAy9bVYjbf8rQbm4d+ZrFnwaWyC3Ual04iagFligec2tGSg3Z7vYMZK8boCzID8P8uAbTAe6r8ERL8vnRo0QO+3dQEqYbeZE90MJIFb5ayVXKalF9FRRkiRjjWJdmzYUq8vM1RWNezmPLLhAuQewBQtAFlnxezC+rE/q3CmB02LoXefZg+iXeIh+cFlHjVlduTmLsJPRzQM3m8Sg0Fqn5TQBdypoVj2OJ+VyrbFVNm6AkdPqdnA6Bp0KhryzKZ3HbaWkb9ioIeMMi+56T3qOJt3RH9PdBlSD+Dbvt4Yoy43JAs6m6CkCIFrGun6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmnO1AJCvEJAYCu0B2SLfSl8IVcETv9btJ+UVbpijjg=;
 b=joLCN+TKoyRtc59uOm/WwWt2AfFM+t86TxBMNaegUXiUPLZqdOfDp8WWZyf1zWbSSah7QbU3KiOonyZ5fCAN9fFhGMZCpj36IrJ1lySS65al2BFnUjzskkVokWvqpBqBzxbs6UMfnExNOD2AJixotRxYIq03Y3botf1ISSmb/s09fUuucv3J4al6TWN7ca9aCRP8sJ7NGGMT3nmqiEmcEWOb5CjHhTWRpZw0k36oTWiiCVucf6FFWVTaAEnJNGcPb0i58Ec7RHKpus1C3128H6r8eb6gB5BjIoMqD9Zt4IKjC1fRI6gUE+/mdL463ZLXSI7ySppGKlA/uFB6CtFaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmnO1AJCvEJAYCu0B2SLfSl8IVcETv9btJ+UVbpijjg=;
 b=bZaQrZylYW/VBbCLoYXGdi/6fyd+VtvP5AKG6AGRJFA9n1ZqmkqqDpfqPVtt9hUAIJjcR3xzAQD0Idg/nTBLoYKz67hqioFvwiSGDw1KonqUnM8y6iLdZawaElYSF3baxQqrojBwPGvebFlbYR2kyb+6YbnsIPyX94btC3i3R0o=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH 6/9] VT-d: don't lose errors when flushing TLBs on
 multiple IOMMUs
Thread-Topic: [PATCH 6/9] VT-d: don't lose errors when flushing TLBs on
 multiple IOMMUs
Thread-Index: AQHXXRH0ckwXa9bz/0iMr111MgNGbqsiuVNg
Date: Thu, 24 Jun 2021 05:28:44 +0000
Message-ID: <MWHPR11MB18868E51563CA138A8AC660A8C079@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <8a4f355e-c381-412c-8949-061851d0f7e2@suse.com>
In-Reply-To: <8a4f355e-c381-412c-8949-061851d0f7e2@suse.com>
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
x-ms-office365-filtering-correlation-id: c088a328-885e-4783-cd56-08d936d0ef5e
x-ms-traffictypediagnostic: CO1PR11MB4833:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB48334F5267EDA77F03E3EC938C079@CO1PR11MB4833.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9VjSFNm1H0E6mAVtl6Cu77XplEP7oxleP7jTyHxwTWi6ZLNNYfH4Y84lwmWBBfPl0ZPUL1at2xMpevL4TPbbE2yNgM+ylIfZWcfPIUZMVchDG9v+qKZCeqSFbS7lJM0Gt8JTdnmjYWAJedgwSkY3k0PpFbN4/W0LslSbS9gzVYRJ3u8OMNOnZz2P7YOiQM9Zf3hWo52tiHt81VliDxW5C0yo7uTLMds0byHYcuexGO3oERxPk1sbQkHX7Bscj2a3rZ8VocztVxrjy5LYfQ+4RsHiIu2ljryKFXViNrt3CImN0xKW2wyKZV6ULhzC2ikJ87pXeZ7vagsXIPKAQGHSg2KB1gy5RhsuRa1dGs+PgicTuaevPVeXiQy1L71OFXgEmiieEDC9fNvCT32Tny76L79M+N8N861vCE94NDkYv+LDsQ0wMU1G1Z+O5wtXcXG7L65BYH5G8zwupwWJrjIx+m5falPmmki9Vmo4Sns7yF870DHKn0lCEKlgsHbl+1E049y5xWLjM98vXpN+YcqhB/q7IabYEF9OtJp0vN15LiH9o6ICf/0vL2TGqb5lnAqXupBjlfEuNfvX4BWgTACcLg+PIaG6O4zRCk2lgFxkK1I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(478600001)(66476007)(64756008)(66446008)(66946007)(76116006)(66556008)(54906003)(83380400001)(110136005)(122000001)(316002)(9686003)(86362001)(52536014)(38100700002)(5660300002)(186003)(71200400001)(2906002)(8936002)(26005)(55016002)(8676002)(7696005)(4326008)(33656002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWorVmZlc2VZTWQ4VjlFeGVVRTlMVVBwaWZVWjl3clV2V0E0VnFnbEtvR3Bj?=
 =?utf-8?B?OUlYejVneHlZcTlqQzBla1F5MDZkM20zUGRHWWNyNCtlWHFBWU0weGlCWlA3?=
 =?utf-8?B?V0U4VUVYMDE1Y0RQdVRKN1F4ZUswZWhoUUZjUTBuaUNFem43Q1dLZHhwZVFW?=
 =?utf-8?B?RmFQeEtpTXF1MTJ2REFKQ1dka3piSUp2MkRlVTFWTmRpV3IyS3hOSjhZcnEx?=
 =?utf-8?B?bkhuN1dYK2wyMkFtUFU4UWk3d0dYT25yUGRLOU5YWE1EekJVUE95ZTBFOEJP?=
 =?utf-8?B?V0Yxb0Y2N0JxamV4VUU5WDFjVjVBYnBvUzZleWRQeXFoMExkVjMzWVVjbU4x?=
 =?utf-8?B?dzNQMDhCZTJhbjA3RmdXaUVmenlVREdoK1ozZSt3NTNhL3FHZVo5dFllNE4r?=
 =?utf-8?B?WlFBcFJLMVpUdnd5V3JZZ1JoQUFlMisxSzVqaFNFT2YzRjhmSVZCUEppbmVY?=
 =?utf-8?B?YUEwcWFXK096WFFjbWd6ZnlyM2UwU3BzWDd5QWdaQStxR1ZVS1NJaTdiekpN?=
 =?utf-8?B?UWlvOGEveEZkRkc1L2Vxd2hlbktoUXVpbWtuWmtnWGYyNWRCdk1rblJFbWZJ?=
 =?utf-8?B?VlNMZlptYmRnWXlYVVBlZDhLcU1vNFZzaTg5S25ycGRUSlgwd1N2dklORDdx?=
 =?utf-8?B?TkpuWG0zQ2NyZU1wNkZUMWFyalR6cWtpVEo3Y1N3MU9NaEF2MWc1ZC9PQkhS?=
 =?utf-8?B?SEdjRFhvbFpEUlZIL0pYZjRYdkVwVnhyalJRcFFxYi9NYStSY1A2ZXJFTm1Z?=
 =?utf-8?B?MVpmQnpBbC8xeGw0SkQrOTNHMWk5djdyRzhwd2NTSFNvS3ZvOENGdmNkU29v?=
 =?utf-8?B?U2ZSWEZna252U0lOTVNnV3FjMlJMOGRNaUJjN01maTM1aVBBdlVmb3M0OUZU?=
 =?utf-8?B?bmRyRzhka3JNdExCUUdHSkRUU2xUT1BwN1ZUU2dQcktaZTVPUnJpS1pFQTRa?=
 =?utf-8?B?TTZJNUNReVJpT2JCMmdyVU9ZNVRSQk9pd3I3eUxRUU94SU9BQjdoSHpNN0hK?=
 =?utf-8?B?b3JXV3dqUXlUUHlMZHFTRkEvZGdjRmxFN1l2LzF5YmtKV1hHeTZ4MVVEeTho?=
 =?utf-8?B?d0xFRWdRWENBbU5BZTIwdTRRNWx6Y3dzckNvdjcvZCtvZndiekx3cWNWUGR4?=
 =?utf-8?B?Y3JZb21VVDlBZmVUSnBtcmNOekF3eWtVVytFUUczUzhRaHlnVHlCNGpmRGVB?=
 =?utf-8?B?WjBZbndwRnBFbjFQdmkzL0RvZWVmU0NIWlgwMGY0NUxzQ2FXMXUvVlJManJD?=
 =?utf-8?B?cHZKRmRMNks4U2NzYlFDSzhSOC9yeTJWZGVwRjM0SGQra3JDOTBQSlhtaVNT?=
 =?utf-8?B?eVA4YnF1bFlKN283eld4SHZaVTNjb05sdE5CMjl4ZFJva0wxdmora1M0M2F0?=
 =?utf-8?B?NnpiVmFNUGc5TDBseWJXZFYxREdubU9rTnpHSmt5US91ellRelBjdmxPVVor?=
 =?utf-8?B?Z0lSMy91d2RtNThGNEVIWU1NSDV0ZjBQK0tLNTJvZ05SZDdGOEJHcDNtVWQv?=
 =?utf-8?B?YkFWaC9zY1JBSWM3NXpBazZiZTdsK013eHpwM1FycFBZUHV3cXRlL3NzbWRl?=
 =?utf-8?B?NWd1S1M4Z1lubVZVMDBFOVJqNjRWL0Yzd3BhN0pVdUl0UkdpVjVJY1ZtTERq?=
 =?utf-8?B?WGtSMjM3MHBjNEpEUloxdTZBNWRtZHdGWVFSOGdlL29rcmNBaDhCd1NOaStO?=
 =?utf-8?B?eEs0MU5oWTNxdlUxbi9KS0ZoQVlHdTlUTStyTmxEQUowUVNyOXYyQmdsRUlJ?=
 =?utf-8?Q?3B7fPKijpjqSpFRZIxglb1vd0p2qrZ5YCgcS/Jf?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c088a328-885e-4783-cd56-08d936d0ef5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:28:44.5111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SrXm4wdqjI/MdWAlpJZyBGMBnkkQoRpbaTmhEjUyvNjGW0Rzniohd/EKA5Q7mUSl26nlZvd06S+QXFSg22QTfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaA0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgOSwgMjAyMSA1OjI5
IFBNDQo+IA0KPiBXaGlsZSBubyBsb25nZXIgYW4gaW1tZWRpYXRlIHByb2JsZW0gd2l0aCBmbHVz
aGVzIG5vIGxvbmdlciB0aW1pbmcgb3V0LA0KPiBlcnJvcnMgKGlmIGFueSkgZ2V0IHByb3Blcmx5
IHJlcG9ydGVkIGJ5IGlvbW11X2ZsdXNoX2lvdGxiX3tkc2kscHNpfSgpLg0KPiBPdmVyd3JpdGlu
ZyBzdWNoIGFuIGVycm9yIHdpdGgsIHBlcmhhcHMsIGEgc3VjY2VzcyBpbmRpY2F0b3IgcmVjZWl2
ZWQNCj4gZnJvbSBhbm90aGVyIElPTU1VIHdpbGwgbWlzZ3VpZGUgY2FsbGVycy4gUmVjb3JkIHRo
ZSBmaXJzdCBlcnJvciwgYnV0DQo+IGRvbid0IGJhaWwgZnJvbSB0aGUgbG9vcCAoc3VjaCB0aGF0
IGZ1cnRoZXIgbmVjZXNzYXJ5IGludmFsaWRhdGlvbiBnZXRzDQo+IGNhcnJpZWQgb3V0IG9uIGEg
YmVzdCBlZmZvcnQgYmFzaXMpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC02
NDMsNyArNjQzLDcgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW9tbXVfZmx1c2hfaW90bA0K
PiAgICAgIHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11Ow0KPiAgICAgIGJvb2xfdCBmbHVzaF9kZXZf
aW90bGI7DQo+ICAgICAgaW50IGlvbW11X2RvbWlkOw0KPiAtICAgIGludCByYyA9IDA7DQo+ICsg
ICAgaW50IHJldCA9IDA7DQo+IA0KPiAgICAgIC8qDQo+ICAgICAgICogTm8gbmVlZCBwY2lkZXZl
c19sb2NrIGhlcmUgYmVjYXVzZSB3ZSBoYXZlIGZsdXNoDQo+IEBAIC02NTEsNiArNjUxLDggQEAg
c3RhdGljIGludCBfX211c3RfY2hlY2sgaW9tbXVfZmx1c2hfaW90bA0KPiAgICAgICAqLw0KPiAg
ICAgIGZvcl9lYWNoX2RyaGRfdW5pdCAoIGRyaGQgKQ0KPiAgICAgIHsNCj4gKyAgICAgICAgaW50
IHJjOw0KPiArDQo+ICAgICAgICAgIGlvbW11ID0gZHJoZC0+aW9tbXU7DQo+IA0KPiAgICAgICAg
ICBpZiAoICF0ZXN0X2JpdChpb21tdS0+aW5kZXgsICZoZC0+YXJjaC52dGQuaW9tbXVfYml0bWFw
KSApDQo+IEBAIC02NzMsMTMgKzY3NSwxMiBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBpb21t
dV9mbHVzaF9pb3RsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
bHVzaF9kZXZfaW90bGIpOw0KPiANCj4gICAgICAgICAgaWYgKCByYyA+IDAgKQ0KPiAtICAgICAg
ICB7DQo+ICAgICAgICAgICAgICBpb21tdV9mbHVzaF93cml0ZV9idWZmZXIoaW9tbXUpOw0KPiAt
ICAgICAgICAgICAgcmMgPSAwOw0KPiAtICAgICAgICB9DQo+ICsgICAgICAgIGVsc2UgaWYgKCAh
cmV0ICkNCj4gKyAgICAgICAgICAgIHJldCA9IHJjOw0KPiAgICAgIH0NCj4gDQo+IC0gICAgcmV0
dXJuIHJjOw0KPiArICAgIHJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBfX211
c3RfY2hlY2sgaW9tbXVfZmx1c2hfaW90bGJfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCwNCj4gDQoN
Cg==

