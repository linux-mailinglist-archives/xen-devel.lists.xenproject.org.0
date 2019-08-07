Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC9850E4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOc5-0004AG-9Q; Wed, 07 Aug 2019 16:16:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvOc3-0004AB-93
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:16:31 +0000
X-Inumbo-ID: b592f224-b92e-11e9-949c-23f845d3018f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b592f224-b92e-11e9-949c-23f845d3018f;
 Wed, 07 Aug 2019 16:16:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B65344;
 Wed,  7 Aug 2019 09:16:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 239653F694;
 Wed,  7 Aug 2019 09:16:27 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-1-sstabellini@kernel.org>
 <532408cc-6352-9eee-cee1-0535df8a2c93@arm.com>
Message-ID: <f4c7d444-85d2-f3e7-b7bc-4f0f35427c90@arm.com>
Date: Wed, 7 Aug 2019 17:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <532408cc-6352-9eee-cee1-0535df8a2c93@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/7] xen/arm: extend
 device_tree_for_each_node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNy8wOC8yMDE5IDE3OjA4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywK
PiAKPiBPbiAwNi8wOC8yMDE5IDIyOjQ5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IEFk
ZCBuZXcgcGFyYW1ldGVycyB0byBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlOiBub2RlLCBkZXB0
aCwKPj4gYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscy4KPiAKPiBhZGRyZXNzX2NlbGxzIChyZXNw
LiBzaXplX2NlbGxzKSBhcmUgbmFtZWQgYWRkcmVzc19jZWxsc19wIChyZXNwLiBzaXplX2NlbGxz
X3ApIAo+IGluIHRoZSBjb2RlLgo+IAo+IEJ1dCBJIGFtIG5vdCBjb252aW5jZWQgeW91IG5lZWQg
dGhlbS4gUGVyIHRoZSBEVCBzcGVjICh2MC4yIHNlY3Rpb24gMi4zLjUpLCB0aGUgCj4gcGFyZW50
IHNob3VsZCBlaXRoZXIgY29udGFpbiB0aGUgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxz
IG9yIGRlZmF1bHQgCj4gdmFsdWVzIChyZXNwLiAyIGFuZCAxKSB3aWxsIGJlIHVzZWQuIEl0IGlz
IGNsZWFybHkgc3RhdGVkIHRoYXQgdmFsdWVzIGFyZSBub3QgCj4gaW5oZXJpdGVkIGZyb20gdGhl
IGFuY2VzdG9ycy4KPiAKPiBTbyB0ZWNobmljYWxseSB0aGUgaW1wbGVtZW50YXRpb24gb2YgZGV2
aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSgpIGlzIGluY29ycmVjdC4gCj4gSWYgeW91IGZvbGxvdyB0
aGUgc3BlYyBoZXJlLCB0aGVuIHRoZSBhZGRyZXNzX2NlbGxzX3AgYW5kIHNpemVfY2VsbHNfcCB3
b3VsZCAKPiBiZWNvbWUgdW5uZWNlc3NhcnkuCj4gCj4+IE5vZGUgaXMgdGhlIHBhcmVudCBub2Rl
IHRvIHN0YXJ0IHRoZSBzZWFyY2ggZnJvbTsKPj4gZGVwdGggaXMgdGhlIG1pbiBkZXB0aCBvZiB0
aGUgc2VhcmNoICh0aGUgZGVwdGggb2YgdGhlIHBhcmVudCBub2RlKTsKCkFjdHVhbGx5LCBvbiB0
aGUgcHJldmlvdXMgdmVyc2lvbiBbMV0geW91IGFncmVlZCB0aGF0IHRoaXMgc2hvdWxkIGJlIHRo
ZSAKY2hpbGRyZW4gZGVwdGggbm9kZSBhbmQgbm90IHRoZSBwYXJlbnQgbm9kZS4gV2h5IGhhc24n
dCBpdCBiZWVuIGNoYW5nZWQ/Cgo+PiBhZGRyZXNzX2NlbGxzIGFuZCBzaXplX2NlbGxzIGFyZSB0
aGUgcmVzcGVjdGl2ZSBwYXJhbWV0ZXJzIGF0IHRoZSBwYXJlbnQKPj4gbm9kZS4gUGFzc2luZyAw
LCAwLCAwLCAwIHRyaWdnZXJzIHRoZSBvbGQgYmVoYXZpb3IuCj4+IFdlIG5lZWQgdGhpcyBjaGFu
Z2UgYmVjYXVzZSBpbiBmb2xsb3ctdXAgcGF0Y2hlcyB3ZSB3YW50IHRvIGJlIGFibGUgdG8KPj4g
dXNlIHJldXNlIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUgdG8gY2FsbCBhIGZ1bmN0aW9uIGZv
ciBlYWNoIGNoaWxkcmVuCj4+IG5vZGVzIG9mIGEgcHJvdmlkZWQgbm9kZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+PiAtLS0K
Pj4gQ2hhbmdlcyBpbiB2NDoKPj4gLSBhZGQgYWRkcmVzc19jZWxscyBhbmQgc2l6ZV9jZWxscyBw
YXJhbWV0ZXJzCj4+Cj4+IENoYW5nZXMgaW4gdjM6Cj4+IC0gaW1wcm92ZSBjb21taXQgbWVzc2Fn
ZQo+PiAtIGltcHJvdmUgaW4tY29kZSBjb21tZW50cwo+PiAtIGltcHJvdmUgY29kZSBzdHlsZQo+
Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIG5ldwo+PiAtLS0KPj4gwqAgeGVuL2FyY2gvYXJtL2Fj
cGkvYm9vdC5jwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5j
wqDCoMKgwqDCoMKgwqAgfCAyMSArKysrKysrKysrKysrKystLS0tLS0KPj4gwqAgeGVuL2luY2x1
ZGUveGVuL2RldmljZV90cmVlLmggfMKgIDYgKysrKy0tCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9hY3BpL2Jvb3QuYyBiL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYwo+PiBpbmRleCA5
YjI5NzY5YTEwLi5kMjc1ZjhjNTM1IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYWNwaS9i
b290LmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jCj4+IEBAIC0yNDgsNyArMjQ4
LDcgQEAgaW50IF9faW5pdCBhY3BpX2Jvb3RfdGFibGVfaW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKg
wqAgKi8KPj4gwqDCoMKgwqDCoCBpZiAoIHBhcmFtX2FjcGlfb2ZmIHx8ICggIXBhcmFtX2FjcGlf
Zm9yY2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICYmIAo+PiBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKGRldmljZV90cmVl
X2ZsYXR0ZW5lZCwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZHRfc2Nhbl9kZXB0aDFfbm9kZXMsIE5VTEwpKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwgMCwgMCwgMCwg
ZHRfc2Nhbl9kZXB0aDFfbm9kZXMsIE5VTEwpKSkKPiAKPiBOSVQ6IENhbiB3ZSBzcGxpdCB0aGUg
aWY/Cj4gCj4gQ2hlZXJzLAo+IAoKWzFdIDxhbHBpbmUuREVCLjIuMjEuMTkwODA2MTIwNjAwMC4y
NDUxQHNzdGFiZWxsaW5pLVRoaW5rUGFkLVQ0ODBzPgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
