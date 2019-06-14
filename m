Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35645442
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 07:49:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbf2T-0003zA-Vt; Fri, 14 Jun 2019 05:46:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbf2S-0003yq-9G
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 05:46:12 +0000
X-Inumbo-ID: b549d144-8e67-11e9-ab55-d35fea356dc1
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b549d144-8e67-11e9-ab55-d35fea356dc1;
 Fri, 14 Jun 2019 05:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00942ADFA;
 Fri, 14 Jun 2019 05:46:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 07:46:01 +0200
Message-Id: <20190614054604.30101-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/3] xen/swiotlb: fix an issue and improve
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
MIME-Version: 1.0
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
bGIteGVuLmMgIHwgMzQgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVk
ZS9saW51eC9wYWdlLWZsYWdzLmggfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
