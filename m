Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAFF150758
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:35:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybqs-0007Rd-F5; Mon, 03 Feb 2020 13:33:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iybqr-0007RX-1P
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:33:21 +0000
X-Inumbo-ID: be1a7032-4689-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be1a7032-4689-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 13:33:20 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iybqp-0002GN-43; Mon, 03 Feb 2020 13:33:19 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iybqo-0005nB-Qh; Mon, 03 Feb 2020 13:33:19 +0000
Date: Mon, 3 Feb 2020 13:33:15 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203133315.b56smjke7phugayv@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <542f323a-4c85-6709-88ad-640e2d0d12e9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <542f323a-4c85-6709-88ad-640e2d0d12e9@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDI6MjE6MTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAxODo0OSwgV2VpIExpdSB3cm90ZToKPiA+ICtzdGF0aWMgdm9p
ZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiA+ICt7Cj4gPiArICAgIHVuaW9u
IGh2X3g2NF9tc3JfaHlwZXJjYWxsX2NvbnRlbnRzIGh5cGVyY2FsbF9tc3I7Cj4gPiArICAgIHVu
aW9uIGh2X2d1ZXN0X29zX2lkIGd1ZXN0X2lkOwo+ID4gKyAgICB1bnNpZ25lZCBsb25nIG1mbjsK
PiA+ICsKPiA+ICsgICAgQlVJTERfQlVHX09OKEhWX0hZUF9QQUdFX1NISUZUICE9IFBBR0VfU0hJ
RlQpOwo+ID4gKwo+ID4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9HVUVTVF9PU19JRCwgZ3Vlc3Rf
aWQucmF3KTsKPiA+ICsgICAgaWYgKCAhZ3Vlc3RfaWQucmF3ICkKPiA+ICsgICAgewo+ID4gKyAg
ICAgICAgZ3Vlc3RfaWQucmF3ID0gZ2VuZXJhdGVfZ3Vlc3RfaWQoKTsKPiA+ICsgICAgICAgIHdy
bXNybChIVl9YNjRfTVNSX0dVRVNUX09TX0lELCBndWVzdF9pZC5yYXcpOwo+ID4gKyAgICB9Cj4g
PiArCj4gPiArICAgIHJkbXNybChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJjYWxsX21zci5h
c191aW50NjQpOwo+ID4gKyAgICBpZiAoICFoeXBlcmNhbGxfbXNyLmVuYWJsZSApCj4gPiArICAg
IHsKPiA+ICsgICAgICAgIG1mbiA9IEhWX0hDQUxMX01GTjsKPiA+ICsgICAgICAgIGh5cGVyY2Fs
bF9tc3IuZW5hYmxlID0gMTsKPiA+ICsgICAgICAgIGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5c2lj
YWxfYWRkcmVzcyA9IG1mbjsKPiA+ICsgICAgICAgIHdybXNybChIVl9YNjRfTVNSX0hZUEVSQ0FM
TCwgaHlwZXJjYWxsX21zci5hc191aW50NjQpOwo+ID4gKyAgICB9IGVsc2Ugewo+ID4gKyAgICAg
ICAgbWZuID0gaHlwZXJjYWxsX21zci5ndWVzdF9waHlzaWNhbF9hZGRyZXNzOwo+ID4gKyAgICB9
Cj4gCj4gTml0OiBTdHlsZS4gUHJlZmVyYWJseSBvbWl0IHRoZSBicmFjZXMgZnJvbSAiZWxzZSIg
YWx0b2dldGhlci4KCkZpeGVkLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
