Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C411F69E
	for <lists+xen-devel@lfdr.de>; Sun, 15 Dec 2019 07:11:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igN35-0001Zv-7T; Sun, 15 Dec 2019 06:06:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l35h=2F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1igN34-0001ZO-6c
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2019 06:06:34 +0000
X-Inumbo-ID: 0539d51c-1f01-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0539d51c-1f01-11ea-b6f1-bc764e2007e4;
 Sun, 15 Dec 2019 06:06:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3191B12D;
 Sun, 15 Dec 2019 06:06:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Sun, 15 Dec 2019 07:06:21 +0100
Message-Id: <20191215060621.8328-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: branch for v5.5-rc2
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
LjViLXJjMi10YWcKCnhlbjogYnJhbmNoIGZvciB2NS41LXJjMgoKSXQgY29udGFpbnMgdHdvIGZp
eGVzOiBvbmUgZm9yIGEgcmVzb3VyY2UgYWNjb3VudGluZyBidWcgaW4gc29tZQpjb25maWd1cmF0
aW9ucyBhbmQgYSBmaXggZm9yIGFub3RoZXIgcGF0Y2ggd2hpY2ggd2VudCBpbnRvIHJjMS4KClRo
YW5rcy4KCkp1ZXJnZW4KCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgMTAg
KysrKysrKysrKwogZHJpdmVycy94ZW4vYmFsbG9vbi5jICAgICAgICAgICAgICB8ICAzICsrLQog
MiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpKdWVyZ2Vu
IEdyb3NzICgxKToKICAgICAgeGVuL2JhbGxvb246IGZpeCBiYWxsb29uZWQgcGFnZSBhY2NvdW50
aW5nIHdpdGhvdXQgaG90cGx1ZyBlbmFibGVkCgpQYXVsIER1cnJhbnQgKDEpOgogICAgICB4ZW4t
YmxrYmFjazogcHJldmVudCBwcmVtYXR1cmUgbW9kdWxlIHVubG9hZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
