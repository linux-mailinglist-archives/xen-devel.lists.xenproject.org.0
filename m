Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E8C1653B
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:57:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO0ZK-0008JG-T3; Tue, 07 May 2019 13:55:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hO0ZK-0008JA-7A
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:55:42 +0000
X-Inumbo-ID: c6beef78-70cf-11e9-881e-3348ae07e7ef
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6beef78-70cf-11e9-881e-3348ae07e7ef;
 Tue, 07 May 2019 13:55:31 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 07:55:30 -0600
Message-Id: <5CD18E4F020000780022C87A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 07:55:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Eslam Elnikety" <elnikety@amazon.com>,<george.dunlap@citrix.com>
References: <20190507113405.71851-1-elnikety@amazon.com>
 <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
 <c80dfae7-bb03-fe46-a51e-f3a552a2b327@citrix.com>
In-Reply-To: <c80dfae7-bb03-fe46-a51e-f3a552a2b327@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] mm: option to _always_ scrub freed
 domheap pages
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDE1OjE1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzcvMTkgMToxMSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA3LjA1
LjE5IGF0IDEzOjM0LCA8ZWxuaWtldHlAYW1hem9uLmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+
IEBAIC0yMTQsNiArMjE0LDEwIEBAIGN1c3RvbV9wYXJhbSgiYm9vdHNjcnViIiwgcGFyc2VfYm9v
dHNjcnViX3BhcmFtKTsKPj4+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXRkYXRhIG9wdF9i
b290c2NydWJfY2h1bmsgPSBNQigxMjgpOwo+Pj4gIHNpemVfcGFyYW0oImJvb3RzY3J1Yl9jaHVu
ayIsIG9wdF9ib290c2NydWJfY2h1bmspOwo+Pj4gIAo+Pj4gKyAvKiBzY3J1Yi1kb21oZWFwIC0+
IERvbWhlYXAgcGFnZXMgYXJlIHNjcnViYmVkIHdoZW4gZnJlZWQgKi8KPj4+ICtzdGF0aWMgYm9v
bCBfX3JlYWRfbW9zdGx5IG9wdF9zY3J1Yl9kb21oZWFwOwo+Pj4gK2Jvb2xlYW5fcGFyYW0oInNj
cnViLWRvbWhlYXAiLCBvcHRfc2NydWJfZG9taGVhcCk7Cj4+IAo+PiBVcG9uIDJuZCB0aG91Z2h0
IHRoaXMsIGJ0dywgd291bGQgc2VlbSB0byBiZSBhbiBleGNlbGxlbnQgY2FuZGlkYXRlCj4+IGZv
ciBiZWNvbWluZyBhIHJ1bnRpbWUgcGFyYW1ldGVyLgo+PiAKPj4+IEBAIC0yMzc4LDkgKzIzODIs
MTAgQEAgdm9pZCBmcmVlX2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2ln
bmVkIGludCBvcmRlcikKPj4+ICAgICAgICAgICAgICAvKgo+Pj4gICAgICAgICAgICAgICAqIE5v
cm1hbGx5IHdlIGV4cGVjdCBhIGRvbWFpbiB0byBjbGVhciBwYWdlcyBiZWZvcmUgZnJlZWluZyB0
aGVtLAo+Pj4gICAgICAgICAgICAgICAqIGlmIGl0IGNhcmVzIGFib3V0IHRoZSBzZWNyZWN5IG9m
IHRoZWlyIGNvbnRlbnRzLiBIb3dldmVyLCBhZnRlcgo+Pj4gLSAgICAgICAgICAgICAqIGEgZG9t
YWluIGhhcyBkaWVkIHdlIGFzc3VtZSByZXNwb25zaWJpbGl0eSBmb3IgZXJhc3VyZS4KPj4+ICsg
ICAgICAgICAgICAgKiBhIGRvbWFpbiBoYXMgZGllZCB3ZSBhc3N1bWUgcmVzcG9uc2liaWxpdHkg
Zm9yIGVyYXN1cmUuIFdlIGRvCj4+PiArICAgICAgICAgICAgICogc2NydWIgcmVnYXJkbGVzcyBp
ZiBvcHRpb24gc2NydWJfZG9taGVhcCBpcyBzZXQuCj4+PiAgICAgICAgICAgICAgICovCj4+PiAt
ICAgICAgICAgICAgc2NydWIgPSBkLT5pc19keWluZyB8fCBzY3J1Yl9kZWJ1ZzsKPj4+ICsgICAg
ICAgICAgICBzY3J1YiA9IGQtPmlzX2R5aW5nIHx8IHNjcnViX2RlYnVnIHx8IG9wdF9zY3J1Yl9k
b21oZWFwOwo+PiAKPj4gRGlkIHlvdSBjb25zaWRlciBzZXR0aW5nIG9wdF9zY3J1Yl9kb21oZWFw
IHdoZW4gc2NydWJfZGVidWcgaXMKPj4gc2V0PyBUaGlzIHdvdWxkIHNob3J0ZW4gdGhlIChydW50
aW1lKSBjYWxjdWxhdGlvbiBoZXJlIGJ5IGEgdGlueSBiaXQsCj4+IGF0IHRoZSBwcmljZSBvZiBk
b2luZyBvbmUgbW9yZSB0aGluZyBvbmNlIHdoaWxlIGJvb3RpbmcuCj4gCj4gSnVzdCBmb3IgY2xh
cmlmaWNhdGlvbiBKYW4gLS0gZGlkIHlvdSBtZWFuLCAiSSdtIGhhcHB5IGZvciB0aGlzIHRvIGdv
IGluCj4gYXMgaXQgaXMsIGJ1dCBpZiB5b3UgZmVlbCBsaWtlIGl0LCBoZXJlIGFyZSB0d28gaW1w
cm92ZW1lbnRzIj8KClllcyAobWF5YmUgIkknZCBwcmVmZXIiIHRvIHJlcGxhY2UgImlmIHlvdSBm
ZWVsIGxpa2UgaXQiKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
