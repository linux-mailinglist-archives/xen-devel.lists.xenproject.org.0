Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A736111AB7C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 14:03:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if1bZ-0004oR-2X; Wed, 11 Dec 2019 13:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjTl=2B=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1if1bX-0004oM-6R
 for xen-devel@lists.xen.org; Wed, 11 Dec 2019 13:00:35 +0000
X-Inumbo-ID: 36f585d0-1c16-11ea-8b2e-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36f585d0-1c16-11ea-8b2e-12813bfff9fa;
 Wed, 11 Dec 2019 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lsST375t5rd3Gdi8J1kv3kM0Knl5MZwYd2EehSwQ/EU=; b=eG/oAzE+nGlKR6/Ibc0p/BtOrv
 Tl2ZYkiNvd1Gkllu2kMPc3gCp3Ip/LPxNFobF6qFPCt1JXphQ4h2fsMtKL2iRtdD1anGRIv9pA3fK
 1nMaF100WSUrpCVrNX5GpL1V88EXg06ZYr7HuftovPo8fm7cSa8hg1vgM651nc1E/yWQ=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:60253
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>) id 1if1cX-00039n-Rf
 for xen-devel@lists.xen.org; Wed, 11 Dec 2019 14:01:37 +0100
To: xen-devel@lists.xen.org
References: <E1if0o0-0001cS-Uo@xenbits.xenproject.org>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <595d8ddd-2f1c-1e99-805c-a05062686a27@eikelenboom.it>
Date: Wed, 11 Dec 2019 14:01:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <E1if0o0-0001cS-Uo@xenbits.xenproject.org>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen Security Advisory 311 v4 (CVE-2019-19577) -
 Bugs in dynamic height handling for AMD IOMMU pagetables
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTIvMjAxOSAxMzowOSwgWGVuLm9yZyBzZWN1cml0eSB0ZWFtIHdyb3RlOgo+IC0tLS0t
QkVHSU4gUEdQIFNJR05FRCBNRVNTQUdFLS0tLS0KPiBIYXNoOiBTSEEyNTYKPiAKPiAgICAgICAg
ICAgICBYZW4gU2VjdXJpdHkgQWR2aXNvcnkgQ1ZFLTIwMTktMTk1NzcgLyBYU0EtMzExCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZlcnNpb24gNAo+IAo+ICAgICAgICAgIEJ1Z3Mg
aW4gZHluYW1pYyBoZWlnaHQgaGFuZGxpbmcgZm9yIEFNRCBJT01NVSBwYWdldGFibGVzCj4gCi4u
Li4KPiAKPiBDUkVESVRTCj4gPT09PT09PQo+IAo+IFRoaXMgaXNzdWUgd2FzIGRpc2NvdmVyZWQg
YnkgU2FuZGVyIEVpa2VsZW5ib29tLCBhbG9uZyB3aXRoIEFuZHJldyBDb29wZXIgb2YKPiBDaXRy
aXguCgpBaGggdGhpcyB3YXMgd2h5IEphbidzIHR3byBwYXRjaGVzIHdlcmUgc2tpcHBlZCwgSSB3
YXMgYWJvdXQgdG8gaW5xdWlyZQppZiBpdCB3b3VsZCBiZSBwaWNrZWQgdXAgaW4gdGhlIGZ1dHVy
ZSBpbiBzb21lIGZvcm0uCgotLQpTYW5kZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
