Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B41139BB6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:36:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7LU-0006bv-Oe; Mon, 13 Jan 2020 21:34:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir7LT-0006bZ-Or
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:33:59 +0000
X-Inumbo-ID: 61750c18-364c-11ea-ac27-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61750c18-364c-11ea-ac27-bc764e2007e4;
 Mon, 13 Jan 2020 21:33:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so10136942wrj.12
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 13:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tK+XWcqhdvm5uNAF7XfUhV11KCjVM6xTfRNGXWs/ga0=;
 b=WHSoB3fmzvaY+PsLSaaJQkyLQp3+wdYZv2bYM1kHbpBcY4YQoZjzAWDdAD6UPl7WZ4
 CTv2LI9m4B7Wi1Wu94KGz4nrlekj/13VKA59+2ndxb6cOY3NlKnedW9Op1gg5TgMTXsh
 Vzkpx8cmwvMlyFADs9z2lHEwjiQ6EoYH5U6Ll12dgyvewnZILAJ8F8JqtMsiFrB1EVJv
 iv3spu9AxqQKbkOrl6VmuZyL3zBprDDRkXVfK7OBXUFJWXS2A+VeZh8jX92ipiUV87jT
 5LRvSYqgB79zlf7h678JObkKZ8iIAXxu2WUM0/hPwijLT2nfGRdtwpYTz78WekPD5vBc
 mnIQ==
X-Gm-Message-State: APjAAAWMkxIWBgMDgvru5QUHLHacN/sE7WDpEnTIJsphVdsu34jLBdL0
 4Yd1M1Xwb0GdXKzbN15Anubo6akV4qqmCw==
X-Google-Smtp-Source: APXvYqztx8nWca01Oz/OfKgBMaH419EBRwvAecQTe1sDIxt2HSBR5sX0boz0LCKmGGKlF4N1XZI1vQ==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr21087716wrm.48.1578951226439; 
 Mon, 13 Jan 2020 13:33:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id i10sm16938652wru.16.2020.01.13.13.33.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 13:33:45 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 13 Jan 2020 21:33:39 +0000
Message-Id: <20200113213342.8206-2-julien@xen.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200113213342.8206-1-julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] xen/x86: Remove unused forward declaration
 in asm-x86/irq.h
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCk5vbmUgb2YgdGhlIHByb3Rv
dHlwZXMgd2l0aGluIHRoZSBoZWFkZXIgYXNtLXg4Ni9pcnEuaCBhY3R1YWxseSByZXF1aXJlcwp0
aGUgZm9yd2FyZCBkZWNsYXJhdGlvbiBvZiAic3RydWN0IHBpcnEiLiBTbyByZW1vdmUgaXQuCgpO
byBmdW5jdGlvbmFsIGNoYW5nZXMgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaXJxLmggfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9pcnEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaXJxLmgKaW5kZXggN2M4MjVl
OWQ5Yy4uNDRhZWZjOGYwMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pcnEuaAor
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2lycS5oCkBAIC0xMzEsNyArMTMxLDYgQEAgZXh0ZXJu
IHVuc2lnbmVkIGludCBpb19hcGljX2lycXM7CiAKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBp
bnQsIGlycV9jb3VudCk7CiAKLXN0cnVjdCBwaXJxOwogc3RydWN0IGFyY2hfcGlycSB7CiAgICAg
aW50IGlycTsKICAgICB1bmlvbiB7Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
