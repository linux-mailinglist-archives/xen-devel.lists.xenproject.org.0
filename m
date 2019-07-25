Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351B749A0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 11:13:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqZjy-0002pV-K3; Thu, 25 Jul 2019 09:08:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqZjx-0002pQ-S3
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 09:08:45 +0000
X-Inumbo-ID: cd2e30a4-aebb-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd2e30a4-aebb-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 09:08:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i6YADqt/X5Z7NpyR1p8yyv0X/fN3HmCV8sGRf3ScfS944ZcMYpOFnlYwrzfOhW2+eBx7/ilfM7
 DSp2c0lpbvUEL42b76X2qnwkPFP/rJTNHGVrtnwYCjbVLevtua5uFmFw8vuh51rbnJb5UmyAKa
 EaKijstuW02fde+YOLmq7r9QS6tekW8sZeH/nxnQuJg+6Zan0TaE4qYKjUE2pS8BZuP4hFJYBo
 ZdmhrxZ8uzXf5iXcs8mWlbHPRb2spQKRxZBywt0Sg+jP6IrekYVpXgHibvxN4jfXrziXHfcOny
 ZpQ=
X-SBRS: 2.7
X-MesageID: 3410189
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3410189"
Date: Thu, 25 Jul 2019 11:08:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190725090829.yiq2wpszksp5n2ab@Air-de-Roger>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-25-anthony.perard@citrix.com>
 <20190715141521.aqmpchgzyleoergc@MacBook-Air-de-Roger.local>
 <20190722145319.GG1208@perard.uk.xensource.com>
 <20190723094207.ccnzyzuma4ydpugi@Air-de-Roger>
 <20190724161759.GB1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724161759.GB1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 24/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDU6MTc6NTlQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTE6NDI6MDdBTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDAzOjUzOjE5UE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBh
dCAwNDoxNToyMVBNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+IE9uIFRo
dSwgSnVsIDA0LCAyMDE5IGF0IDAzOjQyOjIyUE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3Rl
Ogo+ID4gPiA+ID4gKyAgICAgIC8vIGVycm9yIG1lc3NhZ2U6IENwdUR4ZTogSW50ZXJzZWN0TWVt
b3J5RGVzY3JpcHRvcjoKPiA+ID4gPiA+ICsgICAgICAvLyAgICAgICAgZGVzYyBbRkMwMDAwMDAs
IDEwMDAwMDAwMCkgdHlwZSAxIGNhcCA4NzAwMDAwMDAwMDI2MDAxCj4gPiA+ID4gPiArICAgICAg
Ly8gICAgICAgIGNvbmZsaWN0cyB3aXRoIGFwZXJ0dXJlIFtGRUUwMDAwMCwgRkVFMDEwMDApIGNh
cCAxCj4gPiA+ID4gPiAgICAgICAgLy8KPiA+ID4gPiA+IC0gICAgICBpZiAoRW50cnktPlR5cGUg
IT0gRWZpQWNwaUFkZHJlc3NSYW5nZU1lbW9yeSkgewo+ID4gPiA+ID4gLSAgICAgICAgY29udGlu
dWU7Cj4gPiA+ID4gPiArICAgICAgaWYgKCFYZW5Idm1sb2FkZXJEZXRlY3RlZCAoKSkgewo+ID4g
PiA+ID4gKyAgICAgICAgQWRkUmVzZXJ2ZWRNZW1vcnlCYXNlU2l6ZUhvYiAoQmFzZSwgRW5kIC0g
QmFzZSwgRkFMU0UpOwo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgc3BlY2lhbCBjYXNpbmcgZm9yIFBW
SCBsb29rcyB3ZWlyZCwgaWRlYWxseSB3ZSB3b3VsZCBsaWtlIHRvIHVzZQo+ID4gPiA+IHRoZSBz
YW1lIGNvZGUgcGF0aCwgb3IgZWxzZSBpdCBzaG91bGQgYmUgZXhwbGljaXRseSBtZW50aW9uZWQg
d2h5IFBWSAo+ID4gPiA+IGhhcyBkaXZlcmdpbmcgYmVoYXZpb3VyLgo+ID4gPiAKPiA+ID4gSSB0
aGluayBodm1sb2FkZXIgaXMgdGhlIGlzc3VlIHJhdGhlciB0aGFuIFBWSC4gSGVyZSBpcyBwYXJ0
IG9mIHRoZQo+ID4gPiAibWVtb3J5IG1hcCIgYXMgZm91bmQgaW4gaHZtbG9hZGVyL2NvbmZpZy5o
Ogo+ID4gPiAKPiA+ID4gICAvKiBTcGVjaWFsIEJJT1MgbWFwcGluZ3MsIGV0Yy4gYXJlIGFsbG9j
YXRlZCBmcm9tIGhlcmUgdXB3YXJkcy4uLiAqLwo+ID4gPiAgICNkZWZpbmUgUkVTRVJWRURfTUVN
QkFTRSAgICAgICAgICAgICAgMHhGQzAwMDAwMAo+ID4gPiAgIC8qIE5CLiBBQ1BJX0lORk9fUEhZ
U0lDQUxfQUREUkVTUyAqTVVTVCogbWF0Y2ggZGVmaW5pdGlvbiBpbiBhY3BpL2RzZHQuYXNsISAq
Lwo+ID4gPiAgICNkZWZpbmUgQUNQSV9JTkZPX1BIWVNJQ0FMX0FERFJFU1MgICAgMHhGQzAwMDAw
MAo+ID4gPiAgICNkZWZpbmUgUkVTRVJWRURfTUVNT1JZX0RZTkFNSUNfU1RBUlQgMHhGQzAwMTAw
MAo+ID4gPiAgICNkZWZpbmUgUkVTRVJWRURfTUVNT1JZX0RZTkFNSUNfRU5EICAgMHhGRTAwMDAw
MAo+ID4gPiAKPiA+ID4gYW5kIGh2bWxvYWRlciBzaW1wbHkgY3JlYXRlcyBhIHNpbmdsZSBlODIw
IHJlc2VydmVkIGVudHJ5LCBmcm9tCj4gPiA+IFJFU0VSVkVEX01FTUJBU0UgdG8gdGhlIHRvcCBv
ZiA0R0IuIEl0J3MgcHJvYmFibHkgdG9vIG11Y2guCj4gPiAKPiA+IEJ1dCBpc24ndCB0aGlzIGtp
bmQgb2YgZGFuZ2Vyb3VzPyBIb3cgY2FuIHlvdSBhc3N1cmUgZnV0dXJlIHZlcnNpb25zCj4gPiBv
ZiBodm1sb2FkZXIgd29uJ3QgdXNlIHRoaXMgc3BhY2U/Cj4gPiAKPiA+ID4gSWYgaHZtbG9hZGVy
IG9ubHkgcmVzZXJ2ZWQKPiA+ID4gQUNQSV9JTkZPX1BIWVNJQ0FMX0FERFJFU1MtUkVTRVJWRURf
TUVNT1JZX0RZTkFNSUNfRU5ELCBJIG1pZ2h0IG5vdCBoYXZlCj4gPiA+IHRvIHNwZWNpYWwgY2Fz
ZSBodm1sb2FkZXIuCj4gPiAKPiA+IENvdWxkIHdlIGxvb2sgaW50byBnZXR0aW5nIHRoaXMgZml4
ZWQgaW4gaHZtbG9hZGVyIHRoZW4/Cj4gPiAKPiA+IEkgdGhpbmsgaXQncyBkYW5nZXJvdXMgZm9y
IE9WTUYgdG8gcGxheSBzdWNoIHRyaWNrcyB3aXRoIHRoZSBtZW1vcnkKPiA+IG1hcC4KPiA+IAo+
ID4gPiBBcyBmYXIgYXMgSSBrbm93IDB4ZmVlMDAwMDAgaXNuJ3QgYSBzcGVjaWFsCj4gPiA+IGJp
b3MgbWFwcGluZywgYnV0IHNvbWV0aGluZyB0aGUgaGFyZHdhcmUgcHJvdmlkZXMuCj4gPiAKPiA+
IFllcywgdGhhdCdzIHVzZWQgYnkgdGhlIGxhcGljLCBzbyBpdCdzIG5vdCBzcGVjaWZpYyB0byBo
dm1sb2FkZXIuCj4gCj4gUmlnaHQsIEkndmUgZ290IGEgY2xvc2VyIGxvb2sgYXQgdGhhdCBDcHVE
eGUgbW9kdWxlLCBpdCB3YW50cyB0aGUgbG9jYWwKPiBBUElDIG1lbW9yeSBtYXBwZWQgc3BhY2Ug
dG8gYmUgIm1hcHBlZCBJTyIsIGFuZCB0aGF0IGRpZmZlcmVudCB0aGFuCj4gInJlc2VydmVkIi4K
PiAKPiBTbyB3aGlsZSBwYXJzaW5nIHRoZSBlODIwIGZyb20gaHZtbG9hZGVyLCBpbnN0ZWFkIG9m
IGlnbm9yaW5nIGFsbAo+IHJlc2VydmVkIHJlZ2lvbiwgSSdtIGdvaW5nIHRvIGF2b2lkIGFkZGlu
ZyB0aGUgbG9jYWwgYXBpYyBtZW1vcnkgbWFwcGVkCj4gc3BhY2UuCj4gCj4gc29tZXRoaW5nIGxp
a2U6Cj4gICBpZiAoaHZtbG9hZGVyRGV0ZWN0ZWQoKSkKCkkgZG9uJ3QgdGhpbmsgeW91IG5lZWQg
dG8gZ2F0ZSB0aGlzIG9uIGh2bWxvYWRlciBiZWluZyB1c2VkLCB3aGlsZQppdCdzIHRydWUgdGhh
dCBQVkggbWVtb3J5IG1hcCBkb2Vzbid0IGNvbnRhaW4gc3VjaCByZXNlcnZlZCBtZW1vcnkKcmVn
aW9uIEFUTSBJIGRvbid0IHNlZSBhbnkgaGFybSBpbiBkb2luZyB0aGlzIGZvciBQVkggYWxzby4K
Cj4gICAgIEJhc2UgPSAkKHN0YXJ0IG9mIHRoZSBlODIwIGVudHJ5KTsKPiAgICAgRW5kID0gJChz
dGFydCBvZiB0aGUgZTgyMCBlbnRyeSArIHNpemUpOwo+ICAgICBMb2NhbEFwaWMgPSAweGZlZTAw
MDAwOwo+ICAgICBpZiAoQmFzZSA8IExvY2FsQXBpYyAmJiBMb2NhbEFwaWMgPCBFbmQpIHsKPiAg
ICAgICBBZGRSZXNlcnZlZE1lbW9yeVJhbmdlSG9iIChCYXNlLCBMb2NhbEFwaWMsIEZBTFNFKTsK
PiAgICAgICBpZiAoRW5kID4gKExvY2FsQXBpYyArIFNJWkVfNEtCKSkgewoKVGhlIHJhbmdlIGlz
IGFjdHVhbGx5IGZyb20gMHhmZWUwMDAwMCB0byAweGZlZWZmZmZmICgyTUIpLCBzbyB5b3UKbGlr
ZWx5IHdhbnQgdG8gbWFrZSBzdXJlIG5vbiBvZiB0aGlzIGlzIGFkZGVkIGFzIHJlc2VydmVkPwoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
