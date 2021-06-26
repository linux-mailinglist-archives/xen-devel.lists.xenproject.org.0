Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C23B4F3F
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jun 2021 17:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147570.272169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxAPm-00053P-G8; Sat, 26 Jun 2021 15:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147570.272169; Sat, 26 Jun 2021 15:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxAPm-00050k-Cz; Sat, 26 Jun 2021 15:40:14 +0000
Received: by outflank-mailman (input) for mailman id 147570;
 Sat, 26 Jun 2021 15:40:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GWiO=LU=qq.com=2284696125@srs-us1.protection.inumbo.net>)
 id 1lxAPk-00050e-TE
 for xen-devel@lists.xenproject.org; Sat, 26 Jun 2021 15:40:13 +0000
Received: from out203-205-221-191.mail.qq.com (unknown [203.205.221.191])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8168ef38-a086-409b-9341-45451d3145fe;
 Sat, 26 Jun 2021 15:40:08 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8168ef38-a086-409b-9341-45451d3145fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1624722005; bh=mQdqil8MJcW72E6esP/TrAucxyDvk/VTTQR9a5B+shw=;
	h=From:To:Subject:Date;
	b=FeQzvd0vGT2k/lwE4oAu9zBLHNiR4uxJvf1KcmRSwpaWGauX/MHkle2Vm1jkmPZ5B
	 SYxMWSdFSHabXe+SNgTbwQu9egiPoLLq5cyP//IAFwXhLfJSvm2v3jSbnh4IGW9r2c
	 9U1oEItf58gQnOcHKvlzPTK5Cz6Ze3Yd/UqzKubU=
X-QQ-FEAT: zlhDrsF45Te9zTnBMo+pJnCBiHjJ2tkTVxX44SodkmcjqzRiJcelxnYP70LbO
	2qGmVIbztFiDTiJ0EXAo9HGeM8NIgC4zL8WnDt9ZtUb1EdnumnsYQmY6uoytxcolR6fEHxy
	ghho9gWka1e5N+sKvtWHIon39sFt1bhDFOhB0XNMsZWID1eeZqL9AiXLmKv4fozZ+OJPuvg
	mdfPZOjP1sS9mnMfxFsSrFw2VTHWvZv2tznPalzj8kMG9bggDG9deddfLP5A5K8KUkKCLxK
	HAnA==
X-QQ-SSF: 0000000000000020000000000000006
X-QQ-XMAILINFO: N+o6GGgP2bY6+PrtZNRmy+j9c36ar5l4C2FEJ53aAsIZZkHhv4vz+VRWiJLelA
	 EVUWwSAZ78sVK8Bdwo9n18bLgip1oidXATaUbz/j3R3NoZU5DDVk77fyKfi98YY+bt+XthEhg3B/G
	 1Na/NPFQTYtbynvWTKtQEC67frhmVyNVS5UN4g0Ldv9z1/fy2s9scwNpmHKeL29XNJqY6u7VYD2Bi
	 FQGSQ9CjMCEnr2NedrbkL26Apl0pFylz8VcHwwJ0mOffUGi1ejTZo59WPGIC5HrEombsxUM+ooDC6
	 KHja9+O4P3eW+sk1ORoFU1evepEnZ/HjJRDSkrKVDJG4mW5fVPSEBtA2AMH5P2x71s9nztE2gxFby
	 XfMC8jFQW/hosj2Ic+V2R6eVXOlDascJeBbgTkGNrbOAn5oKVeQo7VYU16ZGLE+OkgYFgMZDWS8S/
	 kRcZwt5fS6S8XqHPdyIOeEal8uDK6kXJbtzOoUjjY5ZX5xdcaNVpo7IHXRmgKmu2fbYo1Vt/hyfzN
	 YtFYm1jLzAw0vTRqRh8bT3ykBYRYhJgNSg8jLZbeHKAozrcgLPPEay0o32qKNF09eBvpeI1Tpnvsf
	 xYGuKfQlNrN4ZgAp6NS1K6/Wfemw1laCZcJfOXGzmLrcgvodLwIzovgFFEeD0nowIisMC11UDolcH
	 aIgP88k2cqztUWYdTzXA/0fAdwOE4jG/0s+/7Aa3Mxlt4CbQfCMpUF+fcI952rFBmHLmDEw3xoKno
	 rAk5aLuBJkjWUtIb+0dEaOz/jGs3/Re0AZ0I=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 183.172.26.224
X-QQ-STYLE: 
X-QQ-mid: webmail801t1624721817t8801481
From: "=?ISO-8859-1?B?UnJvYWNo?=" <2284696125@qq.com>
To: "=?ISO-8859-1?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Subject: A mismatched type error found
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_60D74999_10706D40_7C0933BE"
Content-Transfer-Encoding: 8Bit
Date: Sat, 26 Jun 2021 23:36:57 +0800
X-Priority: 3
Message-ID: <tencent_D17B77D71E5C6FE0BCB2559C7C59459FEF06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x

This is a multi-part message in MIME format.

------=_NextPart_60D74999_10706D40_7C0933BE
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGksIHdoZW4gSSBsb29rIHRoZSBzb3VyY2UgY29kZSBpbiBYZW4tNC4xNSBzb3VyY2UgY29k
ZSwgSSBmb3VuZCBhIHR5cGUgbWlzbWF0Y2guDQoNCg0KSW4gZGV0YWlsZWQsIGluIHhlbi9h
cmNoL3g4Ni9tc2kuYzpmaW5kX21zaV9lbnRyeSwgdGhlcmUgaXMgYSBjb21wYXJpc29uIGJl
dHdlZW4gZW50cnktJmd0O21zaV9hdHRyaWIudHlwZSBhbmQgY2FwX2lkLiBIb3dldmVyLCBh
Y2NvcmRpbmcgdG8gdGhlIGRlZmluaXRpb24sIHRoZSB0eXBlIGFwcGVhcnMgdG8gYmUgX191
OCwgd2hlcmUgaXMgYSBjaGFyIHZhcmlhYmxlLCBhbmQgdGhlIGNhcF9pZCBpcyBkZWZpbmVk
IGFzIGludCB2YXJpYWJsZSwgaGVuY2UgaXQgc2VlbXMgdG8gYmUuYSB0eXBlIG1pc21hdGNo
Lg0KDQoNCkRlc3BpdGUgdGhpcyBlcnJvciBkbyBub3QgYWZmZWN0IHN5c3RlbSBvcGVyYXRp
b24gYnkgZmFyLCBpdCBzdGlsbCBhZmZlY3QgdGhlIGNvZGUncyBxdWFsaXR5LCBhcyBzdWNo
IGVycm9yIGNvdWxkIHJlc3VsdCBpbiBwb3RlbnRpYWwgYnVncyBpbiB0aGUgZnV0dXJlLg0K
DQoNCkJlc3QgcmVnYXJkcy4NCg0KDQpGcmFua2xpbg==

------=_NextPart_60D74999_10706D40_7C0933BE
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7bHVj
aWRhIEdyYW5kZSZxdW90OywgVmVyZGFuYTsiPkhpLCB3aGVuIEkgbG9vayB0aGUgc291cmNl
IGNvZGUgaW4gWGVuLTQuMTUgc291cmNlIGNvZGUsIEkgZm91bmQgYSB0eXBlIG1pc21hdGNo
LjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtsdWNpZGEgR3JhbmRlJnF1
b3Q7LCBWZXJkYW5hOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVv
dDtsdWNpZGEgR3JhbmRlJnF1b3Q7LCBWZXJkYW5hOyI+SW4gZGV0YWlsZWQsIGluIHhlbi9h
cmNoL3g4Ni9tc2kuYzpmaW5kX21zaV9lbnRyeSwgdGhlcmUgaXMgYSBjb21wYXJpc29uIGJl
dHdlZW4gZW50cnktJmd0O21zaV9hdHRyaWIudHlwZSBhbmQgY2FwX2lkLiBIb3dldmVyLCBh
Y2NvcmRpbmcgdG8gdGhlIGRlZmluaXRpb24sIHRoZSB0eXBlIGFwcGVhcnMgdG8gYmUgX191
OCwgd2hlcmUgaXMgYSBjaGFyIHZhcmlhYmxlLCBhbmQgdGhlIGNhcF9pZCBpcyBkZWZpbmVk
IGFzIGludCB2YXJpYWJsZSwgaGVuY2UgaXQgc2VlbXMgdG8gYmUuYSB0eXBlIG1pc21hdGNo
LjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtsdWNpZGEgR3JhbmRlJnF1
b3Q7LCBWZXJkYW5hOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVv
dDtsdWNpZGEgR3JhbmRlJnF1b3Q7LCBWZXJkYW5hOyI+RGVzcGl0ZSB0aGlzIGVycm9yIGRv
IG5vdCBhZmZlY3Qgc3lzdGVtIG9wZXJhdGlvbiBieSBmYXIsIGl0IHN0aWxsIGFmZmVjdCB0
aGUgY29kZSdzIHF1YWxpdHksIGFzIHN1Y2ggZXJyb3IgY291bGQgcmVzdWx0IGluIHBvdGVu
dGlhbCBidWdzIGluIHRoZSBmdXR1cmUuPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
ICZxdW90O2x1Y2lkYSBHcmFuZGUmcXVvdDssIFZlcmRhbmE7Ij48YnI+PC9kaXY+PGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6ICZxdW90O2x1Y2lkYSBHcmFuZGUmcXVvdDssIFZlcmRhbmE7
Ij5CZXN0IHJlZ2FyZHMuPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6ICZxdW90O2x1
Y2lkYSBHcmFuZGUmcXVvdDssIFZlcmRhbmE7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6ICZxdW90O2x1Y2lkYSBHcmFuZGUmcXVvdDssIFZlcmRhbmE7Ij5GcmFua2xp
bjwvZGl2PjwvZGl2Pg==

------=_NextPart_60D74999_10706D40_7C0933BE--
1

