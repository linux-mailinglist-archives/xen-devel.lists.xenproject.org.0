Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706F768A94
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 15:31:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn110-0007Tv-Qc; Mon, 15 Jul 2019 13:27:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cAUX=VM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hn10z-0007Tq-9K
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 13:27:37 +0000
X-Inumbo-ID: 4e8d2c4f-a704-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4e8d2c4f-a704-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 13:27:35 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y2QoiTNFKa85JcVDfpPX6A6o5yvyqm2sXsLycD7cCYddf/wCoSOBZy15PJHIbHF/VFc9lFO1BU
 uFbruYi35qF3V+z7hPS95uerI41ga//1TFTP4sIipMRXWWsdh2ySmmVzm/4srbKOdUQ2n7X+wO
 7L/DBL2XD+nt3bJIII+6ggh7/UIVYTXuXfsHOn36cZ/CsWer5i8nbWN3cVXcxDDMk05vaPjZwB
 sSq0hIsOiNOnkQ1GcMoLY2GO+QSQhkMxXhwW41eVWrlkkM9PB0KcLLSZpiEuN1rjd65PHUOKga
 AJA=
X-SBRS: 2.7
X-MesageID: 3046273
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3046273"
To: xen-devel <xen-devel@lists.xenproject.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <ef1133c1-6e6e-c80f-168d-2bebb0df23d5@citrix.com>
Date: Mon, 15 Jul 2019 14:27:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Design session notes: Build system gripe session
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QmVsb3cgYXJlIHRoZSByYXcgbm90ZXMuICBHZW5lcmFsIGFncmVlbWVudHMgc2VlbSB0byBiZToK
CiogUmVtb3ZpbmcgZXh0ZXJuYWwgYnVpbGRzIGZyb20geGVuIGJ1aWxkIHN5c3RlbSBpcyBhbiBh
ZHZhbnRhZ2UgZm9yIHRoZQptYWluIHVzZXJzIChkZXZlbG9wZXJzLCBkaXN0cm9zIC8gcGFja2Fn
ZXJzKQoqIE91dC1vZi10cmVlIGJ1aWxkIGlzIHVzZWZ1bCBmb3IgbG90cyBvZiBjaXJjdW1zdGFu
Y2VzOyBzeW1saW5rIHRyaWNrCnVzZWQgdG8gd29yayBhcm91bmQgaXRzIGxhY2sgY2F1c2VzIGxv
dHMgb2YgcHJvYmxlbXMKClRoZXJlIGRpZG4ndCBzZWVtIHRvIGJlIGFueW9uZSB2b2x1bnRlZXJp
bmcgdG8gaGFjayBhdCB0aGUgYnVpbGQgc3lzdGVtLApidXQgd2l0aCBlbm91Z2ggaW50ZXJlc3Qg
aW4gc2VlaW5nIGl0IGNoYW5nZSwgYW5kIGEgZ2VuZXJhbCBhZ3JlZW1lbnQgb24KdGhlIGRpcmVj
dGlvbiB3ZSB3YW50IHRvIGdvLCBwZXJoYXBzIHNvbWVvbmUgd2lsbCBzdGVwIHVwIHdoZW4gdGhl
eSBnZXQKYSBjaGFuY2UuCgogLUdlb3JnZQoKaHR0cHM6Ly9oYWNrbWQuaW8vbUFHVDViVTlUNi1h
WEpWajg4ZGVZdwoKIyBCdWlsZCBzeXN0ZW0gZ3JpcGUgc2Vzc2lvbgoKKioqTGluayBhdmFpbGFi
bGUgZnJvbSB0aGUgZGVzaWduLXNlc3Npb25zIHNlc3Npb24gZGVzY3JpcHRpb24gcGFnZSoqKgoK
VG9waWNzIGluY2x1ZGU6CgogKiBNb3ZpbmcgImV4dGVybmFsIiBidWlsZHMgdG8gYSBzZXBhcmF0
ZSBwYXJ0IG9mIHRoZSB0cmVlLCBub3QgYnVpbHQgYnkKZGVmYXVsdAogKiBBZGRpbmcgbW9yZSAi
ZXh0ZXJuYWwiIGJ1aWxkczsgYHB2Z3J1YmAgZm9yIGluc3RhbmNlCiAqIE1ha2luZyBpdCBlYXN5
IHRvIGJ1aWxkIHdpdGggbm8gaW50ZXJuZXQgYWNjZXNzCiAqIFVzaW5nIGBnaXQgc3VibW9kdWxl
c2AKCgpJc3N1ZXM6CjEuIG91dCBvZiB0cmVlIGJ1aWxkIG5vdCBzdXBwb3J0ZWQgLS0gc2hpbSBi
dWlsZCBzdGlsbCBoYWxmIGJyb2tlbgoyLiBYZW4gYnVpbGQgcmUtZXZhbHVhdGVzIGNvbXBpbGVy
IHN1cHBvcnQgZm9yIGV2ZXJ5IHRyYW5zbGF0aW9uIHVuaXQuCihTd2l0Y2ggdG8gbmV3ZXIgS2Nv
bmZpZy4pCjMuIG1ldGEgdmlydHVhbGl6YXRpb24gYnVpbGQgc3lzdGVtICh5b2N0bykgbmVlZHMg
dG8gcHVsbCBzaW1saW5rCnRyaWNrcywgeGVuJ3MgYnVpbGQgc3lzdGVtIHN0b21wIG9uIHRoYXQK
NC4gY29udGFpbmVyaXplLnNoIGlzIGJyb2tlbiBieSBzeW1saW5rIHRyaWNrcyBpbiB0aGUgYnVp
bGQgc3lzdGVtCjUuIEV4dGVybmFsIHByb2plY3RzIGdldCBwdWxsZWQgaW4uIFNvbWUgdGhpbmsg
dGhleSBzaG91bGQgYmUgcmVtb3ZlZCwKc29tZSB0aGluayBtb3JlIHNob3VsZCBiZSBhZGRlZC4g
U29sdmVkIGJ5IHJhaXNpbiBidXQgbm9ib2R5IHVzZWQgaXQKCgoKRm9yIG91dC1vZi10cmVlIGJ1
aWxkLCBmb3IgeGVuLCB1c2UgS2J1aWxkLgoKV291bGQgYmUgbmljZSB0byBiZSBhYmxlIHRvIGRv
ICh3aXRob3V0IGhhdmluZyB0byBjbGVhbiBvciBmaXggb3IgcGF0Y2gpOgpgYGAKbWFrZSBDT05G
SUc9cmVsZWFzZS5jb25maWcgTz1vdXRwdXQvcmVsZWFzZQptYWtlIENPTkZJRz1zaGltLmNvbmZp
ZyBPPW91dHB1dC9zaGltCmBgYAoKRGlmZmVyZW50IHVzZXJzIGhhdmUgZGlmZmVybnQgcmVxdWly
ZW1lbnRzOiBkZXZlbG9wZXJzLCB1c2VycywgZGlzdHJvCnBhY2thZ2Vycy4KCkZvciBldmVyeWRh
eSB1c2VycyB3ZSBzaG91bGQgcG9pbnQgcGVvcGxlIHRvIHRoZWlyIGRpc3Ryb3MuCgpSYWlzaW4g
dHJpZWQgdG8gYmUgZGV2c3RhY2ssIHdoaWNoIGlzIG5vdCBkZXZlbG9wZXJzIHdhbnQgb3IgdHJ1
c3QuCgpQZW9wbGUgaW4gZmF2b3VyIG9mIHJlbW92aW5nIG1vcmUgc3R1ZmYgZnJvbSB4ZW4uZ2l0
LiBTaG91bGQgc3RhcnQgd2l0aAphIGRvY3VtZW50IGRlc2NyaWJpbmcgaG93IHRvIGJ1aWxkIGEg
eGVuIHN5c3RlbSAtLSBwdWxsIHRoaXMgdHJlZSwgdXNlCnRoaXMgcnVuZSBldGMgZXRjLiBPciB1
c2UgQW5kcm9pZCdzIGJ1aWxkIHN5c3RlbT8KCkdpdCBydW5lcyBpbiB0cmVlIHNob3VsZCBkaXNh
cHBlYXIuCgpOZWVkIHRyYW5zaXRpb25hbCBwbGFuIGZvciBvc3N0ZXN0LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
