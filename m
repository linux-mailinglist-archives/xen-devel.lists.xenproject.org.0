Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FED16C07F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:13:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Z39-0000wA-8A; Tue, 25 Feb 2020 12:10:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpqO=4N=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j6Z37-0000w4-2f
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:10:53 +0000
X-Inumbo-ID: ddeed0e8-57c7-11ea-92e4-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddeed0e8-57c7-11ea-92e4-12813bfff9fa;
 Tue, 25 Feb 2020 12:10:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so14398162wrs.12
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 04:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QyABrfa1WXTfNKFspuVD47XaadKxtXWMBSUlFih5a3Q=;
 b=s5cbWuokLxAXJH0JOfOJe8gsFk/z1iXSKU9kv9AZMXMbU4i3rMhZWK2sMP/R2hZELO
 DZ5QPtmW5K06ymc5jyOqPEMoSf3ATUUXnk3AXss7FEUNzUlditvvueqpR5mQfdaKrL/W
 5td405iS1ozkQVKxo8P4lcVgfhftT8O34kuBo8ERLwUovg+9bKn0U8McFfWTxWHSSB2x
 3R+RSO4MQ20icC3ydKyLOBVJm3SHjtQ0ElYDTftl7TT/1uAAm9dR4V7iGmy/LbId/lZ+
 0CylMxP4QXDBavrJtX8IvPbFbRTPXtIgwToE2G9bnYPSTwL/3/p+1b6ZLegNrdfXfMhx
 DVmg==
X-Gm-Message-State: APjAAAUfujIOGUfJf64U8aIcgyAHETWI4xTbSxaheD/KFDOxyA7ooQ2d
 FlYlHwia0FwqWmgRWu7Ckkj+BGSe
X-Google-Smtp-Source: APXvYqw9ckQm6h24hPVaTdBa7YznHvbpflgUIb1Pd39jDc4Sf5eg6DgUoaxHM7GRlbb75szqlOBrPA==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr14380wrm.108.1582632651678;
 Tue, 25 Feb 2020 04:10:51 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 j15sm24206507wrp.9.2020.02.25.04.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 04:10:51 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue, 25 Feb 2020 12:10:48 +0000
Message-Id: <20200225121048.5889-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] automation: document vsyscall=emulate for old
 glibc
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiBhdXRvbWF0aW9uL2J1aWxk
L1JFQURNRS5tZCB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQgYi9hdXRvbWF0aW9u
L2J1aWxkL1JFQURNRS5tZAppbmRleCA0NzZmODJjZjQ1Li44Y2RhMmI2NWE1IDEwMDY0NAotLS0g
YS9hdXRvbWF0aW9uL2J1aWxkL1JFQURNRS5tZAorKysgYi9hdXRvbWF0aW9uL2J1aWxkL1JFQURN
RS5tZApAQCAtNTgsNiArNTgsMTYgQEAgdW5kZXJzdGFuZHMuCiAtIFhFTl9DT05GSUdfRVhQRVJU
OiBJZiB0aGlzIGlzIGRlZmluZWQgaW4geW91ciBzaGVsbCBpdCB3aWxsIGJlCiAgIGF1dG9tYXRp
Y2FsbHkgcGFzc2VkIHRocm91Z2ggdG8gdGhlIGNvbnRhaW5lci4KIAorSWYgeW91ciBkb2NrZXIg
aG9zdCBoYXMgTGludXgga2VybmVsID4gNC4xMSwgYW5kIHlvdSB3YW50IHRvIHVzZSBjb250YWlu
ZXJzCit0aGF0IHJ1biBvbGQgZ2xpYmMgKGZvciBleGFtcGxlLCBDZW50T1MgNiBvciBTTEVTMTFT
UDQpLCB5b3UgbWF5IG5lZWQgdG8gYWRkCisKK2BgYAordnN5c2NhbGw9ZW11bGF0ZQorYGBgCisK
K3RvIHRoZSBob3N0IGtlcm5lbCBjb21tYW5kIGxpbmUuIFRoYXQgZW5hYmxlcyBhIGxlZ2FjeSBp
bnRlcmZhY2UgdGhhdCBpcyB1c2VkCitieSBvbGQgZ2xpYmMuCisKIAogQnVpbGRpbmcgYSBjb250
YWluZXIKIC0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
