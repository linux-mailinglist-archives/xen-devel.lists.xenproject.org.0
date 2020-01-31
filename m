Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6714EFB5
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:36:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYIg-0001LY-50; Fri, 31 Jan 2020 15:33:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixYIe-0001LT-7b
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:33:40 +0000
X-Inumbo-ID: 0dd48eb6-443f-11ea-ad98-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dd48eb6-443f-11ea-ad98-bc764e2007e4;
 Fri, 31 Jan 2020 15:33:39 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYIa-0005Xs-KG; Fri, 31 Jan 2020 15:33:36 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYIa-00043P-9N; Fri, 31 Jan 2020 15:33:36 +0000
Date: Fri, 31 Jan 2020 15:33:32 +0000
From: Wei Liu <wl@xen.org>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20200131153332.r4oe3sadhvoly7ho@debian>
References: <646A4BEA-C544-4C62-A7A3-B736D3860912@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <646A4BEA-C544-4C62-A7A3-B736D3860912@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jason Andryuk <jandryuk@gmail.com>, George Dunlap <George.Dunlap@citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 =?utf-8?B?SMOla29u?= Alstadheim <hakon@alstadheim.priv.no>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMDI6MTM6MDRQTSAtMDUwMCwgUmljaCBQZXJzYXVkIHdy
b3RlOgo+IE9uIEF1ZyAyNiwgMjAxOSwgYXQgMTc6MDgsIFBhc2kgS8Okcmtrw6RpbmVuIDxwYXNp
a0Bpa2kuZmk+IHdyb3RlOgo+ID4g77u/SGksCj4gPiAKPiA+PiBPbiBNb24sIE9jdCAwOCwgMjAx
OCBhdCAxMDozMjo0NUFNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gPj4+IE9uIDEw
LzMvMTggMTE6NTEgQU0sIFBhc2kgS8Okcmtrw6RpbmVuIHdyb3RlOgo+ID4+PiBPbiBXZWQsIFNl
cCAxOSwgMjAxOCBhdCAxMTowNToyNkFNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
ID4+Pj4gT24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDI6MDk6NTNQTSAtMDQwMCwgQm9yaXMgT3N0
cm92c2t5IHdyb3RlOgo+ID4+Pj4+IE9uIDkvMTgvMTggNTozMiBBTSwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiA+Pj4+Pj4+IE9uIFNlcCAxOCwgMjAxOCwgYXQgODoxNSBBTSwgUGFzaSBLw6Rya2vD
pGluZW4gPHBhc2lrQGlraS5maT4gd3JvdGU6Cj4gPj4+Pj4+PiBIaSwKPiA+Pj4+Pj4+IE9uIE1v
biwgU2VwIDE3LCAyMDE4IGF0IDAyOjA2OjAyUE0gLTA0MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90
ZToKPiA+Pj4+Pj4+PiBXaGF0IGFib3V0IHRoZSB0b29sc3RhY2sgY2hhbmdlcz8gSGF2ZSB0aGV5
IGJlZW4gYWNjZXB0ZWQ/IEkgdmFndWVseQo+ID4+Pj4+Pj4+IHJlY2FsbCB0aGVyZSB3YXMgYSBk
aXNjdXNzaW9uIGFib3V0IHRob3NlIGNoYW5nZXMgYnV0IGRvbid0IHJlbWVtYmVyIGhvdwo+ID4+
Pj4+Pj4+IGl0IGVuZGVkLgo+ID4+Pj4+Pj4gSSBkb24ndCB0aGluayB0b29sc3RhY2svbGlieGwg
cGF0Y2ggaGFzIGJlZW4gYXBwbGllZCB5ZXQgZWl0aGVyLgo+ID4+Pj4+Pj4gIltQQVRDSCBWMSAw
LzFdIFhlbi9Ub29sczogUENJIHJlc2V0IHVzaW5nICdyZXNldCcgU3lzRlMgYXR0cmlidXRlIjoK
PiA+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE3LTEyL21zZzAwNjY0Lmh0bWwKPiA+Pj4+Pj4+ICJbUEFUQ0ggVjEgMS8xXSBYZW4vbGlieGw6
IFBlcmZvcm0gUENJIHJlc2V0IHVzaW5nICdyZXNldCcgU3lzRlMgYXR0cmlidXRlIjoKPiA+Pj4+
Pj4+IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEy
L21zZzAwNjYzLmh0bWwKPiA+Pj4+PiBXaWxsIHRoaXMgcGF0Y2ggd29yayBmb3IgKkJTRD8gUm9n
ZXI/Cj4gPj4+PiBBdCBsZWFzdCBGcmVlQlNEIGRvbid0IHN1cHBvcnQgcGNpLXBhc3N0aHJvdWdo
LCBzbyBub25lIG9mIHRoaXMgd29ya3MKPiA+Pj4+IEFUTS4gVGhlcmUncyBubyBzeXNmcyBvbiBC
U0QsIHNvIG11Y2ggb2Ygd2hhdCdzIGluIGxpYnhsX3BjaS5jIHdpbGwKPiA+Pj4+IGhhdmUgdG8g
YmUgbW92ZWQgdG8gbGlieGxfbGludXguYyB3aGVuIEJTRCBzdXBwb3J0IGlzIGFkZGVkLgo+ID4+
PiBPay4gVGhhdCBzb3VuZHMgbGlrZSBpdCdzIE9LIGZvciB0aGUgaW5pdGlhbCBwY2kgJ3Jlc2V0
JyBpbXBsZW1lbnRhdGlvbiBpbiB4bC9saWJ4bCB0byBiZSBsaW51eC1vbmx5Li4KPiA+PiAKPiA+
PiBBcmUgdGhlc2UgdHdvIHBhdGNoZXMgc3RpbGwgbmVlZGVkPyBJU1RSIHRoZXkgd2VyZSAgd3Jp
dHRlbiBvcmlnaW5hbGx5Cj4gPj4gdG8gZGVhbCB3aXRoIGd1ZXN0IHRyeWluZyB0byB1c2UgZGV2
aWNlIHRoYXQgd2FzIHByZXZpb3VzbHkgYXNzaWduZWQgdG8KPiA+PiBhbm90aGVyIGd1ZXN0LiBC
dXQgcGNpc3R1Yl9wdXRfcGNpX2RldigpIGNhbGxzCj4gPj4gX19wY2lfcmVzZXRfZnVuY3Rpb25f
bG9ja2VkKCkgd2hpY2ggZmlyc3QgdHJpZXMgRkxSLCBhbmQgaXQgbG9va3MgbGlrZQo+ID4+IGl0
IHdhcyBhZGRlZCByZWxhdGl2ZWx5IHJlY2VudGx5Lgo+ID4gCj4gPiBSZXBseWluZyB0byBhbiBv
bGQgdGhyZWFkLi4gSSBvbmx5IG5vdyByZWFsaXplZCBJIGZvcmdvdCB0byByZXBseSB0byB0aGlz
IG1lc3NhZ2UgZWFybGllci4KPiA+IAo+ID4gYWZhaWsgdGhlc2UgcGF0Y2hlcyBhcmUgc3RpbGwg
bmVlZGVkLiBIw6Vrb24gKENDJ2QpIHdyb3RlIHRvIG1lIGluIHByaXZhdGUgdGhhdAo+ID4gaGUg
Z2V0cyBhIChkb20wKSBMaW51eCBrZXJuZWwgY3Jhc2ggaWYgaGUgZG9lc24ndCBoYXZlIHRoZXNl
IHBhdGNoZXMgYXBwbGllZC4KPiA+IAo+ID4gCj4gPiBIZXJlIGFyZSB0aGUgbGlua3MgdG8gYm90
aCB0aGUgbGludXgga2VybmVsIGFuZCBsaWJ4bCBwYXRjaGVzOgo+ID4gCj4gPiAKPiA+ICJbWGVu
LWRldmVsXSBbUEFUQ0ggVjMgMC8yXSBYZW4vUENJYmFjazogUENJIHJlc2V0IHVzaW5nICdyZXNl
dCcgU3lzRlMgYXR0cmlidXRlIjoKPiA+IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9o
dG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAwNjU5Lmh0bWwKPiA+IAo+ID4gW05vdGUgdGhhdCBQ
QVRDSCBWMyAxLzIgIkRyaXZlcnMvUENJOiBFeHBvcnQgcGNpZV9oYXNfZmxyKCkgaW50ZXJmYWNl
IiBpcyBhbHJlYWR5IGFwcGxpZWQgaW4gdXBzdHJlYW0gbGludXgga2VybmVsLCBzbyBpdCdzIG5v
dCBuZWVkZWQgYW55bW9yZV0KPiA+IAo+ID4gIltYZW4tZGV2ZWxdIFtQQVRDSCBWMyAyLzJdIFhl
bi9QQ0liYWNrOiBJbXBsZW1lbnQgUENJIGZsci9zbG90L2J1cyByZXNldCB3aXRoICdyZXNldCcg
U3lzRlMgYXR0cmlidXRlIjoKPiA+IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE3LTEyL21zZzAwNjYxLmh0bWwKPiA+IAo+ID4gCj4gPiAiW1hlbi1kZXZl
bF0gW1BBVENIIFYxIDAvMV0gWGVuL1Rvb2xzOiBQQ0kgcmVzZXQgdXNpbmcgJ3Jlc2V0JyBTeXNG
UyBhdHRyaWJ1dGUiOgo+ID4gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTctMTIvbXNnMDA2NjQuaHRtbAo+ID4gCj4gPiAiW1hlbi1kZXZlbF0gW1BBVENI
IFYxIDEvMV0gWGVuL2xpYnhsOiBQZXJmb3JtIFBDSSByZXNldCB1c2luZyAncmVzZXQnIFN5c0ZT
IGF0dHJpYnV0ZSI6Cj4gPiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxNy0xMi9tc2cwMDY2My5odG1sCj4gCj4gW2Ryb3BwaW5nIExpbnV4IG1haWxpbmcg
bGlzdHNdCj4gCj4gV2hhdCBpcyByZXF1aXJlZCB0byBnZXQgdGhlIFhlbiBwYXRjaGVzIG1lcmdl
ZD8gIFJlYmFzaW5nIGFnYWluc3QgWGVuCj4gbWFzdGVyPyAgT3BlblhUIGhhcyBiZWVuIGNhcnJ5
aW5nIGEgc2ltaWxhciBwYXRjaCBmb3IgbWFueSB5ZWFycyBhbmQKPiB3ZSB3b3VsZCBsaWtlIHRv
IG1vdmUgdG8gYW4gdXBzdHJlYW0gaW1wbGVtZW50YXRpb24uICBYZW4gdXNlcnMgb2YgUENJCj4g
cGFzc3Rocm91Z2ggd291bGQgYmVuZWZpdCBmcm9tIG1vcmUgcmVsaWFibGUgZGV2aWNlIHJlc2V0
LgoKUmViYXNlIGFuZCByZXNlbmQ/CgpTa2ltbWluZyB0aGF0IHRocmVhZCBJIHRoaW5rIHRoZSBt
YWpvciBjb25jZXJuIHdhcyBiYWNrd2FyZApjb21wYXRpYmlsaXR5LiBUaGF0IHNlZW1lZCB0byBo
YXZlIGJlZW4gYWRkcmVzc2VkLgoKVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgdGhlIHRpbWUg
dG8gZGlnIGludG8gTGludXggdG8gc2VlIGlmIHRoZQpjbGFpbSB0aGVyZSBpcyB0cnVlIG9yIG5v
dC4KCkl0IHdvdWxkIGJlIGhlbHBmdWwgdG8gd3JpdGUgYSBjb25jaXNlIHBhcmFncmFwaCB0byBz
YXkgd2h5IGJhY2t3YXJkCmNvbXBhdGliaWxpdHkgaXMgbm90IHJlcXVpcmVkLgoKV2VpLgoKPiAK
PiAgIDIwMTcgdGhyZWFkLCBpbmNsdWRpbmcgT3BlblhUIHBhdGNoOiBodHRwczovL2xpc3RzLmd0
Lm5ldC94ZW4vZGV2ZWwvNDkyOTQ1Cj4gICAyMDE3LTIwMTkgdGhyZWFkOiBodHRwczovL2xpc3Rz
Lmd0Lm5ldC94ZW4vZGV2ZWwvNTMyNjQ4Cj4gCj4gUmljaAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
