Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A53C713
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 11:14:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hacnN-0005aw-BC; Tue, 11 Jun 2019 09:10:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hacnL-0005ar-6N
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:10:19 +0000
X-Inumbo-ID: b98a3b36-8c28-11e9-9b8a-a340d3c0f12d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b98a3b36-8c28-11e9-9b8a-a340d3c0f12d;
 Tue, 11 Jun 2019 09:10:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 03:10:14 -0600
Message-Id: <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 03:10:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
In-Reply-To: <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA2LjE5IGF0IDEzOjQ0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpIEphbiwKPiAKPiBPbiAwNy8wNi8yMDE5IDE1OjIzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4gT24gMjQuMDUuMTkgYXQgMjA6MTIsIDxhbmRyaWkuYW5pc292QGdtYWlsLmNvbT4gd3JvdGU6
Cj4+PiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+Pj4KPj4+
IEV4aXN0aW5nIGludGVyZmFjZSB0byByZWdpc3RlciBydW5zdGF0ZSBhcmUgd2l0aCBpdHMgdmly
dHVhbCBhZGRyZXNzCj4+PiBpcyBwcm9uZSB0byBpc3N1ZXMgd2hpY2ggYmVjYW1lIG1vcmUgb2J2
aW91cyB3aXRoIEtQVEkgZW5hYmxlbWVudCBpbgo+Pj4gZ3Vlc3RzLiBUaGUgbmF0dXJlIG9mIHRo
b3NlIGlzc3VlcyBpcyB0aGUgZmFjdCB0aGF0IHRoZSBndWVzdCBjb3VsZAo+Pj4gYmUgaW50ZXJy
dXB0ZWQgYnkgdGhlIGh5cGVydmlzb3IgYXQgYW55IHRpbWUsIGFuZCB0aGVyZSBpcyBubyBndWFy
YW50ZWUKPj4+IHRvIGhhdmUgdGhlIHJlZ2lzdGVyZWQgdmlydHVhbCBhZGRyZXNzIHRyYW5zbGF0
ZWQgd2l0aCB0aGUgY3VycmVudGx5Cj4+PiBhdmFpbGFibGUgZ3Vlc3QncyBwYWdlIHRhYmxlcy4g
QmVmb3JlIHRoZSBLUFRJIHN1Y2ggYSBzaXR1YXRpb24gd2FzCj4+PiBwb3NzaWJsZSBpbiBjYXNl
IHRoZSBndWVzdCBpcyBjYXVnaHQgaW4gdGhlIG1pZGRsZSBvZiBQVCBwcm9jZXNzaW5nCj4+PiAo
ZS5nLiBzdXBlcnBhZ2Ugc2hhdHRlcmluZykuIFdpdGggdGhlIEtQVEkgdGhpcyBoYXBwZW5zIGFs
c28gd2hlbiB0aGUKPj4+IGd1ZXN0IHJ1bnMgdXNlcnNwYWNlLCBzbyBoYXMgYSBwcmV0dHkgaGln
aCBwcm9iYWJpbGl0eS4KPj4gCj4+IEV4Y2VwdCB3aGVuIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgS1BU
SSBpbiB0aGUgZ3Vlc3QgaW4gdGhlIGZpcnN0IHBsYWNlLAo+PiBhcyBpcyB0aGUgY2FzZSBmb3Ig
eDg2LTY0IFBWIGd1ZXN0cy4gSSB0aGluayB0aGlzIGlzIHdvcnRod2hpbGUgY2xhcmlmeWluZy4K
PiAKPiBJIGFtIG5vdCBzdXJlIHdoYXQgaXMgeW91ciBwb2ludCBoZXJlLiBBdCBsZWFzdCBvbiBB
cm0sIHVzaW5nIHZpcnR1YWwgYWRkcmVzcyBpcyAKPiBub3Qgc2FmZSBhdCBhbGwgKHdoZXRoZXIg
S1BUSSBpcyB1c2VkIG9yIG5vdCkuIEEgZ3Vlc3QgY2FuIGdlbnVpbmVseSBkZWNpZGVzIHRvIAo+
IHNoYXR0ZXIgdGhlIG1hcHBpbmcgd2hlcmUgdGhlIHZpcnR1YWwgYWRkcmVzcyBpcy4gT24gQXJt
LCB0aGlzIHJlcXVpcmUgdG8gdXNlIAo+IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4g
SXQgbWVhbnMgdGhlIHRyYW5zbGF0aW9uIFZBIC0+IFBBIG1heSBmYWlsIGlzIAo+IHlvdSBoYXBw
ZW4gdG8gZG8gaXQgd2hpbGUgdGhlIGd1ZXN0IGlzIHVzaW5nIHRoZSBzZXF1ZW5jZS4KPiAKPiBT
b21lIG9mIHRoZSBpbnRlcm1pdHRlbnQgaXNzdWVzIEkgaGF2ZSBzZWVuIG9uIHRoZSBBcm5kYWxl
IGluIHRoZSBwYXN0IFsxXSBtaWdodCAKPiBiZSByZWxhdGVkIHRvIHVzaW5nIHZpcnR1YWwgYWRk
cmVzcy4gSSBhbSBub3QgMTAwJSBzdXJlIGJlY2F1c2UgZXZlbiBpZiB0aGUgCj4gZGVidWcsIHRo
ZSBlcnJvciBkb2VzIG5vdCBtYWtlIHNlbnNlLiBCdXQgdGhpcyBpcyB0aGUgbW9zdCBwbGF1c2li
bGUgcmVhc29uIGZvciAKPiB0aGUgZmFpbHVyZS4KCkFsbCBmaW5lLCBidXQgQXJtLXNwZWNpZmlj
LiBUaGUgcG9pbnQgb2YgbXkgY29tbWVudCB3YXMgdG8gYXNrIHRvIGNhbGwKb3V0IHRoYXQgdGhl
cmUgaXMgb25lIGVudmlyb25tZW50ICh4ODYtNjQgUFYpIHdoZXJlIHRoaXMgS1BUSQpkaXNjdXNz
aW9uIGlzIGVudGlyZWx5IGluYXBwbGljYWJsZS4KCj4+PiBAQCAtMzUsOCArMzcsMTYgQEAgYXJj
aF9jb21wYXRfdmNwdV9vcCgKPj4+ICAgICAgICAgICAgICAgICFjb21wYXRfaGFuZGxlX29rYXko
YXJlYS5hZGRyLmgsIDEpICkKPj4+ICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiAgIAo+Pj4gKyAg
ICAgICAgd2hpbGUoIHhjaGcoJnYtPnJ1bnN0YXRlX2luX3VzZSwgMSkgPT0gMCk7Cj4+IAo+PiBB
dCB0aGUgdmVyeSBsZWFzdCBzdWNoIGxvb3BzIHdhbnQgYSBjcHVfcmVsYXgoKSBpbiB0aGVpciBi
b2RpZXMuCj4+IEJ1dCB0aGlzIGJlaW5nIG9uIGEgaHlwZXJjYWxsIHBhdGggLSBhcmUgdGhlcmUg
dGhlb3JldGljYWwgZ3VhcmFudGVlcwo+PiB0aGF0IGEgZ3Vlc3QgY2FuJ3QgYWJ1c2UgdGhpcyB0
byBsb2NrIHVwIGEgQ1BVPwo+IEhtbW0sIEkgc3VnZ2VzdGVkIHRoaXMgYnV0IGl0IGxvb2tzIGxp
a2UgYSBndWVzdCBtYXkgY2FsbCB0aGUgaHlwZXJjYWxsIG11bHRpcGxlIAo+IHRpbWUgZnJvbSBk
aWZmZXJlbnQgdkNQVS4gU28gdGhpcyBjb3VsZCBiZSBhIHdheSB0byBkZWxheSB3b3JrIG9uIHRo
ZSBDUFUuCj4gCj4gSSB3YW50ZWQgdG8gbWFrZSB0aGUgY29udGV4dCBzd2l0Y2ggbW9zdGx5IGxv
Y2tsZXNzIGFuZCB0aGVyZWZvcmUgYXZvaWRpbmcgdG8gCj4gaW50cm9kdWNlIGEgc3BpbmxvY2su
CgpXZWxsLCBjb25zdHJ1Y3RzIGxpa2UgdGhlIGFib3ZlIGFyZSB0cnlpbmcgdG8gbWltaWMgYSBz
cGlubG9jawp3aXRob3V0IGFjdHVhbGx5IHVzaW5nIGEgc3BpbmxvY2suIFRoZXJlIGFyZSBleHRy
ZW1lbHkgcmFyZQpzaXR1YXRpb24gaW4gd2hpY2ggdGhpcyBtYXkgaW5kZWVkIGJlIHdhcnJhbnRl
ZCwgYnV0IGhlcmUgaXQKZmFsbHMgaW4gdGhlIGNvbW1vbiAibWFrZXMgdGhpbmdzIHdvcnNlIG92
ZXJhbGwiIGJ1Y2tldCwgSQp0aGluay4gVG8gbm90IHVuZHVseSBwZW5hbGl6ZSB0aGUgYWN0dWFs
IHVwZGF0ZSBwYXRocywgSSB0aGluawp1c2luZyBhIHIvdyBsb2NrIHdvdWxkIGJlIGFwcHJvcHJp
YXRlIGhlcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
