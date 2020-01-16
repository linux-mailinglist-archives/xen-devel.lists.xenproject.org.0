Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A613FBBB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 22:54:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isD3I-0006uo-0d; Thu, 16 Jan 2020 21:51:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=03Je=3F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1isD3H-0006uj-40
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 21:51:43 +0000
X-Inumbo-ID: 5fdd09e1-38aa-11ea-87dc-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fdd09e1-38aa-11ea-87dc-12813bfff9fa;
 Thu, 16 Jan 2020 21:51:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so20711542wrh.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 13:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yZ5aYwEKZdlNu/XL6WLDVP5cNYU8OjscVZWeHpW7igU=;
 b=SvTdp0Aeuj9UD6GPto1r+ZVpKqkaVCmx2lVxx3jamsDsKxoB5hclwd83y+VlKVbG2L
 6VdlWG+t8SPVpxK8XVmhcgNhyPgRE+Anga3coXkUaWNAIQRFJRnhOY6guuS8AJiN/8tY
 JyMMEa5qVN1fAZFaTCDgzkQAJXIdIAMdz/ECjjYQG4kugVenz5YdYllcuQsead/AdyhB
 A4mAnC4OVwsZLh2Az85Ci3WDJbp97+mCwtilII7bTLjc/4qeB9Mvspv8oqnLQYjS6Jm/
 8WrgQWN+qXq0cyXQT1mfbctSZpiAENFVaJTblGoOvQWyapUHeuJ/G3KB9wu1GqfPpFDe
 WMtw==
X-Gm-Message-State: APjAAAU05JuPyfZgfzQaGlagtuVI/YWi4NvewUCApkfLPlHv6+6P2vWL
 I+sqGHMq3rYZnlgRkkF4L6W6oBnzUBc=
X-Google-Smtp-Source: APXvYqxFqyRnAvKMoKuOFt5FK4I8lDFbuTdANMUwW1kVFqjAW/OQDRahMtPLdOzwkMQTtBsGoUBW2g==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr5367096wrq.176.1579211498824; 
 Thu, 16 Jan 2020 13:51:38 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id q3sm5893371wmj.38.2020.01.16.13.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 13:51:37 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 16 Jan 2020 21:51:36 +0000
Message-Id: <20200116215136.17597-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] Revert "xen/arm32: setup: Give a xenheap page
 to the boot allocator"
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgY29tbWl0IGM2MWMxYjQ5NDMgInhlbi9wYWdlX2FsbG9jOiBzdGF0aWNhbGx5IGFsbG9j
YXRlCmJvb3RtZW1fcmVnaW9uX2xpc3QiLCB0aGUgYm9vdCBhbGxvY2F0b3IgZG9lcyBub3QgdXNl
IHRoZSBmaXJzdCBwYWdlIG9mCnRoZSBmaXJzdCByZWdpb24gcGFzc2VkIGZvciBpdHMgb3duIHB1
cnBvc2UuCgpUaGlzIHJldmVydHMgY29tbWl0IGFlODRmNTUzNTM0NzVmNTY5ZGFkZGI5YTgxYWMw
YTZiYzc3NzJjOTAuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PgotLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgOCArLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5kZXggOWRkMzczOGQ0NC4uNDk0Zjcw
NTQ2YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVuL2FyY2gvYXJt
L3NldHVwLmMKQEAgLTU5NCw3ICs1OTQsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0o
dm9pZCkKICAgICB1bnNpZ25lZCBsb25nIGhlYXBfcGFnZXMsIHhlbmhlYXBfcGFnZXMsIGRvbWhl
YXBfcGFnZXM7CiAgICAgaW50IGk7CiAgICAgY29uc3QgdWludDMyX3QgY3RyID0gUkVBRF9DUDMy
KENUUik7Ci0gICAgbWZuX3QgYm9vdF9tZm5fc3RhcnQsIGJvb3RfbWZuX2VuZDsKIAogICAgIGlm
ICggIWJvb3RpbmZvLm1lbS5ucl9iYW5rcyApCiAgICAgICAgIHBhbmljKCJObyBtZW1vcnkgYmFu
a1xuIik7CkBAIC02NjcsMTEgKzY2Niw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tbSh2
b2lkKQogCiAgICAgc2V0dXBfeGVuaGVhcF9tYXBwaW5ncygoZSA+PiBQQUdFX1NISUZUKSAtIHhl
bmhlYXBfcGFnZXMsIHhlbmhlYXBfcGFnZXMpOwogCi0gICAgLyogV2UgbmVlZCBhIHNpbmdsZSBt
YXBwZWQgcGFnZSBmb3IgcG9wdWxhdGluZyBib290bWVtX3JlZ2lvbl9saXN0LiAqLwotICAgIGJv
b3RfbWZuX3N0YXJ0ID0gbWZuX2FkZCh4ZW5oZWFwX21mbl9lbmQsIC0xKTsKLSAgICBib290X21m
bl9lbmQgPSB4ZW5oZWFwX21mbl9lbmQ7Ci0gICAgaW5pdF9ib290X3BhZ2VzKG1mbl90b19tYWRk
cihib290X21mbl9zdGFydCksIG1mbl90b19tYWRkcihib290X21mbl9lbmQpKTsKLQogICAgIC8q
IEFkZCBub24teGVuaGVhcCBtZW1vcnkgKi8KICAgICBmb3IgKCBpID0gMDsgaSA8IGJvb3RpbmZv
Lm1lbS5ucl9iYW5rczsgaSsrICkKICAgICB7CkBAIC03MTcsNyArNzExLDcgQEAgc3RhdGljIHZv
aWQgX19pbml0IHNldHVwX21tKHZvaWQpCiAKICAgICAvKiBBZGQgeGVuaGVhcCBtZW1vcnkgdGhh
dCB3YXMgbm90IGFscmVhZHkgYWRkZWQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLiAqLwogICAgIGlu
aXRfeGVuaGVhcF9wYWdlcyhtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQpLAotICAgICAg
ICAgICAgICAgICAgICAgICBtZm5fdG9fbWFkZHIoYm9vdF9tZm5fc3RhcnQpKTsKKyAgICAgICAg
ICAgICAgICAgICAgICAgbWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX2VuZCkpOwogfQogI2Vsc2Ug
LyogQ09ORklHX0FSTV82NCAqLwogc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21tKHZvaWQpCi0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
