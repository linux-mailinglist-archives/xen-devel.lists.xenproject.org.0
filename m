Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA035851
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 10:06:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYQsm-0006t9-VF; Wed, 05 Jun 2019 08:02:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYQsk-0006t4-VU
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 08:02:50 +0000
X-Inumbo-ID: 4d626d4e-8768-11e9-8443-43a5dd3b333e
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d626d4e-8768-11e9-8443-43a5dd3b333e;
 Wed, 05 Jun 2019 08:02:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 02:02:45 -0600
Message-Id: <5CF7772302000078002355F1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 02:02:43 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
 <5CF66BCE0200007800235184@prv1-mh.provo.novell.com>
 <20190604162052.oypj4kpllvueusd3@Air-de-Roger>
 <5CF7757E02000078002355E1@prv1-mh.provo.novell.com>
In-Reply-To: <5CF7757E02000078002355E1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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

Pj4+IE9uIDA1LjA2LjE5IGF0IDA5OjU1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDA0LjA2LjE5IGF0IDE4OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBP
biBUdWUsIEp1biAwNCwgMjAxOSBhdCAwNzowMjowNkFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+ID4+PiBPbiAwNC4wNi4xOSBhdCAxMDo0OCwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3
cm90ZToKPj4+ID4gT24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDc6MDA6MjVBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+PiA+PiBUaGlzIHJldmVydHMgY29tbWl0IGI2YmQwMmI3YTg3N2Y5
ZmFjMmRlNjllNjRkODI0NWQ1NmY5MmFiMjUuIFRoZSBjaGFuZ2UKPj4+ID4+IHdhcyByZWR1bmRh
bnQgd2l0aCBhbWRfaW9tbXVfZGV0ZWN0X29uZV9hY3BpKCkgYWxyZWFkeSBjYWxsaW5nCj4+PiA+
PiBwY2lfcm9fZGV2aWNlKCkuCj4+PiA+PiAKPj4+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+ID4gCj4+PiA+IEkgdGhpbmsgdGhpcyBuZWVkcyB0
byBiZSBzcXVhc2hlZCB0b2dldGhlciB3aXRoIHlvdXIgYEFNRC9JT01NVTogZG9uJ3QKPj4+ID4g
ImFkZCIgSU9NTVVzYCBwYXRjaCwgb3IgZWxzZSBQVkggZG9tMCB3aWxsIGJyZWFrIGJlY2F1c2UK
Pj4+ID4gdXBkYXRlX3BhZ2luZ19tb2RlIHdpbGwgZmluZCBkZXZpY2VzIG5vdCBiZWhpbmQgYW4g
SU9NTVUgYXNzaWduZWQgdG8KPj4+ID4gZG9tMCwgdGh1cyByZXR1cm5pbmcgYW4gZXJyb3IgYW5k
IGNyYXNoaW5nIGRvbTAuCj4+PiAKPj4+IEkndmUgdGFrZW4gYW5vdGhlciBsb29rICh3aGlsZSBj
b3JyZWN0aW5nIHRoZSBvdGhlciBwYXRjaCwgbm93IHNlbnQKPj4+IGFzIHYyKTogdXBkYXRlX3Bh
Z2luZ19tb2RlKCkgaXRlcmF0ZXMgb3ZlciBhbGwgZGV2aWNlcyB0aGUgZG9tYWluCj4+PiBvd25z
LiBUaGUgSU9NTVUgb25lcywgaGF2aW5nIGJlZW4gc3ViamVjdCBvZiBhbiBlYXJseQo+Pj4gcGNp
X3JvX2RldmljZSgpLCBzaG91bGQgbmV2ZXIgZW5kIHVwIG9uIERvbTAncyBsaXN0LiBBbmQgbG9v
a2luZyBhdAo+Pj4gdGhlIGNvZGUgSSBhbHNvIGNhbid0IC0gZm9yIG5vdyBhdCBsZWFzdCAtIHNl
ZSBob3cgdGhleSBjb3VsZCBnZXQKPj4+IG1vdmVkIHRoZXJlLiBJbiBmYWN0IEkndmUgdmVyaWZp
ZWQgdGhhdCB0aGV5IHRha2UgdGhlICJvdmVycmlkZSIKPj4+IHBhdGggaW4gX3NldHVwX2h3ZG9t
X3BjaV9kZXZpY2VzKCkuCj4+IAo+PiBBcyB5b3UgcmVhbGl6ZWQgdGhpcyBjb21taXQgd2FzIGlu
ZGVlZCBwYXBlcmluZyBvdmVyIGFuIGV4aXN0aW5nIGlzc3VlCj4+IGVsc2V3aGVyZS4gV2hlbiBJ
IGRpZCB0aGlzIHBhdGNoIEkgZGlkbid0IHJlYWxpemUKPj4gYW1kX2lvbW11X2RldGVjdF9vbmVf
YWNwaSB3YXMgY2FsbGluZyBwY2lfcm9fZGV2aWNlLgo+PiAKPj4gVGhlIGlzc3VlIGlzIHRoYXQg
d2hlbiBwY2lfcm9fZGV2aWNlIGdldHMgY2FsbGVkIGJ5Cj4+IGFtZF9pb21tdV9kZXRlY3Rfb25l
X2FjcGkgZG9tX3hlbiBoYXMgbm90IGJlZW4gY3JlYXRlZCB5ZXQsIHNvCj4+IHBkZXYtPmRvbWFp
biBlbmRzIHVwIGJlaW5nIE5VTEwuCj4gCj4gV2VsbCwgdGhhdCdzIGJlaW5nIGZpeGVkIGJ5ICJh
ZGp1c3Qgc3lzdGVtIGRvbWFpbiBjcmVhdGlvbiAoYW5kIGNhbGwgaXQKPiBlYXJsaWVyIG9uIHg4
NikiIChub3RlIHRoYXQgaXQncyAic3BlY2lhbCIgcmF0aGVyIHRoYW4gInN5c3RlbSIgaW4gdGhl
Cj4gcG9zdGVkIHZlcnNpb24pLiBwZGV2LT5kb21haW4gcmVtYWluaW5nIHRvIGJlIE5VTEwgcmVh
bGx5IGlzIHRoZQo+IHNtYWxsZXIgb2YgdGhlIHByb2JsZW1zOyBhY2Nlc3NpbmcgZG9tX3hlbi0+
YXJjaC5wZGV2X2xpc3QgaXMgdGhlCj4gd29yc2UgcGFydCBoZXJlLgo+IAo+IE9uZSB0aGluZyBp
cyBjdXJpb3VzIHRob3VnaDogU28gZmFyIEkgdGhvdWdodCBJIHdvdWxkIGhhdmUgc2NyZXdlZAo+
IHVwIHRoaW5ncyBieSBoYXZpbmcgYW1kX2lvbW11X2RldGVjdF9vbmVfYWNwaSgpIGNhbGxlZCBl
YXJsaWVyLAo+IGFzIG1lbnRpb25lZCBpbiB0aGF0IHBhdGNoJ3MgZGVzY3JpcHRpb24uIFlvdXIg
Y2hhbmdlIHRoYXQgSSdkIGxpa2UKPiB0byByZXZlcnQgcHJlZGF0ZXMgdGhhdCB0aG91Z2ggYnkg
c2V2ZXJhbCBtb250aHMsIHNvIEknbSBnZXR0aW5nCj4gdGhlIGltcHJlc3Npb24gdGhlIGlzc3Vl
IGhhcyBiZWVuIG9sZGVyLiBBcyBhIHJlc3VsdCB0aGUgcmFuZ2Ugb2YKPiB2ZXJzaW9ucyB0byBi
YWNrcG9ydCB0aGlzIHRvIG1heSBoYXZlIHRvIGdyb3cuCgpBbmQgbm8sIEkgY2Fubm90IGNvbmZp
cm0gdGhpcyBhcyB0aGUgb3JpZ2luYWwgKDQuMTIpIGJlaGF2aW9yOiBUaGVyZQpJIHNlZSBpb21t
dV9zZXR1cCgpIGdldHRpbmcgY2FsbGVkIGEgZmV3IGxpbmVzIGFmdGVyCmFyY2hfaW5pdF9tZW1v
cnkoKS4gVGhlcmVmb3JlIEknbSBzdGlsbCB1bmNsZWFyIHdoYXQgZXhhY3QgcHJvYmxlbQp0aGUg
cGNpX2hpZGVfZGV2aWNlKCkgYWRkaXRpb24gd2FzIHJlYWxseSBtZWFudCB0byBmaXguCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
