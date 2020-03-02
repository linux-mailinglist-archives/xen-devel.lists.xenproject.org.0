Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC911761B4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 18:59:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8pIB-0006TO-9v; Mon, 02 Mar 2020 17:55:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xD4r=4T=fem.tu-ilmenau.de=jonas.licht@srs-us1.protection.inumbo.net>)
 id 1j8pGB-0006RW-4X
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 17:53:43 +0000
X-Inumbo-ID: c0632cae-5cae-11ea-aa07-bc764e2007e4
Received: from smail.fem.tu-ilmenau.de (unknown [141.24.220.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0632cae-5cae-11ea-aa07-bc764e2007e4;
 Mon, 02 Mar 2020 17:53:41 +0000 (UTC)
Received: from webmail.fem.tu-ilmenau.de (web-1.fem.tu-ilmenau.de
 [141.24.220.58])
 by smail.fem.tu-ilmenau.de (Postfix) with ESMTPSA id CE842201A9;
 Mon,  2 Mar 2020 18:53:39 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 02 Mar 2020 18:53:38 +0100
From: jonas.licht@fem.tu-ilmenau.de
To: xen-devel@lists.xenproject.org
Mail-Reply-To: xen-devel@lists.xenproject.org, jonas.licht@fem.tu-ilmenau.de
Message-ID: <493c670d7726e74e0c5d76da678e190a@fem.tu-ilmenau.de>
X-Sender: jonas.licht@fem.tu-ilmenau.de
User-Agent: Roundcube Webmail/1.3.1 
X-Mailman-Approved-At: Mon, 02 Mar 2020 17:55:46 +0000
Subject: [Xen-devel] [PATCH] libxenstat: fixed Makefile for building
 python-bindings
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
Reply-To: xen-devel@lists.xenproject.org, jonas.licht@fem.tu-ilmenau.de
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4ZXMgdGhlIGxpYnhlbnN0YXQgTWFrZWZpbGUgdG8gZGV0ZXJtaW5lIHRoZSBjb3JyZWN0IHBh
dGhzCm9mIHB5dGhvbiBpbmNsdWRlcyB3aGVuIGJ1aWxkaW5nIHB5dGhvbi1iaW5kaW5ncy4KQWxz
byByZXBsYWNlcyB0aGUgLWx4ZW5zdGF0IGxpbmtpbmcgdG8gY29ycmVjdCBvYmplY3QgZmlsZXMK
YW5kIHVzZSB0aGUgbGliZGlyIHZhcmlhYmxlIGZvciBpbnN0YWxsaW5nLgoKU2lnbmVkLW9mZi1i
eTogSm9uYXMgTGljaHQgPGpvbmFzLmxpY2h0QGZlbS50dS1pbG1lbmF1LmRlPgotLS0KICB0b29s
cy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgfCAxMSArKysrKy0tLS0tLQogIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9v
bHMveGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlIApiL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3Rh
dC9NYWtlZmlsZQppbmRleCAwM2NiMjEyZTNiLi40YTAyZDJlNTYzIDEwMDY0NAotLS0gYS90b29s
cy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUKKysrIGIvdG9vbHMveGVuc3RhdC9saWJ4ZW5z
dGF0L01ha2VmaWxlCkBAIC0xMTQsMTggKzExNCwxNyBAQCAkKEJJTkRJTkdTKTogJChTSExJQikg
JChTSExJQl9MSU5LUykgc3JjL3hlbnN0YXQuaAogIFNXSUdfRkxBR1M9LW1vZHVsZSB4ZW5zdGF0
IC1Jc3JjCgogICMgUHl0aG9uIGJpbmRpbmdzCi1QWVRIT05fVkVSU0lPTj0kKFBZVEhPTjpweXRo
b24lPSUpCi1QWVRIT05fRkxBR1M9LUkvdXNyL2luY2x1ZGUvcHl0aG9uJChQWVRIT05fVkVSU0lP
TikgCi1scHl0aG9uJChQWVRIT05fVkVSU0lPTikKK1BZVEhPTl9GTEFHUz1gJChQWVRIT04pIC1j
ICdpbXBvcnQgZGlzdHV0aWxzLnN5c2NvbmZpZzsgcHJpbnQoIi1JIiArIApkaXN0dXRpbHMuc3lz
Y29uZmlnLmdldF9weXRob25faW5jKFRydWUpICsgIiAiICsgCmRpc3R1dGlscy5zeXNjb25maWcu
Z2V0X2NvbmZpZ192YXIoIkJMRExJQlJBUlkiKSknYAogICQoUFlNT0QpOiAkKFBZU1JDKQogICQo
UFlTUkMpOiBiaW5kaW5ncy9zd2lnL3hlbnN0YXQuaQogICAgICAgICBzd2lnIC1weXRob24gJChT
V0lHX0ZMQUdTKSAtb3V0ZGlyICQoQEQpIC1vICQoUFlTUkMpICQ8CgogICQoUFlMSUIpOiAkKFBZ
U1JDKQotICAgICAgICQoQ0MpICQoQ0ZMQUdTKSAkKExERkxBR1MpICQoUFlUSE9OX0ZMQUdTKSAk
KFNITElCX0xERkxBR1MpIAotbHhlbnN0YXQgLW8gJEAgJDwgJChBUFBFTkRfTERGTEFHUykKKyAg
ICAgICAkKENDKSAkKENGTEFHUykgJChMREZMQUdTKSAkKFBZVEhPTl9GTEFHUykgJChTSExJQl9M
REZMQUdTKSAtbyAKJEAgJDwgJChTSExJQikgJChMRExJQlMteSkgJChBUFBFTkRfTERGTEFHUykK
CiAgcHl0aG9uLWJpbmRpbmdzOiAkKFBZTElCKSAkKFBZTU9EKQoKLXB5dGhvbmxpYmRpcj0kKHBy
ZWZpeCkvbGliL3B5dGhvbiQoUFlUSE9OX1ZFUlNJT04pL3NpdGUtcGFja2FnZXMKK3B5dGhvbmxp
YmRpcj1gJChQWVRIT04pIC1jICdpbXBvcnQgZGlzdHV0aWxzLnN5c2NvbmZpZzsgCnByaW50KGRp
c3R1dGlscy5zeXNjb25maWcuZ2V0X3B5dGhvbl9saWIoKSknYAogIGluc3RhbGwtcHl0aG9uLWJp
bmRpbmdzOiAkKFBZTElCKSAkKFBZTU9EKQogICAgICAgICAkKElOU1RBTExfUFJPRykgJChQWUxJ
QikgJChERVNURElSKSQocHl0aG9ubGliZGlyKS9feGVuc3RhdC5zbwogICAgICAgICAkKElOU1RB
TExfUFJPRykgJChQWU1PRCkgJChERVNURElSKSQocHl0aG9ubGliZGlyKS94ZW5zdGF0LnB5CkBA
IC0xNDksMTMgKzE0OCwxMyBAQCAkKFBFUkxTUkMpOiBiaW5kaW5ncy9zd2lnL3hlbnN0YXQuaQog
ICAgICAgICBzd2lnIC1wZXJsICQoU1dJR19GTEFHUykgLW91dGRpciAkKEBEKSAtbyAkKFBFUkxT
UkMpICQ8CgogICQoUEVSTExJQik6ICQoUEVSTFNSQykKLSAgICAgICAkKENDKSAkKENGTEFHUykg
JChMREZMQUdTKSAkKFBFUkxfRkxBR1MpICQoU0hMSUJfTERGTEFHUykgCi1seGVuc3RhdCAtbyAk
QCAkPCAkKEFQUEVORF9MREZMQUdTKQorICAgICAgICQoQ0MpICQoQ0ZMQUdTKSAkKExERkxBR1Mp
ICQoUEVSTF9GTEFHUykgJChTSExJQl9MREZMQUdTKSAtbyAkQCAKJDwgJChTSExJQikgJChMRExJ
QlMteSkgJChBUFBFTkRfTERGTEFHUykKCiAgLlBIT05ZOiBwZXJsLWJpbmRpbmdzCiAgcGVybC1i
aW5kaW5nczogJChQRVJMTElCKSAkKFBFUkxNT0QpCgogIC5QSE9OWTogaW5zdGFsbC1wZXJsLWJp
bmRpbmdzCi1wZXJsbGliZGlyPSQocHJlZml4KS9saWIvcGVybDUKK3BlcmxsaWJkaXI9JChwcmVm
aXgpLyQobGliZGlyKS9wZXJsNQogIHBlcmxtb2RkaXI9JChwcmVmaXgpL3NoYXJlL3Blcmw1CiAg
aW5zdGFsbC1wZXJsLWJpbmRpbmdzOiAkKFBFUkxMSUIpICQoUEVSTE1PRCkKICAgICAgICAgJChJ
TlNUQUxMX1BST0cpICQoUEVSTExJQikgJChERVNURElSKSQocGVybGxpYmRpcikveGVuc3RhdC5z
bwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
