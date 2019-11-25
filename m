Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D8108870
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 06:38:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZ71X-0005gz-NO; Mon, 25 Nov 2019 05:34:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7DUC=ZR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZ71W-0005gu-8S
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 05:34:58 +0000
X-Inumbo-ID: 503d042e-0f45-11ea-a38a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 503d042e-0f45-11ea-a38a-12813bfff9fa;
 Mon, 25 Nov 2019 05:34:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB0ACB042;
 Mon, 25 Nov 2019 05:34:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Mon, 25 Nov 2019 06:34:54 +0100
Message-Id: <20191125053454.19556-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fixes for xen
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
LjVhLXJjMS10YWcKCnhlbjogZml4ZXMgZm9yIHhlbgoKSXQgY29udGFpbnMgZm9sbG93aW5nIHBh
dGNoZXM6CgotIGEgc21hbGwgc2VyaWVzIHRvIHJlbW92ZSB0aGUgYnVpbGQgY29uc3RyYWludCBv
ZiBYZW4geDg2IE1DRSBoYW5kbGluZwogIHRvIDY0LWJpdCBvbmx5CgotIGEgYnVuY2ggb2YgbWlu
b3IgY2xlYW51cHMKICAKClRoYW5rcy4KCkp1ZXJnZW4KCiBhcmNoL2FybS94ZW4vbW0uYyAgICAg
ICAgICAgICAgICB8ICAzICstCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaCB8ICAy
ICsrCiBkcml2ZXJzL3hlbi9LY29uZmlnICAgICAgICAgICAgICB8IDYzICsrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMveGVuL21jZWxvZy5jICAgICAgICAg
ICAgIHwgMTQgKysrKysrKy0tCiBpbmNsdWRlL3hlbi9pbnRlcmZhY2UveGVuLW1jYS5oICB8IDEw
ICsrKysrLS0KIDUgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25z
KC0pCgpCZW4gRG9va3MgKENvZGV0aGluaykgKDIpOgogICAgICB4ZW46IG1tOiBpbmNsdWRlIDx4
ZW4veGVuLW9wcy5oPiBmb3IgbWlzc2luZyBkZWNsYXJhdGlvbnMKICAgICAgeGVuOiBtbTogbWFr
ZSB4ZW5fbW1faW5pdCBzdGF0aWMKCkphbiBCZXVsaWNoICgzKToKICAgICAgeGVuL21jZWxvZzog
ZHJvcCBfX01DX01TUl9NQ0dDQVAKICAgICAgeGVuL21jZWxvZzogYWRkIFBQSU4gdG8gcmVjb3Jk
IHdoZW4gYXZhaWxhYmxlCiAgICAgIHhlbi9tY2Vsb2c6IGFsc28gYWxsb3cgYnVpbGRpbmcgZm9y
IDMyLWJpdCBrZXJuZWxzCgpKYXNvbiBHdW50aG9ycGUgKDEpOgogICAgICB4ZW4vZ250ZGV2OiBV
c2Ugc2VsZWN0IGZvciBETUFfU0hBUkVEX0JVRkZFUgoKS3J6eXN6dG9mIEtvemxvd3NraSAoMSk6
CiAgICAgIHhlbjogRml4IEtjb25maWcgaW5kZW50YXRpb24KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
