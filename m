Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67515D7A7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 13:49:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2aMT-0000dO-EL; Fri, 14 Feb 2020 12:46:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8SxQ=4C=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j2aMR-0000dJ-M0
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 12:46:23 +0000
X-Inumbo-ID: 00ba169e-4f28-11ea-ba46-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00ba169e-4f28-11ea-ba46-12813bfff9fa;
 Fri, 14 Feb 2020 12:46:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g3so10741765wrs.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2020 04:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vL0tcEJzIR6ZIxgcYi6GivRsH2GzT2FpcaZN5XEA58=;
 b=hqJDnNKog0kXCT5r8kZj/dCx392m+a1huY8SAHCWanVvQPzxL80+d+hjToyadTEaI6
 WHPMBcJdKqfHGTmHGx9JJqZxzQe/T1KkBM2ZYtCsLGkFqIwleA0RvXKPeyN7FN3VMKsK
 o5ruMmrJtNsK7KLCZDVobRVenUljcaSgoBAml8rWZIWHBuks0ovdPLU/Ks3ilzB1ApfB
 oIKLlA/GQxMkFNLGkg/7/HKGs6IS5qbxmKcC7+Mz9IlngmZEAlJbrAZV1PgjXrSNLx+9
 +/QEHxuliUKFVjVXTDTkjRkuaRbfLFB1Du48re4f1wfn1pB6kdFDI14EuebFVLAkFjRW
 6jRw==
X-Gm-Message-State: APjAAAVssKeTmMob57AF4BgXnZhtlP7NP5+HDTbnvtrMLTbhPhHvIdG0
 kCqpx0zJ4SO2z75UkmbJHHlqv/7eYWA=
X-Google-Smtp-Source: APXvYqwb8cvt7/XPy4gLxD3/BLFEd/Fth+OhuuFmKtPGRskTcw7xdWsU+SvfNFmYckPOJmgy4cG8qQ==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr3814012wrl.282.1581684381245; 
 Fri, 14 Feb 2020 04:46:21 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 s8sm7246124wrt.57.2020.02.14.04.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 04:46:20 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 14 Feb 2020 12:46:18 +0000
Message-Id: <20200214124618.5962-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RFC] docs: move xen-command-line.pandoc under
 admin-guide
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhdCBkaXJlY3Rvcnkgd291bGQgYmUgdGhlIGZpcnN0IHBsYWNlIEkgbG9vayBpZiBJIG5lZWQg
dG8ga25vdyB4ZW4KY29tbWFuZCBsaW5lIG9wdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgotLS0KIGRvY3Mve21pc2MgPT4gYWRtaW4tZ3VpZGV9L3hlbi1jb21tYW5k
LWxpbmUucGFuZG9jIHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBkb2NzL3ttaXNjID0+IGFkbWluLWd1aWRlfS94ZW4tY29tbWFuZC1s
aW5lLnBhbmRvYyAoMTAwJSkKCmRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MgYi9kb2NzL2FkbWluLWd1aWRlL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5w
YW5kb2MKcmVuYW1lIHRvIGRvY3MvYWRtaW4tZ3VpZGUveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MK
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
