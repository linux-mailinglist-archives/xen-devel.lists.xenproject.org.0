Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96310720
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:47:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmke-0005HN-SN; Wed, 01 May 2019 10:46:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmkc-0005HG-Qu
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:46:10 +0000
X-Inumbo-ID: 54390c00-6bfe-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 54390c00-6bfe-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 10:46:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837227"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:46:04 +0100
Message-ID: <20190501104604.21416-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] Drop Xen 4.5 and earlier
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
Cc: committers@xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgcmVsZWFzZXMgYXJlIG91dCBvZiBzZWN1cml0eSBzdXBwb3J0LiAgVGhleSBhcmUga25v
d24gbm90IHRvCmJ1aWxkIG9uIERlYmlhbiBzdHJldGNoLCB3aGljaCBpcyB3aGF0IHdlIGFyZSB1
c2luZywgYW5kIHdlIGRvIG5vdAppbnRlbmQgdG8gZXZlciB1cGRhdGUgdGhlbSB0byBmaXggdGhh
dC4KClhlbiA0LjYgaXMgYWxzbyBvdXQgb2Ygc2VjdXJpdHkgc3VwcG9ydCBidXQgd2Ugd2FudCBv
c3N0ZXN0IHRvIGJlIGFibGUKdG8gY29udGludWUgdG8gYnVpbGQgaXQgc28gdGhhdCB3ZSBjYW4g
dGVzdCA0LjYtPjQuNyBtaWdyYXRpb24sIGZvcgp0aGUgcHVycG9zZXMgb2YgdGVzdGluZyBYZW4g
NC43LCB3aGljaCBpcyBzdGlsbCBzdXBwb3J0ZWQgcmlnaHQgbm93LgoKU28gd2UgaGF2ZSByZWNl
bnRseSBhcHBsaWVkIHNvbWUgYnVpbGQgZml4ZXMgdG8gdGhlIDQuNiB0cmVlLCBhbmQgZm9yCm5v
dyB3ZSByZXRhaW4gNC42IGluIG9zc3Rlc3Qgc28gdGhhdCBidWlsZCBmaXhlcyBhcHBsaWVkIHRv
CnN0YWdpbmctNC42IGNhbiBwcm9wYWdhdGUgdG8gc3RhYmxlLTQuNi4KCkNDOiBjb21taXR0ZXJz
QHhlbnByb2plY3Qub3JnClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgotLS0KIGNyLWZvci1icmFuY2hlcyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2NyLWZvci1icmFu
Y2hlcyBiL2NyLWZvci1icmFuY2hlcwppbmRleCAwYWMzYTk3ZC4uYmM5Y2UyZDMgMTAwNzU1Ci0t
LSBhL2NyLWZvci1icmFuY2hlcworKysgYi9jci1mb3ItYnJhbmNoZXMKQEAgLTMxLDcgKzMxLDcg
QEAgc2NyaXB0b3B0aW9ucz0iJDEiOyBzaGlmdAogTE9HRklMRT10bXAvY3ItZm9yLWJyYW5jaGVz
LmxvZwogZXhwb3J0IExPR0ZJTEUKIAotOiAke0JSQU5DSEVTOj1vc3N0ZXN0IHhlbi00LjAtdGVz
dGluZyB4ZW4tNC4xLXRlc3RpbmcgeGVuLTQuMi10ZXN0aW5nIHhlbi00LjMtdGVzdGluZyB4ZW4t
NC40LXRlc3RpbmcgeGVuLTQuNS10ZXN0aW5nIHhlbi00LjYtdGVzdGluZyB4ZW4tNC43LXRlc3Rp
bmcgeGVuLTQuOC10ZXN0aW5nIHhlbi00LjktdGVzdGluZyB4ZW4tNC4xMC10ZXN0aW5nIHhlbi00
LjExLXRlc3RpbmcgeGVuLTQuMTItdGVzdGluZyB4ZW4tdW5zdGFibGUgcWVtdS1tYWlubGluZSBx
ZW11LXVwc3RyZWFtLXVuc3RhYmxlIHFlbXUtdXBzdHJlYW0tNC4yLXRlc3RpbmcgcWVtdS11cHN0
cmVhbS00LjMtdGVzdGluZyBxZW11LXVwc3RyZWFtLTQuNC10ZXN0aW5nIHFlbXUtdXBzdHJlYW0t
NC41LXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjYtdGVzdGluZyBxZW11LXVwc3RyZWFtLTQuNy10
ZXN0aW5nIHFlbXUtdXBzdHJlYW0tNC44LXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjktdGVzdGlu
ZyBxZW11LXVwc3RyZWFtLTQuMTAtdGVzdGluZyBxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyBx
ZW11LXVwc3RyZWFtLTQuMTItdGVzdGluZyBsaW51eC1saW51cyBsaW51eC00LjE5IGxpbnV4LTQu
MTQgbGludXgtNC45IGxpbnV4LTQuNCBsaW51eC00LjEgbGludXgtMy4xOCBsaW51eC0zLjE2IGxp
bnV4LTMuMTQgbGludXgtMy4xMCBsaW51eC0zLjQgbGludXgtYXJtLXhlbiBzZWFiaW9zIG92bWYg
eHRmICR7RVhUUkFfQlJBTkNIRVN9fQorOiAke0JSQU5DSEVTOj1vc3N0ZXN0IHhlbi00LjYtdGVz
dGluZyB4ZW4tNC43LXRlc3RpbmcgeGVuLTQuOC10ZXN0aW5nIHhlbi00LjktdGVzdGluZyB4ZW4t
NC4xMC10ZXN0aW5nIHhlbi00LjExLXRlc3RpbmcgeGVuLTQuMTItdGVzdGluZyB4ZW4tdW5zdGFi
bGUgcWVtdS1tYWlubGluZSBxZW11LXVwc3RyZWFtLXVuc3RhYmxlIHFlbXUtdXBzdHJlYW0tNC42
LXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjctdGVzdGluZyBxZW11LXVwc3RyZWFtLTQuOC10ZXN0
aW5nIHFlbXUtdXBzdHJlYW0tNC45LXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjEwLXRlc3Rpbmcg
cWVtdS11cHN0cmVhbS00LjExLXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjEyLXRlc3RpbmcgbGlu
dXgtbGludXMgbGludXgtNC4xOSBsaW51eC00LjE0IGxpbnV4LTQuOSBsaW51eC00LjQgbGludXgt
NC4xIGxpbnV4LTMuMTggbGludXgtMy4xNiBsaW51eC0zLjE0IGxpbnV4LTMuMTAgbGludXgtMy40
IGxpbnV4LWFybS14ZW4gc2VhYmlvcyBvdm1mIHh0ZiAke0VYVFJBX0JSQU5DSEVTfX0KIGV4cG9y
dCBCUkFOQ0hFUwogCiBmZXRjaHdsZW09JHdsZW0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
