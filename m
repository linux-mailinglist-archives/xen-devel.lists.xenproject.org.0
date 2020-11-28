Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6E2C6FAB
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 15:43:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40015.73074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj1RA-0002nK-Df; Sat, 28 Nov 2020 14:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40015.73074; Sat, 28 Nov 2020 14:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj1RA-0002mx-A1; Sat, 28 Nov 2020 14:42:56 +0000
Received: by outflank-mailman (input) for mailman id 40015;
 Sat, 28 Nov 2020 14:31:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IEe=FC=qq.com=2284696125@srs-us1.protection.inumbo.net>)
 id 1kj1Fa-0001qO-Ks
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 14:31:00 +0000
Received: from smtpbgbr2.qq.com (unknown [54.207.22.56])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98182dfd-d9e6-4ca0-bb5d-93b90eb7c944;
 Sat, 28 Nov 2020 14:30:49 +0000 (UTC)
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sat, 28 Nov 2020 22:30:41 +0800 (CST)
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
X-Inumbo-ID: 98182dfd-d9e6-4ca0-bb5d-93b90eb7c944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1606573841; bh=qV7hSTO5UjvdF5UXVXyKerelOoLU8KuiH1AUUWWvTt4=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=mgN4r4bGJ3SCLMC0SPuyf0f20uyoRuzVlEMSEBJvEOeztOaCaO0ZlV6oFp01R72Lr
	 x1biOf8s3xkKQVIk0g+1Teb7+Sp5U+RZCLJ1EdCtQetebaeK41JhxeG+Sijdj3YteB
	 HTkH0j+0y+O9I8bsTtyEA0FxNUSyHo5bCQx3Stx0=
X-QQ-FEAT: DmHow04r9p0yw5mArx8i6v2IR0qP/57JF7+H5MeIdoDwb87PMS1Oe0fXZRRaY
	0eCr8sy6FZpR9toTIyMAW41maYaem4DuG6oz4g2wraNQLIMYoOaLBs/PKCI9J4eFOzLyeCW
	GiSUSUkr7fSay8b4Y4Bi+0GfZ25h5+JS6MbPii/llxfvSB9RIv9dfJd3yF273mOlePSJShB
	VXeQ0qruQ+3LZrg/t168ZnXRVDPh6bm4c71eP0tv1j/W83PDNq8hFDULUgFpbZwcX1hEMrN
	C5vg==
X-QQ-SSF: 0000000000000010000000000000008
X-QQ-XMAILINFO: NVuz4GJ0yei2+paVX28p33mneU6FNTZk/QcvJkWhww4eSW6Vzbg/y6V5/IQ5vQ
	 B9e4R+DIWMgpmRFC4YZCx2Q/8NDSqv6ede+9do1S35HF30x+B29WBc33LKt3fkqb0KDb3VbFXlt6W
	 CBXET/2Dj92AKLWk8Ljkeh/iHfTKc79rQ8CPtd2cH/GP1/MiYPIA0bxIV8xWegDyBHiZM+gLOX4At
	 /yLAmikExh1GESHDrybB868MTYbcuBBbgxA13ECKCcBlchEOto75QnQ0OExDkhbjt/nSoVoVwHt+e
	 AH+FKGXaNetuMune/jyhYyhkbqSV/1vYdzoYd4UarsUsz7H68+/7nN+w7p4AOt2LPw2znC6dqc0EV
	 /trXItgkpKJL0mmX5lnv4dtDA+zm94rHI/bEiuKeKF13qJclOOdQvQSR+/qxK0DGMZQvgfdOiYevM
	 wq+XGl+zBty5KSITvTcmTfgStuhTFWx+48fFGsxRPJLFLmPOkW1qaklJqI3U1ykcW12XevpEuX7mD
	 BshnDDL2MGr6jFbAzQKCwxIdoRnoFOEX08O9aXpdO5Ke/GjPMCPiR+al7UF1fakw31y37zhsXGuBQ
	 jUYh7MZR9BYqWoVGf0fS31aBCf97fdT/ecfCXPtFpkmQYbvuw7YnOc+KVLt5S7KvmMDQdhidpmMXy
	 t8KiriaA+Uix7ynNIeEDOPPs+TKCEXbIad00951FQgApXIbhqGSGXhL0mRjR/0wmYOgxEM
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 166.111.122.112
X-QQ-STYLE: 
X-QQ-mid: webmail801t1606573839t216799
From: "=?ISO-8859-1?B?UnJvYWNo?=" <2284696125@qq.com>
To: "=?ISO-8859-1?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Subject: Locate a memory leak in tools modules
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5FC25F0F_1018E510_401423E0"
Content-Transfer-Encoding: 8Bit
Date: Sat, 28 Nov 2020 22:30:39 +0800
X-Priority: 3
Message-ID: <tencent_38E67FAD4AE4912BC07DF5BB59F6267A1F09@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
X-QQ-Bgrelay: 1

This is a multi-part message in MIME format.

------=_NextPart_5FC25F0F_1018E510_401423E0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGksIEknbSBhdHRlbXB0aW5nIHRvIHVzZSBhZGRyZXNzIHNhbml0aXplciBpbiBsb2NhdGlu
ZyBidWdzIGluIFhlbiA0LTEzLCB3aGlsZSB1c2UgYWRkcmVzcyBzYW5pdGl6ZXIgaW4gdG9v
bHMgbW9kdWxlcywgd2hpbGUgSSByYW4gc29tZSBiYXNpYyBpbnN0cnVjdGlvbnMgbGlrZSB4
bCwgWGVuIHJlcG9ydCBzdWNoIGJ1ZzoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo9PTI4NjM9PUVSUk9SOiBM
ZWFrU2FuaXRpemVyOiBkZXRlY3RlZCBtZW1vcnkgbGVha3MNCg0KRGlyZWN0IGxlYWsgb2Yg
Mjk2IGJ5dGUocykgaW4gMTEgb2JqZWN0KHMpIGFsbG9jYXRlZCBmcm9tOg0KJm5ic3A7Jm5i
c3A7Jm5ic3A7ICMwIDB4N2Y1YjkxYWVmZDI4IGluIG1hbGxvYyAoL3Vzci9saWIveDg2XzY0
LWxpbnV4LWdudS9saWJhc2FuLnNvLjMrMHhjMWQyOCkNCiZuYnNwOyZuYnNwOyZuYnNwOyAj
MSAweDQ2Nzk5NyZuYnNwOyAoL3Vzci9iaW4veDg2XzY0LWxpbnV4LWdudS1nY2MtNisweDQ2
Nzk5NykNCg0KSW5kaXJlY3QgbGVhayBvZiAxMCBieXRlKHMpIGluIDEgb2JqZWN0KHMpIGFs
bG9jYXRlZCBmcm9tOg0KJm5ic3A7Jm5ic3A7Jm5ic3A7ICMwIDB4N2Y1YjkxYWVmZDI4IGlu
IG1hbGxvYyAoL3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9saWJhc2FuLnNvLjMrMHhjMWQy
OCkNCiZuYnNwOyZuYnNwOyZuYnNwOyAjMSAweDQ2Nzk5NyZuYnNwOyAoL3Vzci9iaW4veDg2
XzY0LWxpbnV4LWdudS1nY2MtNisweDQ2Nzk5NykNCg0KU1VNTUFSWTogQWRkcmVzc1Nhbml0
aXplcjogMzA2IGJ5dGUocykgbGVha2VkIGluIDEyIGFsbG9jYXRpb24ocykuDQovcm9vdC9m
YXVsdHhlbi90b29scy9saWJzL3Rvb2xjb3JlLy4uLy4uLy4uL3Rvb2xzL1J1bGVzLm1rOjIy
NDogcmVjaXBlIGZvciB0YXJnZXQgJ2hlYWRlcnMuY2hrJyBmYWlsZWQNCm1ha2VbNV06ICoq
KiBbaGVhZGVycy5jaGtdIEVycm9yIDENCg0KPT03NTIwPT1FUlJPUjogTGVha1Nhbml0aXpl
cjogZGV0ZWN0ZWQgbWVtb3J5IGxlYWtzDQoNCkRpcmVjdCBsZWFrIG9mIDEwIGJ5dGUocykg
aW4gMSBvYmplY3QocykgYWxsb2NhdGVkIGZyb206DQombmJzcDsmbmJzcDsmbmJzcDsgIzAg
MHg3ZmQxMDI4YzhkMjggaW4gbWFsbG9jICgvdXNyL2xpYi94ODZfNjQtbGludXgtZ251L2xp
YmFzYW4uc28uMysweGMxZDI4KQ0KJm5ic3A7Jm5ic3A7Jm5ic3A7ICMxIDB4N2ZkMTAyMmU0
M2I5IGluIF9fc3RyZHVwICgvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42KzB4ODAz
YjkpDQoNClNVTU1BUlk6IEFkZHJlc3NTYW5pdGl6ZXI6IDEwIGJ5dGUocykgbGVha2VkIGlu
IDEgYWxsb2NhdGlvbihzKS4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpJdCBzZWVtcyB0aGlzIGJ1ZyBpcyB2
ZXJ5IGxvdy1sZXZlbCwgYW5kIGFmZmVjdHMgbWFueSBiYXNpYyBvcGVyYXRpb25zLCBkbyB5
b3UgaGF2ZSBhbnkgaWRlYSB3aGF0IGNhdXNlIHN1Y2ggYnVncz8=

------=_NextPart_5FC25F0F_1018E510_401423E0
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5IaSwgSSdtIGF0dGVtcHRpbmcgdG8gdXNlIGFkZHJlc3Mg
c2FuaXRpemVyIGluIGxvY2F0aW5nIGJ1Z3MgaW4gWGVuIDQtMTMsIHdoaWxlIHVzZSBhZGRy
ZXNzIHNhbml0aXplciBpbiB0b29scyBtb2R1bGVzLCB3aGlsZSBJIHJhbiBzb21lIGJhc2lj
IGluc3RydWN0aW9ucyBsaWtlIHhsLCBYZW4gcmVwb3J0IHN1Y2ggYnVnOjwvZGl2PjxkaXY+
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT08YnI+PT0yODYzPT1FUlJPUjogTGVha1Nhbml0aXplcjogZGV0ZWN0ZWQg
bWVtb3J5IGxlYWtzPGJyPjxicj5EaXJlY3QgbGVhayBvZiAyOTYgYnl0ZShzKSBpbiAxMSBv
YmplY3QocykgYWxsb2NhdGVkIGZyb206PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyAjMCAweDdm
NWI5MWFlZmQyOCBpbiBtYWxsb2MgKC91c3IvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYXNh
bi5zby4zKzB4YzFkMjgpPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyAjMSAweDQ2Nzk5NyZuYnNw
OyAoL3Vzci9iaW4veDg2XzY0LWxpbnV4LWdudS1nY2MtNisweDQ2Nzk5Nyk8YnI+PGJyPklu
ZGlyZWN0IGxlYWsgb2YgMTAgYnl0ZShzKSBpbiAxIG9iamVjdChzKSBhbGxvY2F0ZWQgZnJv
bTo8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7ICMwIDB4N2Y1YjkxYWVmZDI4IGluIG1hbGxvYyAo
L3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9saWJhc2FuLnNvLjMrMHhjMWQyOCk8YnI+Jm5i
c3A7Jm5ic3A7Jm5ic3A7ICMxIDB4NDY3OTk3Jm5ic3A7ICgvdXNyL2Jpbi94ODZfNjQtbGlu
dXgtZ251LWdjYy02KzB4NDY3OTk3KTxicj48YnI+U1VNTUFSWTogQWRkcmVzc1Nhbml0aXpl
cjogMzA2IGJ5dGUocykgbGVha2VkIGluIDEyIGFsbG9jYXRpb24ocykuPGJyPi9yb290L2Zh
dWx0eGVuL3Rvb2xzL2xpYnMvdG9vbGNvcmUvLi4vLi4vLi4vdG9vbHMvUnVsZXMubWs6MjI0
OiByZWNpcGUgZm9yIHRhcmdldCAnaGVhZGVycy5jaGsnIGZhaWxlZDxicj5tYWtlWzVdOiAq
KiogW2hlYWRlcnMuY2hrXSBFcnJvciAxPGJyPjxicj49PTc1MjA9PUVSUk9SOiBMZWFrU2Fu
aXRpemVyOiBkZXRlY3RlZCBtZW1vcnkgbGVha3M8YnI+PGJyPkRpcmVjdCBsZWFrIG9mIDEw
IGJ5dGUocykgaW4gMSBvYmplY3QocykgYWxsb2NhdGVkIGZyb206PGJyPiZuYnNwOyZuYnNw
OyZuYnNwOyAjMCAweDdmZDEwMjhjOGQyOCBpbiBtYWxsb2MgKC91c3IvbGliL3g4Nl82NC1s
aW51eC1nbnUvbGliYXNhbi5zby4zKzB4YzFkMjgpPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyAj
MSAweDdmZDEwMjJlNDNiOSBpbiBfX3N0cmR1cCAoL2xpYi94ODZfNjQtbGludXgtZ251L2xp
YmMuc28uNisweDgwM2I5KTxicj48YnI+U1VNTUFSWTogQWRkcmVzc1Nhbml0aXplcjogMTAg
Ynl0ZShzKSBsZWFrZWQgaW4gMSBhbGxvY2F0aW9uKHMpLjxicj49PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTwvZGl2
PjxkaXY+SXQgc2VlbXMgdGhpcyBidWcgaXMgdmVyeSBsb3ctbGV2ZWwsIGFuZCBhZmZlY3Rz
IG1hbnkgYmFzaWMgb3BlcmF0aW9ucywgZG8geW91IGhhdmUgYW55IGlkZWEgd2hhdCBjYXVz
ZSBzdWNoIGJ1Z3M/IDxicj48L2Rpdj4=

------=_NextPart_5FC25F0F_1018E510_401423E0--




