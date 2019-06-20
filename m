Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B181E4C9A1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 10:43:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdscb-0006Ky-F5; Thu, 20 Jun 2019 08:40:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jelc=UT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdsca-0006Kr-10
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 08:40:40 +0000
X-Inumbo-ID: 129e5cba-9337-11e9-89b9-030fcf1694ce
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 129e5cba-9337-11e9-89b9-030fcf1694ce;
 Thu, 20 Jun 2019 08:40:36 +0000 (UTC)
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
IronPort-SDR: EMQPRQyMWrBhTzs671Q7n0E/RhbD1SO+bww7/idqVuIi5iO8kQcKGPCS3gf39AELelqOFaDMB/
 vtFUDLoP3HywoyJnM6dKr3ELxi1nJYVe4aRaiwYVh1HAwkLSBoidNS4j9eS6M+zRh7LgIinOhk
 MWyhqNjoFIzsh2P3vDccwsW9jc1EqRQ4seBSVRomS2WVlTX34GX0N+HwR0QKkwsUXepPgz+4YJ
 8YqSqfawqlPXL9xJHEZk4NqskQ+om+pys+5bd7qoN6305ESKPRAcWMvZoJaqdOSC1cP5SXVEMX
 1+M=
X-SBRS: 2.7
X-MesageID: 1991274
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,396,1557201600"; 
   d="scan'208";a="1991274"
Date: Thu, 20 Jun 2019 10:40:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190620084028.5ozq2o4wr545mpb3@MacBook-Air-de-Roger.local>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/4] xen/link: Link .data.schedulers and
 CONSTRUCTERS in more appropriate locations
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDk6MTE6MjVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBOZWl0aGVyIG9mIHRoZXNlIHNob3VsZCBsaXZlIGluIC5kYXRhCj4gCj4gICogLmRh
dGEuc2NoZWR1bGVycyBpcyBvbmx5IGV2ZXIgcmVhZCwgc28gaXMgbW92ZWQgaW50byAucm9kYXRh
Cj4gICogQ09OU1RSVUNUT1JTIGlzIG9ubHkgZXZlciByZWFkLCBhbmQgb25seSBhdCBib290LCBz
byBpcyBtb3ZlZCB0byBiZXNpZGUKPiAgICAuaW5pdC5yb2RhdGEKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKRm9yIHg4NjoKClJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCk9uZSBj
b21tZW50IGJlbG93OgoKPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
Pgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0t
LQo+ICB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TIHwgMTEgKysrKysrLS0tLS0KPiAgeGVuL2FyY2gv
eDg2L3hlbi5sZHMuUyB8IDExICsrKysrKy0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gaW5kZXggZWMzN2QzOC4uOWZh
NmM5OSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gKysrIGIveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUwo+IEBAIC0xNDAsNiArMTQwLDExIEBAIFNFQ1RJT05TCj4gICAgICAg
ICAqKC5kYXRhLnBhcmFtKQo+ICAgICAgICAgX19wYXJhbV9lbmQgPSAuOwo+ICAKPiArICAgICAg
IC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKPiArICAgICAgIF9fc3RhcnRfc2NoZWR1bGVyc19h
cnJheSA9IC47Cj4gKyAgICAgICAqKC5kYXRhLnNjaGVkdWxlcnMpCj4gKyAgICAgICBfX2VuZF9z
Y2hlZHVsZXJzX2FycmF5ID0gLjsKPiArCj4gICNpZiBkZWZpbmVkKENPTkZJR19IQVNfVlBDSSkg
JiYgZGVmaW5lZChDT05GSUdfTEFURV9IV0RPTSkKPiAgICAgICAgIC4gPSBBTElHTihQT0lOVEVS
X0FMSUdOKTsKPiAgICAgICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47Cj4gQEAgLTIwNyw2ICsy
MTIsNyBAQCBTRUNUSU9OUwo+ICAKPiAgICAgICAgICooLmluaXQucm9kYXRhKQo+ICAgICAgICAg
KiguaW5pdC5yb2RhdGEuKikKPiArICAgICAgIENPTlNUUlVDVE9SUwoKQWNjb3JkaW5nIHRvIHRo
ZSBsZCBtYW51YWwgQ09OU1RSVUNUT1JTIGlzIG9ubHkgcmVsZXZhbnQgZm9yIGEub3V0LApFQ09G
RiBhbmQgWENPRkYuIEknbSB1bnN1cmUgd2hldGhlciBQRSBkb2VzIHVzZSBDT05TVFJVQ1RPUlMg
b3Igbm90LApzaW5jZSBpdCdzIGEgZGVzY2VuZGFudCBvZiBDT0ZGLgoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
