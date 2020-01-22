Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839BC144B0F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LI-0005Oz-Fd; Wed, 22 Jan 2020 05:14:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5Lb-0006Co-72
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:02:23 +0000
X-Inumbo-ID: 0d189d18-3cbb-11ea-aecd-bc764e2007e4
Received: from mail-yw1-xc44.google.com (unknown [2607:f8b0:4864:20::c44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d189d18-3cbb-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 02:01:06 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id i126so2495080ywe.7
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/Qj314nUGRdjbntBZbYQP1MhXRJYFfaG0a5TIgJ0SE=;
 b=UPy7+4EjqTWccbmyyVRpXxIXJDYmd7uUGpqVPvLOwhLBAM38YgjYv+NmIMF1wiC2sv
 UuVk3gSnszs3QvZyHK4QmOC2RTzBafjLiIOVR2XOfKzxqDaBr3hlKrqmrSqDZhq5zi6/
 79VjlPsocbP3bUld0bWlqT+7bEdNqv3dAxs+bObV3ezMgmEN1xm1by24sljtseI+ln0G
 bNwYj31E7XisxGmnt2D1jsD4oBDvm8ZYuo6i7TwZHaq40/5GslqVNJTFLr3yOp4j624m
 ISv2wrW5NIPIXhgCoQTOxESlO83K02KG6U9t/OCqNyZkDKhkzvBxJ0biw62wbg9vKYS4
 xxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/Qj314nUGRdjbntBZbYQP1MhXRJYFfaG0a5TIgJ0SE=;
 b=GcZFGwSrNFyrFDbRZ8DqMQRLd1OzG8dPNSmeCqozK2WqKYnjm9BLKiKPLgEJoeliUf
 VVHjjKDTYIcsz8Jm2eSU655ODLW+NPyJpT6M7IrxTlCHPihNYUCHcfYN4XhpD2VP9YPp
 YKtIIA67IvO9HRGzZIpbxpymvKCLWokLJDEeDY+27LCVOtGqR2oHECh3ptk6/Be2mbhp
 vgJNQLT5tSDQr3/BKg4bpZYUap9gFT7FlJm5ISJ8RZ3zmiRaHBPypQHst7rgQ54TezDV
 ihYLemJn5Sg1Q5pQSJeA48mPfdU7S/YHzI16tI8MYawRK43NAXWkzf4gOyFGfwPrWxOz
 moIA==
X-Gm-Message-State: APjAAAXNZaUP78S4aDnEFd/UalbpQNmIZfniPmfHZC96PQu8m45EnU+a
 dOJSemq4qCjSepC8qFa7soD6iV37Aa6hOQ==
X-Google-Smtp-Source: APXvYqypHKIk5UUrw8rF3FWiaK/rQhG3UZUfVJiEceqrSNmqzopVrv/cc+A4YsKPUfjgQE2In11pRw==
X-Received: by 2002:a81:294c:: with SMTP id p73mr802039ywp.477.1579658465813; 
 Tue, 21 Jan 2020 18:01:05 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:01:05 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:59:02 -0600
Message-Id: <387e30c429bca2ca976a6fa76b601dacf3ca9e1e.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 23/23] riscv: Add iommu.c
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

U2lnbmVkLW9mZi1ieTogQm9iYnkgRXNobGVtYW4gPGJvYmJ5ZXNobGVtYW5AZ21haWwuY29tPgot
LS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Jpc2N2L2lvbW11LmMgfCA3NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcmlzY3YvaW9tbXUuYwoKZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Jpc2N2L2lvbW11LmMgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9yaXNjdi9pb21tdS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjgxZGI0OTU4YjIKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9yaXNjdi9pb21tdS5jCkBAIC0wLDAgKzEsNzQgQEAKKy8qCisgKiBJT01NVSBm
cmFtZXdvcmsgZm9yIFJJU0MtVgorICoKKyAqIEJhc2VkIG9mZiBwYXNzdGhyb3VnaC9hcm0vaW9t
bXUuYworICoKKyAqIEJvYmJ5IEVzaGxlbWFuIDxib2JieWVzaGxlbWFuQGdtYWlsPgorICogQ29w
eXJpZ2h0IChjKSAyMDE5CisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNl
bnNlLCBvcgorICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisgKiBU
aGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVz
ZWZ1bCwKKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBs
aWVkIHdhcnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJU
SUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBm
b3IgbW9yZSBkZXRhaWxzLgorICovCisKKyNpbmNsdWRlIDx4ZW4vaW9tbXUuaD4KKworc3RhdGlj
IGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11X29wczsKKworY29uc3Qgc3RydWN0IGlvbW11
X29wcyAqaW9tbXVfZ2V0X29wcyh2b2lkKQoreworICAgIHJldHVybiBpb21tdV9vcHM7Cit9CisK
K3ZvaWQgX19pbml0IGlvbW11X3NldF9vcHMoY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzKQor
eworICAgIEJVR19PTihvcHMgPT0gTlVMTCk7CisKKyAgICBpZiAoIGlvbW11X29wcyAmJiBpb21t
dV9vcHMgIT0gb3BzICkKKyAgICB7CisgICAgICAgIHByaW50aygiV0FSTklORzogQ2Fubm90IHNl
dCBJT01NVSBvcHMsIGFscmVhZHkgc2V0IHRvIGEgZGlmZmVyZW50IHZhbHVlXG4iKTsKKyAgICAg
ICAgcmV0dXJuOworICAgIH0KKworICAgIGlvbW11X29wcyA9IG9wczsKK30KKworaW50IF9faW5p
dCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQoreworICAgIC8qIFRPRE8gKi8KKyAgICByZXR1
cm4gMDsKK30KKwordm9pZCBfX2h3ZG9tX2luaXQgYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNs
YXRlZF9od2RvbShzdHJ1Y3QgZG9tYWluICpkKQoreworICAgIC8qIFRPRE8gKi8KKyAgICByZXR1
cm47Cit9CisKK2ludCBhcmNoX2lvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCit7
CisgICAgLyogVE9ETyAqLworICAgIHJldHVybiAwOworfQorCit2b2lkIGFyY2hfaW9tbXVfZG9t
YWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKK3sKKyAgICAvKiBUT0RPICovCit9CisKK2lu
dCBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoc3RydWN0IGRvbWFpbiAqZCkKK3sKKyAg
ICAvKiBUT0RPICovCisgICAgcmV0dXJuIC1FTk9TWVM7Cit9CisKK3ZvaWQgX19od2RvbV9pbml0
IGFyY2hfaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQoreworICAgIC8qIFRPRE8g
Ki8KK30KLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
