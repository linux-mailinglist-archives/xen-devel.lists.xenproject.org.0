Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C806917E5B4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 18:30:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBMA9-0008VW-Qv; Mon, 09 Mar 2020 17:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p+U+=42=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jBMA9-0008VR-3M
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 17:25:57 +0000
X-Inumbo-ID: 093f83f6-622b-11ea-8f6d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 093f83f6-622b-11ea-8f6d-bc764e2007e4;
 Mon, 09 Mar 2020 17:25:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jBMA7-0002aO-Ir; Mon, 09 Mar 2020 17:25:55 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jBMA7-0004yz-9R; Mon, 09 Mar 2020 17:25:55 +0000
Date: Mon, 9 Mar 2020 17:25:52 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200309172552.i273f2re4y6uuklr@debian>
References: <20200219114411.26922-1-liuwe@microsoft.com>
 <20200219114411.26922-2-liuwe@microsoft.com>
 <26c31c83-c2d5-1379-9055-dd802c51d02b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26c31c83-c2d5-1379-9055-dd802c51d02b@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 1/3] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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

T24gTW9uLCBNYXIgMDksIDIwMjAgYXQgMDU6Mzg6MTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxMjo0NCwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9m
bHVzaHRsYi5oCj4gPiBAQCAtMTIzLDYgKzEyMyw5IEBAIHZvaWQgc3dpdGNoX2NyM19jcjQodW5z
aWduZWQgbG9uZyBjcjMsIHVuc2lnbmVkIGxvbmcgY3I0KTsKPiA+ICAgLyogRmx1c2ggYWxsIEhW
TSBndWVzdHMgbGluZWFyIFRMQiAodXNpbmcgQVNJRC9WUElEKSAqLwo+ID4gICNkZWZpbmUgRkxV
U0hfR1VFU1RTX1RMQiAweDQwMDAKPiA+ICAKPiA+ICsjZGVmaW5lIEZMVVNIX1RMQl9GTEFHU19N
QVNLIChGTFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQgfCBcCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRkxVU0hfT1JERVJfTUFTSykKPiAKPiBJ
IGRvbid0IHRoaW5rIEZMVVNIX09SREVSX01BU0sgc2hvdWxkIGJlIHBhcnQgb2YgdGhpcywgYXMg
aXQncyBub3QKPiBleGNsdXNpdmVseSBUTEItZmx1c2ggcmVsYXRlZC4KCk15IGludGVudGlvbiB3
YXMgdG8gY2FwdHVyZSBhbGwgZmxhZ3MgcGVydGluZW50IHRvIFRMQiBmbHVzaGVzLiBJIGRpZG4n
dAptZWFuIHRoZXkgd2VyZSBleGNsdXNpdmVseSBUTEIgZmx1c2ggcmVsYXRlZC4KCkkgY2FuIHJl
bW92ZSB0aGUgb3JkZXIgbWFzayBmcm9tIHRoZSBsaXN0IG9mIGZsYWdzLiBOb3QgYSBiaWcgZGVh
bC4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
