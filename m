Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E51E79E5
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:56:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebjz-0004d5-7n; Fri, 29 May 2020 09:55:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K2ub=7L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jebjy-0004cz-6V
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:55:50 +0000
X-Inumbo-ID: 927d5048-a192-11ea-a884-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 927d5048-a192-11ea-a884-12813bfff9fa;
 Fri, 29 May 2020 09:55:48 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: APnZCmYO1jHiQ2/5NGVObmdQqF1pqHQbm6o5GYuCIiegfTwXA22LRJ1aJj5icJvgnW/aBMX+r+
 RWYXaeivtT33PvrMNm+F+LOkD+fcAJMPrBc3yfKy79maqNvF0EFmSU2eKNn8IDnh/VrkIj2U+n
 OQGOJEcYWiYa/IHLNQGUKnk/xRmHTH2mnoEFyvloV4+H+61yGcGWlEl4HBrbDrMAKHU3gTYpUU
 ClynxUM4S6MAe74NSHoiuo0WxlwLFOGwHXJ/sfgkk0rWWrWylAVlyBDbb9WC0YFizk0OmKWvSr
 zCU=
X-SBRS: 2.7
X-MesageID: 18996183
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="18996183"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Topic: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Index: AQHWND0/xSJFUOR5YU28XikgbPuX46i7+DWAgAKqrACAABHAAA==
Date: Fri, 29 May 2020 09:55:44 +0000
Message-ID: <9A98D1CA-83E5-4E03-8ED6-E353653338CB@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <757d53a0-ec8f-62f1-ca20-72eaf9e1c84d@suse.com>
In-Reply-To: <757d53a0-ec8f-62f1-ca20-72eaf9e1c84d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4C8026B8615C34A912099095CD116CF@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "cjwatson@debian.org" <cjwatson@debian.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI5LCAyMDIwLCBhdCA5OjUyIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjcuMDUuMjAyMCAxODowOCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+PiBPbiBNYXkgMjcsIDIwMjAsIGF0IDQ6NDEgUE0sIElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToNCj4+PiAyLiBYZW4gc2hvdWxkIGRpc2FibGUg
dGhlIFhTTSBwb2xpY3kgYnVpbGQgd2hlbiBGTEFTSyBpcyBkaXNhYmxlZC4NCj4+PiBUaGlzIGlz
IHVuZm9ydHVuYXRlbHkgbm90IHNvIHNpbXBsZSBiZWNhdXNlIHRoZSBYU00gcG9saWN5IGJ1aWxk
IGlzIGENCj4+PiB0b29scyBvcHRpb24gYW5kIEZMQVNLIGlzIGEgWGVuIG9wdGlvbiBhbmQgdGhl
IGNvbmZpZ3VyYXRpb24gc3lzdGVtcw0KPj4+IGFyZSBkaXNqb2ludC4gIEJ1dCBhdCB0aGUgdmVy
eSBsZWFzdCBhIGRlZmF1bHQgYnVpbGQsIHdoaWNoIGhhcyBubyBYU00NCj4+PiBzdXBwb3J0LCBz
aG91bGQgbm90IGJ1aWxkIGFuIFhTTSBwb2xpY3kgZmlsZSBlaXRoZXIuDQo+PiANCj4+IEEgc2lt
cGxlIHRoaW5nIHRvIGRvIGhlcmUgd291bGQgYmUgdG8gaGF2ZSB0aGUgZmxhc2sgcG9saWN5IGNv
bnRyb2xsZWQgYnkgYSBjb25maWd1cmUgLS1mbGFzayBvcHRpb24uICBJZiBuZWl0aGVyIC0tZmxh
c2sgbm9yIC0tbm8tZmxhc2sgaXMgc3BlY2lmaWVkLCB3ZSBjb3VsZCBtYXliZSBoYXZlIGNvbmZp
Z3VyZSBhbHNvIGNoZWNrIHRoZSBjb250ZW50cyBvZiB4ZW4vLmNvbmZpZyB0byBzZWUgaWYgQ09O
RklHX1hTTV9GTEFTSyBpcyBlbmFibGVkPw0KPiANCj4gQnV0IHRoYXQncyBjcmVhdGluZyBhIGNo
aWNrZW4tYW5kLWVnZyBwcm9ibGVtOiBUaGVyZSdzIG5vIG9yZGVyaW5nDQo+IGJldHdlZW4gdGhl
IHRvb2xzLyBhbmQgeGVuLyBidWlsZHMuIHhlbi8gbWF5IG5vdCBiZSBidWlsdCBhdCBhbGwsDQo+
IGFuZCB0aGlzIGlzIGdvaW5nIHRvIGJlY29tZSBpbmNyZWFzaW5nbHkgbGlrZWx5IG9uY2UgdGhl
IHhlbi8gcGFydA0KPiBvZiB0aGUgdHJlZSBzdXBwb3J0cyBvdXQtb2YtdHJlZSBidWlsZHMgKGF0
IGxlYXN0IEknbGwgc3dpdGNoIG1vc3QNCj4gb2YgbXkgYnVpbGQgdHJlZXMgdG8gdGhhdCBtb2Rl
bCBhcyBzb29uIGFzIGl0J3MgYXZhaWxhYmxlKS4NCg0KRG8gb3V0LW9mLXRyZWUgYnVpbGRzIHB1
dCB0aGUgLmNvbmZpZyBvdXQgb2YgdHJlZSBhcyB3ZWxsPyAgSWYgc28sIHllcywgdGhhdCB3b3Vs
ZCBkZWZpbml0ZWx5IGxpbWl0IHRoZSB1c2VmdWxuZXNzIG9mIHRoaXMgaWRlYS4NCg0KTXkgc3Vn
Z2VzdGlvbiB3YXMgYmFzZWQgb24gdGhlIGlkZWEgdGhhdCBhIOKAnHR5cGljYWzigJ0gYnVpbGQg
KndoaWNoIG1pZ2h0IGVuYWJsZSBYU00qIHdvdWxkIGxvb2sgbGlrZSB0aGlzOg0KDQoxLiBSdW4g
4oCYbWFrZSBtZW51Y29uZmln4oCZIChvciBzb21ldGhpbmcgbGlrZSBpdCkgaW4geGVuLw0KDQoy
LiBSdW4gLi9jb25maWd1cmUgYXQgdGhlIHRvcGxldmVsDQoNCjMuIERvIHRoZSBmdWxsIGJ1aWxk
Lg0KDQpCdXQgbG9va2luZyBiYWNrIGF0IGl0LCB0aGVyZeKAmXMgbm8gcGFydGljdWxhciByZWFz
b24gdGhhdCBzb21lb25lIGNvbWluZyB0byBidWlsZCBYZW4gbWlnaHQgZXhwZWN0IHRvIGRvIHRo
aW5ncyBpbiB0aGF0IG9yZGVyIHJhdGhlciB0aGFuICMxLg0KDQpJdCBtaWdodCBtYWtlIHNlbnNl
IHRvIHNpbXBseSBkZWNsYXJlIHRoYXQgdGhlIHRvb2xzIGRlcGVuZCBvbiB0aGUgeGVuIGNvbmZp
ZywgYW5kIG1vZGlmeWluZyAuL2NvbmZpZ3VyZSB0byByZXByZXNlbnQgdGhhdDoNCg0KMS4gQWRk
IGEgYOKAlHhlbi1jb25maWc9YCBvcHRpb24gdG8gY29uZmlndXJlIHRlbGxpbmcgaXQgd2hlcmUg
dG8gbG9vayBmb3IgdGhlIHhlbiBjb25maWc7IGlmIHRoYXTigJlzIG5vdCBzcGVjaWZpZWQsIGxv
b2sgZm9yIGEgc3BlY2lmaWMgc2hlbGwgdmFyaWFibGUgc2F5aW5nIHdoZXJlIHRoZSBYZW4gdHJl
ZSBpczsgaWYgdGhhdOKAmXMgbm90IGF2YWlsYWJsZSwgbG9va2luZyBpbiB0aGUgY3VycmVudCB0
cmVlLg0KDQoyLiBIYXZlIC4vY29uZmlndXJlIGZhaWwgYnkgZGVmYXVsdCBpZiBpdCBjYW7igJl0
IGZpbmQgYSAuY29uZmlnLCB1bmxlc3Mg4oCUbm8teGVuLWNvbmZpZyBpcyBzcGVjaWZpZWQuDQoN
Cj4gRG8gd2UgcGVyaGFwcyBuZWVkIHRvIHJlc29ydCB0byBhIG1ha2UgY29tbWFuZCBsaW5lIG9w
dGlvbiwgdXNhYmxlDQo+IGF0IHRoZSB0b3AgbGV2ZWwgYXMgd2VsbCBhcyBmb3IgbWFqb3Igc3Vi
dHJlZSBidWlsZHMsIGFuZCBiZWluZw0KPiBob25vcmVkIChhcyBsb25nIGFzIHNldCBlaXRoZXIg
d2F5LCBmYWxsaW5nIGJhY2sgdG8gY3VycmVudA0KPiBiZWhhdmlvciBpZiB1bnNldCkgYnkgYm90
aCAuL2NvbmZpZ3VyZSBhbmQgdGhlIGh5cGVydmlzb3Incw0KPiBLY29uZmlnPw0KDQpXaGF0IGtp
bmQgb2YgY29tbWFuZC1saW5lIG9wdGlvbiBkaWQgeW91IGhhdmUgaW4gbWluZD8NCg0KIC1HZW9y
Z2U=

