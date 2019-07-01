Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6205C0C3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhyg7-00037Y-AJ; Mon, 01 Jul 2019 15:57:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hv+X=U6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hhyg6-00037S-0L
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:57:14 +0000
X-Inumbo-ID: e2db493a-9c18-11e9-b2e2-4f04f842fd4c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2db493a-9c18-11e9-b2e2-4f04f842fd4c;
 Mon, 01 Jul 2019 15:57:11 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4TsFOgXxFyxxyhJCu/ZLdI5HDqpXpzn6eiDOnZUzLtUWu68h3yE56cm1unDDTc5yMxzlb7p7aC
 HD0LxNYHQy+9QmV9Uu80MtpyMqHy3Jh4CyM9c1TcuGLn39S4UfMfNMRtLBCF1n6Nq18+NA5sHD
 lAk3C8Asnwz5ENTyCU6VIO4NwZleknndnZPIdu+8ZBee8S8oO1p+3N6E5+mbO0vWRW3YKNlrL9
 RC/2ciSpVHjYA7d02NXmQytBg0437YsdwXbYAqPV9zDIpreeevQIfNWnAFCsRM0BVbotDOWTwf
 X90=
X-SBRS: 2.7
X-MesageID: 2469613
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,439,1557201600"; 
   d="scan'208";a="2469613"
Date: Mon, 1 Jul 2019 16:57:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190701155708.GL13449@perard.uk.xensource.com>
References: <20190617161050.4684-1-anthony.perard@citrix.com>
 <20190701150443.GJ13449@perard.uk.xensource.com>
 <e65a329b-03e3-1beb-d91a-2724b9098fe9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e65a329b-03e3-1beb-d91a-2724b9098fe9@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] Ping: [PATCH] Config.mk: update OVMF to
 edk2-stable201905
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDM6MTk6MjlQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDEuMDcuMjAxOSAxNzowNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBPbiBN
b24sIEp1biAxNywgMjAxOSBhdCAwNToxMDo1MFBNICswMTAwLCBBbnRob255IFBFUkFSRCB3cm90
ZToKPiA+PiBVcGRhdGUgdG8gdGhlIGxhdGVzdCBzdGFibGUgdGFnLgo+ID4+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiAK
PiA+IENvdWxkIG9uZSBvZiB5b3UgY29tbWl0IHRoaXMgcGF0Y2g/Cj4gCj4gSSB3YXMgd29uZGVy
aW5nIHdoYXQgdGhlIHBvbGljeSBoZXJlIGlzIC0gZG8gc3VjaCB1cGRhdGVzIGdvIGluCj4gd2l0
aG91dCBhbnkgYWNrcz8KCldlbGwsIHRoZSBmaWxlIENvbmZpZy5tayBpcyBtYWludGFpbmVkIGJ5
IFRIRSBSRVNULCBidXQgdGhlIG92bWYgdHJlZSBpcwptYWludGFpbmVkIGJ5IFdlaSBhbmQgbWUu
IFNvLCB3ZSBjYW4gd2FpdCBmb3IgV2VpIHRvIHB1dCBoaXMgYWNrLCBvcgpqdXN0IGhhdmUgb25l
IG9mIFRIRSBSRVNUIG1haW50YWluZXIgcHV0IGEgYWNrIHdvdWxkIGJlIGVub3VnaCBJIHRoaW5r
LgoKQXMgZm9yIGEgcG9saWN5IGZvciBzdWNoIHVwZGF0ZXMsIHRoZXkgb2Z0ZW4gc2VlbXMgdG8g
Z28gaW4gd2l0aG91dCBhbnkKYWNrcy4gUmVjZW50IHVwZGF0ZXMgb2YgbWluaS1vcywgcWVtdS10
cmFkLCBzZWFiaW9zIGRvbid0IGhhdmUgYWNrcy4KSXQncyB0aGUgc2FtZSBmb3IgcWVtdS14ZW4s
IGJ1dCB0aGF0IHRyZWUgaXMgZ2F0ZWQgYnkgb3NzdGVzdC4KClRoYW5rcywKCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
