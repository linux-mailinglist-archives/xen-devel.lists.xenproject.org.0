Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F35D3B3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 17:57:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiL7A-0005YW-Vu; Tue, 02 Jul 2019 15:54:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ftjz=U7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hiL78-0005YR-LC
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 15:54:38 +0000
X-Inumbo-ID: b092e75c-9ce1-11e9-9c31-f7d27152de25
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b092e75c-9ce1-11e9-9c31-f7d27152de25;
 Tue, 02 Jul 2019 15:54:36 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +ovVRAe65evNkXwbiBG/0WE1ZyLs14ewUgMKCzdnPJ3j/Ira+zKmZVZ8anbJ1kdOtyE99BZksp
 ANMRnmkusTz2tiRn7dg287fMYszVLMtipWYxQvor3nST1b8HuNMkmxWRoH7tvPoODjxQ9+s/1B
 u+MYwC1OUhZ23jKhtFmSUBj6d/MP3C7dBOojeBdSNrMJn1o0Wt7mZ/Dtwntk94UhCdc1sp0lI2
 XZN+bCA0fizXUiApRGd1ND2Wn8frbQQrGSEfYNzZ4z6VEUu+A3JnBuakyVC1mZXQRJHtNX1724
 /Kg=
X-SBRS: 2.7
X-MesageID: 2525338
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2525338"
Date: Tue, 2 Jul 2019 16:09:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190702150921.GD22182@perard.uk.xensource.com>
References: <20190621093005.29329-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621093005.29329-1-olaf@aepfle.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v1] docs: substitute XEN_CONFIG_DIR in
 xl.conf.5
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MzA6MDVBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4geGwoMSkgb3BlbnMgeGwuY29uZiBpbiBYRU5fQ09ORklHX0RJUi4KPiBTdWJzdGl0dXRl
IHRoaXMgdmFyaWFibGUgYWxzbyBpbiB0aGUgbWFuIHBhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+IC0tLQo+ICBkb2NzL21hbi94bC4xLnBvZC5p
biAgICAgIHwgMiArLQo+ICBkb2NzL21hbi94bC5jb25mLjUucG9kLmluIHwgMiArLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZG9jcy9tYW4veGwuMS5wb2QuaW4gYi9kb2NzL21hbi94bC4xLnBvZC5pbgo+IGluZGV4
IDNkNjRlYWE1YjIuLmZiMTcxNTM2MzUgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW4veGwuMS5wb2Qu
aW4KPiArKysgYi9kb2NzL21hbi94bC4xLnBvZC5pbgo+IEBAIC01MCw3ICs1MCw3IEBAIHNldHVw
IHRoZSBicmlkZ2UuCj4gIAo+ICBJZiB5b3Ugc3BlY2lmeSB0aGUgYW1vdW50IG9mIG1lbW9yeSBk
b20wIGhhcywgcGFzc2luZyBCPGRvbTBfbWVtPiB0bwo+ICBYZW4sIGl0IGlzIGhpZ2hseSByZWNv
bW1lbmRlZCB0byBkaXNhYmxlIEI8YXV0b2JhbGxvb24+LiBFZGl0Cj4gLUI8L2V0Yy94ZW4veGwu
Y29uZj4gYW5kIHNldCBpdCB0byAwLgo+ICtCPEBYRU5fQ09ORklHX0RJUkAveGwuY29uZj4gYW5k
IHNldCBpdCB0byAwLgo+ICAKPiAgPWl0ZW0gcnVuIHhsIGFzIEI8cm9vdD4KPiAgCj4gZGlmZiAt
LWdpdCBhL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jb25mLjUucG9k
LmluCj4gaW5kZXggMmJlYjIxMTlhOC4uYjE2MDM2YWFlYiAxMDA2NDQKPiAtLS0gYS9kb2NzL21h
bi94bC5jb25mLjUucG9kLmluCj4gKysrIGIvZG9jcy9tYW4veGwuY29uZi41LnBvZC5pbgo+IEBA
IC0xLDYgKzEsNiBAQAo+ICA9aGVhZDEgTkFNRQo+ICAKPiAtL2V0Yy94ZW4veGwuY29uZiAtIFhM
IEdsb2JhbC9Ib3N0IENvbmZpZ3VyYXRpb24gCj4gK0BYRU5fQ09ORklHX0RJUkAveGwuY29uZiAt
IFhMIEdsb2JhbC9Ib3N0IENvbmZpZ3VyYXRpb24gCgpUaGVyZSdzIGEgdHJhaWxpbmcgd2hpdGVz
cGFjZSwgaXQgd291bGQgYmUgd29ydGggcmVtb3ZpbmcgaXQuIGdpdApjb21wbGFpbiBhYm91dCBp
dC4KClRoZSBwYXRjaCBzZWVtcyB0byBkZXBlbmRzIG9uICJVc2UgWEVOX1NDUklQVF9ESVIgdG8g
cmVmZXIgdG8KL2V0Yy94ZW4vc2NyaXB0cyIsIGJ1dCB0aGUgZW1haWwgZG9lc24ndCBtZW50aW9u
IGl0LiBJdCB3b3VsZCBoYXZlIGJlZW4KdXNlZnVsIHRvIGFkZCBhIG5vdGUgYmVsbG93IHRoZSAn
LS0tJyBsaW5lIG9yIHNlbmQgaW4gYSBzZXJpZXMgb2YgcGF0Y2guCgpCZXNpZGUgdGhhdDoKUmV2
aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhh
bmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
