Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B4112155
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 19:56:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMFtR-0006h6-Hd; Thu, 02 May 2019 17:53:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yl7K=TC=citrix.com=prvs=018ff06f8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMFtP-0006gM-QE
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 17:53:11 +0000
X-Inumbo-ID: 25a67520-6d03-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 25a67520-6d03-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 17:53:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,422,1549929600"; d="scan'208";a="84983426"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 May 2019 18:42:30 +0100
Message-ID: <20190502174238.23848-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
References: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/9] mg-execute-flight: Save an mro in
 tmp/
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBtYXkgYmUgdXNlZnVsIGZvciBzb21lIHRoaW5ncy4gIEZvciBleGFtcGxlLCBpdCB3aWxs
IGJlIHVzZWQgaW4KanVzdCBhIG1vbWVudC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1nLWV4ZWN1dGUtZmxpZ2h0IHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9tZy1leGVjdXRlLWZs
aWdodCBiL21nLWV4ZWN1dGUtZmxpZ2h0CmluZGV4IGIzY2RmNDMxLi4zOTFmNDgxMCAxMDA3NTUK
LS0tIGEvbWctZXhlY3V0ZS1mbGlnaHQKKysrIGIvbWctZXhlY3V0ZS1mbGlnaHQKQEAgLTgxLDYg
KzgxLDcgQEAgZWNobyA+JjUgImZsaWdodCAkZmxpZ2h0IHJlcG9ydGluZyIKIAogLi9zZy1yZXBv
cnQtZmxpZ2h0ICRiYXNpc2ZsaWdodG9wdCBcCiAJLS1odG1sLWRpcj0kT1NTVEVTVF9IVE1MUFVC
X0RJUi8kZmxpZ2h0LyBcCisJLS1tYWNoaW5lLXJlYWRhYmxlLW91dHB1dD10bXAvJGZsaWdodC5t
cm8gXAogCSRmbGlnaHQgPnRtcC8kZmxpZ2h0LnJlcG9ydAogCiBzdWJqZWN0PWBzZWQgLW4gMXAg
PHRtcC8kZmxpZ2h0LnJlcG9ydGAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
