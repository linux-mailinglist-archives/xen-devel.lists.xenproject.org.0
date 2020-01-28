Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65E14AFC1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 07:24:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwKFO-0001Zy-R2; Tue, 28 Jan 2020 06:21:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VmX/=3R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwKFM-0001Zt-W8
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 06:21:13 +0000
X-Inumbo-ID: 60a67c5e-4196-11ea-8622-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60a67c5e-4196-11ea-8622-12813bfff9fa;
 Tue, 28 Jan 2020 06:21:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29277AD54;
 Tue, 28 Jan 2020 06:21:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 Jan 2020 07:21:07 +0100
Message-Id: <20200128062107.14334-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] docs: document CONTROL command of xenstore
 protocol
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIENPTlRST0wgY29tbWFuZCAoZm9ybWVyIERFQlVHIGNvbW1hbmQpIGlzbid0IHNwZWNpZmll
ZCBpbiB0aGUKeGVuc3RvcmUgcHJvdG9jb2wgZG9jLiBBZGQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogZG9jcy9taXNjL3hlbnN0b3JlLnR4
dCB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDI4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9t
aXNjL3hlbnN0b3JlLnR4dCBiL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQKaW5kZXggNjU1NzAxODNi
Ni4uNmY4NTY5ZDU3NiAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dAorKysgYi9k
b2NzL21pc2MveGVuc3RvcmUudHh0CkBAIC0zMTgsMTIgKzMxOCwzMiBAQCBTRVRfVEFSR0VUCQk8
ZG9taWQ+fDx0ZG9taWQ+fAogCiAtLS0tLS0tLS0tIE1pc2NlbGxhbmVvdXMgLS0tLS0tLS0tLQog
Ci1ERUJVRwkJCXByaW50fDxzdHJpbmc+fD8/CSAgICBzZW5kcyA8c3RyaW5nPiB0byBkZWJ1ZyBs
b2cKLURFQlVHCQkJcHJpbnR8PHRoaW5nLXdpdGgtbm8tbnVsPiAgIEVJTlZBTAotREVCVUcJCQlj
aGVja3w/PwkJICAgIGNoZWNrcyB4ZW5zdG9yZWQgaW5uYXJkcwotREVCVUcJCQk8YW55dGhpbmct
ZWxzZXw+CSAgICBuby1vcCAoZnV0dXJlIGV4dGVuc2lvbikKLQotCVRoZXNlIHJlcXVlc3RzIHNo
b3VsZCBub3QgZ2VuZXJhbGx5IGJlIHVzZWQgYW5kIG1heSBiZQotCXdpdGhkcmF3biBpbiB0aGUg
ZnV0dXJlLgotCitDT05UUk9MCQkJPGNvbW1hbmQ+fFs8cGFyYW1ldGVycz58XQorCVNlbmQgYSBj
b250cm9sIGNvbW1hbmQgPGNvbW1hbmQ+IHdpdGggb3B0aW9uYWwgcGFyYW1ldGVycworCSg8cGFy
YW1ldGVycz4pIHRvIFhlbnN0b3JlIGRhZW1vbi4KKworCVRoZSBzZXQgb2YgY29tbWFuZHMgYW5k
IHRoZWlyIHNlbWFudGljcyBpcyBpbXBsZW1lbnRhdGlvbgorCXNwZWNpZmljIGFuZCBpcyBsaWtl
bHkgdG8gY2hhbmdlIGZyb20gb25lIFhlbiB2ZXJzaW9uIHRvIHRoZQorCW5leHQuICBPdXQtb2Yt
dHJlZSB1c2VycyB3aWxsIGVuY291bnRlciBjb21wYXRpYmlsaXR5IGlzc3Vlcy4KKworCUN1cnJl
bnQgY29tbWFuZHMgYXJlOgorCWNoZWNrCisJCWNoZWNrcyB4ZW5zdG9yZWQgaW5uYXJkcworCWxv
Z3xvbgorCQl0dXJuIHhlbnN0b3JlIGxvZ2dpbmcgb24KKwlsb2d8b2ZmCisJCXR1cm4geGVuc3Rv
cmUgbG9nZ2luZyBvZmYKKwlsb2dmaWxlfDxmaWxlLW5hbWU+CisJCWxvZyB0byBzcGVjaWZpZWQg
ZmlsZQorCW1lbXJlcG9ydHxbPGZpbGUtbmFtZT5dCisJCXByaW50IG1lbW9yeSBzdGF0aXN0aWNz
IHRvIGxvZ2ZpbGUgKG5vIDxmaWxlLW5hbWU+CisJCXNwZWNpZmllZCkgb3IgdG8gc3BlY2lmaWMg
ZmlsZQorCXByaW50fDxzdHJpbmc+CisJCXByaW50IDxzdHJpbmc+IHRvIHN5c2xvZyAoeGVuc3Rv
cmUgcnVucyBhcyBkYWVtb24pIG9yCisJCXRvIGNvbnNvbGUgKHhlbnN0b3JlIHJ1bnMgYXMgc3R1
YmRvbSkKKwloZWxwCQkJPHN1cHBvcnRlZC1jb21tYW5kcz4KKwkJcmV0dXJuIGxpc3Qgb2Ygc3Vw
cG9ydGVkIGNvbW1hbmRzIGZvciBDT05UUk9MCisKK0RFQlVHCisJRGVwcmVjYXRlZCwgbm93IG5h
bWVkIENPTlRST0wKIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
