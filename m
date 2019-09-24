Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE70CBC9BE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:06:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClPq-0004fF-NZ; Tue, 24 Sep 2019 14:03:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iClPo-0004eu-VY
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:03:40 +0000
X-Inumbo-ID: 19d4d8cc-ded4-11e9-bf31-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::12])
 by localhost (Halon) with ESMTPS
 id 19d4d8cc-ded4-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569333815;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rblfzOkk+yS9331fp62yPy7O19azJKWvQC1HbXCfYFE=;
 b=rvdS5XIMfmv6dk19yP9SOTw4KLH96gYsc1tj1RwLYQID7sDkt2pOOG7Zwzwcd+dSeE
 pUWyd5WtwwuDxlNnHSP5e0gXssKdx9GgZKgTRQkWY34MD33HXry/DvyrzFnQrUZ6GIrr
 3+VY5vVy6x7Cd8TABSX+/WLBZkMNILkhF7PMLyFecno3eMVti8/x3aKowK1Hf9dgZGqY
 pfOaOj5+nnbEGXn7ScBeKLyGM0hMppWWwzElC7o6fNUWArrWbuPAAluI7JnknZcJ82RJ
 8PoMhfwrWSstOFS6R8ntjoY1qaKePl2TuLdWbZanJpkDi3BUlK8p2ZQV4Y/DVsLX/w0P
 gqtg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+j/F"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OE3U1mk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 16:03:30 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 16:03:15 +0200
Message-Id: <20190924140319.11303-5-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190924140319.11303-1-olaf@aepfle.de>
References: <20190924140319.11303-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RESEND v1 4/8] Remove
 tools/examples/README.incompatibilities
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
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHJlZmVyZW5jZWQgdmVyc2lvbnMgY2FuIG5vdCBydW4gc3RhZ2luZyBhbnltb3JlIHNpbmNl
IGEgd2hpbGUuCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Ci0t
LQogdG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgIDEgLQogdG9vbHMv
ZXhhbXBsZXMvUkVBRE1FLmluY29tcGF0aWJpbGl0aWVzIHwgMzggLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM5IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL2V4YW1wbGVzL1JFQURNRS5pbmNvbXBhdGliaWxpdGllcwoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2V4YW1wbGVzL01ha2VmaWxlIGIvdG9vbHMvZXhhbXBsZXMvTWFrZWZp
bGUKaW5kZXggZjg2ZWQzYTI3MS4uMmE2YzU0NDRkNCAxMDA2NDQKLS0tIGEvdG9vbHMvZXhhbXBs
ZXMvTWFrZWZpbGUKKysrIGIvdG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUKQEAgLTMsNyArMyw2IEBA
IGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvUnVsZXMubWsKIAogIyBYZW4gY29uZmlndXJhdGlv
biBkaXIgYW5kIGNvbmZpZ3MgdG8gZ28gdGhlcmUuCiBYRU5fUkVBRE1FUyA9IFJFQURNRQotWEVO
X1JFQURNRVMgKz0gUkVBRE1FLmluY29tcGF0aWJpbGl0aWVzCiAKIFhFTl9DT05GSUdTICs9IHhs
ZXhhbXBsZS5odm0KIFhFTl9DT05GSUdTICs9IHhsZXhhbXBsZS5wdmxpbnV4CmRpZmYgLS1naXQg
YS90b29scy9leGFtcGxlcy9SRUFETUUuaW5jb21wYXRpYmlsaXRpZXMgYi90b29scy9leGFtcGxl
cy9SRUFETUUuaW5jb21wYXRpYmlsaXRpZXMKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IGJiMDY3YmQ0MTkuLjAwMDAwMDAwMDAKLS0tIGEvdG9vbHMvZXhhbXBsZXMvUkVBRE1FLmluY29t
cGF0aWJpbGl0aWVzCisrKyAvZGV2L251bGwKQEAgLTEsMzggKzAsMCBAQAotQ29tbWFuZCBJbmNv
bXBhdGliaWxpdGllcwotPT09PT09PT09PT09PT09PT09PT09PT09PQotCi1Lbm93biBpbmNvbXBh
dGliaWxpdGllcyB3aXRoIHZhcmlvdXMgY29tbWFuZHMgb24gdmFyaW91cyBkaXN0cmlidXRpb25z
LCBhbmQKLXRoZSB3b3JrYXJvdW5kcyB3ZSB1c2UuCi0KLQotYnJjdGwKLS0tLS0tCi0KLWJyY3Rs
IHNob3cgPGJyaWRnZT4gZmFpbHMgb24gU0xFUzkgU1AyLiAgV29ya2Fyb3VuZCBpcyB0byB1c2Ug
YnJjdGwgc2hvdwotd2l0aG91dCBhcmd1bWVudHMsIGFuZCBncmVwLCB0aG91Z2ggdGhpcyB3b3Vs
ZCBiZSBkaWZmaWN1bHQgd2VyZSB5b3UgdG8gbmVlZAotdG8gY2hlY2sgZm9yIGEgc3BlY2lmaWMg
YnJpZGdlLWludGVyZmFjZSBwYWlyLCBzaW5jZSBicmN0bCBkb2VzIG5vdCBzaG93IHRoZSAKLWJy
aWRnZSBuYW1lIG9uIGV2ZXJ5IGxpbmUuCi0KLQotaWZ1cCAvIGlmZG93bgotLS0tLS0tLS0tLS0t
LQotCi1TdVNFIHJlcXVpcmVzIGFuIGV4dHJhIHBhcmFtZXRlciB0byBpZnVwLCB3aGljaCBpcyBj
cmVhdGVkIGJ5IGNhbGxpbmcgZ2V0Y2ZnCi1hcHByb3ByaWF0ZWx5LiAgU2VlIHhlbi1uZXR3b3Jr
LWNvbW1vbi5zaCBmb3IgZGV0YWlscy4KLQotR2VudG9vIGRvZXNuJ3QgaGF2ZSBpZnVwL2lmZG93
bjsgYXBwcm9wcmlhdGUgYWx0ZXJuYXRpdmVzIGFyZSBkZWZpbmVkIGluCi14ZW4tbmV0d29yay1j
b21tb24uc2guCi0KLQotaXAKLS0tCi0KLU5ld2VyIGlwIGNvbW1hbmRzIChmcm9tIGlwcm91dGUy
KSBkbyBub3QgYWNjZXB0IHRoZSBhYmJyZXZpYXRlZCBzeW50YXggImlwIHIgYQotLi4uIiBldGMu
ICAiaXAgcm91dGUgYWRkIC4uLiIgbXVzdCBiZSB1c2VkIGluc3RlYWQuCi0KLQotc2VkCi0tLS0K
LQotXHMgaXMgbm90IHN1cHBvcnRlZCBpbiByZWdleHBzIG9uIERlYmlhbiBldGNoIChzZWQgNC4x
LjIpLCBVYnVudHUgNC4xMC4gIFdlCi1oYW5kLWNyYWZ0IGNoYXJhY3RlciBjbGFzc2VzIGluc3Rl
YWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
