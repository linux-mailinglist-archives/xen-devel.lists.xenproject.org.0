Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440984EE3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:38:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvN2z-0001a0-ME; Wed, 07 Aug 2019 14:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvN2y-0001Zo-C1
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:36:12 +0000
X-Inumbo-ID: b2a64c72-b920-11e9-a430-1f613955a171
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2a64c72-b920-11e9-a430-1f613955a171;
 Wed, 07 Aug 2019 14:36:10 +0000 (UTC)
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
IronPort-SDR: VoCFuPFBnWfCBjz4Vo1wVghRbL+k4NQFnWZY+w7PiiZqWxNtP6nyx3Ri62w43tk8oDENDUHV4t
 bUHmQOP1I2W0kCjJ48m8z4J6kc8yXtK0K7OvECPQp6BseCduXdSBVa0B/W7Of429CuRf3Pm1vK
 O2lHkXtp3cLhl7CwfK/ZcbU/qyWNTonMUe8wh9buAC/TIsZRGPsWue6Fb2BsOu2SrmIxIlqWua
 X35N9I4XF15Z9HplHjEbuFIhINDYpnkzFNJEWOhtiAgP3Y1tgql4quUHCLSPGgXdqEr1uzPZNP
 b90=
X-SBRS: 2.7
X-MesageID: 4139824
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4139824"
Date: Wed, 7 Aug 2019 16:35:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <devel@edk2.groups.io>, <anthony.perard@citrix.com>
Message-ID: <20190807143558.uxha44jflgmstdkj@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-13-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-13-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 12/35]
 OvmfPkg/XenPlatformPei: Grab RSDP from PVH guest start of day struct
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 Jordan Justen <jordan.l.justen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6MjFQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQ2hlY2sgaWYgdGhlcmUncyBhIHN0YXJ0IG9mIHRoZSBkYXkgc3RydWN0IHByb3Zp
ZGVkIHRvIFBWSCBndWVzdCwgc2F2ZQo+IHRoZSBBQ1BJIFJTRFAgYWRkcmVzcyBmb3IgbGF0ZXIu
Cj4gCj4gVGhpcyBwYXRjaCBpbXBvcnQgaW1wb3J0IGFyY2gteDg2L2h2bS9zdGFydF9pbmZvLmgg
ZnJvbSB4ZW4uZ2l0LgoKWW91IHNlZW0gdG8gY2hhbmdlIHRoZSB0eXBlcyB3aGVuIGltcG9ydGlu
ZyBzdGFydF9pbmZvLmgsIGlzIHRoYXQKYWJzb2x1dGVseSBuZWNlc3Nhcnk/CgpGcm9tIG15IGV4
cGVyaWVuY2Ugd29ya2luZyB3aXRoIGRpZmZlcmVudCBwcm9qZWN0cyB3aGVuIGltcG9ydGluZyBz
dWNoCmhlYWRlcnMgaXQncyBiZXR0ZXIgdG8ga2VlcCB0aGVtIHZlcmJhdGltLCB0aGlzIG1ha2Vz
IGltcG9ydGluZyBmdXR1cmUKdmVyc2lvbnMgZnJvbSB1cHN0cmVhbSBlYXNpZXIuCgpJIGhhdmUg
YSBjb21tZW50IGJlbG93LCBidXQgaXQncyBtb3JlIGxpa2UgYSBxdWVzdGlvbi4KCj4gZGlmZiAt
LWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1hlbi5jCj4gaW5kZXggNWM3ZDdkZGMxYy4uYjM2NjEzOWEwYSAxMDA2NDQKPiAtLS0gYS9P
dm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBl
aS9YZW4uYwo+IEBAIC0yNSw2ICsyNSw3IEBACj4gICNpbmNsdWRlIDxJbmR1c3RyeVN0YW5kYXJk
L0U4MjAuaD4KPiAgI2luY2x1ZGUgPExpYnJhcnkvUmVzb3VyY2VQdWJsaWNhdGlvbkxpYi5oPgo+
ICAjaW5jbHVkZSA8TGlicmFyeS9NdHJyTGliLmg+Cj4gKyNpbmNsdWRlIDxJbmR1c3RyeVN0YW5k
YXJkL1hlbi9hcmNoLXg4Ni9odm0vc3RhcnRfaW5mby5oPgo+ICAKPiAgI2luY2x1ZGUgIlBsYXRm
b3JtLmgiCj4gICNpbmNsdWRlICJYZW4uaCIKPiBAQCAtODYsNiArODcsNyBAQCBYZW5Db25uZWN0
ICgKPiAgICBVSU5UMzIgWGVuVmVyc2lvbjsKPiAgICBFRklfWEVOX09WTUZfSU5GTyAqSW5mbzsK
PiAgICBDSEFSOCBTaWdbc2l6ZW9mIChJbmZvLT5TaWduYXR1cmUpICsgMV07Cj4gKyAgVUlOVDMy
ICpQVkhSZXNldFZlY3RvckRhdGE7Cj4gIAo+ICAgIEFzbUNwdWlkIChYZW5MZWFmICsgMiwgJlRy
YW5zZmVyUGFnZXMsICZUcmFuc2ZlclJlZywgTlVMTCwgTlVMTCk7Cj4gICAgbVhlbkluZm8uSHlw
ZXJQYWdlcyA9IEFsbG9jYXRlUGFnZXMgKFRyYW5zZmVyUGFnZXMpOwo+IEBAIC0xMjEsNiArMTIz
LDI5IEBAIFhlbkNvbm5lY3QgKAo+ICAgICAgbVhlbkh2bWxvYWRlckluZm8gPSBOVUxMOwo+ICAg
IH0KPiAgCj4gKyAgbVhlbkluZm8uUnNkcFB2aCA9IE5VTEw7Cj4gKwo+ICsgIC8vCj4gKyAgLy8g
TG9jYXRlIGFuZCB1c2UgaW5mb3JtYXRpb24gZnJvbSB0aGUgc3RhcnQgb2YgZGF5IHN0cnVjdHVy
ZSBpZiB3ZSBoYXZlCj4gKyAgLy8gYm9vdGVkIHZpYSB0aGUgUFZIIGVudHJ5IHBvaW50Lgo+ICsg
IC8vCj4gKwo+ICsgIFBWSFJlc2V0VmVjdG9yRGF0YSA9IChWT0lEICopKFVJTlROKSBQY2RHZXQz
MiAoUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVjdFB0cik7Cj4gKyAgLy8KPiArICAvLyBUaGF0IG1h
Z2ljIHZhbHVlIGlzIHdyaXR0ZW4gaW4gWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFz
bQo+ICsgIC8vCj4gKyAgaWYgKFBWSFJlc2V0VmVjdG9yRGF0YVsxXSA9PSBTSUdOQVRVUkVfMzIg
KCdYJywgJ1AnLCAnVicsICdIJykpIHsKPiArICAgIHN0cnVjdCBodm1fc3RhcnRfaW5mbyAqSFZN
U3RhcnRJbmZvOwo+ICsKPiArICAgIEhWTVN0YXJ0SW5mbyA9IChWT0lEICopKFVJTlROKSBQVkhS
ZXNldFZlY3RvckRhdGFbMF07Cj4gKyAgICBpZiAoSFZNU3RhcnRJbmZvLT5tYWdpYyA9PSBYRU5f
SFZNX1NUQVJUX01BR0lDX1ZBTFVFKSB7Cj4gKyAgICAgIEFTU0VSVCAoSFZNU3RhcnRJbmZvLT5y
c2RwX3BhZGRyICE9IDApOwo+ICsgICAgICBpZiAoSFZNU3RhcnRJbmZvLT5yc2RwX3BhZGRyICE9
IDApIHsKPiArICAgICAgICBtWGVuSW5mby5Sc2RwUHZoID0gKFZPSUQgKikoVUlOVE4pSFZNU3Rh
cnRJbmZvLT5yc2RwX3BhZGRyOwoKSSBndWVzcyB5b3UgY2FuIGRvIHRoaXMgYmVjYXVzZSBPVk1G
IGhhcyBhbiBpZGVudGl0eSBtYXAgb2YgdmlydHVhbAphZGRyZXNzZXMgdG8gcGh5c2ljYWwgYWRk
cmVzc2VzPwoKSSB3b25kZXIgdGhlIHNpemUgb2Ygc3VjaCBpZGVudGl0eSBtYXAsIGFuZCB3aGV0
aGVyIHlvdSBuZWVkIHRvIGNoZWNrCnRoYXQgdGhlIHJzZHAgYWRkcmVzcyBpcyBpbmRlZWQgaW5z
aWRlIG9mIHRoYXQgcmVnaW9uIGJlZm9yZQpjb252ZXJ0aW5nIGl0IHRvIGEgcG9pbnRlci4gVGhl
IHNhbWUgd291bGQgYXBwbHkgdG8KUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVjdFB0ciwgYnV0IHRo
YXQncyBsaWtlbHkgc2FmZSBiZWNhdXNlIGl0J3MKYWx3YXlzIDwgNEdCLCB3aGljaCBJIGFzc3Vt
ZSBPVk1GIGFsd2F5cyBoYXMgaWRlbnRpdHkgbWFwcGVkPwoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
