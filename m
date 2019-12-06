Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68411155EB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:57:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGsu-0005Uq-D0; Fri, 06 Dec 2019 16:55:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1idGss-0005Ul-Ik
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:55:14 +0000
X-Inumbo-ID: 2bc7c41e-1849-11ea-83a1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bc7c41e-1849-11ea-83a1-12813bfff9fa;
 Fri, 06 Dec 2019 16:55:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D470CB268;
 Fri,  6 Dec 2019 16:55:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Fri,  6 Dec 2019 17:55:11 +0100
Message-Id: <20191206165511.14749-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: branch for v5.5-rc1
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
LjViLXJjMS10YWcKCnhlbjogYnJhbmNoIGZvciB2NS41LXJjMQoKSXQgY29udGFpbnM6CgotIGEg
cGF0Y2ggdG8gZml4IGEgYnVpbGQgd2FybmluZwoKLSBhIGNsZWFudXAgb2Ygbm8gbG9uZ2VyIG5l
ZWRlZCBjb2RlIGluIHRoZSBYZW4gZXZlbnQgaGFuZGxpbmcKCi0gYSBzbWFsbCBzZXJpZXMgZm9y
IHRoZSBYZW4gZ3JhbnQgZHJpdmVyIGF2b2lkaW5nIGhpZ2ggb3JkZXIKICBhbGxvY2F0aW9ucyBh
bmQgcmVwbGFjaW5nIGFuIGluc2FuZSBnbG9iYWwgbGltaXQgYnkgYSBwZXItY2FsbCBvbmUKCi0g
YSBzbWFsbCBzZXJpZXMgZml4aW5nIFhlbiBmcm9udGVuZC9iYWNrZW5kIG1vZHVsZSByZWZlcmVu
Y2luZwoKClRoYW5rcy4KCkp1ZXJnZW4KCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2Jh
Y2suYyB8ICA4ICsrKysrCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oICB8ICAz
ICsrCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jICB8IDExICsrKysrKysKIGRy
aXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jICAgIHwgMTYgKystLS0tLS0tLQogZHJpdmVy
cy94ZW4vZ250ZGV2LWNvbW1vbi5oICAgICAgICAgfCAgMiArLQogZHJpdmVycy94ZW4vZ250ZGV2
LWRtYWJ1Zi5jICAgICAgICAgfCAxMSArKy0tLS0tCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAg
ICAgICAgICAgICB8IDY0ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyAgIHwgMTMgKysrKysrKy0KIDggZmlsZXMg
Y2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCgpDb2xpbiBJYW4gS2lu
ZyAoMSk6CiAgICAgIHhlbi9nbnRkZXY6IHJlbW92ZSByZWR1bmRhbnQgbm9uLXplcm8gY2hlY2sg
b24gcmV0CgpKdWVyZ2VuIEdyb3NzICg0KToKICAgICAgeGVuL2V2ZW50czogcmVtb3ZlIGV2ZW50
IGhhbmRsaW5nIHJlY3Vyc2lvbiBkZXRlY3Rpb24KICAgICAgeGVuL2dudGRldjogcmVwbGFjZSBn
bG9iYWwgbGltaXQgb2YgbWFwcGVkIHBhZ2VzIGJ5IGxpbWl0IHBlciBjYWxsCiAgICAgIHhlbi9n
bnRkZXY6IHN3aXRjaCBmcm9tIGtjYWxsb2MoKSB0byBrdmNhbGxvYygpCgpQYXVsIER1cnJhbnQg
KDIpOgogICAgICB4ZW4veGVuYnVzOiByZWZlcmVuY2UgY291bnQgcmVnaXN0ZXJlZCBtb2R1bGVz
CiAgICAgIHhlbi1ibGtiYWNrOiBhbGxvdyBtb2R1bGUgdG8gYmUgY2xlYW5seSB1bmxvYWRlZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
