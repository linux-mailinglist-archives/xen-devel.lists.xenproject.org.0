Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C060E593
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 16:57:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7fG-0003L9-81; Mon, 29 Apr 2019 14:53:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL7fF-0003L4-Cs
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 14:53:53 +0000
X-Inumbo-ID: 97a6b488-6a8e-11e9-bb60-5fc1c7a04bc1
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97a6b488-6a8e-11e9-bb60-5fc1c7a04bc1;
 Mon, 29 Apr 2019 14:53:48 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 08:53:46 -0600
Message-Id: <5CC70FF7020000780022A0EF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 08:53:43 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190423142959.12609-1-aisaila@bitdefender.com>
In-Reply-To: <20190423142959.12609-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v6] x86/altp2m: Aggregate get entry and
 populate into common funcs
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA0LjE5IGF0IDE2OjMwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYwo+IEBAIC00NzgsNiArNDc4LDQzIEBAIHZvaWQgcDJtX3VubG9ja19hbmRfdGxiX2ZsdXNo
KHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4gICAgICAgICAgbW1fd3JpdGVfdW5sb2NrKCZwMm0t
PmxvY2spOwo+ICB9Cj4gIAo+ICtpbnQgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkoc3RydWN0
IHAybV9kb21haW4gKmFwMm0sIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcHJlcG9wdWxhdGUpCj4gK3sKPiArICAg
ICptZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgZ2ZuLCB0LCBhLCAwLCBOVUxMLCBOVUxMKTsK
PiArCj4gKyAgICAvKiBDaGVjayBob3N0IHAybSBpZiBubyB2YWxpZCBlbnRyeSBpbiBhbHRlcm5h
dGUgKi8KPiArICAgIGlmICggIW1mbl92YWxpZCgqbWZuKSAmJiAhcDJtX2lzX2hvc3RwMm0oYXAy
bSkgKQo+ICsgICAgewo+ICsgICAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpocDJtID0gcDJtX2dl
dF9ob3N0cDJtKGFwMm0tPmRvbWFpbik7Cj4gKyAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3Jk
ZXI7Cj4gKyAgICAgICAgaW50IHJjOwo+ICsKPiArICAgICAgICAqbWZuID0gX19nZXRfZ2ZuX3R5
cGVfYWNjZXNzKGhwMm0sIGdmbl94KGdmbiksIHQsIGEsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDAp
Owo+ICsKPiArICAgICAgICByYyA9IC1FU1JDSDsKPiArICAgICAgICBpZiAoICFtZm5fdmFsaWQo
Km1mbikgfHwgKnQgIT0gcDJtX3JhbV9ydyApCj4gKyAgICAgICAgICAgIHJldHVybiByYzsKPiAr
Cj4gKyAgICAgICAgLyogSWYgdGhpcyBpcyBhIHN1cGVycGFnZSwgY29weSB0aGF0IGZpcnN0ICov
Cj4gKyAgICAgICAgaWYgKCBwcmVwb3B1bGF0ZSAmJiBwYWdlX29yZGVyICE9IFBBR0VfT1JERVJf
NEsgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gfigo
MVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7Cj4gKyAgICAgICAgICAgIGdmbl90IGdmbl9hbGlnbmVk
ID0gX2dmbihnZm5feChnZm4pICYgbWFzayk7Cj4gKyAgICAgICAgICAgIG1mbl90IG1mbl9hbGln
bmVkID0gX21mbihtZm5feCgqbWZuKSAmIG1hc2spOwo+ICsKPiArICAgICAgICAgICAgcmMgPSBh
cDJtLT5zZXRfZW50cnkoYXAybSwgZ2ZuX2FsaWduZWQsIG1mbl9hbGlnbmVkLCBwYWdlX29yZGVy
LCAqdCwgKmEsIDEpOwo+ICsgICAgICAgICAgICBpZiAoIHJjICkKPiArICAgICAgICAgICAgICAg
IHJldHVybiByYzsKPiArICAgICAgICB9Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4g
K30KPiArCj4gKwo+ICBtZm5fdCBfX2dldF9nZm5fdHlwZV9hY2Nlc3Moc3RydWN0IHAybV9kb21h
aW4gKnAybSwgdW5zaWduZWQgbG9uZyBnZm5fbCwKPiAgICAgICAgICAgICAgICAgICAgICBwMm1f
dHlwZV90ICp0LCBwMm1fYWNjZXNzX3QgKmEsIHAybV9xdWVyeV90IHEsCj4gICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50ICpwYWdlX29yZGVyLCBib29sX3QgbG9ja2VkKQoKQ2FuIHlv
dSBwbGVhc2UgYXZvaWQgaW50cm9kdWNpbmcgZG91YmxlIGJsYW5rIGxpbmVzIGxpa2UgdGhpcz8K
KEVhc3kgZW5vdWdoIHRvIHRha2UgY2FyZSBvZiB3aGlsZSBjb21taXR0aW5nLCBvZiBjb3Vyc2Uu
KQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
