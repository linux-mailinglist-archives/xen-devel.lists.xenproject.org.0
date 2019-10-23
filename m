Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC36E14EC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 11:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNCSU-0004yN-Pb; Wed, 23 Oct 2019 08:57:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VtJ9=YQ=gmail.com=k.kahurani@srs-us1.protection.inumbo.net>)
 id 1iNCKl-0003nE-TT
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 08:49:35 +0000
X-Inumbo-ID: 09babd80-f572-11e9-beca-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09babd80-f572-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 08:49:35 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y5so12483265pfo.4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 01:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ypiEyUOcFqLiaGl6xs/x4BG65OVoR1Oyr52k9jGaJnM=;
 b=nP7RZQ10qslY99ABw83hdE7yaU8Rr9+T4vARfb4JRO7HWEgYW4H4LtIj9X3tzRqF9e
 P2pCX9NJYjivrE125U+bz+LyoozuCxD7ZT7cGvs2ySM38iVlIWQXBNglGlr2X61TAKiT
 6EKcovsN5yyZMfLH1quvfyLQzpQpLynVd7R5iXcef6hYEypyBED1MkxJ4Cjh5Zp9S9eZ
 IvsKi4UcDNihYT60Qj7usLq3paqBtKi8+ikXAHfjDtIk1Oz6UFXx5Z8fhbYj8Zl3TYkt
 O8hH3j5KARlpSZ2bvkFL45ls6c5tq0TbdeaU3dKQ/tPa8Mph4xgQRi4FoMUo00ucaPFp
 5Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ypiEyUOcFqLiaGl6xs/x4BG65OVoR1Oyr52k9jGaJnM=;
 b=WBBqz06A8zzforN28PzVFWgAVlMmmDp+fycAMMYI6z0S+Ps4/CLo0UzbnQyPZviEin
 UduIJcVOwpamE73NTLtweH2UqgV27pWeN9ZhK6s3NmdZCsRURuM+JqiKMZHXojb8jtkU
 dGBTOwHtuZtWVZW6fKBOn0KZ+n3W0JvQNqHiDMPbBHJzgRma3gBXhUUMkXujVRcEbwHr
 e5Wohgf4bzth6XxDr1oOnz79E4b5wi0OLui/bW3xaHjBvTvzCcKmqoi01cjqKuua+u7D
 EvKoqlaO1I5HIDLWxGrMcvy0Fc67se8Z+TNQlgFXvb6moPXJJdmpfamW0cTKWS7Q+iS5
 mb3w==
X-Gm-Message-State: APjAAAXT8q+q8FR+lJzdXPGE2+2gqDQJzm8XJaD6qZd5wAzKQ50O6Nca
 tmLKZaqzmoLERCPjifJycMiVsUh9DWmGlw==
X-Google-Smtp-Source: APXvYqzksmDbFcTgfCDf0OfoY9FzoukQalsBZna2tljX8MwGIYytlNA3HzZrcGMsx/XjA6kMG2eFqA==
X-Received: by 2002:a62:685:: with SMTP id 127mr9424798pfg.227.1571820574379; 
 Wed, 23 Oct 2019 01:49:34 -0700 (PDT)
Received: from localhost.localdomain ([197.156.190.218])
 by smtp.gmail.com with ESMTPSA id f14sm27651008pfq.187.2019.10.23.01.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 01:49:33 -0700 (PDT)
From: "K. Kahurani" <k.kahurani@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 23 Oct 2019 11:48:41 +0300
Message-Id: <20191023084841.30903-2-k.kahurani@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023084841.30903-1-k.kahurani@gmail.com>
References: <20191023084841.30903-1-k.kahurani@gmail.com>
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:57:33 +0000
Subject: [Xen-devel] [PATCH 1/1] tools/configure: remove redundancy
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
Cc: "K. Kahurani" <k.kahurani@gmail.com>, admin@rapidseedbox.com,
 jbeulic@suse.com, ian.jackson@eu.citrix.com, jfehlig@suse.com,
 eblake@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwaWVjZSBvZiBjb2RlIGlzIHJlZHVuZGFudCBhbmQgcmVzdWx0cyBpbiBhIGdhcmJhZ2Ug
ZXJyb3IKbWVzc2FnZSBvbiBzeXN0ZW1zIHRoYXQgZG8gbm90IGhhdmUgYSBkZWZhdWx0IHB5dGhv
biBleGVjdXRhYmxlLgoKU2lnbmVkLW9mZi1ieTogSy4gS2FodXJhbmkgPGsua2FodXJhbmlAZ21h
aWwuY29tPgotLS0KIHRvb2xzL2NvbmZpZ3VyZSB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3Vy
ZSBiL3Rvb2xzL2NvbmZpZ3VyZQppbmRleCA4Mjk0N2FkLi5hMWYzNmQxIDEwMDc1NQotLS0gYS90
b29scy9jb25maWd1cmUKKysrIGIvdG9vbHMvY29uZmlndXJlCkBAIC02OTMxLDEwICs2OTMxLDgg
QEAgZmkKIGlmIGVjaG8gIiRQWVRIT04iIHwgZ3JlcCAtcSAiXi8iOyB0aGVuIDoKIAogZWxzZQot
ICBQWVRIT049YHR5cGUgLXAgIiRQWVRIT04iYAorICBQWVRIT05QQVRIPWB0eXBlIC1wICIkUFlU
SE9OImAKIGZpCi1QWVRIT05QQVRIPSRQWVRIT04KLVBZVEhPTj1gYmFzZW5hbWUgJFBZVEhPTlBB
VEhgCiAKICMgRXh0cmFjdCB0aGUgZmlyc3Qgd29yZCBvZiAiJFBZVEhPTiIsIHNvIGl0IGNhbiBi
ZSBhIHByb2dyYW0gbmFtZSB3aXRoIGFyZ3MuCiBzZXQgZHVtbXkgJFBZVEhPTjsgYWNfd29yZD0k
MgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
