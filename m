Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39E3C77B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 11:44:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadHY-0008Bk-3m; Tue, 11 Jun 2019 09:41:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6cN=UK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hadHW-0008Bf-KK
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:41:30 +0000
X-Inumbo-ID: 15e43564-8c2d-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 15e43564-8c2d-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 09:41:28 +0000 (UTC)
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
IronPort-SDR: DDuq3SIOQdNaRiA+qNCHuUu/vbTCcojvDZR7wPLMrX5AFkMFdvxNZerHsle2e8HXBacYASqjPG
 ERRMEJ7JHI8l2YiRRHhwDU9Uz5e6uC9aMSozvv1M2iJwWPfQ6ndEr3bFNMjXCfWNVDEaNbzfWx
 uwnQPKyPCqCLl1hONksRb2V60SIlBNIUuWbsZMCB6X7qPQXkV9OiFfAeumoEM9/hQEv8z6K1gK
 EwIj+3oXgtYW5WDMjh7PmuHbJfGyl7KDhtdz90w8LlXHuj6KAWw1mrX7Rfut9ZlE5sYnTPyDoP
 2TE=
X-SBRS: 2.7
X-MesageID: 1566498
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,578,1557201600"; 
   d="scan'208";a="1566498"
Date: Tue, 11 Jun 2019 11:41:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Message-ID: <20190611094101.wp3db4hasmafjnkc@Air-de-Roger>
References: <1050197223.47376247.1559909190275.JavaMail.zimbra@cert.pl>
 <20190610094143.GA30852@perard.uk.xensource.com>
 <edf0eaff-2a00-b4a7-8ed9-2a1d8975264e@cert.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edf0eaff-2a00-b4a7-8ed9-2a1d8975264e@cert.pl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Relevance of global lock (/var/lock/xl) in xl tool
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, wl@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGxlYXNlIHRyeSB0byBhdm9pZCB0b3AgcG9zdGluZywgaXQgYnJlYWtzIHRoZSBmbG93IG9mIHRo
ZQpjb252ZXJzYXRpb24uCgorIElhbiBhbmQgV2VpICh0b29scyBtYWludGFpbmVycykKCk9uIE1v
biwgSnVuIDEwLCAyMDE5IGF0IDA5OjU3OjM0UE0gKzAyMDAsIE1pY2hhxYIgTGVzemN6ecWEc2tp
IHdyb3RlOgo+IEhlbGxvLAo+IAo+IEkndmUgdGVzdGVkIHRoZSBzY2VuYXJpbyB3aXRoIHJlc3Rv
cmluZyB0b28gbWFueSBkb21haW5zIGhhdmluZyBsb2NrCj4gY29tbWVudGVkIG91dC4gSXQgdHVy
bnMgb3V0IHRoYXQgaW4gY2FzZSB3aGVuIHRoZXJlIGlzIG5vIG1lbW9yeSBsZWZ0Cj4gZm9yIFhF
TiB0byBhbGxvY2F0ZSwgYWxsIHBlbmRpbmcgL3hsIHJlc3RvcmUvIGNvbW1hbmRzIHdpbGwgc2lt
cGx5IGZhaWwKPiB3aXRoIGFuIGludGVybmFsIGVycm9yLgo+IAo+IEFzIGZhciBhcyBJIHVuZGVy
c3RhbmQsIGl0J3Mgbm90IGdvaW5nIHRvIGRvIGFueSBkYW1hZ2UgdW5sZXNzIEkgcmVxdWVzdAo+
IHRvbyBtdWNoIG1lbW9yeT8KCklmZiB0aGUgbG9jayBpcyBzb2xlbHkgdXNlZCB0byBhdXRvbWF0
aWNhbGx5IGFkanVzdCB0aGUgbWVtb3J5IGJhbGxvb24KZm9yIGRvbTAgaW4gb3JkZXIgdG8gYWxs
b2NhdGUgbWVtb3J5IHRvIHVzZSBmb3Igb3RoZXIgZG9tYWlucyB0aGVuIGFzCmxvbmcgYXMgeW91
IGRvbid0IGhhdmUgYXV0b2JhbGxvb24gZW5hYmxlZCBpdCBzaG91bGQgYmUgZmluZS4KCkZhaWx1
cmVzIGR1cmluZyBkb21haW4gY3JlYXRpb24gYXJlIGFsd2F5cyBoYXJtbGVzcywgdGhlIG9ubHkg
ZGFtYWdlCmlzIHRoZSBkb21haW4gbm90IGJlaW5nIGFjdHVhbGx5IGNyZWF0ZWQuCgo+IElmIHNv
LCB0aGVuIHRoZXJlIGlzIHNvbWUgcGxhY2UgZm9yIGltcHJvdmVtZW50LCBpLmUuIHRvIG1ha2Ug
eGwgYWNxdWlyZQo+IHRoZSBsb2NrLCBhbGxvY2F0ZSBtZW1vcnksIHJlbGVhc2UgdGhlIGxvY2sg
YW5kIHRoZW4gc3RhcnQgcmVzdG9yaW5nIHRoZQo+IGRvbWFpbiBzdGF0ZS4gTWF5YmUgSSBjb3Vs
ZCBwcm92aWRlIHNvbWUgcHVsbCByZXF1ZXN0IGlmIEkgd291bGQgbWFuYWdlCj4gdG8gaW1wbGVt
ZW50IHN1Y2ggYmVoYXZpb3IuCgpGV0lXLCB0aGVyZSdzIGEgJ2NsYWltJyBoeXBlcmNhbGwgd2hp
Y2ggaXMgYWxyZWFkeSBpbXBsZW1lbnRlZCBhbmQKdXNlZCBieSBsaWJ4bCB0aGF0IHNob3VsZCBy
ZXNlcnZlIG1lbW9yeSBmb3IgYSBkb21haW4gYmVmb3JlaGFuZC4KClJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
