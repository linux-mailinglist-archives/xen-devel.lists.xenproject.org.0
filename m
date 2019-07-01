Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56F65B88D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 12:04:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hht7i-0002GA-A4; Mon, 01 Jul 2019 10:01:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xse4=U6=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hht7g-0002G4-Bm
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 10:01:20 +0000
X-Inumbo-ID: 2b943e42-9be7-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b943e42-9be7-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 10:01:18 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K4NGobQhe6kZF826VtAA9FiM0UzE5zHfYhi9s1+M487w8K/jO6Md++kd1j8O1Gb0upPsdSB/Mj
 XlhROGStV6+PEfyqNp1MAWWX4MFWHec1MMWb3b8fdW8rCGTN4fRGZguszk+XEJwbaPBKG5xSdB
 u7oQwBm9X60AEn5W5+DYUqnmG7iQTYA82houasIGcNomNmEBtUxTz1UDtNfW9d4mphkz94G646
 jeAivW8illqzYzWS257oRS94mKVjsAJ8EluDJhhkhxfK3CN1dqiimEekjMtbaqjf2TWTtn27SJ
 /c8=
X-SBRS: 2.7
X-MesageID: 2454829
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,438,1557201600"; 
   d="scan'208";a="2454829"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23833.55752.614954.80320@mariner.uk.xensource.com>
Date: Mon, 1 Jul 2019 11:00:40 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-138307-mainreport@xen.org>
References: <osstest-138307-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.7-testing test] 138307: regressions - FAIL
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
Cc: Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC43LXRlc3RpbmcgdGVzdF0gMTM4
MzA3OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTM4MzA3IHhlbi00LjctdGVzdGlu
ZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncy8xMzgzMDcvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlk
IG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNv
dWxkIG5vdCBiZSBydW46Cj4gIGJ1aWxkLWkzODYtcHJldiAgICAgICAgICAgICAgIDYgeGVuLWJ1
aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzU5Ngo+ICBidWlsZC1hbWQ2NC1w
cmV2ICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZz
LiAxMzM1OTYKClRoaXMgaXMgbm90IGV4cGVjdGVkLiAgQnV0IHRoaXMgYnJhbmNoIGlzIG91dCBv
ZiBzZWN1cml0eSBzdXBwb3J0IGFuZAp0aGUgb25seSBlZmZlY3QgaXMgdGhhdCB3ZSBjb3VsZCBu
b3QgZG8gdGhlIDQuNiB0byA0LjcgbWlncmF0aW9uIHRlc3QuCgpVbmxlc3Mgc29tZW9uZSBvYmpl
Y3RzIEkgd2lsbCBmb3JjZSBwdXNoIGl0LgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
