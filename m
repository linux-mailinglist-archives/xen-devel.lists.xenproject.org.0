Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F212F144B20
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:17:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8L9-00058F-LP; Wed, 22 Jan 2020 05:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5Ki-00068t-54
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:28 +0000
X-Inumbo-ID: 02b0ef06-3cbb-11ea-9fd7-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02b0ef06-3cbb-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:49 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id c13so2410940ybq.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXIZq7tT5AofAb/PhGxVJPY146dZrQoSr7TqNUyNaBo=;
 b=BdWVII49282PFkD0jBmbhY79KHtyX1vqgAoM+U11AMiP413n3wLCWabalAUhrilozu
 pb/OwR0Vpyq7A2Ty/u1xp3U0Yn8068j3CuZFou3BGKpCsoZ6lhy+2rM34stKazIgYcT4
 3osuhHDNqNDXenzB9yTP5kSDrJ+eb0hW+j4ZfKIybj5h03otxrPT8kGtUGvt9Z+gVItx
 ulo5oS00GJRF+qF94CfSD07JsMNXeWUqzlfNF5HQ3u+OOfDfsgpYZMRIp6EvciR5kVn6
 jl9L4V64UKjzAFMuCw0N+O4Oo41Pwxwc0W0upD6+k/nSBq9ALTRaohJ15FmDPj9drC69
 mhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXIZq7tT5AofAb/PhGxVJPY146dZrQoSr7TqNUyNaBo=;
 b=qUBpMbfcmaERmgwoAYCnC1sRPTsJ/5gnz6Tfu0goWvC8asyCJ+ZmOqBKfDt3mwHK8f
 N00mEUymDgW70+d9eX+3D+D4/mu8E2XPZckrEm8meuEEgYV99LwruM3hcPuzXT84Krol
 /DtCIm7EUukb7ffwWncEm17tYImF0H9jSDuEI0voaf29psSvJU9nr0ftpyrJ/0zvRe/L
 ydY9fjOru/bCkC0jOeUMOI4iRd3P+r1+2mLcX+9vwnPHGJ+agdqam+1q3VpmI238fuCk
 8zZzWNv6eq6FrfegLYuVVCgjaAaI5mPbN+CjZdOCZgx7/4emIH7prMZ2+UdDNeJYCN3Y
 cCPQ==
X-Gm-Message-State: APjAAAUbUOMns9jJ03SpFiMtAkBAw4jvcTH8JvKX9P2TFMeGusLauNuX
 kFgq3eAHCcJy77vsP3FFfVIWXufky9JIYQ==
X-Google-Smtp-Source: APXvYqxrYfyfh6RW34AeVTgBZxCXIBF+OEAIJsKBiD6cmISl/EIvfVWicHERwWI+QU4LoqsIlfkwSA==
X-Received: by 2002:a81:4303:: with SMTP id q3mr5540359ywa.242.1579658448042; 
 Tue, 21 Jan 2020 18:00:48 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:47 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:51 -0600
Message-Id: <c72d23e1c8bb8edbe638935cb74fa3bd348eba4e.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 12/23] riscv: Add time.c
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9hcmNoL3Jpc2N2L3RpbWUuYyB8IDc0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3YvdGltZS5jCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
cmlzY3YvdGltZS5jIGIveGVuL2FyY2gvcmlzY3YvdGltZS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjUzNThhMjJiZDcKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJj
aC9yaXNjdi90aW1lLmMKQEAgLTAsMCArMSw3NCBAQAorLyoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1
Ymxpc2hlZCBieQorICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNp
b24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZl
cnNpb24uCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhv
dXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqLworCisjaW5jbHVkZSA8eGVuL2Nv
bnNvbGUuaD4KKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgorI2luY2x1ZGUgPHhlbi9pcnEuaD4KKyNp
bmNsdWRlIDx4ZW4vbGliLmg+CisjaW5jbHVkZSA8eGVuL21tLmg+CisjaW5jbHVkZSA8eGVuL3Nv
ZnRpcnEuaD4KKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KKyNpbmNsdWRlIDx4ZW4vdGltZS5oPgor
I2luY2x1ZGUgPHhlbi9zY2hlZC5oPgorI2luY2x1ZGUgPHhlbi9ldmVudC5oPgorI2luY2x1ZGUg
PHhlbi9jcHUuaD4KKyNpbmNsdWRlIDx4ZW4vbm90aWZpZXIuaD4KKyNpbmNsdWRlIDxhc20vc3lz
dGVtLmg+CisjaW5jbHVkZSA8YXNtL3RpbWUuaD4KKwordW5zaWduZWQgbG9uZyBfX3JlYWRfbW9z
dGx5IGNwdV9raHo7ICAvKiBDUFUgY2xvY2sgZnJlcXVlbmN5IGluIGtIei4gKi8KKwordWludDY0
X3QgX19yZWFkX21vc3RseSBib290X2NvdW50OworCitzX3RpbWVfdCB0aWNrc190b19ucyh1aW50
NjRfdCB0aWNrcykKK3sKKyAgICByZXR1cm4gbXVsZGl2NjQodGlja3MsIFNFQ09ORFMoMSksIDEw
MDAgKiBjcHVfa2h6KTsKK30KKwordm9pZCBfX2luaXQgcHJlaW5pdF94ZW5fdGltZSh2b2lkKQor
eworICAgIGlmICggIWNwdV9raHogKQorICAgICAgICBjcHVfa2h6ID0gMTAwMDsKKworICAgIGJv
b3RfY291bnQgPSBnZXRfY3ljbGVzKCk7Cit9CisKK3NfdGltZV90IGdldF9zX3RpbWUodm9pZCkK
K3sKKyAgICB1aW50NjRfdCB0aWNrcyA9IGdldF9jeWNsZXMoKSAtIGJvb3RfY291bnQ7CisgICAg
cmV0dXJuIHRpY2tzX3RvX25zKHRpY2tzKTsKK30KKworCisvKiBWQ1BVIFBWIHRpbWVycy4gKi8K
K3ZvaWQgc2VuZF90aW1lcl9ldmVudChzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICBzZW5kX2d1ZXN0
X3ZjcHVfdmlycSh2LCBWSVJRX1RJTUVSKTsKK30KKworLyogVkNQVSBQViBjbG9jay4gKi8KK3Zv
aWQgdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUoc3RydWN0IHZjcHUgKnYpCit7CisgICAgLyogWFhY
IHVwZGF0ZSBzaGFyZWRfaW5mby0+d2NfKiAqLworfQorCit2b2lkIGRvbWFpbl9zZXRfdGltZV9v
ZmZzZXQoc3RydWN0IGRvbWFpbiAqZCwgaW50NjRfdCB0aW1lX29mZnNldF9zZWNvbmRzKQorewor
ICAgIGQtPnRpbWVfb2Zmc2V0X3NlY29uZHMgPSB0aW1lX29mZnNldF9zZWNvbmRzOworfQorCitp
bnQgcmVwcm9ncmFtX3RpbWVyKHNfdGltZV90IHRpbWVvdXQpCit7CisgICAgLyogVE9ETyAqLwor
CisgICAgcmV0dXJuIDA7Cit9Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
