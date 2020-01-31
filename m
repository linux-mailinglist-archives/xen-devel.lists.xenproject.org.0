Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C614EE49
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:22:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXAC-0001Z7-PG; Fri, 31 Jan 2020 14:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixXAB-0001Z1-5E
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:20:51 +0000
X-Inumbo-ID: e1d430e6-4434-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1d430e6-4434-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 14:20:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXA9-000413-5L; Fri, 31 Jan 2020 14:20:49 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXA8-0007QZ-SA; Fri, 31 Jan 2020 14:20:49 +0000
Date: Fri, 31 Jan 2020 14:20:45 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200131142045.xvbbq36lutkqzai7@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <d57ce32a-fd0e-e98d-4e97-335963f946c7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d57ce32a-fd0e-e98d-4e97-335963f946c7@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
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

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDM6MTI6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzAuMDEuMjAyMCAxMzoyOCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwgSmFu
IDMwLCAyMDIwIGF0IDAxOjA4OjA3UE0gKzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
Pj4KPiA+Pj4gK30KPiA+Pj4gKwo+ID4+PiAgLyoKPiA+Pj4gICAqIExvY2FsIHZhcmlhYmxlczoK
PiA+Pj4gICAqIG1vZGU6IEMKPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRz
LlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPj4+IGluZGV4IDk3ZjljMDc4OTEuLjhlMDJi
NGM2NDggMTAwNjQ0Cj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+Pj4gKysr
IGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4+PiBAQCAtMzI5LDYgKzMyOSwxMCBAQCBTRUNU
SU9OUwo+ID4+PiAgICBlZmkgPSAuOwo+ID4+PiAgI2VuZGlmCj4gPj4+ICAKPiA+Pj4gKyNpZmRl
ZiBDT05GSUdfSFlQRVJWX0dVRVNUCj4gPj4+ICsgIGh2X2hjYWxsX3BhZ2UgPSBBQlNPTFVURShf
X2ZpeF94X3RvX3ZpcnQoMSkpOwo+ID4+Cj4gPj4gSSBhc3N1bWUgdGhlcmUncyBubyB3YXkgdG8g
dXNlIEZJWF9YX0hZUEVSVl9IQ0FMTCBiZWNhdXNlIGl0J3MgYW4KPiA+PiBlbnVtPwo+ID4+Cj4g
PiAKPiA+IFllcy4KPiA+IAo+ID4gQW5kIHRoZSB0cmljayB0byBnZW5lcmF0ZSBhIHN5bWJvbCBk
aWRuJ3Qgd29yayBlaXRoZXIuCj4gCj4gSSBndWVzcyBJIG5lZWQgYW4gZXhwbGFuYXRpb24gaGVy
ZS4gQWl1aSB5b3UgZG9uJ3QgcmVhbGx5IG5lZWQKPiB0aGUgZGVmaW5pdGlvbiB0byBiZSBpbiB0
aGUgbGlua2VyIHNjcmlwdCwgYW5kIGl0IGNvdWxkIGFzIHdlbGwKPiBiZSBpbiBlLmcuIGFzc2Vt
Ymx5IGNvZGUuIEhvdyBkb2VzIHRoZSBzYW1lIC5lcXUgYXBwcm9hY2ggbm90Cj4gd29yayBpbiB0
aGlzIGNhc2U/Cj4gCgpJbiBjb21taXQgbWVzc2FnZToKCm1tLmM6NTczNjo1OiBlcnJvcjogaW52
YWxpZCAnYXNtJzogb3BlcmFuZCBpcyBub3QgYSBjb25kaXRpb24gY29kZSwKaW52YWxpZCBvcGVy
YW5kIGNvZGUgJ2MnCiAgICAgICAgICAgICAgIGFzbSAoICIuZXF1IEhWX0hDQUxMX1BBR0UsICVj
MDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgoKSVNUUiB5b3Ugb25jZSBtZW50aW9uZWQgaW4gSVJD
IHRoYXQgdGhlcmUgaXMgYSB3YXkgYXJvdW5kIHRoaXMgKHdpdGggYQpuZXcgbW9kaWZpZXIgLyBx
dWFsaWZpZXIpLCBidXQgSSBkb24ndCBoYXZlIHRoZSBsb2cgYW55bW9yZS4KCj4gQWxzbyBJIHRo
aW5rIHRoZSBhYm92ZSB3aWxsIHRyaWdnZXIgdGhlIHdhcm5pbmdzIEFuZHJldyBoYWQKPiBtZW50
aW9uZWQgKG9uIGlyYz8pIGZyb20gdGhlIGNvZGUgZ2VuZXJhdGluZyB4ZW4uZWZpJ3MgcnVudGlt
ZQo+IHJlbG9jYXRpb24gdGFibGUuIEp1c3QgbGlrZSBpbgo+IAoKSXQgd2FzIGEgcmVwbHkgdG8g
djQuICA8Y2IwZTgyZGMtYTE1NC1mOTE4LWU3MjUtZjc3OTEzZjgzNWY5QGNpdHJpeC5jb20+CgpJ
IGRvbid0IHNlZSB0aGUgd2FybmluZyB3aXRoIHRoaXMgcGF0Y2guCgpXZWkuCgo+IEFTU0VSVChf
XzJNX3J3ZGF0YV9lbmQgPD0gWEVOX1ZJUlRfRU5EIC0gWEVOX1ZJUlRfU1RBUlQgKyBfX1hFTl9W
SVJUX1NUQVJUIC0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIE5SX0NQVVMgKiBQQUdFX1NJ
WkUsCj4gICAgICAgICJYZW4gaW1hZ2Ugb3ZlcmxhcHMgc3R1YnMgYXJlYSIpCj4gCj4gSSB0aGlu
ayB5b3UgbmVlZCB0byBhZGp1c3QgYnkgX19YRU5fVklSVF9TVEFSVCAtIFhFTl9WSVJUX1NUQVJU
Lgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
