Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7D1CA34
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:25:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQYKI-0008Df-RY; Tue, 14 May 2019 14:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQYKF-0008CQ-Jb
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:22:39 +0000
X-Inumbo-ID: b837f4a2-7653-11e9-b10b-2fbf889b6533
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b837f4a2-7653-11e9-b10b-2fbf889b6533;
 Tue, 14 May 2019 14:22:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="85442565"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 May 2019 15:22:30 +0100
Message-ID: <20190514142233.23165-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] Misc patches
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSAoMyk6CiAgZ2l0aWdub3JlOiBpZ25vcmUgLnZzY29kZSBkaXJlY3RvcnkKICBSRUFE
TUU6IGRvY3VtZW50IHJlcXVpcmVtZW50IGFib3V0IHB5dGhvbgogIElOU1RBTEw6IHJlbW92ZSBk
dXBsaWNhdGUgc2VudGVuY2UKCiAuZ2l0aWdub3JlIHwgMSArCiBJTlNUQUxMICAgIHwgMSAtCiBS
RUFETUUgICAgIHwgNyArKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
