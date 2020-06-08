Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315521F15EA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 11:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiETz-0001ga-RD; Mon, 08 Jun 2020 09:54:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11Lh=7V=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jiETy-0001gV-Br
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 09:54:18 +0000
X-Inumbo-ID: 040945f4-a96e-11ea-b258-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 040945f4-a96e-11ea-b258-12813bfff9fa;
 Mon, 08 Jun 2020 09:54:17 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uciO5fGTX5/SSRaOQx6k1Ix5gzIBEzqMApsUZKz8y9iEr8T6UhYnhg6+DiAU9IMdy7irlH3r9R
 P1AMDtUHe/hs/e0LtOu4c6aUm2RyHHiRAIUg/cOL7WBIrnAU2YMCb0Tgr+jJsXMIpWKV7ZDeR4
 TJU+PC0Slo0fqxKSXqTM9ryu+0XGT3TjrNXjzX/xtwFY1x2yLUSPoQJC1cV+X7b6VtK2qnw7+N
 lrc+0NCN9qmeL5YgIgJ9UKE7B2iuTHbOdKNH8owvLoe8+PlsR6Uh+1V3GhU1ZGQ2OK93RDjBWa
 llE=
X-SBRS: 2.7
X-MesageID: 19456475
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19456475"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Thread-Topic: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Thread-Index: AQHWM6tS08XNp9FsPk2dfrAVrD4GiajIlOUAgAAecgCABblSgA==
Date: Mon, 8 Jun 2020 09:54:13 +0000
Message-ID: <DCC151DE-9CCD-43DA-97BA-F087EB4E80F3@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-2-george.dunlap@citrix.com>
 <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
 <20200604182938.GA10975@six>
In-Reply-To: <20200604182938.GA10975@six>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <26E84A4320E9F04FAB830579F9FF7872@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDQsIDIwMjAsIGF0IDc6MjkgUE0sIE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29r
bkBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4+IFRoZSBzaW1wbGVzdCBzaG9ydC10ZXJtIHdheSB0
byBmaXggdGhpcyB3b3VsZCBiZSB0byByZW1vdmUgdGhlIGBnbyBmbXRgIGNhbGwgZnJvbSBgZ2Vu
Z290eXBlcy5weWAuICBJdOKAmXMgYWN0dWFsbHkgcmVsYXRpdmVseSB1bnVzdWFsIGZvciBnZW5l
cmF0ZWQgY29kZSB0byBsb29rIHByZXR0eSAob3IgZXZlbiBiZSBsb29rZWQgYXQpLiAgV2UgY291
bGQgYWxzbyBjb25zaWRlciBhZGRpbmcgaW4gc29tZSDigJxtYW51YWzigJ0gZm9ybWF0dGluZyBp
biBnZW5nb3R5cGVzLnB5LCBsaWtlIGluZGVudGF0aW9uLCBzbyB0aGF0IGl0IGRvZXNu4oCZdCBs
b29rIHRvbyB0ZXJyaWJsZS4NCj4+IA0KPj4gTmljaywgZG8geW91IGhhdmUgdGltZSB0byB3b3Jr
IG9uIGEgcGF0Y2ggbGlrZSB0aGF0Pw0KPiANCj4gWWVzLCBJIGhhdmUgdGltZSB0byB3b3JrIG9u
IGEgcXVpY2sgcGF0Y2ggZm9yIHRoaXMuIEknbGwgc2VlIHdoYXQgaXQNCj4gd291bGQgdGFrZSB0
byBhZGQgYSBiaXQgb2YgYmFzaWMgbWFudWFsIGZvcm1hdHRpbmcsIGJ1dCBvZiBjb3Vyc2UgdGhl
DQo+IG9yaWdpbmFsIHB1cnBvc2Ugb2YgdXNpbmcgZ29mbXQgd2FzIHRvIGF2b2lkIHJlLWNyZWF0
aW5nIGZvcm1hdHRpbmcNCj4gbG9naWMuIEknbGwgbGlrZWx5IGp1c3QgcmVtb3ZlIHRoZSBjYWxs
IHRvIGdvIGZtdC4NCj4gDQo+IE91dCBvZiBjdXJpb3NpdHksIHdvdWxkIGl0IGJlIHRvdGFsbHkg
b3V0IG9mIHRoZSBxdWVzdGlvbiB0byByZXF1aXJlDQo+IGhhdmluZyBnb2ZtdCBpbnN0YWxsZWQg
KG5vdCBmb3IgNC4xNCwgYnV0IGluIHRoZSBmdXR1cmUpPyBJIGFzayBiZWNhdXNlDQo+IEkgaGF2
ZW4ndCBzZWVuIGl0IGRpc2N1c3NlZCBvbmUgd2F5IG9yIHRoZSBvdGhlci4NCg0KSSB0aGluayBJ
4oCZZCBsaWtlIHRvIHRyeSB0byBhdm9pZCBpdCwgdW5sZXNzIC8gdW50aWwgd2UgaGF2ZSBhIOKA
nGNvcmUgY29tcG9uZW504oCdIHdyaXR0ZW4gaW4gZ29sYW5nLiAgRm9yIG9uZSwgaWYgd2UgYWRk
ZWQgaXQgYXMgYSBjb3JlIGRlcGVuZGVuY3ksIHdl4oCZZCBuZWVkIHRvIGJlICBiYWNrd2FyZHMg
Y29tcGF0aWJsZSB0byB0aGUgb2xkZXN0IHZlcnNpb24gb2YgZ29sYW5nIG9mIGRpc3Ryb3Mgb24g
d2hpY2ggd2Ugd2FudCB0byBidWlsZDsgdGhhdCB3b3VsZCBpbmNsdWRlICBEZWJpYW4gb2xkc3Rh
YmxlLCBVYnVudHUgTFRTLCBwcm9iYWJseSBDZW50T1MgNyBhdCBsZWFzdCwgcG9zc2libHkgQ2Vu
dE9TIDYsIGFuZCBzbyBvbi4gIElmIGFueSBvZiB0aG9zZSBkaWRu4oCZdCBoYXZlIGdvbGFuZyBh
dmFpbGFibGUsIHRoZW4gd2XigJlkIGJhc2ljYWxseSBoYXZlIHRvIGRlY2lkZSBiZXR3ZWVuIGRy
b3BwaW5nIHN1cHBvcnQgZm9yIHRob3NlIGRpc3Ryb3MsIGFuZCBtYWtpbmcgZ29sYW5nIG9wdGlv
bmFsLg0KDQpJIGRvbuKAmXQgYXQgdGhlIG1vbWVudCBoYXZlIGEgZ29vZCBmZWVsIGZvciB3aGF0
IG90aGVyIHBlb3BsZSBpbiB0aGUgY29tbXVuaXR5IGZlZWwgYWJvdXQgdGhpcywgYnV0IGdlbmVy
YWxseSBzcGVha2luZyBiZWluZyBmYW5hdGljYWxseSBiYWNrd2FyZHMgY29tcGF0aWJsZSBpcyBh
biBpbnZlc3RtZW50IGluIHRoZSBsb25nLXRlcm0gZWNvc3lzdGVtOyBrZWVwaW5nIFhlbiAqYXMg
YSB3aG9sZSogYnVpbGRpbmcgb24gb2xkZXIgZGlzdHJvcyBpcyBhbiBleGFtcGxlIG9mIHRoYXQu
ICAoRldJVyBJIGRvbuKAmXQgdGhpbmsgd2UgaGF2ZSBhbiBvZmZpY2lhbCBydWJyaWMsIGJ1dCBt
eSBzdGFydGluZyBwb2ludCBpcyB0aGF0IHdlIHNob3VsZCB0cnkgdG8gYnVpbGQgb24gYWxsIHN0
aWxsLXN1cHBvcnRlZCBtYWpvciBkaXN0cm9zOyB0aGF0IHdvdWxkIGluY2x1ZGUgQ2VudE9TIDYg
dW50aWwgUTQgb2YgMjAyMCwgaWYgbXkgcXVpY2sgR29vZ2xlIHNlYXJjaCBpcyBjb3JyZWN0LikN
Cg0KT25lIGFkdmFudGFnZSBvZiBtYWtpbmcgZ29sYW5nIG9wdGlvbmFsIGlzIHRoYXQgd2UgZG9u
4oCZdCBoYXZlIHRvIGJlIHF1aXRlIHNvIGJhY2t3YXJkcyBjb21wYXRpYmxlIOKAlCB1cCB1bnRp
bCB3ZSBkZWNsYXJlIHRoZSBmZWF0dXJlIOKAnGZ1bGx5IHN1cHBvcnRlZOKAnSwgd2UgY2FuIG1v
dmUgdGhlIG1pbmltdW0gcmVxdWlyZWQgdmVyc2lvbiBmb3J3YXJkIGF0IHdpbGwgaWYgd2Ugd2Fu
dCB0byByZWx5IG9uIG5ldyBmZWF0dXJlcy4NCg0KIC1HZW9yZ2U=

