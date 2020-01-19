Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDD141B23
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 03:13:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it01f-0001ia-IZ; Sun, 19 Jan 2020 02:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxl7=3I=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1it01d-0001iV-OC
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 02:09:17 +0000
X-Inumbo-ID: b05d0052-3a60-11ea-9fd7-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b05d0052-3a60-11ea-9fd7-bc764e2007e4;
 Sun, 19 Jan 2020 02:09:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 18:09:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="227836475"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 18 Jan 2020 18:09:12 -0800
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 18:09:12 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 18:09:12 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.39]) with mapi id 14.03.0439.000;
 Sun, 19 Jan 2020 10:09:10 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH] x86/EPT: adjustments for redundant function arguments
Thread-Index: AQHVt0DK74B2EDeD8kGe0RYaBZctdKfCjnCAgAAEGwCAAASrgIAAARWAgC7TxRA=
Date: Sun, 19 Jan 2020 02:09:09 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D739A07@SHSMSX104.ccr.corp.intel.com>
References: <8b611419-a0c7-743f-fec4-f02a04caf114@suse.com>
 <17723247-f12e-5a43-836b-6aff95a93ab1@citrix.com>
 <ab5cd434-0c9a-ca6e-f615-eea57ae40853@suse.com>
 <3b3cb270-7dfe-2f7b-bafc-48a30db12d55@citrix.com>
 <67acfb06-c095-9e8e-89f2-51cb16baabdd@suse.com>
In-Reply-To: <67acfb06-c095-9e8e-89f2-51cb16baabdd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzkxM2Y2YTktZjMxMS00MjZjLTg4YjYtMWQzYzEyYTg5MzlhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZFlRb1hnOG1xUm1ITTVtM2xWUTlkMkFJaW9TcThzK0tRVnRkWnJHM1RWXC9qXC9Cd0V6dFViXC9DQ2hqaWJaOGlXXC8ifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/EPT: adjustments for redundant function
 arguments
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RGVjZW1iZXIgMjAsIDIwMTkgMTE6MDIgUE0NCj4gDQo+IE9uIDIwLjEyLjIwMTkgMTU6NTgsIEdl
b3JnZSBEdW5sYXAgd3JvdGU6DQo+ID4gT24gMTIvMjAvMTkgMjo0MSBQTSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+ID4+IE9uIDIwLjEyLjIwMTkgMTU6MjYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+
ID4+PiBPbiAxMi8yMC8xOSAyOjIxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+PiBJbiBl
cHRfcDJtX3R5cGVfdG9fZmxhZ3MoKSBwYXNzaW5nIGluIHR5cGUgYW5kIGFjY2VzcyBhcyBzZXBh
cmF0ZQ0KPiA+Pj4+IHBhcmFtZXRlcnMgY2FuIGJlIGNvbnNpZGVyZWQgYW4gb3B0aW1pemF0aW9u
LCBhcyBhbGwgY2FsbGVycyBzZXQgdGhlDQo+ID4+Pj4gcmVzcGVjdGl2ZSBmaWVsZHMgaW4gdGhl
IGVudHJ5IGJlaW5nIHVwZGF0ZWQgYmVmb3JlIHRoZSBjYWxsLiBSZXRhaW4NCj4gPj4+PiB0aGlz
IGJlaGF2aW9yIGJ1dCBhZGQgYXNzZXJ0aW9ucy4NCj4gPj4+Pg0KPiA+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+DQo+ID4+PiBJbiB3aGF0
IHdheSBpcyBpdCBhbiBvcHRpbWl6YXRpb24/DQo+ID4+DQo+ID4+IFRoZXJlJ3Mgbm8gcG9pbnRl
ciBkZS1yZWYgbmVlZGVkOyB0aGUgdmFsdWVzIHdpbGwgYWxyZWFkeSBjb21lIGluDQo+ID4+IHZp
YSByZWdpc3RlcnMuIEFuZCAiY2FuIGJlIGNvbnNpZGVyZWQiIGJlY2F1c2UgcG9zc2libHkgc29t
ZQ0KPiA+PiBjb21waWxlcnMgYXJlIHNtYXJ0IGVub3VnaCB0byBlbGltaW5hdGUgdGhlIHBvaW50
ZXIgZGUtcmVmIGFnYWluDQo+ID4+IChidXQgdGhlbiBpdCdsbCBzdGlsbCBiZSBhIGJpdGZpZWxk
IGV4dHJhY3QsIHdoaWNoIGNhbGxlcnMgbWF5DQo+ID4+IGJlIGFibGUgdG8gYXZvaWQpLg0KPiA+
DQo+ID4gUmlnaHQ7IG9uIHRoZSB3aG9sZSBJJ2QgcmF0aGVyIGxldCBjb21waWxlcnMgZG8gdGhp
cyBzb3J0IG9mDQo+ID4gbWljcm8tb3B0aW1pemF0aW9uLCBhbmQgb25seSBkbyB0aGlzICJtYW51
YWwiIHNvcnQgb2Ygb3B0aW1pemF0aW9uIHdpdGgNCj4gPiBzb21lIHNvcnQgb2YgYmVuY2htYXJr
cyBzaG93aW5nIHRoYXQgaXMgaGFzIHNvbWUga2luZCBvZiBlZmZlY3QuDQo+ID4NCj4gPj4NCj4g
Pj4+IEkgZG9uJ3QgbmVjZXNzYXJpbHkgb3Bwb3NlIHRoaXMsIGJ1dCBnaXZlbiB0aGF0IDMgb2Yg
dGhlIDQgY2FsbGVycw0KPiA+Pj4gbGl0ZXJhbGx5IGRvIHNvbWV0aGluZyBsaWtlOg0KPiA+Pj4N
Cj4gPj4+ICAgICBlcHRfcDJtX3R5cGVfdG9fZmxhZ3MocDJtLCAmZSwgZS5zYV9wMm10LCBlLmFj
Y2Vzcyk7DQo+ID4+Pg0KPiA+Pj4gSXQgc2VlbXMgbGlrZSBqdXN0IGdldHRpbmcgcmlkIG9mIHRo
ZSBleHRyYW5lb3VzIGFyZ3VtZW50cyBtaWdodCBhIGJlDQo+ID4+PiBiZXR0ZXIgb3B0aW9uLg0K
PiA+Pg0KPiA+PiBUaGF0IHdhcyBteSBvcmlnaW5hbCBpbnRlbnRpb24gYXMgd2VsbCwgYnV0IGlp
cmMgQW5kcmV3IGRpZG4ndCBsaWtlDQo+ID4+IGl0IHdoZW4gd2UgZGlzY3Vzc2VkIGl0IGJhY2sg
dGhlbiAodGhlIGNvbnRleHQgaGVyZSBiZWluZyBYU0EtMzA0KS4NCj4gPg0KPiA+IEkgZGlkIGEg
cXVpY2sgc2tpbSB0aHJvdWdoIHRob3NlIHRocmVhZHMgYW5kIGNvdWxkbid0IGZpbmQgYW55IGNv
bW1lbnQNCj4gPiBvbiB0aGlzIGlzc3VlLiAgQ291bGQgeW91IHBvaW50IG1lIHRvIHRoZSBtYWls
IHdpdGggaXQ/ICAoT3IgQW5keSwgd291bGQNCj4gPiB5b3UgY2FyZSB0byByZXBlYXQgeW91ciBh
cmd1bWVudD8pDQo+IA0KPiBJIGd1ZXNzIGl0IG1heSBoYXZlIGJlZW4gYW4gaXJjIGRpc2N1c3Np
b24sIHF1aXRlIHBvc3NpYmx5IGV2ZW4NCj4gYSBwcml2YXRlIG9uZSBiZXR3ZWVuIGhpbSBhbmQg
bWUuDQo+IA0KPiA+IFVsdGltYXRlbHkgdGhlIHBhdGNoIGFzIGl0IHN0YW5kcyBpcyBvbmx5IG1h
a2luZyB0aGUgZXhpc3RpbmcgY29kZQ0KPiA+IHNhZmVyLCBzbyBJJ20gT0sgd2l0aCBnaXZpbmcg
aXQgbXkgQWNrIGlmIHlvdSBkb24ndCB3YW50IHRvIHB1cnN1ZSB0aGUNCj4gPiBvdGhlciBvcHRp
b247IGJ1dCBJJ2QgcHJlZmVyIHRyeWluZyB0byB1bmRlcnN0YW5kIGFuZCBwb3RlbnRpYWxseQ0K
PiA+IGltcHJvdmUgdGhpbmdzIHdoaWxlIHdlJ3JlIGF0IGl0LiAgKEFuZCBpZiB0aGVyZSAqaXMq
IGEgZ29vZCByZWFzb24gZm9yDQo+ID4gcGFzc2luZyBpbiBwYXJhbGxlbCBwYXJhbWV0ZXJzLCBp
dCB3b3VsZCBiZSBnb29kIHRvIHJlY29yZCBpdCBpbiBhDQo+ID4gY29tbWVudCBzbyB3ZSBkb24n
dCBoYXZlIHRoaXMgY29udmVyc2F0aW9uIGFnYWluIGluIDMgeWVhcnMnIHRpbWUuKQ0KPiANCj4g
SSdkIGJlIGhhcHB5IHRvIGdvIHRoZSBvdGhlciByb3V0ZSAtIGFzIHNhaWQsIHRoYXQncyB3aGF0
IEkgaGFkDQo+IGluaXRpYWxseS4NCj4gDQoNCkNhbiBBbmRyZXcgY2hpbWUgaW4gZm9yIGhpcyBj
b25jZXJuIG9uIHRoaXMgYXBwcm9hY2g/DQoNClRoYW5rcw0KS2V2aW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
