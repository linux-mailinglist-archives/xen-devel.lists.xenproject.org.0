Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE1CE07A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 13:30:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHRBS-0004JJ-Ec; Mon, 07 Oct 2019 11:28:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J9qX=YA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iHRBR-0004J4-IV
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 11:28:09 +0000
X-Inumbo-ID: 7f139176-e8f5-11e9-97ab-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f139176-e8f5-11e9-97ab-12813bfff9fa;
 Mon, 07 Oct 2019 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570447671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hW6C5exBgITgAcXqWCTSjupAaElf8Ef5m4sS0Tl+noo=;
 b=VWyTOxAyEkg05Q/AbbpyJfKOV4HAea/TYhGCbENHuEdtTwIfooVoQx67
 tIMvMVv/YemqmQfMuw2Lmd+qW8q4O+Ft6TbfXEB10bNXeN20xXoUYHr7v
 4nsKo1I/mT/zjg2nc2r48WqfstElaOzr+i+fgECPu6zt9xobmHDKgOmZ7 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yj/0TU2ryuysnwfqSG3o4/Bgk6OFgpu1JL9/dahMesyuwIOyy4M17z7sC1lGpAqbsdCyM/FCkP
 LAHI91oqzHBbyF9fl78JgAPsF+8/NW6P4k+AbxsnTHRNL3eyi4QK4a+ZNhDrZRCcUjnbuXbWvz
 0l3qO17VV6L+NhTwISCGNmXmLxy7bTRVg4TviYUzohrPOvJ0CwTbmrKv7ucMV9KHcJ4PfCJqSV
 exBS8i4ElSbuWEMfbcLpCIl30Ndan6Slp2k6Lc4yOCIj9ozG4epQfR07fiaLyjRSYgdVQBWd9p
 +aY=
X-SBRS: 2.7
X-MesageID: 6800401
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,268,1566878400"; 
   d="scan'208";a="6800401"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, Lars Kurth
 <lars.kurth@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/6] Import v1.4 of Contributor Covenant CoC
Thread-Index: AQHVdKIimIBR64ienkudwdUMSIldradO86aAgAAWz4A=
Date: Mon, 7 Oct 2019 11:27:47 +0000
Message-ID: <68450837-24F1-4342-B7EB-3EE46B107791@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <00c6c80b12b1d201d7140626c7efe9d75645dee9.1569525222.git.lars.kurth@citrix.com>
 <e8fee669-7e83-d68f-e56e-3dda4a0e0611@citrix.com>
In-Reply-To: <e8fee669-7e83-d68f-e56e-3dda4a0e0611@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <A306057981288045BF18C047811E48BA@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/6] Import v1.4 of Contributor Covenant
 CoC
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA3LzEwLzIwMTksIDEyOjA2LCAiR2VvcmdlIER1bmxhcCIgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBPbiA5LzI2LzE5IDg6MzkgUE0sIExhcnMgS3Vy
dGggd3JvdGU6DQogICAgPiBGcm9tOiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+
DQogICAgPiANCiAgICA+IFNpZ25lZC1vZmYtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0
cml4LmNvbT4NCiAgICA+IC0tLQ0KICAgID4gQ2M6IG1pbmlvcy1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KICAgID4gQ2M6IHhlbi1hcGlAbGlzdHMueGVucHJvamVjdC5vcmcNCiAgICA+IENj
OiB3aW4tcHYtZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCiAgICA+IENjOiBtaXJhZ2Vvcy1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KICAgID4gQ2M6IGNvbW1pdHRlcnNAeGVucHJvamVj
dC5vcmcNCiAgICA+IC0tLQ0KICAgID4gIGNvZGUtb2YtY29uZHVjdC5tZCB8IDc2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KICAgID4gIDEg
ZmlsZSBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspDQogICAgPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGNvZGUtb2YtY29uZHVjdC5tZA0KICAgID4gDQogICAgPiBkaWZmIC0tZ2l0IGEvY29kZS1vZi1j
b25kdWN0Lm1kIGIvY29kZS1vZi1jb25kdWN0Lm1kDQogICAgPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KICAgID4gaW5kZXggMDAwMDAwMC4uODFiMjE3Yw0KICAgID4gLS0tIC9kZXYvbnVsbA0KICAg
ID4gKysrIGIvY29kZS1vZi1jb25kdWN0Lm1kDQogICAgPiBAQCAtMCwwICsxLDc2IEBADQogICAg
PiArIyBDb250cmlidXRvciBDb3ZlbmFudCBDb2RlIG9mIENvbmR1Y3QNCiAgICA+ICsNCiAgICA+
ICsjIyBPdXIgUGxlZGdlDQogICAgPiArDQogICAgPiArSW4gdGhlIGludGVyZXN0IG9mIGZvc3Rl
cmluZyBhbiBvcGVuIGFuZCB3ZWxjb21pbmcgZW52aXJvbm1lbnQsIHdlIGFzDQogICAgPiArY29u
dHJpYnV0b3JzIGFuZCBtYWludGFpbmVycyBwbGVkZ2UgdG8gbWFrZSBwYXJ0aWNpcGF0aW9uIGlu
IG91ciBwcm9qZWN0IGFuZA0KICAgID4gK291ciBjb21tdW5pdHkgYSBoYXJhc3NtZW50LWZyZWUg
ZXhwZXJpZW5jZSBmb3IgZXZlcnlvbmUsIHJlZ2FyZGxlc3Mgb2YgYWdlLCBib2R5DQogICAgPiAr
c2l6ZSwgZGlzYWJpbGl0eSwgZXRobmljaXR5LCBzZXggY2hhcmFjdGVyaXN0aWNzLCBnZW5kZXIg
aWRlbnRpdHkgYW5kIGV4cHJlc3Npb24sDQogICAgPiArbGV2ZWwgb2YgZXhwZXJpZW5jZSwgZWR1
Y2F0aW9uLCBzb2Npby1lY29ub21pYyBzdGF0dXMsIG5hdGlvbmFsaXR5LCBwZXJzb25hbA0KICAg
ID4gK2FwcGVhcmFuY2UsIHJhY2UsIHJlbGlnaW9uLCBvciBzZXh1YWwgaWRlbnRpdHkgYW5kIG9y
aWVudGF0aW9uLg0KICAgIA0KICAgIFRoaXMgaXMgcmVsYXRpdmVseSBtaW5vciwgYnV0IEkgZG9u
J3QgZmVlbCBxdWl0ZSBjb21mb3J0YWJsZSB3aXRoIHRoZQ0KICAgIHdvcmRpbmcuICAicGxlZGdl
IHRvIG1ha2UgaXQgYSBoYXJhc3NtZW50LWZyZWUgZXhwZXJpZW5jZSIgdG8gbWUgaW1wbGllcw0K
ICAgIHRoYXQgd2UgcGxlZGdlIHRoYXQgKm5vYm9keSB3aWxsIGV2ZXIgZXhwZXJpZW5jZSBoYXJh
c3NtZW50Ki4gIEkgZG9uJ3QNCiAgICB0aGluayB0aGF0J3Mgc29tZXRoaW5nIHdlIGNhbiBkZWxp
dmVyLCBhbnkgbW9yZSB0aGFuIGEgZ292ZXJubWVudCBjYW4NCiAgICBwcm9taXNlIHRoZXJlIHdp
bGwgYmUgemVybyBjcmltZS4gIEkgdGhpbmsgd2UgY291bGQgcHJvbWlzZSB0bw0KICAgICptYWlu
dGFpbiogYSBoYXJhc3NtZW50LWZyZWUgZXhwZXJpZW5jZSwgd2hpY2ggaW1wbGllcyB0aGluZ3Mg
dG8gYQ0KICAgIHJlc3RvcmluZyBoYXJhc3NtZW50LWZyZWUgc3RhdGUgYWZ0ZXIgaXQncyBiZWVu
IGJyb2tlbi4NCiAgICANCiAgICBFdmVyeXRoaW5nIGVsc2UgbG9va3MgZ29vZC4NCiAgICANCkNv
dWxkIHlvdSBjb21lIHVwIHdpdGggYW4gYWx0ZXJuYXRpdmUgY29uY3JldGUgdGV4dCBwcm9wb3Nh
bD8gDQoNCk15IHRha2UtYXdheSBpcyB0aGF0IHlvdSBzYXkgd2Ugc2hvdWxkIHVzZQ0KKiAicGxl
ZGdlIHRvIHN0cml2ZSB0byBtYWtlIC4uLiIgb3IgDQoqICJwbGVkZ2UgdG8gdHJ5IHRoZWlyIGJl
c3QgdG8gbWFrZSAuLi4iIG9yDQoqICJzdHJpdmUgdG8gbWFrZSAuLi4iIA0KaW4gd2hpY2ggY2Fz
ZSB3ZSBtYXkgYWxzbyBuZWVkIHRvIGNoYW5nZSAiVGhlIFBsZWRnZSIuDQoNCk9uIHRoZSBvdGhl
ciBoYW5kOiB0aGUgcmVzdCBvZiB0aGUgZG9jdW1lbnQgZG9lcyBjbGVhcmx5IGxheSBvdXQgdGhh
dA0Kd2hhdCB3ZSBwcm9taXNlIGlzIHRvIGRlYWwgd2l0aCBpbmNpZGVudHMgaW4gYW4gZWZmZWN0
aXZlIG1hbm5lci4NCkFuZCBieSB0aGUgbWVyZSBpbmNsdXNpb24gb2YgbWVjaGFuaXNtIHRvIGRv
IHRoaXMsIGl0IGlzIGFjdHVhbGx5IGNsZWFyDQp0aGF0IHdlIGNhbid0IGd1YXJhbnRlZSB0aGF0
ICpub2JvZHkgd2lsbCBldmVyIGV4cGVyaWVuY2UgaGFyYXNzbWVudCouDQoNCkkgZ3Vlc3MgaXQg
Y29tZXMgZG93biB0byBzdWJ0bGV0aWVzIG9mIGhvdyBwbGVkZ2UsIHByb21pc2UsIHN0cml2ZSwg
Li4uDQpkaWZmZXINCg0KUmVnYXJkcw0KTGFycw0KIA0KDQogICAgDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
