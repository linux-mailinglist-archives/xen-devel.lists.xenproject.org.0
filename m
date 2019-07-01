Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65375BC58
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 15:05:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhvwi-0003yO-Kv; Mon, 01 Jul 2019 13:02:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xse4=U6=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hhvwg-0003yJ-QI
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 13:02:10 +0000
X-Inumbo-ID: 6f317861-9c00-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6f317861-9c00-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 13:02:09 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U2we7DrSBQyHuW1ZB6UGAj5R2ppgqZ+lFIFGc4r/Hak1h4RUELfJab9RTIFiYdTQFkpbridUCj
 sHRNJXkoFp3lkiH1b8ZPKveA6NbLxlPOyZ1iBVKE2djNfJ3RFvt3EQYQKgTemA7LcvY+BONSE9
 TrA9vaeGlcNk7GqiS6XztUiuozJJNIG1E/3z9sfg7J0tBLgVJIXY9+p8Sknivs2ZaI55cIftAu
 sqCsxRTsPoNlsLVpHOTgTX8O7HYVkU+hMM+AkeCQVm0XqrgfZBiN9Vu2A4fm8ozO5nsBjINUaq
 Ggs=
X-SBRS: 2.7
X-MesageID: 2458970
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,439,1557201600"; 
   d="scan'208";a="2458970"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23834.1072.379783.477387@mariner.uk.xensource.com>
Date: Mon, 1 Jul 2019 14:01:36 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <1cf4768d-6bcd-05ce-d10f-4cbc11eb0cfb@suse.com>
References: <osstest-138307-mainreport@xen.org>
 <23833.55752.614954.80320@mariner.uk.xensource.com>
 <1cf4768d-6bcd-05ce-d10f-4cbc11eb0cfb@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC43LXRlc3RpbmcgdGVzdF0gMTM4MzA3OiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBPbiAwMS4wNy4yMDE5IDEyOjAwLCBJYW4gSmFja3NvbiB3
cm90ZToKPiA+IG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cml0ZXMgKCJbeGVuLTQuNy10ZXN0aW5n
IHRlc3RdIDEzODMwNzogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gPj4gZmxpZ2h0IDEzODMwNyB4
ZW4tNC43LXRlc3RpbmcgcmVhbCBbcmVhbF0KPiA+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4MzA3Lwo+ID4+Cj4gPj4gUmVncmVzc2lvbnMgOi0o
Cj4gPj4KPiA+PiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywK
PiA+PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiA+PiAgIGJ1aWxk
LWkzODYtcHJldiAgICAgICAgICAgICAgIDYgeGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwg
UkVHUi4gdnMuIDEzMzU5Ngo+ID4+ICAgYnVpbGQtYW1kNjQtcHJldiAgICAgICAgICAgICAgNiB4
ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMzNTk2Cj4gPiAKPiA+IFRo
aXMgaXMgbm90IGV4cGVjdGVkLiAgQnV0IHRoaXMgYnJhbmNoIGlzIG91dCBvZiBzZWN1cml0eSBz
dXBwb3J0IGFuZAo+ID4gdGhlIG9ubHkgZWZmZWN0IGlzIHRoYXQgd2UgY291bGQgbm90IGRvIHRo
ZSA0LjYgdG8gNC43IG1pZ3JhdGlvbiB0ZXN0Lgo+IAo+IEkndmUgdGFrZW4gYSBsb29rIC0gaXQn
cyB0aGUgT1ZNRiBidWlsZCB0aGF0IGZhaWxzLgoKT2gsIG1heWJlIHRoZSB2ZXJzaW9uIHBsdW1i
aW5nIGlzIHdyb25nIHNvbWVob3cuICBJIGRvbid0IHRoaW5rIGl0IGlzCnJlYWxseSB3b3J0aCBp
bnZlc3RpZ2F0aW5nLgoKPiA+IFVubGVzcyBzb21lb25lIG9iamVjdHMgSSB3aWxsIGZvcmNlIHB1
c2ggaXQuCj4gCj4gSSdkIHNheSAtIGdvIGFoZWFkLgoKU28sIHRoYW5rcyBmb3IgeW91ciBmZWVk
YmFjay4gIE5vdyBkb25lLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
