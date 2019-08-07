Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F8850B0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:09:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOT3-000367-9G; Wed, 07 Aug 2019 16:07:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvOT1-00035s-R2
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:07:11 +0000
X-Inumbo-ID: 6930bbdc-b92d-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6930bbdc-b92d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:07:10 +0000 (UTC)
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
IronPort-SDR: TzSfMntQHQm0DuhWOxLa3Me+GDt3jSMOeo1ijkSwRW09lIo4vqrNtf0bgibMVgiG5NRdm4oVD3
 fZbm6nvGcuWnBo11R+yaJIWfxSobqnRwwjEg8mwLiiySkuzkJDN9o53aQZIna9ZdG9MvX9ttyk
 HFGWvDqQYxkw5vueJBZKRd8UxDz4QuBPTa/lBIUDY8Sa4jvgo/e2PNV//gt4TsZVZc7uCPuDRh
 jkI1rNf9zCSiRyANFXRxlb8udNN3eMpLQ5EDaKUBwKZ1rY+OeBMKEJmowpsjrF6WVNjMSxkzzQ
 ZqA=
X-SBRS: 2.7
X-MesageID: 4146681
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4146681"
Date: Wed, 7 Aug 2019 18:07:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <devel@edk2.groups.io>, <anthony.perard@citrix.com>
Message-ID: <20190807160703.2hkbpyvodevuwuhz@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-34-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-34-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 33/35] OvmfPkg: Introduce
 XenIoPvhDxe to initialize Grant Tables
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

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6NDJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gWGVuSW9QdmhEeGUgdXNlIFhlbklvTW1pb0xpYiB0byByZXNlcnZlIHNvbWUgc3Bh
Y2UgdG8gYmUgdXNlIGJ5IHRoZQo+IEdyYW50IFRhYmxlcy4KPiAKPiBUaGUgY2FsbCBpcyBvbmx5
IGRvbmUgaWYgaXQgaXMgbmVjZXNzYXJ5LCB3ZSBzaW1wbHkgZGV0ZWN0IGlmIHRoZQo+IGd1ZXN0
IGlzIFBWSCwgYXMgaW4gdGhpcyBjYXNlIHRoZXJlIGlzIGN1cnJlbnRseSBubyBQQ0kgYnVzLCBh
bmQgbm8KPiBQQ0kgWGVuIHBsYXRmb3JtIGRldmljZSB3aGljaCB3b3VsZCBzdGFydCB0aGUgWGVu
SW9QY2lEeGUgYW5kIGFsbG9jYXRlCj4gdGhlIHNwYWNlIGZvciB0aGUgR3JhbnQgVGFibGVzLgoK
U2luY2UgSSdtIG5vdCBmYW1pbGlhciB3aXRoIE9WTUYgY29kZSwgd2hlcmUgaXMgdGhlIGdyYW50
IHRhYmxlCnBoeXNpY2FsIG1lbW9yeSBjb21pbmcgZnJvbSB0aGVuLCBpcyBpdCBhbGxvY2F0ZWQg
ZnJvbSBhIGhvbGUgaW4gdGhlCm1lbW9yeSBtYXA/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
