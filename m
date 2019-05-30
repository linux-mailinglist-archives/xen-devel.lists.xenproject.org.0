Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E42F9A4
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 11:43:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWHYG-0007Qu-Cn; Thu, 30 May 2019 09:40:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uW51=T6=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hWHYE-0007Qp-Fh
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 09:40:46 +0000
X-Inumbo-ID: ff051e6c-82be-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff051e6c-82be-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 09:40:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
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
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: gaEMim3oJQ6Nuz/TJo0XboCjPJ9pIwB6+42CuJR4rRSueVCzlQsQWNz9m5f95NLkbh0KFty/mB
 1PvQgl+YORtKkGDxMfIhdLLgKjh7HYiDUfJKl3eA8Fj3uRft5abeQOc4tE6fr6q/KGLirUbxd3
 PiuBERNdQDyhoTrmre6BgFDHGcOzPsNW0imcIwfP4we0XF9MH6r6iGJ/CUUvZBgT4UcefEQF5A
 d9yJdgeYwrc+TsQmgBPqd+GKO7hHmOY3cEe9B12drAYjAifbKjy5dTc74cBcdoph4QvNodnnc6
 4nk=
X-SBRS: 2.7
X-MesageID: 1092562
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,530,1549947600"; 
   d="scan'208";a="1092562"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 30 May 2019 10:39:50 +0100
Message-ID: <20190530093950.14952-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] Drop all linux branches 3.18 and earlier
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
Cc: Greg KH <greg@kroah.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

My4xOCBkb2Vzbid0IGJvb3Qgb24gWGVuIGFueSBtb3JlIGFuZCBMaW51eCBzdGFibGUgdXBzdHJl
YW0gc2F5IGl0CndpbGwgbm90IGJlIGZpeGVkIGJlY2F1c2UgaXQncyBFT0wuICBUaGFua3MgdG8g
dGhlbSBmb3IgdGhhdApjb25maXJtYXRpb24uCgpXaGlsZSB3ZSBhcmUgaGVyZSwgZHJvcCBhbGwg
ZWFybGllciBMaW51eCBicmFuY2hlcyB0b28uICBXZSBhcmUKd2FzdGluZyBvdXIgdGltZSBmZXRj
aGluZyB0aGVtLCBzZWVpbmcgaWYgdGhleSBoYXZlIGNoYW5nZWQsIGFuZCB0aGVuCmRvaW5nIG5v
dGhpbmcuCgpDQzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpDQzogR3JlZyBLSCA8Z3JlZ0Brcm9h
aC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgotLS0KIGNyLWZvci1icmFuY2hlcyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2NyLWZvci1icmFuY2hlcyBiL2Ny
LWZvci1icmFuY2hlcwppbmRleCBiYzljZTJkMy4uNDdhZDUwNDEgMTAwNzU1Ci0tLSBhL2NyLWZv
ci1icmFuY2hlcworKysgYi9jci1mb3ItYnJhbmNoZXMKQEAgLTMxLDcgKzMxLDcgQEAgc2NyaXB0
b3B0aW9ucz0iJDEiOyBzaGlmdAogTE9HRklMRT10bXAvY3ItZm9yLWJyYW5jaGVzLmxvZwogZXhw
b3J0IExPR0ZJTEUKIAotOiAke0JSQU5DSEVTOj1vc3N0ZXN0IHhlbi00LjYtdGVzdGluZyB4ZW4t
NC43LXRlc3RpbmcgeGVuLTQuOC10ZXN0aW5nIHhlbi00LjktdGVzdGluZyB4ZW4tNC4xMC10ZXN0
aW5nIHhlbi00LjExLXRlc3RpbmcgeGVuLTQuMTItdGVzdGluZyB4ZW4tdW5zdGFibGUgcWVtdS1t
YWlubGluZSBxZW11LXVwc3RyZWFtLXVuc3RhYmxlIHFlbXUtdXBzdHJlYW0tNC42LXRlc3Rpbmcg
cWVtdS11cHN0cmVhbS00LjctdGVzdGluZyBxZW11LXVwc3RyZWFtLTQuOC10ZXN0aW5nIHFlbXUt
dXBzdHJlYW0tNC45LXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjEwLXRlc3RpbmcgcWVtdS11cHN0
cmVhbS00LjExLXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjEyLXRlc3RpbmcgbGludXgtbGludXMg
bGludXgtNC4xOSBsaW51eC00LjE0IGxpbnV4LTQuOSBsaW51eC00LjQgbGludXgtNC4xIGxpbnV4
LTMuMTggbGludXgtMy4xNiBsaW51eC0zLjE0IGxpbnV4LTMuMTAgbGludXgtMy40IGxpbnV4LWFy
bS14ZW4gc2VhYmlvcyBvdm1mIHh0ZiAke0VYVFJBX0JSQU5DSEVTfX0KKzogJHtCUkFOQ0hFUzo9
b3NzdGVzdCB4ZW4tNC42LXRlc3RpbmcgeGVuLTQuNy10ZXN0aW5nIHhlbi00LjgtdGVzdGluZyB4
ZW4tNC45LXRlc3RpbmcgeGVuLTQuMTAtdGVzdGluZyB4ZW4tNC4xMS10ZXN0aW5nIHhlbi00LjEy
LXRlc3RpbmcgeGVuLXVuc3RhYmxlIHFlbXUtbWFpbmxpbmUgcWVtdS11cHN0cmVhbS11bnN0YWJs
ZSBxZW11LXVwc3RyZWFtLTQuNi10ZXN0aW5nIHFlbXUtdXBzdHJlYW0tNC43LXRlc3RpbmcgcWVt
dS11cHN0cmVhbS00LjgtdGVzdGluZyBxZW11LXVwc3RyZWFtLTQuOS10ZXN0aW5nIHFlbXUtdXBz
dHJlYW0tNC4xMC10ZXN0aW5nIHFlbXUtdXBzdHJlYW0tNC4xMS10ZXN0aW5nIHFlbXUtdXBzdHJl
YW0tNC4xMi10ZXN0aW5nIGxpbnV4LWxpbnVzIGxpbnV4LTQuMTkgbGludXgtNC4xNCBsaW51eC00
LjkgbGludXgtNC40IGxpbnV4LTQuMSBsaW51eC1hcm0teGVuIHNlYWJpb3Mgb3ZtZiB4dGYgJHtF
WFRSQV9CUkFOQ0hFU319CiBleHBvcnQgQlJBTkNIRVMKIAogZmV0Y2h3bGVtPSR3bGVtCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
