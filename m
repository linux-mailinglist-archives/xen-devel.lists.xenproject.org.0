Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906F7FC8B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 16:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htYqW-0007EQ-1m; Fri, 02 Aug 2019 14:47:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1htYqU-0007EK-LX
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 14:47:50 +0000
X-Inumbo-ID: 7ee7c6e9-b534-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7ee7c6e9-b534-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 14:47:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6E8FAC91;
 Fri,  2 Aug 2019 14:47:47 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Fri,  2 Aug 2019 16:47:46 +0200
Message-Id: <20190802144746.18653-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fixes for 5.3-rc3
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjNhLXJjMy10YWcKCnhlbjogZml4ZXMgZm9yIDUuMy1yYzMKCkl0IGNvbnRhaW5zOgotIGEgc21h
bGwgY2xlYW51cAotIGEgZml4IGZvciBhIGJ1aWxkIGVycm9yIG9uIEFSTSB3aXRoIHNvbWUgY29u
ZmlncwotIGEgZml4IG9mIGEgcGF0Y2ggZm9yIHRoZSBYZW4gZ250ZGV2IGRyaXZlcgotIDMgcGF0
Y2hlcyBmb3IgZml4aW5nIGEgcG90ZW50aWFsIHByb2JsZW0gaW4gdGhlIHN3aW90bGIteGVuIGRy
aXZlcgogIHdoaWNoIEtvbnJhZCB3YXMgZmluZSB3aXRoIG1lIGNhcnJ5aW5nIHRoZW0gdGhyb3Vn
aCB0aGUgWGVuIHRyZWUKClRoYW5rcy4KCgpKdWVyZ2VuCgogZHJpdmVycy94ZW4vZ250ZGV2LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy94ZW4vcHJpdmNtZC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzNSArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jICAgICAgICAgICAgICAgICAgICAgICB8IDM0ICsr
KysrKystLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFj
ZV9jYXBhYmlsaXR5LmMgfCAgMyArLS0KIGRyaXZlcnMveGVuL3hsYXRlX21tdS5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51
eC9wYWdlLWZsYWdzLmggICAgICAgICAgICAgICAgICAgICAgfCAgNCArKysKIGluY2x1ZGUveGVu
L3hlbi1vcHMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCiA3IGZpbGVzIGNo
YW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQoKQXJuZCBCZXJnbWFubiAo
MSk6CiAgICAgIHhlbjogYXZvaWQgbGluayBlcnJvciBvbiBBUk0KCkp1ZXJnZW4gR3Jvc3MgKDMp
OgogICAgICB4ZW4vc3dpb3RsYjogZml4IGNvbmRpdGlvbiBmb3IgY2FsbGluZyB4ZW5fZGVzdHJv
eV9jb250aWd1b3VzX3JlZ2lvbigpCiAgICAgIHhlbi9zd2lvdGxiOiBzaW1wbGlmeSByYW5nZV9z
dHJhZGRsZXNfcGFnZV9ib3VuZGFyeSgpCiAgICAgIHhlbi9zd2lvdGxiOiByZW1lbWJlciBoYXZp
bmcgY2FsbGVkIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24oKQoKU291cHRpY2sgSm9hcmRl
ciAoMSk6CiAgICAgIHhlbi9nbnRkZXYuYzogUmVwbGFjZSB2bV9tYXBfcGFnZXMoKSB3aXRoIHZt
X21hcF9wYWdlc196ZXJvKCkKCll1ZUhhaWJpbmcgKDEpOgogICAgICB4ZW4vcGNpYmFjazogcmVt
b3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ29sZF9zdGF0ZScKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
