Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B214EFB6
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:37:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYKL-0001Qt-It; Fri, 31 Jan 2020 15:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixYKK-0001Qn-4Z
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:35:24 +0000
X-Inumbo-ID: 4b445056-443f-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b445056-443f-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 15:35:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1B90AD06;
 Fri, 31 Jan 2020 15:35:21 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <6afc369b-a93e-1512-d6ea-f9260fb83c7c@suse.com>
 <20200131143716.gtdb5wwoagxpb223@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c08b3b1d-3d88-98c4-b175-ab5e1d2ec8c4@suse.com>
Date: Fri, 31 Jan 2020 16:35:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131143716.gtdb5wwoagxpb223@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAxNTozNywgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEphbiAzMSwgMjAy
MCBhdCAwMzoyNDowN1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMDEuMjAy
MCAyMToyMCwgV2VpIExpdSB3cm90ZToKPj4+IEkgdHJpZWQgdXNpbmcgdGhlIGFzbSgiLmVxdSAu
LiIpIHRyaWNrIGJ1dCBoaXQgYSBwcm9ibGVtIHdpdGggJWMgYWdhaW4uCj4+Pgo+Pj4gbW0uYzo1
NzM2OjU6IGVycm9yOiBpbnZhbGlkICdhc20nOiBvcGVyYW5kIGlzIG5vdCBhIGNvbmRpdGlvbiBj
b2RlLCBpbnZhbGlkIG9wZXJhbmQgY29kZSAnYycKPj4+ICAgICAgICAgICAgICAgIGFzbSAoICIu
ZXF1IEhWX0hDQUxMX1BBR0UsICVjMDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgo+Pgo+PiBXb3Vs
ZCB5b3UgbWluZCBhbHNvIGluZGljYXRpbmcgd2hhdCB0aGUgaW5wdXQgb3BlcmFuZCBhY3R1YWxs
eQo+PiB3YXM/IEFjY29yZGluZyB0byBteSBsb29raW5nIGF0IGdjYyBzb3VyY2VzIHdoZW4geW91
IGZpcnN0Cj4+IG1lbnRpb25lZCB0aGlzIChvbiBpcmMgaWlyYyksIG11Y2ggZGVwZW5kcyBvbiBp
dCBhY3R1YWxseSBiZQo+PiByZWNvZ25pemFibGUgYXMgYSBjb25zdGFudCBieSB0aGUgY29tcGls
ZXIuCj4gCj4gU29tZXRoaW5nIGFsb25nIHRoZSBsaW5lOgo+IAo+ICAgYXNtICggIi5lcXUgSFZf
SENBTExfUEFHRSwgJWMwOyAuZ2xvYmFsIEhWX0hDQUxMX1BBR0UiCj4gICAgICAgIDo6ICJpIiAo
X19maXhfeF90b192aXJ0KEZJWF9YX0hWLi4uKSkKClF1aXRlIGEgYml0IG9mIHBsYXlpbmcgbGF0
ZXIsICVQMCBpcyBkb2N1bWVudGVkLCBzdXBwb3J0ZWQKYWxyZWFkeSBpbiBnY2MgNC4xLngsIGFu
ZCBhbHNvIHVzZWQgaW4gYSBmZXcgY2FzZXMgYnkgTGludXguCiVwMCB3b3VsZCBiZSBhbm90aGVy
IGRvY3VtZW50ZWQgYWx0ZXJuYXRpdmUsIGJ1dCBzdXBwb3J0IGZvcgp0aGlzIGxvb2tzIHRvIGhh
dmUgYmVlbiBpbnRyb2R1Y2VkIGxhdGVyLiBOb3QgYmVpbmcgYWJsZSB0byB1c2UKJWMwIGhlcmUg
c3RpbGwgc21lbGxzIGxpa2UgYSBidWcgKGFuZCBJIGd1ZXNzIEknbGwgZW50ZXIgb25lLikKCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
