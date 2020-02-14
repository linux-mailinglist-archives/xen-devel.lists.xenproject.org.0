Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6508815D5F3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 11:43:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2YNR-0004zS-VE; Fri, 14 Feb 2020 10:39:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8SxQ=4C=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j2YNQ-0004zN-6O
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 10:39:16 +0000
X-Inumbo-ID: 3e27c3f9-4f16-11ea-b9ff-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e27c3f9-4f16-11ea-b9ff-12813bfff9fa;
 Fri, 14 Feb 2020 10:39:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so10312318wrd.9
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2020 02:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=otVA7I+orJUrwi6e4ebrLcEm0uIL+E+BddGVLGGzYOU=;
 b=KexOu4MaeISAmNAq0AGjwRILP3OWyOBYTGZQn+AcuqWapEJ4luUUQ1publnSx2jmUP
 XRtbbaWtZuXvKExDJ09tg94tfg2uBbeh765z7fgdkvhPKs6+JzI9NR9epMzSFk3oxvka
 DroND6agLYoTTUY3r/a6wGj/rJPmfaYI7L92MQbTKyb0+IaXSruBUCAs+bZz6+wM7OHP
 lR7z9EEbfJebUYptccUX1NkCxRRtWCKuGFd2aFR8W+rhzjWMSLK9MenBAwnKMD3i44uI
 KYnHxU9DcgK3lJW5qtXRhggEZ8oxljqv5egc/IKdaY5IZDT/7Y9c+l+INiQQbDuMNy9O
 Bvdw==
X-Gm-Message-State: APjAAAWe6C4pzV7VYgtW/c1GL7glKrfZTE4ulBGW+CZYCjP+vWSplkE9
 JXVfYCa9gbHju4jDWok3u7LuRNdA97E=
X-Google-Smtp-Source: APXvYqxCvZKMwlVzLCF3yqPIzXsTfMP9/Z4JgkTHt6PBQ6FCScCPe2b1tJreu/Jqgd6vJ1ZiLIebOQ==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr3287417wru.353.1581676754401; 
 Fri, 14 Feb 2020 02:39:14 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 n13sm6977381wmd.21.2020.02.14.02.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 02:39:13 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 14 Feb 2020 10:39:11 +0000
Message-Id: <20200214103911.7995-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxl: mark parameters in stub functions as
 unused
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SG9wZWZ1bGx5IHRoaXMgY2FuIGZpeCBpc3N1ZXMgbGlrZToKCkluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuLi8uLi9zcmMvbGlieGwveGVuX3hsLmM6MjQ6MDoKL2hvbWUvb3NzdGVzdC9idWlsZC4xNDcw
MzUuYnVpbGQtYW1kNjQtbGlidmlydC94ZW5kaXN0L3Vzci9sb2NhbC9pbmNsdWRlL2xpYnhsLmg6
IEluIGZ1bmN0aW9uICdsaWJ4bF9jcHVpZF9hcHBseV9wb2xpY3knOgovaG9tZS9vc3N0ZXN0L2J1
aWxkLjE0NzAzNS5idWlsZC1hbWQ2NC1saWJ2aXJ0L3hlbmRpc3QvdXNyL2xvY2FsL2luY2x1ZGUv
bGlieGwuaDoyMzQ1OjU2OiBlcnJvcjogdW51c2VkIHBhcmFtZXRlciAnY3R4JyBbLVdlcnJvcj11
bnVzZWQtcGFyYW1ldGVyXQogc3RhdGljIGlubGluZSB2b2lkIGxpYnhsX2NwdWlkX2FwcGx5X3Bv
bGljeShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQpIHt9CgpGaXhlczogZGFjYjgwZjkg
KCJ0b29scy9saWJ4bDogUmVtb3ZlIGxpYnhsX2NwdWlkX3tzZXQsYXBwbHlfcG9saWN5fSgpIGZy
b20gdGhlIEFQSSIpClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQpOb3Qg
YWJsZSB0byB0ZXN0IHRoaXMgbG9jYWxseSwgcGxlYXNlIHJldmlldyBjYXJlZnVsbHkuLi4KLS0t
CiB0b29scy9saWJ4bC9saWJ4bC5oIHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bC5oIGIvdG9vbHMvbGlieGwvbGlieGwuaAppbmRleCBkMWQzMWIxZTY3Li5mZGU4NTQ4ODQ3
IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
LmgKQEAgLTIzNDIsOSArMjM0MiwxMyBAQCBpbnQgbGlieGxfY3B1aWRfcGFyc2VfY29uZmlnX3hl
bmQobGlieGxfY3B1aWRfcG9saWN5X2xpc3QgKmNwdWlkLAogICogY2hhbmdlIGluIHNvbWUgY2Fz
ZXMgZm9yIGV4aXN0aW5nIHNvZnR3YXJlLCBidXQgdGhlcmUgaXMgMCBvZiB0aGF0IGluCiAgKiBw
cmFjdGljZS4KICAqLwotc3RhdGljIGlubGluZSB2b2lkIGxpYnhsX2NwdWlkX2FwcGx5X3BvbGlj
eShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQpIHt9Ci1zdGF0aWMgaW5saW5lIHZvaWQg
bGlieGxfY3B1aWRfc2V0KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QgY3B1aWQp
IHt9CitzdGF0aWMgaW5saW5lIHZvaWQgbGlieGxfY3B1aWRfYXBwbHlfcG9saWN5KGxpYnhsX2N0
eCAqY3R4IF9fYXR0cmlidXRlX18oKHVudXNlZCkpLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQp
KSkKK3t9CitzdGF0aWMgaW5saW5lIHZvaWQgbGlieGxfY3B1aWRfc2V0KGxpYnhsX2N0eCAqY3R4
IF9fYXR0cmlidXRlX18oKHVudXNlZCkpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50MzJfdCBkb21pZCBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QgY3B1aWQgX19h
dHRyaWJ1dGVfXygodW51c2VkKSkpCit7fQogI2VuZGlmCiAKIC8qCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
