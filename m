Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C0256E4
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 19:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT8i5-0007Z0-FJ; Tue, 21 May 2019 17:37:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zIO+=TV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hT8i4-0007Yf-59
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 17:37:56 +0000
X-Inumbo-ID: 29ba55bd-7bef-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29ba55bd-7bef-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 17:37:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f1so13766714lfl.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tSMA8QyqFc8QL3sLZnnhSEVNYV9FEcTYvBxJXAcykl8=;
 b=n3Is9VcDyA737g+CrDnIYIbQ7Jq+Tw5EmQh3+9yhQlQzslfXLIV2sdP8c1QMIG2+f8
 k/5uUXiaZ5mr7tZyKpaIhiO/5AD59lpqax67SRX/AQLJY25Bi1xpiNbJe9AGEBckSE7L
 62Aa6hEzAGj46kZSGvWIhJq/fZCCAmof193hqr1FtUUI0RGTzqf1GzMTtVheVdzIe6uk
 Eu5caUa2AFhOHZH2YsoFQYF5W7FeMpG2++glXYcLAGURlQA+LCu6ajK4YIgBnaGj/jKg
 siM8DppmJXjLbISsAeXFPtISgBbQ8542w8SdeNifn3bJWrUWoeXAbjX3wOgBe8vYEPPR
 7Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tSMA8QyqFc8QL3sLZnnhSEVNYV9FEcTYvBxJXAcykl8=;
 b=B+yOYubMbHZOFyptQgTshcUcZKY76aIrz4ZoWQ64VGjcHb8IE8xoLa9C88inZ7ENbb
 J/BiwCPNnXsfKAfwtMhCkHSb7u81+ASn6dpbAJ/pq6jPcjjyAMjV3UsZHwboiGi3rErW
 vFq3eVZQ61/MCGsebQMwRJMgIj9ebIhH1l3dslTteEYa5DueRLOgn5FSoZj6vMb+4gvX
 gvTJOKQH1CCC/jST0Ks87H+9EcuYni2cy3FnTUDfmYOAzAz7KORGNmeJiCDyiuFzBY0c
 kF34hG6NBhrRcldkr4y36tJyrEL777TnsXfJ1ECmJqxQvN5Cseh6phSDasjMKluGrjcx
 hI2Q==
X-Gm-Message-State: APjAAAW++fxck970OcZ+1vICQ5PaPRU9lKDAm4J0SFICIOMQ+CGvpGeK
 +3fbq1XfrTQAf9v2LmV0K6395iEmdcg=
X-Google-Smtp-Source: APXvYqx4gtZ5kbgyjl8OcA6itnnfJtEp+CA0vz4g7b5FiN6uQ52b28IPSE2RRFhunb0qWjMalh2/Zw==
X-Received: by 2002:ac2:510b:: with SMTP id q11mr39598394lfb.11.1558460273136; 
 Tue, 21 May 2019 10:37:53 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w19sm4827807lfk.56.2019.05.21.10.37.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 May 2019 10:37:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 May 2019 20:37:33 +0300
Message-Id: <1558460254-7127-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V1 1/2] xen/device-tree: Add
 dt_count_phandle_with_args helper
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKUG9ydCBMaW51eCBoZWxwZXIgb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MgZm9yIGNvdW50
aW5nCm51bWJlciBvZiBwaGFuZGxlcyBpbiBhIHByb3BlcnR5LgoKUGxlYXNlIG5vdGUsIHRoaXMg
aGVscGVyIGlzIHBvcnRlZCBmcm9tIExpbnV4IHY0LjYuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CgotLS0KICAgIENo
YW5nZXMgUkZDIC0+IFYxOgogICAgICAgIC0gQWRkIExpbnV4IHZlcnNpb24gd2hpY2ggaXMgdXNl
ZCBhcyB0aGUgYmFzZS4KLS0tCiB4ZW4vY29tbW9uL2RldmljZV90cmVlLmMgICAgICB8ICA3ICsr
KysrKysKIHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIHwgMTkgKysrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9kZXZpY2VfdHJlZS5jIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jCmluZGV4IDhm
YzQwMWQuLjY1ODYyYjUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYworKysg
Yi94ZW4vY29tbW9uL2RldmljZV90cmVlLmMKQEAgLTE2NjMsNiArMTY2MywxMyBAQCBpbnQgZHRf
cGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpucCwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmRleCwgb3V0X2FyZ3Mp
OwogfQogCitpbnQgZHRfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MoY29uc3Qgc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpucCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFy
ICpsaXN0X25hbWUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
Y2VsbHNfbmFtZSkKK3sKKyAgICByZXR1cm4gX19kdF9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhu
cCwgbGlzdF9uYW1lLCBjZWxsc19uYW1lLCAwLCAtMSwgTlVMTCk7Cit9CisKIC8qKgogICogdW5m
bGF0dGVuX2R0X25vZGUgLSBBbGxvYyBhbmQgcG9wdWxhdGUgYSBkZXZpY2Vfbm9kZSBmcm9tIHRo
ZSBmbGF0IHRyZWUKICAqIEBmZHQ6IFRoZSBwYXJlbnQgZGV2aWNlIHRyZWUgYmxvYgpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggYi94ZW4vaW5jbHVkZS94ZW4vZGV2
aWNlX3RyZWUuaAppbmRleCA3NDA4YTZjLi44MzE1NjI5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vZGV2aWNlX3RyZWUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaApA
QCAtNzM4LDYgKzczOCwyNSBAQCBpbnQgZHRfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoY29uc3Qg
c3RydWN0IGR0X2RldmljZV9ub2RlICpucCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpjZWxsc19uYW1lLCBpbnQgaW5kZXgsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGR0X3BoYW5kbGVfYXJncyAqb3V0X2FyZ3MpOwogCisvKioKKyAq
IGR0X2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzKCkgLSBGaW5kIHRoZSBudW1iZXIgb2YgcGhhbmRs
ZXMgcmVmZXJlbmNlcyBpbiBhIHByb3BlcnR5CisgKiBAbnA6IHBvaW50ZXIgdG8gYSBkZXZpY2Ug
dHJlZSBub2RlIGNvbnRhaW5pbmcgYSBsaXN0CisgKiBAbGlzdF9uYW1lOiBwcm9wZXJ0eSBuYW1l
IHRoYXQgY29udGFpbnMgYSBsaXN0CisgKiBAY2VsbHNfbmFtZTogcHJvcGVydHkgbmFtZSB0aGF0
IHNwZWNpZmllcyBwaGFuZGxlcycgYXJndW1lbnRzIGNvdW50CisgKgorICogUmV0dXJucyB0aGUg
bnVtYmVyIG9mIHBoYW5kbGUgKyBhcmd1bWVudCB0dXBsZXMgd2l0aGluIGEgcHJvcGVydHkuIEl0
CisgKiBpcyBhIHR5cGljYWwgcGF0dGVybiB0byBlbmNvZGUgYSBsaXN0IG9mIHBoYW5kbGUgYW5k
IHZhcmlhYmxlCisgKiBhcmd1bWVudHMgaW50byBhIHNpbmdsZSBwcm9wZXJ0eS4gVGhlIG51bWJl
ciBvZiBhcmd1bWVudHMgaXMgZW5jb2RlZAorICogYnkgYSBwcm9wZXJ0eSBpbiB0aGUgcGhhbmRs
ZS10YXJnZXQgbm9kZS4gRm9yIGV4YW1wbGUsIGEgZ3Bpb3MKKyAqIHByb3BlcnR5IHdvdWxkIGNv
bnRhaW4gYSBsaXN0IG9mIEdQSU8gc3BlY2lmaWVzIGNvbnNpc3Rpbmcgb2YgYQorICogcGhhbmRs
ZSBhbmQgMSBvciBtb3JlIGFyZ3VtZW50cy4gVGhlIG51bWJlciBvZiBhcmd1bWVudHMgYXJlCisg
KiBkZXRlcm1pbmVkIGJ5IHRoZSAjZ3Bpby1jZWxscyBwcm9wZXJ0eSBpbiB0aGUgbm9kZSBwb2lu
dGVkIHRvIGJ5IHRoZQorICogcGhhbmRsZS4KKyAqLworaW50IGR0X2NvdW50X3BoYW5kbGVfd2l0
aF9hcmdzKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbnAsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbGlzdF9uYW1lLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmNlbGxzX25hbWUpOworCiAjaWZkZWYgQ09ORklHX0RF
VklDRV9UUkVFX0RFQlVHCiAjZGVmaW5lIGR0X2RwcmludGsoZm10LCBhcmdzLi4uKSAgXAogICAg
IHByaW50ayhYRU5MT0dfREVCVUcgZm10LCAjIyBhcmdzKQotLSAKMi43LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
