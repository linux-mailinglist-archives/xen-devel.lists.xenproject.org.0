Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50971B75A
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 15:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBId-00044H-3H; Mon, 13 May 2019 13:47:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBIb-00043t-FO
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:47:25 +0000
X-Inumbo-ID: a393d919-7585-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a393d919-7585-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 13:47:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85387572"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 May 2019 14:47:13 +0100
Message-ID: <20190513134714.3124-4-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513134714.3124-1-wei.liu2@citrix.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] README: document that `python` is required
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

VGhlIGh5cGVydmlzb3IgYnVpbGQgc3lzdGVtIHJlcXVpcmVzIGBweXRob25gLiBUbyBhdm9pZCBw
dXR0aW5nIHRvbwptdWNoIChjb25mdXNpbmcpIGluZm9ybWF0aW9uIGluIFJFQURNRSwgbWFuZGF0
ZSBhdmFpbGFiaWxpdHkgb2YKYHB5dGhvbmAuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgotLS0KIFJFQURNRSB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL1JFQURNRSBiL1JFQURNRQppbmRleCAyM2U0Zjdj
M2RjLi5hNjBjY2Y2ZTljIDEwMDY0NAotLS0gYS9SRUFETUUKKysrIGIvUkVBRE1FCkBAIC0xODEs
NiArMTgxLDEwIEBAIFZhcmlvdXMgdG9vbHMsIHN1Y2ggYXMgcHlncnViLCBoYXZlIHRoZSBmb2xs
b3dpbmcgcnVudGltZSBkZXBlbmRlbmNpZXM6CiAgICAgICAgICAgVVJMOiAgICBodHRwOi8vd3d3
LnB5dGhvbi5vcmcvCiAgICAgICAgICAgRGViaWFuOiBweXRob24KIAorTm90ZSB0aGF0IHRoZSBi
dWlsZCBzeXN0ZW0gZXhwZWN0cyBgcHl0aG9uYCB0byBiZSBhdmFpbGFibGUuIElmIHlvdXIgc3lz
dGVtCitvbmx5IGhhcyBgcHl0aG9uMmAgb3IgYHB5dGhvbjNgIGJ1dCBub3QgYHB5dGhvbmAgKGFz
IGluIExpbnV4IEZyb20gU2NyYXRjaCksCit5b3Ugd2lsbCBuZWVkIHRvIGNyZWF0ZSBhIHN5bWxp
bmsgZm9yIGl0LgorCiBJbnRlbChSKSBUcnVzdGVkIEV4ZWN1dGlvbiBUZWNobm9sb2d5IFN1cHBv
cnQKID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQogCi0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
