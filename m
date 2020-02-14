Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281B15D60E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 11:50:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2YVi-0005xS-6x; Fri, 14 Feb 2020 10:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNNH=4C=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2YVh-0005xN-1p
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 10:47:49 +0000
X-Inumbo-ID: 70aefaf2-4f17-11ea-b0fd-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70aefaf2-4f17-11ea-b0fd-bc764e2007e4;
 Fri, 14 Feb 2020 10:47:48 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2YVe-0005tx-Rl; Fri, 14 Feb 2020 10:47:46 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2YVe-0001v8-Hq; Fri, 14 Feb 2020 10:47:46 +0000
Date: Fri, 14 Feb 2020 10:47:43 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200214104743.fusldikwiadsz7nl@debian>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-5-liuwe@microsoft.com>
 <20200212174347.GU4679@Air-de-Roger>
 <20200213122033.gyrv6dia3jdrwgpx@debian>
 <20200213124127.GY4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213124127.GY4679@Air-de-Roger>
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDE6NDE6MjdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEZlYiAxMywgMjAyMCBhdCAxMjoyMDozM1BNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDY6NDM6NDdQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDQ6
MDk6MThQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiArc3RhdGljIHVpbnQ2NF90IGZs
dXNoX3RsYl9leChjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLAo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKPiA+ID4g
PiArewo+ID4gPiA+ICsgICAgc3RydWN0IGh2X3RsYl9mbHVzaF9leCAqZmx1c2ggPSB0aGlzX2Nw
dShodl9pbnB1dF9wYWdlKTsKPiA+ID4gPiArICAgIGludCBucl9iYW5rczsKPiA+ID4gPiArICAg
IHVuc2lnbmVkIGludCBtYXhfZ3ZhczsKPiA+ID4gPiArICAgIHVuc2lnbmVkIGludCBvcmRlciA9
IGZsYWdzICYgRkxVU0hfT1JERVJfTUFTSzsKPiA+ID4gPiArICAgIHVpbnQ2NF90IHJldDsKPiA+
ID4gPiArCj4gPiA+ID4gKyAgICBBU1NFUlQoZmx1c2gpOwo+ID4gPiA+ICsgICAgQVNTRVJUKCFs
b2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPiA+ID4gCj4gPiA+IENhbiB5b3UgdHVybiB0aGlzIGlu
dG8gYW4gaWYgY29uZGl0aW9uIHdpdGggQVNTRVJUX1VOUkVBQ0hBQkxFIGFuZAo+ID4gPiByZXR1
cm4gfjBVTEw/IChhcyBJIHRoaW5rIHRoYXQgc2lnbmFscyBhbiBlcnJvcikuCj4gPiA+IAo+ID4g
Cj4gPiBUaGVyZSBpcyBubyBuZWVkIGZvciB0aGF0LiBUaGlzIGZ1bmN0aW9uIHdpbGwgYWx3YXlz
IGJlIGludGVybmFsIHRvCj4gPiBIeXBlci1WIGluIHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUuIElm
IGl0IGlzIGV2ZXIgY2FsbGVkIHdpdGggSVJRIGVuYWJsZWQKPiA+IHNvbWV0aGluZyBpcyB3cm9u
ZyB3aXRoIHRoZSBjb2RlLgo+IAo+IEJ1dCBpZmYgaXQgZXZlciBtYW5hZ2VzIHRvIGJlIGNhbGxl
ZCB2aW9sYXRpbmcgb25lIG9mIHRob3NlIGNvbmRpdGlvbnMKPiB0aGluZ3Mgd2lsbCBnbyBiYWRs
eSBJIGFzc3VtZT8KPiAKPiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc3RheSBvbiB0aGUgc2FmZSBz
aWRlIGFuZCBzaW1wbHkgcmV0dXJuIGFuIGVycm9yCj4gd2hlbiB0aGUgY29uZGl0aW9ucyBhcmUg
bm8gbWVldCwgYW5kIGFzc2VydCBpbiB0aGUgZGVidWcgYnVpbGQuCgpPSy4KCj4gCj4gPiAKPiA+
ID4gPiArCj4gPiA+ID4gKyAgICBpZiAoICEobXNfaHlwZXJ2LmhpbnRzICYgSFZfWDY0X0VYX1BS
T0NFU1NPUl9NQVNLU19SRUNPTU1FTkRFRCkgKQo+ID4gPiA+ICsgICAgICAgIHJldHVybiB+MFVM
TDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICBmbHVzaC0+YWRkcmVzc19zcGFjZSA9IDA7Cj4gPiA+
ID4gKyAgICBmbHVzaC0+ZmxhZ3MgPSBIVl9GTFVTSF9BTExfVklSVFVBTF9BRERSRVNTX1NQQUNF
UzsKPiA+ID4gPiArICAgIGlmICggIShmbGFncyAmIEZMVVNIX1RMQl9HTE9CQUwpICkKPiA+ID4g
PiArICAgICAgICBmbHVzaC0+ZmxhZ3MgfD0gSFZfRkxVU0hfTk9OX0dMT0JBTF9NQVBQSU5HU19P
TkxZOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgIGZsdXNoLT5odl92cF9zZXQudmFsaWRfYmFua19t
YXNrID0gMDsKPiA+ID4gPiArICAgIGZsdXNoLT5odl92cF9zZXQuZm9ybWF0ID0gSFZfR0VORVJJ
Q19TRVRfU1BBUlNFXzRLOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgIG5yX2JhbmtzID0gY3B1bWFz
a190b192cHNldCgmZmx1c2gtPmh2X3ZwX3NldCwgbWFzayk7Cj4gPiA+ID4gKyAgICBpZiAoIG5y
X2JhbmtzIDwgMCApCj4gPiA+ID4gKyAgICAgICAgcmV0dXJuIH4wVUxMOwo+ID4gPiA+ICsKPiA+
ID4gPiArICAgIG1heF9ndmFzID0KPiA+ID4gPiArICAgICAgICAoUEFHRV9TSVpFIC0gc2l6ZW9m
KCpmbHVzaCkgLSBucl9iYW5rcyAqCj4gPiA+ID4gKyAgICAgICAgIHNpemVvZihmbHVzaC0+aHZf
dnBfc2V0LmJhbmtfY29udGVudHNbMF0pKSAvCj4gPiA+ID4gKyAgICAgICAgc2l6ZW9mKHVpbnQ2
NF90KTsgICAgICAgLyogZ3ZhIGlzIHJlcHJlc2VudGVkIGFzIHVpbnQ2NF90ICovCj4gPiA+ID4g
Kwo+ID4gPiA+ICsgICAgLyoKPiA+ID4gPiArICAgICAqIEZsdXNoIHRoZSBlbnRpcmUgYWRkcmVz
cyBzcGFjZSBpZiB2YSBpcyBOVUxMIG9yIGlmIHRoZXJlIGlzIG5vdAo+ID4gPiA+ICsgICAgICog
ZW5vdWdoIHNwYWNlIGZvciBndmFfbGlzdC4KPiA+ID4gPiArICAgICAqLwo+ID4gPiA+ICsgICAg
aWYgKCAhdmEgfHwgKE9SREVSX1RPX0JZVEVTKG9yZGVyKSAvIEhWX1RMQl9GTFVTSF9VTklUKSA+
IG1heF9ndmFzICkKPiA+ID4gPiArICAgICAgICByZXQgPSBodl9kb19yZXBfaHlwZXJjYWxsKEhW
Q0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfU1BBQ0VfRVgsIDAsCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBucl9iYW5rcywgdmlydF90b19tYWRkcihmbHVzaCks
IDApOwo+ID4gPiA+ICsgICAgZWxzZQo+ID4gPiA+ICsgICAgewo+ID4gPiA+ICsgICAgICAgIHVp
bnQ2NF90ICpndmFfbGlzdCA9ICh1aW50NjRfdCAqKWZsdXNoICsgc2l6ZW9mKCpmbHVzaCkgKyBu
cl9iYW5rczsKPiA+ID4gCj4gPiA+IERvbid0IHlvdSBuZWVkIG5yX2JhbmtzICogc2l6ZW9mKGZs
dXNoLT5odl92cF9zZXQuYmFua19jb250ZW50cykgaW4KPiA+ID4gb3JkZXIgdG8gY2FsY3VsYXRl
IHRoZSBwb3NpdGlvbiBvZiB0aGUgZ3ZhX2xpc3Q/Cj4gPiA+IAo+ID4gCj4gPiBUaGUgcG9pbnRl
ciBhcml0aG1ldGljIGlzIGRvbmUgb24gdWludDY0X3QgcG9pbnRlcnMgc28gaXQgYWxyZWFkeSB0
YWtlcwo+ID4gaW50byBhY2NvdW50IHNpemVvZihiYW5rX2NvbnRlbnRzWzBdKS4KPiAKPiBPaCwg
dGhlbiB0aGUgc2l6ZW9mKCpmbHVzaCkgc2hvdWxkIGJlIGRpdmlkZWQgYnkgc2l6ZW9mKHVpbnQ2
NF90KT8KPiAKClllcy4gSSB0aGluayBzby4gVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLgoKWy4u
Ll0KPiA+ID4gPiArIGRvX2V4X2h5cGVyY2FsbDoKPiA+ID4gPiArICAgIHJldCA9IGZsdXNoX3Rs
Yl9leChtYXNrLCB2YSwgZmxhZ3MpOwo+ID4gPiA+ICsKPiA+ID4gPiArIGRvbmU6Cj4gPiA+ID4g
KyAgICBsb2NhbF9pcnFfcmVzdG9yZShpcnFfZmxhZ3MpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAg
IHJldHVybiByZXQgJiBIVl9IWVBFUkNBTExfUkVTVUxUX01BU0s7Cj4gPiA+IAo+ID4gPiBXaWxs
IHRoaXMgcmV0dXJuIGFuIGVycm9yIGNvZGUgdGhhdCB1c2VzIHRoZSBzYW1lIHNwYWNlIGFzIFhl
bidzIGVycm5vCj4gPiA+IHZhbHVlcz8KPiA+ID4gCj4gPiAKPiA+IE5vLCBpdCB3b24ndC4gSXQg
cmV0dXJucyBIeXBlci1WJ3Mgc3RhdHVzIGNvZGUgKDAgc3RpbGwgbWVhbnMgc3VjY2VzcykuCj4g
PiAKPiA+IEkgZGlkbid0IHRoaW5rIHRoYXQgd2FzIGEgYmlnIGRlYWwgYmVjYXVzZSBub24temVy
byB2YWx1ZXMgbWVhbnQgZXJyb3JzLgo+ID4gQW5kIHRoZSB1cHBlciBsYXllciBkaWRuJ3QgY2Fy
ZSBhYm91dCB0aGUgZXhhY3QgZXJyb3IgdmFsdWVzICh5ZXQpLgo+IAo+IEhtLCBJIHdvdWxkIHJh
dGhlciBoYXZlIHRoaXMgcmV0dXJuIGFuIGVycm9yIHZhbHVlIGluIHRoZSBlcnJuby5oCj4gcmFu
Z2UuIGllOgo+IAo+IHJldHVybiByZXQgJiBIVl9IWVBFUkNBTExfUkVTVUxUX01BU0sgPyAtRUlO
VkFMIDogMDsKPiAKClN1cmUgdGhpcyBjYW4gYmUgZG9uZS4gSSB3b3VsZCB1c2UgRU5YSU8gcmF0
aGVyIHRoYW4gRUlOVkFMIHRob3VnaC4KCj4gT3Igc29tZXRoaW5nIGFsb25nIHRoaXMgbGluZXMs
IGJ1dCBsb25nIHRlcm0geW91IHdpbGwgbmVlZCBzb21lIGtpbmQKPiBvZiBtYXBwaW5nIGJldHdl
ZW4gSHlwZXJWIGFuZCBYZW4gZXJyb3IgY29kZXMgSU1PLgo+IAoKWWVzLiBXaGVuIHdlIG5lZWQg
bW9yZSBzb3BoaXN0aWNhdGVkIGhhbmRsaW5nIG9mIGVycm9yIGNvZGVzLgoKV2VpLgoKPiBUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
