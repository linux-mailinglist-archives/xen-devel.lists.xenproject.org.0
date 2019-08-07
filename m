Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460268500C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNxa-00075m-Cc; Wed, 07 Aug 2019 15:34:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvNxY-00075W-TD
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:34:40 +0000
X-Inumbo-ID: de7944ed-b928-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id de7944ed-b928-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:34:39 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: od+hwtk2bGqvR/jbXEgbthUpPHgKWjrQ6ZumkTK34nxlLSzhfeAAEOxHHHUgVhY7xv7gZOyqvh
 3YVeNeQIWktJlCM70NuWrXvDv93flr/RvU4kXyFL4GIDaL7ffP5+lsaZMFJ3Td+R1DMmd/Clm4
 7scQ0z+bl3JAyCbXoJqevL8Bx2m8fF+PKwHA5975skDAVHuHVipf+hxfmhIGqIq5exsV18NCeZ
 tZbG6Afjd2BNRryOouqF4aPeO8Cr1XwxSQO4ZaJcOK4lEYeaLEocIOUPlhr/vx95jBOKzVsPQe
 YlI=
X-SBRS: 2.7
X-MesageID: 4144387
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4144387"
Date: Wed, 7 Aug 2019 17:34:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190807152852.e47kogsxubbjkue5@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-24-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-24-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 23/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6MzJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gV2hlbiBydW5uaW5nIGFzIGEgWGVuIFBWSCBndWVzdCwgdGhlcmUgaXMgbm8gQ01P
UyB0byByZWFkIHRoZSBtZW1vcnkKPiBzaXplIGZyb20uICBSZXdvcmsgR2V0U3lzdGVtTWVtb3J5
U2l6ZShCZWxvd3xBYm92ZSk0Z2IoKSBzbyB0aGV5IGNhbgo+IHdvcmsgd2l0aG91dCBDTU9TIGJ5
IHJlYWRpbmcgdGhlIGU4MjAgdGFibGUuCj4gCj4gUmV3b3JrIFhlblB1Ymxpc2hSYW1SZWdpb25z
IHRvIGFsc28gY2FyZSBmb3IgdGhlIHJlc2VydmVkIGFuZCBBQ1BJCj4gZW50cnkgaW4gdGhlIGU4
MjAgdGFibGUuIFRoZSByZWdpb24gdGhhdCB3YXMgYWRkZWQgYnkgSW5pdGlhbGl6ZVhlbigpCj4g
aXNuJ3QgbmVlZGVkIGFzIHRoYXQgc2FtZSBlbnRyeSBpcyBpbiB0aGUgZTgyMCB0YWJsZSBwcm92
aWRlZCBieQo+IGh2bWxvYWRlci4KPiAKPiBNVFJSIHNldHRpbmdzIGFyZW4ndCBtb2RpZmllZCBh
bnltb3JlLCBvbiBIVk0gaXQncyBhbHJlYWR5IGRvbmUgYnkKPiBodm1sb2FkZXIsIG9uIFBWSCBp
dCBpcyBzdXBwb3NlZCB0byBoYXZlIHNhbmUgZGVmYXVsdC4gTVRSUiB3aWxsIG5lZWQKPiB0byBi
ZSBkb25lIHByb3Blcmx5IGJ1dCBrZWVwaW5nIHdoYXQncyBhbHJlYWR5IGJlZW4gZG9uZSBieSBw
cm9ncmFtbWVzCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXiBmaXJtd2FyZQo+IHRoYXQgaGFzIHJ1bm5lZCBiZWZvcmUgT1ZNRiB3
aWxsIGRvIGZvciBub3cuCiAgICAgICAgICAgXiByYW4KCj4gZGlmZiAtLWdpdCBhL092bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5k
ZXggYTIxZDY1NzM1Ny4uMTgyZTk2Y2M1YiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1hlbi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IEBAIC0y
NzYsOSArMjc2LDEyIEBAIFhlblB1Ymxpc2hSYW1SZWdpb25zICgKPiAgICBWT0lECj4gICAgKQo+
ICB7Cj4gLSAgRUZJX0U4MjBfRU5UUlk2NCAgKkU4MjBNYXA7Cj4gLSAgVUlOVDMyICAgICAgICAg
ICAgRTgyMEVudHJpZXNDb3VudDsKPiAtICBFRklfU1RBVFVTICAgICAgICBTdGF0dXM7Cj4gKyAg
RUZJX0U4MjBfRU5UUlk2NCAgICAgICpFODIwTWFwOwo+ICsgIFVJTlQzMiAgICAgICAgICAgICAg
ICBFODIwRW50cmllc0NvdW50Owo+ICsgIEVGSV9TVEFUVVMgICAgICAgICAgICBTdGF0dXM7Cj4g
KyAgRUZJX0U4MjBfRU5UUlk2NCAgICAgICpFbnRyeTsKPiArICBVSU5UTiAgICAgICAgICAgICAg
ICAgSW5kZXg7Cj4gKyAgRUZJX1BIWVNJQ0FMX0FERFJFU1MgIExvY2FsQXBpYzsKPiAgCj4gICAg
REVCVUcgKChERUJVR19JTkZPLCAiVXNpbmcgbWVtb3J5IG1hcCBwcm92aWRlZCBieSBYZW5cbiIp
KTsKPiAgCj4gQEAgLTI4NywyNiArMjkwLDQ3IEBAIFhlblB1Ymxpc2hSYW1SZWdpb25zICgKPiAg
ICAvLwo+ICAgIEU4MjBFbnRyaWVzQ291bnQgPSAwOwo+ICAgIFN0YXR1cyA9IFhlbkdldEU4MjBN
YXAgKCZFODIwTWFwLCAmRTgyMEVudHJpZXNDb3VudCk7Cj4gLQo+ICAgIEFTU0VSVF9FRklfRVJS
T1IgKFN0YXR1cyk7Cj4gIAo+IC0gIGlmIChFODIwRW50cmllc0NvdW50ID4gMCkgewo+IC0gICAg
RUZJX0U4MjBfRU5UUlk2NCAqRW50cnk7Cj4gLSAgICBVSU5UMzIgTG9vcDsKPiAtCj4gLSAgICBm
b3IgKExvb3AgPSAwOyBMb29wIDwgRTgyMEVudHJpZXNDb3VudDsgTG9vcCsrKSB7Cj4gLSAgICAg
IEVudHJ5ID0gRTgyME1hcCArIExvb3A7Cj4gLQo+IC0gICAgICAvLwo+IC0gICAgICAvLyBPbmx5
IGNhcmUgYWJvdXQgUkFNCj4gLSAgICAgIC8vCj4gLSAgICAgIGlmIChFbnRyeS0+VHlwZSAhPSBF
ZmlBY3BpQWRkcmVzc1JhbmdlTWVtb3J5KSB7Cj4gLSAgICAgICAgY29udGludWU7Cj4gKyAgTG9j
YWxBcGljID0gUGNkR2V0MzIoUGNkQ3B1TG9jYWxBcGljQmFzZUFkZHJlc3MpOwo+ICsgIEFkZElv
TWVtb3J5QmFzZVNpemVIb2IgKExvY2FsQXBpYywgU0laRV8xTUIpOwo+ICsKPiArICBmb3IgKElu
ZGV4ID0gMDsgSW5kZXggPCBFODIwRW50cmllc0NvdW50OyBJbmRleCsrKSB7Cj4gKyAgICBVSU5U
NjQgQmFzZTsKPiArICAgIFVJTlQ2NCBFbmQ7Cj4gKwo+ICsgICAgRW50cnkgPSAmRTgyME1hcFtJ
bmRleF07Cj4gKwo+ICsgICAgLy8KPiArICAgIC8vIFJvdW5kIHVwIHRoZSBzdGFydCBhZGRyZXNz
LCBhbmQgcm91bmQgZG93biB0aGUgZW5kIGFkZHJlc3MuCj4gKyAgICAvLwo+ICsgICAgQmFzZSA9
IEFMSUdOX1ZBTFVFIChFbnRyeS0+QmFzZUFkZHIsIChVSU5UNjQpRUZJX1BBR0VfU0laRSk7Cj4g
KyAgICBFbmQgPSAoRW50cnktPkJhc2VBZGRyICsgRW50cnktPkxlbmd0aCkgJiB+KFVJTlQ2NClF
RklfUEFHRV9NQVNLOwo+ICsKPiArICAgIHN3aXRjaCAoRW50cnktPlR5cGUpIHsKPiArICAgIGNh
c2UgRWZpQWNwaUFkZHJlc3NSYW5nZU1lbW9yeToKPiArICAgICAgQWRkTWVtb3J5UmFuZ2VIb2Ig
KEJhc2UsIEVuZCk7Cj4gKyAgICAgIGJyZWFrOwo+ICsgICAgY2FzZSBFZmlBY3BpQWRkcmVzc1Jh
bmdlQUNQSToKPiArICAgICAgQWRkUmVzZXJ2ZWRNZW1vcnlSYW5nZUhvYiAoQmFzZSwgRW5kLCBG
QUxTRSk7Cj4gKyAgICAgIGJyZWFrOwo+ICsgICAgY2FzZSBFZmlBY3BpQWRkcmVzc1JhbmdlUmVz
ZXJ2ZWQ6Cj4gKyAgICAgIGlmIChCYXNlIDwgTG9jYWxBcGljICYmIExvY2FsQXBpYyA8IEVuZCkg
ewoKRG9uJ3QgeW91IGFsc28gbmVlZCB0byBjaGVjayBmb3IgZXF1YWxpdHk/IEluIGNhc2Ugc3Vj
aCByZWdpb24gc3RhcnRzCmF0IEJhc2UgPT0gTG9jYWxBcGljPwoKSSBndWVzcyBpdCBkb2Vzbid0
IG1hdHRlciB0aGF0IG11Y2ggc2luY2UgdGhpcyBpcyB0byB3b3JrYXJvdW5kIGEKc3BlY2lmaWMg
aXNzdWUgd2l0aCBodm1sb2FkZXIsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gc2VlIHRoaXMgc29ydGVk
IG91dAppbiBodm1sb2FkZXIgc28gdGhhdCB0aGVyZSdzIG5vIGNsYXNoIGFueW1vcmUuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
