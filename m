Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812B8505C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOCh-0000fg-1R; Wed, 07 Aug 2019 15:50:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvOCf-0000fX-JL
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:50:17 +0000
X-Inumbo-ID: 0bc8eeea-b92b-11e9-b839-fbbac45af590
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bc8eeea-b92b-11e9-b839-fbbac45af590;
 Wed, 07 Aug 2019 15:50:14 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: S9/Sr9O7urngSVOxAm7LuOafi4j0OK44WgEKkRP5Q8eQfslqjcwmJKmZ8ppO4KuedHzUYnGRgq
 PifcepwHZbK85U3rxAotqk3U/mVBoOoQoykhBgKkQaWg1gxIoLEWv5uzKURikVN8nDXsbFgeY3
 JuuB8dqzjbKLs28rlQg35lu/U4MbV4rbEe9KGQK6Jx1bK0zOXi0RErZUoX26M8UdXJSpG6xhG/
 3vydPez5yGlkwn/bTiyiaeu2X0Rq9CshAztw1agxjiM7J5WjFZMd1cyzL3gBP6NLgTLrQ59r/i
 m+I=
X-SBRS: 2.7
X-MesageID: 4027207
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4027207"
Date: Wed, 7 Aug 2019 17:50:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <devel@edk2.groups.io>, <anthony.perard@citrix.com>
Message-ID: <20190807155005.b5tyxlwjfoo6urko@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-29-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-29-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 28/35]
 OvmfPkg/PlatformBootManagerLib: Handle the absence of PCI bus on Xen PVH
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

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6MzdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gV2hlbiBydW5uaW5nIGluIGEgWGVuIFBWSCBndWVzdCwgdGhlcmUncyBub3RoaW5n
IHRvIGRvIGluCj4gUGNpQWNwaUluaXRpYWxpemF0aW9uKCkgYmVjYXVzZSB0aGVyZSBpc24ndCBh
bnkgUENJIGJ1cy4gV2hlbiB0aGUgSG9zdAo+IEJyaWRnZSBESUQgaXNuJ3QgcmVjb2duaXNlZCwg
c2ltcGx5IGNvbnRpbnVlLiAoVGhlIHZhbHVlIG9mCj4gUGNkT3ZtZkhvc3RCcmlkZ2VQY2lEZXZJ
ZCB3b3VsZCBiZSAwIGJlY2F1c2UgaXQgaXNuJ3Qgc2V0LikKCkkgZ3Vlc3Mgd2Ugd2lsbCBuZWVk
IHRvIGZpZ3VyZSBvdXQgaG93IHRvIG1ha2UgT1ZNRiBoYXBweSB3aGVuCnBhc3N0aHJvdWdoIHN1
cHBvcnQgaXMgYWRkZWQgdG8gUFZILiBIYXZpbmcgdG8gZmFrZSBhIGJyaWRnZSBpcyBxdWl0ZQpj
dW1iZXJzb21lLCBidXQgSSBhc3N1bWUgT1ZNRiBvbmx5IHBva2VzIGF0IHNvbWUgc3BlY2lmaWMg
YnJpZGdlCnJlZ2lzdGVycyB3aGljaCB3ZSBtaWdodCBiZSBhYmxlIHRvIGVtdWxhdGUgd2l0aG91
dCBtdWNoIGZ1c3MuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
