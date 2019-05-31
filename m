Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06E30CF9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:59:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWfD0-00046i-4C; Fri, 31 May 2019 10:56:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEsa=T7=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hWfCy-00046a-Gm
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:56:24 +0000
X-Inumbo-ID: ba2fac7c-8392-11e9-9e42-5fc31d4fa707
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba2fac7c-8392-11e9-9e42-5fc31d4fa707;
 Fri, 31 May 2019 10:56:22 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: oFRkq1/Yc3NJfFDaFhp/Vm/hub9c6fMMfnI7rs2MEoMtl4D68G3bwBhVtgU+yQ7vKO+i2gwyuT
 yxqEusrnbDg0s2vPEosKXPiFeCR6HQEYnnSRsjyxJa3uNWZCLDuriSZeB9NUagyopMZakob+c+
 Edo+k/jvstKXDXPtT6guJ16u4AZrYCHzp5CCRa1gga/Lq7QwHQGn3SMyHtHb5A0JOsPt+eOPcC
 hPcoPCKGNso24Ys2Gt1viXv8fGvt5TvzxCAxVYpJayHbXtObrfAHHT5Tvoml6qVL3fENGMeEJp
 c7k=
X-SBRS: 2.7
X-MesageID: 1151810
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,535,1549947600"; 
   d="scan'208";a="1151810"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23793.2095.866136.936682@mariner.uk.xensource.com>
Date: Fri, 31 May 2019 11:55:43 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-137065-mainreport@xen.org>
References: <osstest-137065-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.7-testing test] 137065: regressions - FAIL
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

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC43LXRlc3RpbmcgdGVzdF0gMTM3
MDY1OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTM3MDY1IHhlbi00LjctdGVzdGlu
ZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncy8xMzcwNjUvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlk
IG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNv
dWxkIG5vdCBiZSBydW46Ci4uLgo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTMzNTk2Cj4gIHRlc3QtYW1k
NjQtaTM4Ni1xZW11dS1yaGVsNmh2bS1pbnRlbCAxMCByZWRoYXQtaW5zdGFsbCAgIGZhaWwgUkVH
Ui4gdnMuIDEzMzU5Ngo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtd2luNy1hbWQ2NCAxMCB3
aW5kb3dzLWluc3RhbGwgICBmYWlsIFJFR1IuIHZzLiAxMzM1OTYKCkkgdGhpbmsgc29tZXRoaW5n
IGlzIGJyb2tlbiB3aXRoIEhWTSBpbiBYZW4gNC43LgoKSSBsb29rZWQgYXQgb25lIG9mIHRoZXNl
IGZhaWx1cmVzIChyb3VnaGx5IHRha2VuIGF0IHJhbmRvbSkKICBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3MDY1L3Rlc3QtYW1kNjQtYW1kNjQteGwt
cWVtdXUtZGViaWFuaHZtLWkzODYteHNtL2luZm8uaHRtbAphbmQgdGhlcmUgYXJlICpubyogbG9n
cyBmcm9tIHRoZSBndWVzdC4gIFRoZSBzY3JlZW5zaG90IG9mIHRoZQplbXVsYXRlZCB2Z2Egc3Vn
Z2VzdHMgbm90aGluZyBpbml0aWFsaXNlZCB0aGUgdmdhIGNvbnRyb2xsZXIgZWl0aGVyLgpUaGVy
ZSBzZWVtIHRvIGJlIHZlcnkgZmV3IG1lc3NhZ2VzIGluIHRoZSBzZXJpYWwgbG9nLCB0b28uCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
