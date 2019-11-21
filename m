Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB910494A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 04:23:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXd14-0003O8-GE; Thu, 21 Nov 2019 03:20:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R4Pf=ZN=kernel.org=krzk@srs-us1.protection.inumbo.net>)
 id 1iXd13-0003O3-9j
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 03:20:21 +0000
X-Inumbo-ID: d8c9db2c-0c0d-11ea-b678-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8c9db2c-0c0d-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 03:20:20 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6368E20898;
 Thu, 21 Nov 2019 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574306419;
 bh=srdnebtzKEySU4A3SaqY8Gx5DAif6RUKvhzFQiZMlcs=;
 h=From:To:Cc:Subject:Date:From;
 b=XaRPg600K2NA2y/DWZ4j1LaK5aD/YKEdc8VsvJltNeMoWhiYIcKWiUoZICn8gYZxN
 2LOd0hq9jZLk8fuUA8Ez5mpsAaVsqcmqY5hG70EfWw60uTZ3vJrNHiSgoantCz/ONT
 uJxm6vLBSvzVuZ+rVfSxWXAnsrpveQTOt23kWc/M=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 21 Nov 2019 04:20:16 +0100
Message-Id: <1574306416-22882-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH v2] xen: Fix Kconfig indentation
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgoKLS0tCgpDaGFuZ2VzIHNpbmNlIHYxOgoxLiBGaXggYWxz
byA3LXNwYWNlIGFuZCB0YWIrMSBzcGFjZSBpbmRlbnRhdGlvbiBpc3N1ZXMuCi0tLQogZHJpdmVy
cy94ZW4vS2NvbmZpZyB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMjkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vS2NvbmZpZyBiL2RyaXZlcnMveGVu
L0tjb25maWcKaW5kZXggYjcxZjFhZDEwMTNjLi42MTIxMmZjN2YwYzcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMveGVuL0tjb25maWcKKysrIGIvZHJpdmVycy94ZW4vS2NvbmZpZwpAQCAtMTA2LDI3ICsx
MDYsMjcgQEAgY29uZmlnIFhFTkZTCiAJICBJZiBpbiBkb3VidCwgc2F5IHllcy4KIAogY29uZmln
IFhFTl9DT01QQVRfWEVORlMKLSAgICAgICBib29sICJDcmVhdGUgY29tcGF0aWJpbGl0eSBtb3Vu
dCBwb2ludCAvcHJvYy94ZW4iCi0gICAgICAgZGVwZW5kcyBvbiBYRU5GUwotICAgICAgIGRlZmF1
bHQgeQotICAgICAgIGhlbHAKLSAgICAgICAgIFRoZSBvbGQgeGVuc3RvcmUgdXNlcnNwYWNlIHRv
b2xzIGV4cGVjdCB0byBmaW5kICJ4ZW5idXMiCi0gICAgICAgICB1bmRlciAvcHJvYy94ZW4sIGJ1
dCAieGVuYnVzIiBpcyBub3cgZm91bmQgYXQgdGhlIHJvb3Qgb2YgdGhlCi0gICAgICAgICB4ZW5m
cyBmaWxlc3lzdGVtLiAgU2VsZWN0aW5nIHRoaXMgY2F1c2VzIHRoZSBrZXJuZWwgdG8gY3JlYXRl
Ci0gICAgICAgICB0aGUgY29tcGF0aWJpbGl0eSBtb3VudCBwb2ludCAvcHJvYy94ZW4gaWYgaXQg
aXMgcnVubmluZyBvbgotICAgICAgICAgYSB4ZW4gcGxhdGZvcm0uCi0gICAgICAgICBJZiBpbiBk
b3VidCwgc2F5IHllcy4KKwlib29sICJDcmVhdGUgY29tcGF0aWJpbGl0eSBtb3VudCBwb2ludCAv
cHJvYy94ZW4iCisJZGVwZW5kcyBvbiBYRU5GUworCWRlZmF1bHQgeQorCWhlbHAKKwkgIFRoZSBv
bGQgeGVuc3RvcmUgdXNlcnNwYWNlIHRvb2xzIGV4cGVjdCB0byBmaW5kICJ4ZW5idXMiCisJICB1
bmRlciAvcHJvYy94ZW4sIGJ1dCAieGVuYnVzIiBpcyBub3cgZm91bmQgYXQgdGhlIHJvb3Qgb2Yg
dGhlCisJICB4ZW5mcyBmaWxlc3lzdGVtLiAgU2VsZWN0aW5nIHRoaXMgY2F1c2VzIHRoZSBrZXJu
ZWwgdG8gY3JlYXRlCisJICB0aGUgY29tcGF0aWJpbGl0eSBtb3VudCBwb2ludCAvcHJvYy94ZW4g
aWYgaXQgaXMgcnVubmluZyBvbgorCSAgYSB4ZW4gcGxhdGZvcm0uCisJICBJZiBpbiBkb3VidCwg
c2F5IHllcy4KIAogY29uZmlnIFhFTl9TWVNfSFlQRVJWSVNPUgotICAgICAgIGJvb2wgIkNyZWF0
ZSB4ZW4gZW50cmllcyB1bmRlciAvc3lzL2h5cGVydmlzb3IiCi0gICAgICAgZGVwZW5kcyBvbiBT
WVNGUwotICAgICAgIHNlbGVjdCBTWVNfSFlQRVJWSVNPUgotICAgICAgIGRlZmF1bHQgeQotICAg
ICAgIGhlbHAKLSAgICAgICAgIENyZWF0ZSBlbnRyaWVzIHVuZGVyIC9zeXMvaHlwZXJ2aXNvciBk
ZXNjcmliaW5nIHRoZSBYZW4KLQkgaHlwZXJ2aXNvciBlbnZpcm9ubWVudC4gIFdoZW4gcnVubmlu
ZyBuYXRpdmUgb3IgaW4gYW5vdGhlcgotCSB2aXJ0dWFsIGVudmlyb25tZW50LCAvc3lzL2h5cGVy
dmlzb3Igd2lsbCBzdGlsbCBiZSBwcmVzZW50LAotCSBidXQgd2lsbCBoYXZlIG5vIHhlbiBjb250
ZW50cy4KKwlib29sICJDcmVhdGUgeGVuIGVudHJpZXMgdW5kZXIgL3N5cy9oeXBlcnZpc29yIgor
CWRlcGVuZHMgb24gU1lTRlMKKwlzZWxlY3QgU1lTX0hZUEVSVklTT1IKKwlkZWZhdWx0IHkKKwlo
ZWxwCisJICBDcmVhdGUgZW50cmllcyB1bmRlciAvc3lzL2h5cGVydmlzb3IgZGVzY3JpYmluZyB0
aGUgWGVuCisJICBoeXBlcnZpc29yIGVudmlyb25tZW50LiAgV2hlbiBydW5uaW5nIG5hdGl2ZSBv
ciBpbiBhbm90aGVyCisJICB2aXJ0dWFsIGVudmlyb25tZW50LCAvc3lzL2h5cGVydmlzb3Igd2ls
bCBzdGlsbCBiZSBwcmVzZW50LAorCSAgYnV0IHdpbGwgaGF2ZSBubyB4ZW4gY29udGVudHMuCiAK
IGNvbmZpZyBYRU5fWEVOQlVTX0ZST05URU5ECiAJdHJpc3RhdGUKQEAgLTI3MSw3ICsyNzEsNyBA
QCBjb25maWcgWEVOX0FDUElfUFJPQ0VTU09SCiAJZGVwZW5kcyBvbiBYRU4gJiYgWEVOX0RPTTAg
JiYgWDg2ICYmIEFDUElfUFJPQ0VTU09SICYmIENQVV9GUkVRCiAJZGVmYXVsdCBtCiAJaGVscAot
ICAgICAgICAgIFRoaXMgQUNQSSBwcm9jZXNzb3IgdXBsb2FkcyBQb3dlciBNYW5hZ2VtZW50IGlu
Zm9ybWF0aW9uIHRvIHRoZSBYZW4KKwkgIFRoaXMgQUNQSSBwcm9jZXNzb3IgdXBsb2FkcyBQb3dl
ciBNYW5hZ2VtZW50IGluZm9ybWF0aW9uIHRvIHRoZSBYZW4KIAkgIGh5cGVydmlzb3IuCiAKIAkg
IFRvIGRvIHRoYXQgdGhlIGRyaXZlciBwYXJzZXMgdGhlIFBvd2VyIE1hbmFnZW1lbnQgZGF0YSBh
bmQgdXBsb2FkcwpAQCAtMjgwLDcgKzI4MCw3IEBAIGNvbmZpZyBYRU5fQUNQSV9QUk9DRVNTT1IK
IAkgIFNNTSBzbyB0aGF0IG90aGVyIGRyaXZlcnMgKHN1Y2ggYXMgQUNQSSBjcHVmcmVxIHNjYWxp
bmcgZHJpdmVyKSB3aWxsCiAJICBub3QgbG9hZC4KIAotICAgICAgICAgIFRvIGNvbXBpbGUgdGhp
cyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBtb2R1bGUgd2lsbCBiZQor
CSAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhl
IG1vZHVsZSB3aWxsIGJlCiAJICBjYWxsZWQgeGVuX2FjcGlfcHJvY2Vzc29yICBJZiB5b3UgZG8g
bm90IGtub3cgd2hhdCB0byBjaG9vc2UsIHNlbGVjdAogCSAgTSBoZXJlLiBJZiB0aGUgQ1BVRlJF
USBkcml2ZXJzIGFyZSBidWlsdCBpbiwgc2VsZWN0IFkgaGVyZS4KIApAQCAtMjkyLDcgKzI5Miw3
IEBAIGNvbmZpZyBYRU5fTUNFX0xPRwogCSAgY29udmVydGluZyBpdCBpbnRvIExpbnV4IG1jZWxv
ZyBmb3JtYXQgZm9yIG1jZWxvZyB0b29scwogCiBjb25maWcgWEVOX0hBVkVfUFZNTVUKLSAgICAg
ICBib29sCisJYm9vbAogCiBjb25maWcgWEVOX0VGSQogCWRlZl9ib29sIHkKQEAgLTMwOSwxNSAr
MzA5LDE1IEBAIGNvbmZpZyBYRU5fQUNQSQogCWRlcGVuZHMgb24gWDg2ICYmIEFDUEkKIAogY29u
ZmlnIFhFTl9TWU1TCi0gICAgICAgYm9vbCAiWGVuIHN5bWJvbHMiCi0gICAgICAgZGVwZW5kcyBv
biBYODYgJiYgWEVOX0RPTTAgJiYgWEVORlMKLSAgICAgICBkZWZhdWx0IHkgaWYgS0FMTFNZTVMK
LSAgICAgICBoZWxwCi0gICAgICAgICAgRXhwb3J0cyBoeXBlcnZpc29yIHN5bWJvbHMgKGFsb25n
IHdpdGggdGhlaXIgdHlwZXMgYW5kIGFkZHJlc3NlcykgdmlhCi0gICAgICAgICAgL3Byb2MveGVu
L3hlbnN5bXMgZmlsZSwgc2ltaWxhciB0byAvcHJvYy9rYWxsc3ltcworCWJvb2wgIlhlbiBzeW1i
b2xzIgorCWRlcGVuZHMgb24gWDg2ICYmIFhFTl9ET00wICYmIFhFTkZTCisJZGVmYXVsdCB5IGlm
IEtBTExTWU1TCisJaGVscAorCSAgRXhwb3J0cyBoeXBlcnZpc29yIHN5bWJvbHMgKGFsb25nIHdp
dGggdGhlaXIgdHlwZXMgYW5kIGFkZHJlc3NlcykgdmlhCisJICAvcHJvYy94ZW4veGVuc3ltcyBm
aWxlLCBzaW1pbGFyIHRvIC9wcm9jL2thbGxzeW1zCiAKIGNvbmZpZyBYRU5fSEFWRV9WUE1VCi0g
ICAgICAgYm9vbAorCWJvb2wKIAogY29uZmlnIFhFTl9GUk9OVF9QR0RJUl9TSEJVRgogCXRyaXN0
YXRlCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
