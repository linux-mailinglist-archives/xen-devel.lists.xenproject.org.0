Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A09C3D55D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:20:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halKU-00034n-Pm; Tue, 11 Jun 2019 18:17:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1halKT-00034e-52
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:17:05 +0000
X-Inumbo-ID: 1cf770c0-8c75-11e9-a529-9fd6c45beb4d
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cf770c0-8c75-11e9-a529-9fd6c45beb4d;
 Tue, 11 Jun 2019 18:17:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03C0D2173B;
 Tue, 11 Jun 2019 18:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560277023;
 bh=2rFufS7ntl2J48XqbOWWdUIvnxVlJuFunL8IYyQUgOU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=h3AJvI1jos50hOiKr+IFnKq1sRgc6jOHvzmasSlB1RyaCvybLjW1zWzx8JO8yk27J
 cSA/kEhu06RxqmMxL/r0asbFbsFTZw5Hf/s8yo4nG7FhnGTRZ/wHAHqf0w1TF510XX
 Nk+oZcuFRFPsqX4jxzxDQncIKaNW4NQq9U1vPW+g=
Date: Tue, 11 Jun 2019 11:17:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906101355120.8691@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1906111115420.13737@sstabellini-ThinkPad-T480s>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
 <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
 <0172ad95-1a78-8f2f-9f11-a74089829fb9@arm.com>
 <c2e73bc5-4390-7436-21f7-deff8d85db1d@arm.com>
 <alpine.DEB.2.21.1906101337160.8691@sstabellini-ThinkPad-T480s>
 <65f29654-ab95-f011-69f1-0d26a09d80b6@arm.com>
 <alpine.DEB.2.21.1906101355120.8691@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on
 platform using AIVIVT instruction caches
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
Cc: Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com,
 Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org, nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIE1vbiwg
MTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IE9uIDYvMTAvMTkgOTo0MCBQTSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiBIaSBKdWxpZW4sCj4gPiAKPiA+IEhpIFN0
ZWZhbm8sCj4gPiAKPiA+ID4gCj4gPiA+IEkgZXhwcmVzc2VkIG15IHByZWZlcmVuY2UgYmVsb3cu
IFdlIGRvbid0IGFncmVlLiBJcyB0aGVyZSBhbnl0aGluZyBlbHNlCj4gPiA+IHlvdSB3b3VsZCBs
aWtlIG1lIHRvIGFkZCB0byB0aGlzIHRocmVhZD8gRG8geW91IGhhdmUgYSBzcGVjaWZpYwo+ID4g
PiBxdWVzdGlvbj8gVGhlIG9ubHkgcXVlc3Rpb24gSSBzZWUgYmVsb3cgaXMgIlVzZXJzIG9mIHdo
YXQ/IiBidXQgSSB0YWtlCj4gPiA+IGl0IHdhcyBqdXN0IHJoZXRvcmljYWwuCj4gPiAKPiA+IE5v
IGl0IHdhc24ndCByaGV0b3JpY2FsLiBJdCB3YXMgYSBnZW51aW5lIHF1ZXN0aW9uLCBiZWNhdXNl
IHlvdSBhcmUgaW1wbHlpbmcKPiA+IHRoYXQ6Cj4gPiAJMSkgSXQgaXMgcG9zc2libGUgdG8gaGF2
ZSB1c2VyIHRoYXQgYXJlIHVzaW5nIEFJVklWVAo+ID4gCTIpIFdlIGhhdmUgdG8gc3VwcG9ydCBv
dXQgb2YgdHJlZSB1c2Vycwo+ID4gCj4gPiBUaGUgbGF0dGVyIGlzIHBhcnRpY3VsYXJseSBjcml0
aWNhbCBhcyB0aGlzIGltcGxpZXMgdGhhdCBhbnkgY2hhbmdlIGluIFhlbgo+ID4gc2hvdWxkIGJl
IGRvbmUgd2l0aCBrZWVwaW5nIGluIG1pbmQgYW55IHBhdGNoZXMgdGhhdCBjb3VsZCBiZSBhcHBs
aWVkIG9uIHRvcAo+ID4gb2YgWGVuLgo+ID4gCj4gPiBTbyBJIGFtIGFsbCBoZWFyIG9mIHlvdXIg
YXJndW1lbnRzIGhlcmUuLi4gQXQgdGhlIGVuZCwgd2UgbmVlZCB0byBjb21lIHRvIGFuCj4gPiBh
Z3JlZW1lbnQgaGVyZSBhcyBhdCB0aGUgbW9tZW50IG15IHBhdGNoIGNhbid0IGdvIHdpdGhvdXQg
eW91ciBhY2suCj4gCj4gTm8sIHdlIGRvbid0IGhhdmUgdG8gc3VwcG9ydCBvdXQgb2YgdHJlZSB1
c2Vycy4gSSBkaWRuJ3QgbWVhbiB0byBpbXBseQo+IGl0LiBCdXQgaXQgY29zdHMgdXMgdmVyeSBs
aXR0bGUgdG8gYmUgY291cnRlb3VzIGFuZCBwb2xpdGUgaW4gY2FzZXMgbGlrZQo+IHRoaXMsIHNl
bmRpbmcgYSBtb3JlIG9idmlvdXMgW0FOTk9VTkNFXSBlbWFpbCBzYXlpbmcgIndlIGFyZSBkcm9w
cGluZwo+IEFJVklWVCBhcyBub2JvZHkgc2hvdWxkIGJlIHVzaW5nIGl0Ii4KPiAKPiBDYW4gdGhp
cyBwYXRjaCBnbyBpbiByZWdhcmRsZXNzPyBJIHdvdWxkbid0IGJlIGhhcHB5IGFib3V0IGl0LCBi
dXQgaWYKPiB0aGlzIHdhcyBhIHZvdGUgaXQgd291bGQgYmUgYSAtMSwgbm90IGEgLTIuIEl0IGlz
IGRpZmZpY3VsdCB0byBnaXZlIGFuCj4gYWNrIGZvciBhIHRoaW5nIEkgZG9uJ3QgbGlrZSwgYnV0
IEkgd291bGRuJ3QgZ28gYXMgZmFyIGFzIG5hY2tpbmcgaXQuCgpPbiBzZWNvbmQgdGhvdWdodCwg
dGhpcyBwYXRjaCBzaG91bGQgbm90IGJlIGdhdGVkIGJ5IGFuIGFubm91bmNlIGVtYWlsLAphbmQg
Z2l2ZW4gdGhlIHNjYXJjaXR5IG9mIEFJVklWVCBwbGF0Zm9ybXMsIGl0IGlzIG5vdCB3b3J0aCB0
aGUgZWZmb3J0LgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
