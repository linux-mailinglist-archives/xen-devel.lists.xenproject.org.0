Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A3A3ED8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 22:13:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3nDg-0004ev-KR; Fri, 30 Aug 2019 20:10:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=69lB=W2=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i3nDf-0004d7-Ah
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 20:10:03 +0000
X-Inumbo-ID: 260ee6ee-cb62-11e9-951b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 260ee6ee-cb62-11e9-951b-bc764e2007e4;
 Fri, 30 Aug 2019 20:10:02 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDc-0007hW-Mm; Fri, 30 Aug 2019 20:10:00 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDc-0003Pk-Gm; Fri, 30 Aug 2019 20:10:00 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 30 Aug 2019 21:09:51 +0100
Message-Id: <0944333a4a0b503789d10afa63f8229bd0441290.1567195654.git-series.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
In-Reply-To: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v3 1/3] Remove hardcoding from
 scripts/add_maintainers.pl
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
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

SW5zdGVhZCBvZiB1c2luZyBhIGhhcmRjb2RlZCBsb2NhdGlvbiwgaW5oZXJpdCB0aGUKbG9jYXRp
b24gZnJvbSAkMAoKU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXgu
Y29tPgotLS0KIHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Njcmlw
dHMvYWRkX21haW50YWluZXJzLnBsIGIvc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwKaW5kZXgg
MDllOWY2Ni4uNWE2ZDBmNiAxMDA3NTUKLS0tIGEvc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwK
KysrIGIvc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwKQEAgLTI2LDkgKzI2LDkgQEAgc3ViIGlu
c2VydCAoJCQkJCk7CiBzdWIgaGFzdGFnICgkJCk7CiAKICMgVG9vbCBWYXJpYWJsZXMKLW15ICRn
ZXRfbWFpbnRhaW5lciAgICAgID0gIi4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCI7Ci0KIG15
ICR0b29sID0gJDA7CitteSAkZ2V0X21haW50YWluZXIgPSAkdG9vbDsKKyRnZXRfbWFpbnRhaW5l
ciA9fiBzL2FkZF9tYWludGFpbmVycy9nZXRfbWFpbnRhaW5lci87CiBteSAkdXNhZ2UgPSA8PEVP
VDsKIE9QVElPTlM6CiAtLS0tLS0tLQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
