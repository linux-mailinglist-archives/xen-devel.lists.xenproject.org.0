Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BD1507D0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:54:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyc8s-0000t1-Gq; Mon, 03 Feb 2020 13:51:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iyc8r-0000ss-Kx
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:51:57 +0000
X-Inumbo-ID: 57c3eec8-468c-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57c3eec8-468c-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 13:51:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyc8o-0002bS-77; Mon, 03 Feb 2020 13:51:54 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyc8n-0007qk-TM; Mon, 03 Feb 2020 13:51:54 +0000
Date: Mon, 3 Feb 2020 13:51:50 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203135150.jkymu4h7gux3c2tb@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-7-liuwe@microsoft.com>
 <a2bb1224-2717-5160-5f65-3a4ddaab08c9@suse.com>
 <20200203133106.lptq6sy5dxfzrd2c@debian>
 <a4930d1b-ee60-461a-eaf3-47dfc14eea5a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4930d1b-ee60-461a-eaf3-47dfc14eea5a@suse.com>
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

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDI6NDg6NDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDIuMjAyMCAxNDozMSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIE1vbiwgRmVi
IDAzLCAyMDIwIGF0IDAyOjI2OjI0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDMxLjAxLjIwMjAgMTg6NDksIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS5jCj4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPj4+IEBAIC0zNzUsOSArMzc1
LDExIEBAIHZvaWQgX19pbml0IGFyY2hfaW5pdF9tZW1vcnkodm9pZCkKPiA+Pj4gICAgICB9Cj4g
Pj4+ICAjZW5kaWYKPiA+Pj4gIAo+ID4+PiAtICAgIC8qIEdlbmVyYXRlIGEgc3ltYm9sIHRvIGJl
IHVzZWQgaW4gbGlua2VyIHNjcmlwdCAqLwo+ID4+PiArICAgIC8qIEdlbmVyYXRlIHN5bWJvbHMg
dG8gYmUgdXNlZCBpbiBsaW5rZXIgc2NyaXB0ICovCj4gPj4+ICAgICAgYXNtICggIi5lcXUgRklY
QUREUl9YX1NJWkUsICVQMDsgLmdsb2JhbCBGSVhBRERSX1hfU0laRSIKPiA+Pj4gICAgICAgICAg
ICA6OiAiaSIgKEZJWEFERFJfWF9TSVpFKSApOwo+ID4+PiArICAgIGFzbSAoICIuZXF1IEhWX0hD
QUxMX1BBR0UsICVQMDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgo+ID4+PiArICAgICAgICAgIDo6
ICJpIiAoX19maXhfeF90b192aXJ0KEZJWF9YX0hZUEVSVl9IQ0FMTCkpICk7Cj4gPj4KPiA+PiBX
b3VsZCB0aGlzIGV2ZW4gYnVpbGQgd2l0aG91dCBDT05GSUdfSFlQRVJWX0dVRVNUPyBJbiBhbnkg
ZXZlbnQKPiA+PiBpdCBkb2Vzbid0IGJlbG9uZyBoZXJlLCBidXQgc2hvdWxkIGdvIGluIGEgSHlw
ZXItViBzcGVjaWZpYwo+ID4+IGZpbGUuCj4gPj4KPiA+IAo+ID4gR29vZCBjYXRjaC4gV2hlbiBJ
IGRpZCBteSBmdWxsIGJ1aWxkIHRlc3RzIGl0IHdhcyBkb25lIHdpdGggbXkgcHJldmlvdXMKPiA+
IHZlcnNpb24uCj4gPiAKPiA+IEkgY2FuIG1vdmUgdGhpcyB0byBoeXBlcnYuYy4KPiA+IAo+ID4+
IFNlZWluZyB5b3Ugbm93IG5lZWQgdHdvIG9mIHRoZXNlLCBob3cgYWJvdXQgbWFjcm8taXppbmcg
dGhlCj4gPj4gY29uc3RydWN0Pwo+ID4gCj4gPiBXaGF0IG5hbWUgd291bGQgeW91IHN1Z2dlc3Q/
IEknbSB0aGlua2luZyBhYm91dCBHRU5fWEVOX0xEU19TWU1CT0wuCj4gCj4gSW4gcHJpbmNpcGxl
IHRoaXMgaXNuJ3QgbGltaXRpbmcgdGhpbmdzIHRvIHVzZSBieSB4ZW4ubGRzLCBzbwo+IEknZCBw
cmVmZXIgdG8gbm90IGVuY29kZSBzdWNoIGluIHRoZSBuYW1lLiBhc21fY29uc3RhbnQoKT8gT3IK
PiBhbGwgY2FwcyBpZiBzbyBwcmVmZXJyZWQgYnkgb3RoZXJzPwoKSSBhbSBjZXJ0YWlubHkgb2th
eSB3aXRoIEFTTV9DT05TVEFOVCgpLgoKPiAKPiA+IEFuZCBwcmVzdW1hYmx5IEkgc2hvdWxkIHB1
dCBpdCBpbiB4ZW4vbGliLmg/Cj4gCj4gV291bGQgYmUgbmljZSB0byBoYXZlIGl0IHRoZXJlLCBi
dXQgSSdtIGFmcmFpZCB0aGlzIGlzIGFnYWluc3QKPiB3aGF0IGdjYyBkb2N1bWVudHMuIEhlbmNl
IGlmIGFueXRoaW5nIHRoZSBQIHdvdWxkIG5lZWQgdG8gYmUKPiBhYnN0cmFjdGVkIGF3YXkgYXMg
YSBwZXItYXJjaCB0aGluZy4gSWYgeW91IGRvbid0IHdhbnQgdG8gZ28KPiB0aGlzIGZhciwgYXNt
X2RlZm5zLmggbWlnaHQgYmUgdGhlIGJlc3QgZml0IGFtb25nIHRoZSB4ODYKPiBoZWFkZXJzLgoK
T0suIGFzbV9kZWZucy5oIGl0IGlzLiBBcm0gZG9lc24ndCBuZWVkIHRoaXMgZm9yIG5vdyBhbnl3
YXkuCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
