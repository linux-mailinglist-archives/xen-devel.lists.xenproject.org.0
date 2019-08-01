Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E107DD99
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBr3-0004Eg-Cj; Thu, 01 Aug 2019 14:14:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9KpE=V5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1htBr1-0004EZ-Lx
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:14:51 +0000
X-Inumbo-ID: b926bb0e-b466-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b926bb0e-b466-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:14:50 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5U75/dyyAHad8+C345q6yBopGx5bgHUZXU6rbEAKXcfK9k6OuHmfMzeMhZuQLQwjGeqbO0wGrW
 vQZIPlwuFgyvXx37Kk/fvCtXKRYATStd/HAcoMynNK+s7mYBQqezfOW/JMcfcx4nKsOCikQtE6
 TEg+C+5UqkirG2JO7YrqfyBXnnyGpk4zCrx579Jc7mbK9zJvFNHc2fPAj3x2pcIq1pAAxPek15
 y1mo44E5vuUbBtzg8l0OXDuPRW2ujDGVDr6aJgt5lO/URsFt6EZ7F/nY8m4iu204lk2RvzDTLs
 kPU=
X-SBRS: 2.7
X-MesageID: 3735809
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,334,1559534400"; 
   d="scan'208";a="3735809"
Date: Thu, 1 Aug 2019 16:14:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
Message-ID: <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDU6MTA6MDhQTSArMDMwMCwgT2xla3NhbmRyIHdyb3Rl
Ogo+IEhlbGxvIGFsbC4KPiAKPiBXaGF0IGlzIHRoZSBwcm9wZXIgbG9jYXRpb24gdG8gcGxhY2Ug
TGludXggZXJyb3IgY29kZSAoLUVQUk9CRV9ERUZFUikgaW4KPiBYZW4/Cj4gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMy1yYzIvc291cmNlL2luY2x1ZGUvbGludXgvZXJybm8u
aCNMMTkKPiAKPiAuLi4KPiBBbHRob3VnaCB0aGF0IGVycm9yIGlzIGdvaW5nIHRvIGJlIHVzZWQg
YnkgQXJtIGNvZGUgdGhlIGZpcnN0LCBJIGZlZWwgaXQKPiBzaG91bGQgYmUgc29tZXdoZXJlIGlu
IGNvbW1vbiBwbGFjZSBhcyBpdCBpcyBub3QgQXJtIHNwZWNpZmljLgo+IEkgd2FzIHRoaW5raW5n
IHRvIHBsYWNlIGl0IHRvIHhlbi9pbmNsdWRlL3B1YmxpYy9lcnJuby5oIGFuZCBndWFyZCB3aXRo
Cj4gI2lmZGVmIF9fWEVOX18gdG8gaGlkZSBmcm9tIHVzZXJzcGFjZSwgYnV0IG5vdCBzdXJlIGl0
IGlzIGEgZ29vZCBpZGVhLCBzaW5jZQo+IGl0IGxvb2tzIGxpa2Ugbm90IGEgUE9TSVggb25lIHRv
IGJlIGluIHRoYXQgaGVhZGVyLi4uCgpIZWxsbywKCkkgdGhpbmsgaXQgd291bGQgaGVscCBpZiB5
b3UgZGVzY3JpYmUgd2h5IHN1Y2ggZXJyb3IgY29kZSBpcyBuZWVkZWQgYnkKWGVuIGFuZCBob3cg
aXQgd291bGQgYmUgdXNlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
