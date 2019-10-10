Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB91D231E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 10:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iITyS-0001UB-Q3; Thu, 10 Oct 2019 08:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOhK=YD=gmail.com=huangfq.daxian@srs-us1.protection.inumbo.net>)
 id 1iITsd-0001Fk-Tj
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 08:33:03 +0000
X-Inumbo-ID: 93010b60-eb38-11e9-80e3-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93010b60-eb38-11e9-80e3-bc764e2007e4;
 Thu, 10 Oct 2019 08:33:03 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id e1so3203033pgj.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2019 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=O7p2fEqyW0bVC4UiR9HAc7G+W6mndKZsFPSQmUHXQOs=;
 b=p+k/fFjus2iMXsQjgstcB4b4WB5zfA5cT2pFdCVTwodhFve3rnj0UyAS5/TrK1l+jP
 Fj7BYq+UOpDkTiiEO5IcxazfG2x62D6mOyvV0FnceC+RI+6DfXSzU2H4F3O53nv+s2JZ
 xWNfPfeM50wEalTJWvI9F4g9prWz5oD9I0T7XXjDHmR5x2i1Aitn5igvDn+DYkF52KaM
 O//BciCy9oW8PFP3JE024ZAi7gA+M+OtXMBIzKEHNy55LQOuRw71pOdmQ1sTHTMJhHcW
 10fFyTCm8Ejc6Q+NBW5+INiPAJhxWy21NMbeRNAIhoAyDoyOqu7TMRmEHRP1Sl1n8uzT
 jMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O7p2fEqyW0bVC4UiR9HAc7G+W6mndKZsFPSQmUHXQOs=;
 b=TRysf8me1xSoI7XIqTg1mO3vwtm3oAeMddWils894c7/bdoeO+4au0lf00iXTowWB3
 uKL9RDF534Zd895+Q191WYVZb9kVWfFGtw8bR5rQ/iHZC9p35LcvPrwlaIJilVdZKr3m
 bTw+0bk5xzqbkLm51d0wQv3Z9g/CamCFkQOwl77kwGykLVXRqg+FU2KgHMwkJZkdAWPv
 vEQEUhE2M9yZ6VqZSzufg4fdTE/z8QKnT9AOFp0pjFKNwfR4h4N/+7JwA7DTFwswUzS5
 yqhqWQaJUbb4CBhKdZbuKDJ//H5wQpUVlj+bpod6uStL8mvO+htLe3NBYrE5xXQ4yb8E
 fXcw==
X-Gm-Message-State: APjAAAWEMN9dyPCExuYUrenEh0OyPiR7S2FPiJEewxxO/JNs8H7TOky0
 LN8ghT9C6Y+NkwjW7KVXx7w=
X-Google-Smtp-Source: APXvYqzyutGAVXNM/PD1VvisCGv1p9QsixR+cchjogvT0/HSuilUbh8huFSd3rnak94fGCQcEmBq0w==
X-Received: by 2002:a62:d402:: with SMTP id a2mr9184721pfh.115.1570696382444; 
 Thu, 10 Oct 2019 01:33:02 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id m34sm7028036pgb.91.2019.10.10.01.32.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 01:33:01 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Thu, 10 Oct 2019 16:32:09 +0800
Message-Id: <20191010083209.4702-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 10 Oct 2019 08:39:03 +0000
Subject: [Xen-devel] [PATCH] xen/grant-table: remove unnecessary printing
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org,
 Fuqian Huang <huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVuX2F1dG9feGxhdF9ncmFudF9mcmFtZXMudmFkZHIgaXMgZGVmaW5pdGVseSBOVUxMIGluIHRo
aXMgY2FzZS4KU28gdGhlIGFkZHJlc3MgcHJpbnRpbmcgaXMgdW5uZWNlc3NhcnkuCgpTaWduZWQt
b2ZmLWJ5OiBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFuQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL3hlbi9ncmFudC10YWJsZS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC10YWJs
ZS5jIGIvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYwppbmRleCA3ZWE2ZmI2YTJlNWQuLjQ5YjM4
MWUxMDRlZiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYworKysgYi9kcml2
ZXJzL3hlbi9ncmFudC10YWJsZS5jCkBAIC0xMzYzLDggKzEzNjMsNyBAQCBzdGF0aWMgaW50IGdu
dHRhYl9zZXR1cCh2b2lkKQogCWlmICh4ZW5fZmVhdHVyZShYRU5GRUFUX2F1dG9fdHJhbnNsYXRl
ZF9waHlzbWFwKSAmJiBnbnR0YWJfc2hhcmVkLmFkZHIgPT0gTlVMTCkgewogCQlnbnR0YWJfc2hh
cmVkLmFkZHIgPSB4ZW5fYXV0b194bGF0X2dyYW50X2ZyYW1lcy52YWRkcjsKIAkJaWYgKGdudHRh
Yl9zaGFyZWQuYWRkciA9PSBOVUxMKSB7Ci0JCQlwcl93YXJuKCJnbnR0YWIgc2hhcmUgZnJhbWVz
IChhZGRyPTB4JTA4bHgpIGlzIG5vdCBtYXBwZWQhXG4iLAotCQkJCSh1bnNpZ25lZCBsb25nKXhl
bl9hdXRvX3hsYXRfZ3JhbnRfZnJhbWVzLnZhZGRyKTsKKwkJCXByX3dhcm4oImdudHRhYiBzaGFy
ZSBmcmFtZXMgaXMgbm90IG1hcHBlZCFcbiIpOwogCQkJcmV0dXJuIC1FTk9NRU07CiAJCX0KIAl9
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
