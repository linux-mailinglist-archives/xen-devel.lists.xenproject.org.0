Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B434EDA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:32:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDFw-0000Ge-SF; Tue, 04 Jun 2019 17:29:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYDFv-0000GZ-SE
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:29:51 +0000
X-Inumbo-ID: 5980241a-86ee-11e9-9dec-67125daafbea
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5980241a-86ee-11e9-9dec-67125daafbea;
 Tue, 04 Jun 2019 17:29:48 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bux6J/Zl1WchGabwMco8Ag2YdIqmCaKWy6H67oCmdZdwnuTjp/ZHwCTCo5zRozVCP4uB/UOYbk
 cK2k+d/5K4Ts5cJ//EcTk//RKh6X657k8cj0r6XE4K/0LS04ho1hUkMB1nfvYPNVMlTcrKjCaA
 auddU2Tjhu1+/2kmn8kmFE8LvEsULsHvqDEktRC9HTTEx+wpbNjed+0/F3cdsLr0d1Xfzo88YY
 2L1w+YrtBJU8dlZ1lIWQpl23nxCDubSE6unQ860XR40klGhrNIXOUXl73+UPo+6nLuKXbdVCnd
 52A=
X-SBRS: 2.7
X-MesageID: 1306209
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1306209"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.43626.668549.272351@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 18:29:14 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-7-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-7-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 6/9] libxl_disk: Cut libxl_cdrom_insert into
 steps ..
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDYvOV0gbGlieGxfZGlzazogQ3V0IGxpYnhs
X2Nkcm9tX2luc2VydCBpbnRvIHN0ZXBzIC4uIik6Cj4gVGhpcyBwYXRjaCBjdXQgbGlieGxfY2Ry
b21faW5zZXJ0IGludG8gZGlmZmVyZW50IHN0ZXAvZnVuY3Rpb24gYnV0IHRoZXJlCj4gYXJlIHN0
aWxsIGNhbGxlZCBzeW5jaHJvbm91c2x5LiBBIGxhdGVyIHBhdGNoIHdpbGwgY2FsbCB0aGVtCj4g
YXN5bmNocm9ub3VzbHkgd2hlbiBRTVAgaXMgaW52b2x2ZWQuCj4gCj4gVGhlIGpzb25fbG9jayBo
YXMgYmVlbiByZXBsYWNlZCBieSB0aGUgcW1wX2xvY2sgZm9yIHByb3RlY3Rpb24gYWdhaW5zdAo+
IGNvbmN1cnJlbnQgY2hhbmdlcyB0byB0aGUgY2Ryb20uIFRoZSBqc29uX2xvY2sgaXMgbm93IG9u
bHkgdXNlZCB3aGVuCj4gcmVhZGluZy9tb2RpZnlpbmcgdGhlIGRvbWFpbiB1c2VyZGF0YS4KCgpZ
b3VyIGRvY3VtZW50YXRpb24gZm9yIHRoZSBxbXAgbG9jaywgdGFrZW4gcm91Z2hseSBmcm9tIG15
IGlkZWEsIGlzCnRoYXQgdGhlIHFtcCBsb2NrIGNvdmVycyBtb2RpZnlpbmcgdGhpbmdzIHZpYSBx
bXAuICBCdXQgSSB0aGluayBoZXJlCnlvdSB1c2UgaXQgZm9yIHVwZGF0ZXMgdmlhIHhlbnN0b3Jl
ID8KCkkgdGhpbmsgdGhpcyBpcyBPSyBiZWNhdXNlIHdoYXQgbWF0dGVycyBpcyB0aGF0IGFueSBv
bmUgdGhpbmcgaXMKYWx3YXlzIGNvdmVyZWQgYnkgdGhlIHNhbWUgbG9jayAtIGFuZCBoZXJlIHRo
ZSBjZHJvbSBpcyBpcyBhICJ0aGluZyIuCkJ1dCBJIHRoaW5rIHRoaXMgbWVhbnMgdGhlIGNvbW1l
bnRhcnkgaXMgd3JvbmcgPwoKCj4gLSAgICAvKiBOb3RlOiBDVFggbG9jayBpcyBhbHJlYWR5IGhl
bGQgYXQgdGhpcyBwb2ludCBzbyBsb2NrIGhpZXJhcmNoeQo+IC0gICAgICogaXMgbWFpbnRhaW5l
ZC4KPiAtICAgICAqLwo+IC0gICAgbG9jayA9IGxpYnhsX19sb2NrX2RvbWFpbl91c2VyZGF0YShn
YywgZG9taWQpOwo+IC0gICAgaWYgKCFsb2NrKSB7Cj4gKyAgICBjaXMtPnFtcF9sb2NrID0gbGli
eGxfX2xvY2tfZG9tYWluX3FtcChnYywgZG9taWQpOwoKSSB0aGluayB0aGlzIGlzIGluIGZhY3Qg
cHJlY2lzZWx5IGJhY2t3YXJkcy4gIFRoZSBsb2NrIGhpZXJhcmNoeSBpcwoqdmlvbGF0ZWQqIGhl
cmUuICBUaGUgcW1wIGxvY2sgaXMgc3VwcG9zZWQgdG8gYmUgb3V0c2lkZSB0aGUgY3R4IGxvY2su
CgpUaGVyZSB3aWxsIGhhdmUgdG8gYmUgYW4gZW50cnlwb2ludCBmb3IgdGFraW5nIHRoZSBxbXAg
bG9jayB3aGljaAp0YWtlcyBhIGdjIGFuZCB3aGljaCBtYWtlcyBhIGNhbGxiYWNrIGxhdGVyLgoK
CkFGQUlDVCBhcGFydCBmcm9tIHRoZXNlIHR3byBhc3BlY3RzIHRoZSByZXN0IG9mIHRoaXMgY29k
ZQpyZW9yZ2FuaXNhdGlvbiBpcyBnb29kLgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
