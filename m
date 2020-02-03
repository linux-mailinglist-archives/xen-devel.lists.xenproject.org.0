Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D518D150752
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:34:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybon-0007Kx-0x; Mon, 03 Feb 2020 13:31:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iybol-0007Ks-Ne
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:31:11 +0000
X-Inumbo-ID: 7121c62c-4689-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7121c62c-4689-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 13:31:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyboj-0002Cx-Uq; Mon, 03 Feb 2020 13:31:09 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyboj-0005T4-KM; Mon, 03 Feb 2020 13:31:09 +0000
Date: Mon, 3 Feb 2020 13:31:06 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203133106.lptq6sy5dxfzrd2c@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-7-liuwe@microsoft.com>
 <a2bb1224-2717-5160-5f65-3a4ddaab08c9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2bb1224-2717-5160-5f65-3a4ddaab08c9@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 06/11] x86/hyperv: provide Hyper-V
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
 Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDI6MjY6MjRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAxODo0OSwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+ID4gQEAgLTM3NSw5ICsz
NzUsMTEgQEAgdm9pZCBfX2luaXQgYXJjaF9pbml0X21lbW9yeSh2b2lkKQo+ID4gICAgICB9Cj4g
PiAgI2VuZGlmCj4gPiAgCj4gPiAtICAgIC8qIEdlbmVyYXRlIGEgc3ltYm9sIHRvIGJlIHVzZWQg
aW4gbGlua2VyIHNjcmlwdCAqLwo+ID4gKyAgICAvKiBHZW5lcmF0ZSBzeW1ib2xzIHRvIGJlIHVz
ZWQgaW4gbGlua2VyIHNjcmlwdCAqLwo+ID4gICAgICBhc20gKCAiLmVxdSBGSVhBRERSX1hfU0la
RSwgJVAwOyAuZ2xvYmFsIEZJWEFERFJfWF9TSVpFIgo+ID4gICAgICAgICAgICA6OiAiaSIgKEZJ
WEFERFJfWF9TSVpFKSApOwo+ID4gKyAgICBhc20gKCAiLmVxdSBIVl9IQ0FMTF9QQUdFLCAlUDA7
IC5nbG9iYWwgSFZfSENBTExfUEFHRSIKPiA+ICsgICAgICAgICAgOjogImkiIChfX2ZpeF94X3Rv
X3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkgKTsKPiAKPiBXb3VsZCB0aGlzIGV2ZW4gYnVpbGQg
d2l0aG91dCBDT05GSUdfSFlQRVJWX0dVRVNUPyBJbiBhbnkgZXZlbnQKPiBpdCBkb2Vzbid0IGJl
bG9uZyBoZXJlLCBidXQgc2hvdWxkIGdvIGluIGEgSHlwZXItViBzcGVjaWZpYwo+IGZpbGUuCj4g
CgpHb29kIGNhdGNoLiBXaGVuIEkgZGlkIG15IGZ1bGwgYnVpbGQgdGVzdHMgaXQgd2FzIGRvbmUg
d2l0aCBteSBwcmV2aW91cwp2ZXJzaW9uLgoKSSBjYW4gbW92ZSB0aGlzIHRvIGh5cGVydi5jLgoK
PiBTZWVpbmcgeW91IG5vdyBuZWVkIHR3byBvZiB0aGVzZSwgaG93IGFib3V0IG1hY3JvLWl6aW5n
IHRoZQo+IGNvbnN0cnVjdD8KCldoYXQgbmFtZSB3b3VsZCB5b3Ugc3VnZ2VzdD8gSSdtIHRoaW5r
aW5nIGFib3V0IEdFTl9YRU5fTERTX1NZTUJPTC4KCkFuZCBwcmVzdW1hYmx5IEkgc2hvdWxkIHB1
dCBpdCBpbiB4ZW4vbGliLmg/CgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
