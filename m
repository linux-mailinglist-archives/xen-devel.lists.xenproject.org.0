Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B28BCDF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:18:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYWY-0006pr-44; Tue, 13 Aug 2019 15:15:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxYWW-0006ph-E8
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:15:44 +0000
X-Inumbo-ID: 375e3e64-bddd-11e9-a982-f3286b646714
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 375e3e64-bddd-11e9-a982-f3286b646714;
 Tue, 13 Aug 2019 15:15:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60DAA28;
 Tue, 13 Aug 2019 08:15:42 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3F993F706;
 Tue, 13 Aug 2019 08:15:41 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-3-sstabellini@kernel.org> <87ef1pgn4c.fsf@epam.com>
 <75f9a42a-f691-2cf2-b9e8-289c05f66286@arm.com> <87a7cdgksi.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <888c9482-7a12-2f18-568b-e11773249f22@arm.com>
Date: Tue, 13 Aug 2019 16:15:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87a7cdgksi.fsf@epam.com>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzEzLzE5IDQ6MTQgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IEp1bGll
biBHcmFsbCB3cml0ZXM6Cj4+IE9uIDgvMTMvMTkgMzoyMyBQTSwgVm9sb2R5bXlyIEJhYmNodWsg
d3JvdGU6Cj4+PiBTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgo+Pj4KPj4+PiAgICAgICAgewo+
Pj4+ICAgICAgICAgICAgZGV2aWNlX3RyZWVfZ2V0X3JlZygmY2VsbCwgYWRkcmVzc19jZWxscywg
c2l6ZV9jZWxscywgJnN0YXJ0LCAmc2l6ZSk7Cj4+Pj4gICAgICAgICAgICBpZiAoICFzaXplICkK
Pj4+PiAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+PiAtICAgICAgICBib290aW5mby5tZW0u
YmFua1tib290aW5mby5tZW0ubnJfYmFua3NdLnN0YXJ0ID0gc3RhcnQ7Cj4+Pj4gLSAgICAgICAg
Ym9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKPj4+
PiAtICAgICAgICBib290aW5mby5tZW0ubnJfYmFua3MrKzsKPj4+PiArICAgICAgICBtZW0tPmJh
bmtbbWVtLT5ucl9iYW5rc10uc3RhcnQgPSBzdGFydDsKPj4+PiArICAgICAgICBtZW0tPmJhbmtb
bWVtLT5ucl9iYW5rc10uc2l6ZSA9IHNpemU7Cj4+Pj4gKyAgICAgICAgbWVtLT5ucl9iYW5rcysr
Owo+Pj4+ICAgICAgICB9Cj4+Pj4KPj4+PiAtICAgIGlmICggYm9vdGluZm8ubWVtLm5yX2Jhbmtz
ID09IE5SX01FTV9CQU5LUyApCj4+Pj4gKyAgICBpZiAoIG1lbS0+bnJfYmFua3MgPT0gTlJfTUVN
X0JBTktTICkKPj4+IExvb2tzIGxpa2UgeW91IGhhdmUgdGhlIHNhbWUgb2ZmLWJ5LW9uZSBlcnJv
ciwgYXMgaW4gcHJldmlvdXMgcGF0Y2guCj4+PiBJIGNhbiBzZWUgdGhhdCBpdCB3YXMgdGhlcmUg
ZWFybGllci4gQnV0IGl0IGlzIGdvb2QgdGltZSB0byBmaXggaXQuCj4+Cj4+IEkgZG9uJ3QgdGhp
bmsgdGhlcmUgd2FzIGFuIG9mZi1ieS1vbmUgZXJyb3IgYmVmb3JlIHRoaXMgc2VyaWVzLiBTbwo+
PiB3aGF0IGRvIHlvdSBtZWFuPwo+IEkgZXhwbGFpbmVkIHRoaXMgaW4gcGF0Y2ggIzIuIEltYWdp
bmUgdGhhdCBOUl9NRU1fQkFOS1MgPSAxIGFuZCB5b3UgaGF2ZQo+IG9uZSBtZW1vcnkgbm9kZSBp
biB0aGUgZHRiLiBZb3UnbGwgZmlsbCB0aGUgZmlyc3QgZWxlbWVudCBvZiB0aGUgYXJyYXkKPiBh
bmQgbWVtLT5ucl9iYW5rcyB3aWxsIGJlY29tZSAxLiBUaGlzIGlzIGFic29sdXRlbHkgbm9ybWFs
LiBCdXQgY2hlY2sKPiBhYm92ZSB3aWxsIGZhaWwsIHdoaWNoIGlzIG5vdCByaWdodC4KCk9rLiBT
byB0aGUgb2ZmLWJ5LW9uZSBlcnJvciBoYXMgYmVlbiBpbnRyb2R1Y2VkIGJ5IHRoaXMgc2VyaWVz
LiBTbyB0aGlzIApzaG91bGQgYmUgZml4ZWQgaW4gcGF0Y2ggIzIgbm90IGhlcmUuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
