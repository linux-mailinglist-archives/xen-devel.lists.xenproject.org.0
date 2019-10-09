Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54808D065F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 06:18:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI3NU-0002wr-2e; Wed, 09 Oct 2019 04:15:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g1i0=YC=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iI3NS-0002w3-CB
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 04:15:06 +0000
X-Inumbo-ID: 5d4c13fe-ea4b-11e9-97e1-12813bfff9fa
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d4c13fe-ea4b-11e9-97e1-12813bfff9fa;
 Wed, 09 Oct 2019 04:15:03 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id A8F0A2000A2
 for <xen-devel@lists.xenproject.org>; Wed,  9 Oct 2019 15:14:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1570594499; bh=7qoAXTd8GPOn2BiQfYh+sHElos4VaXVEA8NRDQqYjCo=;
 h=Date:From:Subject:To;
 b=bE1urmfv1GUejnxKxHcUP/f4V2DYuhEizafapTonDj1bCWw4N72LZgG86MLpgAnRk
 f1dE2+FWPL85mXIun6Gj9xgqr3MDAclCjg2vhmtmRdlnX2Q+sMQe6FMz+a3pBgzTMe
 Od+rqoj+TgJk1gd+jZc1dafHeQVVeI3JEbyVfiGo=
Date: Wed, 09 Oct 2019 15:14:56 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-Id: <1570594496.2508.0@crc.id.au>
X-Mailer: geary/3.34.0
MIME-Version: 1.0
Subject: [Xen-devel] /sys/hypervisor entries for Xen (Domain-0, PV,
 PVH and HVM)
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKSSdtIHdvcmtpbmcgb24gZml4aW5nIHVwIHRoZSBncnViIHBhY2thZ2VzIGZvciBG
ZWRvcmEgaW4gZGVkdWNpbmcgdGhlIApuZXcgQkxTIGxvZ2ljIGluIEZlZG9yYSBhbmQgZGlzYWJs
aW5nIGl0IGluIG5vbi1jb21wYXRpYmxlIGVudmlyb25tZW50cy4KCkJaIFJlcG9ydDoKaHR0cHM6
Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNzAzNzAwCgpDdXJyZW50bHks
IGl0IHNlZW1zIHRoYXQgd2UgY2FuIGRlZHVjZSB0aGUgZm9sbG93aW5nIHR3byBzY2VuYXJpb3M6
CgppbiAvc3lzL2h5cGVydmlzb3I6CgoxKSB0eXBlID09IHhlbiAmJiB1dWlkID09IGFsbCB6ZXJv
cywgdGhlbiB0aGlzIGlzIEJMUyBzYWZlICh0aGUgCkRvbWFpbi0wKS4KMikgdHlwZSA9PSB4ZW4g
JiYgdXVpZCAhPSBhbGwgemVyb3MsIHRoZW4gdGhpcyBpcyBCTFMgKnVuc2FmZSogKGNvdmVycyAK
UFYsIEhWTSBhbmQgUFZIIGd1ZXN0cykuCgpJcyB0aGVyZSBhbnkgb3RoZXIgdmFyaWFibGVzIHRo
YXQgY29tZSBpbnRvIGVmZmVjdCB0aGF0IGNvdWxkIGNhdXNlIGEgCnZhcmlhdGlvbiBpbiB0aGUg
YWJvdmUgY2hlY2tzIGFzIHRvIGVuYWJsZSBvciBkaXNhYmxlIEJMUz8KClJpZ2h0IG5vdywgSSdt
IHByb3Bvc2luZyB0aGF0IHdlIHRyeSB0byBkaXNhYmxlIHRoZSBuZXcgQkxTIGJlaGF2aW91ciAK
aW4gRmVkb3JhIGZvciBQViwgSFZNIGFuZCBQVkggZ3Vlc3RzIC0gYXMgcHlncnViIGlzIG5vdCB1
cCB0byB0aGUgdGFzayAKb2YgYm9vdGluZyB0aGVtLiBXZSBpbmNsdWRlZCBIVk0gYXMgaXQgbWF5
IGJlIGNvbW1vbiBmb3IgdXNlcnMgdG8gCnN3aXRjaCBiZXR3ZWVuIEhWTSBhbmQgUFZIIGNvbmZp
Z3VyYXRpb25zIGZvciB0aGUgc2FtZSBpbnN0YWxsZWQgVk0uCgpBbnkgY29tbWVudHMgZWl0aGVy
IGhlcmUgb3IgdmlhIHRoZSBCWiByZXBvcnQgYWJvdmUgd291bGQgYmUgd2VsY29tZS4KClN0ZXZl
biBIYWlnaAoK8J+TpyBuZXR3aXpAY3JjLmlkLmF1ICAgICDwn5K7IGh0dHBzOi8vd3d3LmNyYy5p
ZC5hdQrwn5OeICs2MTMgOTAwMSA2MDkwICAgICAgIPCfk7EgKzYxNCAxMjkzIDU4OTcKCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
