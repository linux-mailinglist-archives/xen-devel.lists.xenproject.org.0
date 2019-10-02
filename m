Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F47C8F11
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 18:56:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFhs8-0005Wo-OJ; Wed, 02 Oct 2019 16:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFhs7-0005WG-4X
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 16:53:03 +0000
X-Inumbo-ID: 16dbaa4e-e535-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 16dbaa4e-e535-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 16:52:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C97371000;
 Wed,  2 Oct 2019 09:52:58 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F19B3F706;
 Wed,  2 Oct 2019 09:52:57 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Brian Woods <brian.woods@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
Message-ID: <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
Date: Wed, 2 Oct 2019 17:52:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Errors with Loading Xen at a Certain Address
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgSSBmb3Jnb3QgdG8gQ0MgeGVuLWRldmVsIGJhY2suCgpPbiAxMC8yLzE5IDU6NTIgUE0s
IEp1bGllbiBHcmFsbCB3cm90ZToKPiBPbiAxMC8yLzE5IDE6MzIgQU0sIEJyaWFuIFdvb2RzIHdy
b3RlOgo+PiBIZWxsbywKPiAKPiBIaSBCcmlhbiwKPiAKPiBUaGFuayB5b3UgZm9yIHJlcG9ydC4K
PiAKPiBJIGd1ZXNzIHRoaXMgQXJtIHNwZWNpZmljLCByaWdodD8gSWYgc28sIHBsZWFzZSB0cnkg
dG8gQ0MKPiB0aGUgcmVsZXZhbnQgbWFpbnRhaW5lcnMgYW5kIHBvc3NpYmx5IGFkZCAiYXJtIiBp
biB0aGUKPiBzdWJqZWN0IHRvIGF2b2lkIGFueSBkZWxheSAoWGVuLURldmVsIGhhcyBxdWl0ZSBh
biBoaWdoCj4gdm9sdW1lIG9mIGUtbWFpbCEpLgo+IAo+IE1heSBJIGFsc28gYXNrIHRvIGF2b2lk
aW5nIHNlbmRpbmcgYXR0YWNobWVudCBvbiB0aGUgbWFpbGluZwo+IGxpc3QgYW5kICBpbnN0ZWFk
IHVwbG9hZCB0aGUgbG9nIHNvbWV3aGVyZSAoZS5nLiBwYXN0ZWJpbiwKPiB5b3VyIG93biB3ZWJz
ZXJ2ZXIuLi4pPwo+IAo+Pgo+PiBXaGlsZSB0ZXN0aW5nIHNvbWUgdGhpbmdzIG91dCwgSSBmb3Vu
ZCBhIHBvc3NpYmxlIGJ1ZyBpbiBYZW4uICBYZW4gd291bGQKPj4gc3VjY2Vzc2Z1bGx5IHJ1biB3
aGVuIGxvYWRlZCAoZnJvbSB1LWJvb3QpIGF0IHNvbWUgYWRkcmVzc2VzIGJ1dCBub3QKPj4gb3Ro
ZXJzLiAgSSBkaWRuJ3Qgb2JzZXJ2ZSB0aGlzIGlzc3VlIGluIDQuMTEgc3RhYmxlLCBzbyBJIGRp
ZCBhIGJpc2VjdAo+PiBhbmQgZm91bmQgdGhhdDoKPj4gY29tbWl0IGY2MDY1OGM2YWU0N2U3NDc5
MmU2Y2M0OGVhMmVmZmFjOGJiNTI4MjYKPj4gQXV0aG9yOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgo+PiBEYXRlOiAgIFR1ZSBEZWMgMTggMTM6MDc6MzkgMjAxOCArMDAwMAo+
Pgo+PiAgICAgICB4ZW4vYXJtOiBTdG9wIHJlbG9jYXRpbmcgWGVuCj4+Cj4+IHdhcyB3aGF0IHdh
cyBjYXVzaW5nIGl0IHRvIGZhaWwgd2hlbiBpdCB3YXMgbG9hZGVkIHRvIHRoYXQgY2VydGFpbgo+
PiBhZGRyZXNzLgo+IAo+IFRoaXMgcGF0Y2ggaXMgYmFzaWNhbGx5IGNoYW5naW5nIGhvdyBYZW4g
aXMgdXNpbmcgdGhlCj4gcGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4gU28gaXQgZXhlcmNpc2UgbW9y
ZSBwYXJ0IG9mIFhlbgo+IGNvZGUgYW5kIG1vc3QgbGlrZWx5IGEgcmVkLWhlcnJpbmcgOikuCj4g
Cj4gSG93ZXZlciwgdGhlIGxvZ3MgYXJlIHF1aXRlIGludGVyZXN0aW5nOgo+IAo+IChYRU4pIHBn
WzBdIE1GTiAwMTUzMyBjPTB4MTgwMDAwMDAwMDAwMDAwIG89MCB2PTB4N2ZmZmYgdD0wCj4gCj4g
SWYgSSBhbSBub3QgbWlzdGFrZW4sIHRoZSBwYWdlIHN0YXRlIGlzIFBHQ19zdGF0ZV9mcmVlLgo+
IFNvIHRoaXMgc2VlbXMgdG8gc3VnZ2VzdCB0aGF0IHRoZSBwYWdlIHdlcmUgYWxyZWFkeQo+IGhh
bmRlZCBvdmVyIHRvIHRoZSBhbGxvY2F0b3IuCj4gCj4gV291bGQgeW91IG1pbmQgdG8gYXBwbHkg
dGhlIHBhdGNoIGJlbG93IGFuZCBwYXN0ZSB0aGUgbG9nPwo+IAo+IEhvcGVmdWxseSwgeW91IHNl
ZSBzZWUgdHdvIFdBUk5fT04oKSBiZWZvcmUgWGVuIGlzIGNyYXNoaW5nLgo+IAo+IE5vdGUgdGhl
IHBhdGNoIGlzIGFzc3VtaW5nIHRoZSBNRk4gd2lsbCBzdGF5IHRoZSBzYW1lIGFmdGVyCj4gdGhl
IHBhdGNoIGhhcyBiZWVuIGFwcGxpZWQuIElmIG5vdCwgeW91IG1heSBuZWVkIHRvIHNsaWdodGx5
Cj4gdHdlYWsgaXQuCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIv
eGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiBpbmRleCA3Y2IxYmQzNjhiLi40YmYwZGJjNzI3IDEw
MDY0NAo+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKPiBAQCAtMTM4OSw2ICsxMzg5LDkgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFw
X3BhZ2VzKAo+ICAgCj4gICAgICAgZm9yICggaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyAp
Cj4gICAgICAgewo+ICsKPiArICAgICAgICBXQVJOX09OKG1mbl94KHBhZ2VfdG9fbWZuKHBnICsg
MSkpID09IDB4MDE1MzMpOwo+ICsKPiAgICAgICAgICAgLyoKPiAgICAgICAgICAgICogQ2Fubm90
IGFzc3VtZSB0aGF0IGNvdW50X2luZm8gPT0gMCwgYXMgdGhlcmUgYXJlIHNvbWUgY29ybmVyIGNh
c2VzCj4gICAgICAgICAgICAqIHdoZXJlIGl0IGlzbid0IHRoZSBjYXNlIGFuZCB5ZXQgaXQgaXNu
J3QgYSBidWc6Cj4gCj4gQ2hlZXJzLAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
