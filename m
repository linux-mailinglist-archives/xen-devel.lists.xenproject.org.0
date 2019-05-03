Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9213487
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 22:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMf80-0005vI-Oh; Fri, 03 May 2019 20:49:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMf7z-0005vD-VB
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 20:49:55 +0000
X-Inumbo-ID: fded3754-6de4-11e9-b3ec-1fd31ce52ff7
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fded3754-6de4-11e9-b3ec-1fd31ce52ff7;
 Fri, 03 May 2019 20:49:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACFD1206E0;
 Fri,  3 May 2019 20:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556916588;
 bh=f2IO7zlswbmqPG0bfnsbMjN0ZRzvILcfZjtD4tK2DKc=;
 h=Date:From:To:cc:Subject:From;
 b=ZzjkX/7Y+CGY09FnK4QelYp8suAerN/0BRke0sAPnT7zDLe1fEHwXJUlNlyHcrLg6
 7IifG4IcQtsMGuDugDA66dNc42spKPFG+KstNlIPG5bjocGIjGihoWmDJDRc7V/5Bj
 KFxJx47pzZGzVuyYa7fO6NOH75zCXuceo5yuFktQ=
Date: Fri, 3 May 2019 13:49:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] PDX fixes
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, JBeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaXMgYSBzbWFsbCBjb2xsZWN0aW9uIG9mIFBEWCBmaXhlcy4g
VGhleSBhcmUgdGVjaG5pY2FsbHkKaW5kZXBlbmRlbnQgYnV0IGRpc2NvdmVyZWQgdG9nZXRoZXIg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIG1lbW9yeQp3YXN0ZSBjYXVzZWQgYnkgdGhlIGZyYW1l
dGFibGUgYWxsb2NhdGlvbiBvbiBYaWxpbnggWnlucU1QLgoKQ2hlZXJzLAoKU3RlZmFubwoKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZGM0OTc2MzVkOTNmNjY3MmY4MjcyN2Fk
OTdhNTUyMDUxNzdiZTJhYToKCiAgYnVpbGQgc3lzdGVtOiBtYWtlIGluc3RhbGwtc3R1YmRvbSBk
ZXBlbmQgb24gaW5zdGFsbC10b29scyBhZ2FpbiAoMjAxOS0wNC0yMyAxNzowMDowOCArMDEwMCkK
CmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwOi8veGVuYml0
cy54ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxl
LmdpdCBwZHgtZml4LTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlZmE3YTU3NDQ5
YTY1NmEzZmZhYzIxZTk4MDJiNmU1YTE0YTA4MThhOgoKICB4ZW4vYXJtOiBmaXggbWFzayBjYWxj
dWxhdGlvbiBpbiBpbml0X3BkeCAoMjAxOS0wNS0wMyAxMzoxNjoyOSAtMDcwMCkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
U3RlZmFubyBTdGFiZWxsaW5pICgzKToKICAgICAgeGVuL2FybTogZml4IG5yX3BkeHMgY2FsY3Vs
YXRpb24KICAgICAgeGVuOiBhY3R1YWxseSBza2lwIHRoZSBmaXJzdCBNQVhfT1JERVIgYml0cyBp
biBwZm5fcGR4X2hvbGVfc2V0dXAKICAgICAgeGVuL2FybTogZml4IG1hc2sgY2FsY3VsYXRpb24g
aW4gaW5pdF9wZHgKCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICB8IDQgKystLQogeGVuL2FyY2gvYXJt
L3NldHVwLmMgfCA5ICsrKysrKystLQogeGVuL2NvbW1vbi9wZHguYyAgICAgfCA2ICsrKystLQog
MyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
