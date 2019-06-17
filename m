Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5447BF1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 10:15:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcmlC-0003Ly-SY; Mon, 17 Jun 2019 08:13:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jUew=UQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcmlB-0003LW-21
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 08:13:01 +0000
X-Inumbo-ID: b88929d7-90d7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b88929d7-90d7-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 08:13:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D96BF28;
 Mon, 17 Jun 2019 01:12:59 -0700 (PDT)
Received: from [10.37.12.132] (unknown [10.37.12.132])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1E003F246;
 Mon, 17 Jun 2019 01:12:57 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
 <5D0386DC0200007800238470@prv1-mh.provo.novell.com>
 <6c6fcf56-f6d1-e6b7-dcf8-3889a772d03e@arm.com>
 <5D0735D20200007800238B1B@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0b1f2e30-e037-e21a-0d89-3aed35f4daa7@arm.com>
Date: Mon, 17 Jun 2019 09:12:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D0735D20200007800238B1B@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/ACPI: re-park previously parked
 CPUs upon resume from S3
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNi8xNy8xOSA3OjQwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAx
NC4wNi4xOSBhdCAxODo1MiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gVGhlIHRp
dGxlIGFuZCBjb21taXQgbWVzc2FnZSBhcmUgYSBiaXQgb2RkIHRvIHJlYWQgYmVjYXVzZSB5b3Ug
YXJlIG1vZGlmeWluZwo+PiBjb21tb24gY29kZSBidXQgZXZlcnl0aGluZyBpcyBnZWFyZWQgdG93
YXJkcyB4ODYuCj4gCj4gSW5kZWVkLiBUaGVyZSdzIG5vIGNhbGxlciBvZiB7ZW4sZGlzfWFibGVf
bm9uYm9vdF9jcHVzKCkgaW4gQXJtIGNvZGUKPiBhdCBwcmVzZW50LCBhZmFpY3MuIEhlbmNlIHRo
ZSBjb2RlIGNoYW5nZWQgKGJ1dCBub3QgdGhlIGZpbGUpIGlzIHRydWx5Cj4geDg2LXNwZWNpZmlj
IGF0IHRoZSBtb21lbnQuIEkndmUgZXhwbGljaXRseSB0aG91Z2h0IGFib3V0IHRoZQo+ICJpbmNv
bnNpc3RlbmN5IiBiZXR3ZWVuIHRpdGxlIGFuZCBjb250ZW50cywgYnV0IEkndmUgZGVsaWJlcmF0
ZWx5IHB1dCBpdAo+IGFzIGlzOiBUaGUgY2hhbmdlIF9pc18geDg2IC8gQUNQSSBvbmx5LCBfZGVz
cGl0ZV8gdG91Y2hpbmcgY29tbW9uCj4gY29kZSAoYW5kIGhlbmNlIG5lZWRpbmcgYSBSRVNUIG1h
aW50YWluZXIgYWNrKS4KCkJlYXIgaW4gbWluZCB0aGF0IEkgaGF2ZSBuZWFybHkgbm8ga25vd2xl
ZGdlIG9mIHg4Niwgc28gdHJ5aW5nIHRvIHdyaXRlIAphIGNvbW1pdCBtZXNzYWdlIGZ1bGx5IHRo
ZSB4ODYgd2F5IGlzIG5vdCBnb2luZyB0byBoZWxwIG1lIHVuZGVyc3RhbmQgCndoeSB0aGlzIG1h
a2VzIHNlbnNlIGZvciBldmVyeW9uZSAodG9kYXkgb3IgaW4gdGhlIGZ1dHVyZSkuCgo+Pj4gQEAg
LTIwNywxNSArMjA3LDE5IEBAIHZvaWQgZW5hYmxlX25vbmJvb3RfY3B1cyh2b2lkKQo+Pj4gICAg
Cj4+PiAgICAgICAgcHJpbnRrKCJFbmFibGluZyBub24tYm9vdCBDUFVzICAuLi5cbiIpOwo+Pj4g
ICAgCj4+PiAtICAgIGZvcl9lYWNoX2NwdSAoIGNwdSwgJmZyb3plbl9jcHVzICkKPj4+ICsgICAg
Zm9yX2VhY2hfcHJlc2VudF9jcHUgKCBjcHUgKQo+Pj4gICAgICAgIHsKPj4+ICsgICAgICAgIGlm
ICggcGFya19vZmZsaW5lX2NwdXMgPyBjcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpCj4+Cj4+IHBh
cmtfb2ZmbGluZV9jcHVzIGlzIHg4NiBzcGVjaWZpYywgc28gaXQgd2lsbCBub3QgYnVpbGQgb24g
QXJtLgo+IAo+IEFuZCB0aGF0J3MgaW50ZW50aW9uYWwsIGV2ZW4gbW9yZSBzbyB0aGF0IChhcyBz
YWlkIGFib3ZlKSBBcm0gZG9lc24ndAo+IGNhbGwgaGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UuIAoK
Q2FsbGluZyBhbmQgYnVpbGRpbmcgYXJlIHR3byBzZXBhcmF0ZSB0aGluZ3MuLi4gQSBmdW5jdGlv
biBtYXkgYmUgYnVpbHQgCmV2ZW4gaWYgaXQgaXMgbm90IGNhbGxlZC4KCj4gQW5kIGV2ZW4gaWYg
aXQgZGlkIC0gd2hldGhlciB0byBkbyB0aGluZ3MgdGhlCj4gIm5ldyIgd2F5IHdvdWxkIHRoZW4g
c3RpbGwgKGludGVudGlvbmFsbHkpIGRlcGVuZCBvbiB3aGV0aGVyIEFybSBoYWQKPiBhbnkgd2F5
IG9mIHBhcmtfb2ZmbGluZV9jcHVzIGJlaW5nICJ0cnVlIi4KCkxvb2tpbmcgYWdhaW4sIHdlIGFy
ZSBkZWZpbmluZyBwYXJrX29mZmxpbmVfY3B1cyB0byBmYWxzZSBvbiBBcm0gKHNlZQphNjQ0OGFk
ZmQzICJ4ZW4vY3B1OiBGaXggQVJNIGJ1aWxkIGZvbGxvd2luZyBjL3MgNTk3ZmJiOCIpLiBTbyB0
aGVyZSBhcmUgCm5vIGJ1aWxkIGlzc3VlIGFzIEkgZmlyc3QgdGhvdWdodC4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
