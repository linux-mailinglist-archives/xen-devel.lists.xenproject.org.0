Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E487D16C24C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:29:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aDt-00089d-VZ; Tue, 25 Feb 2020 13:26:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3lsx=4N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6aDs-00089W-QO
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:26:04 +0000
X-Inumbo-ID: 5e77c562-57d2-11ea-9300-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e77c562-57d2-11ea-9300-12813bfff9fa;
 Tue, 25 Feb 2020 13:26:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id v28so16186738edw.12
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 05:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uZA9A6HxbvZTEBvpgsZ28pS/XyxkUyt0ZrvPfBZrho4=;
 b=N9RUHcYrQ774yl+OulM7PQaM8huHJ8A3hB8U0zpeCbEfQbmZkcECH7XnGZ/zHSPu9B
 FeimUOrM9esEY+AGWgMcP08fsvmfKfUYiR5JGSV8FqaYakplrUzSjFt9vNBTO46xNrfu
 CrI4wgaeSvJm6XN4519I+bT09M9Wg6dffEOZDGl9o7CYNlQhJqzHJwTjIEIpJZewl9hb
 /M2iUUW1rX9WSI/60d1wf76cyAs7UAe/yAurGV8StHM03VQ1DzsKXQbFI/5RIu8OI7/h
 hZ/vUUyP9GOjNOC+BKXXjx3/EFt9KlqlL0Fo0BZEN5f0jV6L6azhUSkvdwAt3OlRw2L5
 dPOA==
X-Gm-Message-State: APjAAAXjNE70rF/7LTo3z3Zn0MRMml7Mol2NMmnx9b4KDAo4O0gyqZ19
 +JGdKN4BSS7dXVWtPRa4ukF+JrKPEC0=
X-Google-Smtp-Source: APXvYqwy9rB6Bm71qBiS2+cq0l76GImr6YPu2vYdk0M2sVt+vJMbhDsRp6fC9aYSz6qIfz8KBMA9gA==
X-Received: by 2002:a17:906:8306:: with SMTP id
 j6mr51613585ejx.105.1582637162276; 
 Tue, 25 Feb 2020 05:26:02 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y4sm958463ejj.87.2020.02.25.05.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 05:26:01 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 25 Feb 2020 13:25:58 +0000
Message-Id: <20200225132558.26152-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/grant-table: Remove outdated warning in
 gnttab_grow_table()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIG9mIHRoZSB3YXJuaW5nIG1lc3NhZ2UgaW4gZ250dGFiX2dyb3dfdGFibGUoKSByZWZlcnMg
dG8gYSBmdW5jdGlvbgp3YXMgcmVtb3ZlZCBpbiBjb21taXQgNjQyNWY5MWM3MiAieGVuL2dudHRh
YjogRm9sZCBncmFudF90YWJsZV97Y3JlYXRlLApzZXRfbGltaXRzfSgpIGludG8gZ3JhbnRfdGFi
bGVfaW5pdCgpIi4KClNpbmNlIHRoZSBjb21taXQsIGd0LT5hY3RpdmUgd2lsbCBiZSBhbGxvY2F0
ZWQgd2hpbGUgaW5pdGlhbGl6aW5nIHRoZQpncmFudCB0YWJsZSBhdCBkb21haW4gY3JlYXRpb24u
IFRoZXJlZm9yZSBndC1hY3RpdmUgd2lsbCBhbHdheXMgYmUKdmFsaWQuCgpSYXRoZXIgdGhhbiBy
ZXBsYWNpbmcgdGhlIHdhcm5pbmcgYnkgYW5vdGhlciBvbmUsIHdlIGNhbiBub3cgZG93bmdyYWRl
CnRoZSBjaGVjayB0byBhbiBBU1NFUlQoKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
amdyYWxsQGFtYXpvbi5jb20+Ci0tLQogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwgNiArLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxl
LmMKaW5kZXggYmMzN2FjYWUwZS4uOTMwZDIwYjM0NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9n
cmFudF90YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMTc5MywxMSAr
MTc5Myw3IEBAIGdudHRhYl9ncm93X3RhYmxlKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGlu
dCByZXFfbnJfZnJhbWVzKQogICAgIHN0cnVjdCBncmFudF90YWJsZSAqZ3QgPSBkLT5ncmFudF90
YWJsZTsKICAgICB1bnNpZ25lZCBpbnQgaSwgajsKIAotICAgIGlmICggdW5saWtlbHkoIWd0LT5h
Y3RpdmUpICkKLSAgICB7Ci0gICAgICAgIGdwcmludGsoWEVOTE9HX1dBUk5JTkcsICJncmFudF90
YWJsZV9zZXRfbGltaXRzKCkgY2FsbCBtaXNzaW5nXG4iKTsKLSAgICAgICAgcmV0dXJuIC1FTk9E
RVY7Ci0gICAgfQorICAgIEFTU0VSVChndC0+YWN0aXZlKTsKIAogICAgIGlmICggcmVxX25yX2Zy
YW1lcyA8IElOSVRJQUxfTlJfR1JBTlRfRlJBTUVTICkKICAgICAgICAgcmVxX25yX2ZyYW1lcyA9
IElOSVRJQUxfTlJfR1JBTlRfRlJBTUVTOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
