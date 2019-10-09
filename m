Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5DD1116
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 16:22:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iICpF-0007SC-3K; Wed, 09 Oct 2019 14:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Wiy=YC=gmail.com=joculator@srs-us1.protection.inumbo.net>)
 id 1iICpD-0007S7-W1
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:20:24 +0000
X-Inumbo-ID: edea22a8-ea9f-11e9-8c93-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edea22a8-ea9f-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 14:20:23 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d1so2642580ljl.13
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8m4lcQ86Sbc2jn2ZAfM8/awrc/xYwHfZf0elvolysmI=;
 b=m9lpim1miWzCM0z4l0xYYg/qurG0wmUlbDToTjVT1LqKGG+Eub3DqRtbsvkg5m+kFv
 S9Vhi/NkzhRINDN2yEwMNV03yYKzjj8MEp1BAWEC1lSEgryCvqmr1XchHO3DN3FwV9E8
 EBdUrB1AQugZF9sJaAxD+zVBZ8IyQZdyVaC+OU8iwug2DC4BZMTpkIFlHXvMHJAKd0Li
 cIxljwh0GYKmJ9eLznPv3kT4GPeFFZlkDpqP7bdikAI6FDXZhkNAAEo0UXB4sMqyDUuv
 QW5IVoubbhW1Mgy07kqfyWo8udfS020mfB3vGtLvT3wfPD8cnoikJO+pJVB6soVGIJ2Y
 2oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8m4lcQ86Sbc2jn2ZAfM8/awrc/xYwHfZf0elvolysmI=;
 b=Apky9wLCwFYFmqy3aPhe0dCJhmTgMnvT4eHzwbehzLKcEHa05FJ8bTNKegUIRc1jcc
 3BY0de5N/aUpeUA6JffNYMBKo+vYzVO4LeXE+vqw0Lwv7OliJagq38n4HAInAzGarqMv
 0gPqlZt4p1AlBxEvExIxyU+FbGlLFQUPYTjNMBwxF5pIUXl/aeVC6EvfV01USp30Z8hE
 GN2eBhWBFGRrluT+74lbulE+7ThsOn1p69O3bFiOFhnNHMHIQxNda2DdZt2GAFjMEwqG
 WBdMJEIkc7C7795G/nm5kVARf2LnvDOv9AItoyVdfNaH90/9PajF9uj/F/4AEfSIgwLQ
 uuzw==
X-Gm-Message-State: APjAAAWCKHC2JQ3E7Zh98Rt6fsL1SYEZyTbF3e2HcMVwS8q/Mcp0qxO/
 C+lG3m3wLIP7aOTzRF3oSxGGJYmQtsU=
X-Google-Smtp-Source: APXvYqzbv37zvWU/2EzBr7X6slU+m5FW4tztDyadB9qsbSCSusW+lcgV09ThMKV2SurHagfIX86OQw==
X-Received: by 2002:a2e:584b:: with SMTP id x11mr2590876ljd.96.1570630821361; 
 Wed, 09 Oct 2019 07:20:21 -0700 (PDT)
Received: from EPUAKYIW0594.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id i142sm526702lfi.5.2019.10.09.07.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:20:20 -0700 (PDT)
From: Artem Mygaiev <joculator@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 17:20:14 +0300
Message-Id: <cover.1570628924.git.artem_mygaiev@epam.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] Minor Coverity fixes
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQXJ0ZW0gTXlnYWlldiA8YXJ0ZW1fbXlnYWlldkBlcGFtLmNvbT4KClRoZXJlIGlzIGEg
YmlnIGFtb3VudCBvZiBpbnNpZ25pZmljYW50IG9yIGZhbHNlIHBvc2l0aXZlcyByZXBvcnRlZCBi
eSAKQ292ZXJpdHksIGZpeGluZyBzb21lIG9mIHRoZW0gY2FuIGF0IGxlYXN0IG1ha2UgY29kZSBt
b3JlIGNvbnNpc3RlbnQgb3IKYXQgbGVhc3QgYml0IG1vcmUgcmVhZGFibGUuCgpBcnRlbSBNeWdh
aWV2ICgzKToKICBDb25zaXN0ZW50IHVzZSBmb3IgbG9jayB2YXJpYWJsZXMKICBSZW1vdmUgdXNl
bGVzcyBBU1NFUlQgY29uZGl0aW9uCiAgRnJlZSBhbGxvY2F0ZWQgcmVzb3VyY2Ugb24gZXJyb3IK
CiB4ZW4vZHJpdmVycy9jaGFyL3NjaWYtdWFydC5jICAgICAgIHwgMiArLQogeGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL3NtbXUuYyB8IDggKysrKystLS0KIHhlbi94c20vZmxhc2svYXZjLmMg
ICAgICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
