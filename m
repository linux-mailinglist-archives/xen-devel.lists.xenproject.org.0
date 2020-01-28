Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B514B45A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 13:43:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwQAY-0000Po-OS; Tue, 28 Jan 2020 12:40:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wDyi=3R=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwQAX-0000Pj-Gd
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 12:40:37 +0000
X-Inumbo-ID: 61b52958-41cb-11ea-ad98-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61b52958-41cb-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 12:40:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t23so2367396wmi.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 04:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=plv1GEb5ebiaArHl3vGegP1CDtC+eP8KGraE/3KoqiA=;
 b=OPReH5LEJ9BTMawk1SJhUkBVhfzRkRpJ2dzhHO/MxPAg1AKsaEAMbsF+XpftkvcLQh
 FL10AXO1PXVW6M/pg/zEO1J9vaX7LR6gt9gk6kPBjQUPgmvmIJBocFyHgCLgUVR6bbNg
 3D1RjUOxrFvemfUesOPZ+gz+iLDtV+EiFUhoYhN/mK2Ixo/U5DLqz22XVZ6iLDl4yVdb
 YJEtO37WA8MjDzZKswtLKG1ukljREDf++FX75moGIz6sZjswO+RNY4QbU2IRXV9cIBJk
 6Fu8JJBV/sIVZfFML0km5RXfc7QdfN4LOc0MAudcQ4t0WlwzIohrrGyV00C40LYIc9r3
 LoMA==
X-Gm-Message-State: APjAAAWRLDTCwVXAwFRbSjiugM0UR96Ozpq+xl68oRpwuklbOfTNteH5
 ueUXldRDW+U3gU25GnwN4zXLGHIFc3k=
X-Google-Smtp-Source: APXvYqysDd/xGP41huqEkBoXiPwqUuspDoTFT7AX17Gy503puTQQxqp4aC/K/yK2GA/tatBAxaCMmQ==
X-Received: by 2002:a05:600c:21c5:: with SMTP id
 x5mr5017536wmj.72.1580215235574; 
 Tue, 28 Jan 2020 04:40:35 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 v8sm25111807wrw.2.2020.01.28.04.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 04:40:34 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue, 28 Jan 2020 12:40:31 +0000
Message-Id: <20200128124031.8720-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] docs: fix StudlyCaps in
 libxl-migration-stream.pandoc
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm90ZSB0aGF0IHRoZSAiTGlieGxGbXQiIGluIHRoZSBzdHJlYW0gc2hvdWxkIHJlbWFpbiB1bmNo
YW5nZWQuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIGRvY3Mvc3Bl
Y3MvbGlieGwtbWlncmF0aW9uLXN0cmVhbS5wYW5kb2MgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kb2NzL3NwZWNzL2xp
YnhsLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jIGIvZG9jcy9zcGVjcy9saWJ4bC1taWdyYXRpb24t
c3RyZWFtLnBhbmRvYwppbmRleCAzNzY2ZjM3ZjRmLi41ZWM1ZGM5OTFiIDEwMDY0NAotLS0gYS9k
b2NzL3NwZWNzL2xpYnhsLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jCisrKyBiL2RvY3Mvc3BlY3Mv
bGlieGwtbWlncmF0aW9uLXN0cmVhbS5wYW5kb2MKQEAgLTEsNCArMSw0IEBACi0lIExpYlhlbkxp
Z2h0IERvbWFpbiBJbWFnZSBGb3JtYXQKKyUgbGlieGVubGlnaHQgRG9tYWluIEltYWdlIEZvcm1h
dAogJSBBbmRyZXcgQ29vcGVyIDw8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4+CiAgIFdlbiBD
b25neWFuZyA8PHdlbmN5QGNuLmZ1aml0c3UuY29tPj4KICAgWWFuZyBIb25neWFuZyA8PGhvbmd5
YW5nLnlhbmdAZWFzeXN0YWNrLmNuPj4KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
