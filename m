Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E17A92D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:08:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRoR-0000m7-R5; Tue, 30 Jul 2019 13:05:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsRoQ-0000m2-8U
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:05:06 +0000
X-Inumbo-ID: a611fc2e-b2ca-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a611fc2e-b2ca-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 13:05:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BB575AFE9;
 Tue, 30 Jul 2019 13:05:04 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456205D9E2;
 Tue, 30 Jul 2019 13:05:03 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-35-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <323cf9e5-32e8-3ad4-eb42-d0ace75d9fad@redhat.com>
Date: Tue, 30 Jul 2019 15:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-35-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 30 Jul 2019 13:05:04 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 34/35] OvmfPkg: Move
 XenRealTimeClockLib from ArmVirtPkg
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

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE1vdmUgWGVuUmVhbFRp
bWVDbG9ja0xpYiBmcm9tIEFybVZpcnRQa2cgdG8gT3ZtZlBrZyBzbyBpdCBjYW4gYmUgdXNlZAo+
IGZyb20gdGhlIE92bWZQa2cgYnkgdGhlIGZvbGxvd2luZyBwYXRjaCwgIk92bWZQa2cvT3ZtZlhl
bjogdXNlCj4gUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUgZnJvbSBFbWJlZGRlZFBrZyIKPiAKPiBS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQo+
IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
Pgo+IFJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgo+IC0tLQo+
IAo+IE5vdGVzOgo+ICAgICB2NDoKPiAgICAgLSBVcGRhdGUgTWFpbnRhaW5lcnMudHh0Cj4gICAg
IAo+ICAgICB2MzoKPiAgICAgLSBmaXggdGhlIGNvbW1pdCBtZXNzYWdlIGJvZHkKPiAKPiAgQXJt
VmlydFBrZy9Bcm1WaXJ0WGVuLmRzYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQo+ICAuLi4vTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1l
Q2xvY2tMaWIuaW5mICAgICAgICAgfCAwCj4gIC4uLi9MaWJyYXJ5L1hlblJlYWxUaW1lQ2xvY2tM
aWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5jICAgICAgICAgICB8IDAKPiAgTWFpbnRhaW5lcnMudHh0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAgcmVu
YW1lIHtBcm1WaXJ0UGtnID0+IE92bWZQa2d9L0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9Y
ZW5SZWFsVGltZUNsb2NrTGliLmluZiAoMTAwJSkKPiAgcmVuYW1lIHtBcm1WaXJ0UGtnID0+IE92
bWZQa2d9L0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmMg
KDEwMCUpCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvTWFpbnRhaW5lcnMudHh0IGIvTWFpbnRhaW5l
cnMudHh0Cj4gaW5kZXggNzlkZWZkMTNiZi4uOTE5YmFjY2M1NiAxMDA2NDQKPiAtLS0gYS9NYWlu
dGFpbmVycy50eHQKPiArKysgYi9NYWludGFpbmVycy50eHQKPiBAQCAtMTE0LDcgKzExNCw2IEBA
IFI6IExlaWYgTGluZGhvbG0gPGxlaWYubGluZGhvbG1AbGluYXJvLm9yZz4KPiAgQXJtVmlydFBr
ZzogbW9kdWxlcyB1c2VkIG9uIFhlbgo+ICBGOiBBcm1WaXJ0UGtnL0FybVZpcnRYZW4uKgo+ICBG
OiBBcm1WaXJ0UGtnL0xpYnJhcnkvWGVuQXJtR2VuZXJpY1RpbWVyVmlydENvdW50ZXJMaWIvCj4g
LUY6IEFybVZpcnRQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliLwo+ICBGOiBBcm1WaXJ0
UGtnL0xpYnJhcnkvWGVuVmlydE1lbUluZm9MaWIvCj4gIEY6IEFybVZpcnRQa2cvUHJlUGkvCj4g
IEY6IEFybVZpcnRQa2cvWGVuQWNwaVBsYXRmb3JtRHhlLwo+IEBAIC0zNzQsNiArMzczLDcgQEAg
RjogT3ZtZlBrZy9MaWJyYXJ5L1hlbkNvbnNvbGVTZXJpYWxQb3J0TGliLwo+ICBGOiBPdm1mUGtn
L0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliLwo+ICBGOiBPdm1mUGtnL0xpYnJhcnkvWGVuSW9NbWlv
TGliLwo+ICBGOiBPdm1mUGtnL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvCj4gK0Y6IE92bWZQa2cv
TGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliLwo+ICBGOiBPdm1mUGtnL092bWZYZW4uKgo+ICBG
OiBPdm1mUGtnL092bWZYZW5FbGZIZWFkZXJHZW5lcmF0b3IuYwo+ICBGOiBPdm1mUGtnL1BsYXRm
b3JtUGVpL01lbURldGVjdC5jCj4gCgpSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtA
cmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
