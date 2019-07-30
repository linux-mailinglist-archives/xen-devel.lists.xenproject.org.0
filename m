Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4BD7A41E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:28:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsONu-0007Ah-9e; Tue, 30 Jul 2019 09:25:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsONt-0007Ac-EN
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:25:29 +0000
X-Inumbo-ID: f7d4f440-b2ab-11e9-8ca4-371f826211a4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7d4f440-b2ab-11e9-8ca4-371f826211a4;
 Tue, 30 Jul 2019 09:25:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A762481DE3;
 Tue, 30 Jul 2019 09:25:27 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C1D060856;
 Tue, 30 Jul 2019 09:25:26 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-6-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <12d1d4e4-715d-8e7b-585b-5324a40a17ff@redhat.com>
Date: Tue, 30 Jul 2019 11:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-6-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 30 Jul 2019 09:25:27 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 05/35] OvmfPkg/OvmfXen:
 Creating an ELF header
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
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoaXMgcGF0Y2ggY2hh
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
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IExhc3psbyBFcnNl
ayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHY0Ogo+ICAgICAt
IGZpeCB0b3AtbGV2ZWwgY29tbWVudCBzdHlsZQo+ICAgICAtIFVwZGF0ZSBNYWludGFpbmVycy50
eHQKPiAgICAgCj4gICAgIHYzOgo+ICAgICAtIGFkZGVkIGxpY2Vuc2UgdG8gZ2VuZXJhdGVfZWxm
X2hlYWRlci5jCj4gICAgICAgd2hpY2ggaXMgcmVuYW1lZCB0byBPdm1mUGtnL092bWZYZW5FbGZI
ZWFkZXJHZW5lcmF0b3IuYwo+ICAgICAtIGFkZGVkIGFuIEVMRiBOT1RFIGludG8gdGhlIGhlYWRl
cgo+IAo+ICBPdm1mUGtnL092bWZYZW4uZmRmICAgICAgICAgICAgICAgICB8IDEwMSArKysrKysr
KysrKysrKysrKysrLQo+ICBPdm1mUGtnL092bWZYZW5FbGZIZWFkZXJHZW5lcmF0b3IuYyB8IDE0
MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIE1haW50YWluZXJzLnR4dCAgICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMzkgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cvT3ZtZlhlbkVs
ZkhlYWRlckdlbmVyYXRvci5jCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvTWFpbnRhaW5lcnMudHh0
IGIvTWFpbnRhaW5lcnMudHh0Cj4gaW5kZXggNDJlYzhkNTRhZi4uMDE2NTIzYjQwMSAxMDA2NDQK
PiAtLS0gYS9NYWludGFpbmVycy50eHQKPiArKysgYi9NYWludGFpbmVycy50eHQKPiBAQCAtMzcz
LDYgKzM3Myw3IEBAIEY6IE92bWZQa2cvTGlicmFyeS9YZW5Db25zb2xlU2VyaWFsUG9ydExpYi8K
PiAgRjogT3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi8KPiAgRjogT3ZtZlBrZy9MaWJy
YXJ5L1hlbklvTW1pb0xpYi8KPiAgRjogT3ZtZlBrZy9Pdm1mWGVuLioKPiArRjogT3ZtZlBrZy9P
dm1mWGVuRWxmSGVhZGVyR2VuZXJhdG9yLmMKPiAgRjogT3ZtZlBrZy9QbGF0Zm9ybVBlaS9NZW1E
ZXRlY3QuYwo+ICBGOiBPdm1mUGtnL1BsYXRmb3JtUGVpL1BsYXRmb3JtLioKPiAgRjogT3ZtZlBr
Zy9QbGF0Zm9ybVBlaS9YZW4uKgo+IAoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJl
ZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
