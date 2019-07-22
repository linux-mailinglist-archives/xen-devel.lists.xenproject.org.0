Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D166F80D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 05:43:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpPBZ-0007yQ-AS; Mon, 22 Jul 2019 03:40:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=927D=VT=qq.com=370909376@srs-us1.protection.inumbo.net>)
 id 1hpOHV-0003bE-57
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 02:42:29 +0000
X-Inumbo-ID: 56bace3a-ac2a-11e9-8980-bc764e045a96
Received: from smtpproxy19.qq.com (unknown [184.105.206.84])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 56bace3a-ac2a-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 02:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1563763339; bh=aW07KyigZbHww/m6neGw5VD71eJ2uxzZY6+JIstF0EY=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=zyzsEv8hFJPEVM4UyWzIlNevDPsPqlCvG3oKg42i7aqa9G40pTBFxB2dx7lFPZS04
 BJb/xlW7aus6Du9rBhIt7ntmK5GK5zgXGQvLKL6lN/C0Sp/kwNOO2Frsjwc2HkXxbT
 KU93pKe8xZZXgVitk6cyudxMfQO4Uj4vJEXnXX2Q=
X-QQ-FEAT: y/Yfw/TLgL7hgo8TlxJIXBGoUFabtbJ6yO0HZBGOXb741EYcTZBnBoRe+7WHz
 +OG9Mx0Rp/U1xvAa7PRp/yhqFdNyjXraRC0HS9SPb1IMcOHxbVWgdQOvygWtiah6VtBRBUf
 tj/yPhS3/F24KbAFhBx8q0SYppS31eEzRhWtTLsq7qc+sQSX+BNOIFuQYnOWbvlNlGA4uGg
 4qGIz7VUHCHVplscqjDyC/nJrkvrRMn2mayw3RbuVLmmiktpcE7bOmK2rL22bkbDsFZMdoi
 atVhqF613NR2BR
X-QQ-SSF: 00000000000000F000000000000000Z
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 59.46.154.55
X-QQ-STYLE: 
X-QQ-mid: webmail154t1563763338t7440457
From: "=?ISO-8859-1?B?UmFtYmxl?=" <370909376@qq.com>
To: "=?ISO-8859-1?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Date: Mon, 22 Jul 2019 10:42:17 +0800
X-Priority: 3
Message-ID: <tencent_48DC3C7573A6120193A727BBD92F819ED105@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 22 Jul 2019 10:42:18 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 22 Jul 2019 03:40:23 +0000
Subject: [Xen-devel] [Xen ARM] Can I use xen tools lib on android domain U?
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
Content-Type: multipart/mixed; boundary="===============9187513505051387985=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.

--===============9187513505051387985==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5D352289_0CA14A08_4E8E06CE"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5D352289_0CA14A08_4E8E06CE
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgeGVuLWRldmVsIGV4cGVydHMsICAgICBOb3cgSSB1c2UgbGludXggYXMgZG9tYWluIDAg
YW5kIEFuZHJvaWQgYXMgZG9tYWluIFUgb24gQVJNIGJvYXJkLA0KICAgICBBbmQgSSB3YW50
IHRvIHVzZSB0aGUgeGVuIHRvb2xzIGxpYnMgQVBJIChlZy4gQVBJcyBpbiB4ZW5nbnR0YWIu
aC94ZW5ldnRjaG4uaC94ZW5zdG9yZS5oIGV0Yy4pIG9uIGRvbWFpbiBhbmRyb2lkIHRvIGRl
dmVsb3AgdXNlciBzcGFjZSBhcHBsaWNhdGlvbnMuDQogICAgIEhvdyBDYW4gSSBpbnN0YWxs
IHRoZXNlIHhlbiB0b29scyBsaWJzIG9uIEFuZHJvaWQgYW5kIGhvdyB0byB1c2UgdGhpcyBs
aWJzPyBBcmUgdGhlcmUgYW55IGd1aWRlcz8NCiAgICAgVGhhbmsgeW91IHZlcnkgbXVjaCE=

------=_NextPart_5D352289_0CA14A08_4E8E06CE
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgeGVuLWRldmVsIGV4cGVydHMsPGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO05vdyBJIHVz
ZSBsaW51eCBhcyBkb21haW4gMCBhbmQgQW5kcm9pZCBhcyBkb21haW4gVSBvbiBBUk0gYm9h
cmQsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO0FuZCBJIHdhbnQgdG8gdXNlIHRo
ZSB4ZW4gdG9vbHMgbGlicyBBUEkgKGVnLiBBUElzIGluIHhlbmdudHRhYi5oL3hlbmV2dGNo
bi5oL3hlbnN0b3JlLmggZXRjLikgb24gZG9tYWluIGFuZHJvaWQgdG8gZGV2ZWxvcCB1c2Vy
IHNwYWNlIGFwcGxpY2F0aW9ucy48L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7SG93
IENhbiBJIGluc3RhbGwgdGhlc2UgeGVuIHRvb2xzIGxpYnMgb24gQW5kcm9pZCBhbmQgaG93
IHRvIHVzZSB0aGlzIGxpYnM/IEFyZSB0aGVyZSBhbnkgZ3VpZGVzPzwvZGl2PjxkaXY+Jm5i
c3A7ICZuYnNwOyAmbmJzcDtUaGFuayB5b3UgdmVyeSBtdWNoITwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2Pg==

------=_NextPart_5D352289_0CA14A08_4E8E06CE--





--===============9187513505051387985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9187513505051387985==--




