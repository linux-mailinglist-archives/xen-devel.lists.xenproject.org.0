Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA4B144B15
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LF-0005IS-I5; Wed, 22 Jan 2020 05:14:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5LR-0006CB-7K
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:02:13 +0000
X-Inumbo-ID: 0ba01650-3cbb-11ea-aecd-bc764e2007e4
Received: from mail-yw1-xc44.google.com (unknown [2607:f8b0:4864:20::c44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ba01650-3cbb-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 02:01:04 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id u139so2475016ywf.13
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SKS6qGVQV3GhDkVinOGX23DfUW5cRlK+gPrmn5t+rt8=;
 b=QqvKwHqfUBDWnaK1t+t8lIPlJ64yT0rqcIgd36G7Z1IgSiu2LqKQksmg4V1t2qiVj1
 9NDqsMs7TVl6yo7Lzox4lxongmQAbLqbSd2vYiLL+NOJGL6+Y+YwHysyaw5QjCwEIXmx
 /2M5D6AWaOah/Pr6mZnWbDhoIjmAamN48dXacpdJyMUisHuJW36BP6+N81B6zRSmV6a9
 +ocqm8fqrgSkgEytO2Ueh+Lcb7dJbuLXL+meXOT1LeVDE98rZHaIL1JaqBOU+RzxBgZz
 Yg1+GRsEzCUEn4JI+SjUD8X/clQLthHXscqQ2ydk/APxFy8LaqJROECxH7Cpo19zxJzs
 QZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SKS6qGVQV3GhDkVinOGX23DfUW5cRlK+gPrmn5t+rt8=;
 b=DXbWiPznyhI33fo7+tHtVvS0cPCL/Ya5EOfz8rwntx4jJUCdipi/xy7QYpLGD1Shu0
 zi0cNCinW16doDGY32RJ5smZS8rmf0SP0wJYejrXyQ6Lca/xOCU6DS1jQZQNzUMD6qE/
 mLdQkfg4Zc/XYiHjBQadK0aKgqJODK56G3AnudC2HZzRaktvsXhr4UH/6tNLxWe9MhWP
 j+tc04ciMpc2JkHVv/SASEquDgYprj8tBl8dxPi/JAler68CbbXvbvvXEJwir+gLyzVL
 qR/7/JZ75MJftJqT11G7FwGc6jk/+oTAtKQSCCrSHtzOwvugonLRFdr/sS4nNh2sFqlW
 4EvQ==
X-Gm-Message-State: APjAAAX87inVJMrKdLTojf8F3HK07c+8Ho3W0oAMQywlVUFh8uBLiQfP
 tMu1ubQKkm1ED7rJ4nRkyNf5EpuHBO7M6Q==
X-Google-Smtp-Source: APXvYqwdTZN3WwMYDU3zmoqR6t1y+daSlmYjKiv8apFvQlfQt2X0uaYbhJsNjAFTrpIY3+USD+lXow==
X-Received: by 2002:a81:af56:: with SMTP id x22mr6001949ywj.153.1579658463416; 
 Tue, 21 Jan 2020 18:01:03 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:01:03 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:59:00 -0600
Message-Id: <b92b559b1b6b7fd089c4c39099bd70c71be9b35f.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 21/23] riscv: Add percpu.c
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
IHhlbi9hcmNoL3Jpc2N2L3BlcmNwdS5jIHwgODQgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3YvcGVyY3B1LmMKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9yaXNjdi9wZXJjcHUuYyBiL3hlbi9hcmNoL3Jpc2N2L3BlcmNwdS5jCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjI1NDQyYzQ4ZmUKLS0tIC9kZXYvbnVsbAorKysgYi94
ZW4vYXJjaC9yaXNjdi9wZXJjcHUuYwpAQCAtMCwwICsxLDg0IEBACisjaW5jbHVkZSA8eGVuL3Bl
cmNwdS5oPgorI2luY2x1ZGUgPHhlbi9jcHUuaD4KKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgorI2lu
Y2x1ZGUgPHhlbi9tbS5oPgorI2luY2x1ZGUgPHhlbi9yY3VwZGF0ZS5oPgorCit1bnNpZ25lZCBs
b25nIF9fcGVyX2NwdV9vZmZzZXRbTlJfQ1BVU107CisjZGVmaW5lIElOVkFMSURfUEVSQ1BVX0FS
RUEgKC0obG9uZylfX3Blcl9jcHVfc3RhcnQpCisjZGVmaW5lIFBFUkNQVV9PUkRFUiAoZ2V0X29y
ZGVyX2Zyb21fYnl0ZXMoX19wZXJfY3B1X2RhdGFfZW5kLV9fcGVyX2NwdV9zdGFydCkpCisKK3Zv
aWQgX19pbml0IHBlcmNwdV9pbml0X2FyZWFzKHZvaWQpCit7CisgICAgdW5zaWduZWQgaW50IGNw
dTsKKyAgICBmb3IgKCBjcHUgPSAxOyBjcHUgPCBOUl9DUFVTOyBjcHUrKyApCisgICAgICAgIF9f
cGVyX2NwdV9vZmZzZXRbY3B1XSA9IElOVkFMSURfUEVSQ1BVX0FSRUE7Cit9CisKK3N0YXRpYyBp
bnQgaW5pdF9wZXJjcHVfYXJlYSh1bnNpZ25lZCBpbnQgY3B1KQoreworICAgIGNoYXIgKnA7Cisg
ICAgaWYgKCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0gIT0gSU5WQUxJRF9QRVJDUFVfQVJFQSApCisg
ICAgICAgIHJldHVybiAtRUJVU1k7CisgICAgaWYgKCAocCA9IGFsbG9jX3hlbmhlYXBfcGFnZXMo
UEVSQ1BVX09SREVSLCAwKSkgPT0gTlVMTCApCisgICAgICAgIHJldHVybiAtRU5PTUVNOworICAg
IG1lbXNldChwLCAwLCBfX3Blcl9jcHVfZGF0YV9lbmQgLSBfX3Blcl9jcHVfc3RhcnQpOworICAg
IF9fcGVyX2NwdV9vZmZzZXRbY3B1XSA9IHAgLSBfX3Blcl9jcHVfc3RhcnQ7CisgICAgcmV0dXJu
IDA7Cit9CisKK3N0cnVjdCBmcmVlX2luZm8geworICAgIHVuc2lnbmVkIGludCBjcHU7CisgICAg
c3RydWN0IHJjdV9oZWFkIHJjdTsKK307CitzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGZy
ZWVfaW5mbywgZnJlZV9pbmZvKTsKKworc3RhdGljIHZvaWQgX2ZyZWVfcGVyY3B1X2FyZWEoc3Ry
dWN0IHJjdV9oZWFkICpoZWFkKQoreworICAgIHN0cnVjdCBmcmVlX2luZm8gKmluZm8gPSBjb250
YWluZXJfb2YoaGVhZCwgc3RydWN0IGZyZWVfaW5mbywgcmN1KTsKKyAgICB1bnNpZ25lZCBpbnQg
Y3B1ID0gaW5mby0+Y3B1OworICAgIGNoYXIgKnAgPSBfX3Blcl9jcHVfc3RhcnQgKyBfX3Blcl9j
cHVfb2Zmc2V0W2NwdV07CisgICAgZnJlZV94ZW5oZWFwX3BhZ2VzKHAsIFBFUkNQVV9PUkRFUik7
CisgICAgX19wZXJfY3B1X29mZnNldFtjcHVdID0gSU5WQUxJRF9QRVJDUFVfQVJFQTsKK30KKwor
c3RhdGljIHZvaWQgZnJlZV9wZXJjcHVfYXJlYSh1bnNpZ25lZCBpbnQgY3B1KQoreworICAgIHN0
cnVjdCBmcmVlX2luZm8gKmluZm8gPSAmcGVyX2NwdShmcmVlX2luZm8sIGNwdSk7CisgICAgaW5m
by0+Y3B1ID0gY3B1OworICAgIGNhbGxfcmN1KCZpbmZvLT5yY3UsIF9mcmVlX3BlcmNwdV9hcmVh
KTsKK30KKworc3RhdGljIGludCBjcHVfcGVyY3B1X2NhbGxiYWNrKAorICAgIHN0cnVjdCBub3Rp
Zmllcl9ibG9jayAqbmZiLCB1bnNpZ25lZCBsb25nIGFjdGlvbiwgdm9pZCAqaGNwdSkKK3sKKyAg
ICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpaGNwdTsKKyAgICBpbnQgcmMgPSAw
OworCisgICAgc3dpdGNoICggYWN0aW9uICkKKyAgICB7CisgICAgY2FzZSBDUFVfVVBfUFJFUEFS
RToKKyAgICAgICAgcmMgPSBpbml0X3BlcmNwdV9hcmVhKGNwdSk7CisgICAgICAgIGJyZWFrOwor
ICAgIGNhc2UgQ1BVX1VQX0NBTkNFTEVEOgorICAgIGNhc2UgQ1BVX0RFQUQ6CisgICAgICAgIGZy
ZWVfcGVyY3B1X2FyZWEoY3B1KTsKKyAgICAgICAgYnJlYWs7CisgICAgZGVmYXVsdDoKKyAgICAg
ICAgYnJlYWs7CisgICAgfQorCisgICAgcmV0dXJuICFyYyA/IE5PVElGWV9ET05FIDogbm90aWZp
ZXJfZnJvbV9lcnJubyhyYyk7Cit9CisKK3N0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgY3B1
X3BlcmNwdV9uZmIgPSB7CisgICAgLm5vdGlmaWVyX2NhbGwgPSBjcHVfcGVyY3B1X2NhbGxiYWNr
LAorICAgIC5wcmlvcml0eSA9IDEwMCAvKiBoaWdoZXN0IHByaW9yaXR5ICovCit9OworCitzdGF0
aWMgaW50IF9faW5pdCBwZXJjcHVfcHJlc21wX2luaXQodm9pZCkKK3sKKyAgICByZWdpc3Rlcl9j
cHVfbm90aWZpZXIoJmNwdV9wZXJjcHVfbmZiKTsKKyAgICByZXR1cm4gMDsKK30KK3ByZXNtcF9p
bml0Y2FsbChwZXJjcHVfcHJlc21wX2luaXQpOwotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
