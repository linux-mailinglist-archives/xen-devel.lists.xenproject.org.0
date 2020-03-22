Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DFE18EA2D
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:17:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3FO-0004fl-9j; Sun, 22 Mar 2020 16:14:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3FN-0004fK-Ev
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:45 +0000
X-Inumbo-ID: 395a120e-6c58-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 395a120e-6c58-11ea-a6c1-bc764e2007e4;
 Sun, 22 Mar 2020 16:14:36 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z3so13446815edq.11
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hrdGFn7wEIILke7/AUPxIFCNrHwTfD8D/h3uXv3Thvc=;
 b=BtJnomIxQ4Z3iQ5OyQyifZESrN0qUKJHPSbbvBD7qqGi1Z2hz3p8BxkNBTWYrPd/KC
 8pOYk0GLgdt2VKPnyY/ntG3xbXYqIVuuWn8d0ureTakDXfVqEBt7b/6N8DAjlFNKkiK8
 aRz0gzD8obKe1mJtACNufwp+Yll14WK0UDJv6flq2Q1cJ6PG+zNpcO15T+6byNCycmxC
 fcjPrL4mnPIF6G4BcDv/XtTAa0q84aPfFUfAeB6TsaDzlA6hiVubNDQ9tbcsT7RYHdct
 j95u8QwaDubyDymGr9QhPVZ9oD5WizblUXKYkCMvAXlIkaY8wvxemJTfaEtZ+SjbVA5f
 ILrQ==
X-Gm-Message-State: ANhLgQ0K8xUmfbwfBxqFpfHDBzxJLtYl1xYaf3MQtX9CV00TF7Q5i56w
 4KDxah0JG2RzAeq9od6xrE/6xj/A2v5uJA==
X-Google-Smtp-Source: ADFU+vtyMDwxcxqJb5xVmLFbP52Rq+jJz04J5YkoZGwltguOYdsoDUzRoEslYKv/dXZjs4Wcni4mYg==
X-Received: by 2002:aa7:c607:: with SMTP id h7mr1105784edq.73.1584893675849;
 Sun, 22 Mar 2020 09:14:35 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:35 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:12 +0000
Message-Id: <20200322161418.31606-12-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 11/17] xen/x86: nested_ept: Fix typo in the
 message in nept_translate_l2ga()
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL2hhcC9u
ZXN0ZWRfZXB0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vaGFwL25lc3RlZF9lcHQuYyBi
L3hlbi9hcmNoL3g4Ni9tbS9oYXAvbmVzdGVkX2VwdC5jCmluZGV4IDFjYjdmZWZjMzcuLjdiYWU3
MWNjNDcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvbmVzdGVkX2VwdC5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9oYXAvbmVzdGVkX2VwdC5jCkBAIC0yNTUsNyArMjU1LDcgQEAgaW50
IG5lcHRfdHJhbnNsYXRlX2wyZ2Eoc3RydWN0IHZjcHUgKnYsIHBhZGRyX3QgbDJnYSwKICAgICAg
ICAgfQogICAgICAgICBlbHNlCiAgICAgICAgIHsKLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19FUlIsICJVbmNvcnJlY3QgbDEgZW50cnkhXG4iKTsKKyAgICAgICAgICAgIGdkcHJpbnRrKFhF
TkxPR19FUlIsICJJbmNvcnJlY3QgbDEgZW50cnkhXG4iKTsKICAgICAgICAgICAgIEJVRygpOwog
ICAgICAgICB9CiAgICAgICAgIGlmICggbmVwdF9wZXJtaXNzaW9uX2NoZWNrKHJ3eF9hY2MsIHJ3
eF9iaXRzKSApCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
