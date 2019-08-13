Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D858BBFA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:48:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxY3x-0003aC-MN; Tue, 13 Aug 2019 14:46:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxY3w-0003a7-NV
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:46:12 +0000
X-Inumbo-ID: 177f3fac-bdd9-11e9-b076-8bd391c5d47f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 177f3fac-bdd9-11e9-b076-8bd391c5d47f;
 Tue, 13 Aug 2019 14:46:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2DC4344;
 Tue, 13 Aug 2019 07:46:10 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9835C3F706;
 Tue, 13 Aug 2019 07:46:09 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-3-sstabellini@kernel.org> <87ef1pgn4c.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <75f9a42a-f691-2cf2-b9e8-289c05f66286@arm.com>
Date: Tue, 13 Aug 2019 15:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87ef1pgn4c.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/7] xen/arm: keep track of
 reserved-memory regions
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
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzEzLzE5IDM6MjMgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IFN0
ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cj4gCj4+IEFzIHdlIHBhcnNlIHRoZSBkZXZpY2UgdHJl
ZSBpbiBYZW4sIGtlZXAgdHJhY2sgb2YgdGhlIHJlc2VydmVkLW1lbW9yeQo+PiByZWdpb25zIGFz
IHRoZXkgbmVlZCBzcGVjaWFsIHRyZWF0bWVudCAoZm9sbG93LXVwIHBhdGNoZXMgd2lsbCBtYWtl
IHVzZQo+PiBvZiB0aGUgc3RvcmVkIGluZm9ybWF0aW9uLikKPj4KPj4gUmV1c2UgcHJvY2Vzc19t
ZW1vcnlfbm9kZSB0byBhZGQgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gdGhlCj4+IGJvb3Rp
bmZvLnJlc2VydmVkX21lbSBhcnJheS4KPj4KPj4gUmVmdXNlIHRvIGNvbnRpbnVlIG9uY2Ugd2Ug
cmVhY2ggdGhlIG1heCBudW1iZXIgb2YgcmVzZXJ2ZWQgbWVtb3J5Cj4+IHJlZ2lvbnMgdG8gYXZv
aWQgYWNjaWRlbnRhbGx5IG1hcHBpbmcgYW55IHBvcnRpb25zIG9mIHRoZW0gaW50byBhIFZNLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5j
b20+Cj4+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHY1Ogo+PiAtIHJlbW92ZSB1bm5lZWRlZCBjYXN0
Cj4+IC0gcmVtb3ZlIHVubmVlZGVkIHN0cmxlbiBjaGVjawo+PiAtIGRvbid0IHBhc3MgYWRkcmVz
c19jZWxscywgc2l6ZV9jZWxscywgZGVwdGggdG8gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZQo+
Pgo+PiBDaGFuZ2VzIGluIHY0Ogo+PiAtIGRlcHRoICsgMSBpbiBwcm9jZXNzX3Jlc2VydmVkX21l
bW9yeV9ub2RlCj4+IC0gcGFzcyBhZGRyZXNzX2NlbGxzIGFuZCBzaXplX2NlbGxzIHRvIGRldmlj
ZV90cmVlX2Zvcl9lYWNoX25vZGUKPj4gLSBwYXNzIHN0cnVjdCBtZW1pbmZvICogaW5zdGVhZCBv
ZiBhIGJvb2xlYW4gdG8gcHJvY2Vzc19tZW1vcnlfbm9kZQo+PiAtIGltcHJvdmUgaW4tY29kZSBj
b21tZW50Cj4+IC0gdXNlIGEgc2VwYXJhdGUgcHJvY2Vzc19yZXNlcnZlZF9tZW1vcnlfbm9kZSAo
c2VwYXJhdGUgZnJvbQo+PiAgICBwcm9jZXNzX21lbW9yeV9ub2RlKSBmdW5jdGlvbiB3cmFwcGVy
IHRvIGhhdmUgZGlmZmVyZW50IGVycm9yIGhhbmRsaW5nCj4+Cj4+IENoYW5nZXMgaW4gdjM6Cj4+
IC0gbWF0Y2ggb25seSAvcmVzZXJ2ZWQtbWVtb3J5Cj4+IC0gcHV0IHRoZSB3YXJuaW5nIGJhY2sg
aW4gcGxhY2UgZm9yIHJlZyBub3QgcHJlc2VudCBvbiBhIG5vcm1hbCBtZW1vcnkKPj4gICAgcmVn
aW9uCj4+IC0gcmVmdXNlIHRvIGNvbnRpbnVlIG9uY2Ugd2UgcmVhY2ggdGhlIG1heCBudW1iZXIg
b2YgcmVzZXJ2ZWQgbWVtb3J5Cj4+ICAgIHJlZ2lvbnMKPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4g
LSBjYWxsIHByb2Nlc3NfbWVtb3J5X25vZGUgZnJvbSBwcm9jZXNzX3Jlc2VydmVkX21lbW9yeV9u
b2RlIHRvIGF2b2lkCj4+ICAgIGR1cGxpY2F0aW9uCj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9i
b290ZmR0LmMgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0K
Pj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggfCAgMSArCj4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAzNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPj4gaW5kZXgg
NTkwYjE0MzA0Yy4uMGIwZTIyYTNkMCAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3Rm
ZHQuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4+IEBAIC0xMzYsNiArMTM2LDcg
QEAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQs
IGludCBub2RlLAo+PiAgICAgICBjb25zdCBfX2JlMzIgKmNlbGw7Cj4+ICAgICAgIHBhZGRyX3Qg
c3RhcnQsIHNpemU7Cj4+ICAgICAgIHUzMiByZWdfY2VsbHMgPSBhZGRyZXNzX2NlbGxzICsgc2l6
ZV9jZWxsczsKPj4gKyAgICBzdHJ1Y3QgbWVtaW5mbyAqbWVtID0gZGF0YTsKPj4KPj4gICAgICAg
aWYgKCBhZGRyZXNzX2NlbGxzIDwgMSB8fCBzaXplX2NlbGxzIDwgMSApCj4+ICAgICAgICAgICBy
ZXR1cm4gLUVOT0VOVDsKPj4gQEAgLTE0NywyMSArMTQ4LDQ2IEBAIHN0YXRpYyBpbnQgX19pbml0
IHByb2Nlc3NfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKPj4gICAgICAg
Y2VsbCA9IChjb25zdCBfX2JlMzIgKilwcm9wLT5kYXRhOwo+PiAgICAgICBiYW5rcyA9IGZkdDMy
X3RvX2NwdShwcm9wLT5sZW4pIC8gKHJlZ19jZWxscyAqIHNpemVvZiAodTMyKSk7Cj4+Cj4+IC0g
ICAgZm9yICggaSA9IDA7IGkgPCBiYW5rcyAmJiBib290aW5mby5tZW0ubnJfYmFua3MgPCBOUl9N
RU1fQkFOS1M7IGkrKyApCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBiYW5rcyAmJiBtZW0tPm5y
X2JhbmtzIDwgTlJfTUVNX0JBTktTOyBpKysgKQo+IFdoYXQgaXMgbG9naWMgYmVoaW5kIHRoZSBz
ZWNvbmQgcGFydCBvZiB0aGUgbG9vcCBjb25kaXRpb24/Cj4gCj4gWW91IGtub3cgdGhhdCBpZiAo
YmFua3MgPiBOUl9NRU1fQkFOS1MpIHRoZW4geW91IHdpbGwgZXhpdCB3aXRoIGVycm9yLiBEbwo+
IHlvdSByZWFsbHkgbmVlZCB0byBpdGVyYXRlIG92ZXIgbG9vcCBpbiB0aGlzIGNhc2U/CgpXZWxs
LCB0aGUgZXJyb3IgaXMgaWdub3JlZCBpbiB0aGUgY2FzZSBvZiBtZW1vcnkgYmFua3MuIFNvIGl0
ZXJhdGluZyAKb3ZlciB0aGUgZmlyc3QgYmFua3MgYWxsb3dzIHlvdSB0byBmaWxsIHVwIGJvb3Rp
bmZvIHdpdGggYXMgbXVjaCBhcyAKcG9zc2libGUgYXMgUkFNLiBUaGUgcmVzdCBvZiB0aGUgUkFN
IHdpbGwgbm90IGJlIHVzZWQgYnkgWGVuLgoKPiAKPj4gICAgICAgewo+PiAgICAgICAgICAgZGV2
aWNlX3RyZWVfZ2V0X3JlZygmY2VsbCwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscywgJnN0YXJ0
LCAmc2l6ZSk7Cj4+ICAgICAgICAgICBpZiAoICFzaXplICkKPj4gICAgICAgICAgICAgICBjb250
aW51ZTsKPj4gLSAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2Jhbmtz
XS5zdGFydCA9IHN0YXJ0Owo+PiAtICAgICAgICBib290aW5mby5tZW0uYmFua1tib290aW5mby5t
ZW0ubnJfYmFua3NdLnNpemUgPSBzaXplOwo+PiAtICAgICAgICBib290aW5mby5tZW0ubnJfYmFu
a3MrKzsKPj4gKyAgICAgICAgbWVtLT5iYW5rW21lbS0+bnJfYmFua3NdLnN0YXJ0ID0gc3RhcnQ7
Cj4+ICsgICAgICAgIG1lbS0+YmFua1ttZW0tPm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKPj4gKyAg
ICAgICAgbWVtLT5ucl9iYW5rcysrOwo+PiAgICAgICB9Cj4+Cj4+IC0gICAgaWYgKCBib290aW5m
by5tZW0ubnJfYmFua3MgPT0gTlJfTUVNX0JBTktTICkKPj4gKyAgICBpZiAoIG1lbS0+bnJfYmFu
a3MgPT0gTlJfTUVNX0JBTktTICkKPiBMb29rcyBsaWtlIHlvdSBoYXZlIHRoZSBzYW1lIG9mZi1i
eS1vbmUgZXJyb3IsIGFzIGluIHByZXZpb3VzIHBhdGNoLgo+IEkgY2FuIHNlZSB0aGF0IGl0IHdh
cyB0aGVyZSBlYXJsaWVyLiBCdXQgaXQgaXMgZ29vZCB0aW1lIHRvIGZpeCBpdC4KCkkgZG9uJ3Qg
dGhpbmsgdGhlcmUgd2FzIGFuIG9mZi1ieS1vbmUgZXJyb3IgYmVmb3JlIHRoaXMgc2VyaWVzLiBT
byB3aGF0IApkbyB5b3UgbWVhbj8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
