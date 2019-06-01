Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855BD3209F
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 21:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hX9yG-0001m0-C0; Sat, 01 Jun 2019 19:47:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1yp8=UA=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1hX9yE-0001lv-NI
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 19:47:14 +0000
X-Inumbo-ID: 0c219fb8-84a6-11e9-8980-bc764e045a96
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0c219fb8-84a6-11e9-8980-bc764e045a96;
 Sat, 01 Jun 2019 19:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B2211D129;
 Sat,  1 Jun 2019 21:47:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQpXzS62bziT; Sat,  1 Jun 2019 21:47:10 +0200 (CEST)
Received: from function (105.251.129.77.rev.sfr.net [77.129.251.105])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 1044CD122;
 Sat,  1 Jun 2019 21:47:09 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1hX9y9-0001LR-01; Sat, 01 Jun 2019 21:47:09 +0200
Date: Sat, 1 Jun 2019 21:47:08 +0200
From: Samuel Thibault <admin@listes.aquilenet.fr>
To: admin@listes.aquilenet.fr, Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <20190601194708.zyzwntis2epnpiw2@function>
Mail-Followup-To: Samuel Thibault <admin@listes.aquilenet.fr>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 Hans van Kranenburg <hans@knorrie.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Debian Xen Team <pkg-xen-devel@lists.alioth.debian.org>
References: <ace166ae-95b0-25c1-d3fa-3d7b2128521e@knorrie.org>
 <20190208231624.d3p5folfbnw7isp2@function>
 <79756d96-788b-b683-82b1-96a87d2353f1@knorrie.org>
 <20190209163534.boh7ljguxytrnb6o@function>
 <b385f45c-c140-550e-220f-bbc372a15cdd@oracle.com>
 <cac5093b-10c8-8476-f6c8-98999e588072@knorrie.org>
 <20190211221050.qnhw7ma2b5ancek3@function>
 <fbb92dc2-6844-a31e-fa29-af703df31223@oracle.com>
 <20190217212914.cczgjr4fp5k4attg@function>
 <29cb64d5-1d7f-30d5-d294-c3556b3e02e1@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29cb64d5-1d7f-30d5-d294-c3556b3e02e1@oracle.com>
Organization: I am not organized
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [Xen-devel] [admin] [Pkg-xen-devel] [BUG] task jbd2/xvda4-8:174
 blocked for more than 120 seconds.
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
Cc: Hans van Kranenburg <hans@knorrie.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Debian Xen Team <pkg-xen-devel@lists.alioth.debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpEb25nbGkgWmhhbmcsIGxlIGx1bi4gMTggZsOpdnIuIDIwMTkgMDg6MDk6NTYgKzA4
MDAsIGEgZWNyaXQ6Cj4gT24gMi8xOC8xOSA1OjI5IEFNLCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6
Cj4gPj4+Pj4gT24gMi8xMC8xOSAxMjozNSBBTSwgU2FtdWVsIFRoaWJhdWx0IHdyb3RlOgo+ID4+
Pj4+PiBPaCEgIFRoYXQgY291bGQgYmUgaXQgaW5kZWVkLiAgSSdtIHdvbmRlcmluZyB3aGF0IGNv
dWxkIGJlIG1vbm9wb2xpemluZwo+ID4+Pj4+PiB0aGVtLCB0aG91Z2gsIGFuZCB3aHkgK2RlYjl1
MTEgaXMgYWZmZWN0ZWQgd2hpbGUgK2RlYjl1MTAgaXMgbm90LiAgSSdtCj4gPj4+Pj4+IGFmcmFp
ZCBpbmNyZWFzaW5nIHRoZSBnbnR0YWIgbWF4IHNpemUgdG8gMzIgbWlnaHQganVzdCBkZWZlciBm
aWxsaW5nIGl0Cj4gPj4+Pj4+IHVwLgo+ID4+Pj4+Pgo+ID4+Pj4+Pj4gICAtIyAuL3hlbi1kaWFn
ICBnbnR0YWJfcXVlcnlfc2l6ZSA1Cj4gPj4+Pj4+PiAgIGRvbWlkPTU6IG5yX2ZyYW1lcz0xMSwg
bWF4X25yX2ZyYW1lcz0zMgo+ID4+Pj4+PgouLi4KPiA+IFRoZSBudW1iZXIgc2VlbXMgdG8gYmUg
Z29pbmcgdXAgYnkgYWJvdXQgb25lIGV2ZXJ5IGRheS4gU28gcHJvYmFibHkgYQo+ID4gZ3JhbnQg
ZW50cnkgbGVhayBzb21ld2hlcmUgOi8KPiAKPiBUaGlzIG1pZ2h0IG5vdCBiZSBhIGdyYW50IGxl
YWsuIFRoZSBibG9jayBwdiBkcml2ZXIgd291bGQgaG9sZCB0aGUgcGVyc2lzdGVudAo+IGdyYW50
IGZvciBhIGxvbmcgdGltZS4KCkp1c3QgdG8gZ2l2ZSBhbiB1cGRhdGUgdG8gY2xvc2UgdGhlIHRo
cmVhZDogYWZ0ZXIgYSBWTSB1cHRpbWUgb2YgMTExCmRheXMsIG5yX2ZyYW1lcyBpcyBhdCA0MSwg
c28gaXQgbG9va3MgbGlrZSB3ZSBkb24ndCBoYXZlIGEgbGVhaywganVzdCBhCmJ1c3kgVk0gOikK
ClNhbXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
