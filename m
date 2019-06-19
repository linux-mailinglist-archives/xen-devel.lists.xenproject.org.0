Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF024B969
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 15:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdaFe-0006WM-Lq; Wed, 19 Jun 2019 13:03:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9okD=US=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hdaFc-0006WH-LG
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 13:03:45 +0000
X-Inumbo-ID: a9e4be4d-9292-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a9e4be4d-9292-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560949422;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=yTIVMVbZvbc3SmzJpck47i7oNhpMIi+WcsT8SjfqktI=;
 b=Z9dxB9FwEGA//1ysfYSKebrCZ3GL9Z98YQDvZgfUjR8Ap/0fpLHVelV6gv86KV/4vN
 D65gnEsynDG1fLkO5tf/bH5LH1e2aPTgeZuNDLlUOGlUUG4JB67iuCFhcHo7nmti+iHc
 G+p82d/iSOnFJpruswpVLqP6ycPSaVdlUU5i6JqFObap28PQAUZHBlFGA/6T1vIG0u9W
 j6TQ5IkszqgJ+h+x+10usrnc2FpJqq1WnnzHf33L8biqkcitPzz5GKdqRi3gao0itJwe
 j3HgYjE/GNVt32NbVbMNQepwFa7+JfwLTs+ukhgtQa26DCXOu0VngHvQkGygY6uKkBT6
 TaGQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id 60b3d8v5JD3b4vw
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 19 Jun 2019 15:03:37 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Jun 2019 15:03:35 +0200
Message-Id: <20190619130335.3458-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] Remove tools/examples/cpupool
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
IHhsY3B1cG9vbC5jZmcoNSkuClRoZXJlIGlzIG5vIG5lZWQgdG8gZHVwbGljYXRlIHRoaXMgaW5m
byBpbnRvIGFub3RoZXIgZmlsZS4KVGhlIG5lZWQgZm9yIGEgZGVkaWNhdGVkIGZpbGUgaXMgYWxz
byBkZXNjcmliZWQgaW4geGwoMSkgY3B1cG9vbC1jcmVhdGUuCgpTaWduZWQtb2ZmLWJ5OiBPbGFm
IEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQogdG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUgfCAg
MSAtCiB0b29scy9leGFtcGxlcy9SRUFETUUgICB8ICAxIC0KIHRvb2xzL2V4YW1wbGVzL2NwdXBv
b2wgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTkgZGVsZXRpb25z
KC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvZXhhbXBsZXMvY3B1cG9vbAoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2V4YW1wbGVzL01ha2VmaWxlIGIvdG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUKaW5k
ZXggMTQ3ZWE1OTBlZi4uNjRiMjMzMGIwMyAxMDA2NDQKLS0tIGEvdG9vbHMvZXhhbXBsZXMvTWFr
ZWZpbGUKKysrIGIvdG9vbHMvZXhhbXBsZXMvTWFrZWZpbGUKQEAgLTYsNyArNiw2IEBAIFhFTl9S
RUFETUVTID0gUkVBRE1FCiAKIFhFTl9DT05GSUdTICs9IHhsZXhhbXBsZS5odm0KIFhFTl9DT05G
SUdTICs9IHhsZXhhbXBsZS5wdmxpbnV4Ci1YRU5fQ09ORklHUyArPSBjcHVwb29sCiAKIFhFTl9D
T05GSUdTICs9ICQoWEVOX0NPTkZJR1MteSkKIApkaWZmIC0tZ2l0IGEvdG9vbHMvZXhhbXBsZXMv
UkVBRE1FIGIvdG9vbHMvZXhhbXBsZXMvUkVBRE1FCmluZGV4IDQ4YWNlODIxODkuLmQxMzQ5NDVl
YjcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2V4YW1wbGVzL1JFQURNRQorKysgYi90b29scy9leGFtcGxl
cy9SRUFETUUKQEAgLTEzLDcgKzEzLDYgQEAgYmxvY2sgICAgICAgICAgICAgICAtIGNhbGxlZCBi
eSB4ZW4tYmFja2VuZC5hZ2VudCB0byBiaW5kL3VuYmluZCBkZXYKIGJsb2NrLWNvbW1vbi5zaCAg
ICAgLSBzb3VyY2VkIGJ5IGJsb2NrLCBibG9jay0qCiBibG9jay1lbmJkICAgICAgICAgIC0gYmlu
ZHMvdW5iaW5kcyBuZXR3b3JrIGJsb2NrIGRldmljZXMKIGJsb2NrLW5iZCAgICAgICAgICAgLSBi
aW5kcy91bmJpbmRzIG5ldHdvcmsgYmxvY2sgZGV2aWNlcwotY3B1cG9vbCAgICAgICAgICAgICAt
IGV4YW1wbGUgY29uZmlndXJhdGlvbiBzY3JpcHQgZm9yICd4bCBjcHVwb29sLWNyZWF0ZScKIGV4
dGVybmFsLWRldmljZS1taWdyYXRlIC0gY2FsbGVkIGJ5IHhlbmQgZm9yIG1pZ3JhdGluZyBleHRl
cm5hbCBkZXZpY2VzCiBsb2NraW5nLnNoICAgICAgICAgIC0gbG9ja2luZyBmdW5jdGlvbnMgdG8g
cHJldmVudCBjb25jdXJyZW50IGFjY2VzcyB0bwogICAgICAgICAgICAgICAgICAgICAgIGNyaXRp
Y2FsIHNlY3Rpb25zIGluc2lkZSBzY3JpcHQgZmlsZXMKZGlmZiAtLWdpdCBhL3Rvb2xzL2V4YW1w
bGVzL2NwdXBvb2wgYi90b29scy9leGFtcGxlcy9jcHVwb29sCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAzNWUyMjllNDYyLi4wMDAwMDAwMDAwCi0tLSBhL3Rvb2xzL2V4YW1wbGVzL2Nw
dXBvb2wKKysrIC9kZXYvbnVsbApAQCAtMSwxNyArMCwwIEBACi0jPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQotIyBDb25maWd1cmF0aW9uIHNldHVwIGZvciAneG0gY3B1cG9vbC1jcmVhdGUnIG9yICd4bCBj
cHVwb29sLWNyZWF0ZScuCi0jIFRoaXMgc2NyaXB0IHNldHMgdGhlIHBhcmFtZXRlcnMgdXNlZCB3
aGVuIGEgY3B1cG9vbCBpcyBjcmVhdGVkIHVzaW5nCi0jICd4bSBjcHVwb29sLWNyZWF0ZScgb3Ig
J3hsIGNwdXBvb2wtY3JlYXRlJy4KLSMgWW91IHVzZSBhIHNlcGFyYXRlIHNjcmlwdCBmb3IgZWFj
aCBjcHVwb29sIHlvdSB3YW50IHRvIGNyZWF0ZSwgb3IgCi0jIHlvdSBjYW4gc2V0IHRoZSBwYXJh
bWV0ZXJzIGZvciB0aGUgY3B1cG9vbCBvbiB0aGUgeG0gY29tbWFuZCBsaW5lLgotIz09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KLQotIyB0aGUgbmFtZSBvZiB0aGUgbmV3IGNwdXBvb2wKLW5hbWUgPSAiRXhh
bXBsZS1DcHVwb29sIgotCi0jIHRoZSBzY2hlZHVsZXIgdG8gdXNlOiB2YWxpZCBhcmUgZS5nLiBj
cmVkaXQsIGNyZWRpdDIgYW5kIHJ0ZHMKLXNjaGVkID0gImNyZWRpdCIKLQotIyBsaXN0IG9mIGNw
dXMgdG8gdXNlCi1jcHVzID0gWyIyIiwgIjMiXQotCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
