Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E753323D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:35:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXnzo-0000FY-W5; Mon, 03 Jun 2019 14:31:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXnzn-0000FT-Vn
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:31:32 +0000
X-Inumbo-ID: 44620c70-860c-11e9-8aac-036df0439c71
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44620c70-860c-11e9-8aac-036df0439c71;
 Mon, 03 Jun 2019 14:31:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 08:31:25 -0600
Message-Id: <5CF52F3A0200007800234AC4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 08:31:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
 <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
 <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
 <5CF4FC53020000780023490D@prv1-mh.provo.novell.com>
 <6852F5F0-0DC1-4FAE-9D80-5AF9C1187DB4@citrix.com>
In-Reply-To: <6852F5F0-0DC1-4FAE-9D80-5AF9C1187DB4@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Baodong Chen <chenbaodong@mxnavi.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE2OjA4LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKCj4gCj4+IE9uIEp1biAzLCAyMDE5LCBhdCAxMTo1NCBBTSwgSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToKPj4gCj4+Pj4+IE9uIDAzLjA2LjE5IGF0IDEyOjQxLCA8Y2hl
bmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+IAo+Pj4gT24gNi8zLzE5IDE2OjMxLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAwMy4wNi4xOSBhdCAwNTowNywgPGNoZW5iYW9kb25n
QG14bmF2aS5jb20+IHdyb3RlOgo+Pj4+PiBPbiA1LzMxLzE5IDE5OjEwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+Pj4+Pj4+IE9uIDMwLjA1LjE5IGF0IDEyOjE3LCA8Y2hlbmJhb2RvbmdAbXhuYXZp
LmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gRGVmYXVsdDogZW5hYmxlZC4KPj4+Pj4+PiBDYW4gYmUgZGlz
YWJsZWQgZm9yIHNtYWxsZXIgY29kZSBmb290cHJpbnQuCj4+Pj4+PiBCdXQgeW91J3JlIGF3YXJl
IHRoYXQgd2UncmUsIGZvciBub3cgYXQgbGVhc3QsIHRyeWluZyB0byBsaW1pdCB0aGUKPj4+Pj4+
IG51bWJlciBvZiBpbmRlcGVuZGVudGx5IHNlbGVjdGFibGUgY29uZmlnIG9wdGlvbnM/IE9uZXMg
ZGVwZW5kaW5nCj4+Pj4+PiBvbiBFWFBFUlQgYXJlIHNvcnQgb2YgYW4gZXhjZXB0aW9uIGluIGNl
cnRhaW4gY2FzZXMuCj4+Pj4+IExpbWl0IHRoZSBudW1iZXIgb2YgaW5kZXBlbmRlbnRseSBzZWxl
Y3RhYmxlIGNvbmZpZyBzb3VuZHMgZ29vZCB0byBtZS4KPj4+Pj4gCj4+Pj4+IERvZXMgdGhlIGZv
bGxvd2luZyBsb29rcyBnb29kPwo+Pj4+PiAKPj4+Pj4gK2NvbmZpZyBIQVNfVFJBQ0VCVUZGRVIK
Pj4+Pj4gKyAgICAgICBib29sICJFbmFibGUvRGlzYWJsZSB0cmFjZWJ1ZmZlciIgIGlmIEVYUEVS
VCA9ICJ5Igo+Pj4+PiArICAgICAgIC0tLWhlbHAtLS0KPj4+Pj4gKyAgICAgICAgIEVuYWJsZSBv
ciBkaXNhYmxlIHRyYWNlYnVmZmVyIGZ1bmN0aW9uLgo+Pj4+PiArICAgICAgICAgWGVuIGludGVy
bmFsIHJ1bm5pbmcgc3RhdHVzKHRyYWNlIGV2ZW50KSB3aWxsIGJlIHNhdmVkIHRvCj4+Pj4+IHRy
YWNlIG1lbW9yeQo+Pj4+PiArICAgICAgICAgd2hlbiBlbmFibGVkLgo+Pj4+PiArCj4+Pj4gVGhl
IEVYUEVSVCBhZGRpdGlvbiBtYWtlIGludHJvZHVjaW5nIHRoaXMgZmluZSBieSBtZS4gQnV0IGl0
cyBuYW1lCj4+Pj4gaXMgc3RpbGwgd3JvbmcsIGFuZCB0aGUgaGVscCB0ZXh0IGFsc28gbmVlZHMg
ZnVydGhlciBpbXByb3ZlbWVudCBpbW8uCj4+PiAKPj4+IEhpIEphbiwgdGhhbmtzIGZvciB5b3Vy
IGtpbmRseSByZXZpZXcgYW5kIGZlZWRiYWNrLgo+Pj4gCj4+PiBGb3IgdGhpcywgd291bGQgeW91
IHBsZWFzZSBnaXZlIHlvdXIgc3VnZ2VzdGlvbnMgYWJvdXQgdGhlIG5hbWUgYW5kIGhlbHAgCj4+
PiB0ZXh0Pwo+PiAKPj4gQXMgZmFyIGFzIHRoZSBuYW1lIGlzIGNvbmNlcm5lZCwgdGhlIEhBU18g
c2hvdWxkIGJlIGRyb3BwZWQuCj4+IEknbSBhZnJhaWQgSSBkb24ndCBoYXZlIGEgcGFydGljdWxh
ciBzdWdnZXN0aW9uIGZvciB0aGUgaGVscCB0ZXh0Lgo+IAo+IFlvdSBjb3VsZCBhdCBsZWFzdCBn
aXZlIGFuIGlkZWEgd2hhdCB5b3UgdGhpbmsgdGhlIGhlbHAgdGV4dCBzaG91bGQgaW5jbHVkZSwg
Cj4gb3Igc29tZSBraW5kIG9mIGd1aWRhbmNlIGFzIHRvIHdoYXQgd291bGQgc2F0aXNmeSB5b3Uu
ICBPYnZpb3VzbHkgeW91IAo+IHNob3VsZG7igJl0IGJlIHJlcXVpcmVkIHRvIHdyaXRlIGV2ZXJ5
Ym9keeKAmXMgaGVscCB0ZXh0IGZvciB0aGVtOyBidXQgYnkgdGhlIAo+IHNhbWUgdG9rZW4sIGV2
ZXJ5Ym9keSBzaG91bGRu4oCZdCBiZSByZXF1aXJlZCB0byByZWFkIHlvdXIgbWluZC4KPiAKPiBJ
cywg4oCcQSBkZXNjcmlwdGlvbiBvZiB0aGUgZmVhdHVyZSwgYWxvbmcgd2l0aCB0aGUgY29zdHMg
b2YgZW5hYmxpbmcgaXTigJ0gdGhlIAo+IHNvcnQgb2YgdGhpbmcgeW91IGhhZCBpbiBtaW5kPwoK
SSBoYWQgbm90aGluZyBpbiBwYXJ0aWN1bGFyIGluIG1pbmQuIFRoZXJlIG91Z2h0IHRvIGJlIG90
aGVyIEtjb25maWcKb3B0aW9ucyB3aXRoIGF0IGxlYXN0IGhhbGYgd2F5IHJlYXNvbmFibGUgaGVs
cCB0ZXh0LCB3aGljaCBJIHRoaW5rCmNvdWxkIGJlIHVzZWQgYXMgZ3VpZGFuY2UuIEJleW9uZCB0
aGF0IEkgdGhpbmsgaGVscCB0ZXh0IGxhcmdlbHkgb25seQpyZS1zdGF0aW5nIHdoYXQgdGhlIHBy
b21wdCBhbHJlYWR5IHNheXMgaXNuJ3QgaGVscGZ1bCwgYW5kIGhlbmNlCmNvdWxkIGFzIHdlbGwg
YmUgb21pdHRlZC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
