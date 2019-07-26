Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CF76317
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:06:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqx4T-0003d6-JL; Fri, 26 Jul 2019 10:03:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqx4S-0003d1-59
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:03:28 +0000
X-Inumbo-ID: 9c2994a7-af8c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9c2994a7-af8c-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 10:03:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C1664B642;
 Fri, 26 Jul 2019 10:03:25 +0000 (UTC)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 12:03:25 +0200
Message-ID: <156413540514.22784.14073005924861814163.stgit@Palanthas>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] ci: install C++ in opensuse-leap CI container
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
Cc: Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG9wZW5TVVNFIExlYXAgY29udGFpbmVyIGltYWdlLCBidWlsdCBhZnRlcgpvcGVuc3VzZS1s
ZWFwLmRvY2tlcmZpbGUgd2FzIG1pc3NpbmcgdGhlIGdjYy1jKyssCndoaWNoIGlzIG5lY2Vzc2Fy
eSwgZS5nLiwgZm9yIGJ1aWxkaW5nIE9WTUYuCgpBZGQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBEYXJp
byBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgotLS0KQ2M6IERvdWcgR29sZHN0ZWluIDxj
YXJkb2VAY2FyZG9lLmNvbT4KLS0tCiBhdXRvbWF0aW9uL2J1aWxkL3N1c2Uvb3BlbnN1c2UtbGVh
cC5kb2NrZXJmaWxlIHwgICAgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9hdXRvbWF0aW9uL2J1aWxkL3N1c2Uvb3BlbnN1c2UtbGVhcC5kb2NrZXJmaWxl
IGIvYXV0b21hdGlvbi9idWlsZC9zdXNlL29wZW5zdXNlLWxlYXAuZG9ja2VyZmlsZQppbmRleCA2
MTRhNWM4NDA1Li5hNjI3YzlhMWYxIDEwMDY0NAotLS0gYS9hdXRvbWF0aW9uL2J1aWxkL3N1c2Uv
b3BlbnN1c2UtbGVhcC5kb2NrZXJmaWxlCisrKyBiL2F1dG9tYXRpb24vYnVpbGQvc3VzZS9vcGVu
c3VzZS1sZWFwLmRvY2tlcmZpbGUKQEAgLTIxLDYgKzIxLDcgQEAgUlVOIHp5cHBlciBpbnN0YWxs
IC15IFwKICAgICAgICAgZGlzY291bnQgXAogICAgICAgICBmbGV4IFwKICAgICAgICAgZ2NjIFwK
KyAgICAgICAgZ2NjLWMrKyBcCiAgICAgICAgIGdldHRleHQtdG9vbHMgXAogICAgICAgICBnaXQg
XAogICAgICAgICBnbGliMi1kZXZlbCBcCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
