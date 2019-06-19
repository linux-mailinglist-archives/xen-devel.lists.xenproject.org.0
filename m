Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92AA4B802
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 14:19:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZWo-0001uG-Gv; Wed, 19 Jun 2019 12:17:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9okD=US=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hdZWn-0001u7-6b
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 12:17:25 +0000
X-Inumbo-ID: 31146749-928c-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::2])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 31146749-928c-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560946642;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=rblfzOkk+yS9331fp62yPy7O19azJKWvQC1HbXCfYFE=;
 b=rXd3cOOBUl3yiONBK6p+/6/ivMOHCB3whlYzbpbv1K/9q6fiQ9ukahU8k3YqbuvC22
 XhqBf+XeirvQ0x8nPGpTzZjnoTus+KgYkGpnfg3pYq78COYgDrRWy34WqeFo8SZpt1eO
 zO4PVpCLcAvFQuGm/gS+ydSgdB+h64u1mrXt4wD5geBH1OfJHPLtfuWDnsYxIyhu98Kp
 bdfdnQM0mDRBMqcBs8bGQ+f7A118eYkdpI8FLuza48pvzolntc8nVriafygYOi23mfOO
 pHo6cQa1zQg7YVGHHhCsPvBcYwQ5u0OvHsJBxqHPgg6WK5qBuu9TJCCbwQkwsq/oDFse
 +Gaw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id 60b3d8v5JCHH4iF
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 19 Jun 2019 14:17:17 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Jun 2019 14:17:15 +0200
Message-Id: <20190619121715.28532-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] Remove
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
