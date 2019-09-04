Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C632A8597
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5WB9-0000cj-1K; Wed, 04 Sep 2019 14:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5WB7-0000cd-Jp
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:22:33 +0000
X-Inumbo-ID: 6edaa0aa-cf1f-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6edaa0aa-cf1f-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 14:22:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B2844AF77;
 Wed,  4 Sep 2019 14:22:31 +0000 (UTC)
To: Olaf Hering <olaf@aepfle.de>
References: <20190904091423.23963-1-olaf@aepfle.de>
 <75fe87c1-2f21-b1c1-6589-36807e0b4aaa@citrix.com>
 <20190904113735.349609b4.olaf@aepfle.de>
 <cae6ee14-da0f-883c-148a-5556f26f4b12@suse.com>
 <20190904161324.68599b3c.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <558d23b7-5cda-271f-0f9a-39b986ed3ae8@suse.com>
Date: Wed, 4 Sep 2019 16:22:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904161324.68599b3c.olaf@aepfle.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] Remove stale crashkernel= example from
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxNjoxMywgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gV2VkLCA0IFNlcCAy
MDE5IDE0OjE5OjIzICswMjAwCj4gc2NocmllYiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ogo+IAo+PiBPbiAwNC4wOS4yMDE5IDExOjM3LCBPbGFmIEhlcmluZyB3cm90ZToKPj4+IE1h
eWJlIGp1c3QgdGhlIGxhY2sgb2YgYjQ5MjI1ZGM5ZGYzMzY0MDUyOTJkYzA4ODYyYjRjN2M5ZDg4
N2JkNiBpbiB2ZW5kb3IgYmluYXJpZXMuLi4gIAo+PiBCdXQgdGhpcyBjaGFuZ2Ugd2FzIG9ubHkg
dG8gZGVhbCB3aXRoIHRoZSBib2d1cyBsb2cgbWVzc2FnZS4KPj4gVGhlIGhhbmRsaW5nIHdhcyBz
dGlsbCBjb3JyZWN0IChhbmQgdGhlIG9wdGlvbiB3YXMgYmVpbmcKPj4gaG9ub3JlZCkuIEkgYWxz
byBjYW4ndCBzZWUgaG93IHRoaXMgd291bGQgYmUgZGlmZmVyZW50IG5vdy4KPiAKPiBJcyB0aGF0
IHRydWU/IE15IGludGVycHJldGF0aW9uIG9mIHRoZSBjb2RlIHBhdGggaXMgdGhhdCBubwo+IGNv
bG9uIGFuZCBub3RoaW5nIGFmdGVyIGEgc2l6ZSB2YWx1ZSB3aWxsIGxlYWQgdG8gRUlOVkFMLgoK
Rmlyc3Qgb2YgYWxsIC0gZG9lcyAidGhlIGNvZGUiIGhlcmUgbWVhbiBtYXN0ZXIvc3RhZ2luZywg
b3IgYW55CnJlbGVhc2UgYnJhbmNoPyBBbmQgdGhlbiwgeWVzLCBvbiByZWxlYXNlIGJyYW5jaGVz
IHRoZXJlIHdpbGwgYmUKRUlOVkFMLCBidXQgYXMgc2FpZCBiZWZvcmUga2V4ZWNfY3Jhc2hfYXJl
YS5zaXplIHdpbGwgZ2V0L3JlbWFpbgpzZXQgbmV2ZXJ0aGVsZXNzIChhcyB0aGUgZXJyb3IgcGF0
aCBkb2Vzbid0IHphcCBhbnkgb2YgdGhlCmVhcmxpZXIgcGFyc2luZyBvdXRjb21lKS4KCj4gV2l0
aCB0aGlzIGNoYW5nZSBhbnkgdW5rbm93biBzdHJpbmcgd2lsbCBjYXVzZSBFSU5WQUwuCgpXaGlj
aCBpcyB3aGF0IHNob3VsZCBoYXBwZW4gZm9yIHVua25vd24gKGkuZS4gdW5zdXBwb3J0ZWQpIHN0
cmluZ3MsCnNob3VsZG4ndCBpdD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
