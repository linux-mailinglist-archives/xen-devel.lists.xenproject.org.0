Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80E2D8A2
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 11:08:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVuVM-0005Ve-3M; Wed, 29 May 2019 09:04:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=krOM=T5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVuVK-0005VD-BA
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:04:14 +0000
X-Inumbo-ID: b93199bb-81f0-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b93199bb-81f0-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 09:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 75ED5AC4F;
 Wed, 29 May 2019 09:04:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Date: Wed, 29 May 2019 11:04:04 +0200
Message-Id: <20190529090407.1225-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] xen/swiotlb: fix an issue and improve
 swiotlb-xen
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgaHVudGluZyBhbiBpc3N1ZSBpbiBzd2lvdGxiLXhlbiBJIHN0dW1ibGVkIG92ZXIgYSB3
cm9uZyB0ZXN0CmFuZCBmb3VuZCBzb21lIGFyZWFzIGZvciBpbXByb3ZlbWVudC4KCkp1ZXJnZW4g
R3Jvc3MgKDMpOgogIHhlbi9zd2lvdGxiOiBmaXggY29uZGl0aW9uIGZvciBjYWxsaW5nIHhlbl9k
ZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkKICB4ZW4vc3dpb3RsYjogc2ltcGxpZnkgcmFuZ2Vf
c3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkoKQogIHhlbi9zd2lvdGxiOiByZW1lbWJlciBoYXZpbmcg
Y2FsbGVkIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24oKQoKIGRyaXZlcnMveGVuL3N3aW90
bGIteGVuLmMgIHwgMzYgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBpbmNs
dWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaCB8ICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
