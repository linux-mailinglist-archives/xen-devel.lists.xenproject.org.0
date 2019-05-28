Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901342C840
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 16:02:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVcdZ-0003nP-P5; Tue, 28 May 2019 13:59:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVcdY-0003nE-Jl
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 13:59:32 +0000
X-Inumbo-ID: d06be6c4-8150-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d06be6c4-8150-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 13:59:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09ACAB03F;
 Tue, 28 May 2019 13:59:30 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 15:59:18 +0200
Message-Id: <20190528135918.28216-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] support: remove tmem from support.md
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG1lbSBoYXMgYmVlbiByZW1vdmVkLiBSZWZsZWN0IHRoYXQgaW4gU1VQUE9SVC5tZAoKU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIFNVUFBPUlQubWQg
fCAxMCAtLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQKaW5kZXggZTRmYjE1YjJmOC4uMzc1NDczYTQ1
NiAxMDA2NDQKLS0tIGEvU1VQUE9SVC5tZAorKysgYi9TVVBQT1JULm1kCkBAIC0yMzYsMTYgKzIz
Niw2IEBAIEFsbG93IHBhZ2VzIGJlbG9uZ2luZyB0byBndWVzdHMgdG8gYmUgcGFnZWQgdG8gZGlz
awogCiAgICAgU3RhdHVzLCB4ODYgSFZNOiBFeHBlcmltZW5hbAogCi0jIyMgVHJhbnNjZW5kZW50
IE1lbW9yeQotCi1UcmFuc2NlbmRlbnQgTWVtb3J5ICh0bWVtKSBhbGxvd3MgdGhlIGNyZWF0aW9u
IG9mIGh5cGVydmlzb3IgbWVtb3J5IHBvb2xzCi13aGljaCBndWVzdHMgY2FuIHVzZSB0byBzdG9y
ZSBtZW1vcnkKLXJhdGhlciB0aGFuIGNhY2hpbmcgaW4gaXRzIG93biBtZW1vcnkgb3Igc3dhcHBp
bmcgdG8gZGlzay4KLUhhdmluZyB0aGVzZSBpbiB0aGUgaHlwZXJ2aXNvcgotY2FuIGFsbG93IG1v
cmUgZWZmaWNpZW50IGFnZ3JlZ2F0ZSB1c2Ugb2YgbWVtb3J5IGFjcm9zcyBWTXMuCi0KLSAgICBT
dGF0dXM6IEV4cGVyaW1lbnRhbAotCiAjIyMgQWx0ZXJuYXRpdmUgcDJtCiAKIEFsdGVybmF0aXZl
IHAybSAoYWx0cDJtKSBhbGxvd3MgZXh0ZXJuYWwgbW9uaXRvcmluZyBvZiBndWVzdCBtZW1vcnkK
LS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
