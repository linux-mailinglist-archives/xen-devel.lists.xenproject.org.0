Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24538150721
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:25:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybh6-0006PG-Q5; Mon, 03 Feb 2020 13:23:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iybh5-0006PA-Q6
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:23:15 +0000
X-Inumbo-ID: 54e8da0a-4688-11ea-a933-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54e8da0a-4688-11ea-a933-bc764e2007e4;
 Mon, 03 Feb 2020 13:23:14 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iybh2-00022K-Kx; Mon, 03 Feb 2020 13:23:12 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iybh2-0004yg-BE; Mon, 03 Feb 2020 13:23:12 +0000
Date: Mon, 3 Feb 2020 13:23:09 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203132309.c5dag7rffksjsmfi@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-4-liuwe@microsoft.com>
 <7f3b78d5-4969-27c9-10c7-1f914a4a2aaf@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f3b78d5-4969-27c9-10c7-1f914a4a2aaf@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 03/11] x86: provide executable fixmap
 facility
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDI6MTA6MDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAxODo0OSwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94ZW4ubGRzLlMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+IEBA
IC0yLDYgKzIsOCBAQAo+ID4gIC8qIE1vZGlmaWVkIGZvciBpMzg2L3g4Ni02NCBYZW4gYnkgS2Vp
ciBGcmFzZXIgKi8KPiA+ICAKPiA+ICAjaW5jbHVkZSA8eGVuL2NhY2hlLmg+Cj4gPiArCj4gPiAr
I2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KPiAKPiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoaXMg
YW55bW9yZT8gSWYgc28sIHdpdGggdGhpcyBkcm9wcGVkCgpJIHRoaW5rIGl0IGNhbiBiZSBkcm9w
cGVkLgoKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhh
bmtzLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
