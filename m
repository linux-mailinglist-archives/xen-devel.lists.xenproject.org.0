Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E7686F8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 12:25:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmy7a-0001rT-0v; Mon, 15 Jul 2019 10:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZ1r=VM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hmy7Y-0001rO-9b
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 10:22:12 +0000
X-Inumbo-ID: 6570c196-a6ea-11e9-af75-7b6703199b6e
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6570c196-a6ea-11e9-af75-7b6703199b6e;
 Mon, 15 Jul 2019 10:22:07 +0000 (UTC)
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
IronPort-SDR: xs79negirPqm/jlciHJHKRmuXZWkZ1XXMfHKlm3L3zXWKZh2y5r6AiLw4+j0ldYX1g92jkG2J7
 NGgt2UxIYOgAQlkbLBFiDqn+Ygx+ysQHNMxhnk0HSYDfjLcZjbW1LORGXfXbDzylEgFPMXLT5p
 51J+UtgAa2FOoEytTzpjwteqYZQK+51mbrZyed/WHQ9KkVlb/4Xo3Iln+1XQiybYBnZXIgoC4/
 yy8/DZjYzFlPPRnZCT7GUT4q+sa1/g6XNWwAOz6MFw3xYNm7yL2yiCzshAvh14P6bW8B/42sTs
 +Os=
X-SBRS: 2.7
X-MesageID: 2973024
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2973024"
Date: Mon, 15 Jul 2019 12:21:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190715102154.kzj5qczqsazfvzaj@MacBook-Air-de-Roger.local>
References: <df25ad2a-89f1-37a6-3e2e-d1306fef121a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df25ad2a-89f1-37a6-3e2e-d1306fef121a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Ping: [PATCH v2] timers: limit heap size
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDQ6MDY6MDZQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjA2LjE5IGF0IDA4OjUxLCAgd3JvdGU6Cj4gPiBGaXJzdCBhbmQgZm9y
ZW1vc3QgbWFrZSB0aW1lcl9zb2Z0aXJxX2FjdGlvbigpIGF2b2lkIGdyb3dpbmcgdGhlIGhlYXAK
PiA+IGlmIGl0cyBuZXcgc2l6ZSBjYW4ndCBiZSBzdG9yZWQgd2l0aG91dCB0cnVuY2F0aW9uLiA2
NGsgZW50cmllcyBpcyBhCj4gPiBsb3QsIGFuZCBJIGRvbid0IHRoaW5rIHdlJ3JlIGF0IHJpc2sg
b2YgYWN0dWFsbHkgcnVubmluZyBpbnRvIHRoZSBpc3N1ZSwKPiA+IGJ1dCBJIGFsc28gdGhpbmsg
aXQncyBiZXR0ZXIgbm90IHRvIGFsbG93IGZvciBoYXJkIHRvIGRlYnVnIHByb2JsZW1zIHRvCj4g
PiBvY2N1ciBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gPiAKPiA+IEZ1cnRoZXJtb3JlIGFsc28gYWRq
dXN0IHRoZSBjb2RlIHN1Y2ggdGhlIHNpemUvbGltaXQgZmllbGRzIGJlY29taW5nCj4gPiB1bnNp
Z25lZCBpbnQgd291bGQgYXQgbGVhc3Qgd29yayBmcm9tIGEgbWVyZSBzaXppbmcgcG9pbnQgb2Yg
dmlldy4gRm9yCj4gPiB0aGlzIGFsc28gc3dpdGNoIHZhcmlvdXMgdXNlcyBvZiBwbGFpbiBpbnQg
dG8gdW5zaWduZWQgaW50Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpUaGFua3M6CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJIGhvd2V2ZXIgd29uZGVyIHdoZXRoZXIgYWxsIHRoaXMg
aGVhcCB0aW1lciBtYW5hZ2VtZW50IHBsdXMgdGhlIGV4dHJhCmxpc3QgaXMgcmVhbGx5IHRoZSBi
ZXN0IG9wdGlvbiwgdXNpbmcgYSBiYWxhbmNlZCB0cmVlIHNlZW1zIGxpa2UgYQpiZXR0ZXIgb3B0
aW9uIGhlcmUuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
