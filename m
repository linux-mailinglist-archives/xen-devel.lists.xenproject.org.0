Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA02614F
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 12:04:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTO3X-00008q-JM; Wed, 22 May 2019 10:01:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Clyk=TW=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hTO3V-00008h-SV
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:01:05 +0000
X-Inumbo-ID: 82a076f8-7c78-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82a076f8-7c78-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 10:01:04 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: r+CKNnh9PJ1F5kctlV2ZGiDZZxbpYgyvG8olD6RC35JXAaEhXbeSG+RA+H/RCSshC3WwtyW/HB
 EL1+p5LO6LGolqwKceJXMmdipAo5WkLAW5KbDaedK/rH5C72D4SWmdF3MWrifc5oV78FAEjATd
 JeKrUI4hK9Z9PDNvBAv9A5akJ9TXqUMrg4v/RwG5N5QTImmWzCV7Yct5jfqquRHW4WS75/0OZe
 YpuFkjbIPTgiwqVUptfn9UKeSyR+Z5rCCK46ZIxm37OZdy2j/eQoOa7VOz2+CdiaJcrw0Z3XzT
 wW4=
X-SBRS: 2.7
X-MesageID: 760152
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,498,1549947600"; 
   d="scan'208";a="760152"
Date: Wed, 22 May 2019 11:01:01 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190522100101.GL1846@zion.uk.xensource.com>
References: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
 <20190522092544.2d7d835f.olaf@aepfle.de>
 <5CE50B130200007800231359@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE50B130200007800231359@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] libxl assertion failure when creating any kind of
 guest
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDI6NDA6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjA1LjE5IGF0IDA5OjI1LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+
ID4gQW0gV2VkLCAyMiBNYXkgMjAxOSAwMToxMTo1NCAtMDYwMAo+ID4gc2NocmllYiAiSmFuIEJl
dWxpY2giIDxKQmV1bGljaEBzdXNlLmNvbT46Cj4gPiAKPiA+PiBsaWJ4bF9fZG9tYWluX2J1aWxk
X2luZm9fc2V0ZGVmYXVsdCAoZ2M9MHg3ZmZmZmZmZmRlZTAsIAo+ID4gYl9pbmZvPTB4N2ZmZmZm
ZmZkYjgwKQo+ID4+ICAgICBhdCBsaWJ4bF9jcmVhdGUuYzoxNDMKPiA+IAo+ID4gVGhpcyBpcyBs
aWJ4bF9kZWZib29sX3ZhbChiX2luZm8tPmRldmljZV9tb2RlbF9zdHViZG9tYWluKS4KPiA+IAo+
ID4gRHVlIHRvIHRoZSBsYWNrIG9mIGEgcHJvcGVyIHdheSB0byBkZXNjcmliZSBhbGwgdGhlIGRl
cGVuZGVuY2llcyB3aXRoaW4KPiA+IGxpYnhsIEkgc3VnZ2VzdCB0byByZXZlcnQgdGhlc2UgY29t
bWl0cyBmb3IgdGhlIHRpbWUgYmVpbmc6Cj4gPiAKPiA+IDI3OGM2NDUxOWMgbGlieGw6IGZpeCBs
aWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYWZ0ZXIgODk5NDMzZjE0OWQKPiA+IDg5OTQzM2YxNDkg
bGlieGw6IGZpeCBtaWdyYXRpb24gb2YgUFYgYW5kIFBWSCBkb21VcyB3aXRoIGFuZCB3aXRob3V0
IHFlbXUKPiA+IDM4MDJlY2JhYTkgbGlieGw6IGFkZCBoZWxwZXIgZnVuY3Rpb24gdG8gc2V0IGRl
dmljZV9tb2RlbF92ZXJzaW9uCj4gCj4gV2VsbCwgdGhlIGFsdGVybmF0aXZlIGlzIHRoZSBvbmUg
bGluZSBjaGFuZ2UgYmVsb3cuCj4gCj4gSmFuCj4gCj4gbGlieGw6IGZ1cnRoZXIgZml4IGxpYnhs
X2RvbWFpbl9uZWVkX21lbW9yeSgpIGFmdGVyIDg5OTQzM2YxNDlkCj4gCj4gQmVzaWRlcyBwcm92
aWRpbmcgYSBkZXZpY2VfbW9kZWxfdmVyc2lvbiBzZXR0aW5nIChhcyBkb25lIGJ5IDI3OGM2NDUx
OWMKPiBbImxpYnhsOiBmaXggbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IGFmdGVyIDg5OTQzM2Yx
NDlkIl0pLCBvbmUgaXMgYWxzbwo+IG5lZWRlZCBmb3IgZGV2aWNlX21vZGVsX3N0dWJkb21haW4s
IG9yIGVsc2UgdGhlIHJlc3BlY3RpdmUgYXNzZXJ0KCkgaW4KPiBsaWJ4bF9kZWZib29sX3ZhbCgp
IChjYWxsZWQgZnJvbSBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCgpKQo+IHdp
bGwgdHJpZ2dlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gCj4gLS0tIHVuc3RhYmxlLm9yaWcvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMKPiAr
KysgdW5zdGFibGUvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMKPiBAQCAtNDcyLDYgKzQ3Miw3IEBA
IGludCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkobGlieGxfY3R4ICoKPiAgICAgICAqIGNhbGN1
bGF0aW9uIGRvZXNuJ3QgcmVhbGx5IGNhcmUgd2hpY2ggUUVNVSBpcyBzZXQgaGVyZSwgc28gd2UK
PiAgICAgICAqIGdvIHdpdGggdGhlIHVwc3RyZWFtIGRlZmF1bHQuCj4gICAgICAgKi8KPiArICAg
IGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT5kZXZpY2VfbW9kZWxfc3R1YmRvbWFp
biwgZmFsc2UpOwo+ICAgICAgaWYgKCFiX2luZm8tPmRldmljZV9tb2RlbF92ZXJzaW9uKQo+ICAg
ICAgICAgIGJfaW5mby0+ZGV2aWNlX21vZGVsX3ZlcnNpb24gPSBMSUJYTF9ERVZJQ0VfTU9ERUxf
VkVSU0lPTl9RRU1VX1hFTjsKPiAgCgpJIGhhdmUgcmV2ZXJ0ZWQgdGhvc2UgcGF0Y2hlcy4gVGhl
cmUgaXMgb25lIG1vcmUgcmVncmVzc2lvbiB0aGF0J3MgbW9yZQpzZXJpb3VzIGFuZCBpdCBpcyBi
bG9ja2luZyBvc3N0ZXN0LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
