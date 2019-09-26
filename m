Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0666BF4E7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:19:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUab-0006bR-74; Thu, 26 Sep 2019 14:17:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t6lf=XV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDUaZ-0006bL-BX
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:17:47 +0000
X-Inumbo-ID: 6933903a-e068-11e9-9655-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6933903a-e068-11e9-9655-12813bfff9fa;
 Thu, 26 Sep 2019 14:17:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C499AED5;
 Thu, 26 Sep 2019 14:17:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Thu, 26 Sep 2019 16:17:43 +0200
Message-Id: <20190926141743.25426-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: features for 5.4-rc1
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
LjQtcmMxLXRhZwoKeGVuOiBmZWF0dXJlcyBmb3IgNS40LXJjMQoKSXQgY29udGFpbnMgb25seSB0
d28gc21hbGwgcGF0Y2hlcyB0aGlzIHRpbWU6CgotIGEgc21hbGwgY2xlYW51cCBmb3Igc3dpb3Rs
Yi14ZW4KLSBhIGZpeCBmb3IgUENJIGluaXRpYWxpemF0aW9uIGZvciBzb21lIHBsYXRmb3JtcwoK
VGhhbmtzLgoKSnVlcmdlbgoKIGRyaXZlcnMveGVuL3BjaS5jICAgICAgICAgfCAyMSArKysrKysr
KysrKysrKystLS0tLS0KIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCAgNSArKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKSWdvciBEcnV6
aGluaW4gKDEpOgogICAgICB4ZW4vcGNpOiByZXNlcnZlIE1DRkcgYXJlYXMgZWFybGllcgoKU291
cHRpY2sgSm9hcmRlciAoMSk6CiAgICAgIHN3aW90bGIteGVuOiBDb252ZXJ0IHRvIHVzZSBtYWNy
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
