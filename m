Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF9A49C8E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 11:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd9xK-0004Lj-Kv; Tue, 18 Jun 2019 08:59:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TBFj=UR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hd9xJ-0004Le-O7
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 08:59:05 +0000
X-Inumbo-ID: 520fd00d-91a7-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 520fd00d-91a7-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 08:59:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k18so12226635ljc.11
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2019 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JeAVoKVdxRsJHzqaTaj0ucciRItQnDQRDeWNsCNLp8I=;
 b=s4hR0WW0txu8emku4HoV/OJsMlpLQYvy+xpoQfvI+/bRIqBZJ4PziDiHQW4X+Lomv/
 FyUydRb4PwqLxHHF37MGS75rnjBtCt791ZwtGfT07C/iR6OhpeL6SYRqd2FZrTY1u4Ff
 +8W0sEX8w+8b17UZ/IlraoUPIxidGVEPfB7XHXeoEzdmwLh7X3aHg64A/dDrqZ5iwfKk
 dKXxHkJvTm5z7SBzB5wmrewMkljWPPY39J7na7wCGN6q0iRrPsc83VoVP09dzarTPKl7
 kypEFpa0uIBYCwotazCnscKrnEGE6MTGO4VW+7t+WHbktLDikZe36QERMnMfxUBrenVN
 TCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JeAVoKVdxRsJHzqaTaj0ucciRItQnDQRDeWNsCNLp8I=;
 b=dRGviVfWdnqxsg563nibiPiOkKmoBeucRJWQmd3JhieH9tsdpE+Tzp/OaACO67CyG1
 Jr2LWVoWjNwvA0hWAVAuQzoevmPcp3cI45DjeW7VHkGlImGJs+ag0prgvEaLRMK5yqJw
 IZEmPwdNlnKkDgsgnfUY1ZN3YTUTpQYImWZBrvqmyKmCEtMRUUsbKnhfLjI+dpB2Tso6
 i2XLv6zZbRgkBiQDN3mevRpNzpoDmsIBCGG5NKxpkXDyNGQan3q93TMfoaujUJoMU4Wm
 77BsbgV/TD1XLMmtKX5tCtxOlVGmA4THELGFbhQu8KKNxFn7M45WlnYP96Om0A07raMt
 erAg==
X-Gm-Message-State: APjAAAUmoNnUmUPDvzNI0v+3k0q8Po7KouEvzni93XB+eK6g7IRanIuJ
 zQNmPcpobwl5VnlezdmWWigtaVzP
X-Google-Smtp-Source: APXvYqxGYoxvZLCvZeC6j+Zl9RLaN9DzV1t+HXko57q82FnzXhsUJw/4UtRXGcPe4w8q2Pwk1WZ4sA==
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr14982081lja.238.1560848342521; 
 Tue, 18 Jun 2019 01:59:02 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r24sm2764598ljb.72.2019.06.18.01.59.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 01:59:01 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 18 Jun 2019 11:58:51 +0300
Message-Id: <20190618085851.22902-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/arm: remove unused dt_device_node parameter
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
Cc: julien.grall@arm.com, sstabellini@kernel.org,
 Viktor Mitin <viktor_mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBvZiB0aGUgZnVuY3Rpb24gZ2VuZXJhdGluZyBub2RlcyAoZS5nIG1ha2VfdGltZXJfbm9k
ZSkKdGFrZSBpbiBhIGR0X2RldmljZV9ub2RlIHBhcmFtZXRlciwgYnV0IG5ldmVyIHVzZWQgaXQu
Ckl0IGlzIGFjdHVhbGx5IG1pc3VzZWQgd2hlbiBjcmVhdGluZyBEVCBmb3IgRG9tVS4KU28gaXQg
aXMgdGhlIGJlc3QgdG8gcmVtb3ZlIHRoZSBwYXJhbWV0ZXIuCgpTdWdnZXN0ZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IFZpa3RvciBNaXRp
biA8dmlrdG9yX21pdGluQGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YyB8IDE5ICsrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCBkOTgzNjc3OWQxLi43ZmI4
MjhjYWUyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC03NDIsOCArNzQyLDcgQEAgc3RhdGljIGludCBf
X2luaXQgbWFrZV9oeXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwKICAgICByZXR1cm4g
cmVzOwogfQogCi1zdGF0aWMgaW50IF9faW5pdCBtYWtlX3BzY2lfbm9kZSh2b2lkICpmZHQsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKnBhcmVudCkKK3N0YXRpYyBpbnQgX19pbml0IG1ha2VfcHNjaV9ub2RlKHZvaWQgKmZkdCkK
IHsKICAgICBpbnQgcmVzOwogICAgIGNvbnN0IGNoYXIgY29tcGF0W10gPQpAQCAtNzc5LDggKzc3
OCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfcHNjaV9ub2RlKHZvaWQgKmZkdCwKICAgICBy
ZXR1cm4gcmVzOwogfQogCi1zdGF0aWMgaW50IF9faW5pdCBtYWtlX2NwdXNfbm9kZShjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnBhcmVudCkKK3N0YXRpYyBpbnQgX19p
bml0IG1ha2VfY3B1c19ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHZvaWQgKmZkdCkKIHsK
ICAgICBpbnQgcmVzOwogICAgIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqY3B1cyA9IGR0
X2ZpbmRfbm9kZV9ieV9wYXRoKCIvY3B1cyIpOwpAQCAtOTYyLDggKzk2MCw3IEBAIHN0YXRpYyBp
bnQgX19pbml0IG1ha2VfZ2ljX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0
LAogICAgIHJldHVybiByZXM7CiB9CiAKLXN0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9k
ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlKQorc3RhdGlj
IGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHZvaWQg
KmZkdCkKIHsKICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aW1lcl9p
ZHNbXSBfX2luaXRjb25zdCA9CiAgICAgewpAQCAtMTM4MCw3ICsxMzc3LDcgQEAgc3RhdGljIGlu
dCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZv
ICpraW5mbywKICAgICBpZiAoIGRldmljZV9nZXRfY2xhc3Mobm9kZSkgPT0gREVWSUNFX0dJQyAp
CiAgICAgICAgIHJldHVybiBtYWtlX2dpY19ub2RlKGQsIGtpbmZvLT5mZHQsIG5vZGUpOwogICAg
IGlmICggZHRfbWF0Y2hfbm9kZSh0aW1lcl9tYXRjaGVzLCBub2RlKSApCi0gICAgICAgIHJldHVy
biBtYWtlX3RpbWVyX25vZGUoZCwga2luZm8tPmZkdCwgbm9kZSk7CisgICAgICAgIHJldHVybiBt
YWtlX3RpbWVyX25vZGUoZCwga2luZm8tPmZkdCk7CiAKICAgICAvKiBTa2lwIG5vZGVzIHVzZWQg
YnkgWGVuICovCiAgICAgaWYgKCBkdF9kZXZpY2VfdXNlZF9ieShub2RlKSA9PSBET01JRF9YRU4g
KQpAQCAtMTQ1NCwxMSArMTQ1MSwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShz
dHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAogICAgICAgICBpZiAo
IHJlcyApCiAgICAgICAgICAgICByZXR1cm4gcmVzOwogCi0gICAgICAgIHJlcyA9IG1ha2VfcHNj
aV9ub2RlKGtpbmZvLT5mZHQsIG5vZGUpOworICAgICAgICByZXMgPSBtYWtlX3BzY2lfbm9kZShr
aW5mby0+ZmR0KTsKICAgICAgICAgaWYgKCByZXMgKQogICAgICAgICAgICAgcmV0dXJuIHJlczsK
IAotICAgICAgICByZXMgPSBtYWtlX2NwdXNfbm9kZShkLCBraW5mby0+ZmR0LCBub2RlKTsKKyAg
ICAgICAgcmVzID0gbWFrZV9jcHVzX25vZGUoZCwga2luZm8tPmZkdCk7CiAgICAgICAgIGlmICgg
cmVzICkKICAgICAgICAgICAgIHJldHVybiByZXM7CiAKQEAgLTE3MTMsMTEgKzE3MTAsMTEgQEAg
c3RhdGljIGludCBfX2luaXQgcHJlcGFyZV9kdGJfZG9tVShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1
Y3Qga2VybmVsX2luZm8gKmtpbmZvKQogICAgIGlmICggcmV0ICkKICAgICAgICAgZ290byBlcnI7
CiAKLSAgICByZXQgPSBtYWtlX3BzY2lfbm9kZShraW5mby0+ZmR0LCBOVUxMKTsKKyAgICByZXQg
PSBtYWtlX3BzY2lfbm9kZShraW5mby0+ZmR0KTsKICAgICBpZiAoIHJldCApCiAgICAgICAgIGdv
dG8gZXJyOwogCi0gICAgcmV0ID0gbWFrZV9jcHVzX25vZGUoZCwga2luZm8tPmZkdCwgTlVMTCk7
CisgICAgcmV0ID0gbWFrZV9jcHVzX25vZGUoZCwga2luZm8tPmZkdCk7CiAgICAgaWYgKCByZXQg
KQogICAgICAgICBnb3RvIGVycjsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
