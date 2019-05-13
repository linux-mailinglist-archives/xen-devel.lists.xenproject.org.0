Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7B1B75B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 15:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBIe-00044g-AX; Mon, 13 May 2019 13:47:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBIc-00044C-Mi
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:47:26 +0000
X-Inumbo-ID: a259b0b8-7585-11e9-a227-b74b5e54ffa1
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a259b0b8-7585-11e9-a227-b74b5e54ffa1;
 Mon, 13 May 2019 13:47:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85387571"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 May 2019 14:47:12 +0100
Message-ID: <20190513134714.3124-3-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513134714.3124-1-wei.liu2@citrix.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] public/tmem.h: fix version number in comment
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

VGhlIHZlcnNpb24gbnVtYmVyIGhhcyBiZWVuIGNoYW5nZWQgYWJvdmUgZHVlIHRvIHJlYmFzaW5n
IG9udG8gNC4xMwpicmFuY2gsIGJ1dCB0aGUgb25lIGluIHRoZSBtYXRjaGluZyBjb21tZW50IHdh
cyBsZWZ0IHVuY2hhbmdlZC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQogeGVuL2luY2x1ZGUvcHVibGljL3RtZW0uaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3B1YmxpYy90bWVtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvdG1lbS5oCmluZGV4IGQ5YjFj
MjY2ZjYuLjM2MmJhNDVkNWEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy90bWVtLmgK
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL3RtZW0uaApAQCAtMTA3LDcgKzEwNyw3IEBAIHR5cGVk
ZWYgc3RydWN0IHRtZW1fb3AgdG1lbV9vcF90OwogREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUodG1l
bV9vcF90KTsKICNlbmRpZgogCi0jZW5kaWYgIC8qIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18g
PCAweDAwMDQxMjAwICovCisjZW5kaWYgIC8qIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gPCAw
eDAwMDQxMzAwICovCiAKICNlbmRpZiAvKiBfX1hFTl9QVUJMSUNfVE1FTV9IX18gKi8KIAotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
