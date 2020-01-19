Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FC6141D6B
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 11:43:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it7zl-00015I-6u; Sun, 19 Jan 2020 10:39:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TAjJ=3I=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1it7zj-00015D-ER
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 10:39:51 +0000
X-Inumbo-ID: 02cf2ddd-3aa8-11ea-b83b-12813bfff9fa
Received: from fgw23-4.mail.saunalahti.fi (unknown [62.142.5.110])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02cf2ddd-3aa8-11ea-b83b-12813bfff9fa;
 Sun, 19 Jan 2020 10:39:47 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by fgw23.mail.saunalahti.fi (Halon) with ESMTP
 id 026f0fc6-3aa8-11ea-90c5-005056bdfda7;
 Sun, 19 Jan 2020 12:39:46 +0200 (EET)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id 7B65B36C0F6; Sun, 19 Jan 2020 12:39:45 +0200 (EET)
Date: Sun, 19 Jan 2020 12:39:45 +0200
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200119103945.GN21578@reaktio.net>
References: <20200104010759.GA2507@mail-itl>
 <ee338bbe-647e-36c9-a22e-8a082f97b08c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee338bbe-647e-36c9-a22e-8a082f97b08c@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBNb24sIEphbiAwNiwgMjAyMCBhdCAwMjowNjoxNFBNICswMTAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiBPbiAwNC4wMS4yMDIwIDAyOjA3LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgIHdyb3RlOgo+ID4gSSBoYXZlIGEgbXVsdGktZnVuY3Rpb24gUENJIGRldmljZSwgYmVoaW5k
IGEgUENJIGJyaWRnZSwgdGhhdCBub3JtYWxseQo+ID4gSSBhc3NpZ24gdG8gYSBzaW5nbGUgZG9t
YWluLiBCdXQgbm93IGl0IGZhaWxzIHdpdGg6Cj4gPiAKPiA+IChYRU4pIFtWVC1EXWQxNDogMDAw
MDowNDowMC4wIG93bmVkIGJ5IGQwITxHPjwwPmFzc2lnbiAwMDAwOjA1OjAwLjAgdG8gZG9tMTQg
ZmFpbGVkICgtMjIpCj4gCj4gSSd2ZSB0cmllZCB0aGlzIG91dCBpbiBhcyBjbG9zZSBhIHNldHVw
IGFzIEkgY291bGQgYXJyYW5nZSBmb3IsIGJ1dAo+IG5vdCBvbmUgbWF0Y2hpbmcgeW91ciBzY2Vu
YXJpby4gSSBkaWRuJ3QgZmluZCBhIHN5c3RlbSB3aXRoIGEKPiBzdWl0YWJseSBwbGFjZWQgKGlu
IHRoZSB0b3BvbG9neSkgbXVsdGktZnVuY3Rpb24gZGV2aWNlIChoYWQgdG8gdXNlCj4gYSBzaW5n
bGUtZnVuY3Rpb24gb25lKSwgYW5kIG9mIGNvdXJzZSBJIGRpZCB0aGlzIG9uIChjbG9zZSB0bykK
PiBtYXN0ZXIuIE5vIGFub21hbGllcy4gSGVuY2UgSSB3b25kZXIgd2hldGhlciBlaXRoZXIgb2Yg
dGhlIHR3bwo+IGRpZmZlcmVuY2VzIG1lbnRpb25lZCBtYXR0ZXJzLCBhbmQgLSBpZiwgYXMgSSBz
dXNwZWN0LCBpdCdzIHRoZQo+IG11bHRpLWZ1bmN0aW9uIGFzcGVjdCB0aGF0IGlzIHJlbGV2YW50
IGhlcmUgLSBob3cgdGhpbmdzIHdvdWxkIGhhdmUKPiB3b3JrZWQgYXQgYWxsIGJlZm9yZSB0aG9z
ZSByZWNlbnQgY2hhbmdlcy4gVGhpcyBpcyBiZWNhdXNlIEkgdGhpbmsKPiB5b3Ugc2hvdWxkIGhh
dmUgaGl0IHRoZSBzYW1lIGVycm9yIHBhdGggZXZlbiBiZWZvcmUsIGFuZCBpdCB3b3VsZAo+IHNl
ZW0gdG8gbWUgdGhhdCB0aGUgcGF0Y2ggYmVsb3cgbWlnaHQgYmUgKGFuZCBoYXZlIGJlZW4pIG5l
ZWRlZC4KPiAKCkkgdGhpbmsgTWFyZWsgY29uZmlybWVkIGluIHRoZSBvdGhlciBtYWlsIHRoYXQg
dGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUuCgpBcmUgeW91IHBsYW5uaW5nIHRvIG1lcmdlIHRo
aXMgcGF0Y2g/CgoKVGhhbmtzLAoKLS0gUGFzaQoKPiBKYW4KPiAKPiAtLS0gdW5zdGFibGUub3Jp
Zy94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ICsrKyB1bnN0YWJsZS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+IEBAIC0xNTA1LDcgKzE1MDUsNyBAQCBz
dGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X21hcHBpbmcoc3RydWN0Cj4gICAgICAgICAgICAgIGJy
ZWFrOwo+ICAKPiAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZShkb21h
aW4sIGRyaGQtPmlvbW11LCBidXMsIGRldmZuLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBjaV9nZXRfcGRldihzZWcsIGJ1cywgZGV2Zm4pKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsKPiAgCj4gICAgICAgICAg
LyoKPiAgICAgICAgICAgKiBEZXZpY2VzIGJlaGluZCBQQ0llLXRvLVBDSS9QQ0l4IGJyaWRnZSBt
YXkgZ2VuZXJhdGUgZGlmZmVyZW50Cj4gQEAgLTE1MTUsNyArMTUxNSw3IEBAIHN0YXRpYyBpbnQg
ZG9tYWluX2NvbnRleHRfbWFwcGluZyhzdHJ1Y3QKPiAgICAgICAgICBpZiAoICFyZXQgJiYgcGRl
dl90eXBlKHNlZywgYnVzLCBkZXZmbikgPT0gREVWX1RZUEVfUENJZTJQQ0lfQlJJREdFICYmCj4g
ICAgICAgICAgICAgICAoc2VjYnVzICE9IHBkZXYtPmJ1cyB8fCBwZGV2LT5kZXZmbiAhPSAwKSAp
Cj4gICAgICAgICAgICAgIHJldCA9IGRvbWFpbl9jb250ZXh0X21hcHBpbmdfb25lKGRvbWFpbiwg
ZHJoZC0+aW9tbXUsIHNlY2J1cywgMCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGNpX2dldF9wZGV2KHNlZywgc2VjYnVzLCAwKSk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOwo+ICAKPiAgICAgICAg
ICBicmVhazsKPiAgCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
