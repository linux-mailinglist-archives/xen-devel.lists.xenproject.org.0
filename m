Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8D6078D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:13:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOuY-0000P9-U3; Fri, 05 Jul 2019 14:10:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjOuX-0000Hm-G2
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:10:01 +0000
X-Inumbo-ID: 939edfee-9f2e-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 939edfee-9f2e-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 14:10:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36C7C30C31AA;
 Fri,  5 Jul 2019 14:10:00 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA3DB82297;
 Fri,  5 Jul 2019 14:09:57 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-6-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <97575295-13eb-76be-ba06-4340d6019f7a@redhat.com>
Date: Fri, 5 Jul 2019 16:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-6-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 05 Jul 2019 14:10:00 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 05/35] OvmfPkg/OvmfXen: Creating an ELF
 header
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoaXMgcGF0Y2ggY2hh
bmdlcyB0aGUgZmxhc2ggZGV2aWNlIGltYWdlIG9mIE92bWZYZW4gdG8gbWFrZSBpdCBsb29rCj4g
bGlrZSBpdCdzIGFuIEVMRi4gRm9yIHRoaXMsIHdlIHJlcGxhY2UgdGhlIGVtcHR5IGVtYmVkZGVk
IHZhcmlhYmxlIHN0b3JlCj4gYnkgYSBiaW5hcnkgYXJyYXksIHdoaWNoIGlzIGEgRUxGIGZpbGUg
aGVhZGVyLgo+IAo+IFRoZSBFTEYgaGVhZGVyIGV4cGxhaW4gdG8gYSBsb2FkZXIgdG8gbG9hZCB0
aGUgYmluYXJ5IGF0IHRoZSBhZGRyZXNzCj4gMU1CLCB0aGVuIGp1bXAgdG8gdGhlIFBWSCBlbnRy
eSBwb2ludCB3aGljaCB3aWxsIGJlIGNyZWF0ZWQgaW4gYSBsYXRlcgo+IHBhdGNoLiBUaGUgaGVh
ZGVyIGFsc28gaW5jbHVkZXMgYSBYZW4gRUxGIG5vdGUgdGhhdCBpcyBwYXJ0IG9mIHRoZQo+IFBW
SCBBQkkuCj4gCj4gVGhhdCBwYXRjaCBpbmNsdWRlIE92bWZYZW5FbGZIZWFkZXJHZW5lcmF0b3Iu
YyB3aGljaCBjYW4gYmUgdXNlIHRvCj4gcmVnZW5lcmF0ZSB0aGUgRUxGIGhlYWRlciwgYnV0IHRo
aXMgd2lsbCBiZSBhIG1hbnVhbCBzdGVwLgo+IAo+IFJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFu
b2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAg
IHYzOgo+ICAgICAtIGFkZGVkIGxpY2Vuc2UgdG8gZ2VuZXJhdGVfZWxmX2hlYWRlci5jCj4gICAg
ICAgd2hpY2ggaXMgcmVuYW1lZCB0byBPdm1mUGtnL092bWZYZW5FbGZIZWFkZXJHZW5lcmF0b3Iu
Ywo+ICAgICAtIGFkZGVkIGFuIEVMRiBOT1RFIGludG8gdGhlIGhlYWRlcgo+IAo+ICBPdm1mUGtn
L092bWZYZW4uZmRmICAgICAgICAgICAgICAgICB8IDEwMSArKysrKysrKysrKysrKysrKysrLQo+
ICBPdm1mUGtnL092bWZYZW5FbGZIZWFkZXJHZW5lcmF0b3IuYyB8IDE0MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjM4IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL092bWZYZW5FbGZIZWFk
ZXJHZW5lcmF0b3IuYwoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvT3ZtZlhlbkVsZkhl
YWRlckdlbmVyYXRvci5jIGIvT3ZtZlBrZy9Pdm1mWGVuRWxmSGVhZGVyR2VuZXJhdG9yLmMKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjZjYmFkOGZiZjcKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvT3ZtZlBrZy9Pdm1mWGVuRWxmSGVhZGVyR2VuZXJhdG9yLmMKPiBA
QCAtMCwwICsxLDE0MCBAQAo+ICsvKgo+ICsgKiBAZmlsZQo+ICsgKiBUaGlzIHByb2dyYW0gZ2Vu
ZXJhdGVzIGEgaGV4IGFycmF5IHRvIGJlIG1hbnVhbGx5IGNvcHBpZWQgaW50bwo+ICsgKiBPdm1m
WGVuLmZkZi4KPiArICogVGhlIHB1cnBvc2UgaXMgZm9yIHRoZSBmbGFzaCBkZXZpY2UgaW1hZ2Ug
dG8gYmUgcmVjb2duaXplIGFzIGFuIEVMRi4KPiArICoKPiArICogQ29weXJpZ2h0IChjKSAyMDE5
LCBDaXRyaXggU3lzdGVtcywgSW5jLgo+ICsgKgo+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogQlNELTItQ2xhdXNlLVBhdGVudAo+ICsgKi8KCigxKSBUaGlzIHBhdGNoIGlzIGFsbW9zdCBj
b21wbGV0ZSwganVzdCBwbGVhc2UgdXBkYXRlIHRoZSBjb21tZW50IHN0eWxlLApmb3IgdGhpcyB0
b3AtbGV2ZWwgY29tbWVudCwgZnJvbQoKLyoKICogQGZpbGUKICogYmxhaAogKi8KCnRvOgoKLyoq
IEBmaWxlCiAgYmxhaAoqKi8KClBsZWFzZSByZWZlciB0byBlLmcuICJPdm1mUGtnL1hlbkJ1c0R4
ZS9YZW5CdXNEeGUuYyIuCgpXaXRoIHRoYXQgY29tbWVudCBzdHlsZSB1cGRhdGU6CgpBY2tlZC1i
eTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KClRoYW5rcwpMYXN6bG8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
