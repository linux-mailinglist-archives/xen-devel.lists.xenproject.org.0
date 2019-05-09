Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D981C18871
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 12:39:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOgPN-0006Nh-T7; Thu, 09 May 2019 10:36:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DbYa=TJ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hOgPM-0006Nc-6X
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 10:36:12 +0000
X-Inumbo-ID: 425bc764-7246-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 425bc764-7246-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 10:36:10 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: /YU+GIR+/w5/3om7TZgMiNjhmpG8lzk5LOrcc0/yDBg4bDK+wPIwyhnW08V21RQqCjtyjABFCd
 QbPnwmt8T99bOL52UqhhPbi2qe6+9tCmxy7jOniEuqSBOyjxfFncRUcnRuWNUe6pGMuWY3odjn
 Q/ZwuQ48TvjyqsbyCEbw749twR/nqybgVci2gMqK8uNcxIU3JNXwMullpBzhl92foxjc1cZtvg
 ppgaz3TtP2IL9OFjjpv9xBoO1N5JYMkGiSPEj/GZ+q9RPK+ntQwh85Bj+f61HOnyax4M6yPrPN
 83o=
X-SBRS: 2.7
X-MesageID: 238973
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,449,1549947600"; 
   d="scan'208";a="238973"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23764.633.90558.405335@mariner.uk.xensource.com>
Date: Thu, 9 May 2019 11:35:37 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-135805-mainreport@xen.org>
References: <osstest-135805-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.12-testing test] 135805: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC4xMi10ZXN0aW5nIHRlc3RdIDEz
NTgwNTogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDEzNTgwNSB4ZW4tNC4xMi10ZXN0
aW5nIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzLzEzNTgwNS8KPiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBk
aWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2gg
Y291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xY293MiAgICAxNyBndWVz
dC1sb2NhbG1pZ3JhdGUveDEwICAgZmFpbCBSRUdSLiB2cy4gMTMzOTg5Cj4gCgpUaGUgb25seSBy
ZWdyZXNzaW9uIHJlcG9ydGVkIGhlcmUgaXMgdGhpcywgdGhlIGtub3duIHFjb3cyIHN0cmV0Y2gK
cmVncmVzc2lvbi4gIFNvIEkgaGF2ZSBmb3JjZSBwdXNoZWQgdGhpcy4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
