Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2B1645D2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 14:40:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4PXI-0007H5-46; Wed, 19 Feb 2020 13:37:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4PXG-0007H0-LA
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 13:37:06 +0000
X-Inumbo-ID: ea7e1e68-531c-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea7e1e68-531c-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 13:37:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B80DEC0CD;
 Wed, 19 Feb 2020 13:37:03 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64aeaf09-df4e-cfc2-7fe0-c7293f2eb958@suse.com>
Date: Wed, 19 Feb 2020 14:37:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] AMD/IOMMU: drop unused PCI-generic #define-s
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UXVpdGUgcG9zc2libHkgdGhleSBoYWQgYmVlbiBpbiB1c2Ugd2hlbiBzb21lIG9mIHRoZSBQQ0kg
aW50ZXJmYWNpbmcgd2FzCmRvbmUgaW4gYW4gYWQgaG9jIHdheSByYXRoZXIgdGhhbiB1c2luZyB0
aGUgUENJIGZ1bmN0aW9ucyB3ZSBoYXZlLiBSaWdodApub3cgdGhlc2UgaGF2ZSBubyB1c2VycyAo
bGVmdCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgot
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUtZGVmcy5oCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS1kZWZzLmgKQEAgLTQwLDEwICs0MCw2IEBACiAj
ZGVmaW5lIGFtZF9vZmZzZXRfbGV2ZWxfYWRkcmVzcyhvZmZzZXQsIGxldmVsKSBcCiAgICAgICAg
ICgodWludDY0X3QpKG9mZnNldCkgPDwgKDEyICsgKFBURV9QRVJfVEFCTEVfU0hJRlQgKiAoKGxl
dmVsKSAtIDEpKSkpCiAKLSNkZWZpbmUgUENJX01JTl9DQVBfT0ZGU0VUCTB4NDAKLSNkZWZpbmUg
UENJX01BWF9DQVBfQkxPQ0tTCTQ4Ci0jZGVmaW5lIFBDSV9DQVBfUFRSX01BU0sJMHhGQwotCiAv
KiBJT01NVSBDYXBhYmlsaXR5ICovCiAjZGVmaW5lIFBDSV9DQVBfSURfTUFTSwkJMHgwMDAwMDBG
RgogI2RlZmluZSBQQ0lfQ0FQX0lEX1NISUZUCTAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
