Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D07882C5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9mO-0005SJ-Kc; Fri, 09 Aug 2019 18:38:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw9mM-0005SC-U8
 for xen-devel@lists.xen.org; Fri, 09 Aug 2019 18:38:18 +0000
X-Inumbo-ID: d9f03f9e-bad4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d9f03f9e-bad4-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 18:38:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 332E31596;
 Fri,  9 Aug 2019 11:38:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 648DD3F694;
 Fri,  9 Aug 2019 11:38:15 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-6-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fb766c97-1992-e8e6-5963-c9ac5eaa44ad@arm.com>
Date: Fri, 9 Aug 2019 19:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808231242.26424-6-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 6/6] xen/arm: add dom0less device
 assignment info to docs
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
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCkkgZmlndXJlZCBvdXQgSSBtYXkgd2FudCB0byByZWFkIHRoZSBkb2NzIGJl
Zm9yZSBsb29raW5nIGF0IHRoZSBjb2RlIDopLgoKT24gMDkvMDgvMjAxOSAwMDoxMiwgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3RlZmFub3NAeGlsaW54LmNvbT4KPiAKPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gYWRkIG5y
X3NwaXMKPiAtIGNoYW5nZSBkZXNjcmlwdGlvbiBvZiBpbnRlcnJ1cHRzIGFuZCBpbnRlcnJ1cHQt
cGFyZW50Cj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIGRldmljZSB0cmVlIGZyYWdtZW50IGxvYWRl
ZCBpbiBjYWNoZWFibGUgbWVtb3J5Cj4gLSByZW5hbWUgbXVsdGlib290LGR0YiB0byBtdWx0aWJv
b3QsZGV2aWNlLXRyZWUKPiAtIHJlbmFtZSAicGF0aCIgdG8gInhlbixwYXRoIgo+IC0gYWRkIGEg
bm90ZSBhYm91dCBkZXZpY2UgbWVtb3J5IG1hcHBpbmcKPiAtIGludHJvZHVjZSB4ZW4scmVnCj4g
LSBzcGVjaWZ5IG9ubHkgdGhlIEdJQyBpcyBzdXBwb3J0ZWQKPiAtLS0KPiAgIGRvY3MvbWlzYy9h
cm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAxMTcgKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0IGIvZG9jcy9taXNjL2FybS9k
ZXZpY2UtdHJlZS9ib290aW5nLnR4dAo+IGluZGV4IDMxN2E5ZTk2MmEuLmVjMmY3YmE2MDUgMTAw
NjQ0Cj4gLS0tIGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dAo+ICsrKyBi
L2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQKPiBAQCAtMTQ4LDYgKzE0OCwx
MiBAQCB3aXRoIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKPiAgIAo+ICAgICAgIEFuIGVtcHR5
IHByb3BlcnR5IHRvIGVuYWJsZS9kaXNhYmxlIGEgdmlydHVhbCBwbDAxMSBmb3IgdGhlIGd1ZXN0
IHRvIHVzZS4KPiAgIAo+ICstIG5yX3NwaXMKPiArICAgIE9wdGlvbmFsLiBBIDMyLWJpdCBpbnRl
Z2VyIHNwZWNpZnlpbmcgdGhlIG51bWJlciBvZiBTUElzIChzaGFyZWQKPiArICAgIHBlcmhpcGVy
YWwgaW50ZXJydXB0cykgdG8gYWxsb2NhdGUgZm9yIHRoZSBkb21haW4uIElmIG5yX3NwaXMgaXMK
CnMvcGVyaGlwZXJhbC9wZXJpcGhlcmFsLy4gQWxzbyBjYW4geW91IHVwcGVyY2FzZSB0aGUgZmly
c3QgbGV0dGVyIG9mIGVhY2ggCndvcmRpbmcgYXMgeW91IGFyZSBzcGVsbGluZyBvdXQgYW4gYWNy
b255bT8KCj4gKyAgICBtaXNzaW5nLCB0aGUgbWF4IG51bWJlciBvZiBTUElzIHN1cHBvcnRlZCBi
eSB0aGUgcGh5c2ljYWwgR0lDIGlzCj4gKyAgICB1c2VkLgo+ICsKPiAgIC0gI2FkZHJlc3MtY2Vs
bHMgYW5kICNzaXplLWNlbGxzCj4gICAKPiAgICAgICBCb3RoICNhZGRyZXNzLWNlbGxzIGFuZCAj
c2l6ZS1jZWxscyBuZWVkIHRvIGJlIHNwZWNpZmllZCBiZWNhdXNlCj4gQEAgLTIyNiwzICsyMzIs
MTE0IEBAIGNob3NlbiB7Cj4gICAgICAgICAgIH07Cj4gICAgICAgfTsKPiAgIH07Cj4gKwo+ICsK
PiArRGV2aWNlIEFzc2lnbm1lbnQKPiArPT09PT09PT09PT09PT09PT0KCkNvdWxkbid0IHdlIGp1
c3QgZXh0ZW5kIHRoZSBmaWxlIG1pc2MvYXJtL3Bhc3N0aHJvdWdoLnR4dD8gQWZ0ZXIgYWxsIHRo
ZXJlIApzaG91bGQgYmUgbm8gbWFqb3IgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28uCgo+ICsK
PiArRGV2aWNlIEFzc2lnbm1lbnQgKFBhc3N0aHJvdWdoKSBpcyBzdXBwb3J0ZWQgYnkgYWRkaW5n
IGFub3RoZXIgbW9kdWxlLAo+ICthbG9uZ3NpZGUgdGhlIGtlcm5lbCBhbmQgcmFtZGlzaywgd2l0
aCB0aGUgZGV2aWNlIHRyZWUgZnJhZ21lbnQKPiArY29ycmVzcG9uZGluZyB0byB0aGUgZGV2aWNl
IG5vZGUgdG8gYXNzaWduIHRvIHRoZSBndWVzdC4KPiArCj4gK1RoZSBkdGIgc3ViLW5vZGUgc2hv
dWxkIGhhdmUgdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzOgo+ICsKPiArLSBjb21wYXRpYmxlCj4g
Kwo+ICsgICAgIm11bHRpYm9vdCxkZXZpY2UtdHJlZSIKCkNhbiB3ZSBmb2xsb3cgdGhlIGNvbnZl
bnRpb24gZm9yIGRvbTA/IEkuZSB5b3UgYWx3YXlzIGhhdmUgdG8gcGFzcyAKIm11bHRpYm9vdCxt
b2R1bGUiPyBBbmQgcHJvYmFibHkgc3VnZ2VzdCBhbiBvcmRlciBpZiB0aGUgY29tcGF0aWJsZSAK
Im11bHRpYm9vdCxkZXZpY2UtdHJlZSIgaXMgbm90IHNwZWNpZmllZC4KClRoaXMgd291bGQgaGVs
cCB0byBrZWVwIGV2ZXJ5dGhpbmcgc2ltaWxhciBiZXR3ZWVuIGRvbTAgYW5kIGRvbVUuIExvbmdl
ciB0ZXJtLCBJIAp3b3VsZCBsb3ZlIHRvIHNlZSBEb20wIGRlc2NyaWJlZCBleGFjdGx5IHRoZSBz
YW1lIHdheSBhcyBkb21VLgoKWW91IHdvdWxkIG5lZWQgdG8gZG8gdGhlIHNhbWUgdXBkYXRlIGZv
ciBtdWx0aWJvb3Qse2tlcm5lbCwgcmFtZGlza30uCgo+ICsKPiArLSByZWcKPiArCj4gKyAgICBT
cGVjaWZpZXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIGRldmljZSB0cmVlIGJpbmFyeSBm
cmFnbWVudAo+ICsgICAgUkFNIGFuZCBpdHMgbGVuZ3RoLgo+ICsKPiArQXMgYW4gZXhhbXBsZToK
PiArCj4gKyAgICAgICAgbW9kdWxlQDB4YzAwMDAwMCB7Cj4gKyAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibXVsdGlib290LGRldmljZS10cmVlIiwgIm11bHRpYm9vdCxtb2R1bGUiOwo+ICsgICAg
ICAgICAgICByZWcgPSA8MHgwIDB4YzAwMDAwMCAweGZmZmZmZj47Cj4gKyAgICAgICAgfTsKPiAr
Cj4gK1RoZSBEVEIgZnJhZ21lbnQgaXMgbG9hZGVkIGluIGNhY2hlYWJsZSBtZW1vcnksIGF0IDB4
YzAwMDAwMCBpbiB0aGUKPiArZXhhbXBsZSBhYm92ZS4gSXQgc2hvdWxkIGZvbGxvdyB0aGUgY29u
dmVudGlvbiBleHBsYWluZWQgaW4KClRoaXMgaXMgYSBiaXQgY29uZnVzaW5nLCBob3cgZG9lcyB0
aGUgdXNlciBrbm93IHRoYXQgMHhjMDAwMDAwMCBpcyBjYWNoYWJsZSAKbWVtb3J5PyBBbHNvIHdo
eSB5b3UgZG8gbWVudGlvbiBpdCBmb3IgZGV2aWNlLXRyZWUgYW5kIG5vdCBrZXJuZWwgYW5kIGlu
aXRyYW1mcz8KCj4gK2RvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0LiBUaGUgRFRCIGZyYWdt
ZW50IHdpbGwgYmUgYWRkZWQgdG8gdGhlCj4gK2d1ZXN0IGRldmljZSB0cmVlLCBzbyB0aGF0IHRo
ZSBndWVzdCBrZXJuZWwgd2lsbCBiZSBhYmxlIHRvIGRpc2NvdmVyIHRoZQo+ICtkZXZpY2UuCj4g
Kwo+ICtJbiBhZGRpdGlvbiwgdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzIGZvciBlYWNoIGRldmlj
ZSBub2RlIGluIHRoZSBkZXZpY2UKPiArdHJlZSBmcmFnbWVudCB3aWxsIGJlIHVzZWQgZm9yIHRo
ZSBkZXZpY2UgYXNzaWdubWVudCBzZXR1cDoKPiArCj4gKy0geGVuLHJlZwo+ICsKPiArICBUaGUg
eGVuLHJlZyBwcm9wZXJ0eSBpcyBhbiBhcnJheSBvZjoKPiArCj4gKyAgICA8cGh5c19hZGRyIHNp
emUgZ3Vlc3RfYWRkcj4KPiArCj4gKyAgVGhleSBzcGVjaWZ5IHRoZSBwaHlzaWNhbCBhZGRyZXNz
IGFuZCBzaXplIG9mIHRoZSBkZXZpY2UgbWVtb3J5Cj4gKyAgcmFuZ2VzIHRvZ2V0aGVyIHdpdGgg
dGhlIGNvcnJlc3BvbmRpbmcgZ3Vlc3QgYWRkcmVzcyB0byBtYXAgdGhlbSB0by4KPiArICBUaGUg
c2l6ZSBvZiBgcGh5c19hZGRyJyBhbmQgYGd1ZXN0X2FkZHInIGlzIGRldGVybWluZWQgYnkKPiAr
ICAjYWRkcmVzc19jZWxsczsgdGhlIHNpemUgb2YgYHNpemUnIGlzIGRldGVybWluZWQgYnkgI3Np
emVfY2VsbHMuCj4gKyAgVGhlIG1lbW9yeSB3aWxsIGJlIG1hcHBlZCBhcyBkZXZpY2UgbWVtb3J5
IGluIHRoZSBndWVzdAo+ICsgIChwMm1fbW1pb19kaXJlY3RfZGV2KS4KPiArCj4gKy0geGVuLHBh
dGgKPiArCj4gKyAgQSBuZXcgc3RyaW5nIHByb3BlcnR5IG5hbWVkICJ4ZW4scGF0aCIgaG9sZHMg
dGhlIHBhdGggaW4gdGhlIGhvc3QgZGV2aWNlCj4gKyAgdHJlZSB0byB0aGUgY29ycmVzcG9uZGlu
ZyBkZXZpY2Ugbm9kZS4KPiArCj4gK1BsZWFzZSBub3RlIHRoYXQgZm9yIEdJQyBpbnRlcnJ1cHRz
LCB0aGUgaW50ZXJydXB0cyBhbmQgaW50ZXJydXB0LXBhcmVudAo+ICtkZXZpY2UgdHJlZSBwcm9w
ZXJ0aWVzIHNob3VsZCBub3QgYmUgcHJlc2VudCBpbiB0aGUgZGV2aWNlIHRyZWUKPiArZnJhZ21l
bnQsIGJlY2F1c2UgdGhleSBhcmUgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgYnkgWGVuIHN0YXJ0
aW5nIGZyb20KPiArdGhlIGNvcnJlc3BvbmRpbmcgaW5mb3JtYXRpb24gb24gdGhlIGhvc3QgZGV2
aWNlIHRyZWUgbm9kZSBmb3IgdGhlCj4gK2RldmljZS4gRm9yIEdJQyBpbnRlcnJ1cHRzLCBvbmx5
IHRoZSBpbnRlcnJ1cHRzIHByb3BlcnR5IGlzIGN1cnJlbnRseQo+ICtzdXBwb3J0ZWQsIG5vdCB0
aGUgbmV3ZXIgaW50ZXJydXB0cy1leHRlbmRlZCBwcm9wZXJ0eS4KCldoeSBzbz8gVGhlcmUgYXJl
IGEgbG90IG9mIERldmljZS1UcmVlIHRoYXQgYXJlIHN3aXRjaGluZyB0byBpbnRlcnJ1cHRzLWV4
dGVuZCAKZm9yIEdJQyBpbnRlcnJ1cHRzLi4uLgoKQWxzbywgd2hhdCBhYm91dCB0aGUgcHJvcGVy
dHkgaW50ZXJydXB0LW1hcD8KCj4gKwo+ICtUaGUgZm9sbG93aW5nIGlzIGEgcmVhbC13b3JsZCBl
eGFtcGxlIG9mIGEgZGV2aWNlIHRyZWUgZnJhZ21lbnQgZm9yIHRoZQo+ICtuZXR3b3JrIGNhcmQg
b24gWGlsaW54IE1QU29DIGJvYXJkczoKPiArCj4gKy9kdHMtdjEvOwo+ICsKPiArLyB7Cj4gKyAg
ICAjYWRkcmVzcy1jZWxscyA9IDwweDI+Owo+ICsgICAgI3NpemUtY2VsbHMgPSA8MHgxPjsKPiAr
Cj4gKyAgICBwYXNzdGhyb3VnaCB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVz
IjsKPiArICAgICAgICByYW5nZXM7Cj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgyPjsK
PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDE+Owo+ICsKPiArICAgICAgICBtaXNjX2NsayB7
Cj4gKyAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwweDA+Owo+ICsgICAgICAgICAgICBjbG9j
ay1mcmVxdWVuY3kgPSA8MHg3NzM1OTQwPjsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJm
aXhlZC1jbG9jayI7Cj4gKyAgICAgICAgICAgIGxpbnV4LHBoYW5kbGUgPSA8MHgxPjsKPiArICAg
ICAgICAgICAgcGhhbmRsZSA9IDwweDE+Owo+ICsgICAgICAgIH07Cj4gKwo+ICsgICAgICAgIGV0
aGVybmV0QGZmMGUwMDAwIHsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJjZG5zLHp5bnFt
cC1nZW0iOwo+ICsgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICAgICAgIHJl
ZyA9IDwweDAgMHhmZjBlMDAwMCAweDEwMDA+Owo+ICsgICAgICAgICAgICBjbG9jay1uYW1lcyA9
ICJwY2xrIiwgImhjbGsiLCAidHhfY2xrIiwgInJ4X2NsayI7Cj4gKyAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDB4MT47Cj4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MD47Cj4g
KyAgICAgICAgICAgIGNsb2NrcyA9IDwweDEgMHgxIDB4MSAweDE+Owo+ICsgICAgICAgICAgICBw
aHktbW9kZSA9ICJyZ21paS1pZCI7Cj4gKyAgICAgICAgICAgIHhsbngscHRwLWVuZXQtY2xvY2sg
PSA8MHgwPjsKPiArICAgICAgICAgICAgbG9jYWwtbWFjLWFkZHJlc3MgPSBbMDAgMGEgMzUgMDAg
MjIgMDFdOwo+ICsgICAgICAgICAgICBwaHktaGFuZGxlID0gPDB4Mj47Cj4gKyAgICAgICAgICAg
IHhlbixwYXRoID0gIi9hbWJhL2V0aGVybmV0QGZmMGUwMDAwIjsKPiArICAgICAgICAgICAgeGVu
LHJlZyA9IDwweDAgMHhmZjBlMDAwMCAweDEwMDAgMHgwIDB4ZmYwZTAwMDA+Owo+ICsKPiArICAg
ICAgICAgICAgcGh5QGMgewo+ICsgICAgICAgICAgICAgICAgcmVnID0gPDB4Yz47Cj4gKyAgICAg
ICAgICAgICAgICB0aSxyeC1pbnRlcm5hbC1kZWxheSA9IDwweDg+Owo+ICsgICAgICAgICAgICAg
ICAgdGksdHgtaW50ZXJuYWwtZGVsYXkgPSA8MHhhPjsKPiArICAgICAgICAgICAgICAgIHRpLGZp
Zm8tZGVwdGggPSA8MHgxPjsKPiArICAgICAgICAgICAgICAgIHRpLHJ4Y3RybC1zdHJhcC13b3Jr
YTsKPiArICAgICAgICAgICAgICAgIGxpbnV4LHBoYW5kbGUgPSA8MHgyPjsKPiArICAgICAgICAg
ICAgICAgIHBoYW5kbGUgPSA8MHgyPjsKPiArICAgICAgICAgICAgfTsKPiArICAgICAgICB9Owo+
ICsgICAgfTsKPiArfTsKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
