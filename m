Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64814BC68
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:58:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSHb-0005dF-DQ; Tue, 28 Jan 2020 14:56:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwSHa-0005d8-27
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:56:02 +0000
X-Inumbo-ID: 4ccade44-41de-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ccade44-41de-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 14:56:01 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSHP-0002AH-LM; Tue, 28 Jan 2020 14:55:51 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSHP-0000YS-BG; Tue, 28 Jan 2020 14:55:51 +0000
Date: Tue, 28 Jan 2020 14:55:47 +0000
From: Wei Liu <wl@xen.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20200128145547.7itf4ulqockidqbs@debian>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
 <20200122085357.2092778-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122085357.2092778-2-dwmw2@infradead.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH v2 02/14] x86/boot: Reserve live update
 boot memory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 paul@xen.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Hongyan Xia <hongyxia@amazon.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Amit Shah <aams@amazon.de>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMDg6NTM6NDVBTSArMDAwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4g
Rm9yIGxpdmUgdXBkYXRlIHRvIHdvcmssIGl0IHdpbGwgbmVlZCBhIHJlZ2lvbiBvZiBtZW1vcnkg
dGhhdCBjYW4gYmUKPiBnaXZlbiB0byB0aGUgYm9vdCBhbGxvY2F0b3Igd2hpbGUgaXQgcGFyc2Vz
IHRoZSBzdGF0ZSBpbmZvcm1hdGlvbiBmcm9tCj4gdGhlIHByZXZpb3VzIFhlbiBhbmQgd29ya3Mg
b3V0IHdoaWNoIG9mIHRoZSBvdGhlciBwYWdlcyBvZiBtZW1vcnkgaXQKPiBjYW4gY29uc3VtZS4K
PiAKPiBSZXNlcnZlIHRoYXQgbGlrZSB0aGUgY3Jhc2hkdW1wIHJlZ2lvbiwgYW5kIGFjY2VwdCBp
dCBvbiB0aGUgY29tbWFuZAo+IGxpbmUuIFVzZSBvbmx5IHRoYXQgcmVnaW9uIGZvciBlYXJseSBi
b290LCBhbmQgcmVnaXN0ZXIgdGhlIHJlbWFpbmluZwo+IFJBTSAoYWxsIG9mIGl0IGZvciBub3cs
IHVudGlsIHRoZSByZWFsIGxpdmUgdXBkYXRlIGhhcHBlbnMpIGxhdGVyLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gLS0tCj4gIHhlbi9h
cmNoL3g4Ni9zZXR1cC5jICAgICAgICAgfCAxMTQgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaCB8ICAgMSArCgpZb3UgYWxz
byBuZWVkIHRvIHBhdGNoIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBmb3IgdGhl
IG5ldwpjb21tYW5kIGxpbmUgb3B0aW9uLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
