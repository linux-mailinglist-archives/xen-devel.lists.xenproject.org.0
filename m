Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFCF14BE2E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:58:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwU7N-0001ZN-6G; Tue, 28 Jan 2020 16:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwU7M-0001ZF-8F
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:53:36 +0000
X-Inumbo-ID: b94710f0-41ee-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b94710f0-41ee-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 16:53:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwU7J-000593-Hk; Tue, 28 Jan 2020 16:53:33 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwU7J-0001oG-7i; Tue, 28 Jan 2020 16:53:33 +0000
Date: Tue, 28 Jan 2020 16:53:30 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200128165330.y36ozjw6io7fyucq@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-7-liuwe@microsoft.com>
 <c73aa226-df1a-552c-caea-f6a781dc63c6@suse.com>
 <20200128155510.ruie6ck4i3hg5dub@debian>
 <568d6410-ad85-74f8-84ab-2c5e47d2c314@suse.com>
 <c6a5c2bc7178499ca4618a76996dc8d4@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6a5c2bc7178499ca4618a76996dc8d4@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDQ6MzM6MDBQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBYZW4tZGV2ZWwg
PHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFu
Cj4gPiBCZXVsaWNoCj4gPiBTZW50OiAyOCBKYW51YXJ5IDIwMjAgMTY6MTkKPiA+IFRvOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBBbmRyZXcgQ29v
cGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBYZW4gRGV2ZWxvcG1l
bnQgTGlzdCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgUm9nZXIgUGF1IE1vbm7D
qQo+ID4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNv
bT47IE1pY2hhZWwgS2VsbGV5Cj4gPiA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4KPiA+IFN1Ympl
Y3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjQgNi83XSB4ODYvaHlwZXJ2OiByZXRyaWV2ZSB2
cF9pbmRleCBmcm9tCj4gPiBIeXBlci1WCj4gPiAKPiA+IE9uIDI4LjAxLjIwMjAgMTY6NTUsIFdl
aSBMaXUgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSmFuIDIzLCAyMDIwIGF0IDA0OjQ4OjM4UE0gKzAx
MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPj4gT24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExp
dSB3cm90ZToKPiA+ID4+PiBUaGlzIHdpbGwgYmUgdXNlZnVsIHdoZW4gaW52b2tpbmcgaHlwZXJj
YWxsIHRoYXQgdGFyZ2V0cyBzcGVjaWZpYwo+ID4gPj4+IHZjcHUocykuCj4gPiA+Pj4KPiA+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+ID4gPj4+IFJl
dmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiA+ID4+Cj4gPiA+PiBGb3Ig
Zm9ybWFsIHJlYXNvbnMKPiA+ID4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gPiA+Pgo+ID4gPj4gSG93ZXZlciBJIHdvbmRlciB3aGV0aGVyIHRoZSBWaXJpZGlh
biBlbnRyeSBpbiBNQUlOVEFJTkVSUyBzaG91bGRuJ3QKPiA+ID4+IGJlIGV4dGVuZGVkIGJ5Cj4g
PiA+Pgo+ID4gPj4gRjoJeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi8KPiA+ID4+Cj4gPiA+PiAo
YW5kIHBvc3NpYmx5IGhhdmUgaXRzIHRpdGxlIGFkanVzdGVkKS4gVGhvdWdodHM/Cj4gPiA+Cj4g
PiA+IFRoaXMgaXNuJ3QgYWJvdXQgZW11bGF0aW5nIEh5cGVyLVYgaW5zaWRlIFhlbiwgc28gSSBk
b24ndCB0aGluayB0aGF0J3MKPiA+ID4gdGhlIHJpZ2h0IGFwcHJvYWNoIGhlcmUuCj4gPiAKPiA+
IFdlbGwsIGl0J3MgdGhlIGNvZGUgcHJvZHVjaW5nIHRoZSBpbnRlcmZhY2UgaW4gb25lIGNhc2Us
IGFuZAo+ID4gY29uc3VtaW5nIGl0IGhlcmUuIFNvIHRoZXJlIGlzIHNvbWUgb3ZlcmxhcCBhdCBs
ZWFzdC4KPiA+IAo+ID4gPiBUaGF0IHNhaWQsIGlmIFBhdWwgd2FudHMgdG8gdGFrZSB0aGlzIHVu
ZGVyIGhpcyBwdXJ2aWV3LCBpdCdzIGZpbmUgYnkgbWUKPiA+ID4gLS0gdGhhdCB3b3VsZCBtYWtl
IG1lIGVhc2llciB0byB1cHN0cmVhbSBteSBwYXRjaC4gOy0pICBJIGFsc28gd291bGRuJ3QKPiA+
ID4gbWluZCBhZGRpbmcgbXlzZWxmIGFzIG1haW50YWluZXIgZm9yIHRoaXMgcGF0aC4KPiA+IAo+
ID4gUGVyaGFwcyBiZXN0IGJvdGggb2YgeW91PyBQYXVsLCBBbmRyZXcsIHdoYXQgZG8geW91IHRo
aW5rPwo+ID4gCj4gCj4gSU1PIGl0J3MgcHJvYmFibHkgYmVzdCB0byB0aGUgcHV0IHRoZSBIeXBl
ci1WIHN0dWZmIHVuZGVyICdWaXJpZGlhbicKPiBhbmQgYWRkIHlvdXJzZWxmIGFzIGEgbWFpbnRh
aW5lciB0aGVyZS4gVGhlcmUgcmVhbGx5IGlzIGxpa2VseSB0byBiZQo+IHNpZ25pZmljYW50IG92
ZXJsYXAgYW5kIGl0J2QgbWFrZSBpdCBlYXNpZXIgKGZvciBtZSBhdCBsZWFzdCkgdG8ga2VlcAo+
IHRyYWNrIG9mIHRoZSBiaWdnZXIgcGljdHVyZSAoaS5lLiBYZW4gdXNpbmcgZW5saWdodGVubWVu
dHMgYXMgd2VsbCBhcwo+IGltcGxlbWVudGluZyB0aGVtKS4KCldoZW4geW91IHNhaWQgInlvdXJz
ZWxmIiwgZGlkIHlvdSBtZWFuIG1lIG9yIEphbj8KCldlaS4KCj4gCj4gICBDaGVlcnMsCj4gCj4g
ICAgIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
