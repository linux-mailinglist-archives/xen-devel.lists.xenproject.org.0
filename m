Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F14315BEC6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:56:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2E19-0005xX-Gp; Thu, 13 Feb 2020 12:54:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=06QY=4B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2E18-0005xL-LF
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:54:54 +0000
X-Inumbo-ID: 07188cc8-4e60-11ea-b897-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07188cc8-4e60-11ea-b897-12813bfff9fa;
 Thu, 13 Feb 2020 12:54:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 92C79AB87;
 Thu, 13 Feb 2020 12:54:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 13 Feb 2020 13:54:42 +0100
Message-Id: <20200213125449.14226-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200213125449.14226-1-jgross@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/8] xen: make rangeset_printk() static
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cmFuZ2VzZXRfcHJpbnRrKCkgaXMgb25seSB1c2VkIGxvY2FsbHksIHNvIGl0IGNhbiBiZSBtYWRl
IHN0YXRpYy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
LS0tCiB4ZW4vY29tbW9uL3Jhbmdlc2V0LmMgICAgICB8IDMgKy0tCiB4ZW4vaW5jbHVkZS94ZW4v
cmFuZ2VzZXQuaCB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9yYW5nZXNldC5jIGIveGVuL2NvbW1v
bi9yYW5nZXNldC5jCmluZGV4IGYzNGNhZmRjN2UuLjRlYmJhMzBiYTMgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vcmFuZ2VzZXQuYworKysgYi94ZW4vY29tbW9uL3Jhbmdlc2V0LmMKQEAgLTU0MSw4
ICs1NDEsNyBAQCBzdGF0aWMgdm9pZCBwcmludF9saW1pdChzdHJ1Y3QgcmFuZ2VzZXQgKnIsIHVu
c2lnbmVkIGxvbmcgcykKICAgICBwcmludGsoKHItPmZsYWdzICYgUkFOR0VTRVRGX3ByZXR0eXBy
aW50X2hleCkgPyAiJWx4IiA6ICIlbHUiLCBzKTsKIH0KIAotdm9pZCByYW5nZXNldF9wcmludGso
Ci0gICAgc3RydWN0IHJhbmdlc2V0ICpyKQorc3RhdGljIHZvaWQgcmFuZ2VzZXRfcHJpbnRrKHN0
cnVjdCByYW5nZXNldCAqcikKIHsKICAgICBpbnQgbnJfcHJpbnRlZCA9IDA7CiAgICAgc3RydWN0
IHJhbmdlICp4OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3Jhbmdlc2V0LmggYi94ZW4v
aW5jbHVkZS94ZW4vcmFuZ2VzZXQuaAppbmRleCAwYzA1YzJmZDRlLi41ZjYyYTk3OTcxIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcmFuZ2VzZXQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4v
cmFuZ2VzZXQuaApAQCAtOTUsOCArOTUsNiBAQCBib29sX3QgX19tdXN0X2NoZWNrIHJhbmdlc2V0
X2NvbnRhaW5zX3NpbmdsZXRvbigKIHZvaWQgcmFuZ2VzZXRfc3dhcChzdHJ1Y3QgcmFuZ2VzZXQg
KmEsIHN0cnVjdCByYW5nZXNldCAqYik7CiAKIC8qIFJhbmdlc2V0IHByZXR0eSBwcmludGluZy4g
Ki8KLXZvaWQgcmFuZ2VzZXRfcHJpbnRrKAotICAgIHN0cnVjdCByYW5nZXNldCAqcik7CiB2b2lk
IHJhbmdlc2V0X2RvbWFpbl9wcmludGsoCiAgICAgc3RydWN0IGRvbWFpbiAqZCk7CiAKLS0gCjIu
MTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
