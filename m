Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464C2133D4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 08:03:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrEmt-00071k-Al; Fri, 03 Jul 2020 06:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO50=AO=qq.com=jinchen1227@srs-us1.protection.inumbo.net>)
 id 1jrEmn-00071a-GM
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 06:03:02 +0000
X-Inumbo-ID: d284b566-bcf2-11ea-8923-12813bfff9fa
Received: from smtpbgeu1.qq.com (unknown [52.59.177.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d284b566-bcf2-11ea-8923-12813bfff9fa;
 Fri, 03 Jul 2020 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1593756164; bh=uSL9O6FYZvNNmDKGVHwcm66t1VAgLHRwlBt0Em1xOZA=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=aP/s8xaXjOxRJzD4DHx+dcN8wWrk7tC5tpGqIsYT+An468NBl6g1rP7Dkk4dnUgg2
 /vCZxZ90OqhvfN/uSDXWdFFHzWSwRIT2VOu3kWYSK9CdR/e3TS52az9mieJLHEcU82
 buUxgjIntM16T1SqeWjIC75+1U707eTxqANKDjcU=
X-QQ-FEAT: 9d8LckC02S2WHpF/yotlfXpYFwNjGAYcKdZVAE+a84CrsVkjsK8phZclF+w88
 OtfhqxXAqBVaDANvIX0CIwkiqCbnuGKZ6oy6fBiVfg4LaDvaOeEKMltQoq4lkubmHVZyhWv
 +vcDw4fXYwFmuBPRX08AGh3CGx8LIR4GSfx1LnGLIlSJIfhYVfhu8B0njFEDnPi72NmC5Jr
 b6AY09SDlTnmWnT5D0cZbk1lbXxkOoK9hq9mBsPCVTVqpRi93SxncOAP+RC7BSdcOym9k0I
 hNzakm4a/E1fjcK1miNKH+Ld4=
X-QQ-SSF: 00000000000000F000000000000000Z
X-QQ-XMAILINFO: MRdXMdGsawJ9lYvPyqsR1aRpEm18ocO/abRAn4PtrbXwVCFDF0vKgbF03+QKYG
 QZJDVokSXhOeRPuZsDpsH1vlOz3P6IBxAKZcSnbx+yFM07vDos6z9XDioAKOVdRp0jbJD8noib7OZ
 wO5fsvwwW1ah5rvHrMrTqB+HLAOdVH6DoazDTdTuY44S/ne8qrT7TvW7Ma1o6kAvXfVwvfm7/DuyV
 OsiIYVZHBaHuJVTsQhkE1U2B4DSD7M4w8P6jCo12RQMGppO0B1xk1fSqxxHABOOqFD/SpIovHK9S5
 ix694baIFHa3zWLWurHjPdUBZfX69OJlhg38ROBiDBGemIAA+UZD/xI0HCS9T1DlYhNvs64IMMvPK
 lw1T3H82RC7HIb+GnzyAnvqIsdb9o6IIswNjzMuZsq3XG1OKDOzB2ZwW+IKMnKzyXTXwh2PiQcxBq
 Fxgrt2idohHMxY6rptlTczM8Za1qzwvPagTHjBDWQnN4qnsP1bTMIhbCIE6nzo361Ea9QYPZN70Ko
 pwVARY8uGA2OBdqmi+xUtGGHQ4Zp7jKLaiVC8pLo0zEmudso+u9nTkV4TyfeQTJF7EF2p4sk5sFpb
 p4s6KAgsEZpyq3fnUqKZ1oiBo5kBAX0E5EOuTlwEOdNDfPw4+I+Atz2LHFVyXDRij05Jl8MYpvEWr
 m+iXsKQk2lSSYznpNflvg+neYQTw7WBO/JcccJ3ywSxKyyxCd/QqEhuzdGzwYuAxmcYPHN
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 120.201.105.119
X-QQ-STYLE: 
X-QQ-mid: webmail712t1593756164t4706451
From: "=?gb18030?B?amluY2hlbg==?=" <jinchen1227@qq.com>
To: "=?gb18030?B?SnVsaWVuIEdyYWxs?=" <julien@xen.org>,
 "=?gb18030?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Subject: =?gb18030?B?u9i4tKO6IFtYZW4gQVJNNjRdIFNhdmUgY29yZWR1?=
 =?gb18030?B?bXAgbG9nIHdoZW4geGVuL2RvbTAgY3Jhc2ggb24g?=
 =?gb18030?B?QVJNNjQ/?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EFECA03_10E771F8_7BF8E463"
Content-Transfer-Encoding: 8Bit
Date: Fri, 3 Jul 2020 14:02:43 +0800
X-Priority: 3
Message-ID: <tencent_C1F76837DF25C430969ABF6E4A557260AA0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 03 Jul 2020 14:02:44 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign11
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

------=_NextPart_5EFECA03_10E771F8_7BF8E463
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

VGhhbmsgeW91IGZvciB5b3VyIHJlcGx5IQ0KDQoNCk9uIDAyLzA3LzIwMjAgMDI6NDEsIGpp
bmNoZW4gd3JvdGU6DQomZ3Q7Jmd0OyBIZWxsbyB4ZW4gZXhwZXJ0czoNCiZndDsmZ3Q7IA0K
Jmd0OyZndDsgSXMgdGhlcmUgYW55IHdheSB0byBzYXZlIHhlbiBhbmQgZG9tMCBjb3JlIGR1
bXAgbG9nIHdoZW4geGVuIG9yIGRvbTAgDQomZ3Q7Jmd0OyBjcmFzaCBvbiBBUk02NCBwbGF0
Zm9ybT8NCg0KJmd0O1VzdWFsbHkgYWxsIHRoZSBjcmFzaCBzdGFjayB0cmFjZSAoWGVuIGFu
ZCBEb20wKSBzaG91bGQgYmUgb3V0cHV0IG9uIHRoZSANCiZndDtYZW4gQ29uc29sZS4NCg0K
DQpCdXQgaWYgSSBkb24ndCBjb25uZWN0IGEgZGVidWcgc2VyaWFsIGFuZCB3YW50IHRvIGNo
ZWNrIHRoZSBkdW1wIGVycm9yIGFmdGVyIHJlYm9vdD8NCg0KJmd0OyZndDsmbmJzcDsgJm5i
c3A7ICZuYnNwOyBJIGZpbmQgdGhhdCB0aGUga2R1bXAgc2VlbXMgY2FuJ3QgcnVuIG9uIEFS
TTY0IHBsYXRmb3JtPw0KDQomZ3Q7V2UgZG9uJ3QgaGF2ZSBzdXBwb3J0IGZvciBrZHVtcC9r
ZXhlYyBvbiBBcm0gaW4gWGVuIHlldC4NCg0KDQpJIGZpbmQgdGhlIGtkdW1wIHNlZW1zIHRo
ZSBhcHByb3ByaWF0ZSB3YXkgdG8gZG8gdGhpcywgYnV0IGl0IGRvZXNuJ3Qgc3VwcG9ydCB4
ZW4gYXJtNjQuDQoNCiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgQXJlIHRoZXJlIGFu
eSBwYXRjaGVzIG9yIG90aGVyIHdheSB0byBhY2hpdmUgdGhpcyBnb2FsPw0KDQomZ3Q7SSBh
bSBub3QgYXdhcmUgb2YgYW55IHBhdGNoZXMsIGJ1dCB0aGV5IHdvdWxkIGJlIHdlbGNvbWVk
Lg0KDQomZ3Q7Rm9yIG90aGVyIHdheSwgaXQgZGVwZW5kcyB3aGF0IGV4YWN0bHkgeW91IGV4
cGVjdC4gRG8geW91IG5lZWQgbW9yZSB0aGFuIA0KJmd0O3RoZSBzdGFjayB0cmFjZT8NCg0K
VGhlIHN0YWNrIHRyYWNlIHdpbGwgYmUgb2ssIGlmIG90aGVyIGluZm9tYW50aW9uIGNhbiBi
ZSBzYXZlIHdpbGwgYmUgYmV0dGVyIChsaWtlIG1lbW9yeS92Y3B1L2RvbWFpbiwgZXRjLik=

------=_NextPart_5EFECA03_10E771F8_7BF8E463
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5UaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkhPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5PbiAwMi8wNy8yMDIwIDAyOjQxLCBqaW5jaGVuIHdyb3RlOjwv
ZGl2PjxkaXY+Jmd0OyZndDsgSGVsbG8geGVuIGV4cGVydHM6PGJyPiZndDsmZ3Q7IDxicj4m
Z3Q7Jmd0OyBJcyB0aGVyZSBhbnkgd2F5IHRvIHNhdmUgeGVuIGFuZCBkb20wIGNvcmUgZHVt
cCBsb2cgd2hlbiB4ZW4gb3IgZG9tMCA8YnI+Jmd0OyZndDsgY3Jhc2ggb24gQVJNNjQgcGxh
dGZvcm0/PGJyPjxicj4mZ3Q7VXN1YWxseSBhbGwgdGhlIGNyYXNoIHN0YWNrIHRyYWNlIChY
ZW4gYW5kIERvbTApIHNob3VsZCBiZSBvdXRwdXQgb24gdGhlIDxicj4mZ3Q7WGVuIENvbnNv
bGUuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CdXQgaWYgSSBkb24ndCBjb25uZWN0IGEg
ZGVidWcgc2VyaWFsIGFuZCB3YW50IHRvIGNoZWNrIHRoZSBkdW1wIGVycm9yIGFmdGVyIHJl
Ym9vdD88L2Rpdj48ZGl2Pjxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7IEkgZmlu
ZCB0aGF0IHRoZSBrZHVtcCBzZWVtcyBjYW4ndCBydW4gb24gQVJNNjQgcGxhdGZvcm0/PGJy
Pjxicj4mZ3Q7V2UgZG9uJ3QgaGF2ZSBzdXBwb3J0IGZvciBrZHVtcC9rZXhlYyBvbiBBcm0g
aW4gWGVuIHlldC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgZmluZCB0aGUga2R1bXAg
c2VlbXMgdGhlIGFwcHJvcHJpYXRlIHdheSB0byBkbyB0aGlzLCBidXQgaXQgZG9lc24ndCBz
dXBwb3J0IHhlbiBhcm02NC48YnI+PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
QXJlIHRoZXJlIGFueSBwYXRjaGVzIG9yIG90aGVyIHdheSB0byBhY2hpdmUgdGhpcyBnb2Fs
Pzxicj48YnI+Jmd0O0kgYW0gbm90IGF3YXJlIG9mIGFueSBwYXRjaGVzLCBidXQgdGhleSB3
b3VsZCBiZSB3ZWxjb21lZC48YnI+PGJyPiZndDtGb3Igb3RoZXIgd2F5LCBpdCBkZXBlbmRz
IHdoYXQgZXhhY3RseSB5b3UgZXhwZWN0LiBEbyB5b3UgbmVlZCBtb3JlIHRoYW4gPGJyPiZn
dDt0aGUgc3RhY2sgdHJhY2U/PGJyPjxicj5UaGUgc3RhY2sgdHJhY2Ugd2lsbCBiZSBvaywg
aWYgb3RoZXIgaW5mb21hbnRpb24gY2FuIGJlIHNhdmUgd2lsbCBiZSBiZXR0ZXIgKGxpa2Ug
bWVtb3J5L3ZjcHUvZG9tYWluLCBldGMuKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJy
Pjxicj48L2Rpdj4=

------=_NextPart_5EFECA03_10E771F8_7BF8E463--




