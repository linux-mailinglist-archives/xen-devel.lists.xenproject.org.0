Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FEC9C87
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 12:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFyYG-0006Qv-8Z; Thu, 03 Oct 2019 10:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFyYE-0006Qq-OQ
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 10:41:38 +0000
X-Inumbo-ID: 5f797552-e5ca-11e9-80e3-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5f797552-e5ca-11e9-80e3-bc764e2007e4;
 Thu, 03 Oct 2019 10:41:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B70B21000;
 Thu,  3 Oct 2019 03:41:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B4A23F739;
 Thu,  3 Oct 2019 03:41:34 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-6-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021451120.2691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <576faa70-715e-0b50-23c5-a136726fb403@arm.com>
Date: Thu, 3 Oct 2019 11:41:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910021451120.2691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 5/6] xen/arm: mm: Mark
 check_memory_layout_alignment_constraints as unused
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMi8xMC8yMDE5IDIzOjI2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2Vk
LCAyIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENsYW5nIHdpbGwgdGhyb3cgYW4g
ZXJyb3IgaWYgYSBmdW5jdGlvbiBpcyB1bnVzZWQgdW5sZXNzIHlvdSB0ZWxsCj4+IHRvIGlnbm9y
ZSBpdC4gVGhpcyBjYW4gYmUgZG9uZSB1c2luZyBfX21heWJlX3VudXNlZC4KPj4KPj4gV2hpbGUg
bW9kaWZ5aW5nIHRoZSBkZWNsYXJhdGlvbiwgdXBkYXRlIGl0IHRvIG1hdGNoIHByb3RvdHlwZSBv
ZiBzaW1pbGFyCj4+IGZ1bmN0aW9ucyAoc2VlIGJ1aWxkX2Fzc2VydGlvbnMpLiBUaGlzIGhlbHBz
IHRvIHVuZGVyc3RhbmQgdGhhdCB0aGUgc29sZQo+PiBwdXJwb3NlIG9mIHRoZSBmdW5jdGlvbiBp
cyB0byBob2xkIEJVSUxEX0JVR19PTigpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IEknZCBsaWtlIHNvbWV0aGluZyBsaWtlICJO
b3RlIHRoYXQgdGhlIGZ1bmN0aW9uIGlzIG5vdyBtYXJrZWQgYXMgX19pbml0Igo+IHRvIHRoZSBj
b21taXQgbWVzc2FnZSwgYnV0IGluIGFueSBjYXNlOgoKVGhpcyBpcyBhbHJlYWR5IGltcGxpZWQg
d2l0aCAidXBkYXRlIGl0IHRvIG1hdGNoIHByb3RvdHlwZSBvZiBzaW1pbGFyIGZ1bmN0aW9ucyIu
Cgo0MnNoPiBncmVwICJidWlsZF9hc3NlcnRpb25zIgoKPiAKPiBBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IAo+PiAtLS0KPj4gICAgICBD
aGFuZ2VzIGluIHYyOgo+PiAgICAgICAgICAtIFVwZGF0ZSB0aGUgcHJvdG90eXBlIHRvIG1hdGNo
IHN0eWxlIG9mIG90aGVyIGZ1bmN0aW9ucyBob2xkaW5nCj4+ICAgICAgICAgIG9uIGJ1aWxkIGFz
c2VydGlvbnMuCj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9tbS5jIHwgMyArKy0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+IGluZGV4IDllMGZk
YzM5ZjkuLmJlMjNhY2ZlMjYgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+IEBAIC0xOTAsNyArMTkwLDggQEAgdW5zaWduZWQgbG9u
ZyB0b3RhbF9wYWdlczsKPj4gICBleHRlcm4gY2hhciBfX2luaXRfYmVnaW5bXSwgX19pbml0X2Vu
ZFtdOwo+PiAgIAo+PiAgIC8qIENoZWNraW5nIFZBIG1lbW9yeSBsYXlvdXQgYWxpZ25tZW50LiAq
Lwo+PiAtc3RhdGljIGlubGluZSB2b2lkIGNoZWNrX21lbW9yeV9sYXlvdXRfYWxpZ25tZW50X2Nv
bnN0cmFpbnRzKHZvaWQpIHsKPj4gK3N0YXRpYyB2b2lkIF9faW5pdCBfX21heWJlX3VudXNlZCBi
dWlsZF9hc3NlcnRpb25zKHZvaWQpCj4+ICt7Cj4+ICAgICAgIC8qIDJNQiBhbGlnbmVkIHJlZ2lv
bnMgKi8KPj4gICAgICAgQlVJTERfQlVHX09OKFhFTl9WSVJUX1NUQVJUICYgflNFQ09ORF9NQVNL
KTsKPj4gICAgICAgQlVJTERfQlVHX09OKEZJWE1BUF9BRERSKDApICYgflNFQ09ORF9NQVNLKTsK
Pj4gLS0gCj4+IDIuMTEuMAo+PgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
