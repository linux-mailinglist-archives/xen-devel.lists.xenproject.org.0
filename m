Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639AEB38D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:11:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC4u-0006Rt-4l; Thu, 31 Oct 2019 15:09:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC4t-0006Ri-Eo
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:09:35 +0000
X-Inumbo-ID: 728f6340-fbf0-11e9-954c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 728f6340-fbf0-11e9-954c-12813bfff9fa;
 Thu, 31 Oct 2019 15:09:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39F7646A;
 Thu, 31 Oct 2019 08:09:34 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD6D53F71E;
 Thu, 31 Oct 2019 08:09:32 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:04 +0000
Message-Id: <20191031150922.22938-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 01/19] docs/misc: xen-command-line:
 Remove wrong statement from serrors=diverse
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBzZXJyb3JzPWRpdmVyc2UgaXMgc2VsZWN0ZWQgYnkgdGhlIHVzZXIsIHdlIHdpbGwgb25s
eSBzeW5jaHJvbml6ZQp0aGUgcGVuZGluZyBTRXJyb3JzIG9uIGVudHJ5IHRvIGh5cGVydmlzb3Ig
ZnJvbSBndWVzdCBjb250ZXh0IGFuZCBleGl0CmZyb20gZ3Vlc3QgdG8gaHlwZXJ2aXNvciBjb250
ZXh0LgoKV2UgZG9uJ3QgbmVlZCBzeW5jaHJvbml6ZSBTRXJyb3JzIGJldHdlZW4gZ3Vlc3QgY29u
dGV4dCBzd2l0Y2ggYXMgdGhleQp3b3VsZCBiZSBjYXRlZ29yaXplZCB0byBIeXBlcnZpc29yIGdl
bmVyYXRlZCBTRXJyb3JzIGluIGFueSBjYXNlLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0tLQogICAgVGhlIGRvY3VtZW50YXRpb24gZm9yIHRo
ZSBvcHRpb24gc2Vycm9ycyB3aWxsIGJlIGZ1bGx5IHJld29ya2VkIGluIGEKICAgIGZvbGxvdy11
cCBwYXRjaC4gQnV0IHRoZSBkc2IvaXNiIGluIHRoZSBjb250ZXh0IHN3aXRjaCB3aWxsIGJlCiAg
ICByZW1vdmVkIGJlZm9yZSB0aGUgZG9jdW1lbnRhdGlvbiByZXdvcmsuIFNvIHRvIGF2b2lkIGFu
eSBxdWVzdGlvbgogICAgd2hpbGUgcmV2aWV3aW5nIHRoZSBuZXh0IHBhdGNoLCBkcm9wIGl0IG5v
dy4KCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyByZXZpZXdlZC1i
eQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIGRvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKaW5kZXggZWY1NmRlZmVmNS4uMzBhMDRk
ZjRkYiAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCisrKyBi
L2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwpAQCAtMTg3Nyw3ICsxODc3LDYgQEAg
aHlwZXJ2aXNvcnMgaGFuZGxlIFNFcnJvcnM6CiAgIDEuIGRzYi9pc2Igb24gYWxsIEVMMSAtPiBF
TDIgdHJhcCBlbnRyaWVzIHRvIGNhdGVnb3JpemUgU0Vycm9ycyBjb3JyZWN0bHkuCiAgIDIuIGRz
Yi9pc2Igb24gRUwyIC0+IEVMMSByZXR1cm4gcGF0aHMgdG8gcHJldmVudCBzbGlwcGluZyBoeXBl
cnZpc29yCiAgICAgIFNFcnJvcnMgdG8gZ3Vlc3RzLgotICAzLiBkc2IvaXNiIGluIGNvbnRleHQg
c3dpdGNoIHRvIGlzb2xhdGUgU0Vycm9ycyBiZXR3ZWVuIDIgdkNQVXMuCiAKICogYGZvcndhcmRg
OgogICBUaGUgaHlwZXJ2aXNvciB3aWxsIG5vdCBkaXN0aW5ndWlzaCBndWVzdCBTRXJyb3JzIGZy
b20gaHlwZXJ2aXNvciBTRXJyb3JzLgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
