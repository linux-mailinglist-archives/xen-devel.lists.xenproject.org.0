Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F9E2FFD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 13:09:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNawi-00074C-AC; Thu, 24 Oct 2019 11:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZeBO=YR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNawh-000747-Ck
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 11:06:23 +0000
X-Inumbo-ID: 50274f90-f64e-11e9-beca-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50274f90-f64e-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 11:06:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s1so16818167wro.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 04:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLVMlsyqW8Eq8mMDKBcgjPJTjFBTTDdaGAOHmapLf48=;
 b=CXEE6JFvf9zVC8oezk1gKLH9aaxg+vcd1XL534NOk4Y54FCfjTcP9CZAIKUpoRgMu2
 Ei+Hm/C9EXpKhUjqZUAxi2jlal2evWbRKP1pa1KSFemzI/voLefBswEceeElKbNY/e3N
 OX0VYeuNi6nCdwQboK9lFgs493EvRm34iuz9iP/c+KmX6Fj2m8ocCfnKobTY5riMF3jO
 quk0nhVJrajc83DxEb/uPRuaeBCQAWJkWTr7McYPM5ONH6Nq1sAZpyD/jhcOUfnm1u+n
 cvpxovuSG4v9beLKmJtG92P3ouh2wc3YZkf3nuxxyFVOeFndP02sQ6Sofp13HF10E+SR
 nxdA==
X-Gm-Message-State: APjAAAU9edtMaCUf1Y0cBnm02luS9hLvmYLpBbr6t78AEwsdQKonX8sR
 BK/ltAM5fIutyNtBC+AgYVHkZXAe0NA=
X-Google-Smtp-Source: APXvYqxFA9jlzINR+MXtzLi/MYMP+TDdK0SyJ14N54HvICIn/9ciQMYVC5wOau9XhBP0Q6sxJKeYaA==
X-Received: by 2002:a5d:46ca:: with SMTP id g10mr3386806wrs.193.1571915181954; 
 Thu, 24 Oct 2019 04:06:21 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id o15sm7130090wrv.76.2019.10.24.04.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:06:21 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 24 Oct 2019 12:06:18 +0100
Message-Id: <20191024110618.6436-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] CONTRIBUTING: drop reference to blktap2
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
Cc: Juergen Gross <jgross@suse.com>, lars.kurth@citrix.com,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QmxrdGFwMiBpcyBnb25lLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0t
CiBDT05UUklCVVRJTkcgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvQ09OVFJJQlVUSU5HIGIvQ09OVFJJQlVUSU5HCmluZGV4IDQ3ZjUzZTlhNDkuLjRm
ZmY0ZmQ5ZjYgMTAwNjQ0Ci0tLSBhL0NPTlRSSUJVVElORworKysgYi9DT05UUklCVVRJTkcKQEAg
LTEzLDcgKzEzLDYgQEAgTW9zdCBvZiB0aGUgWGVuIFByb2plY3QgY29kZSBpcyBsaWNlbnNlZCB1
bmRlciBHUEx2MiwgYnV0IGEgbnVtYmVyIG9mCiBkaXJlY3RvcmllcyBhcmUgcHJpbWFyaWx5IGxp
Y2Vuc2VkIHVuZGVyIGRpZmZlcmVudCBsaWNlbnNlcy4KIAogTW9zdCBub3RhYmx5OgotIC0gdG9v
bHMvYmxrdGFwMiAgICAgIDogQlNELU1vZGlmaWVkCiAgLSB0b29scy9saWJ4YyAgICAgICAgOiBM
R1BMIHYyLjEKICAtIHRvb2xzL2xpYnhsICAgICAgICA6IExHUEwgdjIuMQogIC0gdG9vbHMveGwg
ICAgICAgICAgIDogTEdQTCB2Mi4xCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
