Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D66834B6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 17:08:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv11B-0005Oc-VC; Tue, 06 Aug 2019 15:04:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qF5n=WC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hv11A-0005OX-53
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 15:04:52 +0000
X-Inumbo-ID: 89519540-b85b-11e9-b625-fff77a72c226
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89519540-b85b-11e9-b625-fff77a72c226;
 Tue, 06 Aug 2019 15:04:50 +0000 (UTC)
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
IronPort-SDR: ofnf00jz2uD074iHQs3UFgUECVi871d8zf6+ngTDE4NgGPVdww4ERJgu68RLjn3/yrZR52MNTS
 h9ruQsEPPnLP5CJA7UE5sEVxOKOf8xd75tlBrOFIhANTC7aCXcsUzW+S3+qNohDCp01zw2G+/G
 ta1fU6RzP0lS3kpgS/BX8Px66f3IIl10EVc8KhlI6mLv/JHK7UKHn007CYmc14W+8f4mOLSDg8
 Wq1svLHrR9p/QqEtYwS2JJUwcagUNaBRp0WD+1febv6yH/l73nWaMSjuxbxa4WxbId70aDg9wz
 CMA=
X-SBRS: 2.7
X-MesageID: 4054777
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="4054777"
Date: Tue, 6 Aug 2019 17:04:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190806150441.ynlh4cjdlpgajce6@Air-de-Roger>
References: <20190805124301.12887-1-andrew.cooper3@citrix.com>
 <20190805124301.12887-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805124301.12887-5-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/4] x86/desc: Build boot_{,
 compat_}gdt[] in C
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDE6NDM6MDFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAuLi4gd2hlcmUgd2UgY2FuIGF0IGxlYXN0IGdldCB0aGUgY29tcGlsZXIgdG8gZmls
bCBpbiB0aGUgc3Vycm91bmRpbmcgc3BhY2UKPiB3aXRob3V0IGhhdmluZyB0byBkbyBpdCBtYW51
YWxseS4gIFRoaXMgYWxzbyByZXVsdHMgaW4gdGhlIHN5bWJvbHMgaGF2aW5nCj4gcHJvcGVyIHR5
cGUvc2l6ZSBpbmZvcm1hdGlvbiBpbiB0aGUgZGVidWcgc3ltYm9scy4KPiAKPiBSZW9yZGVyICdy
YXcnIGluIHRoZSBzZWdfZGVzY190IHVuaW9uIHRvIGFsbG93IGZvciBlYXNpZXIgaW5pdGlhbGlz
YXRpb24uCj4gCj4gTGVhdmUgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHZhcmlvdXMgcmVzdHJp
Y3Rpb25zIHdlIGhhdmUgb24gYWx0ZXJpbmcgdGhlCj4gR0RUIGxheW91dC4KPiAKPiBObyBmdW5j
dGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
