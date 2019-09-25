Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E2BDAB9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3M7-0002md-Gy; Wed, 25 Sep 2019 09:13:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD3M5-0002mX-Lt
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:13:01 +0000
X-Inumbo-ID: abb8d298-df74-11e9-962d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id abb8d298-df74-11e9-962d-12813bfff9fa;
 Wed, 25 Sep 2019 09:13:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87C8CACF2;
 Wed, 25 Sep 2019 09:12:59 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c88502e8-3342-3bae-a670-2780c56b54c6@suse.com>
Date: Wed, 25 Sep 2019 11:12:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] ACPI/cpuidle: bump maximum number of power
 states we support
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

Q29tbWl0IDRjNmNkNjQ1MTkgKCJtd2FpdF9pZGxlOiBTa3lsYWtlIENsaWVudCBTdXBwb3J0Iikg
YWRkZWQgYSB0YWJsZQp3aXRoIDggZW50cmllcywgd2hpY2ggLSB0b2dldGhlciB3aXRoIEMwIC0g
cmVuZGVyZWQgdGhlIGN1cnJlbnQgbGltaXQKdG9vIGxvdy4gSXQgc2hvdWxkIGhhdmUgYmVlbiBh
Y2NvbXBhbmllZCBieSBhbiBpbmNyZWFzZSBvZiB0aGUgY29uc3RhbnQ7CmRvIHRoaXMgbm93LiBE
b24ndCBidW1wIGJ5IHRvbyBtdWNoIHRob3VnaCwgYXMgdGhlcmUgYXJlIGEgbnVtYmVyIG9mIG9u
LQpzdGFjayBhcnJheXMgd2hpY2ggYXJlIGRpbWVuc2lvbmVkIGJ5IHRoaXMgY29uc3RhbnQuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4v
aW5jbHVkZS94ZW4vY3B1aWRsZS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9jcHVpZGxlLmgKQEAg
LTI5LDcgKzI5LDcgQEAKICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgogI2luY2x1ZGUgPHhlbi9z
cGlubG9jay5oPgogCi0jZGVmaW5lIEFDUElfUFJPQ0VTU09SX01BWF9QT1dFUiAgICAgICAgOAor
I2RlZmluZSBBQ1BJX1BST0NFU1NPUl9NQVhfUE9XRVIgICAgICAgIDEyCiAjZGVmaW5lIENQVUlE
TEVfTkFNRV9MRU4gICAgICAgICAgICAgICAgMTYKIAogI2RlZmluZSBBQ1BJX0NTVEFURV9FTV9O
T05FICAgICAwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
