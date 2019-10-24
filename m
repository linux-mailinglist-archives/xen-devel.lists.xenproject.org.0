Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087ACE34AA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 15:47:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNdQL-0005at-Rl; Thu, 24 Oct 2019 13:45:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNdQJ-0005ao-RZ
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 13:45:07 +0000
X-Inumbo-ID: 7d08c230-f664-11e9-94a2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d08c230-f664-11e9-94a2-12813bfff9fa;
 Thu, 24 Oct 2019 13:45:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 26A08B1EE;
 Thu, 24 Oct 2019 13:45:06 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <073cd4d0-ec28-f6b3-adf0-dcfbfeada8f6@suse.com>
Date: Thu, 24 Oct 2019 15:45:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] MAINTAINERS: correct decription of M:
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGV0J3MgcmVmbGVjdCByZWFsaXR5LCBpdHMgdXNlIGJ5IGFkZF9tYWludGFpbmVycy5wbCAvIGdl
dF9tYWludGFpbmVyLnBsLAphcyB3ZWxsIGFzIHdoYXQKaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qu
b3JnL3dpa2kvU3VibWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzIHNheXMuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS9NQUlOVEFJTkVSUwor
KysgYi9NQUlOVEFJTkVSUwpAQCAtNTksNyArNTksOSBAQCBhcHByb3ByaWF0ZSBicmFuY2guCiAK
IERlc2NyaXB0aW9ucyBvZiBzZWN0aW9uIGVudHJpZXM6CiAKLQlNOiBNYWlsIHBhdGNoZXMgdG86
IEZ1bGxOYW1lIDxhZGRyZXNzQGRvbWFpbj4KKwlNOiBNYWludGFpbmVyOiBGdWxsTmFtZSA8YWRk
cmVzc0Bkb21haW4+CisJICAgTWFpbnRhaW5lcnMgc2hvdWxkIGJlIENDZWQgb24gcGF0Y2hlcy4g
IEF0IGxlYXN0IG9uZSBvZiB0aGVtCisJICAgbmVlZHMgdG8gYXBwcm92ZSBjaGFuZ2VzIHRvIHRo
ZSBjb3ZlcmVkIGZpbGVzLgogCVI6IERlc2lnbmF0ZWQgcmV2aWV3ZXI6IEZ1bGxOYW1lIDxhZGRy
ZXNzQGRvbWFpbj4KIAkgICBSZXZpZXdlcnMgc2hvdWxkIGJlIENDZWQgb24gcGF0Y2hlcy4gIEhv
d2V2ZXIsIHRoZXkgZG8gbm90CiAJICAgaGF2ZSBhIGZvcm1hbCBnb3Zlcm5hbmNlIHJvbGUsIGFu
ZCBhcmUgbGlzdGVkIGhlcmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
