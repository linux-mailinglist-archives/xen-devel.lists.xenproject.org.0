Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D215BE69
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:28:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2DYy-0002x7-U5; Thu, 13 Feb 2020 12:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2DYy-0002x0-3t
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:25:48 +0000
X-Inumbo-ID: f6a0745e-4e5b-11ea-b890-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6a0745e-4e5b-11ea-b890-12813bfff9fa;
 Thu, 13 Feb 2020 12:25:47 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DYw-00075i-3Z; Thu, 13 Feb 2020 12:25:46 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DYv-00075O-Mu; Thu, 13 Feb 2020 12:25:46 +0000
Date: Thu, 13 Feb 2020 12:25:42 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200213122542.foxdao4toxhm6m2c@debian>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-5-liuwe@microsoft.com>
 <20200212174347.GU4679@Air-de-Roger>
 <893afd1e-03fd-f869-9bf6-4483f194bc98@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <893afd1e-03fd-f869-9bf6-4483f194bc98@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 4/4] x86/hyperv: L0 assisted TLB flush
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTA6NDk6MzlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUg
Yi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlCj4gPj4gaW5kZXggMTg5MDJjMzNl
OS4uMGUzOTQxMDk2OCAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L01ha2VmaWxlCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+
ID4+IEBAIC0xLDIgKzEsMyBAQAo+ID4+ICBvYmoteSArPSBoeXBlcnYubwo+ID4+ICBvYmoteSAr
PSB0bGIubwo+ID4+ICtvYmoteSArPSB1dGlsLm8KPiA+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3By
aXZhdGUuaAo+ID4+IGluZGV4IDc4ZTUyZjc0Y2UuLjMxMWYwNjA0OTUgMTAwNjQ0Cj4gPj4gLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKPiA+PiArKysgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+ID4+IEBAIC0yNCwxMiArMjQsMjEgQEAKPiA+
PiAgCj4gPj4gICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgo+ID4+ICAjaW5jbHVkZSA8eGVuL3Bl
cmNwdS5oPgo+ID4+ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4gPj4gIAo+ID4+ICBERUNMQVJF
X1BFUl9DUFUodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiA+PiAgREVDTEFSRV9QRVJfQ1BVKHZv
aWQgKiwgaHZfdnBfYXNzaXN0KTsKPiA+PiAgREVDTEFSRV9QRVJfQ1BVKHVpbnQzMl90LCBodl92
cF9pbmRleCk7Cj4gPj4gIAo+ID4+ICtzdGF0aWMgaW5saW5lIHVpbnQzMl90IGh2X3ZwX2luZGV4
KGludCBjcHUpCj4gPiAKPiA+IHVuc2lnbmVkIGludCBmb3IgY3B1Lgo+IAo+IEFuZCBhbHNvIGZv
ciB0aGUgcmV0dXJuIHR5cGUsIGFzIHBlciBteSBjb21tZW50IG9uIHBhdGNoIDEuCgpBY2suCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
