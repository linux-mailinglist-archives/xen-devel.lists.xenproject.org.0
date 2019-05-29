Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B442E3E4
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 19:48:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW2dH-00011O-Ag; Wed, 29 May 2019 17:44:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW2dF-00011J-AH
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:44:57 +0000
X-Inumbo-ID: 78d00a9c-8239-11e9-aaba-ebb999262621
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 78d00a9c-8239-11e9-aaba-ebb999262621;
 Wed, 29 May 2019 17:44:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F380D341;
 Wed, 29 May 2019 10:44:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 359043F5AF;
 Wed, 29 May 2019 10:44:55 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
Date: Wed, 29 May 2019 18:44:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V1 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMjEvMDUvMjAxOSAxODozNywgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IFRoZSAiaW50ZXJydXB0cy1leHRlbmRlZCIgcHJvcGVydHkgaXMgYSBz
cGVjaWFsIGZvcm0gZm9yIHVzZSB3aGVuCj4gYSBub2RlIG5lZWRzIHRvIHJlZmVyZW5jZSBtdWx0
aXBsZSBpbnRlcnJ1cHQgcGFyZW50cy4gPgo+IEFjY29yZGluZyB0byB0aGU6CgpOSVQ6IHMvdGhl
Ly8KCj4gTGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2ludGVycnVwdHMudHh0Cj4gCj4gQnV0LCB0aGVyZSBhcmUgY2FzZXMgd2hlbiAi
aW50ZXJydXB0cy1leHRlbmRlZCIgcHJvcGVydHkgaXMgdXNlZCBmb3IKPiAib3V0c2lkZSAvc29j
IG5vZGUiIHdpdGggYSBzaW5nbGUgaW50ZXJydXB0IHBhcmVudCBhcyBhbiBlcXVpdmFsZW50IG9m
Cj4gcGFpcnMgKCJpbnRlcnJ1cHQtcGFyZW50IiArICJpbnRlcnJ1cHRzIikuCj4gCj4gVGhlIGdv
b2QgZXhhbXBsZSBoZXJlIGlzIEFSQ0ggdGltZXIgbm9kZSBmb3IgUi1DYXIgR2VuMy9HZW4yIGZh
bWlseSwKCk5JVDogcy9UaGUvQS8gSSB0aGluawoKPiB3aGljaCBpcyBtYW5kYXRvcnkgZGV2aWNl
IGZvciBYZW4gdXNhZ2Ugb24gQVJNLiBBbmQgd2l0aG91dCBhYmlsaXR5Cj4gdG8gaGFuZGxlIHN1
Y2ggbm9kZXMsIFhlbiBmYWlscyB0byBvcGVyYXRlLgo+IAo+IFNvLCB0aGlzIHBhdGNoIGFkZHMg
cmVxdWlyZWQgc3VwcG9ydCBmb3IgWGVuIHRvIGJlIGFibGUgdG8gaGFuZGxlCj4gbm9kZXMgd2l0
aCB0aGF0IHByb3BlcnR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtv
IDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpJIHdpbGwgZ2l2ZSBhbiBvcHBvcnR1
bml0eSB0byBTdGVmYW5vIHRvIHJldmlldyBpdC4gSWYgSSBkb24ndCBoZWFyIGFueXRoaW5nIGJ5
IApNb25kYXksIEkgd2lsbCBtZXJnZSBpdC4KClRoYW5rIHlvdSEKCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
