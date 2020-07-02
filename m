Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9082119B7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 03:43:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqoEe-0002TW-2w; Thu, 02 Jul 2020 01:41:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5R4B=AN=qq.com=jinchen1227@srs-us1.protection.inumbo.net>)
 id 1jqoEb-0002TR-R1
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 01:41:54 +0000
X-Inumbo-ID: 2bc2212a-bc05-11ea-bb8b-bc764e2007e4
Received: from smtpbgau1.qq.com (unknown [54.206.16.166])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bc2212a-bc05-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 01:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1593654094; bh=k8KB57vn6CvpptSOhh7aUD6mLR0zOLEgcadtesUNcc8=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=hYENp+RagolU4bRfhU3xi7/vo3M1HrpABO6XJ/8vFzCqQkomOXPV++0tLJfPX/V6I
 UzvOCJ8DAxAarZR8ghQe05JdGogWAULqWt4ga7VGPQDgNTWl4X/BUG4qq6gQfdzbDx
 9WGfGJ3iqxebL8LPNX1jrmAVZDv37WVr31YJhrB0=
X-QQ-FEAT: UcX0e83sQ0gij4JRpWjVZqwlck7d/ymes1KTTpuoOStCztPdktMMp5+IxozJT
 1tmxwTOzRNZzhcY2kCX9fdmOFnTcUEvnR8QUuX8TVTtWGRveHc4p0qk1spI+rmp96VoboRw
 6EvFKXDFL/zPCWr8rHuM/IobdXVwAcuKKWzr0GD73hoF7mKMRwXZhT7bF0wRRrRfrp/eW+A
 GDR/VsEaGrPcp5khkoFvd3WbUCtYWd6DdTD6abvgOorQr1h5s2hbBKXQPa8m5qWqz8n27Rv
 GY9EyGI6DZBYJmVvEqzcUvynA=
X-QQ-SSF: 00000000000000F000000000000000Z
X-QQ-XMAILINFO: N3bN8o5bCt8q7DOeuxGy9o+mNNdUOwFQSXTZZW3HhmNCtY/4hs5k/veBRR+aaA
 n1J87spyVllJbf68x2RY8jSR4uKamfSqf/qM9iApBy90hED/DMAaHlBc56Hue+R+j/h+6hledgbd/
 p7h3Rm2lqNvejYM9mBItmKk3ZIP1a1HyypS7m4mOl+E6Jz9azOnubrlKA6eEFfZoU56z2DeQvZkHI
 JxZaWNekE7m/TrPq3q+LulQjq9pXfFayfkVHAYFSilrAQOwiDoEIZBLTbzIRCGqi9+ePJ5nTLBPUD
 bE78wtuOgHqhZTvr7KIWAocHiC8F8UF6Z3AyouteTOKDT45yCASQQcHnaEWFOajjISV7G3Pdv6xdj
 29PSFPBs2GoQgBmLhCmVQtPFwCXdsEy2UZl6tKBXelYg/0MP3SX7nsaO6Cy3VuBa7VcXpKOuqgu92
 5mxB/4aXx2HttOhmUpPg+Cnv6dtg1Fd19bwSsRqfwGYD0vTt980yJX8S/BU4TaOic3sjp1z/sz7C0
 9X6336nUeOY1nmEJ8yoyMQ00npdNPFg2hDSiMl6ppZw6QaUG1zf4w4RZCA+lCGltm2gVUEQUtiH0j
 pYj/VlHxfaudMhFgxw6dI/Gr9XQUG42c1hy1gXPhg72P6eI3OtG6VF9x3134O1ffbutvHkwyz1E1U
 /AKQ5GVjQ5ZTjyRJipJgqqzWNqlmfNzCuPUhE8
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 120.201.105.119
X-QQ-STYLE: 
X-QQ-mid: webmail712t1593654093t9775718
From: "=?gb18030?B?amluY2hlbg==?=" <jinchen1227@qq.com>
To: "=?gb18030?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Subject: [Xen ARM64]  Save coredump log when xen/dom0 crash on ARM64?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EFD3B4D_128C68C8_5A57067A"
Content-Transfer-Encoding: 8Bit
Date: Thu, 2 Jul 2020 09:41:33 +0800
X-Priority: 3
Message-ID: <tencent_F424A8312298D36ED25612607EF4BC341B0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 02 Jul 2020 09:41:34 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
X-QQ-Bgrelay: 1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.

------=_NextPart_5EFD3B4D_128C68C8_5A57067A
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8geGVuIGV4cGVydHM6DQoNCiZuYnNwOyAmbmJzcDsmbmJzcDtJcyB0aGVyZSBhbnkg
d2F5IHRvIHNhdmUgeGVuIGFuZCBkb20wIGNvcmUgZHVtcCBsb2cgd2hlbiB4ZW4gb3IgZG9t
MCBjcmFzaCBvbiBBUk02NCBwbGF0Zm9ybT8NCiZuYnNwOyAmbmJzcDsgSSBmaW5kIHRoYXQg
dGhlIGtkdW1wIHNlZW1zIGNhbid0Jm5ic3A7cnVuIG9uIEFSTTY0IHBsYXRmb3JtPw0KJm5i
c3A7ICZuYnNwOyBBcmUgdGhlcmUgYW55Jm5ic3A7cGF0Y2hlcyZuYnNwO29yIG90aGVyIHdh
eSB0byBhY2hpdmUgdGhpcyBnb2FsPw0KJm5ic3A7ICZuYnNwOyBUaGFuayAmbmJzcDt5b3Ug
dmVyeSBtdWNoIQ==

------=_NextPart_5EFD3B4D_128C68C8_5A57067A
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtNaWNyb3Nv
ZnQgWWFIZWkgVUkmcXVvdDs7IGZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQt
dmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyMXB4OyB3aWRvd3M6
IDE7Ij5IZWxsbyB4ZW4gZXhwZXJ0czo8L3NwYW4+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
ICZxdW90O01pY3Jvc29mdCBZYUhlaSBVSSZxdW90OzsgZm9udC12YXJpYW50LW51bWVyaWM6
IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgbGluZS1oZWlnaHQ6
IDIxcHg7IHdpZG93czogMTsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
JnF1b3Q7TWljcm9zb2Z0IFlhSGVpIFVJJnF1b3Q7OyBmb250LXZhcmlhbnQtbnVtZXJpYzog
bm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBsaW5lLWhlaWdodDog
MjFweDsgd2lkb3dzOiAxOyI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYmEo
MCwgMCwgMCwgMCk7Ij4mbmJzcDsgJm5ic3A7Jm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSJi
YWNrZ3JvdW5kLWNvbG9yOiB0cmFuc3BhcmVudDsiPklzIHRoZXJlIGFueSB3YXkgdG8gc2F2
ZSB4ZW4gYW5kIGRvbTAgY29yZSBkdW1wIGxvZyB3aGVuIHhlbiBvciBkb20wIGNyYXNoIG9u
IEFSTTY0IHBsYXRmb3JtPzwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
JnF1b3Q7TWljcm9zb2Z0IFlhSGVpIFVJJnF1b3Q7OyBmb250LXZhcmlhbnQtbnVtZXJpYzog
bm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBsaW5lLWhlaWdodDog
MjFweDsgd2lkb3dzOiAxOyI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTAuNXB0OyBsaW5l
LWhlaWdodDogMS41OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+Jm5i
c3A7ICZuYnNwOyBJIGZpbmQgdGhhdCB0aGUga2R1bXAgc2VlbXMgY2FuJ3Q8L3NwYW4+PHNw
YW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHRyYW5zcGFyZW50OyI+Jm5ic3A7cnVuIG9u
IEFSTTY0IHBsYXRmb3JtPzwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LXZhcmlhbnQt
bnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBsaW5l
LWhlaWdodDogMjFweDsgd2lkb3dzOiAxOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiAm
cXVvdDtNaWNyb3NvZnQgWWFIZWkgVUkmcXVvdDs7IGJhY2tncm91bmQtY29sb3I6IHJnYmEo
MCwgMCwgMCwgMCk7IGNvbG9yOiBpbmhlcml0ICFpbXBvcnRhbnQ7Ij4mbmJzcDsgJm5ic3A7
IEFyZSB0aGVyZSBhbnkmbmJzcDtwYXRjaGVzJm5ic3A7b3Igb3RoZXIgd2F5IHRvIGFjaGl2
ZSB0aGlzIGdvYWw/PC9zcGFuPjxzcGFuIGNsYXNzPSJBcHBsZS1jb252ZXJ0ZWQtc3BhY2Ui
IHN0eWxlPSJmb250LWZhbWlseTogzqLI7dHFuto7IGNvbG9yOiByZ2IoMTI4LCAxMjgsIDEy
OCk7Ij48L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6ICZxdW90O01pY3Jv
c29mdCBZYUhlaSBVSSZxdW90OzsgZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9u
dC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgbGluZS1oZWlnaHQ6IDIxcHg7IHdpZG93
czogMTsiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDAsIDAsIDAsIDAp
OyI+Jm5ic3A7ICZuYnNwOyBUaGFuayAmbmJzcDt5b3UgdmVyeSBtdWNoITwvc3Bhbj48L2Rp
dj4=

------=_NextPart_5EFD3B4D_128C68C8_5A57067A--




