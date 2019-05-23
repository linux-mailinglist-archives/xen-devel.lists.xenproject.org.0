Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D927A03
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:06:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkaK-0002UD-Eu; Thu, 23 May 2019 10:04:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wok1=TX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hTkaI-0002U7-DA
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:04:26 +0000
X-Inumbo-ID: 24bf5875-7d42-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24bf5875-7d42-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 10:04:25 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: MZRXwCPaPjD0vdZdqYxAN01p3L8pAlLQLbRt/GCZ9UDexxUWlmy01GxAq0QlynsQZTGLs0OO7S
 w4NgH0Ybgz6ylv4XEQ5L7Cs9D6ydLZQk2ZJp2z/9jOVd9M87vd7jfk4+vA7yAAz/ReIcuexGeC
 ux+iFqygwaanLvgWB2N/TZUt7BcuIyMvEIikZAp4Ryo79sKRlGL7O4tiViz75YJPcdaW78aupI
 KkcBIhm7wPEiWwROD797f0tBrqHxKT5Q9Ox6l4F1lY7t7b+Cpp/VvQr8+jRsLdhTzzyiHI7YF2
 k94=
X-SBRS: 2.7
X-MesageID: 820404
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="820404"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23782.28680.411030.121451@mariner.uk.xensource.com>
Date: Thu, 23 May 2019 11:03:52 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190220170001.32614-5-roger.pau@citrix.com>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-5-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 4/6] osstest: introduce a helper to get the
 svn revision of a git commit
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCA0LzZdIG9zc3Rlc3Q6
IGludHJvZHVjZSBhIGhlbHBlciB0byBnZXQgdGhlIHN2biByZXZpc2lvbiBvZiBhIGdpdCBjb21t
aXQiKToKPiBUaGlzIG9ubHkgd29ya3Mgd2hlbiB0aGUgc3ZuIHJldmlzaW9uIGlzIHN0b3JlZCBh
cyBhIGdpdCBub3RlCj4gd2l0aCB0aGUgZm9ybWF0ICdyZXZpc2lvbj08cmV2aXNpb24gbnVtYmVy
PicuCgpXb3cuICBUaGlzIGlzIHByZXR0eSB1Z2x5LgoKPiBTdWNoIGNvbnZlcnNpb24gaXMgcmVx
dWlyZWQgaW4gb3JkZXIgdG8gYm9vdHN0cmFwIGEgRnJlZUJTRCBzeXN0ZW0KPiB3aXRob3V0IHJl
bHlpbmcgb24gZXh0ZXJuYWwgcGFja2FnZSByZXBvc2l0b3JpZXMuIEZyZWVCU0QgYmFzZSBzeXN0
ZW0KPiBvbmx5IGNvbnRhaW5zIGEgc3VidmVyc2lvbiBjbGllbnQgKG5vIGdpdCBjbGllbnQpLCBh
bmQgdGh1cyBpbiBvcmRlcgo+IHRvIGZldGNoIHRoZSBwb3J0cyByZXBvc2l0b3J5ICh0aGF0IGNv
bnRhaW4gdGhlIGV4dGVybmFsIHBhY2thZ2VzCj4gYnVpbGQgbWFrZWZpbGVzKSBzdm4gbXVzdCBi
ZSB1c2VkLgoKZ2l0IG5vdGVzIGhhdmUgc29tZSBkaWZmZXJlbnQgd2F5IG9mIHRyYXZlbGxpbmcg
dGhhbiBjb21taXRzLCBkb24ndAp0aGV5ID8gIFdoZXJlIGlzIHRoaXMgZ2l0IG5vdGUgY29taW5n
IGZyb20gYW5kIGhvdyBkbyB3ZSBrbm93IGl0IGlzCnRoZSByaWdodCBub3RlLCBJWVNXSU0gPwoK
QXNpZGUgZnJvbSB0aGF0LCBwbGVhc2UgYnJlYWsgdGhlIHJlZmFjdG9yaW5nIChpbiB0aGlzIGNh
c2UsIHRoZQpicmVha2luZyBvdXQgb2YgcmVwb19nZXRfcmVhbHVybCkgaW50byBhIHNlcGFyYXRl
IE5GQyBwYXRjaC4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
