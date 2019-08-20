Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4695D2E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 13:24:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i02C4-0000iu-6v; Tue, 20 Aug 2019 11:20:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYQB=WQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i02C2-0000ip-1T
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 11:20:50 +0000
X-Inumbo-ID: 8fd7d460-c33c-11e9-8bf7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8fd7d460-c33c-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 11:20:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0846344;
 Tue, 20 Aug 2019 04:20:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1817E3F718;
 Tue, 20 Aug 2019 04:20:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-1-sstabellini@kernel.org>
 <7caa16d8-f8d6-eb7c-cc6a-2cdd0655a544@arm.com>
 <alpine.DEB.2.21.1908191654110.20094@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8234621c-ed62-c215-50b3-4583cba0bf0c@arm.com>
Date: Tue, 20 Aug 2019 12:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908191654110.20094@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/6] xen/arm: introduce handle_interrupts
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wOC8yMDE5IDAxOjExLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
RnJpLCA5IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZhbm8sCj4+Cj4+
IE9uIDA5LzA4LzIwMTkgMDA6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE1vdmUg
dGhlIGludGVycnVwdCBoYW5kbGluZyBjb2RlIG91dCBvZiBoYW5kbGVfZGV2aWNlIHRvIGEgbmV3
IGZ1bmN0aW9uCj4+PiBzbyB0aGF0IGl0IGNhbiBiZSByZXVzZWQgZm9yIGRvbTBsZXNzIFZNcyBs
YXRlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9z
QHhpbGlueC5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4gdjM6Cj4+PiAtIGFkZCBwYXRjaAo+
Pj4KPj4+IFRoZSBkaWZmIGlzIGhhcmQgdG8gcmVhZCBidXQgSSBqdXN0IG1vdmVkIHRoZSBpbnRl
cnJ1cHRzIHJlbGF0ZWQgY29kZQo+Pj4gZnJvbSBoYW5kbGVfZGV2aWNlcyB0byBhIG5ldyBmdW5j
dGlvbiBoYW5kbGVfaW50ZXJydXB0cywgYW5kIHZlcnkgbGl0dGxlCj4+PiBlbHNlLgo+Pj4gLS0t
Cj4+PiAgICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA3OSArKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9u
cygrKSwgMzAgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+Pj4gaW5kZXggNGM4
NDA0MTU1YS4uMDBkZGIzYjA1ZCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+PiBAQCAtMTIy
MCw0MSArMTIyMCwxOSBAQCBzdGF0aWMgaW50IF9faW5pdCBtYXBfZGV2aWNlX2NoaWxkcmVuKHN0
cnVjdCBkb21haW4KPj4+ICpkLAo+Pj4gICAgfQo+Pj4gICAgICAvKgo+Pj4gLSAqIEZvciBhIGdp
dmVuIGRldmljZSBub2RlOgo+Pj4gLSAqICAtIEdpdmUgcGVybWlzc2lvbiB0byB0aGUgZ3Vlc3Qg
dG8gbWFuYWdlIElSUSBhbmQgTU1JTyByYW5nZQo+Pj4gLSAqICAtIFJldHJpZXZlIHRoZSBJUlEg
Y29uZmlndXJhdGlvbiAoaS5lIGVkZ2UvbGV2ZWwpIGZyb20gZGV2aWNlIHRyZWUKPj4+IC0gKiBX
aGVuIHRoZSBkZXZpY2UgaXMgbm90IG1hcmtlZCBmb3IgZ3Vlc3QgcGFzc3Rocm91Z2g6Cj4+PiAt
ICogIC0gQXNzaWduIHRoZSBkZXZpY2UgdG8gdGhlIGd1ZXN0IGlmIGl0J3MgcHJvdGVjdGVkIGJ5
IGFuIElPTU1VCj4+PiAtICogIC0gTWFwIHRoZSBJUlFzIGFuZCBpb21lbSByZWdpb25zIHRvIERP
TTAKPj4+ICsgKiBSZXR1cm46Cj4+PiArICogICA8IDAgb24gZXJyb3IKPj4+ICsgKiAgIDAgICBv
biBubyBtYXBwaW5nIHJlcXVpcmVkCj4+PiArICogICAxICAgSVJRIG1hcHBpbmcgZG9uZQo+Pgo+
PiBUaGlzIGZlZWxzIGEgYml0IG9kZCB0byBkZXNjcmliZSB0aGUgcmV0dXJuIHZhbHVlIGFuZCBu
b3Qgd2hhdCB0aGUgZnVuY3Rpb24KPj4gZG9lcy4KPiAKPiBGYWlyIGVub3VnaCwgSSdsbCBhZGQg
YSBmZXcgd29yZHMuCj4gCj4gCj4+IEJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlvdSBuZWVk
IHRvIHRlbGwgdGhlIGNhbGxlciB3aGV0aGVyIG1hcHBpbmcgd2VyZQo+PiBkb25lIG9yIG5vdC4g
VGhpcyBpcyBhbHJlYWR5IGNvbnZleWVkIGJ5ICJuZWVkX21hcHBpbmciIHByb3ZpZGVkIGJ5IHRo
ZQo+PiBjYWxsZXIuCj4+Cj4+IExvb2tpbmcgYXQgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgeW91IG1h
a2UgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4gMCBhbmQgMQo+PiAocGF0Y2ggIzMpLCB5b3UgaGF2
ZQo+Pgo+PiArICAgICAgICAgICAgciA9IGhhbmRsZV9pbnRlcnJ1cHRzKGQsIG5vZGUsIHRydWUp
Owo+PiArICAgICAgICAgICAgaWYgKCByIDwgMCApCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJu
IHI7Cj4+ICsgICAgICAgICAgICBpZiAoIHIgPiAwICkKPj4gKyAgICAgICAgICAgIHsKPj4gICAg
ICAgICAgICAgICAgIC8qIGRvIHNvbWV0aGluZyAqLwo+PiArICAgICAgICAgICAgfQo+Pgo+Pgo+
PiBOb3QgbG9va2luZyBhdCB0aGUgY29kZSBiZWxvdyAod2hpY2ggbG9va3Mgd3JvbmcpLCBhcyB5
b3UgYWx3YXlzIHBhc3MgdHJ1ZQo+PiBoZXJlLCByIGNhbiBlaXRoZXIgYmUgYW4gZXJyb3Igb3Ig
MS4KPiAKPiBZZXMsIHRoZSByZXR1cm4gc3RhdGVtZW50IG9mIGhhbmRsZV9pbnRlcnJ1cHRzLCB0
aGUgd2F5IEkgd3JvdGUgaXQ6Cj4gCj4gICAgcmV0dXJuICEhKG5lZWRfbWFwcGluZyAmJiByZXMg
PT0gMCk7Cj4gCj4gaXMgd3JvbmcuIEknbGwgZml4IGl0IChhbHNvIHNlZSBiZWxvdykuCj4gCj4g
U3RlcHBpbmcgYmFjayBmcm9tIHRoaXMgc3BlY2lmaWMgZXJyb3IsIHRoZSByZWFzb24gdG8gZGlz
dGluZ3Vpc2gKPiB3aGV0aGVyIGEgbWFwcGluZyB3YXMgZG9uZSBvciBub3QgaXMgdG8gZmlndXJl
IG91dCB3aGV0aGVyIHdlIG5lZWQgdG8KPiBhZGQgYW4gaW50ZXJydXB0IHByb3BlcnR5IHRvIHRo
ZSBndWVzdCBkZXZpY2UgdHJlZS4gVGhlIGlkZWEgaXMgdGhlCj4gZm9sbG93aW5nOgo+IAo+IC0g
Y2FsbCBoYW5kbGVfaW50ZXJydXB0cyB0byBkbyBhbnkgcmVxdWlyZWQgaW50ZXJydXB0IG1hcHBp
bmdzCj4gLSBpZiBhbnkgbWFwcGluZ3MgYXJlIGRvbmUsIGNvcHkgb3ZlciB0aGUgaW50ZXJydXB0
cyBwcm9wZXJ0eSB0byB0aGUgZ3Vlc3QKPiAgICBkZXZpY2UgdHJlZQoKSSBkb24ndCB0aGluayB3
ZSBzaG91bGQgdHJlYXQgaW50ZXJydXB0cyBwcm9wZXJ0eSBkaWZmZXJlbnRseSBkZXBlbmRpbmcg
b24gd2hhdCAKd2FzIHJvdXRlZCB0by4KCkFzIEkgcG9pbnRlZCBvdXQgYmVmb3JlLCB5b3UgY291
bGQgZGVjaWRlIHRvIGdpdmUgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgKGFuZCAKYWxsIHRoZSBh
c3NvY2lhdGVkIGRldmljZXMpIHRvIHRoZSBndWVzdC4gVGhhdCBjb250cm9sbGVyIHdpbGwgdXNl
IGEgR0lDIAppbnRlcnJ1cHRzIGJ1dCBkZXZpY2VzIGJlaGluZCBpdCB3aWxsIG5vdC4KCldpdGgg
eW91ciBzdWdnZXN0aW9uIGhlcmUsIGFsbCB0aGUgZGV2aWNlcyB3aWxsIG5vdCBoYXZlIHRoZSAK
ImludGVycnVwdHMiLyJpbnRlcnJ1cHRzLWV4dGVuZGVkIiBwcm9wZXJ0eSBjb3BpZWQgb3Zlci4K
ClsuLi5dCgo+PiBCdXQgdGhpcyBsb29rcwo+PiBwcmV0dHkgd3JvbmcgYXMgeW91IHdvdWxkIHJl
dHVybiAwIHdoZW4gcmVzIGlzIG5vbi16ZXJvIChpLmUgYW4gZXJyb3IpIGFuZAo+PiBuZWVkX21h
cHBpbmcgaXMgdHJ1ZS4KPj4KPj4gQnV0IGxvb2tpbmcgYXQgdGhlIGNvZGUsIHJlcyBjYW5ub3Qg
YmUgMCBoZXJlLi4uIFNvIHdoeSBhcmUgeW91IGNoZWNraW5nICJyZXMiCj4+IGhlcmU/Cj4gCj4g
VGhhdCBpcyBhIG1pc3Rha2U6IGl0IHNob3VsZCByZXR1cm4gMSBvbmx5IHdoZW4gbWFwcGluZ3Mg
YXJlIGFjdHVhbGx5Cj4gZG9uZS4KClNlZSBhYm92ZS4KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
