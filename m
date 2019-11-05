Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257BF05DE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 20:24:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS4O1-0003uB-3w; Tue, 05 Nov 2019 19:21:05 +0000
Resent-Date: Tue, 05 Nov 2019 19:21:05 +0000
Resent-Message-Id: <E1iS4O1-0003uB-3w@lists.xenproject.org>
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8lLB=Y5=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1iS4Nz-0003u6-3s
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 19:21:03 +0000
X-Inumbo-ID: 6698664e-0001-11ea-9631-bc764e2007e4
Received: from sender4-of-o58.zoho.com (unknown [136.143.188.58])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6698664e-0001-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 19:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1572981612; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UgAYfejr3fDVbo8L7rVv3ShvbjcrSeXpwTR6dXZm7OHpa4WAG4T6j7lavuPgVqSBMpARBeosIAMK/OEW4+rjJJmMyhj2e1xaXUGW9xeFkkHO2LLQd4hbiOfBP8948IxsrVdppq1/RXMpqX7hwgHFPBBkoJb92JGt5J6vI5k/W4s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1572981612;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=TKqHNauIz3QKxpJho757GRjU1wyQS+vDXhCWV2Kk3eE=; 
 b=GyG4nz3vWbbjEgOBZ6+ArmRAp+534/5aQolivw7aHofmnurtRusRbRiT8Sg+LrUoOI190q2jmQ9yDc1XFhfxqLycBOar1u5II3zbQFoAtxIzCFHDDoKYSeoRurP/glDzL5J7wuTgYK0v8PHAcu1QnIEzLNbMqP5w3JlzSg6hl2I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 157298161033387.53528998268598;
 Tue, 5 Nov 2019 11:20:10 -0800 (PST)
In-Reply-To: <20191105175010.2591-1-laurent@vivier.eu>
Message-ID: <157298160814.27285.16893877491189017648@37313f22b938>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Date: Tue, 5 Nov 2019 11:20:10 -0800 (PST)
X-ZohoMailClient: External
Subject: Re: [Xen-devel] [PULL v2 0/3] Trivial branch patches
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, ehabkost@redhat.com,
 paul@xen.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 claudio.fontana@huawei.com, qemu-devel@nongnu.org, chouteau@adacore.com,
 laurent@vivier.eu, xen-devel@lists.xenproject.org, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 anthony.perard@citrix.com, marcandre.lureau@redhat.com,
 david@gibson.dropbear.id.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTEwNTE3NTAxMC4yNTkx
LTEtbGF1cmVudEB2aXZpZXIuZXUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQVUxMIHYyIDAvM10gVHJpdmlhbCBicmFu
Y2ggcGF0Y2hlcwpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAxOTExMDUxNzUwMTAuMjU5MS0x
LWxhdXJlbnRAdml2aWVyLmV1Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNo
CmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRy
dWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo0OWE1NWY3IGdsb2JhbDogU3F1YXNoICd0
aGUgdGhlJwpjMGI1NTEzIGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEZpeCA4LWJpdCBhY2Nl
c3NlcwplYjQzMzk1IGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdoZW4g
d3JpdGluZyB0byBQblAgcmVnaXN0ZXJzCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzMgQ2hlY2tp
bmcgY29tbWl0IGViNDMzOTViZjhmMSAoaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogQXZvaWQg
Y3Jhc2ggd2hlbiB3cml0aW5nIHRvIFBuUCByZWdpc3RlcnMpCjIvMyBDaGVja2luZyBjb21taXQg
YzBiNTUxM2Y5NzFhIChody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBGaXggOC1iaXQgYWNjZXNz
ZXMpCjMvMyBDaGVja2luZyBjb21taXQgNDlhNTVmN2ZlYjE5IChnbG9iYWw6IFNxdWFzaCAndGhl
IHRoZScpCkVSUk9SOiBkbyBub3QgdXNlIEM5OSAvLyBjb21tZW50cwojMjY6IEZJTEU6IGRpc2Fz
L2xpYnZpeGwvdml4bC9pbnZhbHNldC5oOjEwNToKKyAgLy8gTm90ZSB0aGF0IHRoaXMgZG9lcyBu
b3QgbWVhbiB0aGUgYmFja2luZyBzdG9yYWdlIGlzIGVtcHR5OiBpdCBjYW4gc3RpbGwKCnRvdGFs
OiAxIGVycm9ycywgMCB3YXJuaW5ncywgNTYgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy8zIGhhcyBz
dHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJl
IGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNL
UEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBl
eGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDE5MTEwNTE3NTAxMC4yNTkxLTEtbGF1cmVudEB2aXZpZXIuZXUv
dGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
