Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB6850C3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:12:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOVt-0003wa-7p; Wed, 07 Aug 2019 16:10:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvOVr-0003wU-UX
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:10:07 +0000
X-Inumbo-ID: d17666b6-b92d-11e9-9fc9-8f287ff1ad2b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d17666b6-b92d-11e9-9fc9-8f287ff1ad2b;
 Wed, 07 Aug 2019 16:10:05 +0000 (UTC)
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
IronPort-SDR: PDHLvJRw4owSoRiGyMmTR7ut6w2vTXkTjCZaYr6LOmWXLCWEJJOX7+Sjivsant8Qefw1L3vDWL
 VMujtu/fR7RRPNBzBHX/ocSyHblXmKpZVZQ+OJLZNF3qBtuX+wvpiypjT/vv7pFozs7x38kpu2
 kGFPsMYEGfrak5eXps/O6Dt/i6Q4giMh7zzJvCF86eKnnHSfEyY5gqKV7qgoozBLRTjbaDTJH9
 EZl+TdpCzB9BmlHCeOWqBXPZDIQqzPVd5ID5USpJ1KgY8i0LpRqBDEDF947xG0geE5SGft8mJd
 3Mg=
X-SBRS: 2.7
X-MesageID: 4120715
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4120715"
Date: Wed, 7 Aug 2019 18:09:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <devel@edk2.groups.io>, <anthony.perard@citrix.com>
Message-ID: <20190807160957.csgyplb6cqfen5ix@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-36-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-36-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 35/35] OvmfPkg/OvmfXen: use
 RealTimeClockRuntimeDxe from EmbeddedPkg
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

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6NDRQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQSBYZW4gUFZIIGd1ZXN0IGRvZXNuJ3QgaGF2ZSBhIFJUQyB0aGF0IE9WTUYgd291
bGQgZXhwZWN0LCBzbwo+IFBjYXRSZWFsVGltZUNsb2NrUnVudGltZUR4ZSBmYWlscyB0byBpbml0
aWFsaXplIGFuZCBwcmV2ZW50IHRoZQo+IGZpcm13YXJlIGZyb20gZmluaXNoIHRvIGJvb3QuIFRv
IHByZXZlbnQgdGhhdCwgd2Ugd2lsbCB1c2UKPiBYZW5SZWFsVGltZUNsb2NrTGliIHdoaWNoIHNp
bXBseSBhbHdheXMgcmV0dXJuIHRoZSBzYW1lIHRpbWUuCj4gVGhpcyB3aWxsIHdvcmsgb24gYm90
aCBYZW4gUFZIIGFuZCBIVk0gZ3Vlc3RzLgoKTm90IHRoYXQgdGhpcyBpcyBub3QgY29ycmVjdCwg
YnV0IHdoYXQncyB0aGUgcG9pbnQgaW4gcmVxdWlyaW5nIGEKY2xvY2sgaWYgaXQgY2FuIGJlIGZh
a2VkIGJ5IGFsd2F5cyByZXR1cm5pbmcgdGhlIHNhbWUgdmFsdWU/CgpJdCBzZWVtcyBsaWtlIGl0
J3MgdXNhZ2UgaXMgbm90IHJlYWxseSByZXF1aXJlZCwgYW5kIGNvdWxkIGluZGVlZCBiZQpkcm9w
cGVkIGFsdG9nZXRoZXI/CgpBbHRlcm5hdGl2ZWx5LCB0aGVyZSdzIHRoZSBQViBjbG9jayB3aGlj
aCBpcyBhdmFpbGFibGUgdG8gUFZIIGd1ZXN0cwphbmQgd2lsbCByZXR1cm4gYSBwcm9wZXIgdGlt
ZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
