Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29A85DE9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:11:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvePL-0002lK-RQ; Thu, 08 Aug 2019 09:08:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvePJ-0002l3-Vv
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:08:26 +0000
X-Inumbo-ID: 127c7d92-b9bc-11e9-88f6-cfedfb388e52
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 127c7d92-b9bc-11e9-88f6-cfedfb388e52;
 Thu, 08 Aug 2019 09:08:23 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z8WZ3iuy+PUAFzvvFvSM9v8VewJhLUyiw/0ytFvDuR3moCIAeRwR/mtkyKqVFFA4UBY9ZYZA/i
 a7M6sYMklh82p8TqRC7TrSLwORZdIIpYAwTP02DQHUGs3h0ItAzkvRrZ0MlEXpThu2+Ffx5TtN
 JMl6JHDk+UlGwwx0JCly1DE7HtRqV9TZwKREgT0XvFgOIeC+HvI9r4zfakePyI8ElUSstCSkqW
 DCjj23t0SctTHeVfpIG3eDenx8bkkDXLXZAXGNMTc+9r/azvUZnUcIVYeqQ+t5mJLWBMNG2wFR
 ES8=
X-SBRS: 2.7
X-MesageID: 4059692
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4059692"
Date: Thu, 8 Aug 2019 10:08:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Message-ID: <20190808090818.GP1242@perard.uk.xensource.com>
References: <20190726162723.7443-1-chen.zhang@intel.com>
 <9CFF81C0F6B98A43A459C9EDAD400D780620FC72@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9CFF81C0F6B98A43A459C9EDAD400D780620FC72@shsmsx102.ccr.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH V4] tools/libxl: Add iothread support for
 COLO
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDI6NDQ6NDJBTSArMDAwMCwgWmhhbmcsIENoZW4gd3Jv
dGU6Cj4gUGluZy4uLgo+IEFueSBjb21tZW50cz8KCkZvciB5b3VyIGluZm9ybWF0aW9uLCB0aGF0
IHBhdGNoIGhhdmUgYmVlbiBwdXNoZWQsIHNlZSBjb21taXQKMTc0ZGIyOGJiODIzZThjOThjMzE5
ZmRiZGM2ZDRjYmUxMDUwYmExNCA7LSkKCkNoZWVycywKCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
