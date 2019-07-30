Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B437A3E7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:20:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOF8-0005uI-Gp; Tue, 30 Jul 2019 09:16:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsOF7-0005uD-9H
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:16:25 +0000
X-Inumbo-ID: b358e070-b2aa-11e9-9d4d-f3a295c00e76
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b358e070-b2aa-11e9-9d4d-f3a295c00e76;
 Tue, 30 Jul 2019 09:16:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 196E1B0CCB;
 Tue, 30 Jul 2019 09:16:23 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3DC460922;
 Tue, 30 Jul 2019 09:16:21 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-4-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <735a50d9-feaa-9270-71e6-fb89f672d4fb@redhat.com>
Date: Tue, 30 Jul 2019 11:16:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-4-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 30 Jul 2019 09:16:23 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 03/35] OvmfPkg: Introduce
 XenResetVector
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

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEludHJvZHVjZSBYZW5S
ZXNldFZlY3RvciwgYSBjb3B5IG9mIE92bWZQa2cvUmVzZXRWZWN0b3IsIHdpdGggb25lCj4gY2hh
bmdlczoKPiAgIC0gU0VDX0RFRkFVTFRfQ1IwOiBlbmFibGUgY2FjaGUgKGJpdCAzMCBvciBDRCBz
ZXQgdG8gMCkKPiAKPiBYZW4gY29waWVzIHRoZSBPVk1GIGNvZGUgdG8gUkFNLCB0aGVyZSBpcyBu
byBuZWVkIHRvIGRpc2FibGUgY2FjaGUuCj4gCj4gVGhpcyBuZXcgbW9kdWxlIHdpbGwgbGF0ZXIg
YmUgbW9kaWZpZWQgdG8gYWRkIGEgbmV3IGVudHJ5IHBvaW50LCBtb3JlCj4gZGV0YWlsIGluIGEg
Zm9sbG93aW5nIGNvbW1pdCAiT3ZtZlBrZy9YZW5SZXNldFZlY3RvcjogQWRkIG5ldyBlbnRyeSBw
b2ludAo+IGZvciBYZW4gUFZIIgo+IAo+IFZhbHVlIEZJTEVfR1VJRCBvZiBYZW5SZXNldFZlY3Rv
ciBoYXZlIG5vdCBjaGFuZ2VkIGNvbXBhcmUgdG8gUmVzZXRWZWN0b3IKPiBiZWNhdXNlIGl0IGlz
IGEgc3BlY2lhbCB2YWx1ZSAoZ0VmaUZpcm13YXJlVm9sdW1lVG9wRmlsZUd1aWQpLgo+IAo+IFJl
ZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4g
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gLS0tCj4g
Cj4gTm90ZXM6Cj4gICAgIHY0Ogo+ICAgICAtIFVwZGF0ZSBNYWludGFpbmVycy50eHQKPiAgICAg
Cj4gICAgIHYzOgo+ICAgICAgIC0gQWRkZWQgZ0VmaUZpcm13YXJlVm9sdW1lVG9wRmlsZUd1aWQg
dG8gdGhlIGNvbW1pdCBtZXNzYWdlLgo+ICAgICAgIC0gcmViYXNlZDogU1BEWAo+IAo+ICBPdm1m
UGtnL092bWZYZW4uZHNjICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgT3Zt
ZlBrZy9Pdm1mWGVuLmZkZiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIE92
bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mICAgICB8ICAzOCArKysrKwo+
ICBNYWludGFpbmVycy50eHQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+
ICAuLi4vWGVuUmVzZXRWZWN0b3IvSWExNi9SZWFsMTZUb0ZsYXQzMi5hc20gICAgfCAxMzQgKysr
KysrKysrKysrKysrKwo+ICBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvUGFnZVRhYmxlczY0
LmFzbSAgfCAxNDkgKysrKysrKysrKysrKysrKysrCj4gIE92bWZQa2cvWGVuUmVzZXRWZWN0b3Iv
WGVuUmVzZXRWZWN0b3IubmFzbWIgICB8ICA2OCArKysrKysrKwo+ICA3IGZpbGVzIGNoYW5nZWQs
IDM5MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5pbmYKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IE92bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZWFsMTZUb0ZsYXQzMi5hc20KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9QYWdlVGFibGVz
NjQuYXNtCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL1hlblJl
c2V0VmVjdG9yLm5hc21iCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvTWFpbnRhaW5lcnMudHh0IGIv
TWFpbnRhaW5lcnMudHh0Cj4gaW5kZXggOThmNmQ4MjhlYi4uMzRiZGIyNzViNCAxMDA2NDQKPiAt
LS0gYS9NYWludGFpbmVycy50eHQKPiArKysgYi9NYWludGFpbmVycy50eHQKPiBAQCAtMzgwLDYg
KzM4MCw3IEBAIEY6IE92bWZQa2cvU21iaW9zUGxhdGZvcm1EeGUvKlhlbi5jCj4gIEY6IE92bWZQ
a2cvWGVuQnVzRHhlLwo+ICBGOiBPdm1mUGtnL1hlbklvUGNpRHhlLwo+ICBGOiBPdm1mUGtnL1hl
blB2QmxrRHhlLwo+ICtGOiBPdm1mUGtnL1hlblJlc2V0VmVjdG9yLwo+ICBSOiBBbnRob255IFBl
cmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAgUjogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KPiAgCgpSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtA
cmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
