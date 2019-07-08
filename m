Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCC6237B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 17:35:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkVby-00082o-9o; Mon, 08 Jul 2019 15:31:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qgCs=VF=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hkVbx-00081F-2L
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 15:31:25 +0000
X-Inumbo-ID: 717c476c-a195-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 717c476c-a195-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 15:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8688B81129;
 Mon,  8 Jul 2019 15:31:18 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-3.ams2.redhat.com
 [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E83B53E11;
 Mon,  8 Jul 2019 15:31:16 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-27-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <93e7e346-e96c-1d04-3037-a42a60a956fe@redhat.com>
Date: Mon, 8 Jul 2019 17:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-27-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 08 Jul 2019 15:31:18 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 26/35] OvmfPkg/XenPlatformPei: Ignore
 missing PCI Host Bridge on Xen PVH
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

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdoZW4gdGhlIGRldmlj
ZSBJRCBvZiB0aGUgaG9zdCBicmlkZ2UgaXMgdW5rbm93biwgY2hlY2sgaWYgd2UgYXJlCj4gcnVu
bmluZyBhcyBhIFBWSCBndWVzdCBhcyB0aGVyZSBpcyBubyBQQ0kgYnVzIGluIHRoYXQgY2FzZS4K
PiAKPiBSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTY4OQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2MzoKPiAgICAgLSBSZW1vdmUgdXNlIG9m
IFhFTl9QVkhfUENJX0hPU1RfQlJJREdFX0RFVklDRV9JRCwgYW5kIHNpbXBseSBkb24ndCBzZXQK
PiAgICAgICBQY2RPdm1mSG9zdEJyaWRnZVBjaURldklkLgo+ICAgICAKPiAgICAgdjI6Cj4gICAg
IC0gVXNlIG5ldyBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQgbWFjcm8KPiAKPiAg
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1BsYXRmb3JtLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMKPiBp
bmRleCA1MmY2MDQ4Y2E0Li5iN2ZjMzBkMmVlIDEwMDY0NAo+IC0tLSBhL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvUGxhdGZvcm0uYwo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZv
cm0uYwo+IEBAIC0yNzIsNiArMjcyLDEyIEBAIE1pc2NJbml0aWFsaXphdGlvbiAoCj4gICAgICAg
IEFjcGlFbkJpdCAgPSBJQ0g5X0FDUElfQ05UTF9BQ1BJX0VOOwo+ICAgICAgICBicmVhazsKPiAg
ICAgIGRlZmF1bHQ6Cj4gKyAgICAgIGlmIChYZW5QdmhEZXRlY3RlZCAoKSkgewo+ICsgICAgICAg
IC8vCj4gKyAgICAgICAgLy8gVGhlcmUgaXMgbm8gUENJIGJ1cyBpbiB0aGlzIGNhc2UKPiArICAg
ICAgICAvLwo+ICsgICAgICAgIHJldHVybjsKPiArICAgICAgfQo+ICAgICAgICBERUJVRyAoKEVG
SV9EX0VSUk9SLCAiJWE6IFVua25vd24gSG9zdCBCcmlkZ2UgRGV2aWNlIElEOiAweCUwNHhcbiIs
Cj4gICAgICAgICAgX19GVU5DVElPTl9fLCBtSG9zdEJyaWRnZURldklkKSk7Cj4gICAgICAgIEFT
U0VSVCAoRkFMU0UpOwo+IAoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
