Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67927067F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 19:11:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpbmG-00083K-97; Mon, 22 Jul 2019 17:07:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1DzW=VT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hpbmE-00083F-6Y
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 17:07:06 +0000
X-Inumbo-ID: 20fcd971-aca3-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20fcd971-aca3-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 17:07:04 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ucuFdCvgFoB5YDU07k1g/aZqlmqqVXCub5I96NpBeizuNgmvvZo6JGtZ3bBzS0ILuwcn2M8ZEk
 rTtHQXxhRKZuxRxjbAiAdV28BskupeGxtshXG2byGPTujddzYUk1Uh91f69B69oll4oCVsqlVs
 yOxqRmeQm7nAmDRv4oPHUryWRC5vPCaEAVZMzfYnt3B3Rk0fH/0iSIqv+76p/7pesObPc6Rlaf
 7CIk1V5Pair+JPixRlq79Gfg3KfnutKsqhU5uXTUWHTokeHWxVFTm26DNWZEVjAy77kctFfr9a
 Ps4=
X-SBRS: 2.7
X-MesageID: 3292009
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3292009"
Date: Mon, 22 Jul 2019 18:06:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190722170643.GH1208@perard.uk.xensource.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-33-anthony.perard@citrix.com>
 <5ce18fa6-100f-e792-199f-cdecf6b04177@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ce18fa6-100f-e792-199f-cdecf6b04177@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v3 32/35] OvmfPkg/PlatformBootManagerLib:
 Use a Xen console for ConOut/ConIn
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
Cc: xen-devel@lists.xenproject.org, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMTI6NDg6NTdQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IE9uIDA3LzA0LzE5IDE2OjQyLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IE9uIGEg
WGVuIFBWSCBndWVzdCwgbm9uZSBvZiB0aGUgZXhpc3Rpbmcgc2VyaWFsIG9yIGNvbnNvbGUgaW50
ZXJmYWNlCj4gPiB3b3Jrcywgc28gd2UgYWRkIGEgbmV3IG9uZSwgYmFzZWQgb24gWGVuQ29uc29s
ZVNlcmlhbFBvcnRMaWIsIGFuZAo+ID4gaW1wbGVtZW50ZWQgdmlhIFNlcmlhbER4ZS4KPiA+IAo+
ID4gVGhhdCBpcyBhIHNpbXBsZSBjb25zb2xlIGltcGxlbWVudGF0aW9uIHRoYXQgY2FuIHdvcmtz
IG9uIGJvdGggUFZICj4gPiBndWVzdCBhbmQgSFZNIGd1ZXN0cywgZXZlbiBpZiBpdCByYXJlbHkg
Z29pbmcgdG8gYmUgdXNlIG9uIEhWTS4KPiA+IAo+ID4gSGF2ZSBQbGF0Zm9ybUJvb3RNYW5hZ2Vy
TGliIGxvb2sgZm9yIHRoZSBuZXcgY29uc29sZSwgd2hlbiBydW5uaW5nIGFzIGEKPiA+IFhlbiBn
dWVzdC4KPiA+IAo+ID4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19i
dWcuY2dpP2lkPTE2ODkKPiA+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgo+ID4gLS0tCgo+ID4gZGlmZiAtLWdpdCBhL092bWZQa2cvTGli
cmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL1BsYXRmb3JtRGF0YS5jIGIvT3ZtZlBrZy9MaWJy
YXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvUGxhdGZvcm1EYXRhLmMKPiA+IGluZGV4IDM2YWFi
Nzg0ZDcuLmE5YjFmZTI3NGEgMTAwNjQ0Cj4gPiAtLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZv
cm1Cb290TWFuYWdlckxpYi9QbGF0Zm9ybURhdGEuYwo+ID4gKysrIGIvT3ZtZlBrZy9MaWJyYXJ5
L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvUGxhdGZvcm1EYXRhLmMKPiA+IEBAIC05LDE4ICs5LDE5
IEBACj4gPiAgCj4gPiAgI2luY2x1ZGUgIkJkc1BsYXRmb3JtLmgiCj4gPiAgI2luY2x1ZGUgPEd1
aWQvUWVtdVJhbWZiLmg+Cj4gPiArI2luY2x1ZGUgPEd1aWQvU2VyaWFsUG9ydExpYlZlbmRvci5o
Pgo+ID4gIAo+ID4gIC8vCj4gPiAgLy8gRGVidWcgQWdlbnQgVUFSVCBEZXZpY2UgUGF0aCBzdHJ1
Y3R1cmUKPiA+ICAvLwo+ID4gLSNwcmFnbWEgcGFjaygxKQo+ID4gKyNwcmFnbWEgcGFjayAoMSkK
PiA+ICB0eXBlZGVmIHN0cnVjdCB7Cj4gPiAgICBWRU5ET1JfREVWSUNFX1BBVEggICAgICAgIFZl
bmRvckhhcmR3YXJlOwo+ID4gICAgVUFSVF9ERVZJQ0VfUEFUSCAgICAgICAgICBVYXJ0Owo+ID4g
ICAgVkVORE9SX0RFVklDRV9QQVRIICAgICAgICBUZXJtaW5hbFR5cGU7Cj4gPiAgICBFRklfREVW
SUNFX1BBVEhfUFJPVE9DT0wgIEVuZDsKPiA+ICB9IFZFTkRPUl9VQVJUX0RFVklDRV9QQVRIOwo+
ID4gLSNwcmFnbWEgcGFjaygpCj4gPiArI3ByYWdtYSBwYWNrICgpCj4gPiAgCj4gPiAgLy8KPiA+
ICAvLyBVU0IgS2V5Ym9hcmQgRGV2aWNlIFBhdGggc3RydWN0dXJlCj4gPiBAQCAtNDMsNiArNDQs
MTggQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+ID4gIH0gVkVORE9SX1JBTUZCX0RFVklDRV9QQVRIOwo+
ID4gICNwcmFnbWEgcGFjayAoKQo+ID4gIAo+ID4gKy8vCj4gPiArLy8gWGVuIENvbnNvbGUgRGV2
aWNlIFBhdGggc3RydWN0dXJlCj4gPiArLy8KPiA+ICsjcHJhZ21hIHBhY2soMSkKPiA+ICt0eXBl
ZGVmIHN0cnVjdCB7Cj4gPiArICBWRU5ET1JfREVWSUNFX1BBVEggICAgICAgIFZlbmRvckhhcmR3
YXJlOwo+ID4gKyAgVUFSVF9ERVZJQ0VfUEFUSCAgICAgICAgICBVYXJ0Owo+ID4gKyAgVkVORE9S
X0RFVklDRV9QQVRIICAgICAgICBUZXJtaW5hbFR5cGU7Cj4gPiArICBFRklfREVWSUNFX1BBVEhf
UFJPVE9DT0wgIEVuZDsKPiA+ICt9IFhFTl9DT05TT0xFX0RFVklDRV9QQVRIOwo+ID4gKyNwcmFn
bWEgcGFjaygpCj4gPiArCj4gCj4gVGhpcyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBhZGRyZXNzZXMg
YWxsIG9mIG15IHYyIHJldmlldyBjb21tZW50cyAoZWl0aGVyCj4gYnkgY29kZSBjaGFuZ2VzIG9y
IGJ5IGV4cGxhbmF0aW9ucyBpbiB0aGUgTm90ZXMgc2VjdGlvbikgLS0gdGhhbmtzIGZvciB0aGF0
Lgo+IAo+IEhvd2V2ZXIsIHdoZW4geW91IGFycml2ZWQgYXQgbXkgcmV1cWVzdCAoNikgaW4KPiA8
aHR0cDovL21pZC5tYWlsLWFyY2hpdmUuY29tLzdkNmFkZjVkLWJhY2EtN2U5Yy02OGVmLTJmODQ3
OWJiZDkwMkByZWRoYXQuY29tPiwKPiBhbmQgc2VhcmNoZWQgdGhlIHNvdXJjZSBmaWxlIGZvciAi
cGFjaygiIC0tIGluIG9yZGVyIHRvIGluc2VydCBhIHNwYWNlCj4gY2hhcmFjdGVyIGJlZm9yZSB0
aGUgb3BlbmluZyBwYXJlbiAtLSwgdGhlIG1hdGNoIHdhcyAqbm90KiBhcm91bmQgdGhlCj4gbmV3
IFhFTl9DT05TT0xFX0RFVklDRV9QQVRIIHN0cnVjdHVyZS4gSW5zdGVhZCwgaXQgd2FzIGFyb3Vu
ZCB0aGUKPiBwcmVleGlzdGVudCBWRU5ET1JfVUFSVF9ERVZJQ0VfUEFUSCBzdHJ1Y3R1cmUuIEFu
ZCBzbyB5b3UgZml4ZWQgdGhlCj4gc3R5bGUgZm9yIHRoZSBvbGQgY29kZSwgYW5kIG5vdCB0aGUg
bmV3IGNvZGUuCj4gCj4gQnV0OiB0aGF0J3MgYWN0dWFsbHkgdXNlZnVsLiBCZWNhdXNlIG5vdyB0
aGF0IEknbSBsb29raW5nIGF0Cj4gVkVORE9SX1VBUlRfREVWSUNFX1BBVEgsIGl0IHNlZW1zIHRo
YXQgd2UgZG9uJ3QgbmVlZCB0aGUgbmV3IHR5cGUKPiBYRU5fQ09OU09MRV9ERVZJQ0VfUEFUSCBh
dCBhbGwuIElzIHRoYXQgcmlnaHQ/IFNvOgo+IAo+ICgxKSBQbGVhc2UgZHJvcCBYRU5fQ09OU09M
RV9ERVZJQ0VfUEFUSC4KPiAKPiAoMikgUGxlYXNlIHJlcGxhY2UgdGhlIGNvbW1lbnQKPiAKPiAg
IERlYnVnIEFnZW50IFVBUlQgRGV2aWNlIFBhdGggc3RydWN0dXJlCj4gCj4gd2l0aAo+IAo+ICAg
VmVuZG9yIFVBUlQgRGV2aWNlIFBhdGggc3RydWN0dXJlCj4gCj4gb24gVkVORE9SX1VBUlRfREVW
SUNFX1BBVEguCj4gCj4gKDMpIFBsZWFzZSBwcmVzZXJ2ZSB0aGUgIm1pc3BsYWNlZCIgd2hpdGVz
cGFjZSBmaXgsIGZvciAicGFjaygiLCBhcm91bmQKPiBWRU5ET1JfVUFSVF9ERVZJQ0VfUEFUSC4K
PiAKPiAoNCkgUGxlYXNlIHVzZSBWRU5ET1JfVUFSVF9ERVZJQ0VfUEFUSCBhcyB0aGUgdHlwZSBv
ZiBnWGVuQ29uc29sZURldmljZVBhdGguCj4gCj4gV2l0aCB0aG9zZToKPiAKPiBSZXZpZXdlZC1i
eTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KCkknbSBnb2luZyB0byBhZGQgdGhl
IGZvbGxvd2luZyB0byB0aGUgY29tbWl0IG1lc3NhZ2U6CgogIFNpbmNlIHdlIHVzZSBWRU5ET1Jf
VUFSVF9ERVZJQ0VfUEFUSCwgZml4IGl0cyBkZXNjcmlwdGlvbiBhbmQKICBjb2Rpbmcgc3R5bGUu
CgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
