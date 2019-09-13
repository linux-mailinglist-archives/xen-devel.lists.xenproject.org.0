Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD3B25D7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8qz8-0005ls-OM; Fri, 13 Sep 2019 19:11:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fWsZ=XI=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1i8qz7-0005ln-8N
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:11:57 +0000
X-Inumbo-ID: 5865e28e-d65a-11e9-95b9-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5865e28e-d65a-11e9-95b9-12813bfff9fa;
 Fri, 13 Sep 2019 19:11:56 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 15:11:47 -0400
Message-ID: <20190913191147.2323-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.27.13.130]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=4.3 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH] xen/arm: platform: additional Raspberry Pi
 compatible string
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXBzdHJlYW0gTGludXgga2VybmVsIHdpbGwgdXNlICJicmNtLGJjbTI3MTEiIGFzIHRoZSBjb21w
YXRpYmxlIHN0cmluZwpmb3IgUmFzcGJlcnJ5IFBpIDQgWzFdLiBBZGQgdGhpcyBzdHJpbmcgdG8g
b3VyIHBsYXRmb3JtIGNvbXBhdGlibGUgbGlzdApmb3IgY29tcGF0aWJpbGl0eSB3aXRoIHRoZSB1
cHN0cmVhbSBrZXJuZWwuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MTA5MjYyMS8KClNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxk
ZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20t
cmFzcGJlcnJ5LXBpLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYyBiL3hl
bi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYwppbmRleCBlMjJkMmIzMTg0
Li5hOTVhM2RiODNmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFz
cGJlcnJ5LXBpLmMKKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1w
aS5jCkBAIC0yMSw2ICsyMSw3IEBACiAKIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBicmNtX2Jj
bTI4MzhfZHRfY29tcGF0W10gX19pbml0Y29uc3QgPQogeworICAgICJicmNtLGJjbTI3MTEiLAog
ICAgICJicmNtLGJjbTI4MzgiLAogICAgIE5VTEwKIH07Ci0tIAoyLjIzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
