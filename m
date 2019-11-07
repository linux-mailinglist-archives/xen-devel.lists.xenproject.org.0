Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E62F2D3B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 12:17:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSfle-0001YB-MZ; Thu, 07 Nov 2019 11:15:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSflc-0001XY-Sy
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 11:15:56 +0000
X-Inumbo-ID: f3cc883e-014f-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3cc883e-014f-11ea-9631-bc764e2007e4;
 Thu, 07 Nov 2019 11:15:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9479BAD5F;
 Thu,  7 Nov 2019 11:15:48 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu,  7 Nov 2019 12:15:44 +0100
Message-Id: <20191107111546.26579-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/2] xen/gntdev: sanitize user interface
 handling
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
 Stefano Stabellini <sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFhlbiBnbnRkZXYgZHJpdmVyJ3MgY2hlY2tpbmcgb2YgdGhlIG51bWJlciBvZiBhbGxvd2Vk
IG1hcHBlZCBwYWdlcwppcyBpbiBuZWVkIG9mIHNvbWUgc2FuaXRpemluZyB3b3JrLgoKQ2hhbmdl
cyBpbiBWMjoKLSBlbmhhbmNlZCBjb21taXQgbWVzc2FnZSBvZiBwYXRjaCAxIChBbmRyZXcgQ29v
cGVyKQoKSnVlcmdlbiBHcm9zcyAoMik6CiAgeGVuL2dudGRldjogcmVwbGFjZSBnbG9iYWwgbGlt
aXQgb2YgbWFwcGVkIHBhZ2VzIGJ5IGxpbWl0IHBlciBjYWxsCiAgeGVuL2dudGRldjogc3dpdGNo
IGZyb20ga2NhbGxvYygpIHRvIGt2Y2FsbG9jKCkKCiBkcml2ZXJzL3hlbi9nbnRkZXYtY29tbW9u
LmggfCAgMiArLQogZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jIHwgMTEgKysrLS0tLS0tCiBk
cml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwg
NDEgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
