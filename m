Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631FF527D2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 11:20:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfhaq-0000y1-Lq; Tue, 25 Jun 2019 09:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfhao-0000xw-UC
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 09:18:22 +0000
X-Inumbo-ID: 2ac48944-972a-11e9-a383-37375e20e644
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ac48944-972a-11e9-a383-37375e20e644;
 Tue, 25 Jun 2019 09:18:18 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 03:18:16 -0600
Message-Id: <5D11E6D6020000780023ADDF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 03:18:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
 <20190625081034.n7bvsd4zdcdqsfua@MacBook-Air-de-Roger.local>
In-Reply-To: <20190625081034.n7bvsd4zdcdqsfua@MacBook-Air-de-Roger.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Kiper <daniel.kiper@oracle.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDEwOjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDAxOjI0OjAyUE0gKzAyMDAsIERhbmllbCBLaXBlciB3
cm90ZToKPj4gT24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6MzQ6MTNBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+ID4gPj4+IE9uIDE5LjA2LjE5IGF0IDE3OjA2LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+PiA+ID4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDY6NTc6MDVB
TSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4gPj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEz
OjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+ID4+ID4gSWYgdGhlIGh5cGVy
dmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11bHRpYm9vdDIpLgo+
PiA+ID4+ID4gVGhpcyBhbGxvd3MgdG8gcG9zaXRpb24gdGhlIC5yZWxvYyBzZWN0aW9uIGNvcnJl
Y3RseSBpbiB0aGUgb3V0cHV0Cj4+ID4gPj4gPiBiaW5hcnksIG9yIGVsc2UgdGhlIGxpbmtlciBt
aWdodCBwbGFjZSAucmVsb2MgYmVmb3JlIHRoZSAudGV4dAo+PiA+ID4+ID4gc2VjdGlvbi4KPj4g
PiA+PiA+Cj4+ID4gPj4gPiBOb3RlIHRoYXQgdGhlIC5yZWxvYyBzZWN0aW9uIGlzIG1vdmVkIGJl
Zm9yZSAuYnNzIGZvciB0d28gcmVhc29uczogaW4KPj4gPiA+PiA+IG9yZGVyIGZvciB0aGUgcmVz
dWx0aW5nIGJpbmFyeSB0byBub3QgY29udGFpbiBhbnkgc2VjdGlvbiB3aXRoIGRhdGEKPj4gPiA+
PiA+IGFmdGVyIC5ic3MsIHNvIHRoYXQgdGhlIGZpbGUgc2l6ZSBjYW4gYmUgc21hbGxlciB0aGFu
IHRoZSBsb2FkZWQKPj4gPiA+PiA+IG1lbW9yeSBzaXplLCBhbmQgYmVjYXVzZSB0aGUgZGF0YSBp
dCBjb250YWlucyBpcyByZWFkLW9ubHksIHNvIGl0Cj4+ID4gPj4gPiBiZWxvbmdzIHdpdGggdGhl
IG90aGVyIHNlY3Rpb25zIGNvbnRhaW5pbmcgcmVhZC1vbmx5IGRhdGEuCj4+ID4gPj4KPj4gPiA+
PiBXaGlsZSB0aGlzIG1heSBiZSBmaW5lIGZvciBFTEYsIEknbSBhZnJhaWQgaXQgd291bGQgYmUg
Y2FsbGluZyBmb3IKPj4gPiA+PiBzdWJ0bGUgaXNzdWVzIHdpdGggeGVuLmVmaSAoaS5lLiB0aGUg
UEUgYmluYXJ5KTogVGhlcmUgYSAucmVsb2MKPj4gPiA+PiBzZWN0aW9uIGlzIGdlbmVyYWxseSBl
eHBlY3RlZCB0byBjb21lIGFmdGVyICJub3JtYWwiIGRhdGEKPj4gPiA+PiBzZWN0aW9ucy4KPj4g
PiA+Cj4+ID4gPiBPSywgd291bGQgeW91IGxpa2UgbWUgdG8gbGVhdmUgdGhlIC5yZWxvYyBzZWN0
aW9uIGF0IHRoZSBwcmV2aW91cwo+PiA+ID4gcG9zaXRpb24gZm9yIEVGSSBidWlsZHMgdGhlbj8K
Pj4gPgo+PiA+IFdlbGwsIHRoaXMgcGFydCBpcyBhIHJlcXVpcmVtZW50LCBub3QgYSBxdWVzdGlv
biBvZiBtZSBsaWtpbmcgeW91Cj4+ID4gdG8gZG8gc28uCj4+ID4KPj4gPiA+IE9yIGRvIHdlIHBy
ZWZlciB0byBsZWF2ZSAucmVsb2Mgb3JwaGFuZWQgaW4gdGhlIEVMRiBidWlsZD8KPj4gPgo+PiA+
IERhbmllbCBtaWdodCBoYXZlIGFuIG9waW5pb24gaGVyZSB3aXRoIGhpcyBwbGFucyB0byBhY3R1
YWxseQo+PiA+IGFkZCByZWxvY2F0aW9ucyB0aGVyZSBpbiB0aGUgbm9uLWxpbmtlci1nZW5lcmF0
ZWQtUEUgYnVpbGQuIEkKPj4gPiBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gZWl0aGVyIHdh
eSwgYXMgbG9uZyBhcyB0aGUKPj4gPiBjdXJyZW50IG1ldGhvZCBvZiBidWlsZGluZyBnZXRzIGxl
ZnQgYXMgaXMgKG9yIGV2ZW4gc2ltcGxpZmllZCkuCj4+IAo+PiBJIHdvdWxkIG5vdCBkcm9wIC5y
ZWxvYyBzZWN0aW9uIGZyb20geGVuLXN5bXMgYmVjYXVzZSBpdCBjYW4gYmUgdXNlZnVsCj4+IGZv
ciAibWFudWFsIiBFRkkgaW1hZ2UgcmVsb2NzIGdlbmVyYXRpb24uIEhvd2V2ZXIsIEkgYW0gbm90
IHN0cm9uZ2x5Cj4+IHRpZWQgdG8gaXQuIElmIHlvdSB3aXNoIHRvIGRyb3AgaXQgZ28gYWhlYWQu
IEkgY2FuIHJlYWRkIGl0IGxhdHRlciBpZgo+PiBJIGdldCBiYWNrIHRvIG15IG5ldyBQRSBidWls
ZCB3b3JrLgo+IAo+IERvIHlvdSBtZWFuIHRoYXQgdGhlIGR1bW15IC5yZWxvYyBzZWN0aW9uIGFk
ZGVkIHRvIG5vbi1QRSBidWlsZHMgY2FuCj4gYmUgZHJvcHBlZD8gKGllOiByZW1vdmUgeGVuL2Fy
Y2gveDg2L2VmaS9yZWxvY3MtZHVtbXkuUyBmcm9tIHRoZSBidWlsZCkKCkdpdmVuIG15IGVhcmxp
ZXIgcmVwbHkgaXQncyBub3QgY2xlYXIgdG8gbWUgd2hhdCB5b3UgbWVhbiBieSAicmVtb3ZlIgpo
ZXJlLiBBcyBhIHJlc3VsdCAuLi4KCj4gSSdtIHNsaWdodGx5IGxvc3QsIC5yZWxvYyBiZWdpbiBh
IHNlY3Rpb24gdGhhdCdzIGV4cGxpY2l0bHkgYWRkZWQgdG8KPiBub24tUEUgYnVpbGRzIGJ5IHJl
bG9jcy1kdW1teS5TIEkgYXNzdW1lZCBpdCB3YXMgbmVlZGVkIGZvciBzb21lCj4gcmVhc29uLgoK
Li4uIGl0J3MgYWxzbyBub3QgY2xlYXIgd2hhdCBleGFjdGx5IHlvdSBtZWFuIGhlcmUsIGFuZCBo
ZW5jZSB3aGV0aGVyCnRoZXJlJ3MgYW55IHJlYXNvbiBuZWVkZWQgYmV5b25kIHRoZSByZWZlcmVu
Y2UgdG8gdGhlIHR3byBib3VuZGluZwpzeW1ib2xzIGJ5IGVmaV9hcmNoX3JlbG9jYXRlX2ltYWdl
KCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
