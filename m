Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BAD6C986
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 08:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho0HK-0003iX-JC; Thu, 18 Jul 2019 06:52:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kuv=VP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ho0HJ-0003iS-4h
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 06:52:33 +0000
X-Inumbo-ID: 9ac1baa4-a928-11e9-84c0-230ac6f78568
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ac1baa4-a928-11e9-84c0-230ac6f78568;
 Thu, 18 Jul 2019 06:52:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9CA31ACBA;
 Thu, 18 Jul 2019 06:52:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu, 18 Jul 2019 08:52:20 +0200
Message-Id: <20190718065222.31310-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/2] xen/gntdev: sanitize user interface handling
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
IG1hcHBlZCBwYWdlcwppcyBpbiBuZWVkIG9mIHNvbWUgc2FuaXRpemluZyB3b3JrLgoKSnVlcmdl
biBHcm9zcyAoMik6CiAgeGVuL2dudGRldjogcmVwbGFjZSBnbG9iYWwgbGltaXQgb2YgbWFwcGVk
IHBhZ2VzIGJ5IGxpbWl0IHBlciBjYWxsCiAgeGVuL2dudGRldjogc3dpdGNoIGZyb20ga2NhbGxv
YygpIHRvIGt2Y2FsbG9jKCkKCiBkcml2ZXJzL3hlbi9nbnRkZXYtY29tbW9uLmggfCAgMiArLQog
ZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jIHwgMTEgKysrLS0tLS0tLQogZHJpdmVycy94ZW4v
Z250ZGV2LmMgICAgICAgIHwgNTIgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9u
cygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
