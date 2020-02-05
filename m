Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF215289B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:44:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHCZ-0000BZ-BH; Wed, 05 Feb 2020 09:42:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHCY-0000BL-92
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:42:30 +0000
X-Inumbo-ID: d32e1e74-47fb-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d32e1e74-47fb-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 09:42:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 227C4B029;
 Wed,  5 Feb 2020 09:42:29 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
Message-ID: <8f9626f1-7959-9037-df98-7495839fa858@suse.com>
Date: Wed, 5 Feb 2020 10:42:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/3] AMD/IOMMU: drop redundant code
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

VGhlIGxldmVsIDEgc3BlY2lhbCBleGl0IHBhdGggaXMgdW5uZWNlc3NhcnkgaW4gaW9tbXVfcGRl
X2Zyb21fZGZuKCkgLQp0aGUgc3Vic2VxdWVudCBjb2RlIHRha2VzIGNhcmUgb2YgdGhpcyBjYXNl
IHF1aXRlIGZpbmUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCkBAIC0xOTgsMTIgKzE5OCw2
IEBAIHN0YXRpYyBpbnQgaW9tbXVfcGRlX2Zyb21fZGZuKHN0cnVjdCBkb20KIAogICAgIG5leHRf
dGFibGVfbWZuID0gbWZuX3gocGFnZV90b19tZm4odGFibGUpKTsKIAotICAgIGlmICggbGV2ZWwg
PT0gMSApCi0gICAgewotICAgICAgICBwdF9tZm5bbGV2ZWxdID0gbmV4dF90YWJsZV9tZm47Ci0g
ICAgICAgIHJldHVybiAwOwotICAgIH0KLQogICAgIHdoaWxlICggbGV2ZWwgPiAxICkKICAgICB7
CiAgICAgICAgIHVuc2lnbmVkIGludCBuZXh0X2xldmVsID0gbGV2ZWwgLSAxOwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
