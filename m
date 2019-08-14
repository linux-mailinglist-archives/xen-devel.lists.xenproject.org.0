Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C58D38E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 14:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxshm-0002gn-LZ; Wed, 14 Aug 2019 12:48:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxshl-0002gi-AS
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 12:48:41 +0000
X-Inumbo-ID: d59d0ff6-be91-11e9-9c1c-2b2d6057a54e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d59d0ff6-be91-11e9-9c1c-2b2d6057a54e;
 Wed, 14 Aug 2019 12:48:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43CC828;
 Wed, 14 Aug 2019 05:48:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC6BA3F706;
 Wed, 14 Aug 2019 05:48:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6ded4085-f54e-39fa-ac64-263893b4c8b5@arm.com>
Date: Wed, 14 Aug 2019 13:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812222844.9636-3-sstabellini@kernel.org>
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEyLzA4LzIwMTkgMjM6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBBcyB3ZSBwYXJzZSB0aGUgZGV2aWNlIHRyZWUgaW4gWGVuLCBrZWVwIHRyYWNrIG9mIHRo
ZSByZXNlcnZlZC1tZW1vcnkKPiByZWdpb25zIGFzIHRoZXkgbmVlZCBzcGVjaWFsIHRyZWF0bWVu
dCAoZm9sbG93LXVwIHBhdGNoZXMgd2lsbCBtYWtlIHVzZQo+IG9mIHRoZSBzdG9yZWQgaW5mb3Jt
YXRpb24uKQo+IAo+IFJldXNlIHByb2Nlc3NfbWVtb3J5X25vZGUgdG8gYWRkIHJlc2VydmVkLW1l
bW9yeSByZWdpb25zIHRvIHRoZQo+IGJvb3RpbmZvLnJlc2VydmVkX21lbSBhcnJheS4KPiAKPiBS
ZWZ1c2UgdG8gY29udGludWUgb25jZSB3ZSByZWFjaCB0aGUgbWF4IG51bWJlciBvZiByZXNlcnZl
ZCBtZW1vcnkKPiByZWdpb25zIHRvIGF2b2lkIGFjY2lkZW50YWxseSBtYXBwaW5nIGFueSBwb3J0
aW9ucyBvZiB0aGVtIGludG8gYSBWTS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gCj4gLS0tCj4gQ2hhbmdlcyBpbiB2NToKPiAt
IHJlbW92ZSB1bm5lZWRlZCBjYXN0Cj4gLSByZW1vdmUgdW5uZWVkZWQgc3RybGVuIGNoZWNrCj4g
LSBkb24ndCBwYXNzIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsIGRlcHRoIHRvIGRldmljZV90
cmVlX2Zvcl9lYWNoX25vZGUKPiAKPiBDaGFuZ2VzIGluIHY0Ogo+IC0gZGVwdGggKyAxIGluIHBy
b2Nlc3NfcmVzZXJ2ZWRfbWVtb3J5X25vZGUKPiAtIHBhc3MgYWRkcmVzc19jZWxscyBhbmQgc2l6
ZV9jZWxscyB0byBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlCj4gLSBwYXNzIHN0cnVjdCBtZW1p
bmZvICogaW5zdGVhZCBvZiBhIGJvb2xlYW4gdG8gcHJvY2Vzc19tZW1vcnlfbm9kZQo+IC0gaW1w
cm92ZSBpbi1jb2RlIGNvbW1lbnQKPiAtIHVzZSBhIHNlcGFyYXRlIHByb2Nlc3NfcmVzZXJ2ZWRf
bWVtb3J5X25vZGUgKHNlcGFyYXRlIGZyb20KPiAgICBwcm9jZXNzX21lbW9yeV9ub2RlKSBmdW5j
dGlvbiB3cmFwcGVyIHRvIGhhdmUgZGlmZmVyZW50IGVycm9yIGhhbmRsaW5nCj4gCj4gQ2hhbmdl
cyBpbiB2MzoKPiAtIG1hdGNoIG9ubHkgL3Jlc2VydmVkLW1lbW9yeQo+IC0gcHV0IHRoZSB3YXJu
aW5nIGJhY2sgaW4gcGxhY2UgZm9yIHJlZyBub3QgcHJlc2VudCBvbiBhIG5vcm1hbCBtZW1vcnkK
PiAgICByZWdpb24KPiAtIHJlZnVzZSB0byBjb250aW51ZSBvbmNlIHdlIHJlYWNoIHRoZSBtYXgg
bnVtYmVyIG9mIHJlc2VydmVkIG1lbW9yeQo+ICAgIHJlZ2lvbnMKPiAKPiBDaGFuZ2VzIGluIHYy
Ogo+IC0gY2FsbCBwcm9jZXNzX21lbW9yeV9ub2RlIGZyb20gcHJvY2Vzc19yZXNlcnZlZF9tZW1v
cnlfbm9kZSB0byBhdm9pZAo+ICAgIGR1cGxpY2F0aW9uCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0v
Ym9vdGZkdC5jICAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
Cj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggfCAgMSArCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gaW5kZXggNTkw
YjE0MzA0Yy4uMGIwZTIyYTNkMCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5j
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+IEBAIC0xMzYsNiArMTM2LDcgQEAgc3Rh
dGljIGludCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBu
b2RlLAo+ICAgICAgIGNvbnN0IF9fYmUzMiAqY2VsbDsKPiAgICAgICBwYWRkcl90IHN0YXJ0LCBz
aXplOwo+ICAgICAgIHUzMiByZWdfY2VsbHMgPSBhZGRyZXNzX2NlbGxzICsgc2l6ZV9jZWxsczsK
PiArICAgIHN0cnVjdCBtZW1pbmZvICptZW0gPSBkYXRhOwo+ICAgCj4gICAgICAgaWYgKCBhZGRy
ZXNzX2NlbGxzIDwgMSB8fCBzaXplX2NlbGxzIDwgMSApCj4gICAgICAgICAgIHJldHVybiAtRU5P
RU5UOwo+IEBAIC0xNDcsMjEgKzE0OCw0NiBAQCBzdGF0aWMgaW50IF9faW5pdCBwcm9jZXNzX21l
bW9yeV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gICAgICAgY2VsbCA9IChjb25z
dCBfX2JlMzIgKilwcm9wLT5kYXRhOwo+ICAgICAgIGJhbmtzID0gZmR0MzJfdG9fY3B1KHByb3At
PmxlbikgLyAocmVnX2NlbGxzICogc2l6ZW9mICh1MzIpKTsKPiAgIAo+IC0gICAgZm9yICggaSA9
IDA7IGkgPCBiYW5rcyAmJiBib290aW5mby5tZW0ubnJfYmFua3MgPCBOUl9NRU1fQkFOS1M7IGkr
KyApCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGJhbmtzICYmIG1lbS0+bnJfYmFua3MgPCBOUl9N
RU1fQkFOS1M7IGkrKyApCj4gICAgICAgewo+ICAgICAgICAgICBkZXZpY2VfdHJlZV9nZXRfcmVn
KCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLCAmc3RhcnQsICZzaXplKTsKPiAgICAg
ICAgICAgaWYgKCAhc2l6ZSApCj4gICAgICAgICAgICAgICBjb250aW51ZTsKPiAtICAgICAgICBi
b290aW5mby5tZW0uYmFua1tib290aW5mby5tZW0ubnJfYmFua3NdLnN0YXJ0ID0gc3RhcnQ7Cj4g
LSAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0g
c2l6ZTsKPiAtICAgICAgICBib290aW5mby5tZW0ubnJfYmFua3MrKzsKPiArICAgICAgICBtZW0t
PmJhbmtbbWVtLT5ucl9iYW5rc10uc3RhcnQgPSBzdGFydDsKPiArICAgICAgICBtZW0tPmJhbmtb
bWVtLT5ucl9iYW5rc10uc2l6ZSA9IHNpemU7Cj4gKyAgICAgICAgbWVtLT5ucl9iYW5rcysrOwo+
ICAgICAgIH0KPiAgIAo+IC0gICAgaWYgKCBib290aW5mby5tZW0ubnJfYmFua3MgPT0gTlJfTUVN
X0JBTktTICkKPiArICAgIGlmICggbWVtLT5ucl9iYW5rcyA9PSBOUl9NRU1fQkFOS1MgKQoKQXNz
dW1pbmcgdGhlIG9mZi1ieS1vbmUgaXMgZ29pbmcgdG8gYmUgZml4ZWQgaW4gcGF0Y2ggIzI6CgpB
Y2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
