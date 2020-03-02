Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9E175821
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 11:17:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8i6D-0008EI-7X; Mon, 02 Mar 2020 10:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8i6A-0008ED-RU
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 10:14:54 +0000
X-Inumbo-ID: a8dee40a-5c6e-11ea-9f26-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8dee40a-5c6e-11ea-9f26-12813bfff9fa;
 Mon, 02 Mar 2020 10:14:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F38C1AC22;
 Mon,  2 Mar 2020 10:14:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
 <a3703073-0c24-5129-faab-34a3bbb3f3a0@suse.com>
 <aa4256f7-c9cc-ecbe-821e-90be41bd77fd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1df5134-cf8e-d687-e36d-ba17cf000a13@suse.com>
Date: Mon, 2 Mar 2020 11:14:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aa4256f7-c9cc-ecbe-821e-90be41bd77fd@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/5] IOMMU: iommu_snoop is x86/HVM-only
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAyMToyMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8wMi8yMDIw
IDEyOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSW4gZmFjdCBpdCdzIFZULWQgc3BlY2lmaWMs
IGJ1dCB3ZSBkb24ndCBoYXZlIGEgd2F5IHlldCB0byBidWlsZCBjb2RlCj4+IGZvciBqdXN0IG9u
ZSB2ZW5kb3IuIFByb3ZpZGUgYSAjZGVmaW5lIGZvciBhbGwgb3RoZXIgY2FzZXMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBpb21tdV9z
bm9vcCBoYXMgbm8gc3BlY2lmaWMgaW50ZXJhY3Rpb24gd2l0aCBIVk0uCj4gCj4gSXQgaXMgZm9y
IGFueSBjYWNoZWFiaWxpdHkgZ2FtZXMgdGhlIGh5cGVydmlzb3IgbWF5IHBsYXkgb24gYSBWTSwg
YW5kCj4gdGhhdCBpbiBwcmluY2lwbGUgaW5jbHVkZXMgUFYgZ3Vlc3RzIGFzIHdlbGwuCgpPaCwg
aW4gdGhlIGdyZXAgcmVzdWx0cyBJIG92ZXJsb29rZWQKCiAgICAvKiBTZXQgdGhlIFNOUCBvbiBs
ZWFmIHBhZ2UgdGFibGUgaWYgU25vb3AgQ29udHJvbCBhdmFpbGFibGUgKi8KICAgIGlmICggaW9t
bXVfc25vb3AgKQogICAgICAgIGRtYV9zZXRfcHRlX3NucChuZXcpOwoKVGhhbmtzIGZvciBwb2lu
dGluZyBvdXQsIHdpbGwgY29ycmVjdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
