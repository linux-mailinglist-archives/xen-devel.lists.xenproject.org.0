Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A9CEE6D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 23:32:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHaa1-0006Ck-Kg; Mon, 07 Oct 2019 21:30:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHaZz-0006AW-N3
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 21:30:07 +0000
X-Inumbo-ID: a1b9d84e-e949-11e9-97c0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1b9d84e-e949-11e9-97c0-12813bfff9fa;
 Mon, 07 Oct 2019 21:30:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E524C20867;
 Mon,  7 Oct 2019 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570483806;
 bh=AkCA7e/4dGK7o/hAeqCGmWIy+qAVUvmA0q4zN+iWxGs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Te+P14kBnDTTE5491GLLW7KHXYGk0fCaiAfeUCCOfpcb8axASNFoGP2Pt2WpMHR3m
 1g1FHgwiS/H6wXK6mO5ZimRmGoparBGz5QDu12ZB6/2USZa9BspfhKZayjsqNz4GGe
 B1BM4RLDdEm75vZ9EDqcmOyM9YoTkcb7jArYDagQ=
Date: Mon, 7 Oct 2019 14:30:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <a65639bc-cae9-85d2-f33c-40dd8e24f6b7@arm.com>
Message-ID: <alpine.DEB.2.21.1910071426040.13684@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
 <a65639bc-cae9-85d2-f33c-40dd8e24f6b7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: fix duplicate memory node
 in DT
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org, oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA3IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDUvMTAvMjAxOSAw
MDowOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gV2hlbiByZXNlcnZlZC1tZW1vcnkg
cmVnaW9ucyBhcmUgcHJlc2VudCBpbiB0aGUgaG9zdCBkZXZpY2UgdHJlZSwgZG9tMAo+ID4gaXMg
c3RhcnRlZCB3aXRoIG11bHRpcGxlIG1lbW9yeSBub2Rlcy4gRWFjaCBtZW1vcnkgbm9kZSBzaG91
bGQgaGF2ZSBhCj4gPiB1bmlxdWUgbmFtZSwgYnV0IHRvZGF5IHRoZXkgYXJlIGFsbCBjYWxsZWQg
Im1lbW9yeSIgbGVhZGluZyB0byBMaW51eAo+ID4gcHJpbnRpbmcgdGhlIGZvbGxvd2luZyB3YXJu
aW5nIGF0IGJvb3Q6Cj4gPiAKPiA+ICAgIE9GOiBEdXBsaWNhdGUgbmFtZSBpbiBiYXNlLCByZW5h
bWVkIHRvICJtZW1vcnkjMSIKPiA+IAo+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBi
eSBhcHBlbmRpbmcgYSAiQDx1bml0LWFkZHJlc3M+IiB0byB0aGUKPiA+IG5hbWUsIGFzIHBlciB0
aGUgRGV2aWNlIFRyZWUgc3BlY2lmaWNhdGlvbiwgd2hlcmUgPHVuaXQtYWRkcmVzcz4gbWF0Y2hl
cwo+ID4gdGhlIGJhc2Ugb2YgYWRkcmVzcyBvZiB0aGUgZmlyc3QgcmVnaW9uLgo+ID4gCj4gPiBS
ZXBvcnRlZC1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVw
YW0uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0
YWJlbGxpbmlAeGlsaW54LmNvbT4KPiA+IAo+ID4gLS0tCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
PiA+IGluZGV4IDkyMWIwNTQ1MjAuLmE0YzA3ZGIzODMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Ywo+ID4gQEAgLTY0NiwxNiArNjQ2LDIyIEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfbWVtb3J5
X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbgo+ID4gKmQsCj4gPiAgICAgICBpbnQgcmVzLCBpOwo+
ID4gICAgICAgaW50IHJlZ19zaXplID0gYWRkcmNlbGxzICsgc2l6ZWNlbGxzOwo+ID4gICAgICAg
aW50IG5yX2NlbGxzID0gcmVnX3NpemUgKiBtZW0tPm5yX2JhbmtzOwo+ID4gKyAgICAvKiBQbGFj
ZWhvbGRlciBmb3IgbWVtb3J5QCArIGEgMzItYml0IG51bWJlciArIFwwICovCj4gPiArICAgIGNo
YXIgYnVmWzE4XTsKPiA+ICAgICAgIF9fYmUzMiByZWdbTlJfTUVNX0JBTktTICogNCAvKiBXb3Jz
dCBjYXNlIGFkZHJjZWxscyArIHNpemVjZWxscyAqL107Cj4gPiAgICAgICBfX2JlMzIgKmNlbGxz
Owo+ID4gICAgICAgICBCVUdfT04obnJfY2VsbHMgPj0gQVJSQVlfU0laRShyZWcpKTsKPiA+ICsg
ICAgLyogTm90aGluZyB0byBkbyAqLwo+IAo+IFRoaXMgYSBkZXBhcnR1cmUgZnJvbSB0aGUgY3Vy
cmVudCBzb2x1dGlvbiB3aGVyZSBhIG5vZGUgd2lsbCBiZSBjcmVhdGVkIHdpdGgKPiBubyAicmVn
IiBwcm9wZXJ0eS4gSSB0aGluayB0aGlzIGNoYW5nZSBvZiBiZWhhdmlvciBzaG91bGQgYXQgbGVh
c3QgYmUKPiBkZXNjcmliZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlmIG5vdCBpbXBsZW1lbnRl
ZCBpbiBhIHNlcGFyYXRlIHBhdGNoLiBCdXQuLi4KPiAKPiA+ICsgICAgaWYgKCBtZW0tPm5yX2Jh
bmtzID09IDAgKQo+ID4gKyAgICAgICAgcmV0dXJuIDA7Cj4gCj4gLi4uIEkgZG9uJ3QgdGhpbmsg
d2Ugd2FudCB0byBpZ25vcmUgaXQuIFRoZSBjYWxsZXIgbW9zdCBsaWtlbHkgbWVzc2VkIHVwIHRo
ZQo+IGJhbmtzIGFuZCB3ZSBzaG91bGQgaW5zdGVhZCByZXBvcnQgYW4gZXJyb3IuCgpJIGFkbWl0
IGl0IHdhc24ndCBteSBpbnRlbnRpb24gdG8gY2hhbmdlIHRoZSBjdXJyZW50IGJlaGF2aW9yLiBB
cyBJIHdhcwpsb29raW5nIHRocm91Z2ggdGhlIGNvZGUgSSBub3RpY2VkIHRoYXQgd2UgY2FsbCBt
YWtlX21lbW9yeV9ub2RlIGZvcgpib3RoIG5vcm1hbCBtZW1vcnkgYW5kIHJlc2VydmVkX21lbW9y
eS4gT2YgY291cnNlLCByZXNlcnZlZF9tZW1vcnkgY291bGQKaGF2ZSBubyBiYW5rcy4gU28gSSB0
aG91Z2h0IGl0IHdvdWxkIGJlIGdvb2QgdG8gY2hlY2sgd2hldGhlciB0aGVyZSBhcmUKYW55IGJh
bmtzIGJlZm9yZSBjb250aW51aW5nIGJlY2F1c2Ugbm93IHdlIGFyZSBnb2luZyB0byBhY2Nlc3MK
bWVtLT5iYW5rWzBdLnN0YXJ0LCB3aGljaCB3b3VsZCBiZSBhIG1pc3Rha2UgaWYgdGhlcmUgYXJl
IG5vIGJhbmtzLgoKSW4gcmVnYXJkcyB0byB5b3VyIGNvbW1lbnQgYWJvdXQgcmV0dXJuaW5nIGVy
cm9yLCB3ZSBjb3VsZCByZXR1cm4gRU5PRU5ULApob3dldmVyIHdlIHdvdWxkIGFsc28gaGF2ZSB0
byBoYW5kbGUgRU5PRU5UIGVzcGVjaWFsbHkgYXQgdGhlIGNhbGxlcgpzaWRlIChoYW5kbGVfbm9k
ZSkuIE9yIHdlIHdvdWxkIGhhdmUgdG8gYWRkIGEgY2hlY2sgaWYgKCBtZW0tPm5yX2JhbmtzID4K
MCkgdG8gYXZvaWQgY2FsbGluZyBtYWtlX21lbW9yeV9ub2RlIHdoZW4gbnJfYmFua3MgaXMgemVy
by4KCgo+ID4gICAgICAgICBkdF9kcHJpbnRrKCJDcmVhdGUgbWVtb3J5IG5vZGUgKHJlZyBzaXpl
ICVkLCBuciBjZWxscyAlZClcbiIsCj4gPiAgICAgICAgICAgICAgICAgIHJlZ19zaXplLCBucl9j
ZWxscyk7Cj4gPiAgICAgICAgIC8qIGVQQVBSIDMuNCAqLwo+ID4gLSAgICByZXMgPSBmZHRfYmVn
aW5fbm9kZShmZHQsICJtZW1vcnkiKTsKPiA+ICsgICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVm
KSwgIm1lbW9yeUAlIlBSSXg2NCwgbWVtLT5iYW5rWzBdLnN0YXJ0KTsKPiA+ICsgICAgcmVzID0g
ZmR0X2JlZ2luX25vZGUoZmR0LCBidWYpOwo+ID4gICAgICAgaWYgKCByZXMgKQo+ID4gICAgICAg
ICAgIHJldHVybiByZXM7Cj4gPiAgIAo+IAo+IENoZWVycywKPiAKPiAtLSAKPiBKdWxpZW4gR3Jh
bGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
