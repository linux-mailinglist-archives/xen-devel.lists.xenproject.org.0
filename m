Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60104A4B0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 17:01:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdFZa-00068O-99; Tue, 18 Jun 2019 14:58:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdFZY-00068J-GP
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 14:58:56 +0000
X-Inumbo-ID: 95edc6aa-91d9-11e9-8183-632dea68598e
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95edc6aa-91d9-11e9-8183-632dea68598e;
 Tue, 18 Jun 2019 14:58:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 08:58:51 -0600
Message-Id: <5D08FC28020000780023957B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 08:58:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024F7C0200007800237E7F@prv1-mh.provo.novell.com>
 <29ac168c-f8d0-1069-61c4-4c13857fc042@citrix.com>
In-Reply-To: <29ac168c-f8d0-1069-61c4-4c13857fc042@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC 9/9] AMD/IOMMU: correct IRTE updating
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE1OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDYvMjAxOSAxNDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoaWxlIGZv
ciAzMi1iaXQgSVJURXMgSSB0aGluayB3ZSBjYW4gc2FmZWx5IGNvbnRpbnVlIHRvIGFzc3VtZSB0
aGF0IHRoZQo+PiB3cml0ZXMgd2lsbCB0cmFuc2xhdGUgdG8gYSBzaW5nbGUgTU9WLCB0aGUgdXNl
IG9mIENNUFhDSEcxNkIgaXMgbW9yZQo+PiBoZWF2eSBoYW5kZWQgdGhhbiBuZWNlc3NhcnkgZm9y
IHRoZSAxMjgtYml0IGZvcm0sIGFuZCB0aGUgZmx1c2hpbmcKPj4gZGlkbid0IGdldCBkb25lIGFs
b25nIHRoZSBsaW5lcyBvZiB3aGF0IHRoZSBzcGVjaWZpY2F0aW9uIHNheXMuIE1hcmsKPj4gZW50
cmllcyB0byBiZSB1cGRhdGVkIGFzIG5vdCByZW1hcHBlZCAod2hpY2ggd2lsbCByZXN1bHQgaW4g
aW50ZXJydXB0Cj4+IHJlcXVlc3RzIHRvIGdldCB0YXJnZXQgYWJvcnRlZCwgYnV0IHRoZSBpbnRl
cnJ1cHRzIHNob3VsZCBiZSBtYXNrZWQKPj4gYW55d2F5IGF0IHRoYXQgcG9pbnQgaW4gdGltZSks
IGlzc3VlIHRoZSBmbHVzaCwgYW5kIG9ubHkgdGhlbiB3cml0ZSB0aGUKPj4gbmV3IGVudHJ5LiBJ
biB0aGUgMTI4LWJpdCBJUlRFIGNhc2Ugc2V0IFJlbWFwRW4gc2VwYXJhdGVseSBsYXN0LCB0byB0
aGF0Cj4+IHRoZSBvcmRlcmluZyBvZiB0aGUgd3JpdGVzIG9mIHRoZSB0d28gNjQtYml0IGhhbHZl
cyB3b24ndCBtYXR0ZXIuCj4+Cj4+IEluIHVwZGF0ZV9pbnRyZW1hcF9lbnRyeV9mcm9tX21zaV9t
c2coKSBhbHNvIGZvbGQgdGhlIGR1cGxpY2F0ZSBpbml0aWFsCj4+IGxvY2sgZGV0ZXJtaW5hdGlv
biBhbmQgYWNxdWlyZSBpbnRvIGp1c3QgYSBzaW5nbGUgaW5zdGFuY2UuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBMb29raW5nIGF0IHRo
aXMgcGF0Y2gsIEkgdGhpbmsgcXVpdGUgYSBiaXQgb2YgaXQgc2hvdWxkIGJlIGZvbGRlZCBpbnRv
Cj4gcGF0Y2ggNC4KCk5vdCB0aGF0IG11Y2ggLSB0aGUgY2hhbmdlcyB0byB1cGRhdGVfaW50cmVt
YXBfZW50cnkoKQpjb3VsZCBnbyB0aGVyZSwgYW5kIHRoZW4gb2YgY291cnNlIHRoZSBvbiBjaGFu
Z2UgdG8KaW92X3N1cHBvcnRzX3h0KCkuIEJ1dCB0aGF0J3MgYWJvdXQgaXQgLSB0aGUgcmVzdCBp
c24ndCBzcGVjaWZpYyB0bwpoYW5kbGluZyBvZiAxMjgtYml0IElSVEVzLCBhbmQgaGVuY2Ugd291
bGRuJ3QgYmVsb25nIHRoZXJlLgoKV2hhdCBjb3VsZCBiZSBkaXNjdXNzZWQgaXMgbW92aW5nIHRo
ZSBjaGFuZ2UgaGVyZSB0b3dhcmRzIHRoZQpzdGFydCBvZiB0aGUgc2VyaWVzLCBhaGVhZCBvZiB0
aGUgb25lcyBwbGF5aW5nIHdpdGggaG93IElSVEVzCmdldCB1cGRhdGVkLiBJJ3ZlIHB1dCBpdCBs
YXN0IGZvciBub3cgYmVjYXVzZSAoYSkgSSd2ZSBhZGRlZCBpdApsYXN0LCBhZnRlciB0aGUgQ01Q
WENIRzE2QiBhcHByb2FjaCB3YXMgYWxyZWFkeSB0ZXN0ZWQgYW5kCihiKSBiZWNhdXNlIG9mIGl0
cyBSRkMgc3RhdHVzIChJIGRvbid0IHdhbnQgaXQgdG8gYmxvY2sgdGhlIHJlc3Qgb2YKdGhlIHNl
cmllcykuCgo+ICBIb3dldmVyLCBteSByZXZpZXcgc3VnZ2VzdGlvbnMgb24gdGhhdCBwYXRjaCB0
YWtlIHByZWNlZGVudAo+IG92ZXIgdGhlIG5ldCByZXN1bHQgaGVyZS4KClN1cmUgLSBsZXQncyBz
ZXR0bGUgb24gdGhlIGxlYXN0IGJhZCB2YXJpYW50IG9mIHRoYXQgb25lIGZpcnN0LiBJIGRpZAph
bHJlYWR5IHJlcGx5IHRoZXJlLgoKPj4gLS0tCj4+IFJGQzogUHV0dGluZyB0aGUgZmx1c2ggaW52
b2NhdGlvbnMgaW4gbG9vcHMgaXNuJ3Qgb3Zlcmx5IG5pY2UsIGJ1dCBJCj4+ICAgICAgZG9uJ3Qg
dGhpbmsgdGhpcyBjYW4gcmVhbGx5IGJlIGFidXNlZCwgc2luY2UgY2FsbGVycyB1cCB0aGUgc3Rh
Y2sKPj4gICAgICBob2xkIGZ1cnRoZXIgbG9ja3MuIE5ldmVydGhlbGVzcyBJJ2QgbGlrZSB0byBh
c2sgZm9yIGJldHRlcgo+PiAgICAgIHN1Z2dlc3Rpb25zLgo+IAo+IExldHMgZm9jdXMgb24gZ2V0
dGluZyBpdCBmdW5jdGlvbmluZyBmaXJzdCwgYW5kIGZhc3Qgc2Vjb25kLgoKTXkgcmVtYXJrIHdh
c24ndCBhYm91dCB0aGlzIGJlaW5nIHNsb3csIGJ1dCB0aGUgdGhlb3JldGljYWwgcmlzayBvZgp0
aGlzIGFsbG93aW5nIGZvciBhIERvUyBhdHRhY2suCgo+ICBIb3dldmVyLCBJCj4gdGhpbmsgd2Ug
Y2FuIGRvIGJldHRlciB0aGFuIHRoZSBsb29wLiAgTGV0IG1lIGRpZyBzb21lIG5vdGVzIG91dC4K
ClRoYW5rcyBtdWNoLApKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
