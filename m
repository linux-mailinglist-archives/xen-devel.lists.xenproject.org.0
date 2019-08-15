Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34F8EA2E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 13:27:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyDs0-0005cq-1Z; Thu, 15 Aug 2019 11:24:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyDrx-0005ck-Sh
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 11:24:37 +0000
X-Inumbo-ID: 417ccd66-bf4f-11e9-8b99-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 417ccd66-bf4f-11e9-8b99-12813bfff9fa;
 Thu, 15 Aug 2019 11:24:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CB2A28;
 Thu, 15 Aug 2019 04:24:33 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0D093F694;
 Thu, 15 Aug 2019 04:24:32 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
 <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
 <875zmyhdzi.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9452f4b5-7e36-0514-f207-a6b7c4410ea6@arm.com>
Date: Thu, 15 Aug 2019 12:24:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <875zmyhdzi.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMTUvMDgvMjAxOSAxMjoyMCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gCj4gSGkgU3RlZmFubywKPiAKPiBTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgo+IAo+
PiBPbiBUdWUsIDEzIEF1ZyAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+PiBAQCAt
MTYyLDYgKzE1NiwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShj
b25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+Pj4+ICAgICAgICAgICBib290aW5mby5tZW0uYmFu
a1tib290aW5mby5tZW0ubnJfYmFua3NdLnNpemUgPSBzaXplOwo+Pj4+ICAgICAgICAgICBib290
aW5mby5tZW0ubnJfYmFua3MrKzsKPj4+PiAgICAgICB9Cj4+Pj4gKwo+Pj4+ICsgICAgaWYgKCBi
b290aW5mby5tZW0ubnJfYmFua3MgPT0gTlJfTUVNX0JBTktTICkKPj4+PiArICAgICAgICByZXR1
cm4gLUVOT1NQQzsKPj4+IEFyZSB5b3Ugc3VyZSB0aGF0IHRoaXMgbG9naWMgaXMgY29ycmVjdD8K
Pj4+Cj4+PiBGb3IgZXhhbXBsZSwgaWYgTlJfTUVNX0JBTktTIGlzIDEsIGFuZCB3ZSBoYXZlIGV4
YWN0bHkgb25lIG1lbW9yeSBub2RlCj4+PiBpbiBkZXZpY2UgdHJlZSwgdGhpcyBmdW5jdGlvbiB3
aWxsIGZhaWwuIEJ1dCBpdCBzaG91bGQgbm90LiBJIHRoaW5rIHlvdQo+Pj4gd2FudCB0aGlzIGNv
bmRpdGlvbjogYm9vdGluZm8ubWVtLm5yX2JhbmtzID4gTlJfTUVNX0JBTktTCj4+Cj4+IFlvdSBh
cmUgcmlnaHQsIGlmIE5SX01FTV9CQU5LUyBpcyAxIGFuZCB3ZSBoYXZlIDEgbWVtb3J5IG5vZGUg
aW4gZGV2aWNlCj4+IHRyZWUgdGhlIGNvZGUgd291bGQgcmV0dXJuIGFuIGVycm9yIHdoaWxlIGFj
dHVhbGx5IGl0IGlzIG5vcm1hbC4KPj4KPj4gSSB0aGluayB0aGUgcmlnaHQgY2hlY2sgd291bGQg
YmU6Cj4+Cj4+ICAgIGlmICggaSA8IGJhbmtzICYmIGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9PSBO
Ul9NRU1fQkFOS1MgKQo+PiAgICAgICAgcmV0dXJuIC1FTk9TUEM7Cj4gCj4gQWN0dWFsbHksIHRo
aXMgZG9lcyBub3QgY292ZXIgYWxsIGNvcm5lciBjYXNlcy4gSGVyZSBpcyB0aGUgcmVzdWx0aW5n
Cj4gY29kZToKPiAKPiAgIDE1MCAgICAgZm9yICggaSA9IDA7IGkgPCBiYW5rcyAmJiBib290aW5m
by5tZW0ubnJfYmFua3MgPCBOUl9NRU1fQkFOS1M7IGkrKyApCj4gICAxNTEgICAgIHsKPiAgIDE1
MiAgICAgICAgIGRldmljZV90cmVlX2dldF9yZWcoJmNlbGwsIGFkZHJlc3NfY2VsbHMsIHNpemVf
Y2VsbHMsICZzdGFydCwgJnNpemUpOwo+ICAgMTUzICAgICAgICAgaWYgKCAhc2l6ZSApCj4gICAx
NTQgICAgICAgICAgICAgY29udGludWU7Cj4gICAxNTUgICAgICAgICBib290aW5mby5tZW0uYmFu
a1tib290aW5mby5tZW0ubnJfYmFua3NdLnN0YXJ0ID0gc3RhcnQ7Cj4gICAxNTYgICAgICAgICBi
b290aW5mby5tZW0uYmFua1tib290aW5mby5tZW0ubnJfYmFua3NdLnNpemUgPSBzaXplOwo+ICAg
MTU3ICAgICAgICAgYm9vdGluZm8ubWVtLm5yX2JhbmtzKys7Cj4gICAxNTggICAgIH0KPiAgIDE1
OQo+ICAgMTYwICAgICBpZiAoIGkgPCBiYW5rcyAmJiBib290aW5mby5tZW0ubnJfYmFua3MgPT0g
TlJfTUVNX0JBTktTICkKPiAgIDE2MSAgICAgICAgIHJldHVybiAtRU5PU1BDOwo+IAo+IExpbmVz
IDE1My0xNTQgY2F1c2UgdGhlIGlzc3VlLgo+IAo+IEltYWdpbmUgdGhhdCBOUl9NRU1fQkFOS1Mg
PSAxIGFuZCB3ZSBoYXZlIHR3byBtZW1vcnkgbm9kZXMgaW4gZGV2aWNlCj4gdHJlZSB3aXRoLiBO
b2RlcyBoYXZlIHNpemVzIDAgYW5kIDEwMjQuIFlvdXIgY29kZSB3aWxsIHdvcmsgYXMKPiBpbnRl
bmRlZC4gQXQgdGhlIGVuZCBvZiBsb29wIHdlIHdpbGwgaGF2ZSBiYW5rcyA9IDIsIGkgPSAyIGFu
ZAo+IGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9IDEuCj4gCj4gQnV0IGlmIHdlIHN3aXRjaCBvcmRl
ciBvZiBtZW1vcnkgbm9kZXMsIHNvIGZpcnN0IG9uZSB3aWxsIGJlIHdpdGggc2l6ZQo+IDEwMjQg
YW5kIHNlY29uZCBvbmUgd2l0aCBzaXplIDAsIHlvdXIgY29kZSB3aWxsIHJldHVybiAtRU5PU1BD
LCBiZWNhdXNlCj4gd2UnbGwgaGF2ZSBiYW5rcyA9IDIsIGkgPSAxLCBib290aW5mby5tZW0ubnJf
YmFua3MgPSAxLgo+IAo+IEkgdGhpbmssIHJpZ2h0IHNvbHV0aW9uIHdpbGwgYmUgdG8gc2NhbiBh
bGwgbm9kZXMgdG8gY291bnQgbm9kZXMKPiB3aXRoIHNpemUgPiAwLiBBbmQgdGhlbiAtIGVpdGhl
ciByZXR1cm4gYW4gZXJyb3Igb3IgZG8gc2Vjb25kIGxvb3AgdG8KPiBmaWxsIGJvb3RpbmZvLm1l
bS5iYW5rW10uCgpUbyBiZSBob25lc3QsIGEgbWVtb3J5IHdpdGggc2l6ZSAwIGlzIGFuIGVycm9y
IGluIHRoZSBEVCBwcm92aWRlZC4gU28gSSB3b3VsZCAKbm90IGNhcmUgdG9vIG11Y2ggaWYgWGVu
IGlzIG5vdCB3b3JraW5nIGFzIGludGVuZGVkLgoKSWYgd2Ugd2FudCB0byBmaXggdGhpcywgdGhl
biB3ZSBzaG91bGQgYmFpbCBvdXQgYXMgd2UgZG8gZm9yIG1pc3NpbmcgJ3JlZ3MnIGFuZCAKaW52
YWxpZCAnYWRkcmVzcy1jZWxscycvJ3NpemUtY2VsbHMnLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
