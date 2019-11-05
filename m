Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B5F0478
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 18:55:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS30j-0004an-3S; Tue, 05 Nov 2019 17:52:57 +0000
Resent-Date: Tue, 05 Nov 2019 17:52:57 +0000
Resent-Message-Id: <E1iS30j-0004an-3S@lists.xenproject.org>
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8lLB=Y5=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1iS30h-0004ae-NB
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 17:52:55 +0000
X-Inumbo-ID: 170cafa6-fff5-11e9-adbe-bc764e2007e4
Received: from sender4-of-o58.zoho.com (unknown [136.143.188.58])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 170cafa6-fff5-11e9-adbe-bc764e2007e4;
 Tue, 05 Nov 2019 17:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1572976333; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W41LKsmhNK3Xgp4NAkMoYbigzyT4xnAW6PDiNaLDHoks/gUKlkFlXU3ouwTFRlfP8CSY3iQgC9l3e1XXLz1BNFIpNRzkYsrt0A1Ia5i3/nwkfeBw3wxoaekX+EU/ZjQ/k6qC/0Zc8/Eibqsvw2btKQCNdG8csARElgVxZaju1zA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1572976333;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5vdIBxF8T/xgMrXsQHlZ0gLCxvaKH/eFWvu3KUlj7nM=; 
 b=kTcuRDFtJXMo/UZHiV4AdwPPu+uT+CnhG0mXM/OyzwWdWdhNwqrfDZB2Aft30JMCMpYT3YVRHW7rVsFxiO/TPD29yYPZ2D1AEGQmrt5ghklwHNjmHH1xmwtSW9yWarw2K0JghYozGirYX8UcV5gKubHxySWLLJMdv32YyWrHO2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1572976332869468.6086744975937;
 Tue, 5 Nov 2019 09:52:12 -0800 (PST)
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
Message-ID: <157297633037.27285.18020124194406333059@37313f22b938>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Date: Tue, 5 Nov 2019 09:52:12 -0800 (PST)
X-ZohoMailClient: External
Subject: Re: [Xen-devel] [PULL 0/4] Trivial branch patches
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, berrange@redhat.com,
 ehabkost@redhat.com, paul@xen.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 claudio.fontana@huawei.com, qemu-devel@nongnu.org, chouteau@adacore.com,
 laurent@vivier.eu, marcandre.lureau@redhat.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 anthony.perard@citrix.com, pbonzini@redhat.com, david@gibson.dropbear.id.au,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTEwNTE0NDI0Ny4xMDMw
MS0xLWxhdXJlbnRAdml2aWVyLmV1LwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpTdWJqZWN0OiBbUFVMTCAwLzRdIFRyaXZpYWwgYnJhbmNoIHBhdGNoZXMKVHlw
ZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMTkxMTA1MTQ0MjQ3LjEwMzAxLTEtbGF1cmVudEB2aXZp
ZXIuZXUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJz
ZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhj
ZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJy
YW5jaCAndGVzdCcKMDEwMmM3OSBnbG9iYWw6IFNxdWFzaCAndGhlIHRoZScKOWM1ODNiMCBxb206
IEZpeCBlcnJvciBtZXNzYWdlIGluIG9iamVjdF9jbGFzc19wcm9wZXJ0eV9hZGQoKQoyOTllZWZk
IGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEZpeCA4LWJpdCBhY2Nlc3NlcwpjOTMxMjMxIGh3
L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdoZW4gd3JpdGluZyB0byBQblAg
cmVnaXN0ZXJzCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzQgQ2hlY2tpbmcgY29tbWl0IGM5MzEy
MzE4N2RmMiAoaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogQXZvaWQgY3Jhc2ggd2hlbiB3cml0
aW5nIHRvIFBuUCByZWdpc3RlcnMpCjIvNCBDaGVja2luZyBjb21taXQgMjk5ZWVmZDM3NTIyICho
dy9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBGaXggOC1iaXQgYWNjZXNzZXMpCjMvNCBDaGVja2lu
ZyBjb21taXQgOWM1ODNiMDRmZGIxIChxb206IEZpeCBlcnJvciBtZXNzYWdlIGluIG9iamVjdF9j
bGFzc19wcm9wZXJ0eV9hZGQoKSkKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzMx
OiBGSUxFOiBxb20vb2JqZWN0LmM6MTEwOToKKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiYXR0
ZW1wdCB0byBhZGQgZHVwbGljYXRlIHByb3BlcnR5ICclcycgdG8gb2JqZWN0ICh0eXBlICclcycp
IiwKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM0MzogRklMRTogcW9tL29iamVj
dC5jOjExNDE6CisgICAgICAgIGVycm9yX3NldGcoZXJycCwgImF0dGVtcHQgdG8gYWRkIGR1cGxp
Y2F0ZSBwcm9wZXJ0eSAnJXMnIHRvIGNsYXNzICh0eXBlICclcycpIiwKCnRvdGFsOiAwIGVycm9y
cywgMiB3YXJuaW5ncywgMjIgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy80IGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCjQvNCBDaGVja2luZyBjb21taXQgMDEwMmM3OWEzMDY4IChnbG9iYWw6IFNx
dWFzaCAndGhlIHRoZScpCkVSUk9SOiBkbyBub3QgdXNlIEM5OSAvLyBjb21tZW50cwojMjY6IEZJ
TEU6IGRpc2FzL2xpYnZpeGwvdml4bC9pbnZhbHNldC5oOjEwNToKKyAgLy8gTm90ZSB0aGF0IHRo
aXMgZG9lcyBub3QgbWVhbiB0aGUgYmFja2luZyBzdG9yYWdlIGlzIGVtcHR5OiBpdCBjYW4gc3Rp
bGwKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgNTYgbGluZXMgY2hlY2tlZAoKUGF0Y2gg
NC80IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBl
cnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwg
c2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3Qg
Y29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MTEwNTE0NDI0Ny4xMDMwMS0xLWxhdXJlbnRA
dml2aWVyLmV1L3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
