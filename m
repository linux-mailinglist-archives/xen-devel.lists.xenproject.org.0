Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C11B75C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 15:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBId-00044T-MJ; Mon, 13 May 2019 13:47:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBIb-000440-MB
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:47:25 +0000
X-Inumbo-ID: a3c78f5b-7585-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a3c78f5b-7585-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 13:47:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85387579"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 May 2019 14:47:11 +0100
Message-ID: <20190513134714.3124-2-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513134714.3124-1-wei.liu2@citrix.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] gitignore: ignore .vscode directory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRpcmVjdG9yeSBpcyBjcmVhdGVkIGJ5IFZpc3VhbCBTdHVkaW8gQ29kZSBlZGl0b3IgdG8g
c3RvcmUgaXRzCmxvY2FsIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiAuZ2l0aWdub3JlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQppbmRleCAyNmJj
NTgzZjc0Li4zODIyYmI3NWJhIDEwMDY0NAotLS0gYS8uZ2l0aWdub3JlCisrKyBiLy5naXRpZ25v
cmUKQEAgLTMwLDYgKzMwLDcgQEAgY3Njb3BlLm91dAogY3Njb3BlLnBvLm91dAogLmNvbmZpZwog
LnZpbXJjCisudnNjb2RlCiAKIGRpc3QKIHN0dWJkb20vKi50YXIuZ3oKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
