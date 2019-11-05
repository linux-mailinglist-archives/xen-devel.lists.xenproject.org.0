Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A4F01EA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 16:52:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS14T-0000ry-Ll; Tue, 05 Nov 2019 15:48:41 +0000
Resent-Date: Tue, 05 Nov 2019 15:48:41 +0000
Resent-Message-Id: <E1iS14T-0000ry-Ll@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8lLB=Y5=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1iS14S-0000rR-ET
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:48:40 +0000
X-Inumbo-ID: bb2d8b6c-ffe3-11e9-a19b-12813bfff9fa
Received: from sender4-of-o58.zoho.com (unknown [136.143.188.58])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb2d8b6c-ffe3-11e9-a19b-12813bfff9fa;
 Tue, 05 Nov 2019 15:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1572968881; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eJ9z/nzx+qocDS1/hVg1RjdT5pPQayO8jfNG0wmC0ThRJYZ7P72l3JmRBJ1ZdZEHRmriiF84ijsvhPyPjJqnu3FDI416GgEuFIKs0IDYz24GDw8aTtxTuKshFaDquFNU1EY4xtdvFzHfJdbXIyrXMnwDaXm8gdlau9C+bf8tGgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1572968881;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Q4x+f/wmgD9+wgoUiUJ4DR7Cp7vYJwT7GTGmcDOH6zY=; 
 b=cQ0WAsCaFuOLBq8PNph0CEhyWq4TQi/q8CyUycWlbtuyZ3ie/cUDPvvSsVAto/LHkZ2kc5yN3MswAqA/Luu6uvrSvyC93CFjwGCyfC2jPPfOxJ7zfcY6dkIsIzMCOe2qGWFdkbjOlgc/RQJcf+IGU5XjcLKY2QEmblWT9Cae0PU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1572968880683579.3517686475908;
 Tue, 5 Nov 2019 07:48:00 -0800 (PST)
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
Message-ID: <157296887817.27285.13935693519835086344@37313f22b938>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Date: Tue, 5 Nov 2019 07:48:00 -0800 (PST)
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
IC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpTd2l0Y2hlZCB0byBh
IG5ldyBicmFuY2ggJ3Rlc3QnCjg1YWM0NTMgZ2xvYmFsOiBTcXVhc2ggJ3RoZSB0aGUnCjlkZDdk
YTQgcW9tOiBGaXggZXJyb3IgbWVzc2FnZSBpbiBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKCkK
MmI3NmI0NSBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBGaXggOC1iaXQgYWNjZXNzZXMKYmRk
Y2ZkOSBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBBdm9pZCBjcmFzaCB3aGVuIHdyaXRpbmcg
dG8gUG5QIHJlZ2lzdGVycwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS80IENoZWNraW5nIGNvbW1p
dCBiZGRjZmQ5YjZiMjQgKGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdo
ZW4gd3JpdGluZyB0byBQblAgcmVnaXN0ZXJzKQoyLzQgQ2hlY2tpbmcgY29tbWl0IDJiNzZiNDUx
ZjliNyAoaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogRml4IDgtYml0IGFjY2Vzc2VzKQozLzQg
Q2hlY2tpbmcgY29tbWl0IDlkZDdkYTQyMWJmYiAocW9tOiBGaXggZXJyb3IgbWVzc2FnZSBpbiBv
YmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKCkpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0
ZXJzCiMzMTogRklMRTogcW9tL29iamVjdC5jOjExMDk6CisgICAgICAgIGVycm9yX3NldGcoZXJy
cCwgImF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBwcm9wZXJ0eSAnJXMnIHRvIG9iamVjdCAodHlw
ZSAnJXMnKSIsCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNDM6IEZJTEU6IHFv
bS9vYmplY3QuYzoxMTQxOgorICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJhdHRlbXB0IHRvIGFk
ZCBkdXBsaWNhdGUgcHJvcGVydHkgJyVzJyB0byBjbGFzcyAodHlwZSAnJXMnKSIsCgp0b3RhbDog
MCBlcnJvcnMsIDIgd2FybmluZ3MsIDIyIGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvNCBoYXMgc3R5
bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBm
YWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BB
VENIIGluIE1BSU5UQUlORVJTLgo0LzQgQ2hlY2tpbmcgY29tbWl0IDg1YWM0NTNkMTUyMCAoZ2xv
YmFsOiBTcXVhc2ggJ3RoZSB0aGUnKQpFUlJPUjogZG8gbm90IHVzZSBDOTkgLy8gY29tbWVudHMK
IzI2OiBGSUxFOiBkaXNhcy9saWJ2aXhsL3ZpeGwvaW52YWxzZXQuaDoxMDU6CisgIC8vIE5vdGUg
dGhhdCB0aGlzIGRvZXMgbm90IG1lYW4gdGhlIGJhY2tpbmcgc3RvcmFnZSBpcyBlbXB0eTogaXQg
Y2FuIHN0aWxsCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDU2IGxpbmVzIGNoZWNrZWQK
ClBhdGNoIDQvNCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2Yg
dGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09
CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTExMDUxNDQyNDcuMTAzMDEtMS1s
YXVyZW50QHZpdmllci5ldS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVt
YWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5v
cmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
