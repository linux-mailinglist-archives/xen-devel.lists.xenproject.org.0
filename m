Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BC87383
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 09:54:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvzgi-0006EG-8b; Fri, 09 Aug 2019 07:51:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qfww=WF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvzgh-0006EB-A2
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 07:51:47 +0000
X-Inumbo-ID: 868fc5e0-ba7a-11e9-88c6-fbfa7bcab0ea
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 868fc5e0-ba7a-11e9-88c6-fbfa7bcab0ea;
 Fri, 09 Aug 2019 07:51:42 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zY2+gc2tujiweYUw5E2s6+qw1hEfjTgPhlSvHiT2pikbRKCKlg9wLRJGwanGuuYJF6i0A4t0vL
 ntcJIjPuSj8l8V1zG3RACbMhuLxN+EmcHgHYOmPh4IjBivnjIb/Butz0LNuoJ5W7SgO6H/3qqX
 p101zH9F+GXOEDXlYWocgITOoIOj0P3hLyMvt/uf/jHPc+Dhuy/JL3TEWNr7EzQp84zF7IMb0Z
 +hex7PfNS6+JmN5KldsY91MiFOFMUKRvJiEJVDQmA1KE9MjF1pNgqSl7hA2LjXVrCd0XdnTcJJ
 YyY=
X-SBRS: 2.7
X-MesageID: 4078227
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4078227"
Date: Fri, 9 Aug 2019 09:51:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190809075131.ht7wvbv3yqeho76k@Air-de-Roger>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
 <20190809020137.27334-2-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809020137.27334-2-marmarek@invisiblethingslab.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] tools/tests/cpu-policy: disable
 -Wformat-overflow
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDQ6MDE6MzdBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IEdDQzkgY29tcGxhaW5zIGFib3V0ICIlLjEycyIgZm9ybWF0
IHdpdGggYW4gYXJndW1lbnQgaGF2aW5nIGV4YWN0bHkgMTIKPiBieXRlcyBhbmQgbm8gdGVybWlu
YXRpbmcgbnVsbCBjaGFyYWN0ZXIuIFRoaXMgaXMgaW50ZW50aW9uYWwKPiBjb25zdHJ1Y3QsIHNv
IGRpc2FibGUgdGhlIHdhcm5pbmcuCgpJSVJDIHRoaXMgaXMgZGVlbWVkIGFzIGEgZ2NjIGJ1Zywg
YWxiZWl0IEknbSBub3Qgc3VyZSBob3cgd2UgYXJlCnN1cHBvc2VkIHRvIHdvcmthcm91bmQgaXQ6
CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTktMDcvbXNnMDE3MTIuaHRtbAoKRGlzYWJsaW5nIHRoZSBjaGVjayB3aG9sZXNhbGUgc2VlbXMg
bGlrZSBhIGJpZyBoYW1tZXIuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
