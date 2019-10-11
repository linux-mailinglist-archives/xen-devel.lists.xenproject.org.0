Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5CDD4701
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 19:56:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIz4Z-0004dV-VI; Fri, 11 Oct 2019 17:51:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MXO=YE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIz4Y-0004dQ-71
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 17:51:26 +0000
X-Inumbo-ID: bdba853a-ec4f-11e9-933e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bdba853a-ec4f-11e9-933e-12813bfff9fa;
 Fri, 11 Oct 2019 17:51:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB2FE28;
 Fri, 11 Oct 2019 10:51:23 -0700 (PDT)
Received: from [10.37.12.177] (unknown [10.37.12.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2D3F3F703;
 Fri, 11 Oct 2019 10:51:22 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
 <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
 <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
 <c9b7bd90-344c-77a1-0191-c215f1b201c1@arm.com>
 <alpine.DEB.2.21.1910081422040.13684@sstabellini-ThinkPad-T480s>
 <69bdb4a8-a50f-61cf-f685-867f67436555@arm.com>
 <alpine.DEB.2.21.1910101729000.9081@sstabellini-ThinkPad-T480s>
 <ef551ef4-f4a2-4829-1405-2bcf541f17c3@arm.com>
 <alpine.DEB.2.21.1910111002250.6326@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <50786e73-e98a-2eea-f4b8-396afa1ef7ca@arm.com>
Date: Fri, 11 Oct 2019 18:51:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910111002250.6326@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEwLzExLzE5IDY6MTEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPj4gVGhpcyBpcyBub3QgcHJldHR5LCBidXQgSSBkb24ndCB2aWV3IHRoaXMgYXMgY3JpdGlj
YWwgdG8gZml4IGZvciBYZW4gNC4xMy4gU28KPj4gSSBhbSB0aGlua2luZyB0byBkZWZlciB0aGlz
IHBvc3QgNC4xMy4KPiAKPiBJZiB0aGUgaXNzdWUgZG9lc24ndCB0cmlnZ2VyIG9uIDQuMTMsIHRo
ZW4gSSBhZ3JlZSB3ZSBzaG91bGRuJ3QgdHJ5IHRvCj4gZml4IGl0IChiYWRseSkgYXQgdGhpcyBz
dGFnZS4KPiAKPiBCdXQgd2UgZG8gaGF2ZSBhICJtaW51cyBwaHlzX29mZnNldCIgb3BlcmF0aW9u
IGluIGR1bXBfaHlwX3dhbGssIEkgZG9uJ3QKPiBmb2xsb3cgd2h5IHdlIHdvdWxkbid0IHNlZSBh
IHByb2JsZW0gaWYgWGVuIGlzIGxvYWRlZCBhdCAxTUIgb24gYXJtMzIuCgpJIGhhdmVuJ3Qgc2Fp
ZCB0aGUgaXNzdWUgY2Fubm90IGJlIHRyaWdnZXJlZC4gSSBwb2ludGVkIG91dCBJIGRvbid0IHZp
ZXcgCnRoaXMgYXMgY3JpdGljYWwuCgpPbmUgb2YgdGhlIHJlYXNvbiBpcyB0aGF0IEkgYmV0IG5v
Ym9keSBldmVyIHJ1biBYZW4gYmVsb3cgMU1CIG9uIEFybTMyLiAKT3RoZXJ3aXNlIHRoZXkgd291
bGQgaGF2ZSBzZWVuIGFuIGVycm9yLi4uCgpJbiBvdGhlciB3b3JkcywgSSBhbSBub3QgZ29pbmcg
dG8gcGxhbiB0byBmaXggaXQgZm9yIFhlbiA0LjEzLiBIb3dldmVyLCAKaWYgc29tZW9uZSB3YW50
cyB0byBzcGVuZCB0aW1lIG9uIGl0IChhbmQgaGF2ZSBwbGF0Zm9ybSB0byB0ZXN0IGl0KSwgCnRo
ZW4gcGF0Y2ggYXJlIHdlbGNvbWVkLgoKPiAKPiBYZW4gcGE6IDB4MTAwMDAwCj4gWGVuIHZhOiAw
eDIwMDAwMAo+IHBoeXNfb2Zmc2V0OiAweGZmZjAwMDAwCj4gCj4gdGVzdF92YTogMHgyMDIwMDAK
PiB0ZXN0X3ZhIC0gcGh5c19vZmZzZXQgPSAweGZmZmZmZmZmMDAzMDAyMDAuIEJ1dCBpdCBzaG91
bGQgYmUgMHgxMDIwMDAuID4KPiBHaXZlbiB0aGF0IHRoZSBwcm9ibGVtIGlzIGluIGEgQlVHX09O
IG1heWJlIHdlIGNvdWxkIHJlbW92ZSBpdD8gT3IganVzdAo+IHJld29yayB0aGUgQlVHX09OPwoK
Rm9yIGFybTMyLCBkdW1wX2h5cF93YWxrKCkgaXMgb25seSBjYWxsZWQgd2hlbiB0aGUgQVQgaW5z
dHJ1Y3Rpb24gZmFpbHMgCnRvIHRyYW5zbGF0ZSBhIHBoeXNpY2FsIGFkZHJlc3MuIFlvdSBhcmUg
YWxyZWFkeSBkb2luZyBzb21ldGhpbmcgd3JvbmcgCmlmIHlvdSBoaXQsIHNvIHlvdSB3aWxsIHBh
bmljIGluIGVpdGhlciBjYXNlLiBUaGUgb25seSBkaWZmZXJlbmNlIGlzIHlvdSAKZG9uJ3QgZ2V0
IHRoZSBwYWdlLXRhYmxlIGR1bXBlZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
