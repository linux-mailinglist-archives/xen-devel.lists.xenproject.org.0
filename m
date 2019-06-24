Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B672519F4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 19:49:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfT2b-0005Np-BJ; Mon, 24 Jun 2019 17:46:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfT2a-0005Nk-4i
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 17:46:04 +0000
X-Inumbo-ID: ee2eaeed-96a7-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee2eaeed-96a7-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 17:46:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F2D920665;
 Mon, 24 Jun 2019 17:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561398360;
 bh=Z9Jr9RUZqsYpFVCou0B6XxC9KcviMW1hxixJ5pSaphM=;
 h=Date:From:To:cc:Subject:From;
 b=JKQo8MROxUV092KTFjaAewCBXN571NYrb5hb4J8D5bFN66VNcSSTG0tQbpRk9euWJ
 W3kAklx8FqkLFJguFDigBJy+VzwKs7yq70sNRMJ7dz4z3WR2RoYVCJYD5is4+h+vtG
 U22P6C9O6luYo3eX2gROvVm6JLYXsI2UDzIw7fPo=
Date: Mon, 24 Jun 2019 10:45:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com, Volodymyr_Babchuk@epam.com
Message-ID: <alpine.DEB.2.21.1906241041190.2468@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: add Volodymyr as Reviewer for
 xen/arm
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
Cc: sstabellini@kernel.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4K
CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDMxM2RmNTI0OTQu
Ljg4MmU0ZWZhMjIgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBA
IC0xNzUsNiArMTc1LDcgQEAgRjoJdG9vbHMvbGlieGMveGNfYXJpbmM2NTMuYwogQVJNIChXLyBW
SVJUVUFMSVNBVElPTiBFWFRFTlNJT05TKSBBUkNISVRFQ1RVUkUKIE06CVN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KIE06CUp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CitSOglWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+CiBTOglTdXBwb3J0ZWQKIEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwog
RjoJZG9jcy9taXNjL2FybS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
