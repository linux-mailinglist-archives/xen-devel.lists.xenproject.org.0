Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EAF144B11
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LB-00059k-Ft; Wed, 22 Jan 2020 05:14:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5L7-0006As-6X
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:53 +0000
X-Inumbo-ID: 08a21da4-3cbb-11ea-9fd7-bc764e2007e4
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08a21da4-3cbb-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:59 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id u139so2474936ywf.13
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQW8WpM6nDg7eCGRrRQSBBTg+fii2UtRhhnRM6FRLVo=;
 b=GeetlQ3zdtUVcYllXYR/Gk6iwJG5F++cuGCrqOrRTNef6RaitnnXSEzHV68prG8fVo
 qoZWPB7fbFThT87VtRNGc3CKJ1rcaasd2puLM9E1NHap87Wd3BlSAaZPjQ45cpvhyZUM
 xurnGQg73Jn2lsfN10BcaZPOuAuCH7CprLtRU9f2SXBZWrMqolE6264AHPVAKVaJNpyF
 g5mqVYoaOHmhY5USmbT1fHpTivnW8WmwI3OUjQkYgwQvYsl1CS1kltcscqrs6cTm0IHf
 enpWIPcue7C63n7yP6qAhA3s9qx3mmkg3tmUQZPIFV/9hisJAsgjcqs4TI+BiW5TSrh5
 W5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQW8WpM6nDg7eCGRrRQSBBTg+fii2UtRhhnRM6FRLVo=;
 b=mKnS0nMFeiCOijLwmofCdXH7wrGtapjjRTibxHGBSAGR6rCP+gYuFDHTDhIDKPo0Im
 6lwk09u/v5XXnU7D40tGNN6LiBvO/kQxFPuX+DxTDRJmKWY5Ek7OGoq8BfYbyPjhCJJT
 Elh3pxuA19aiMZUH5anDVpsq1lUGaiKjPh2sW91eUC/n5RyESpqTM37xkABS7ZCD4QR3
 Xs9JCsfzElaisPsA5EUsBSaQpc1tvmvMarcvVu79vZkGBrJsDxAmlp8EJW+9fiso+rAo
 SKWMaMtm/aH9mDSqrRnptrGpK1vOgTpUdyLCyV5EcUx+bD1QUtmBSKwp0EdL8+xA+34V
 zxpQ==
X-Gm-Message-State: APjAAAUyVxqQS/lppwY/ad8pjq6lOx2tmGgYXe4DBnUmEBzdxYHKMgPc
 fkry0mqZdM/yWJbbyHHCNtyUGWYf1Ch1uA==
X-Google-Smtp-Source: APXvYqwkutGnfWpAoGl7+5WrmAsm3Q07wcNCyN0geOzPttU+UScZTpzVi09FdPcxFHHFtUCMN++zng==
X-Received: by 2002:a81:6c92:: with SMTP id h140mr5613269ywc.246.1579658458339; 
 Tue, 21 Jan 2020 18:00:58 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:57 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:56 -0600
Message-Id: <71c1fc0cb432e13dd1ec739c3350efafe67e5591.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 17/23] riscv: Add vm_event.c
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
IHhlbi9hcmNoL3Jpc2N2L3ZtX2V2ZW50LmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3Yvdm1fZXZlbnQuYwoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3Jpc2N2L3ZtX2V2ZW50LmMgYi94ZW4vYXJjaC9yaXNjdi92bV9ldmVudC5jCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmIwZDNiOWNjYmQKLS0tIC9kZXYvbnVsbAor
KysgYi94ZW4vYXJjaC9yaXNjdi92bV9ldmVudC5jCkBAIC0wLDAgKzEsNDIgQEAKKy8qCisgKiBB
cmNoaXRlY3R1cmUtc3BlY2lmaWMgdm1fZXZlbnQgaGFuZGxpbmcgcm91dGluZXMKKyAqCisgKiBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yCisgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMKKyAqIExpY2Vuc2UgdjIgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24uCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhv
dXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAqIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiBZb3Ugc2hvdWxkIGhhdmUg
cmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2UgYWxv
bmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGlj
ZW5zZXMvPi4KKyAqLworCisjaW5jbHVkZSA8eGVuL3NjaGVkLmg+CisjaW5jbHVkZSA8YXNtL3Zt
X2V2ZW50Lmg+CisKK3ZvaWQgdm1fZXZlbnRfZmlsbF9yZWdzKHZtX2V2ZW50X3JlcXVlc3RfdCAq
cmVxKQoreworICAgIC8qIFRPRE8gKi8KK30KKwordm9pZCB2bV9ldmVudF9zZXRfcmVnaXN0ZXJz
KHN0cnVjdCB2Y3B1ICp2LCB2bV9ldmVudF9yZXNwb25zZV90ICpyc3ApCit7CisgICAgLyogVE9E
TyAqLworfQorCit2b2lkIHZtX2V2ZW50X21vbml0b3JfbmV4dF9pbnRlcnJ1cHQoc3RydWN0IHZj
cHUgKnYpCit7CisgICAgLyogTm90IHN1cHBvcnRlZCBvbiBBUk0uICovCit9CisKKy8qCisgKiBM
b2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBj
LWJhc2ljLW9mZnNldDogNAorICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8K
LS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
