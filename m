Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0BEC8F6D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:08:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi4k-0006d0-Hi; Wed, 02 Oct 2019 17:06:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0qpV=X3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iFi4i-0006cU-VW
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:06:04 +0000
X-Inumbo-ID: e4fcb53e-e536-11e9-bf31-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::8])
 by localhost (Halon) with ESMTPS
 id e4fcb53e-e536-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570035954;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=nBR3zEU94WYdOXy7CgVjOc61VyMwjlW5XPqLtnBVt5M=;
 b=irZafbaJmXlQvhDpK4ZEx07EAN4RpMzhplQg50lh6GjFHZFQe5GeOlhWLFp5zyDMCe
 srfHwEtB1hEq3Upd3OasTGUngSWVYY1dRNOov20QpbOE/odAR0ZTqKnPT29NSmdjocNj
 E7RTDxidpvpifUPbRi8lBkpJ66xr8fsLSBUQw7ZZw8RlRFsxdds/9eXXePMaI/IGjdZ+
 se1PCgPKKqo/YtRWAljtTSMi0IUrXwpbIGHQO/KuHotA+PmTf4ohVdqExIC20ku5KZ9w
 NsMYGlSlpKJHChbAyG7rE3dlF7idQvJHuohaA87iF9Atb1JQxQMAG0qL8UuQrjWSJBet
 W8KQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2Gkg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v92H5mUVg
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Oct 2019 19:05:48 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:05:40 +0200
Message-Id: <20191002170543.26571-6-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002170543.26571-1-olaf@aepfle.de>
References: <20191002170543.26571-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 5/8] tools: remove empty xl.conf
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

SW4gdGhlIG5lYXIgZnV0dXJlIGFsbCBmcmVzaCBpbnN0YWxsYXRpb25zIHdpbGwgaGF2ZSBhbiBl
bXB0eSAvZXRjLgpUaGUgY29udGVudCBvZiB0aGlzIGRpcmVjdG9yeSB3aWxsIG5vdCBiZSBjb250
cm9sbGVkIGJ5IHRoZSBwYWNrYWdlCm1hbmFnZXIgYW55bW9yZS4gT25lIG9mIHRoZSByZWFzb25z
IGZvciB0aGlzIG1vdmUgaXMgdG8gbWFrZSBzbmFwc2hvdHMKbW9yZSByb2J1c3QuCgpJbnN0YWxs
aW5nIGVtcHR5IGNvbmZpZ3VyYXRpb24gZmlsZXMgaXMgbm90IGhlbHBmdWwgZm9yIGFuIGVtcHR5
IC9ldGMKZGlyZWN0b3J5LiBUaGUgZXhwZWN0ZWQgdmFsdWVzIGFyZSBhbGwgZGVzY3JpYmVkIGlu
IHhsLmNvbmYoNSkuIFRoZXJlIGlzCm5vIG5lZWQgdG8gZHVwbGljYXRlIHRoaXMgaW5mbyBpbnRv
IGFub3RoZXIgZmlsZS4KCklmIHRoZSBsb2NhbCBhZG1pbiByZWFsbHkgbmVlZHMgdG8gdHdlYWsg
dGhlIGRlZmF1bHRzIGhlIHdpbGwgYmUgYWJsZSB0bwpjcmVhdGUgdGhpcyBmaWxlIHdpdGggdGhl
IGRlc2lyZWQgY29udGVudC4KClNpZ25lZC1vZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZs
ZS5kZT4KQWNrZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Ci0tLQog
dG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUgfCAgMSAtCiB0b29scy9leGFtcGxlcy9SRUFETUUgICB8
ICAxIC0KIHRvb2xzL2V4YW1wbGVzL3hsLmNvbmYgIHwgNDQgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNDYgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvZXhhbXBsZXMveGwuY29uZgoKZGlmZiAtLWdpdCBh
L3Rvb2xzL2V4YW1wbGVzL01ha2VmaWxlIGIvdG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUKaW5kZXgg
MmE2YzU0NDRkNC4uMTQ3ZWE1OTBlZiAxMDA2NDQKLS0tIGEvdG9vbHMvZXhhbXBsZXMvTWFrZWZp
bGUKKysrIGIvdG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUKQEAgLTYsNyArNiw2IEBAIFhFTl9SRUFE
TUVTID0gUkVBRE1FCiAKIFhFTl9DT05GSUdTICs9IHhsZXhhbXBsZS5odm0KIFhFTl9DT05GSUdT
ICs9IHhsZXhhbXBsZS5wdmxpbnV4Ci1YRU5fQ09ORklHUyArPSB4bC5jb25mCiBYRU5fQ09ORklH
UyArPSBjcHVwb29sCiAKIFhFTl9DT05GSUdTICs9ICQoWEVOX0NPTkZJR1MteSkKZGlmZiAtLWdp
dCBhL3Rvb2xzL2V4YW1wbGVzL1JFQURNRSBiL3Rvb2xzL2V4YW1wbGVzL1JFQURNRQppbmRleCBj
M2YyNGQ1OWZhLi40OGFjZTgyMTg5IDEwMDY0NAotLS0gYS90b29scy9leGFtcGxlcy9SRUFETUUK
KysrIGIvdG9vbHMvZXhhbXBsZXMvUkVBRE1FCkBAIC0yNiw3ICsyNiw2IEBAIHhlbi1ob3RwbHVn
LWNvbW1vbi5zaCAtIHNvdXJjZWQgYnkgdmlmLWNvbW1vbi5zaAogeGVuLW5ldHdvcmstY29tbW9u
LnNoIC0gc291cmNlZCBieSB2aWYtY29tbW9uLnNoCiB4ZW4tc2NyaXB0LWNvbW1vbi5zaCAgLSBz
b3VyY2VkIGJ5IHhlbi1ob3RwbHVnLWNvbW1vbi5zaAogb3hlbnN0b3JlZC5jb25mICAgICAtIGNv
bmZpZ3VyYXRpb24gZmlsZSBmb3Igb3hlbnN0b3JlZAoteGwuY29uZiAgICAgICAgICAgICAtIGNv
bmZpZ3VyYXRpb24gZmlsZSBmb3IgeGwKIHhsZXhhbXBsZS5odm0gICAgICAgLSBhIGNvbmZpZ3Vy
YXRpb24gc2NyaXB0IGZvciBjcmVhdGluZyBhIGh2bSBkb21haW4gd2l0aAogICAgICAgICAgICAg
ICAgICAgICAgICd4bCBjcmVhdGUnCiB4bGV4YW1wbGUucHZsaW51eCAgIC0gYSBjb25maWd1cmF0
aW9uIHNjcmlwdCBmb3IgY3JlYXRpbmcgYSBwdiBkb21haW4gd2l0aApkaWZmIC0tZ2l0IGEvdG9v
bHMvZXhhbXBsZXMveGwuY29uZiBiL3Rvb2xzL2V4YW1wbGVzL3hsLmNvbmYKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDA0NDZkZWIzMDQuLjAwMDAwMDAwMDAKLS0tIGEvdG9vbHMvZXhh
bXBsZXMveGwuY29uZgorKysgL2Rldi9udWxsCkBAIC0xLDQ0ICswLDAgQEAKLSMjIEdsb2JhbCBY
TCBjb25maWcgZmlsZSAjIwotCi0jIENvbnRyb2wgd2hldGhlciBkb20wIGlzIGJhbGxvb25lZCBk
b3duIHdoZW4geGVuIGRvZXNuJ3QgaGF2ZSBlbm91Z2gKLSMgZnJlZSBtZW1vcnkgdG8gY3JlYXRl
IGEgZG9tYWluLiAgImF1dG8iIG1lYW5zIG9ubHkgYmFsbG9vbiBpZiBkb20wCi0jIHN0YXJ0cyB3
aXRoIGFsbCB0aGUgaG9zdCdzIG1lbW9yeS4KLSNhdXRvYmFsbG9vbj0iYXV0byIKLQotIyBmdWxs
IHBhdGggb2YgdGhlIGxvY2tmaWxlIHVzZWQgYnkgeGwgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbgot
I2xvY2tmaWxlPSIvdmFyL2xvY2sveGwiCi0KLSMgZGVmYXVsdCBvdXRwdXQgZm9ybWF0IHVzZWQg
YnkgInhsIGxpc3QgLWwiCi0jb3V0cHV0X2Zvcm1hdD0ianNvbiIKLQotIyBmaXJzdCBibG9jayBk
ZXZpY2UgdG8gYmUgdXNlZCBmb3IgdGVtcG9yYXJ5IFZNIGRpc2sgbW91bnRzCi0jYmxrZGV2X3N0
YXJ0PSJ4dmRhIgotCi0jIGRlZmF1bHQgb3B0aW9uIHRvIHJ1biBob3RwbHVnIHNjcmlwdHMgZnJv
bSB4bAotIyBpZiBkaXNhYmxlZCB0aGUgb2xkIGJlaGF2aW91ciB3aWxsIGJlIHVzZWQsIGFuZCBo
b3RwbHVnIHNjcmlwdHMgd2lsbCBiZQotIyBsYXVuY2hlZCBieSB1ZGV2LgotI3J1bl9ob3RwbHVn
X3NjcmlwdHM9MQotCi0jIGRlZmF1bHQgYmFja2VuZCBkb21haW4gdG8gY29ubmVjdCBndWVzdCB2
aWZzIHRvLiAgVGhpcyBjYW4gYmUgYW55Ci0jIHZhbGlkIGRvbWFpbiBpZGVudGlmaWVyLgotI3Zp
Zi5kZWZhdWx0LmJhY2tlbmQ9IjAiCi0KLSMgZGVmYXVsdCBnYXRld2F5IGRldmljZSB0byB1c2Ug
d2l0aCB2aWYtcm91dGUgaG90cGx1ZyBzY3JpcHQKLSN2aWYuZGVmYXVsdC5nYXRld2F5ZGV2PSJl
dGgwIgotCi0jIGRlZmF1bHQgdmlmIHNjcmlwdCB0byB1c2UgaWYgbm9uZSBpcyBzcGVjaWZpZWQg
aW4gdGhlIGd1ZXN0IGNvbmZpZwotI3ZpZi5kZWZhdWx0LnNjcmlwdD0idmlmLWJyaWRnZSIKLQot
IyBkZWZhdWx0IGJyaWRnZSBkZXZpY2UgdG8gdXNlIHdpdGggdmlmLWJyaWRnZSBob3RwbHVnIHNj
cmlwdHMKLSN2aWYuZGVmYXVsdC5icmlkZ2U9InhlbmJyMCIKLQotIyBSZXNlcnZlIGEgY2xhaW0g
b2YgbWVtb3J5IHdoZW4gbGF1bmNoaW5nIGEgZ3Vlc3QuIFRoaXMgZ3VhcmFudGVlcyBpbW1lZGlh
dGUKLSMgZmVlZGJhY2sgd2hldGhlciB0aGUgZ3Vlc3QgY2FuIGJlIGxhdW5jaGVkIGR1ZSB0byBt
ZW1vcnkgZXhoYXVzdGlvbgotIyAod2hpY2ggY2FuIHRha2UgYSBsb25nIHRpbWUgdG8gZmluZCBv
dXQgaWYgbGF1bmNoaW5nIGh1Z2UgZ3Vlc3RzKS4KLSMgc2VlIHhsLmNvbmYoNSkgZm9yIGRldGFp
bHMuCi0jY2xhaW1fbW9kZT0xCi0KLSMgU3BlY2lmeSBnbG9iYWwgdmNwdSBoYXJkIGFmZmluaXR5
IG1hc2tzLiBTZWUgeGwuY29uZig1KSBmb3IgZGV0YWlscy4KLSN2bS5jcHVtYXNrPSIwLTciCi0j
dm0ucHYuY3B1bWFzaz0iMC0zIgotI3ZtLmh2bS5jcHVtYXNrPSIzLTciCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
