Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB6420A07
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 16:44:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRHZZ-00072V-G3; Thu, 16 May 2019 14:41:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRHZX-00072Q-5i
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:41:27 +0000
X-Inumbo-ID: ae522e22-77e8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae522e22-77e8-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 14:41:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 08:41:24 -0600
Message-Id: <5CDD7693020000780022FC59@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 08:41:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-43-jgross@suse.com>
 <5CDD6005020000780022FA9A@suse.com>
 <074965f8-b20f-9dc3-2729-7f3c4793b38d@suse.com>
In-Reply-To: <074965f8-b20f-9dc3-2729-7f3c4793b38d@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 42/45] xen/sched: add fall back to
 idle vcpu when scheduling item
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjUxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
Ni8wNS8yMDE5IDE1OjA1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDUuMTkgYXQg
MDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2Rv
bWFpbi5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+IEBAIC0xNTQsNiArMTU0
LDI0IEBAIHN0YXRpYyB2b2lkIGlkbGVfbG9vcCh2b2lkKQo+Pj4gICAgICB9Cj4+PiAgfQo+Pj4g
IAo+Pj4gKy8qCj4+PiArICogSWRsZSBsb29wIGZvciBzaWJsaW5ncyBvZiBhY3RpdmUgc2NoZWR1
bGUgaXRlbXMuCj4+PiArICogV2UgZG9uJ3QgZG8gYW55IHN0YW5kYXJkIGlkbGUgd29yayBsaWtl
IHRhc2tsZXRzLCBwYWdlIHNjcnViYmluZyBvcgo+Pj4gKyAqIGxpdmVwYXRjaGluZy4KPj4+ICsg
KiBVc2UgZGVmYXVsdF9pZGxlKCkgaW4gb3JkZXIgdG8gc2ltdWxhdGUgdi0+aXNfdXJnZW50Lgo+
PiAKPj4gSSBndWVzcyBJJ20gbWlzc2luZyBhIHBhcnQgb2YgdGhlIGRlc2NyaXB0aW9uIHdoaWNo
IGV4cGxhaW5zIGFsbCB0aGlzOgo+PiBXaGF0J3Mgd3Jvbmcgd2l0aCBkb2luZyBzY3J1YmJpbmcg
d29yaywgZm9yIGV4YW1wbGU/IFdoeSBpcwo+PiBkb2luZyB0YXNrbGV0IHdvcmsgbm90IG9rYXks
IGJ1dCBzb2Z0aXJxcyBhcmU/IFdoYXQgaXMgdGhlIGRlYWwgd2l0aAo+PiB2LT5pc191cmdlbnQs
IGkuZS4gd2hhdCBqdXN0aWZpZXMgbm90IGVudGVyaW5nIGEgZGVjZW50IHBvd2VyCj4+IHNhdmlu
ZyBtb2RlIGhlcmUgb24gSW50ZWwsIGJ1dCBkb2luZyBzbyBvbiBBTUQ/Cj4gCj4gT25lIG9mIHRo
ZSByZWFzb25zIGZvciB1c2luZyBjb3JlIHNjaGVkdWxpbmcgaXMgdG8gYXZvaWQgcnVubmluZyB2
Y3B1cwo+IG9mIGRpZmZlcmVudCBkb21haW5zIG9uIHRoZSBzYW1lIGNvcmUgaW4gb3JkZXIgdG8g
bWluaW1pemUgdGhlIGNoYW5jZXMKPiBmb3Igc2lkZSBjaGFubmVsIGF0dGFja3MgdG8gZGF0YSBv
ZiBvdGhlciBkb21haW5zLiBOb3QgYWxsb3dpbmcKPiBzY3J1YmJpbmcgb3IgdGFza2xldHMgaGVy
ZSBpcyBkdWUgdG8gYXZvaWQgYWNjZXNzaW5nIGRhdGEgb2Ygb3RoZXIKPiBkb21haW5zLgoKU28g
aG93IGlzIHJ1bm5pbmcgc29mdGlycXMgb2theSB0aGVuPyBBbmQgaG93IGlzIHNjcnViYmluZyBh
Y2Nlc3NpbmcKb3RoZXIgZG9tYWlucycgZGF0YT8KCj4gQXMgd2l0aCBjb3JlIHNjaGVkdWxpbmcg
d2UgY2FuIGJlIHN1cmUgdGhlIG90aGVyIHRocmVhZCBpcyBhY3RpdmUKPiAob3RoZXJ3aXNlIHdl
IHdvdWxkIHNjaGVkdWxlIHRoZSBpZGxlIGl0ZW0pIGFuZCBob3BpbmcgZm9yIHNhdmluZyBwb3dl
cgo+IGJ5IHVzaW5nIG13YWl0IGlzIG1vb3QuCgpTYXZpbmcgcG93ZXIgbWF5IGJlIGluZGlyZWN0
LCBieSB0aGUgQ1BVIHJlLWFycmFuZ2luZwpyZXNvdXJjZSBhc3NpZ25tZW50IGJldHdlZW4gdGhy
ZWFkcyB3aGVuIG9uZSBnb2VzIGlkbGUuCkkgaGF2ZSBubyBpZGVhIHdoZXRoZXIgdGhleSBkbyB0
aGlzIHdoZW4gZW50ZXJpbmcgQzEsIG9yCm9ubHkgd2hlbiBlbnRlcmluZyBkZWVwZXIgQyBzdGF0
ZXMuCgpBbmQgYW55d2F5IC0gSSdtIHN0aWxsIG5vbmUgdGhlIHdpc2VyIGFzIHRvIHRoZSB2LT5p
c191cmdlbnQKcmVsYXRpb25zaGlwLgoKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21w
LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKPj4+IEBAIC03Niw2ICs3Niw5
IEBAIHZvaWQgc2V0X25yX3NvY2tldHModm9pZCk7Cj4+PiAgLyogUmVwcmVzZW50aW5nIEhUIGFu
ZCBjb3JlIHNpYmxpbmdzIGluIGVhY2ggc29ja2V0LiAqLwo+Pj4gIGV4dGVybiBjcHVtYXNrX3Qg
Kipzb2NrZXRfY3B1bWFzazsKPj4+ICAKPj4+ICsjZGVmaW5lIGdldF9jcHVfY3VycmVudChjcHUp
IFwKPj4+ICsgICAgKGdldF9jcHVfaW5mb19mcm9tX3N0YWNrKCh1bnNpZ25lZCBsb25nKXN0YWNr
X2Jhc2VbY3B1XSktPmN1cnJlbnRfdmNwdSkKPj4gCj4+IFlldCBhbm90aGVyLCBzbGlnaHRseSBk
aWZmZXJlbnQgbm90aW9uIG9mICJjdXJyZW50Ii4gSWYgImN1cnJlbnQiCj4+IGl0c2VsZiBpcyBu
b3Qgc3VpdGFibGUgKEkgY2FuJ3QgaW1tZWRpYXRlbHkgc2VlIHdoeSB0aGF0IHdvdWxkIGJlLAo+
PiBidXQgSSBhbHNvIGRpZG4ndCBsb29rIGF0IGFsbCB0aGUgc2NoZWR1bGVyIHNwZWNpZmljIGNo
YW5nZXMgZWFybGllcgo+PiBpbiB0aGlzIHNlcmllcyksIHdoeSBpc24ndCBwZXJfY3B1KGN1cnJf
dmNwdSwgY3B1KSBlaXRoZXI/Cj4gCj4gY3VycmVudCBpcyBhbHdheXMgdGhlIHZjcHUgcnVubmlu
ZyBvbiB0aGUgY3VycmVudCBwaHlzaWNhbCBjcHUuCj4gY3Vycl92Y3B1IGlzIHRoZSB2Y3B1IHdo
aWNoIHdhcyB0aGUgb25lIHJ1bm5pbmcgaW4gZ3Vlc3QgbW9kZSBsYXN0Cj4gKHRoaXMgYXZvaWRz
IHRoZSBuZWVkIHRvIHNhdmUvcmVzdG9yZSBjb250ZXh0IGluIGNhc2UgYSB2Y3B1IGlzCj4gYmxv
Y2tlZCBmb3IgYSBzaG9ydCB0aW1lIHdpdGhvdXQgYW5vdGhlciBndWVzdCB2Y3B1IHJ1bm5pbmcg
b24gdGhlCj4gcGh5c2ljYWwgY3B1IGluIGJldHdlZW4pLCBzbyB3aXRoIGN1cnJlbnQgYmVpbmcg
aWRsZSB0aGUgdHdvIGNhbgo+IGRpZmZlci4KPiAKPiBIZXJlIEkgbmVlZCAiY3VycmVudCIgZnJv
bSBhbm90aGVyIHBoeXNpY2FsIGNwdSB3aGljaCBpcyBub3QgZWFzaWx5Cj4gYXZhaWxhYmxlLgoK
T2gsIHJpZ2h0IC0gSSBzaG91bGQgaGF2ZSBiZWVuIGFibGUgdG8gc3BvdCB0aGlzLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
