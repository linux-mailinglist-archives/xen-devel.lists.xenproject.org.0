Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B1BCA5F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:38:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCluV-0000Q3-CJ; Tue, 24 Sep 2019 14:35:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCluU-0000Py-Io
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:35:22 +0000
X-Inumbo-ID: 892cd590-ded8-11e9-961f-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 892cd590-ded8-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:35:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77939337;
 Tue, 24 Sep 2019 07:35:20 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0EDC3F59C;
 Tue, 24 Sep 2019 07:35:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 15:35:13 +0100
Message-Id: <20190924143515.8810-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13 v2 0/2] Errata implementation and doc
 update
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhlIHR3byBwYXRjaGVzIGFyZSBub3QgcmVsYXRlZCBidXQgdGhlIHNlY29uZCBv
bmUgZGVwZW5kZW5kcyBvbiB0aGUgZmlyc3QKb25lLiBTbyBJIGRlY2lkZWQgdG8gbWVyZ2UgdGhl
bSB0b2dldGhlci4KCkNoZWVycywKCkp1bGllbiBHcmFsbCAoMik6CiAgeGVuL2FybTogSW1wbGVt
ZW50IHdvcmthcm91bmQgZm9yIENvcnRleCBBLTU3IGFuZCBDb3J0ZXggQTcyIEFUCiAgICBzcGVj
dWxhdGUKICBkb2NzOiBSZXBsYWNlIGFsbCBpbnN0YW5jZSBvZiBBUk0gYnkgQXJtCgogU1VQUE9S
VC5tZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tCiBkb2NzL0lOREVYICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNiArKy0tCiBkb2NzL2ZlYXR1cmVzL2xpdmVwYXRjaC5wYW5kb2MgICAgICAgICAgICAg
fCAgMiArLQogZG9jcy9mZWF0dXJlcy9zY2hlZF9ydGRzLnBhbmRvYyAgICAgICAgICAgIHwgIDIg
Ky0KIGRvY3MvaHlwZXJ2aXNvci1ndWlkZS9jb2RlLWNvdmVyYWdlLnJzdCAgICB8ICAyICstCiBk
b2NzL21hbi94bC5jZmcuNS5wb2QuaW4gICAgICAgICAgICAgICAgICAgfCAgOCArKy0tLQogZG9j
cy9taXNjL2FybS9ib290aW5nLnR4dCAgICAgICAgICAgICAgICAgIHwgMTAgKysrLS0tCiBkb2Nz
L21pc2MvYXJtL2RldmljZS10cmVlL2d1ZXN0LnR4dCAgICAgICAgfCAgNCArLS0KIGRvY3MvbWlz
Yy9hcm0vZWFybHktcHJpbnRrLnR4dCAgICAgICAgICAgICB8ICAyICstCiBkb2NzL21pc2MvYXJt
L3NpbGljb24tZXJyYXRhLnR4dCAgICAgICAgICAgfCAyNCArKysrKysrLS0tLS0tLQogZG9jcy9t
aXNjL2NvbnNvbGUudHh0ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRvY3MvbWlzYy9l
ZmkucGFuZG9jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkb2NzL21pc2MvbGl2ZXBh
dGNoLnBhbmRvYyAgICAgICAgICAgICAgICAgfCAgOCArKy0tLQogZG9jcy9taXNjL3hlbi1jb21t
YW5kLWxpbmUucGFuZG9jICAgICAgICAgIHwgMjIgKysrKysrLS0tLS0tLQogZG9jcy9wcm9jZXNz
L3hlbi1yZWxlYXNlLW1hbmFnZW1lbnQucGFuZG9jIHwgIDIgKy0KIGRvY3Mvc3BlY3MvbGlieGMt
bWlncmF0aW9uLXN0cmVhbS5wYW5kb2MgICB8ICA2ICsrLS0KIGRvY3Mvc3BlY3MvbGlieGwtbWln
cmF0aW9uLXN0cmVhbS5wYW5kb2MgICB8ICAyICstCiB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMg
ICAgICAgICAgICAgICAgICAgfCAxMCArKysrKysKIDE4IGZpbGVzIGNoYW5nZWQsIDg4IGluc2Vy
dGlvbnMoKyksIDc2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
