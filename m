Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1539E34
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2019 13:47:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZZl1-0002oI-VE; Sat, 08 Jun 2019 11:43:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MJb9=UH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hZZkz-0002oD-JT
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2019 11:43:33 +0000
X-Inumbo-ID: a2177e16-89e2-11e9-a566-0f272bd9049c
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2177e16-89e2-11e9-a566-0f272bd9049c;
 Sat, 08 Jun 2019 11:43:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D19BAD81;
 Sat,  8 Jun 2019 11:43:28 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Sat,  8 Jun 2019 13:43:26 +0200
Message-Id: <20190608114326.4804-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fix for 5.2-rc4
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
LjJiLXJjNC10YWcKCnhlbjogZml4IGZvciA1LjItcmM0CgpJdCBjb250YWlucyBqdXN0IG9uZSBm
aXggZm9yIHRoZSBYZW4gYmxvY2sgZnJvbnRlbmQgZHJpdmVyIGF2b2lkaW5nCmFsbG9jYXRpb25z
IHdpdGggb3JkZXIgPiAwLgoKVGhhbmtzLgoKSnVlcmdlbgoKIGRyaXZlcnMvYmxvY2sveGVuLWJs
a2Zyb250LmMgfCAzOCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKUm9nZXIgUGF1
IE1vbm5lICgxKToKICAgICAgeGVuLWJsa2Zyb250OiBzd2l0Y2gga2NhbGxvYyB0byBrdmNhbGxv
YyBmb3IgbGFyZ2UgYXJyYXkgYWxsb2NhdGlvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
