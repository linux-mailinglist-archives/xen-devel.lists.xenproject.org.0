Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A897C1607
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 17:58:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEbYy-0002Pg-E0; Sun, 29 Sep 2019 15:56:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEbYw-0002PT-R7
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 15:56:42 +0000
X-Inumbo-ID: b53c931d-e2d1-11e9-96b9-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b53c931d-e2d1-11e9-96b9-12813bfff9fa;
 Sun, 29 Sep 2019 15:56:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67F0D1597;
 Sun, 29 Sep 2019 08:56:33 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B69533F706;
 Sun, 29 Sep 2019 08:56:32 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 29 Sep 2019 16:56:27 +0100
Message-Id: <20190929155627.23493-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190929155627.23493-1-julien.grall@arm.com>
References: <20190929155627.23493-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 2/2] xen/arm: domain_build: Indent
 correctly parameters of alloc_bank_memory()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXggYjc5MWU0
YjUxMi4uMjY4ZTA3NGFmNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
CisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAtMzc1LDkgKzM3NSw5IEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBhbGxvY2F0ZV9tZW1vcnlfMTEoc3RydWN0IGRvbWFpbiAqZCwKIH0K
IAogc3RhdGljIGJvb2wgX19pbml0IGFsbG9jYXRlX2JhbmtfbWVtb3J5KHN0cnVjdCBkb21haW4g
KmQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga2VybmVs
X2luZm8gKmtpbmZvLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2Zu
X3Qgc2dmbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qg
dG90X3NpemUpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGtlcm5lbF9pbmZvICpraW5mbywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnZm5fdCBzZ2ZuLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhZGRyX3QgdG90X3NpemUpCiB7CiAgICAgaW50IHJlczsKICAgICBzdHJ1Y3QgcGFnZV9pbmZv
ICpwZzsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
