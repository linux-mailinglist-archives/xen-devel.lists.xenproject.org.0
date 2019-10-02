Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64F8C8F6A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi4g-0006Zi-64; Wed, 02 Oct 2019 17:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0qpV=X3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iFi4d-0006ZG-V3
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:05:59 +0000
X-Inumbo-ID: e49d4d1a-e536-11e9-bf31-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::10])
 by localhost (Halon) with ESMTPS
 id e49d4d1a-e536-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570035953;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rblfzOkk+yS9331fp62yPy7O19azJKWvQC1HbXCfYFE=;
 b=iGipLbtybMszQ69qRba7Hst1vFO4YgaaR3YHK0dquLq5a6VewkLE+f/o8hzr9TAsjc
 F+aIF0QCLc/S4xKUSt++Gd5YJ32BM7F1IRmjxXKQgWK1UXOOvMOuH2aZQhBBcEqqLD9p
 JrewjpnMmk5UX3/vbd7AVoEEYo236YXVPKpcDm8aw1y9uyKz9y28+4sWOPTtbSjJLPRP
 zwZcDbddhU5WXJR6Zp2fti9PKsVPb0fHSF0hPZZwP5fqltU8X1yXR4RnULcZe7wvNRN0
 zQTOaw/UTctDS7s+VLI9KAJYzojKLz5JxVuzF4AG9eaug+92OdzXS/XTrlEnNiRPaddz
 JWHA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2Gkg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v92H5mUVf
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Oct 2019 19:05:48 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:05:39 +0200
Message-Id: <20191002170543.26571-5-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002170543.26571-1-olaf@aepfle.de>
References: <20191002170543.26571-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/8] Remove
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
