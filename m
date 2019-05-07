Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488016473
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:20:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNzwh-000421-Mx; Tue, 07 May 2019 13:15:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eprW=TH=citrix.com=prvs=0232d1aa4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hNzwg-00041u-AI
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:15:46 +0000
X-Inumbo-ID: 37ed5f0b-70ca-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37ed5f0b-70ca-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 13:15:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="85212005"
To: Jan Beulich <JBeulich@suse.com>, Eslam Elnikety <elnikety@amazon.com>
References: <20190507113405.71851-1-elnikety@amazon.com>
 <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <c80dfae7-bb03-fe46-a51e-f3a552a2b327@citrix.com>
Date: Tue, 7 May 2019 14:15:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
Content-Language: en-US
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

T24gNS83LzE5IDE6MTEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA1LjE5IGF0
IDEzOjM0LCA8ZWxuaWtldHlAYW1hem9uLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jCj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+IEBAIC0yMTQs
NiArMjE0LDEwIEBAIGN1c3RvbV9wYXJhbSgiYm9vdHNjcnViIiwgcGFyc2VfYm9vdHNjcnViX3Bh
cmFtKTsKPj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9faW5pdGRhdGEgb3B0X2Jvb3RzY3J1Yl9j
aHVuayA9IE1CKDEyOCk7Cj4+ICBzaXplX3BhcmFtKCJib290c2NydWJfY2h1bmsiLCBvcHRfYm9v
dHNjcnViX2NodW5rKTsKPj4gIAo+PiArIC8qIHNjcnViLWRvbWhlYXAgLT4gRG9taGVhcCBwYWdl
cyBhcmUgc2NydWJiZWQgd2hlbiBmcmVlZCAqLwo+PiArc3RhdGljIGJvb2wgX19yZWFkX21vc3Rs
eSBvcHRfc2NydWJfZG9taGVhcDsKPj4gK2Jvb2xlYW5fcGFyYW0oInNjcnViLWRvbWhlYXAiLCBv
cHRfc2NydWJfZG9taGVhcCk7Cj4gCj4gVXBvbiAybmQgdGhvdWdodCB0aGlzLCBidHcsIHdvdWxk
IHNlZW0gdG8gYmUgYW4gZXhjZWxsZW50IGNhbmRpZGF0ZQo+IGZvciBiZWNvbWluZyBhIHJ1bnRp
bWUgcGFyYW1ldGVyLgo+IAo+PiBAQCAtMjM3OCw5ICsyMzgyLDEwIEBAIHZvaWQgZnJlZV9kb21o
ZWFwX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4+ICAg
ICAgICAgICAgICAvKgo+PiAgICAgICAgICAgICAgICogTm9ybWFsbHkgd2UgZXhwZWN0IGEgZG9t
YWluIHRvIGNsZWFyIHBhZ2VzIGJlZm9yZSBmcmVlaW5nIHRoZW0sCj4+ICAgICAgICAgICAgICAg
KiBpZiBpdCBjYXJlcyBhYm91dCB0aGUgc2VjcmVjeSBvZiB0aGVpciBjb250ZW50cy4gSG93ZXZl
ciwgYWZ0ZXIKPj4gLSAgICAgICAgICAgICAqIGEgZG9tYWluIGhhcyBkaWVkIHdlIGFzc3VtZSBy
ZXNwb25zaWJpbGl0eSBmb3IgZXJhc3VyZS4KPj4gKyAgICAgICAgICAgICAqIGEgZG9tYWluIGhh
cyBkaWVkIHdlIGFzc3VtZSByZXNwb25zaWJpbGl0eSBmb3IgZXJhc3VyZS4gV2UgZG8KPj4gKyAg
ICAgICAgICAgICAqIHNjcnViIHJlZ2FyZGxlc3MgaWYgb3B0aW9uIHNjcnViX2RvbWhlYXAgaXMg
c2V0Lgo+PiAgICAgICAgICAgICAgICovCj4+IC0gICAgICAgICAgICBzY3J1YiA9IGQtPmlzX2R5
aW5nIHx8IHNjcnViX2RlYnVnOwo+PiArICAgICAgICAgICAgc2NydWIgPSBkLT5pc19keWluZyB8
fCBzY3J1Yl9kZWJ1ZyB8fCBvcHRfc2NydWJfZG9taGVhcDsKPiAKPiBEaWQgeW91IGNvbnNpZGVy
IHNldHRpbmcgb3B0X3NjcnViX2RvbWhlYXAgd2hlbiBzY3J1Yl9kZWJ1ZyBpcwo+IHNldD8gVGhp
cyB3b3VsZCBzaG9ydGVuIHRoZSAocnVudGltZSkgY2FsY3VsYXRpb24gaGVyZSBieSBhIHRpbnkg
Yml0LAo+IGF0IHRoZSBwcmljZSBvZiBkb2luZyBvbmUgbW9yZSB0aGluZyBvbmNlIHdoaWxlIGJv
b3RpbmcuCgpKdXN0IGZvciBjbGFyaWZpY2F0aW9uIEphbiAtLSBkaWQgeW91IG1lYW4sICJJJ20g
aGFwcHkgZm9yIHRoaXMgdG8gZ28gaW4KYXMgaXQgaXMsIGJ1dCBpZiB5b3UgZmVlbCBsaWtlIGl0
LCBoZXJlIGFyZSB0d28gaW1wcm92ZW1lbnRzIj8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
