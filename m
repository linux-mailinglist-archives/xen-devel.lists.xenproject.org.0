Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518BFE624
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 21:04:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhma-0005Xa-Ln; Fri, 15 Nov 2019 20:01:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhmZ-0005XV-C4
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:01:27 +0000
X-Inumbo-ID: b22be5d4-07e2-11ea-adbe-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b22be5d4-07e2-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 20:01:23 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:01:05 -0500
Message-ID: <20191115200115.44890-2-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH v3 01/11] xen: arm: fix indentation of
 struct vtimer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Ian Campbell <ian.campbell@citrix.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Julien Grall <julien.grall@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYt
Ynk6IElhbiBDYW1wYmVsbCA8aWFuLmNhbXBiZWxsQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBjaXRyaXguY29tPiBbMV0KQWNrZWQtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGV1LmNpdHJpeC5jb20+IFsyXQoKWzFd
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
NS0xMS9tc2cwMDk4NS5odG1sClsyXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMTUtMTIvbXNnMDI2NDYuaHRtbAoKLS0tCnYzOgogICogUmVi
YXNlIChubyBjb25mbGljdHMpCiAgKiBBZGQgUmV2aWV3ZWQtYnkgYW5kIEFja2VkLWJ5IGZyb20g
YSBmZXcgeWVhcnMgYWdvCi0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCB8IDEwICsr
KysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vZG9tYWluLmgKaW5kZXggODZlYmRkMmJjZi4uZjNmM2ZiN2Q3ZiAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJt
L2RvbWFpbi5oCkBAIC0zNSwxMSArMzUsMTEgQEAgZW51bSBkb21haW5fdHlwZSB7CiAjZGVmaW5l
IGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICgoZCkgPT0gaGFyZHdhcmVfZG9tYWluKQogCiBz
dHJ1Y3QgdnRpbWVyIHsKLSAgICAgICAgc3RydWN0IHZjcHUgKnY7Ci0gICAgICAgIGludCBpcnE7
Ci0gICAgICAgIHN0cnVjdCB0aW1lciB0aW1lcjsKLSAgICAgICAgdWludDMyX3QgY3RsOwotICAg
ICAgICB1aW50NjRfdCBjdmFsOworICAgIHN0cnVjdCB2Y3B1ICp2OworICAgIGludCBpcnE7Cisg
ICAgc3RydWN0IHRpbWVyIHRpbWVyOworICAgIHVpbnQzMl90IGN0bDsKKyAgICB1aW50NjRfdCBj
dmFsOwogfTsKIAogc3RydWN0IGFyY2hfZG9tYWluCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
