Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2711136E2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 22:06:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icbnm-00073w-9o; Wed, 04 Dec 2019 21:03:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=501J=Z2=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1icbnl-00073r-As
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 21:03:13 +0000
X-Inumbo-ID: 7b4076ba-16d9-11ea-9c09-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b4076ba-16d9-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 21:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IYGdzUrACpcWWN+qfJgyaQN3QicQDIkAeN0lAmCqlt4=; b=EfofZqao3vKgcxCXkCiNpfbVrU
 04By/OLd7BtTIVrmH55g7byEGUfvgx0GbTnrTUo93ISxnYQy5oQyAfCb/ofUCoeQ89wui1Ev1FSPm
 eakFmBws06eepWtYHqUHTwAwD4PCOQD+q0Ho6nPLIJcb62YpCxXnTozQaDOr/s7ksYgQ=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:58032
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1icboi-0000wR-Us; Wed, 04 Dec 2019 22:04:12 +0100
To: Jan Beulich <jbeulich@suse.com>
References: <ce5bd41b-90ed-fcf3-9e2d-a536ff1fcf90@eikelenboom.it>
 <59ac3962-a947-337b-b758-7ecfb69561ca@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <08b761ad-c84b-3dad-2dd1-f9b69b0fe2a7@eikelenboom.it>
Date: Wed, 4 Dec 2019 22:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <59ac3962-a947-337b-b758-7ecfb69561ca@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] xen-unstable (4.14 to be): Assertion
 '!preempt_count()' failed at preempt.c:36
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTIvMjAxOSAxODozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMTIuMjAxOSAx
ODoyMSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBPbiBjdXJyZW50IHhlbi11bnN0YWJs
ZSAoNC4xNCB0byBiZSkgYW5kIEFNRCBjcHU6Cj4+Cj4+IEFmdGVyIHJlYm9vdGluZyB0aGUgaG9z
dCwgd2hpbGUgdGhlIGd1ZXN0cyBhcmUgc3RhcnRpbmcsIEkgaGl0IHRoZSBhc3NlcnRpb24gYmVs
b3cuCj4+IHhlbi1zdGFnaW5nLTQuMTMgc2VlbXMgZmluZSBvbiB0aGUgc2FtZSBtYWNoaW5lLgo+
IAo+IE5vdGhpbmcgYmV0d2VlbiA0LjEzIFJDNCBhbmQgdGhlIHRpcCBvZiBzdGFnaW5nIHN0YW5k
cyBvdXQsCj4gc28gSSB3b25kZXIgaWYgeW91IGNvdWxkIGJpc2VjdCBvdmVyIHRoaXMgcmFuZ2U/
IE9yIHBlcmhhcHMKPiBzb21lb25lIGVsc2Ugc2VlcyBzb21ldGhpbmcgSSBkb24ndCBzZWUgKHJp
Z2h0IG5vdykuCj4gCj4gSmFuCgpCaXNlY3Rpb24gY2FtZSB1cCB3aXRoOgoKY29tbWl0IGNkN2Rl
ZGFkODIwOTc1M2UwZmM4YTk3ZTYxZDA0Yjc0OTEyYjUzZGMKQXV0aG9yOiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpEYXRlOiAgIEZyaSBOb3YgMTUgMTg6NTk6MzAgMjAx
OSArMDAwMAoKICAgIHBhc3N0aHJvdWdoOiBzaW1wbGlmeSBsb2NraW5nIGFuZCBsb2dnaW5nCiAg
ICAKICAgIERyb3BwaW5nIHRoZSBwY2lkZXZzIGxvY2sgYmV0d2VlbiBjYWxsaW5nIGRldmljZV9h
c3NpZ25lZCgpIGFuZAogICAgYXNzaWduX2RldmljZSgpIG1lYW5zIHRoYXQgdGhlIGxhdHRlciBo
YXMgdG8gZG8gdGhlIHNhbWUgY2hlY2sgYXMgdGhlCiAgICBmb3JtZXIgZm9yIG5vIG9idmlvdXMg
Z2Fpbi4gQWxzbywgc2luY2UgbG9uZyBydW5uaW5nIG9wZXJhdGlvbnMgdW5kZXIKICAgIHBjaWRl
dnMgbG9jayBhbHJlYWR5IGRyb3AgdGhlIGxvY2sgYW5kIHJldHVybiAtRVJFU1RBUlQgcGVyaW9k
aWNhbGx5IHRoZXJlCiAgICBpcyBsaXR0bGUgcG9pbnQgaW4gaW1tZWRpYXRlbHkgZmFpbGluZyBh
biBhc3NpZ25tZW50IG9wZXJhdGlvbiB3aXRoCiAgICAtRVJFU1RBUlQganVzdCBiZWNhdXNlIHRo
ZSBwY2lkZXZzIGxvY2sgY291bGQgbm90IGJlIGFjcXVpcmVkIChmb3IgdGhlCiAgICBzZWNvbmQg
dGltZSwgaGF2aW5nIGFscmVhZHkgYmxvY2tlZCBvbiBhY3F1aXJpbmcgdGhlIGxvY2sgaW4KICAg
IGRldmljZV9hc3NpZ25lZCgpKS4KICAgIAogICAgVGhpcyBwYXRjaCBpbnN0ZWFkIGFjcXVpcmVz
IHRoZSBsb2NrIG9uY2UgZm9yIGFzc2lnbm1lbnQgKG9yIHRlc3QgYXNzaWduKQogICAgb3BlcmF0
aW9ucyBkaXJlY3RseSBpbiBpb21tdV9kb19wY2lfZG9tY3RsKCkgYW5kIHRodXMgY2FuIHJlbW92
ZSB0aGUKICAgIGR1cGxpY2F0ZSBkb21haW4gb3duZXJzaGlwIGNoZWNrIGluIGFzc2lnbl9kZXZp
Y2UoKS4gV2hpbHN0IGluIHRoZQogICAgbmVpZ2hib3VyaG9vZCwgdGhlIHBhdGNoIGFsc28gcmVt
b3ZlcyBzb21lIGRlYnVnIGxvZ2dpbmcgZnJvbQogICAgYXNzaWduX2RldmljZSgpIGFuZCBkZWFz
c2lnbl9kZXZpY2UoKSBhbmQgcmVwbGFjZXMgaXQgd2l0aCBwcm9wZXIgZXJyb3IKICAgIGxvZ2dp
bmcsIHdoaWNoIGFsbG93cyBlcnJvciBsb2dnaW5nIGluIGlvbW11X2RvX3BjaV9kb21jdGwoKSB0
byBiZQogICAgcmVtb3ZlZC4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmlu
IDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgogICAgQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
