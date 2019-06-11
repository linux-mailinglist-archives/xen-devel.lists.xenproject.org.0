Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958B416BE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 23:16:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hao6E-0003VS-Rr; Tue, 11 Jun 2019 21:14:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r+TN=UK=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1hao6C-0003VN-Mo
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 21:14:32 +0000
X-Inumbo-ID: e76792cc-8c8d-11e9-8980-bc764e045a96
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e76792cc-8c8d-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 21:14:31 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g18so8648917qkl.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZWlQYcXiYq4K+TsBHQ76oJw3abz884c7rNhqBJDQvhY=;
 b=KzzJUiqqlWXmAXq5oChFYRxLoSmE+ijyAhUK9nJ8OyWiql9f5h6WwQoMHZ51YyZYfu
 MxYDUiGDTT5GSxQL780aeAZ8LX5beYdXBK6CHmntMRwqKbeEa4wXmUS4t9weUeI5JHQK
 lXJAEFjqydtrL6Lw+45AbuMoYRkBxPUR1QEQpqE1w2R2vbDWkaHM3UrMKO+z40K+kid0
 XjX1lhbasV7crh7EiKXzQctP8DUXvLtirlpQFFhrnF4IyyMwPjfMQP4MOOKGbCb5N+hY
 0c1OJtQ4EQ/joNJ8Jy0vvRE6iyWhSYEdiCmEgSDnEpewghEfkk8qR+/X5jjHwd2cpeMu
 VjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZWlQYcXiYq4K+TsBHQ76oJw3abz884c7rNhqBJDQvhY=;
 b=I3XgWb1Uenf/1TaEOIa8m0X92XiGuQvumjfD1UW9bVdjlH766r1SpKa5AGZhf8JCwd
 WdHBG9dzp6KuACyvqeHmbUsi8Cj9esgR5JvwmiXfU/Z+l+IkYhTSU/75qSKZ2MME6HQI
 16m/skbLyD0J89yjX+71xQj4Hk12LoPfeWa9yoCCQCuUT1l6ce9RLzzqi8sSqQ2lgNuT
 +Q1DwPTQU7lFZafJkI9qG0CV7LARMuDfdqd+6AwiK2MQiBGPQegdI8g+OwwSg+cdjvLb
 LbbT7NThmCR9Rz5+ZHNhhdVLwJZ+1nf/pADgZPxD/6VufLic5BeXgROScpKBCFGnGI2T
 lCEQ==
X-Gm-Message-State: APjAAAUG2Ub5A44Qn1BmiE25EisjtmzpuAmV4H/cuMAz9xPXEi9XUWwr
 GoRyJnvlNyJTL0t5wjW2sWnM3JEqKYI=
X-Google-Smtp-Source: APXvYqwi/Hp4L3catgRh/hI46DGvgqjaCvZ1OPd41JWpg/d6ozbPFfNyzZyH+Q0k2Rxe/jFfHYLFHQ==
X-Received: by 2002:a37:9885:: with SMTP id
 a127mr42207785qke.230.1560287670745; 
 Tue, 11 Jun 2019 14:14:30 -0700 (PDT)
Received: from niko-Latitude-E7470.fios-router.home
 (pool-108-54-183-56.nycmny.fios.verizon.net. [108.54.183.56])
 by smtp.gmail.com with ESMTPSA id 34sm10070811qtq.59.2019.06.11.14.14.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 14:14:30 -0700 (PDT)
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
X-Google-Original-From: Nicholas Tsirakis <tsirakisn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 11 Jun 2019 17:14:26 -0400
Message-Id: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560286430.git.tsirakisn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2 1/2] argo: warn sendv() caller when ring is
 full
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
Cc: Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gaXRzIGN1cnJlbnQgc3RhdGUsIGlmIHRoZSBkZXN0aW5hdGlvbiByaW5nIGlzIGZ1bGwsIHNl
bmR2KCkKd2lsbCByZXF1ZXVlIHRoZSBtZXNzYWdlIGFuZCByZXR1cm4gdGhlIHJjIG9mIHBlbmRp
bmdfcmVxdWV1ZSgpLAp3aGljaCB3aWxsIHJldHVybiAwIG9uIHN1Y2Nlc3MuIFRoaXMgcHJldmVu
dHMgdGhlIGNhbGxlciBmcm9tCmRpc3Rpbmd1aXNoaW5nIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
YSBzdWNjZXNzZnVsIHdyaXRlIGFuZCBhCm1lc3NhZ2UgdGhhdCBuZWVkcyB0byBiZSByZXNlbnQg
YXQgYSBsYXRlciB0aW1lLgoKSW5zdGVhZCwgY2FwdHVyZSB0aGUgLUVBR0FJTiB2YWx1ZSByZXR1
cm5lZCBmcm9tIHJpbmdidWZfaW5zZXJ0KCkKYW5kICpvbmx5KiBvdmVyd3JpdGUgaXQgaWYgdGhl
IHJjIG9mIHBlbmRpbmdfcmVxdWV1ZSgpIGlzIG5vbi16ZXJvLgpUaGlzIGFsbG93cyB0aGUgY2Fs
bGVyIHRvIG1ha2UgaW50ZWxsaWdlbnQgZGVjaXNpb25zIG9uIC1FQUdBSU4gYW5kCnN0aWxsIGJl
IGFsZXJ0ZWQgaWYgdGhlIHBlbmRpbmcgbWVzc2FnZSBmYWlscyB0byByZXF1ZXVlLgoKU2lnbmVk
LW9mZi1ieTogTmljaG9sYXMgVHNpcmFraXMgPHRzaXJha2lzbkBhaW5mb3NlYy5jb20+Ci0tLQog
eGVuL2NvbW1vbi9hcmdvLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIveGVu
L2NvbW1vbi9hcmdvLmMKaW5kZXggMTMwNTJiOTIzOS4uMmY4NzRhNTcwZCAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9hcmdvLmMKKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKQEAgLTIwNDgsOSArMjA0
OCwxMyBAQCBzZW5kdihzdHJ1Y3QgZG9tYWluICpzcmNfZCwgeGVuX2FyZ29fYWRkcl90ICpzcmNf
YWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVzc2FnZV90eXBlLCAmbGVuKTsK
ICAgICAgICAgaWYgKCByZXQgPT0gLUVBR0FJTiApCiAgICAgICAgIHsKKyAgICAgICAgICAgIGlu
dCByYzsKKwogICAgICAgICAgICAgYXJnb19kcHJpbnRrKCJhcmdvX3JpbmdidWZfc2VuZHYgZmFp
bGVkLCBFQUdBSU5cbiIpOwogICAgICAgICAgICAgLyogcmVxdWV1ZSB0byBpc3N1ZSBhIG5vdGlm
aWNhdGlvbiB3aGVuIHNwYWNlIGlzIHRoZXJlICovCi0gICAgICAgICAgICByZXQgPSBwZW5kaW5n
X3JlcXVldWUoZHN0X2QsIHJpbmdfaW5mbywgc3JjX2lkLmRvbWFpbl9pZCwgbGVuKTsKKyAgICAg
ICAgICAgIHJjID0gcGVuZGluZ19yZXF1ZXVlKGRzdF9kLCByaW5nX2luZm8sIHNyY19pZC5kb21h
aW5faWQsIGxlbik7CisgICAgICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgICAgICByZXQg
PSByYzsKICAgICAgICAgfQogCiAgICAgICAgIHNwaW5fdW5sb2NrKCZyaW5nX2luZm8tPkwzX2xv
Y2spOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
