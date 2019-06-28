Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7659902
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 13:10:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgoj7-0003nD-Mz; Fri, 28 Jun 2019 11:07:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ea7O=U3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgoj5-0003n8-PJ
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 11:07:31 +0000
X-Inumbo-ID: eb624d72-9994-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eb624d72-9994-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 11:07:29 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 81FNDHaxCvAa03lspvWEV/X3P2Hr2FIsSErU7cwu6dtqhCYzZ8kDhtotWw406F7Y5oMtodiof5
 oi27fOLpEFY1DWZxu3GyeH9U6WKeWLeO1yj4c34Ie5bjiJCou/yRJHYq87Npe3EZ4BXqAz98Bt
 MA/K55fne35VthC4XhC041H244d0n1VhdF1hTKkHCQRo0nSSw2hso+bdkErm4R7gkPeFYyHli8
 UjzKBwW/JHwIAZW2I5VuJ1SPrXm6K0zxA6jufSeCCFTQoULB6hBhtnMyImURARmOUsOtCXThAH
 HBw=
X-SBRS: 2.7
X-MesageID: 2397634
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,427,1557201600"; 
   d="scan'208";a="2397634"
Date: Fri, 28 Jun 2019 13:07:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190628110718.yocuyslstlomn5nq@MacBook-Air-de-Roger.local>
References: <decd4108-1234-921f-ba89-f2eec18d21f5@suse.com>
 <20190628101544.7hey7guj4k6gu7pp@MacBook-Air-de-Roger.local>
 <0fabe327-ba46-399d-12f5-23ce46ab1c3b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fabe327-ba46-399d-12f5-23ce46ab1c3b@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6NDA6MDJBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDYuMjAxOSAxMjoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBGcmksIEp1biAyOCwgMjAxOSBhdCAwOToyOTo1M0FNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiAgID4+PiBPbiAyNi4wNi4xOSBhdCAxNTo1NSwgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PiB3cm90ZToKPiA+IFRCSCBJIHdvdWxkIGxpa2Ugc29tZSBndWlkZWxpbmVzIGFib3V0IGhvdyBD
Uk9TU19DT01QSUxFIGlzIHN1cHBvc2VkCj4gPiB0byBiZSB1c2VkLgo+IAo+IEl0IG5ldmVyIGhh
dmluZyBiZWVuIHNwZWxsZWQgb3V0LCBJIGd1ZXNzIGl0J3MgZG93biB0byB0aGUgdmFyaW91cyBm
bGF2b3JzCj4gcGVvcGxlIG1pZ2h0IGJlIHVzaW5nLiBGb3IgbWUgcGVyc29uYWxseSBDUk9TU19D
T01QSUxFIGlzbid0IGZsZXhpYmxlCj4gZW5vdWdoIGFueXdheSwgc28gSSBoYXZlIHRvIGZ1cnRo
ZXIgYWx0ZXIgaXQgaW4gYSBsb2NhbCBwYXRjaCBJIGNhcnJ5ICh0bwo+IGFjY29tbW9kYXRlIGZv
ciBzdWZmaXhlcyBvbiB0aGUgY29tbWFuZCBuYW1lcyBhbG9uZ3NpZGUgcHJlZml4ZXMpLgo+IAo+
ID4gSSBhZ3JlZSB0aGUgYWJvdmUgaXMgbm90IHZlcnkgbmljZSB3aGVuIENST1NTX0NPTVBJTEUg
aXMgc2V0LiBXaGF0Cj4gPiBhYm91dCBzb21ldGhpbmcgbGlrZToKPiA+IAo+ID4gaWZlcSAoJChj
bGFuZykseSkKPiA+IENDICAgICAgICA/PSBjbGFuZwo+ID4gQ1hYICAgICAgID89IGNsYW5nKysK
PiA+IExEX0xUTyAgICA/PSBsbHZtLWxkCj4gPiBIT1NUQ0MgICAgPz0gJChDQykKPiA+IEhPU1RD
WFggICA/PSAkKENYWCkKPiA+IENDICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpJChDQykKPiA+
IENYWCAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpJChDWFgpCj4gPiBMRF9MVE8gICAgID0gJChD
Uk9TU19DT01QSUxFKSQoTERfTFRPKQo+ID4gZWxzZQo+ID4gWy4uLl0KPiA+IAo+ID4gVGhhdCB3
b3VsZCBrZWVwIHRoZSBjdXJyZW50IGJlaGF2aW91ciBvZiBzZXR0aW5nIENDPWdjYwo+ID4gQ1JP
U1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFiaS0sIHdoaWNoIG15IHByZXZpb3VzIGFwcHJvYWNo
IGRpZG4ndC4KPiAKPiBIbW0sIHllcywgdGhpcyBtaWdodCB3b3JrIGZvciBtYW55IGNhc2VzLiAo
VGhlIENDL0NYWC9MRF9MVE8gbGluZXMgdGhlbgo+IHdvdWxkbid0IG5lZWQgdG8gYmUgaW5zaWRl
IHRoZSBpZmVxKCkgYW55bW9yZSwgdGhvdWdoLikKCk9oLCByaWdodC4KCj4gSG93ZXZlciwgY29u
c2lkZXIgdGhpcyBpbnZvY2F0aW9uLCB3aGljaCBJIHVzZSBmb3IgcHJlLXB1c2ggYnVpbGQgY2hl
Y2tzCj4gb24gYSAzMi1iaXQgaG9zdDoKPiAKPiBtYWtlIC1zQyBidWlsZC94ZW4vJHYge1hFTl9U
QVJHRVRfQVJDSCx0fT14ODZfNjQgQ0M9Z2NjeCBMRD1sZHggT0JKQ09QWT1vYmpjb3B5eCBOTT1u
bXggLWozMiB4ZW4KPiAKPiBUaGUgInQiIGVudmlyb25tZW50IHZhcmlhYmxlIGlzIHVzZWQgYnkg
Z2NjeCAod2hpY2ggaXMgYSBzaGVsbCBzY3JpcHQpLgo+IFRoYXQgc2FtZSBzaGVsbCBzY3JpcHQg
d291bGQgdGhlbiBnZXQgaW52b2tlZCBmb3IgdXNlcyBvZiAkKEhPU1RDQyksCj4gYW5kIHdyb25n
bHkgdHJ5IHRvIGJ1aWxkIGEgNjQtYml0IG9iamVjdC9iaW5hcnkuIEknbSBhZnJhaWQgaXQgaXMg
d3JvbmcKPiBpbiBnZW5lcmFsIHRvIGRlcml2ZSBIT1NUQ0MgZnJvbSBDQy4KCk9LLCBzbyB0aGVu
IHdlIHNob3VsZCBqdXN0IHNldCBIT1NUe0NDL0NYWH0gdG8gY2xhbmcvZ2NjIGlmIHVuc2V0LAps
aWtlIHdlIGRvIGZvciBDQy9DWFguIEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBmaW5lIGZvciB5b3Vy
IHVzZSBjYXNlLgoKTm90ZSB0aGF0IGN1cnJlbnRseSBIT1NUe0NDL0NYWH0gaXMgZGVyaXZlZCBm
cm9tIENDL0NYWCBpZgpYRU5fQ09NUElMRV9BUkNIIG1hdGNoZXMgWEVOX1RBUkdFVF9BUkNIIChz
ZWUgQ29uZmlnLm1rKToKCiMgSWYgd2UgYXJlIG5vdCBjcm9zcy1jb21waWxpbmcsIGRlZmF1bHQg
SE9TVEN7Qy9YWH0gdG8gQ3tDL1hYfQppZmVxICgkKFhFTl9UQVJHRVRfQVJDSCksICQoWEVOX0NP
TVBJTEVfQVJDSCkpCkhPU1RDQyA/PSAkKENDKQpIT1NUQ1hYID89ICQoQ1hYKQplbmRpZgoKU28g
d2hhdCBhYm91dDoKCmlmZXEgKCQoY2xhbmcpLHkpCkRFRl9DQyAgICAgICAgPSBjbGFuZwpERUZf
Q1hYICAgICAgID0gY2xhbmcrKwpERUZfTERfTFRPICAgID0gbGx2bS1sZAplbHNlCkRFRl9DQyAg
ICAgICAgPSBnY2MKREVGX0NYWCAgICAgICA9IGcrKwpERUZfTERfTFRPICAgID0gbGQKZW5kaWYK
CmlmZXEgKCQoWEVOX1RBUkdFVF9BUkNIKSwgJChYRU5fQ09NUElMRV9BUkNIKSkKSE9TVENDICA/
PSAkKERFRl9DQykKSE9TVENYWCA/PSAkKERFRl9DWFgpCmVuZGlmCgpDQyAgICAgICAgPz0gJChE
RUZfQ0MpCkNYWCAgICAgICA/PSAkKERFRl9DWFgpCkxEX0xUTyAgICA/PSAkKERFRl9MRF9MVE8p
CgpDQyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKSQoQ0MpCkNYWCAgICAgICAgPSAkKENST1NT
X0NPTVBJTEUpJChDWFgpCkxEX0xUTyAgICAgPSAkKENST1NTX0NPTVBJTEUpJChMRF9MVE8pCgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
