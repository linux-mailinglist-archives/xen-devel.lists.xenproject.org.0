Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A327BC1FD5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:13:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtab-0000jc-Tf; Mon, 30 Sep 2019 11:11:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEtaa-0000jX-Vy
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:11:37 +0000
X-Inumbo-ID: 10e3a132-e373-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 10e3a132-e373-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 11:11:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E911BAC7B;
 Mon, 30 Sep 2019 11:11:34 +0000 (UTC)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-11-wipawel@amazon.de>
 <90b08bae-c883-2809-84aa-8bc85a368c0f@suse.com>
 <3529C51E-EB3D-4746-AA4F-3DFFB51FFA85@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e68cd743-5f0f-25d9-a33c-eb1bf591d239@suse.com>
Date: Mon, 30 Sep 2019 13:11:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3529C51E-EB3D-4746-AA4F-3DFFB51FFA85@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 10/12] livepatch: Handle arbitrary size
 names with the list operation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Martin Pohlack <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMjo1OCwgIFdpZWN6b3JraWV3aWN6LCBQYXdlbCAgd3JvdGU6Cj4gCj4g
Cj4+IE9uIDMwLiBTZXAgMjAxOSwgYXQgMTA6NTAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDI4LjA5LjIwMTkgMTc6MTMsIFBhd2VsIFdpZWN6b3JraWV3
aWN6IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4+PiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPj4+IEBAIC05MjUsMTAgKzkyNSwxMSBAQCBz
dHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfZ2V0IHsKPj4+ICAqCj4+Pgo+IHNuaXAKPj4+ICAg
ICB1aW50MzJfdCBwYWQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogSU46IE11c3QgYmUg
emVyby4gKi8KPj4+ICsgICAgdWludDMyX3QgbmFtZV90b3RhbF9zaXplOyAgICAgICAgICAgICAg
IC8qIE9VVDogVG90YWwgc2l6ZSBvZiBhbGwgdHJhbnNmZXIgbmFtZXMgKi8KPj4+ICAgICBYRU5f
R1VFU1RfSEFORExFXzY0KHhlbl9saXZlcGF0Y2hfc3RhdHVzX3QpIHN0YXR1czsgIC8qIE9VVC4g
TXVzdCBoYXZlIGVub3VnaAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzcGFjZSBhbGxvY2F0ZSBmb3IgbnIgb2YgdGhlbS4gKi8KPj4+ICAgICBYRU5f
R1VFU1RfSEFORExFXzY0KGNoYXIpIG5hbWU7ICAgICAgICAgLyogT1VUOiBBcnJheSBvZiBuYW1l
cy4gRWFjaCBtZW1iZXIKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE1VU1QgWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkUgaW4gc2l6ZS4KPj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE11c3QgaGF2ZSBuciBv
ZiB0aGVtLiAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWF5IGhhdmUgYW4gYXJiaXRyYXJ5IGxlbmd0aCB1cCB0bwo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0xJVkVQQVRDSF9OQU1FX1NJ
WkUgYnl0ZXMuIE11c3QgaGF2ZQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbnIgb2YgdGhlbS4gKi8KPj4+ICAgICBYRU5fR1VFU1RfSEFORExFXzY0
KHVpbnQzMikgbGVuOyAgICAgICAgLyogT1VUOiBBcnJheSBvZiBsZW5ndGhzIG9mIG5hbWUncy4K
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTXVzdCBo
YXZlIG5yIG9mIHRoZW0uICovCj4+PiB9Owo+Pgo+PiBOb24tYmluYXJ5LWNvbXBhdGlibGUgY2hh
bmdlcyByZXF1aXJlIGFuIGludGVyZmFjZSB2ZXJzaW9uIGJ1bXAuCj4gCj4gVGhlIGJ1bXAgaGFw
cGVucyB3aXRoIHRoaXMgcGF0Y2ggb2YgdGhlIHBhdGNoc2V0Ogo+IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTExNjU0MjcvCj4gCj4+IEkgd29uZGVyIHRob3VnaCB3aHkgeW91
IGRvbid0IHVzZSB0aGUgInBhZCIgZmllbGQ7IGluIGZhY3QgdGhlCj4+IHdheSB5b3UgbWFrZSB0
aGUgY2hhbmdlIHlvdSdkIGhhdmUgdG8gaW50cm9kdWNlIGEgMm5kIHBhZGRpbmcKPj4gZmllbGQs
IHRvIG1ha2UgcGFkZGluZyBleHBsaWNpdCBfYW5kXyBjaGVjayBpdCdzIHplcm8gb24gaW5wdXQK
Pj4gKGZvciBmdXR1cmUgZXh0ZW5zaWJpbGl0eSBfd2l0aG91dF8gaGF2aW5nIHRvIGJ1bXAgdGhl
IGludGVyZmFjZQo+PiB2ZXJzaW9uKS4KPj4KPiAKPiBJIGRvIG5vdCB1c2UgdGhlIHBhZCBmaWVs
ZCBiZWNhdXNlIEkgaW50cm9kdWNlIGFub3RoZXIgZmllbGQgd2l0aCB0aGUKPiBuZXh0IHBhdGNo
IG9mIHRoZSBwYXRjaHNldDogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2
NTQzMy8KPiBUaGVuIEkgd291bGQgaGF2ZSB0byByZS1hZGQgdGhlIHBhZCBmaWVsZCBhZ2FpbiBJ
IHN1cHBvc2UuCgpZZXMgaW5kZWVkOyB0aGlzIG1heSBzZWVtIGEgbGl0dGxlIGN1bWJlcnNvbWUs
IGJ1dCB5b3Ugd2FudCB5b3VyCnNlcmllcyBzdHJ1Y3R1cmVkIHRoYXQgYSBsYXJnZSB0aW1lIGdh
cCBiZXR3ZWVuIGFueSB0d28gcGFydHMgb2YKd2hpY2ggaXMgbm90IGdvaW5nIHRvIHJlc3VsdCBp
biBub3Qgd2VsbCBmb3JtZWQgY29kZS4KCj4gQWxzbywgSSB3YXMgKGZhbHNlPykgaW1wcmVzc2lv
biB0aGF0IHRoZSBwYWQgZmllbGQgaXMgZGVkaWNhdGVkIHRvCj4gdGhlIGZ1dHVyZSBpbnB1dCBw
YXJhbWV0ZXJzLCBzbyBJIHNob3VsZCBub3QgdG91Y2ggaXQuCgpXaXRoIGl0cyBwYWRkaW5nIGZ1
bmN0aW9uIGl0J3MgSU4gb25seSAoYW5kIEkgYmVsaWV2ZSBpcyBiZWluZwpjaGVja2VkIHRvIGhh
dmUgYmVlbiBzZXQgdG8gemVybyBieSB0aGUgY2FsbGVyKS4gT25jZSBhc3NpZ25lZAphIG5ldyBw
dXJwb3NlLCBpdCBjYW4gYXMgd2VsbCBiZWNvbWUgT1VULCBwcm92aWRlZCB0aGUgcHJpb3IKbWVh
bmluZyBvZiB6ZXJvIGluIHRoZSBmaWVsZCBkb2Vzbid0IGhhdmUgYSBjaGFuY2Ugb2YgY29uZnVz
aW5nCmNhbGxlcnMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
