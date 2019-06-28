Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8459844
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 12:18:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgnvG-0007xq-Vg; Fri, 28 Jun 2019 10:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ea7O=U3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgnvF-0007xl-5B
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 10:16:01 +0000
X-Inumbo-ID: b7d086ac-998d-11e9-ae43-03fdaaf99a91
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7d086ac-998d-11e9-ae43-03fdaaf99a91;
 Fri, 28 Jun 2019 10:15:57 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: H5cWbrEpuwox/DhYqs9Axx7xaxMPc30KlaRTFvMUE7K8yqxVIDLFaDd+ahDXiXphpBcFX0/JI3
 cPoHDa3Cwsf2LFxqBqdXGECUjjiJ7vBt3p7fP9DPxhPvhWaForZswb6bIyoA4J9spyQAERXr7a
 E24mT6gJ4S2c5xxVFs+1MDba0L45H2ZEZvw5bP7YWHgz17+TzVecvp6o9EENZxXtlmqh4lwhvD
 JNyCHCQHBkX3E/WM934NG4oM19cymFo6MC6uFtoi+nZ2rwTG/3Mcnr4BaatbaHaN7Al1hyYgnS
 py0=
X-SBRS: 2.7
X-MesageID: 2366734
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,427,1557201600"; 
   d="scan'208";a="2366734"
Date: Fri, 28 Jun 2019 12:15:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190628101544.7hey7guj4k6gu7pp@MacBook-Air-de-Roger.local>
References: <decd4108-1234-921f-ba89-f2eec18d21f5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <decd4108-1234-921f-ba89-f2eec18d21f5@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/5] make: simplify setting HOST{CC/CXX}
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDk6Mjk6NTNBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gID4+PiBPbiAyNi4wNi4xOSBhdCAxNTo1NSwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3
cm90ZToKPiAgPiAtLS0gYS9Db25maWcubWsKPiAgPiArKysgYi9Db25maWcubWsKPiAgPiBAQCAt
MzksMjIgKzM5LDEyIEBAIERFU1RESVIgICAgID89IC8KPiAgPiAgIyBBbGxvdyBwaG9ueSBhdHRy
aWJ1dGUgdG8gYmUgbGlzdGVkIGFzIGRlcGVuZGVuY3kgcmF0aGVyIHRoYW4gZmFrZSAKPiB0YXJn
ZXQKPiAgPiAgLlBIT05ZOiAucGhvbnkKPiAgPgo+ICA+IC0jIElmIHdlIGFyZSBub3QgY3Jvc3Mt
Y29tcGlsaW5nLCBkZWZhdWx0IEhPU1RDe0MvWFh9IHRvIEN7Qy9YWH0KPiAgPiAtaWZlcSAoJChY
RU5fVEFSR0VUX0FSQ0gpLCAkKFhFTl9DT01QSUxFX0FSQ0gpKQo+ICA+IC1IT1NUQ0MgPz0gJChD
QykKPiAgPiAtSE9TVENYWCA/PSAkKENYWCkKPiAgPiAtZW5kaWYKPiAgPiAtCj4gID4gICMgVXNl
IENsYW5nL0xMVk0gaW5zdGVhZCBvZiBHQ0M/Cj4gID4gIGNsYW5nID89IG4KPiAgPiAgaWZlcSAo
JChjbGFuZyksbikKPiAgPiAgZ2NjIDo9IHkKPiAgPiAtSE9TVENDID89IGdjYwo+ICA+IC1IT1NU
Q1hYID89IGcrKwo+ICA+ICBlbHNlCj4gID4gIGdjYyA6PSBuCj4gID4gLUhPU1RDQyA/PSBjbGFu
Zwo+ICA+IC1IT1NUQ1hYID89IGNsYW5nKysKPiAgPiAgZW5kaWYKPiAKPiBUaGUgaW5jbHVzaW9u
IHBvaW50IGxlYWRpbmcgdG8gY29uZmlnL1N0ZEdOVS5tayBzaXRzIGJlbG93Cj4gaGVyZSBhZmFp
Y3QsIHNvIEkgZG9uJ3Qgc2VlIGhvdyAuLi4KPiAKPiAgPiAtLS0gYS9jb25maWcvU3RkR05VLm1r
Cj4gID4gKysrIGIvY29uZmlnL1N0ZEdOVS5tawo+ICA+IEBAIC05LDYgKzksMTAgQEAgQ0MgICAg
ICAgID89ICQoQ1JPU1NfQ09NUElMRSlnY2MKPiAgPiAgQ1hYICAgICAgID89ICQoQ1JPU1NfQ09N
UElMRSlnKysKPiAgPiAgTERfTFRPICAgID89ICQoQ1JPU1NfQ09NUElMRSlsZAo+ICA+ICBlbmRp
Zgo+ICA+ICsKPiAgPiArSE9TVENDICAgID89ICQoQ0MpCj4gID4gK0hPU1RDWFggICA/PSAkKENY
WCkKPiAKPiAuLi4gdGhlc2UgYXJlIGV2ZXJ5IGdvaW5nIHRvIHRha2UgZWZmZWN0IC0gdGhlIHR3
byB2YXJpYWJsZXMgYXJlbid0Cj4gdW5zZXQgYW55bW9yZSBhdCB0aGF0IHBvaW50LgoKSSdtIG5v
dCBzdXJlIEkgZm9sbG93LCBhZnRlciB0aGlzIGNoYW5nZSB0aGUgb25seSBwbGFjZSB3aGVyZQpI
T1NUe0NDL0NYWH0gYXJlIHNldCBpcyBpbiBTdGRHTlUubWssIHNvIHRob3NlIHZhcmlhYmxlcyB3
b3VsZCBiZQp1bnNldCB1bmxlc3MgdGhleSBhcmUgc2V0IGluIHRoZSBlbnZpcm9ubWVudC4KCj4g
RnVydGhlcm1vcmUsIHdoZW4gQ1JPU1NfQ09NUElMRQo+IGlzIG5vdCBlbXB0eSwgdGhpcyBpcyBj
ZXJ0YWlubHkgbm90IHdoYXQgd2Ugd2FudC4KClRCSCBJIHdvdWxkIGxpa2Ugc29tZSBndWlkZWxp
bmVzIGFib3V0IGhvdyBDUk9TU19DT01QSUxFIGlzIHN1cHBvc2VkCnRvIGJlIHVzZWQuCgpJIGFn
cmVlIHRoZSBhYm92ZSBpcyBub3QgdmVyeSBuaWNlIHdoZW4gQ1JPU1NfQ09NUElMRSBpcyBzZXQu
IFdoYXQKYWJvdXQgc29tZXRoaW5nIGxpa2U6CgppZmVxICgkKGNsYW5nKSx5KQpDQyAgICAgICAg
Pz0gY2xhbmcKQ1hYICAgICAgID89IGNsYW5nKysKTERfTFRPICAgID89IGxsdm0tbGQKSE9TVEND
ICAgID89ICQoQ0MpCkhPU1RDWFggICA/PSAkKENYWCkKQ0MgICAgICAgICA9ICQoQ1JPU1NfQ09N
UElMRSkkKENDKQpDWFggICAgICAgID0gJChDUk9TU19DT01QSUxFKSQoQ1hYKQpMRF9MVE8gICAg
ID0gJChDUk9TU19DT01QSUxFKSQoTERfTFRPKQplbHNlClsuLi5dCgpUaGF0IHdvdWxkIGtlZXAg
dGhlIGN1cnJlbnQgYmVoYXZpb3VyIG9mIHNldHRpbmcgQ0M9Z2NjCkNST1NTX0NPTVBJTEU9YXJt
LWxpbnV4LWdudWVhYmktLCB3aGljaCBteSBwcmV2aW91cyBhcHByb2FjaCBkaWRuJ3QuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
