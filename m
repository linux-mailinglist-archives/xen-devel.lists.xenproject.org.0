Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60090165000
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4W1P-0001pZ-84; Wed, 19 Feb 2020 20:32:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OPzw=4H=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j4W1N-0001pJ-Pk
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 20:32:37 +0000
X-Inumbo-ID: f3c5876a-5356-11ea-ade5-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3c5876a-5356-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IwM5xDVexTtFbifpzcvRacL+iCjmBdmezBNuwX9Wrb0=; b=ZZuofW68kpx+4sW8OdtDPa/85Z
 SSgzQLjxBfPG7cy1LSkpSfPD9XGIiRK7PazMHd1pyLtPeLA3f1zL0syJxeJc7uNi/s6Nu0/97yhIP
 tmFiuWKz8K3RST5emu0za8a2qv0RdiZI7V5vP425+XwLQgLzzPoaJ7stvwFyDUsv8ZWE=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:60560
 helo=localhost.localdomain) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j4W2k-0005p1-AC; Wed, 19 Feb 2020 21:34:02 +0100
From: Sander Eikelenboom <linux@eikelenboom.it>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 21:31:31 +0100
Message-Id: <a5d34e806a0798e411b405625d1ef74db998fc85.1582143896.git.linux@eikelenboom.it>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582143896.git.linux@eikelenboom.it>
References: <cover.1582143896.git.linux@eikelenboom.it>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] tools/xentop: Remove dead code
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4K
LS0tCiB0b29scy94ZW5zdGF0L3hlbnRvcC94ZW50b3AuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMveGVuc3RhdC94ZW50b3AveGVudG9wLmMgYi90b29scy94ZW5zdGF0L3hlbnRvcC94ZW50
b3AuYwppbmRleCAxM2I2MTJmMjZkLi5iYmI1ZDQ3Yjc2IDEwMDY0NAotLS0gYS90b29scy94ZW5z
dGF0L3hlbnRvcC94ZW50b3AuYworKysgYi90b29scy94ZW5zdGF0L3hlbnRvcC94ZW50b3AuYwpA
QCAtOTQzLDcgKzk0Myw2IEBAIHZvaWQgZG9fc3VtbWFyeSh2b2lkKQogCSAgICAgICAgIGNyYXNo
ID0gMCwgZHlpbmcgPSAwLCBzaHV0ZG93biA9IDA7CiAJdW5zaWduZWQgaSwgbnVtX2RvbWFpbnMg
PSAwOwogCXVuc2lnbmVkIGxvbmcgbG9uZyB1c2VkID0gMDsKLQlsb25nIGZyZWVhYmxlX21iID0g
MDsKIAl4ZW5zdGF0X2RvbWFpbiAqZG9tYWluOwogCXRpbWVfdCBjdXJ0OwogCkBAIC05NzAsMTcg
Kzk2OSwxMiBAQCB2b2lkIGRvX3N1bW1hcnkodm9pZCkKIAkgICAgICBudW1fZG9tYWlucywgcnVu
LCBibG9jaywgcGF1c2UsIGNyYXNoLCBkeWluZywgc2h1dGRvd24pOwogCiAJdXNlZCA9IHhlbnN0
YXRfbm9kZV90b3RfbWVtKGN1cl9ub2RlKS14ZW5zdGF0X25vZGVfZnJlZV9tZW0oY3VyX25vZGUp
OwotCWZyZWVhYmxlX21iID0gMDsKIAogCS8qIER1bXAgbm9kZSBtZW1vcnkgYW5kIGNwdSBpbmZv
cm1hdGlvbiAqLwotCWlmICggZnJlZWFibGVfbWIgPD0gMCApCi0JICAgICBwcmludCgiTWVtOiAl
bGx1ayB0b3RhbCwgJWxsdWsgdXNlZCwgJWxsdWsgZnJlZSAgICAiLAorCXByaW50KCJNZW06ICVs
bHVrIHRvdGFsLCAlbGx1ayB1c2VkLCAlbGx1ayBmcmVlICAgICIsCiAJICAgICAgeGVuc3RhdF9u
b2RlX3RvdF9tZW0oY3VyX25vZGUpLzEwMjQsIHVzZWQvMTAyNCwKIAkgICAgICB4ZW5zdGF0X25v
ZGVfZnJlZV9tZW0oY3VyX25vZGUpLzEwMjQpOwotCWVsc2UKLQkgICAgIHByaW50KCJNZW06ICVs
bHVrIHRvdGFsLCAlbGx1ayB1c2VkLCAlbGx1ayBmcmVlLCAlbGRrIGZyZWVhYmxlLCAiLAotCSAg
ICAgIHhlbnN0YXRfbm9kZV90b3RfbWVtKGN1cl9ub2RlKS8xMDI0LCB1c2VkLzEwMjQsCi0JICAg
ICAgeGVuc3RhdF9ub2RlX2ZyZWVfbWVtKGN1cl9ub2RlKS8xMDI0LCBmcmVlYWJsZV9tYioxMDI0
KTsKKwogCXByaW50KCJDUFVzOiAldSBAICVsbHVNSHpcbiIsCiAJICAgICAgeGVuc3RhdF9ub2Rl
X251bV9jcHVzKGN1cl9ub2RlKSwKIAkgICAgICB4ZW5zdGF0X25vZGVfY3B1X2h6KGN1cl9ub2Rl
KS8xMDAwMDAwKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
