Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9A165E2
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 16:39:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1Bt-0003Yb-0O; Tue, 07 May 2019 14:35:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1Br-0003YW-H9
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 14:35:31 +0000
X-Inumbo-ID: 5c91b306-70d5-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 5c91b306-70d5-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 14:35:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52058374;
 Tue,  7 May 2019 07:35:29 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DD303F5C1;
 Tue,  7 May 2019 07:35:27 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ee339666-5749-1ff7-f1e1-d928c1d4a8b9@arm.com>
Date: Tue, 7 May 2019 15:35:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzLzEzLzE5IDM6MjIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjAy
LjE5IGF0IDEyOjM2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20tYXJtL21tLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4+
IEBAIC0zMjEsMTAgKzMyMSw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdlX2Zyb21fZ3Zh
KHN0cnVjdCB2Y3B1ICp2LCB2YWRkcl90IHZhLAo+PiAgICNkZWZpbmUgU0hBUkVEX00yUF9FTlRS
WSAgICAgICAgICh+MFVMIC0gMVVMKQo+PiAgICNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAgICAg
ICAgICgoX2UpID09IFNIQVJFRF9NMlBfRU5UUlkpCj4+ICAgCj4+IC0vKiBYZW4gYWx3YXlzIG93
bnMgUDJNIG9uIEFSTSAqLwo+PiArLyogV2UgZG9uJ3QgaGF2ZSBhIE0yUCBvbiBBcm0gKi8KPj4g
ICAjZGVmaW5lIHNldF9ncGZuX2Zyb21fbWZuKG1mbiwgcGZuKSBkbyB7ICh2b2lkKSAobWZuKSwg
KHZvaWQpKHBmbik7IH0gd2hpbGUgKDApCj4+IC0jZGVmaW5lIG1mbl90b19nbWZuKF9kLCBtZm4p
ICAobWZuKQo+IAo+IFNvIGlzIHRoZSBwbGFuIHRvIHJlbW92ZSB0aGUgb3RoZXIgbWFjcm8gZnJv
bSBBcm0gdGhlbiBhcyB3ZWxsPwo+IEluIGFueSBldmVudAo+IEFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpKdXN0IHRvIGtlZXAgZXZlcnlvbmUgYXdhcmUsIEkga2Vw
dCB0aGlzIHBhdGNoIGFzIGlzIHdpdGggdGhlIDIgYWNrZWQtYnkgCmFuZCBwcm92aWRlZCBhIHNl
cGFyYXRlIHBhdGNoIHRvIG1vdmUgdGhlIGhlbHBlcnMgaW4gY29tbW9uIGNvZGUgdW5kZXIgCiFD
T05GSUdfSEFWRV9NMlAuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
