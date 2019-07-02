Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6C5D4D3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:52:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLyi-0002vB-6g; Tue, 02 Jul 2019 16:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PGFi=U7=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hiLyg-0002uz-9x
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:49:58 +0000
X-Inumbo-ID: 6bb2e4f4-9ce9-11e9-aaf2-7b381e117c83
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bb2e4f4-9ce9-11e9-aaf2-7b381e117c83;
 Tue, 02 Jul 2019 16:49:56 +0000 (UTC)
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
IronPort-SDR: abQljjXjEERo7Oyj7Jmt+JkzTqzb3e6R2hIyIOdedktcTpCxlTOxGhS5Ia1duY2BUcguQ7Qeuc
 iTpydoPC2dy1Yj430jrKC9aUpkgkDLFWcn2dfBVIrmB4/lzgQ+CWwgu8yTM1iDEa25ZFnULPxk
 /kG6PgwQdNcIRiM8InpZxqQp21EH0uFGi3R+avoxnwNRr2VLjG6OkdFbeZVTXx7Gsw9mQJ40rL
 E5zDehhqHTr8n/0+/GQRkv9jUtdNr1QY7fU8wbEEEgeJI2hWtd0g+PKclobF1ejUewt7XOXv9A
 8UI=
X-SBRS: 2.7
X-MesageID: 2532391
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2532391"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23835.35589.764355.286423@mariner.uk.xensource.com>
Date: Tue, 2 Jul 2019 17:49:09 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-138673-mainreport@xen.org>
References: <osstest-138673-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.7-testing test] 138673: regressions -
 trouble: blocked/broken/fail/pass
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

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC43LXRlc3RpbmcgdGVzdF0gMTM4
NjczOiByZWdyZXNzaW9ucyAtIHRyb3VibGU6IGJsb2NrZWQvYnJva2VuL2ZhaWwvcGFzcyIpOgo+
IGZsaWdodCAxMzg2NzMgeGVuLTQuNy10ZXN0aW5nIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzODY3My8KPiAKPiBSZWdyZXNz
aW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2lu
ZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hcm02
NC1hcm02NC14bC10aHVuZGVyeCAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tl
bgo+ICBidWlsZC1pMzg2LXByZXYgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAgICAgICAg
ICAgICBmYWlsIFJFR1IuIHZzLiAxMzM1OTYKPiAgYnVpbGQtYW1kNjQtcHJldiAgICAgICAgICAg
ICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMzNTk2CgpJIGhh
dmUganVzdCBwdXNoZWQgcGF0Y2hlcyB0byBvc3N0ZXN0IHdoaWNoIEkgaG9wZSB3aWxsIGZpeCB0
aGlzLgoKVW50aWwgdGhvc2UgZ2V0IHRocm91Z2gsIEkgZXhwZWN0IGJvdGggdGhlIFhlbiA0Ljcg
YW5kIDQuOCBicmFuY2hlcyB0bwpmYWlsLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
