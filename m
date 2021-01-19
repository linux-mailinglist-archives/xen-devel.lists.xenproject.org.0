Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D42FAEFC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 04:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70105.125761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1hFW-0005Zj-1C; Tue, 19 Jan 2021 03:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70105.125761; Tue, 19 Jan 2021 03:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1hFV-0005ZK-TO; Tue, 19 Jan 2021 03:00:05 +0000
Received: by outflank-mailman (input) for mailman id 70105;
 Tue, 19 Jan 2021 03:00:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Riw2=GW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1l1hFT-0005BG-DL
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 03:00:03 +0000
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6393068-149e-4472-8278-66d8cfddbdce;
 Tue, 19 Jan 2021 02:59:58 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 18:59:56 -0800
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2021 18:59:56 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 Jan 2021 18:59:56 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 Jan 2021 18:59:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 18 Jan 2021 18:59:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 18 Jan 2021 18:59:55 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB2015.namprd11.prod.outlook.com (2603:10b6:300:28::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 02:59:54 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 02:59:54 +0000
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
X-Inumbo-ID: a6393068-149e-4472-8278-66d8cfddbdce
IronPort-SDR: FuxMqKdtyBk5aa04K2IlmxW/m4FvCQ6XXzBC8Djz9k77XPK6goPTgXQnJEZj+/LH+ABuUzcOGh
 3qJrf5BOXXVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="158049965"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="158049965"
IronPort-SDR: i+k1XS7wAC5qvQ25FWpkG5vMUDtSL8efPP6AusD0Cj+bE1XH/bxtpmoU7cPkeQf4UqGFwGB1QZ
 B2mldx+3b/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="383767160"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoxZ2dPpAiBqGORESNghsq8qhAQRHaUS3eer0OZ1RXbugg4f5Aq/L5c4a/PyCwKdkeN/chq3UR10vRrm9QVDmekXpkJNe1UGaO44Sei/EHx7zCKqCeE6/NgyNcUtau07EMMGyv2n5sBj18I1Lu1kZMlQue2dz0pjrLwMiOEcD6KANo4TdIxCIWz3aNeYEJhsArH2y/Wg++anL9BxvnAInwlBV8OY10HolWsdqSDQ6qrwDzyh//WVowfsOk5pxeJWOXH4e2P21bhWtlJ0Ggf8H1R+VcLgHTaebNL17WTLiJIf9f0emJqgAseafQmKcNOWjkK8Oq3nRdh9/WVVa1EpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MKWmYyWjTO/TD90zjib+zUsjrpyCs+puS57gS1Eeh4=;
 b=AXvmBe8PMeul6nakQPJ0MUS7MOCrL3NtRH8JDq3CRS4WCrgxGcoaY4cqei3GMSw7mKsXc6U/aGVFaSXUFuTwyfFnTZ0ywrzwsN/Eaf42NzZSnOildt/5JHL/H/zk7MJoJ2GiGMg5oxcI8G3IYDkToe+mT55wWuJl2KXX0ZePo65VAI1q2p1CelKHYTzto00ZuZIN516YaqUWanm8DVU1CIOuyH28oO/lh2mTGMboRd3s7Fjl6M+Sj7EiW5JLH6tuLFGxM+0Ry/IyPfh0nd7ROUzp6PgoaDYa8YeaHJepepfqC3hb+zanZC9517VJOC7/5WhSSwrsGCDIcwzCIvEFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MKWmYyWjTO/TD90zjib+zUsjrpyCs+puS57gS1Eeh4=;
 b=GkrY3q7CwVx0qM/Kf76gVJAWxnZf5VI5pTfNulB/Eeqbl6VuthSMogPJgAJH3sVHdCkhqgIQxVILhGWvUI67TFfJtkRDM/901kPcpIWQfLX2H1Rzti8EmjyauhXTRbWSNHhLeXwrIWQPWIESHcKmVxgr08pWqoLhCx9qMxXnJzw=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: RE: [PATCH] x86/dpci: remove the dpci EOI timer
Thread-Topic: [PATCH] x86/dpci: remove the dpci EOI timer
Thread-Index: AQHW6QkXhgT9VRqaskCHlinJ58zINqolDOfQgAB8GQCAACwcAIAAJk4AgAAH5gCAADGLgIAA10iAgAAXS4CAAA1SgIAAExqAgAA9PQCABupLsA==
Date: Tue, 19 Jan 2021 02:59:54 +0000
Message-ID: <MWHPR11MB188630C893D653999F8073208CA30@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
 <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
 <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
 <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
 <ecb3298d-39f1-183e-6ef6-2771dc3f79cf@suse.com>
 <20210114123307.aq6ysxggevzfyvwr@Air-de-Roger>
 <2b9ed9bc-eae2-d4e8-c760-d429c6bedc24@suse.com>
 <20210114172040.2vqo7yfcbgw5lees@Air-de-Roger>
In-Reply-To: <20210114172040.2vqo7yfcbgw5lees@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7365f783-868a-44cf-cedc-08d8bc264c11
x-ms-traffictypediagnostic: MWHPR11MB2015:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB201509BBD563A82C5F5EB1778CA30@MWHPR11MB2015.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a31eSgeTqZKzJ4NMogHlXcKrq++vMC2aBaLCgvxDVmVzPUhdhVl3sNtwoUC4OfRP8pticlFpkFvUZp5PZGd4tRwUpEMjOmJDW9w8hFgwgF4w4auQEhNr9XYcpVtCwNn+vJaG8+hQAJtUAjN8nShHEKNHLAicOW//f6dMWGOTNm+u3Gv/u20/3YDI4oP894qXi+sM4j52ZLdK6aLIBrlJRPbdo6LgTLwEWIWXvTpE3FoqQf3j7NzPv2VnBj0xXJgd0RPMLbJXRGsrC77K9AdPczpArVCqm9IEvioQVG1ULcgOVSvCV4LO7X/AQDSucSsJTamjSuNjvpq8Y9iJxjx5a9cfz4JOa5h6qRy94wXQL/TemGblNl9g1XwqXckzpJb/OqzYUHmRpNADmb3Xf+Vbtw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(2906002)(66556008)(9686003)(186003)(54906003)(26005)(316002)(66446008)(478600001)(64756008)(52536014)(66946007)(55016002)(66476007)(76116006)(8676002)(8936002)(6506007)(86362001)(53546011)(5660300002)(83380400001)(71200400001)(7696005)(6916009)(33656002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Wnp4ZlIzUkV1Y1VTMlV6N0JHeUxlNFZGL1BneWNDdEdPdjJlVEwreXFGVmxT?=
 =?utf-8?B?L1kzYVFvUGk1Yy90LzQ1ZUVPdlZRb2xXb2xjK1oxa0ZGWWt5YXQvTG52WDcw?=
 =?utf-8?B?VzI0ZURFbjYycmViK2ZpL09wRmYvVklFekJBckducXRML1RLUWwxRG9wMEV6?=
 =?utf-8?B?ZjZqNTFRbzJ0dUJzM1o0ZlNqeThqdEdGdXB3NGV2TVhYWC9sS2NFcjJqOGtC?=
 =?utf-8?B?WFdYc0t3TnlQTHY3RGlKaHlKbWlOZDNvRzZuWHFVVm5wQUIyYk1ycXVWQWVB?=
 =?utf-8?B?TFc3aGFMZHNFS21OL3JScjNPbnBic3BZVGIyOE10N1hHaXE2SEYrSmdabzVa?=
 =?utf-8?B?T2UwRUpoT21Db0EvN3hsUkh2eHdvSkY0YlBNNW9UbjVlWHprVXBVNzlHK21S?=
 =?utf-8?B?bVcxeTZOU0toQk9KWmtDT0swTHlsTi9hbWtFVFcwU0RFZHFlVitRY29QYUVL?=
 =?utf-8?B?UG5xbkVTbTFrcm5Fc0tScndCbGlpY29uTERPQURaZEhCVHZZeC9uRk5IRi9t?=
 =?utf-8?B?cFZJRkFEU2J2Q2o4QkxZRU9wSG8zQ2JDV0llbm1yeTd1UVA0cm9xZTAvVDBJ?=
 =?utf-8?B?emZrSGVJa2JiQTZTL0FKa0g1YXhiS1BIYmRiVjFnUEJTbnBtWFVsYkpMMTc3?=
 =?utf-8?B?QVhiQ3B0N016c0ltWkE1S3hLWjRmeFN5bmtaTzh3a3VMR2lPaTFkRExnb25F?=
 =?utf-8?B?c2ZLVkU3bVFqSkdnMDFENjJ4M215ZnllaHJSeEhGdXhtR3h3TE82VWlSL091?=
 =?utf-8?B?WUErYWlBQndPcEF5cVc4T1ZHcWlyV3gxWGdpQ2JLMkhZK1VBOVhLSU1QTlEy?=
 =?utf-8?B?ejdUTDlJT0ZvYkgzYUsya0NnYzhMTzkwbGZybUdIcmVFN091MDFpU1RaOStM?=
 =?utf-8?B?cTYzcW9QZmQ2UjRzZ0JBMVRmR1QvVitJYjBFN1NOdVA0dDFEWWFDYUNxNlR4?=
 =?utf-8?B?MWNlaEdMQlBTbWN1S282WUw2WHhEclgrSzFBblZic25weU1kNnBzVWNMdWpO?=
 =?utf-8?B?cU1KeG13M2VRaUNtcXVaMkIvUlFmcmtCS2d4eUpIbFpVcG5VajFISWR4VWND?=
 =?utf-8?B?eGNwTjdRRkY1a0oyTzQrQ204d3FjajFub1p0b0RxejFGaUFNUUNTc2JzV3ZP?=
 =?utf-8?B?M1pNWDNsR2hobEdPbUI2UnJDeHUwNHNrZTBEWkVXWU0rczJ3Y0IxZEtGeWFW?=
 =?utf-8?B?TzhReWtVOHkyajBXWXJLQXFjWXkxQVM1bDdFZXhpdGNxTVF0czdvRlp2WkhP?=
 =?utf-8?B?Ykt5Qk5hV0NkNXEreW5qR0hjam1xSzJaQ2k5VWFHK09YczRvcEdGa1djbmN6?=
 =?utf-8?Q?BJkHAfSl7YKsw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7365f783-868a-44cf-cedc-08d8bc264c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 02:59:54.3025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VhcQ+2whr9rBe+iO7eSjfZcEnk8x5w14UfoAjtvdhog0hacicNSNSsgSBm1hdIlVGOA8uWkzheHPSqubvtzaVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2015
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
RnJpZGF5LCBKYW51YXJ5IDE1LCAyMDIxIDE6MjEgQU0NCj4gDQo+IE9uIFRodSwgSmFuIDE0LCAy
MDIxIGF0IDAyOjQxOjI5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDE0LjAx
LjIwMjEgMTM6MzMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEphbiAx
NCwgMjAyMSBhdCAxMjo0NToyN1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiA+PiBP
biAxNC4wMS4yMDIxIDExOjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiA+ID4+PiBPbiBX
ZWQsIEphbiAxMywgMjAyMSBhdCAwNDozMTozM1BNIC0wNTAwLCBKYXNvbiBBbmRyeXVrIHdyb3Rl
Og0KPiA+ID4+Pj4gT24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMTozNCBQTSBKYXNvbiBBbmRyeXVr
DQo+IDxqYW5kcnl1a0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4+Pj4+IEkgZ3Vlc3MgSSdkIGFs
c28gbmVlZCB0byBkaXNhYmxlIE1TSSBmb3IgdGhlIHR3byBkZXZpY2VzIHRvIGVuc3VyZQ0KPiA+
ID4+Pj4+IHRoZXkgYXJlIGJvdGggdXNpbmcgdGhlIEdTST8NCj4gPiA+Pj4+DQo+ID4gPj4+PiBs
c3BjaSBpbiBkb20wIHNob3dzIHRoZSBVU0IgeGhjaSBjb250cm9sbGVyLCBpd2x3aWZpLCBhbmQg
ZTEwMDBlDQo+ID4gPj4+PiBkZXZpY2VzIGFsbCB3aXRoIElSUSAxNiBhbmQgYWxsIHdpdGggTVNJ
IGRpc2FibGVkICgiTVNJOiBFbmFibGVkLSIpLg0KPiA+ID4+Pj4gVGhlIHR3byBsaW51eCBIVk1z
IHJ1biB3aXRoIChQVikgbGludXggc3R1YmRvbXMsIGFuZCB0aGUgSFZNDQo+IGtlcm5lbHMNCj4g
PiA+Pj4+IHdlcmUgc3RhcnRlZCB3aXRoIHBjaT1ub3NtaS4gIE5ldHdvcmtpbmcgdGhyb3VnaCB0
aGUgaXdsd2lmaSBkZXZpY2UNCj4gPiA+Pj4+IHdvcmtzIGZvciB0aGF0IFZNIHdoaWxlIGEgbW91
c2UgYXR0YWNoZWQgdG8gdGhlIHhoY2kgY29udHJvbGxlciBpcw0KPiA+ID4+Pj4gYWxzbyB3b3Jr
aW5nIGluIHRoZSBzZWNvbmQgVk0uICBJcyB0aGVyZSBzb21ldGhpbmcgZWxzZSBJIHNob3VsZCB0
ZXN0Pw0KPiA+ID4+Pg0KPiA+ID4+PiBOb3QgcmVhbGx5LCBJIHRoaW5rIHRoYXQgdGVzdCBzaG91
bGQgYmUgZ29vZCBlbm91Z2gsIHRoZSBpc3N1ZSBpcyB0aGF0DQo+ID4gPj4+IHdlIGRvbid0IGtu
b3cgd2hpY2ggT1Mgd2FzIHNlZWluZyB0aGUgaXNzdWVzIG5vdGVkIGJ5IEtldmluLg0KPiA+ID4+
DQo+ID4gPj4gV2h5IGEgc3BlY2lmaWMgT1M/IElzbid0IHRoaXMgYWxzbyBndWFyZGluZyBhZ2Fp
bnN0IG1hbGljZT8NCj4gPiA+DQo+ID4gPiBObywgSSBkb24ndCB0aGluayB0aGlzIHByb3RlY3Rz
IGFnYWluc3QgYW55IGtpbmQgb2YgbWFsaWNlIChhdCBsZWFzdA0KPiA+ID4gdGhhdCBJIGNhbiB0
aGluayBvZikuIEl0IGp1c3QgZGVhc3NlcnRzIHRoZSBndWVzdCB2aXJ0dWFsIGxpbmUNCj4gPiA+
IHBlcmlvZGljYWxseSBpZiB0aGUgZ3Vlc3QgaXRzZWxmIGhhc24ndCBkb25lIHNvLiBJdCB3aWxs
IGFsc28gYXR0ZW1wdA0KPiA+ID4gdG8gRU9JIHRoZSBwaHlzaWNhbCBpbnRlcnJ1cHQsIGJ1dCB0
aGF0J3MgYWxyZWFkeSBkb25lIGJ5IHRoZQ0KPiA+ID4gZW9pX3RpbWVyIGluIGlycV9ndWVzdF9h
Y3Rpb25fdCAod2hpY2ggd291bGQgYmUgdGhlIHBhcnQgdGhhdCBwcm90ZWN0cw0KPiA+ID4gYWdh
aW5zdCBtYWxpY2UgSU1PKS4NCj4gPg0KPiA+IEhtbSwgeWVzLCB0aGVyZSdzIGNlcnRhaW5seSBz
b21lIG92ZXJsYXAuIEFuZCBpbmRlZWQgdGhlIEVPSQ0KPiA+IHRpbWVyIGlzIHNldCAxbXMgaW4g
dGhlIGZ1dHVyZSwgd2hpbGUgdGhlIHRpbWVyIGhlcmUgYWxsb3dzDQo+ID4gZm9yIDhtcyB0byBw
YXNzIGJlZm9yZSB0YWtpbmcgYWN0aW9uLg0KPiA+DQo+ID4gV2hhdCBJJ20gdW5jZXJ0YWluIGFi
b3V0IGlzIHRoZSBpbnRlcmFjdGlvbiBiZXR3ZWVuIGJvdGg6IEl0DQo+ID4gd291bGQgc2VlbSB0
byBtZSB0aGF0IHRoZSBwaXJxX2d1ZXN0X2VvaSgpIGludm9jYXRpb24gZnJvbQ0KPiA+IGhlcmUg
Y291bGQgdW5kZXJtaW5lIHRoZSBwdXJwb3NlIG9mIHRoZSBFT0kgdGltZXIuIEluIHdoaWNoDQo+
ID4gY2FzZSBpdCB3b3VsZCBpbiBmYWN0IGJlIGEgd2luIHRvIGdldCByaWQgb2YgdGhpcyB0aW1l
ciBoZXJlLg0KPiANCj4gSXQncyBub3QgY2xlYXIgdG8gbWUgZWl0aGVyLiBJbiBhbnkgY2FzZSBo
YXZpbmcgdHdvIHRpbWVycyBmb3IgdGhlDQo+IHNhbWUgaXJxIGFsc28gc2VlbXMgbGlrZSBhIHdh
c3RlIG9mIHJlc291cmNlcy4NCj4gDQo+ID4gPiBJdCdzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCBh
Y2NvcmRpbmcgdG8gd2hhdCBLZXZpbiBwb2ludGVkIG91dCB0aGlzDQo+ID4gPiB3YXMgZG9uZSBi
ZWNhdXNlIHdoZW4gc2hhcmluZyBhIHBpcnEgYW1vbmdzdCBkaWZmZXJlbnQgZ3Vlc3RzIGEgZ3Vl
c3QNCj4gPiA+IGNhbiBnZXQgaW50ZXJydXB0cyBkZWxpdmVyZWQgYmVmb3JlIGl0IGhhcyBwcm9w
ZXJseSBzZXR1cCB0aGUgZGV2aWNlLA0KPiA+ID4gYW5kIG5vdCBkZWFzc2VydGluZyB0aG9zZSBi
eSBYZW4gd291bGQgZ2V0IHRoZSBndWVzdCBpbnRvIHNvbWUga2luZCBvZg0KPiA+ID4gc3R1Y2sg
c3RhdGUsIHdoZXJlIGl0J3Mgbm90IGRlYXNzZXJ0aW5nIHRoZSBsaW5lIGZvciBpdHNlbGYuDQo+
ID4gPg0KPiA+ID4gVEJIIEknbSBzdGlsbCB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cgdGhhdCBz
Y2VuYXJpbyB3b3VsZCBsb29rIGxpa2UsDQo+ID4gPiBhbmQgd2h5IHdvdWxkIGp1c3QgZGVhc3Nl
cnRpbmcgdGhlIGxpbmUgZml4IGl0LiBPbiB0aGUgdklPLUFQSUMgY2FzZQ0KPiA+ID4geW91IHdv
dWxkIG5lZWQgdG8gZm9yY2VmdWxseSBjbGVhbiB0aGUgSVJSIGJpdCBpbiBvcmRlciB0byByZWNl
aXZlDQo+ID4gPiBmdXJ0aGVyIGludGVycnVwdHMgb24gdGhhdCBwaW4sIHNvIG1heWJlIHRoZSBp
c3N1ZSBpcyB0aGF0IHN3aXRjaGluZyBhDQo+ID4gPiB2SU8tQVBJQyBwaW4gZnJvbSBsZXZlbCB0
byB0cmlnZ2VyIG1vZGUgKHdoaWNoIGNsZWFycyB0aGUgSVJSIGJpdCkNCj4gPiA+IHNob3VsZCBh
bHNvIGRlYXNzZXJ0IHRoZSBsaW5lPw0KPiA+DQo+ID4gSSBzdXBwb3NlIHRoaXMgd2FzIGRpcmVj
dGVkIGF0IEtldmluIC0gSSdtIHN0cnVnZ2xpbmcgYXMgd2VsbC4NCj4gDQo+IFJpZ2h0LCB3YXMg
YSBxdWVzdGlvbiBmb3IgYW55b25lIHdobyBtaWdodCBrbm93IHRoZSBhbnN3ZXIgcmVhbGx5LiBJ
DQo+IHRoaW5rIEkgd2lsbCBwcmVwYXJlIHNvbWUgbW9yZSBzdHVmZiB0byB0cnkgdG8gY2xlYW4g
dGhpcyB1cC4gTGV0J3MNCj4gc2VlIGlmIEtldmluIGhhcyBzb21lIGlucHV0Lg0KPiANCg0KSG9u
ZXN0bHkgc3BlYWtpbmcgSSBkb24ndCBoYXZlIGEgZ29vZCBtZW1vcnkgb2YgdGhpcyBvbGQgc3R1
ZmYgYW5kDQphbHNvIGNhbm5vdCBmaWd1cmUgb3V0IGEgcmVhc29uYWJsZSBzY2VuYXJpbyBhdCB0
aGlzIG1vbWVudC4gSSB0aGluaw0Kd2UgY291bGQganVzdCBnbyBjbGVhbmluZyBpdCB1cCBhbmQg
c2VlIHdoYXQgbWlnaHQganVtcCBvdXQgbGF0ZXIuDQoNClRoYW5rcw0KS2V2aW4NCg==

