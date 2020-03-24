Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB05190BD2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 12:02:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGhIP-0005vT-Gc; Tue, 24 Mar 2020 11:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jGhIO-0005vO-TB
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:00:32 +0000
X-Inumbo-ID: acf3b05a-6dbe-11ea-83c6-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acf3b05a-6dbe-11ea-83c6-12813bfff9fa;
 Tue, 24 Mar 2020 11:00:30 +0000 (UTC)
IronPort-SDR: /EYL+eWQknMF7KvmIWQ+zqJHmdby3dA+PKqXzqtdVvzhxWqVhu2IeFfkFIOQww61HURuRFiU3U
 ckXCs4r7MKVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 04:00:29 -0700
IronPort-SDR: VqyZA1FIz11PGD3Pzse/RD5ynbU/6iRMmw+QvcaO78md5XUFUJDz5PgTWHLxVyMH2kHMYDh6oR
 /enM83D9bh6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="240236554"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2020 04:00:29 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Mar 2020 04:00:29 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Mar 2020 04:00:29 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.232]) with mapi id 14.03.0439.000;
 Tue, 24 Mar 2020 19:00:25 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt injection
 when Ack on exit control is used"
Thread-Index: AQHV/urpGxanB9MUKkeByU3KdN9o6qhVUPKAgABvYICAAX4akP//pOaAgACQvkD//5stAIAAiaBw
Date: Tue, 24 Mar 2020 11:00:25 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E61A5@SHSMSX104.ccr.corp.intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-2-roger.pau@citrix.com>
 <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
 <20200323144837.GB24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5ADE@SHSMSX104.ccr.corp.intel.com>
 <3d0286dd-1702-e7dd-a0a1-795cbd54ccb3@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5D72@SHSMSX104.ccr.corp.intel.com>
 <20200324104720.GH24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200324104720.GH24458@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
VHVlc2RheSwgTWFyY2ggMjQsIDIwMjAgNjo0NyBQTQ0KPiANCj4gT24gVHVlLCBNYXIgMjQsIDIw
MjAgYXQgMDg6NDk6MjdBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gPiBTZW50OiBUdWVzZGF5LCBNYXJj
aCAyNCwgMjAyMCA0OjEwIFBNDQo+ID4gPg0KPiA+ID4gT24gMjQuMDMuMjAyMCAwNjo0MSwgVGlh
biwgS2V2aW4gd3JvdGU6DQo+ID4gPiA+PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCj4gPiA+ID4+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjMsIDIwMjAgMTA6
NDkgUE0NCj4gPiA+ID4+DQo+ID4gPiA+PiBPbiBNb24sIE1hciAyMywgMjAyMCBhdCAwOTowOTo1
OUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiA+ID4+PiBPbiAyMC4wMy4yMDIwIDIw
OjA3LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+ID4gPiA+Pj4+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgZjk2ZTE0NjlhZDA2YjYxNzk2YzYwMTkzZGFhZWI5ZjhhOTZkNzQ1OC4NCj4gPiA+ID4+Pj4N
Cj4gPiA+ID4+Pj4gVGhlIGNvbW1pdCBpcyB3cm9uZywgYXMgdGhlIHdob2xlIHBvaW50IG9mIG52
bXhfdXBkYXRlX2FwaWN2IGlzDQo+IHRvDQo+ID4gPiA+Pj4+IHVwZGF0ZSB0aGUgZ3Vlc3QgaW50
ZXJydXB0IHN0YXR1cyBmaWVsZCB3aGVuIHRoZSBBY2sgb24gZXhpdCBWTUVYSVQNCj4gPiA+ID4+
Pj4gY29udHJvbCBmZWF0dXJlIGlzIGVuYWJsZWQuDQo+ID4gPiA+Pj4+DQo+ID4gPiA+Pj4+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+
ID4gPj4+DQo+ID4gPiA+Pj4gQmVmb3JlIGFueW9uZSBnZXRzIHRvIGxvb2sgYXQgdGhlIG90aGVy
IHR3byBwYXRjaGVzLCBzaG91bGQgdGhpcw0KPiA+ID4gPj4+IGJlIHRocm93biBpbiByaWdodCBh
d2F5Pw0KPiA+ID4gPj4NCj4gPiA+ID4+IEkgd291bGQgbGlrZSBpZiBwb3NzaWJsZSBnZXQgYSBj
b25maXJtYXRpb24gZnJvbSBLZXZpbiAob3IgYW55b25lDQo+ID4gPiA+PiBlbHNlKSB0aGF0IG15
IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdC4gSSBmaW5kIHRoZSBuZXN0ZWQgY29kZSB2ZXJ5DQo+
ID4gPiA+PiBjb25mdXNpbmcsIGFuZCBJJ3ZlIGFscmVhZHkgbWFkZSBhIG1pc3Rha2Ugd2hpbGUg
dHJ5aW5nIHRvIGZpeCBpdC4NCj4gPiA+ID4+IFRoYXQgYmVpbmcgc2FpZCwgdGhpcyB3YXMgc3Bv
dHRlZCBieSBvc3N0ZXN0IGFzIGludHJvZHVjaW5nIGENCj4gPiA+ID4+IHJlZ3Jlc3Npb24sIHNv
IEkgZ3Vlc3MgaXQncyBzYWZlIHRvIGp1c3QgdG9zcyBpdCBpbiBub3cuDQo+ID4gPiA+Pg0KPiA+
ID4gPj4gRldJVyBwYXRjaCAyLzMgYXR0ZW1wdHMgdG8gcHJvdmlkZSBhIGRlc2NyaXB0aW9uIG9m
IG15DQo+IHVuZGVyc3RhbmRpbmcNCj4gPiA+ID4+IG9mIGhvdyBudm14X3VwZGF0ZV9hcGljdiB3
b3Jrcy4NCj4gPiA+ID4+DQo+ID4gPiA+DQo+ID4gPiA+IEkgZmVlbCBpdCBpcyBub3QgZ29vZCB0
byB0YWtlIHRoaXMgcGF0Y2ggYWxvbmUsIGFzIGl0IHdhcyBpbnRyb2R1Y2VkIHRvIGZpeA0KPiA+
ID4gPiBhbm90aGVyIHByb2JsZW0uIFcvbyB1bmRlcnN0YW5kaW5nIHdoZXRoZXIgdGhlIHdob2xl
IHNlcmllcyBjYW4NCj4gPiA+ID4gZml4IGJvdGggb2xkIGFuZCBuZXcgcHJvYmxlbXMsIHdlIG1h
eSByaXNrIHB1dHRpbmcgbmVzdGVkIGludGVycnVwdA0KPiA+ID4gPiBsb2dpYyBpbiBhbiBldmVu
IHdvcnNlIHN0YXRlLi4uDQo+ID4gPg0KPiA+ID4gV2VsbCwgb2theSwgSSdsbCB3YWl0IHRoZW4s
IGJ1dCBpdCB3b3VsZCBzZWVtIHRvIG1lIHRoYXQgcmV2ZXJ0aW5nDQo+ID4gPiB3b3VsZG4ndCBw
dXQgdXMgaW4gYSB3b3JzZSBzdGF0ZSB0aGFuIHdlIHdlcmUgaW4gYmVmb3JlIHRoYXQgY2hhbmdl
DQo+ID4gPiB3YXMgcHV0IGluLg0KPiA+DQo+ID4gUm9nZXIgbmVlZHMgdG8gbWFrZSB0aGUgY2Fs
bCwgaS5lLiB3aGljaCBwcm9ibGVtIGlzIG1vcmUgc2V2ZXJlLCBvbGQgb3INCj4gPiBuZXcgb25l
Lg0KPiANCj4gQUZBSUNUIHRob3NlIHByb2JsZW1zIGFmZmVjdCBkaWZmZXJlbnQga2luZCBvZiBo
YXJkd2FyZSwgc28gaXQgZG9lc24ndA0KPiBtYWtlIG11Y2ggZGlmZmVyZW5jZS4gSU1PIGY5NmUx
NDY5YWQwNmI2IHNob3VsZCBiZSByZXZlcnRlZCBiZWNhdXNlDQo+IGl0J3MgcGxhaW4gd3Jvbmcs
IGFuZCBhbGJlaXQgaXQgc2VlbWVkIHRvIGZpeCB0aGUgaXNzdWUgaW4gb25lIG9mIG15DQo+IGJv
eGVzIGl0IHdhcyBqdXN0IGx1Y2suDQo+IA0KPiBJIGRvbid0IHRoaW5rcyBpdCdzIGdvaW5nIHRv
IG1ha2UgbWF0dGVycyB3b3JzZSwgYXMgb3NzdGVzdCBpcyBhbHJlYWR5DQo+IGJsb2NrZWQsIGJ1
dCByZXZlcnRpbmcgaXQgYWxvbmUgd2l0aG91dCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIGlzIG5v
dA0KPiBnb2luZyB0byB1bmJsb2NrIG9zc3Rlc3QgZWl0aGVyLiBJZiB5b3UgYWdyZWUgaXQncyB3
cm9uZyBJIHRoaW5rIGl0DQo+IGNvdWxkIGdvIGluIG5vdywgZXZlbiBpZiBpdCdzIGp1c3QgdG8g
YXZvaWQgaGF2aW5nIHRvIHJlcG9zdCBpdCB3aXRoDQo+IG5ld2VyIHZlcnNpb25zIG9mIHRoZSBz
ZXJpZXMuDQo+IA0KDQp5ZXMsIEkgYWdyZWUgaXQncyB3cm9uZy4NCg0KUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K

