Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7B312E7FF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 16:20:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in2Dg-00042b-8A; Thu, 02 Jan 2020 15:17:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in2Df-00042J-IX
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 15:17:03 +0000
X-Inumbo-ID: e8a29972-2d72-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8a29972-2d72-11ea-88e7-bc764e2007e4;
 Thu, 02 Jan 2020 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577978214;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1a9iAb62/dlLw0lWutl/sl24j5poOlFnY5PSCIG05hE=;
 b=F2OMwlDifrN2j0SOmYbHmSz0IAYTVGWjPDtztaoPJ35S2NcXPUc3qTGr
 HqipIfiu/tTrOjWVLBbMxj5uCke1Mkn2MtC3SIsu4a+4or7wYh68IB5VB
 EK3kTgGGjZHJ/9+lSJVegZIIyP9qwQwGwKjYeNTmqGeEeUievvULa4ErK c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +zlMN3B7xzBGykaUSS2NfLoB5cUEY/GS0fIFSvRVP6T2EuDmf5tWQzhVXLihe6WEGMfQf3Apbr
 cdJDRM9WruPeYBD19uVw8QPd+lZ4M7DgQkoUQKOOLYZeo/8EkEBB6cZHzc5c3AKluNTaPMoHYS
 u4tjZ9vyQYhAtRpI2X5/uGcVHYwVVYaFOZqQkwQyc2tOANNnlQpO/R+o6ezPUR72n4tNglZvSP
 6uqvmq6GN+FY6yiNiR3rSCsB539od+pc7/gZkydXtgplZUUgC6Jcy1MtxNda/WqevgszZ2yqvK
 Nyk=
X-SBRS: 2.7
X-MesageID: 10370683
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10370683"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 Jan 2020 15:16:49 +0000
Message-ID: <20200102151649.20748-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] DEVELOPER-CERTIFICATE: Add a copy of the
 Developer Certificate
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIGNvbnZlbnRpb25hbCBmaWxlbmFtZSBmb3IgdGhpcyBhbmQgbWFrZXMgaXQgbW9y
ZQpkaXNjb3ZlcmFibGUuICBUaGUgdGV4dCBpcyBzbWFsbCBlbm91Z2ggdGhhdCB0aGUgY29weSBp
bgpDT05UUklCVVRJTkcgY2FuIHN0YXkgYSBjb3B5LCBJIHRoaW5rLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogQ09OVFJJQlVUSU5H
ICAgICAgICAgIHwgIDYgKysrKystCiBERVZFTE9QRVItQ0VSVElGSUNBVEUgfCAzOCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgREVWRUxPUEVSLUNF
UlRJRklDQVRFCgpkaWZmIC0tZ2l0IGEvQ09OVFJJQlVUSU5HIGIvQ09OVFJJQlVUSU5HCmluZGV4
IDZlYzE0NmJhZjAuLjkyM2QxYTg5ZDYgMTAwNjQ0Ci0tLSBhL0NPTlRSSUJVVElORworKysgYi9D
T05UUklCVVRJTkcKQEAgLTYxLDcgKzYxLDExIEBAIERldmVsb3BlcidzIENlcnRpZmljYXRlIG9m
IE9yaWdpbgogQWxsIHBhdGNoZXMgdG8gdGhlIFhlbiBQcm9qZWN0IGNvZGUgYmFzZSBtdXN0IGlu
Y2x1ZGUgdGhlIGxpbmUKICJTaWduZWQtb2ZmLWJ5OiB5b3VyX25hbWUgPHlvdXJfZW1haWw+IiBh
dCB0aGUgZW5kIG9mIHRoZSBjaGFuZ2UKIGRlc2NyaXB0aW9uLiBUaGlzIGlzIHJlcXVpcmVkIGFu
ZCBpbmRpY2F0ZXMgdGhhdCB5b3UgY2VydGlmeSB0aGUgcGF0Y2gKLXVuZGVyIHRoZSAiRGV2ZWxv
cGVyJ3MgQ2VydGlmaWNhdGUgb2YgT3JpZ2luIiB3aGljaCBzdGF0ZXM6Cit1bmRlciB0aGUgIkRl
dmVsb3BlcidzIENlcnRpZmljYXRlIG9mIE9yaWdpbiIuCisKK1RoZSBkZWNsYXJhdGlvbiB5b3Ug
YXJlIG1ha2luZyB3aXRoIHlvdXIgU2lnbmVkLW9mZi1ieSBjYW4gYmUKK2ZvdW5kIGluIHhlbi5n
aXQgaW4gdGhlIGZpbGUgREVWRUxPUEVSLUNFUlRJRklDQVRFLiAgRm9yIHlvdXIKK2NvbnZlbmll
bmNlLCBoZXJlIGlzIHRoZSBvcGVyYXRpdmUgcGFydDoKIAogICBEZXZlbG9wZXIncyBDZXJ0aWZp
Y2F0ZSBvZiBPcmlnaW4gMS4xCiAKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUi1DRVJUSUZJQ0FURSBi
L0RFVkVMT1BFUi1DRVJUSUZJQ0FURQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi45MTJkMjJlZTllCi0tLSAvZGV2L251bGwKKysrIGIvREVWRUxPUEVSLUNFUlRJRklDQVRF
CkBAIC0wLDAgKzEsMzggQEAKK0RldmVsb3BlciBDZXJ0aWZpY2F0ZSBvZiBPcmlnaW4KK1ZlcnNp
b24gMS4xCisKK0NvcHlyaWdodCAoQykgMjAwNCwgMjAwNiBUaGUgTGludXggRm91bmRhdGlvbiBh
bmQgaXRzIGNvbnRyaWJ1dG9ycy4KKzEgTGV0dGVybWFuIERyaXZlCitTdWl0ZSBENDcwMAorU2Fu
IEZyYW5jaXNjbywgQ0EsIDk0MTI5CisKK0V2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFu
ZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcyBvZiB0aGlzCitsaWNlbnNlIGRvY3VtZW50LCBi
dXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisKKworRGV2ZWxvcGVyJ3MgQ2VydGlmaWNh
dGUgb2YgT3JpZ2luIDEuMQorCitCeSBtYWtpbmcgYSBjb250cmlidXRpb24gdG8gdGhpcyBwcm9q
ZWN0LCBJIGNlcnRpZnkgdGhhdDoKKworKGEpIFRoZSBjb250cmlidXRpb24gd2FzIGNyZWF0ZWQg
aW4gd2hvbGUgb3IgaW4gcGFydCBieSBtZSBhbmQgSQorICAgIGhhdmUgdGhlIHJpZ2h0IHRvIHN1
Ym1pdCBpdCB1bmRlciB0aGUgb3BlbiBzb3VyY2UgbGljZW5zZQorICAgIGluZGljYXRlZCBpbiB0
aGUgZmlsZTsgb3IKKworKGIpIFRoZSBjb250cmlidXRpb24gaXMgYmFzZWQgdXBvbiBwcmV2aW91
cyB3b3JrIHRoYXQsIHRvIHRoZSBiZXN0CisgICAgb2YgbXkga25vd2xlZGdlLCBpcyBjb3ZlcmVk
IHVuZGVyIGFuIGFwcHJvcHJpYXRlIG9wZW4gc291cmNlCisgICAgbGljZW5zZSBhbmQgSSBoYXZl
IHRoZSByaWdodCB1bmRlciB0aGF0IGxpY2Vuc2UgdG8gc3VibWl0IHRoYXQKKyAgICB3b3JrIHdp
dGggbW9kaWZpY2F0aW9ucywgd2hldGhlciBjcmVhdGVkIGluIHdob2xlIG9yIGluIHBhcnQKKyAg
ICBieSBtZSwgdW5kZXIgdGhlIHNhbWUgb3BlbiBzb3VyY2UgbGljZW5zZSAodW5sZXNzIEkgYW0K
KyAgICBwZXJtaXR0ZWQgdG8gc3VibWl0IHVuZGVyIGEgZGlmZmVyZW50IGxpY2Vuc2UpLCBhcyBp
bmRpY2F0ZWQKKyAgICBpbiB0aGUgZmlsZTsgb3IKKworKGMpIFRoZSBjb250cmlidXRpb24gd2Fz
IHByb3ZpZGVkIGRpcmVjdGx5IHRvIG1lIGJ5IHNvbWUgb3RoZXIKKyAgICBwZXJzb24gd2hvIGNl
cnRpZmllZCAoYSksIChiKSBvciAoYykgYW5kIEkgaGF2ZSBub3QgbW9kaWZpZWQKKyAgICBpdC4K
KworKGQpIEkgdW5kZXJzdGFuZCBhbmQgYWdyZWUgdGhhdCB0aGlzIHByb2plY3QgYW5kIHRoZSBj
b250cmlidXRpb24KKyAgICBhcmUgcHVibGljIGFuZCB0aGF0IGEgcmVjb3JkIG9mIHRoZSBjb250
cmlidXRpb24gKGluY2x1ZGluZyBhbGwKKyAgICBwZXJzb25hbCBpbmZvcm1hdGlvbiBJIHN1Ym1p
dCB3aXRoIGl0LCBpbmNsdWRpbmcgbXkgc2lnbi1vZmYpIGlzCisgICAgbWFpbnRhaW5lZCBpbmRl
ZmluaXRlbHkgYW5kIG1heSBiZSByZWRpc3RyaWJ1dGVkIGNvbnNpc3RlbnQgd2l0aAorICAgIHRo
aXMgcHJvamVjdCBvciB0aGUgb3BlbiBzb3VyY2UgbGljZW5zZShzKSBpbnZvbHZlZC4KKwotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
