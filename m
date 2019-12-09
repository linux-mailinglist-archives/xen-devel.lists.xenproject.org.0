Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D575B11747A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 19:42:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieNwK-0006pY-KT; Mon, 09 Dec 2019 18:39:24 +0000
Resent-Date: Mon, 09 Dec 2019 18:39:24 +0000
Resent-Message-Id: <E1ieNwK-0006pY-KT@lists.xenproject.org>
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0IkR=Z7=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1ieNwJ-0006pT-4z
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 18:39:23 +0000
X-Inumbo-ID: 36796310-1ab3-11ea-88e7-bc764e2007e4
Received: from sender4-of-o58.zoho.com (unknown [136.143.188.58])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36796310-1ab3-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 18:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1575916754; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hYnNEq2kMqPfTpc8FWxL1ppfQd8r2lKSUlT6EXyMjOTMmsjtX4BRhS6l3Dtme6bBK6FPilU/PjgnJiEs458AHwl9QJnvlvOtRM2wL8nRC5mDuYIH3K6s2bTJOXS980xPtU+gEqnsor4YZXS33iZ+Js5ntxUcQSJtbkV+DJGGaVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1575916754;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=1Rs5KtfToW19UYo4l7yyWHqjLoV3eHe6i5aMcVtGwIc=; 
 b=Qxu5ORrwxPCGj7+IAf/2oNX1Y1cxZXZKEHe2hfUk7iLunsW6VefDiGlQ3AmHfUMNEFfdAC5mYyJv5GNIjq1zdcuXEYIjqM0EJH1bvEL4rbJ2F7rBnKhleQwTmc0FYttIe+bfxWQY3mqeDpTCdI+SmACfhJz09kV+b6R1fFxaGR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1575916752645806.7153547439826;
 Mon, 9 Dec 2019 10:39:12 -0800 (PST)
In-Reply-To: <20191209095002.32194-1-philmd@redhat.com>
Message-ID: <157591675082.7675.3258773479175148459@37313f22b938>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Mon, 9 Dec 2019 10:39:12 -0800 (PST)
X-ZohoMailClient: External
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 0/6] hw/pci-host: Add Kconfig
 selector for IGD PCIe pass-through
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
Reply-To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, sstabellini@kernel.org, paul@xen.org, mst@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 xen-devel@lists.xenproject.org, anthony.perard@citrix.com, pbonzini@redhat.com,
 philmd@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTIwOTA5NTAwMi4zMjE5
NC0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN1Ym1vZHVsZSAnZHRjJyAoaHR0
cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2R0Yy5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ2R0YycK
Q2xvbmluZyBpbnRvICdkdGMnLi4uCnJlbW90ZTogQ291bnRpbmcgb2JqZWN0czogNTI4MCwgZG9u
ZS4gICAgICAgIAplcnJvcjogUlBDIGZhaWxlZDsgcmVzdWx0PTE4LCBIVFRQIGNvZGUgPSAyMDAK
ZmF0YWw6IFRoZSByZW1vdGUgZW5kIGh1bmcgdXAgdW5leHBlY3RlZGx5CmZhdGFsOiBwcm90b2Nv
bCBlcnJvcjogYmFkIHBhY2sgaGVhZGVyCkNsb25lIG9mICdodHRwczovL2dpdC5xZW11Lm9yZy9n
aXQvZHRjLmdpdCcgaW50byBzdWJtb2R1bGUgcGF0aCAnZHRjJyBmYWlsZWQKZmFpbGVkIHRvIHVw
ZGF0ZSBzdWJtb2R1bGUgZHRjClN1Ym1vZHVsZSAnZHRjJyAoaHR0cHM6Ly9naXQucWVtdS5vcmcv
Z2l0L2R0Yy5naXQpIHVucmVnaXN0ZXJlZCBmb3IgcGF0aCAnZHRjJwptYWtlWzFdOiAqKiogWy92
YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC0ydDNnZHFtby9zcmMvZG9ja2VyLXNyYy4yMDE5LTEy
LTA5LTEzLjMwLjAxLjEwMjYwXSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAv
dmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtMnQzZ2RxbW8vc3JjJwptYWtlOiAqKiogW2RvY2tl
ci1ydW4tdGVzdC1xdWlja0BjZW50b3M3XSBFcnJvciAyCgpyZWFsICAgIDltMTEuMDI2cwp1c2Vy
ICAgIDBtMi43NTdzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDE5MTIwOTA5NTAwMi4zMjE5NC0xLXBoaWxtZEByZWRoYXQuY29tL3Rlc3Rp
bmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
