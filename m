Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FD3594B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 11:10:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYRt8-0004Tx-Cf; Wed, 05 Jun 2019 09:07:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpCR=UE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYRt6-0004Tr-VY
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 09:07:17 +0000
X-Inumbo-ID: 4f6f689f-8771-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4f6f689f-8771-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 09:07:14 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wggThmigtSzTDL9ND8i/r/MjXimoAOKGy/KQHmtLvty+5BQCiK73V1SD85pK1UwWQ3sCGaaMdg
 cc5NUqV7364ImFDq3w3RzQpdRon2z9qRlpBjB2kbaKWLC2mREH7x5E0tgZj/rVZUBH3/UelbHn
 Gkljo3qrX2NIrHxs0L6dsislnCHAuWhjXdO9t0H+EaWutYyjQoq+ZyJaw8o3CL5BRtCShbbK1I
 DBj3XjYLza0L07MZX7aEjJDy28McefhdcZqO4Anlw+pdO9aBa9XCbSmplldZzTrn1iOeMkFflr
 o5M=
X-SBRS: 2.7
X-MesageID: 1312179
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1312179"
Date: Wed, 5 Jun 2019 11:06:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190605090653.kvz554xhrle5e6b7@Air-de-Roger>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
 <5CF66BCE0200007800235184@prv1-mh.provo.novell.com>
 <20190604162052.oypj4kpllvueusd3@Air-de-Roger>
 <5CF7757E02000078002355E1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF7757E02000078002355E1@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDE6NTU6NDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjA2LjE5IGF0IDE4OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDc6MDI6MDZBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA0LjA2LjE5IGF0IDEwOjQ4LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gT24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDc6MDA6MjVB
TSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gVGhpcyByZXZlcnRzIGNvbW1pdCBi
NmJkMDJiN2E4NzdmOWZhYzJkZTY5ZTY0ZDgyNDVkNTZmOTJhYjI1LiBUaGUgY2hhbmdlCj4gPj4g
Pj4gd2FzIHJlZHVuZGFudCB3aXRoIGFtZF9pb21tdV9kZXRlY3Rfb25lX2FjcGkoKSBhbHJlYWR5
IGNhbGxpbmcKPiA+PiA+PiBwY2lfcm9fZGV2aWNlKCkuCj4gPj4gPj4gCj4gPj4gPj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+ID4gCj4gPj4gPiBJ
IHRoaW5rIHRoaXMgbmVlZHMgdG8gYmUgc3F1YXNoZWQgdG9nZXRoZXIgd2l0aCB5b3VyIGBBTUQv
SU9NTVU6IGRvbid0Cj4gPj4gPiAiYWRkIiBJT01NVXNgIHBhdGNoLCBvciBlbHNlIFBWSCBkb20w
IHdpbGwgYnJlYWsgYmVjYXVzZQo+ID4+ID4gdXBkYXRlX3BhZ2luZ19tb2RlIHdpbGwgZmluZCBk
ZXZpY2VzIG5vdCBiZWhpbmQgYW4gSU9NTVUgYXNzaWduZWQgdG8KPiA+PiA+IGRvbTAsIHRodXMg
cmV0dXJuaW5nIGFuIGVycm9yIGFuZCBjcmFzaGluZyBkb20wLgo+ID4+IAo+ID4+IEkndmUgdGFr
ZW4gYW5vdGhlciBsb29rICh3aGlsZSBjb3JyZWN0aW5nIHRoZSBvdGhlciBwYXRjaCwgbm93IHNl
bnQKPiA+PiBhcyB2Mik6IHVwZGF0ZV9wYWdpbmdfbW9kZSgpIGl0ZXJhdGVzIG92ZXIgYWxsIGRl
dmljZXMgdGhlIGRvbWFpbgo+ID4+IG93bnMuIFRoZSBJT01NVSBvbmVzLCBoYXZpbmcgYmVlbiBz
dWJqZWN0IG9mIGFuIGVhcmx5Cj4gPj4gcGNpX3JvX2RldmljZSgpLCBzaG91bGQgbmV2ZXIgZW5k
IHVwIG9uIERvbTAncyBsaXN0LiBBbmQgbG9va2luZyBhdAo+ID4+IHRoZSBjb2RlIEkgYWxzbyBj
YW4ndCAtIGZvciBub3cgYXQgbGVhc3QgLSBzZWUgaG93IHRoZXkgY291bGQgZ2V0Cj4gPj4gbW92
ZWQgdGhlcmUuIEluIGZhY3QgSSd2ZSB2ZXJpZmllZCB0aGF0IHRoZXkgdGFrZSB0aGUgIm92ZXJy
aWRlIgo+ID4+IHBhdGggaW4gX3NldHVwX2h3ZG9tX3BjaV9kZXZpY2VzKCkuCj4gPiAKPiA+IEFz
IHlvdSByZWFsaXplZCB0aGlzIGNvbW1pdCB3YXMgaW5kZWVkIHBhcGVyaW5nIG92ZXIgYW4gZXhp
c3RpbmcgaXNzdWUKPiA+IGVsc2V3aGVyZS4gV2hlbiBJIGRpZCB0aGlzIHBhdGNoIEkgZGlkbid0
IHJlYWxpemUKPiA+IGFtZF9pb21tdV9kZXRlY3Rfb25lX2FjcGkgd2FzIGNhbGxpbmcgcGNpX3Jv
X2RldmljZS4KPiA+IAo+ID4gVGhlIGlzc3VlIGlzIHRoYXQgd2hlbiBwY2lfcm9fZGV2aWNlIGdl
dHMgY2FsbGVkIGJ5Cj4gPiBhbWRfaW9tbXVfZGV0ZWN0X29uZV9hY3BpIGRvbV94ZW4gaGFzIG5v
dCBiZWVuIGNyZWF0ZWQgeWV0LCBzbwo+ID4gcGRldi0+ZG9tYWluIGVuZHMgdXAgYmVpbmcgTlVM
TC4KPiAKPiBXZWxsLCB0aGF0J3MgYmVpbmcgZml4ZWQgYnkgImFkanVzdCBzeXN0ZW0gZG9tYWlu
IGNyZWF0aW9uIChhbmQgY2FsbCBpdAo+IGVhcmxpZXIgb24geDg2KSIgKG5vdGUgdGhhdCBpdCdz
ICJzcGVjaWFsIiByYXRoZXIgdGhhbiAic3lzdGVtIiBpbiB0aGUKPiBwb3N0ZWQgdmVyc2lvbiku
IHBkZXYtPmRvbWFpbiByZW1haW5pbmcgdG8gYmUgTlVMTCByZWFsbHkgaXMgdGhlCj4gc21hbGxl
ciBvZiB0aGUgcHJvYmxlbXM7IGFjY2Vzc2luZyBkb21feGVuLT5hcmNoLnBkZXZfbGlzdCBpcyB0
aGUKPiB3b3JzZSBwYXJ0IGhlcmUuCgpPaCwgZGlkbid0IHNlZSB0aGF0IHNlcmllcywgdGhhbmtz
IGZvciB0aGUgZml4ZXMsIHdpbGwgdHJ5IHRvIHJldmlldwp0aGVtIGxhdGVyIHRvZGF5LgoKPiBP
bmUgdGhpbmcgaXMgY3VyaW91cyB0aG91Z2g6IFNvIGZhciBJIHRob3VnaHQgSSB3b3VsZCBoYXZl
IHNjcmV3ZWQKPiB1cCB0aGluZ3MgYnkgaGF2aW5nIGFtZF9pb21tdV9kZXRlY3Rfb25lX2FjcGko
KSBjYWxsZWQgZWFybGllciwKPiBhcyBtZW50aW9uZWQgaW4gdGhhdCBwYXRjaCdzIGRlc2NyaXB0
aW9uLiBZb3VyIGNoYW5nZSB0aGF0IEknZCBsaWtlCj4gdG8gcmV2ZXJ0IHByZWRhdGVzIHRoYXQg
dGhvdWdoIGJ5IHNldmVyYWwgbW9udGhzLCBzbyBJJ20gZ2V0dGluZwo+IHRoZSBpbXByZXNzaW9u
IHRoZSBpc3N1ZSBoYXMgYmVlbiBvbGRlci4gQXMgYSByZXN1bHQgdGhlIHJhbmdlIG9mCj4gdmVy
c2lvbnMgdG8gYmFja3BvcnQgdGhpcyB0byBtYXkgaGF2ZSB0byBncm93LgoKWWVzLCBJJ20gc3Rp
bGwgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgZXhhY3RseSB3aGF0IGNhdXNlZCB0aGUgaXNzdWUgdGhh
dApiNmJkMDJiN2E4NzcgZml4ZWQuCgo+ID4gT24gYSB0YW5nZW50aWFsIG5vdGUsIHRoZXJlJ3Mg
YWxzbyBhIGRlcmVmZXJlbmNlIG9mIGRvbV94ZW4gaW4KPiA+IF9wY2lfaGlkZV9kZXZpY2Ugd2hp
Y2ggZG9lc24ndCB0cmlnZ2VyIGEgcGFnZSBmYXVsdC4gRG8gd2UgaGF2ZQo+ID4gc29tZXRoaW5n
IG1hcHBlZCBhdCBsaW5lYXIgYWRkcmVzcyAwIG9uIHB1cnBvc2U/Cj4gCj4gWWVzLCBkdXJpbmcg
ZWFybHkgKGxlZ2FjeSkgYm9vdC4KCkZXSVcsIEknbSBib290aW5nIGZyb20gVUVGSSB1c2luZyBt
dWx0aWJvb3QyIGFuZCBJIGRpZG4ndCBnZXQgYSBwYWdlCmZhdWx0IGluIF9wY2lfaGlkZV9kZXZp
Y2UuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
