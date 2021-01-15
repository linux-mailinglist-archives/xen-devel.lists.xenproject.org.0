Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365352F7F30
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68265.122197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QoJ-00087y-OP; Fri, 15 Jan 2021 15:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68265.122197; Fri, 15 Jan 2021 15:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QoJ-00087V-Kx; Fri, 15 Jan 2021 15:14:47 +0000
Received: by outflank-mailman (input) for mailman id 68265;
 Fri, 15 Jan 2021 15:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZCH=GS=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1l0QoH-000867-Rb
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:14:46 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb8bde96-f137-440a-b76c-9a5a0efdd3a7;
 Fri, 15 Jan 2021 15:14:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 07:14:39 -0800
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 15 Jan 2021 07:14:38 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 07:14:38 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 07:14:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 15 Jan 2021 07:14:38 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.57) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 15 Jan 2021 07:14:37 -0800
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CY4PR11MB1512.namprd11.prod.outlook.com (2603:10b6:910:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 15:14:36 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::b409:b6cb:ea10:cb1b]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::b409:b6cb:ea10:cb1b%3]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 15:14:36 +0000
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
X-Inumbo-ID: fb8bde96-f137-440a-b76c-9a5a0efdd3a7
IronPort-SDR: Nxif32xmp8/u3nJBYN6VfK2hgAdE3C2PcdD2E5e99P0vr07cqzGT7F/4QVPa7CRorWTkK8XuJt
 0XAVRDxX8UIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="178709130"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="178709130"
IronPort-SDR: ZwtG/YofiHAs4fH52mAT2aEOscqJawUo2fUfd1rgy0bQvdokkaXwBZfzdFf2qquOkRf+ofYxWi
 pRQgpVEW27Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="398394941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5KDJt8PhBlI4OHU7cYD/Cpu6HrtRW+77Pq5EgpGGNfmQeWb5v8/Itfr8MvKyX+0laTS2/WX/PqdWcZfsU5f+9RgTPBMhh0bKJgS+OCKzrnACKZefv+16ETKbZU8Dw5k3pYNlkIIt1PkoPOVYehK/qc4Qof52gvKXRJNyCtr1+WtRhXfdQnJHrMe6DQrdvKdBoIMZcvpcrqRY3/DmmJgQvAAjmGfKA/vYMnECSdCAa9L+E3Rx7vzVkmuuf8khRvCd8mJK6KhAsj0kCfOVv86/54+YLpKvOZvFR92JKzyS3v6QPjrHE5Us5k2KT8fJUe0jh5ehhS6+p0TYl8gv5WNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWj1IybxER1TX5Lrj0+iOiQ/uEzitHkQ3/FkU8riqoE=;
 b=NY9mdgsSqS2AJ5yOpgOabzUIVNW64nb7msTCwxf0ijJTwMIs+SzZiDhK2H/0HFzSPCfKz/KYh1HUfMKGDTcdYLzNx+BRy3gi5PeZsTYU4ssI0W3wrLiA7z1U8jJIiYiAToZqinmUdzoZAXpgOoiBVbzfEov0xzQjAYc6vBDzi28g8He2+VIbHI4+uX9STKzvNlpJjk5vuW+a94IxkfXAPvCO4ijDTUl4dxYXRh986OCC4smRH+ERV0u3dwSOYyCjGVv6R2CbhhMxHXxsSsFqImuu0mr8z/fxqnx+cpyVLrtvJed45T+Z4Zgh/l3puhP1HrV+0IdmLAqbVq1wcH4rzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWj1IybxER1TX5Lrj0+iOiQ/uEzitHkQ3/FkU8riqoE=;
 b=u0RX0oht6P7fn2eQsQWhgHmHLNWugDfqeSMg9qeV+QWldfSYBWu5y2nxENQLF7ZSn2TMHitxwivFucOinshsyAOnxTqpts5MKYoYuguui6b9rroXeAZLzMFDWV7JF+/hqtlChTGRW/6MmxbNAHUUkadL+yvCjoY3YmEQEiLYvaA=
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "committers@xenproject.org"
	<committers@xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	=?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>
Subject: RE: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
Thread-Topic: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
Thread-Index: AQHW5QJqtM8KOPdjlUWz6CGAzwJoLKonVGsAgAAxGgCAAVCLkA==
Date: Fri, 15 Jan 2021 15:14:36 +0000
Message-ID: <CY4PR11MB0056C25748617098F9B9D15DFBA70@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
In-Reply-To: <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.6.0.76
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.119.195.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ce52a67-5136-4f68-fac7-08d8b96845a8
x-ms-traffictypediagnostic: CY4PR11MB1512:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB151281C0FBE34EACC690E778FBA70@CY4PR11MB1512.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uE5STXmSDiX14OB8zOxuAlfdz2Xh3AO97giKoNq549g2bZLXCwuRXuX1Y50sISqD0z4e+E1KsZWEkGeqz282QO8sWdPDUltUAz8M4n4EwmmDMgmsBr3RngeLGDQqoRUxVTA2ortylwumdy/obArtcUO2F53XhuxTidHA32Y3s5Fpo0tG9aVumj66pT3DbXFgxcXpwYf6xLy5SToqV1+uj2u0fDqawWmnvP0wKxnRQmQVM6+REPHdR7AJlpkPSGA4aBakx6CJotzOWeA9+PYpp6LBzfVUP9Yf+BArhg/d1UxoX4BkeawGjmX+ycmLgMTZYEMZKJ2Z9YC8Vwc541BmgaYcw5phPqhxY/R47LIb2ofj/bAyHUKxhUa1QfOyhcWoNR32of9yUP21p8lxPgluLg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(186003)(26005)(9686003)(83380400001)(8936002)(33656002)(2906002)(55016002)(71200400001)(6506007)(66946007)(5660300002)(7696005)(86362001)(316002)(110136005)(8676002)(478600001)(52536014)(66476007)(66556008)(64756008)(76116006)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q0VsOGJxanRXSFpDU3R6ZXROTlliNVFXWjFlNWU5YnJhVitqWnE4NGdBbEpJ?=
 =?utf-8?B?cG1NWjRzV2NQK3dTNzg4TkNaSXFLRmZ2eTJTVWgwaFk4NGRYcHlBWWlTdEd6?=
 =?utf-8?B?RFhnVlBYK3JzTEJzSCs1NHByZ0dnOW5VYnJGT1pHaWdyM0FJNjgwNExjTVZK?=
 =?utf-8?B?UVp3N0xRKzVmRDFjYUdTRThHc1NYbW10a0JhZFhndDhocVV1T29Hc1dMQnhq?=
 =?utf-8?B?c2sxbzFUSG5zaXdNRjlBN3pZdmFKWjVrdjZVTmRER2YvczgyMENqWDFLZHZY?=
 =?utf-8?B?Uit4MWFSQ2pCVXdURnJGaDJNZVVqTmdtNHNCRWxHc1NMMlF0VUk1WVJCbnJu?=
 =?utf-8?B?V3Q2a2F5akcxVDNQNVovWWtMWUEvaUI2V0lVRnRtN1pRdzY2RitiNG5TVVBI?=
 =?utf-8?B?OTVqK0NGSnNDckp5eG5pek9aV2xFWGd3Q3ZJTEFLcEQyd2d3K3dEOGFMWnpM?=
 =?utf-8?B?UEZobzZHb0lpQW5wMm40Y2pWUFArSUlFQXZVVU1LQVFrTTBiaCthZnJPc21v?=
 =?utf-8?B?UFNYSlpiem5lTXQ1Y29RbDdsRXg2czlkbFM3cUZwcEYzTkoyT3NhQW50Rmg5?=
 =?utf-8?B?eWVDbmJ4Q1BEbGh5cjJlUHVGQTFINEpUemFOb2FkaE9BVXRhbDVKSmdLemhR?=
 =?utf-8?B?dk1NVXRjSnNmaDJRb1U4eEhnYkhqMkFtanVYUitNQ1BOM2pScDM5UFM4bkZ5?=
 =?utf-8?B?RWIvdUp2UHZ5ekdORnBVTTJPOWs5THU0akxqZzQvd0NEeC9XVmw5dzUvR2hw?=
 =?utf-8?B?dkowdmhrbkxjSnFZTEpyZVI2bXV2U2hzTUNWNkR1dms5VE9hOXJvZlJJQzJx?=
 =?utf-8?B?M3dDQUhwWFczUk1USGt5NW9Lc29RTVZYSGVQUzBzREc4SnNzK05qdHd0V1dM?=
 =?utf-8?B?UUU2OU80UmwrTUIwQ29LTFRkYTZkajgrMU5wV2tIaVc1Y2pBdEc1L0Y4TktP?=
 =?utf-8?B?UWQ2RlRPa3VoNE0zL0tGSWVhSW9waGphNVdxTS9mTE5tc1RsajB2c3FNN2E5?=
 =?utf-8?B?dHlNMFlMMDVrUHp4bE05QXZ2ODFZc25ISXBnN242eCtrandEWVhyTktOaHpE?=
 =?utf-8?B?VDFsNWpyRzFwVkRIdWJ2SHZwMnkvUnlQRWNBYmVkZ2dhWUFtUmFIUTVMWDVU?=
 =?utf-8?B?ZHhlSVhEV1Z3TWpEcmVGRnExbmFXaG5QVzdHWGttWFdzQ0czNlpoWDZWL1Jx?=
 =?utf-8?B?K1NNUkY5YUtrU0Nnc0Qxb1RicVltOGEzbDJrYmJFS0hGbGNMcjlWODlDZ2tT?=
 =?utf-8?B?VVlkYk4vRCtPejVuWXhwOUdZTnJPVlNFS1dzeHE1VHFtTUMwUXhwSVhmZmZp?=
 =?utf-8?Q?LzKfUbdTd2zPA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce52a67-5136-4f68-fac7-08d8b96845a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 15:14:36.8105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsJr1bZhuMFvpAVSLGW3EEzIuZkNKXuk/yR8QqUt+l+2DQXA54pgV/xdsMl5bxl20HOxE3ng4zBex9DAdj1YEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1512
X-OriginatorOrg: intel.com

PiBGZWF0dXJlczoNCj4gDQo+IDEpIGFjcXVpcmVfcmVzb3VyY2UgZml4ZXMuDQo+IA0KPiBOb3Qg
cmVhbGx5IGEgbmV3IGZlYXR1cmUgLSBlbnRpcmVseSBidWdmaXhpbmcgYSBwcmVleGlzdGluZyBv
bmUuDQo+IERldmVsb3BlZCBieSBtZSB0byBoZWxwIDIpLsKgIFJlYXNvbmFibHkgd2VsbCBhY2tl
ZCwgYnV0IGF3YWl0aW5nIGZlZWRiYWNrDQo+IG9uIHYzLg0KPiANCj4gMikgRXh0ZXJuYWwgUHJv
Y2Vzc29yIFRyYWNlIHN1cHBvcnQuDQo+IA0KPiBEZXZlbG9wbWVudCBieSBNaWNoYcWCLsKgIERl
cGVuZHMgb24gMSksIGFuZCBhd2FpdGluZyBhIG5ldyB2ZXJzaW9uIGJlaW5nDQo+IHBvc3RlZC4N
Cj4gDQo+IEFzIGZhciBhcyBJJ20gYXdhcmUsIGJvdGggSW50ZWwgYW5kIENFUlQgaGF2ZSBwcm9k
dWN0aW9uIHN5c3RlbXMgZGVwbG95ZWQNCj4gdXNpbmcgdGhpcyBmdW5jdGlvbmFsaXR5LCBzbyBp
dCBpcyB2ZXJ5IGhpZ2hseSBkZXNpcmFibGUgdG8gZ2V0IGludG8gNC4xNS4NCg0KV2UgYXJlIGFj
dGl2ZWx5IHVzaW5nIGEgYmFja3BvcnRlZCB2ZXJzaW9uIG9uIHRvcCBvZiA0LjE0LjEsIGhhdmlu
ZyB0aGlzIGluIDQuMTUgd291bGQgYmUgYWJzb2x1dGVseSBodWdlLiBXZSd2ZSByYW4gb3ZlciAx
MCBiaWxsaW9uIGZ1enogY3ljbGVzIHVzaW5nIGl0IHNvIGZhciB1c2luZyBWTSBmb3Jrcywgd29y
a3MgZ3JlYXQuIFNldmVyYWwgb3RoZXIgcmVzZWFyY2hlcnMgaW4gdGhlIGNvbW11bml0eSBhcmUg
dXNpbmcgaXQgYXMgd2VsbC4NCg0KPiAxKSBIUEVUL1BJVCBpc3N1ZSBvbiBuZXdlciBJbnRlbCBz
eXN0ZW1zLsKgIFRoaXMgaGFzIGhhZCBsaXRlcmFsbHkgdGVucyBvZg0KPiByZXBvcnRzIGFjcm9z
cyB0aGUgZGV2ZWwgYW5kIHVzZXJzIG1haWxpbmcgbGlzdHMsIGFuZCBwcmV2ZW50cyBYZW4gZnJv
bQ0KPiBib290aW5nIGF0IGFsbCBvbiB0aGUgcGFzdCB0d28gZ2VuZXJhdGlvbnMgb2YgSW50ZWwg
bGFwdG9wLsKgIEkndmUgZmluYWxseSBnb3QgYQ0KPiByZXBybyBhbmQgcG9zdGVkIGEgZml4IHRv
IHRoZSBsaXN0LCBidXQgc3RpbGwgaW4gcHJvZ3Jlc3MuDQoNCldlJ3ZlIHJhbiBpbnRvIHRoaXMg
b24gbXVsdGlwbGUgc3lzdGVtcywgQW5kcmV3J3MgcGF0Y2ggZG9lcyBmaXggaXQuDQoNCj4gMikg
InNjaGVkdWxlciBicm9rZW4iIGJ1Z3MuwqAgV2UndmUgaGFkIDQgb3IgNSByZXBvcnRzIG9mIFhl
biBub3Qgd29ya2luZywNCj4gYW5kIHZlcnkgbGl0dGxlIGludmVzdGlnYXRpb24gb24gd2hhdHMg
Z29pbmcgb24uwqAgU3VzcGljaW9uIGlzIHRoYXQgdGhlcmUNCj4gbWlnaHQgYmUgdHdvIGJ1Z3Ms
IG9uZSB3aXRoIHNtdD0wIG9uIHJlY2VudCBBTUQgaGFyZHdhcmUsIGFuZCBvbmUNCj4gbW9yZSBn
ZW5lcmFsICJzb21lIHdvcmtsb2FkcyBjYXVzZSBuZWdhdGl2ZSBjcmVkaXQiIGFuZCBtaWdodCBv
ciBtaWdodA0KPiBub3QgYmUgc3BlY2lmaWMgdG8gY3JlZGl0MiAoZGVidWdnaW5nIGZlZWRiYWNr
IGRpZmZlcnMgLSBhbHNvIG1pZ2h0IGJlIDMNCj4gdW5kZXJseWluZyBpc3N1ZSkuDQoNCldlJ3Zl
IGFsc28gcmFuIGludG8gaW50ZXJtaXR0ZW50IFhlbiBsb2NrdXBzIHJlcXVpcmluZyBwb3dlci1j
eWNsaW5nIHNlcnZlcnMuIFdlIHN3aXRjaGVkIGJhY2sgdG8gY3JlZGl0MSBhbmQgaGFkIG5vIGlz
c3VlcyBzaW5jZS4gSGFyZCB0byB0ZWxsIGlmIGl0IHdhcyByZWxhdGVkIHRvIHRoZSBzY2hlZHVs
ZXIgb3IgdGhlIHBpbGUgb2Ygb3RoZXIgZXhwZXJpbWVudGFsIHN0dWZmIHdlIGFyZSBydW5uaW5n
IHdpdGggYnV0IHJpZ2h0IG5vdyB3ZSBoYXZlIHN0YWJsZSBzeXN0ZW1zIGFjcm9zcyB0aGUgYm9h
cmQgd2l0aCBjcmVkaXQxLg0KDQo+IA0KPiBBbGwgb2YgdGhlc2UgaGF2ZSBoYWQgcmVwZWF0ZWQg
YnVnIHJlcG9ydHMuwqAgSSdkIGNsYXNzaWZ5IHRoZW0gYXMgYmxvY2tlcnMsDQo+IGdpdmVuIHRo
ZSBpbXBhY3QgdGhleSdyZSBoYXZpbmcgb24gcGVvcGxlLg0KDQorMQ0KDQpUaGFua3MsDQpUYW1h
cw0K

