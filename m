Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1B88EB9A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 14:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyEwU-0003zh-FK; Thu, 15 Aug 2019 12:33:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyEwT-0003zc-09
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 12:33:21 +0000
X-Inumbo-ID: dc13459a-bf58-11e9-96f7-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dc13459a-bf58-11e9-96f7-bc764e2007e4;
 Thu, 15 Aug 2019 12:33:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04440344;
 Thu, 15 Aug 2019 05:33:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85C1E3F694;
 Thu, 15 Aug 2019 05:33:17 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
 <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
 <875zmyhdzi.fsf@epam.com> <9452f4b5-7e36-0514-f207-a6b7c4410ea6@arm.com>
 <79e7a0a2-7c1e-cfe9-b5b1-d503075f60bd@arm.com> <874l2ihbgg.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d3982ff4-1c1e-3f16-4f6d-2aa42410d3da@arm.com>
Date: Thu, 15 Aug 2019 13:33:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <874l2ihbgg.fsf@epam.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMTUvMDgvMjAxOSAxMzoxNCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gT24gMTUvMDgvMjAxOSAxMjoyNCwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGkgVm9sb2R5bXlyLAo+Pj4KPj4+IE9uIDE1LzA4LzIwMTkg
MTI6MjAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4+Cj4+Pj4gSGkgU3RlZmFubywKPj4+
Pgo+Pj4+IFN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cj4+Pj4KPj4+Pj4gT24gVHVlLCAxMyBB
dWcgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4+Pj4gQEAgLTE2Miw2ICsxNTYs
MTAgQEAgc3RhdGljIHZvaWQgX19pbml0Cj4+Pj4+Pj4gcHJvY2Vzc19tZW1vcnlfbm9kZShjb25z
dCB2b2lkICpmZHQsIGludCBub2RlLAo+Pj4+Pj4+ICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGlu
Zm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKPj4+Pj4+PiAgIGJvb3RpbmZvLm1lbS5ucl9i
YW5rcysrOwo+Pj4+Pj4+ICAgfQo+Pj4+Pj4+ICsKPj4+Pj4+PiArIGlmICggYm9vdGluZm8ubWVt
Lm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyApCj4+Pj4+Pj4gKyByZXR1cm4gLUVOT1NQQzsKPj4+
Pj4+IEFyZSB5b3Ugc3VyZSB0aGF0IHRoaXMgbG9naWMgaXMgY29ycmVjdD8KPj4+Pj4+Cj4+Pj4+
PiBGb3IgZXhhbXBsZSwgaWYgTlJfTUVNX0JBTktTIGlzIDEsIGFuZCB3ZSBoYXZlIGV4YWN0bHkg
b25lIG1lbW9yeSBub2RlCj4+Pj4+PiBpbiBkZXZpY2UgdHJlZSwgdGhpcyBmdW5jdGlvbiB3aWxs
IGZhaWwuIEJ1dCBpdCBzaG91bGQgbm90LiBJIHRoaW5rIHlvdQo+Pj4+Pj4gd2FudCB0aGlzIGNv
bmRpdGlvbjogYm9vdGluZm8ubWVtLm5yX2JhbmtzID4gTlJfTUVNX0JBTktTCj4+Pj4+Cj4+Pj4+
IFlvdSBhcmUgcmlnaHQsIGlmIE5SX01FTV9CQU5LUyBpcyAxIGFuZCB3ZSBoYXZlIDEgbWVtb3J5
IG5vZGUgaW4gZGV2aWNlCj4+Pj4+IHRyZWUgdGhlIGNvZGUgd291bGQgcmV0dXJuIGFuIGVycm9y
IHdoaWxlIGFjdHVhbGx5IGl0IGlzIG5vcm1hbC4KPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGUgcmln
aHQgY2hlY2sgd291bGQgYmU6Cj4+Pj4+Cj4+Pj4+ICAgaWYgKCBpIDwgYmFua3MgJiYgYm9vdGlu
Zm8ubWVtLm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyApCj4+Pj4+ICAgcmV0dXJuIC1FTk9TUEM7
Cj4+Pj4KPj4+PiBBY3R1YWxseSwgdGhpcyBkb2VzIG5vdCBjb3ZlciBhbGwgY29ybmVyIGNhc2Vz
LiBIZXJlIGlzIHRoZSByZXN1bHRpbmcKPj4+PiBjb2RlOgo+Pj4+Cj4+Pj4gICAxNTAgZm9yICgg
aSA9IDA7IGkgPCBiYW5rcyAmJiBib290aW5mby5tZW0ubnJfYmFua3MgPCBOUl9NRU1fQkFOS1M7
IGkrKyApCj4+Pj4gICAxNTEgewo+Pj4+ICAgMTUyIGRldmljZV90cmVlX2dldF9yZWcoJmNlbGws
IGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsCj4+Pj4gJnN0YXJ0LCAmc2l6ZSk7Cj4+Pj4gICAx
NTMgaWYgKCAhc2l6ZSApCj4+Pj4gICAxNTQgY29udGludWU7Cj4+Pj4gICAxNTUgYm9vdGluZm8u
bWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zdGFydCA9IHN0YXJ0Owo+Pj4+ICAgMTU2
IGJvb3RpbmZvLm1lbS5iYW5rW2Jvb3RpbmZvLm1lbS5ucl9iYW5rc10uc2l6ZSA9IHNpemU7Cj4+
Pj4gICAxNTcgYm9vdGluZm8ubWVtLm5yX2JhbmtzKys7Cj4+Pj4gICAxNTggfQo+Pj4+ICAgMTU5
Cj4+Pj4gICAxNjAgaWYgKCBpIDwgYmFua3MgJiYgYm9vdGluZm8ubWVtLm5yX2JhbmtzID09IE5S
X01FTV9CQU5LUyApCj4+Pj4gICAxNjEgcmV0dXJuIC1FTk9TUEM7Cj4+Pj4KPj4+PiBMaW5lcyAx
NTMtMTU0IGNhdXNlIHRoZSBpc3N1ZS4KPj4+Pgo+Pj4+IEltYWdpbmUgdGhhdCBOUl9NRU1fQkFO
S1MgPSAxIGFuZCB3ZSBoYXZlIHR3byBtZW1vcnkgbm9kZXMgaW4gZGV2aWNlCj4+Pj4gdHJlZSB3
aXRoLiBOb2RlcyBoYXZlIHNpemVzIDAgYW5kIDEwMjQuIFlvdXIgY29kZSB3aWxsIHdvcmsgYXMK
Pj4+PiBpbnRlbmRlZC4gQXQgdGhlIGVuZCBvZiBsb29wIHdlIHdpbGwgaGF2ZSBiYW5rcyA9IDIs
IGkgPSAyIGFuZAo+Pj4+IGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9IDEuCj4+Pj4KPj4+PiBCdXQg
aWYgd2Ugc3dpdGNoIG9yZGVyIG9mIG1lbW9yeSBub2Rlcywgc28gZmlyc3Qgb25lIHdpbGwgYmUg
d2l0aCBzaXplCj4+Pj4gMTAyNCBhbmQgc2Vjb25kIG9uZSB3aXRoIHNpemUgMCwgeW91ciBjb2Rl
IHdpbGwgcmV0dXJuIC1FTk9TUEMsIGJlY2F1c2UKPj4+PiB3ZSdsbCBoYXZlIGJhbmtzID0gMiwg
aSA9IDEsIGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9IDEuCj4+Pj4KPj4+PiBJIHRoaW5rLCByaWdo
dCBzb2x1dGlvbiB3aWxsIGJlIHRvIHNjYW4gYWxsIG5vZGVzIHRvIGNvdW50IG5vZGVzCj4+Pj4g
d2l0aCBzaXplID4gMC4gQW5kIHRoZW4gLSBlaXRoZXIgcmV0dXJuIGFuIGVycm9yIG9yIGRvIHNl
Y29uZCBsb29wIHRvCj4+Pj4gZmlsbCBib290aW5mby5tZW0uYmFua1tdLgo+Pj4KPj4+IFRvIGJl
IGhvbmVzdCwgYSBtZW1vcnkgd2l0aCBzaXplIDAgaXMgYW4gZXJyb3IgaW4gdGhlIERUCj4+PiBw
cm92aWRlZC4gU28gSSB3b3VsZCBub3QgY2FyZSB0b28gbXVjaCBpZiBYZW4gaXMgbm90IHdvcmtp
bmcgYXMKPj4+IGludGVuZGVkLgo+Pj4KPj4+IElmIHdlIHdhbnQgdG8gZml4IHRoaXMsIHRoZW4g
d2Ugc2hvdWxkIGJhaWwgb3V0IGFzIHdlIGRvIGZvciBtaXNzaW5nCj4+PiAncmVncycgYW5kIGlu
dmFsaWQgJ2FkZHJlc3MtY2VsbHMnLydzaXplLWNlbGxzJy4KPj4KPj4gSSBzZW5kIHRoaXMgdG9v
IGVhcmx5LiBJIGZvcmdvdCB0byBtZW50aW9uIHRoYXQgSSB3b3VsZCBub3QgYmUgaGFwcHkKPj4g
d2l0aCBwYXJzaW5nIHRoZSBEZXZpY2UtVHJlZSB0d2ljZSBqdXN0IGZvciBiZW5lZml0cyBvZiB3
cm9uZyBEVC4gSWYgYQo+PiBEVCBpcyB3cm9uZyB0aGVuIHdlIHNob3VsZCB0cmVhdCBhcyBzdWNo
IGFuZCBzaG91dCBhdCB0aGUgdXNlci4KPiBGYWlyIGVub3VnaC4gQnV0IHRoZW4gYXQgbGluZSAx
NTQgd2UgbmVlZCB0byByZXR1cm4gYW4gZXJyb3IsIGluc3RlYWQgb2YKPiBjb250aW51aW5nIHRo
ZSBpdGVyYXRpb25zLiBBbmQgaW4gdGhpcyBjYXNlIHdlIGNhbiBzaW1wbGlmeSB0aGUgZXJyb3IK
PiBjaGVjayB0byAoYmFua3MgPiBOUl9NRU1fQkFOS1MpLgoKSSBhbSBhZnJhaWQgdGhpcyB3b3Vs
ZCBub3QgYmUgY29ycmVjdC4gSXQgaXMgYWxsb3dlZCB0byBoYXZlIG11bHRpcGxlIG1lbW9yeSAK
bm9kZXMgaW4gdGhlIGRldmljZS10cmVlLiBUaGlzIGZ1bmN0aW9uIG9ubHkgZGVhbCB3aXRoIG9u
ZSBub2RlIGF0IHRoZSB0aW1lcy4KCkluIHBhcnRpY3VsYXIgYmFua3MgaXMgdGhlIG51bWJlciBv
ZiByZWdpb25zIGRlc2NyaWJlZCBpbiB0aGUgbm9kZS4gV2l0aCB0aGUgCmNoZWNrIHlvdSBzdWdn
ZXN0LCB5b3Ugd291bGQgb25seSBjYXRjaCB0aGUgY2FzZSB3aGVyZSBhIG5vZGUgY29udGFpbiBt
b3JlIGJhbmtzIAp0aGFuIHN1cHBvcnRlZC4gSXQgZG9lcyBub3QgdGVsbCB5b3Ugd2hldGhlciB0
aGVyZSBhcmUgZW5vdWdoIHNwYWNlIGxlZnQgaW4gCm1lbS5iYW5rWy4uLl0gdG8gY2F0ZXIgdGhl
IHJlZ2lvbnMgZGVzY3JpYmVkIGJ5IHRoZSBub2RlLgoKU28gd2UgbmVlZCB0aGUgY2hlY2sgc3Vn
Z2VzdGVkIGJ5IFN0ZWZhbm8uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
