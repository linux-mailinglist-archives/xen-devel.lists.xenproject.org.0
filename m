Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF072DAE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 13:33:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqFTq-00032q-1q; Wed, 24 Jul 2019 11:30:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCnA=VV=qq.com=370909376@srs-us1.protection.inumbo.net>)
 id 1hqFTm-00032l-Dm
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 11:30:44 +0000
X-Inumbo-ID: 74260fdd-ae06-11e9-8980-bc764e045a96
Received: from smtpbgsg2.qq.com (unknown [54.254.200.128])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 74260fdd-ae06-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1563967831; bh=iDlhwLGYIb2PfQZI7qGaXNXTi0KGIbLkl/GSNOGp1Bw=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=m4iaTDWKK6aB7Y5B46m6+vfM+rFaCx7rK9Sgv/rx3JI3wxUoTZmlvp462wDFU8Wsw
 My9mtX6tQJm9jaJq/yA1mfkfJYZMjekKyaoIXrX4VjqoxmWtANtlk03OHQhK8Iz/qB
 BaMRVCtN3ZTT7dPtn0iP3imLXo3Q13AoUGy1kIWU=
X-QQ-FEAT: uay7uZNy0NloFxvnqqlbmC3P+7mkdF5GedbwSIiIqgLizDWz0M+eJoQB5Eqay
 ThM/8FHPhZJzte+kDeyHuALWmigGO1oQai/6EWXUcZjlv9v3X+Q3V550RFJtdB+QfmJugSr
 3InBtXBPBqJl52i/nZY170nCTai1dDAx8he+uhgjJyv3pKw0huaN84skMaLu5RcwXWuaiB3
 dwWPp8J+lJWuLS5Cz7hraP/QtchRzOiGUpSpSwoQrxA/oqjZCx/z835VidFHYMEHCYRRdJy
 RX4sfSEPsJTSYjyzIn+zOMyNM=
X-QQ-SSF: 00000000000000F000000000000000Z
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 59.46.154.55
In-Reply-To: <tencent_48DC3C7573A6120193A727BBD92F819ED105@qq.com>
References: <tencent_48DC3C7573A6120193A727BBD92F819ED105@qq.com>
X-QQ-STYLE: 
X-QQ-mid: webmail154t1563967831t6298318
From: "=?ISO-8859-1?B?UmFtYmxl?=" <370909376@qq.com>
To: "=?ISO-8859-1?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Date: Wed, 24 Jul 2019 19:30:30 +0800
X-Priority: 3
Message-ID: <tencent_A7328A9BFB6D6A56EE61BEF608349F25E80A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1011624423
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 24 Jul 2019 19:30:31 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
Subject: Re: [Xen-devel] [Xen ARM] Can I use xen tools lib on android domain
 U?
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
Content-Type: multipart/mixed; boundary="===============8773755896765036434=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.

--===============8773755896765036434==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5D384156_0C0061C8_2436AF01"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5D384156_0C0061C8_2436AF01
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

QXJlIHRoZXJlIGFueSBndWlkYW5jZSBmb3IgdGhpcyByZXF1aXJlbWVudHM/DQpUaGFuayB5
b3UhDQogDQoNCg0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLSBPcmlnaW5hbCAtLS0tLS0tLS0t
LS0tLS0tLS0NCkZyb206ICJSYW1ibGUiPDM3MDkwOTM3NkBxcS5jb20+Ow0KRGF0ZTogTW9u
LCBKdWwgMjIsIDIwMTkgMTA6NDIgQU0NClRvOiAieGVuLWRldmVsIjx4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc+Ow0KDQpTdWJqZWN0OiBbWGVuIEFSTV0gQ2FuIEkgdXNlIHhl
biB0b29scyBsaWIgb24gYW5kcm9pZCBkb21haW4gVT8NCg0KDQoNCkhpIHhlbi1kZXZlbCBl
eHBlcnRzLCAgICAgTm93IEkgdXNlIGxpbnV4IGFzIGRvbWFpbiAwIGFuZCBBbmRyb2lkIGFz
IGRvbWFpbiBVIG9uIEFSTSBib2FyZCwNCiAgICAgQW5kIEkgd2FudCB0byB1c2UgdGhlIHhl
biB0b29scyBsaWJzIEFQSSAoZWcuIEFQSXMgaW4geGVuZ250dGFiLmgveGVuZXZ0Y2huLmgv
eGVuc3RvcmUuaCBldGMuKSBvbiBkb21haW4gYW5kcm9pZCB0byBkZXZlbG9wIHVzZXIgc3Bh
Y2UgYXBwbGljYXRpb25zLg0KICAgICBIb3cgQ2FuIEkgaW5zdGFsbCB0aGVzZSB4ZW4gdG9v
bHMgbGlicyBvbiBBbmRyb2lkIGFuZCBob3cgdG8gdXNlIHRoaXMgbGlicz8gQXJlIHRoZXJl
IGFueSBndWlkZXM/DQogICAgIFRoYW5rIHlvdSB2ZXJ5IG11Y2gh

------=_NextPart_5D384156_0C0061C8_2436AF01
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5BcmUgdGhlcmUgYW55IGd1aWRhbmNlIGZvciB0aGlzIHJlcXVpcmVtZW50cz88L2Rp
dj48ZGl2PlRoYW5rIHlvdSE8L2Rpdj48ZGl2PiZuYnNwOzwvZGl2PjxkaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOiAxMnB4O2ZvbnQt
ZmFtaWx5OiBBcmlhbCBOYXJyb3c7cGFkZGluZzoycHggMCAycHggMDsiPi0tLS0tLS0tLS0t
LS0tLS0tLSZuYnNwO09yaWdpbmFsJm5ic3A7LS0tLS0tLS0tLS0tLS0tLS0tPC9kaXY+PGRp
diBzdHlsZT0iZm9udC1zaXplOiAxMnB4O2JhY2tncm91bmQ6I2VmZWZlZjtwYWRkaW5nOjhw
eDsiPjxkaXY+PGI+RnJvbTo8L2I+Jm5ic3A7IlJhbWJsZSImbHQ7MzcwOTA5Mzc2QHFxLmNv
bSZndDs7PC9kaXY+PGRpdj48Yj5EYXRlOjwvYj4mbmJzcDtNb24sIEp1bCAyMiwgMjAxOSAx
MDo0MiBBTTwvZGl2PjxkaXY+PGI+VG86PC9iPiZuYnNwOyJ4ZW4tZGV2ZWwiJmx0O3hlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyZndDs7PHdicj48L2Rpdj48ZGl2PjwvZGl2Pjxk
aXY+PGI+U3ViamVjdDo8L2I+Jm5ic3A7W1hlbiBBUk1dIENhbiBJIHVzZSB4ZW4gdG9vbHMg
bGliIG9uIGFuZHJvaWQgZG9tYWluIFU/PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+SGkg
eGVuLWRldmVsIGV4cGVydHMsPGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO05vdyBJIHVzZSBs
aW51eCBhcyBkb21haW4gMCBhbmQgQW5kcm9pZCBhcyBkb21haW4gVSBvbiBBUk0gYm9hcmQs
PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO0FuZCBJIHdhbnQgdG8gdXNlIHRoZSB4
ZW4gdG9vbHMgbGlicyBBUEkgKGVnLiBBUElzIGluIHhlbmdudHRhYi5oL3hlbmV2dGNobi5o
L3hlbnN0b3JlLmggZXRjLikgb24gZG9tYWluIGFuZHJvaWQgdG8gZGV2ZWxvcCB1c2VyIHNw
YWNlIGFwcGxpY2F0aW9ucy48L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7SG93IENh
biBJIGluc3RhbGwgdGhlc2UgeGVuIHRvb2xzIGxpYnMgb24gQW5kcm9pZCBhbmQgaG93IHRv
IHVzZSB0aGlzIGxpYnM/IEFyZSB0aGVyZSBhbnkgZ3VpZGVzPzwvZGl2PjxkaXY+Jm5ic3A7
ICZuYnNwOyAmbmJzcDtUaGFuayB5b3UgdmVyeSBtdWNoITwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjwvZGl2Pg==

------=_NextPart_5D384156_0C0061C8_2436AF01--





--===============8773755896765036434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8773755896765036434==--




