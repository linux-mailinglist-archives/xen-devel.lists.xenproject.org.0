Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558201B75E
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 15:50:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBIe-00044a-0W; Mon, 13 May 2019 13:47:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBIb-00043z-MB
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:47:25 +0000
X-Inumbo-ID: a39aa937-7585-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a39aa937-7585-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 13:47:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85387570"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 May 2019 14:47:10 +0100
Message-ID: <20190513134714.3124-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] Misc patches
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

V2VpIExpdSAoNCk6CiAgZ2l0aWdub3JlOiBpZ25vcmUgLnZzY29kZSBkaXJlY3RvcnkKICBwdWJs
aWMvdG1lbS5oOiBmaXggdmVyc2lvbiBudW1iZXIgaW4gY29tbWVudAogIFJFQURNRTogZG9jdW1l
bnQgdGhhdCBgcHl0aG9uYCBpcyByZXF1aXJlZAogIElOU1RBTEw6IHJlbW92ZSBkdXBsaWNhdGUg
c2VudGVuY2UKCiAuZ2l0aWdub3JlICAgICAgICAgICAgICAgIHwgMSArCiBJTlNUQUxMICAgICAg
ICAgICAgICAgICAgIHwgMSAtCiBSRUFETUUgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCiB4
ZW4vaW5jbHVkZS9wdWJsaWMvdG1lbS5oIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
