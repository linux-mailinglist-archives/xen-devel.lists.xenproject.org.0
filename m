Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1AD607CB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:27:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjP8t-0001xk-Kp; Fri, 05 Jul 2019 14:24:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjP8r-0001xe-Qt
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:24:49 +0000
X-Inumbo-ID: a4d83f4c-9f30-11e9-b887-d7303ed5d1a2
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4d83f4c-9f30-11e9-b887-d7303ed5d1a2;
 Fri, 05 Jul 2019 14:24:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5EDF53086204;
 Fri,  5 Jul 2019 14:24:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16E6968C9;
 Fri,  5 Jul 2019 14:24:40 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-8-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20f29521-4ad5-fcb4-65dd-c6ee975cd6b8@redhat.com>
Date: Fri, 5 Jul 2019 16:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-8-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 05 Jul 2019 14:24:42 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 07/35] OvmfPkg/XenResetVector: Saving
 start of day pointer for PVH guests
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

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEFzIGRlc2NyaWJlZCBp
biB0aGUgWGVuIFBWSCBkb2N1bWVudGF0aW9uIFsxXSwgImVieDogY29udGFpbnMgdGhlCj4gcGh5
c2ljYWwgbWVtb3J5IGFkZHJlc3Mgd2hlcmUgdGhlIGxvYWRlciBoYXMgcGxhY2VkIHRoZSBib290
IHN0YXJ0IGluZm8KPiBzdHJ1Y3R1cmUiLiBUbyBoYXZlIHRoaXMgcG9pbnRlciBzYXZlZCB0byBi
ZSBhYmxlIHRvIHVzZSBpdCBsYXRlciBpbiB0aGUKPiBQRUkgcGhhc2UsIHdlIGFsbG9jYXRlIHNv
bWUgc3BhY2UgaW4gdGhlIE1FTUZEIGZvciBpdC4gV2UgdXNlICdYUFZIJyBhcwo+IGEgc2lnbmF0
dXJlIChmb3IgIlhlbiBQVkgiKS4KPiAKPiBbMV0gaHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qu
b3JnL2RvY3MvdW5zdGFibGUvbWlzYy9wdmguaHRtbAo+IAo+IFJlZjogaHR0cHM6Ly9idWd6aWxs
YS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4gU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IExhc3ps
byBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHYzOgo+
ICAgICAtIHJlbmFtZSBQY2RYZW5TdGFydE9mRGF5KiB0byBQY2RYZW5QdmhTdGFydE9mRGF5Kgo+
ICAgICAtIFVzZSBmaXJzdCBhdmFpbGFibGUgdG9rZW4gdmFsdWUgZm9yIHRob3NlICgweDE3IGFu
ZCAweDI4KQoKWW91IGVuZGVkIHVwIHVzaW5nIDB4MzIgcmF0aGVyIHRoYW4gMHgyOCwgYnV0IHRo
YXQgd2FzIG5lY2Vzc2FyeSAoYW5kCmNvcnJlY3QpIGR1ZSB0byBvdGhlciBwYXRjaGVzIG1lYW53
aGlsZS4KCkFsc28gdGhlcmUncyBiZWVuIGEgbWluaW1hbCBjb21tZW50IHN0eWxlIGZpeCBpbiAi
WGVuUFZITWFpbi5hc20iLgoKTXkgQWNrZWQtYnkgc3RhbmRzLgoKVGhhbmtzIQpMYXN6bG8KCj4g
Cj4gIE92bWZQa2cvT3ZtZlBrZy5kZWMgICAgICAgICAgICAgICAgICAgICAgICAgfCAzICsrKwo+
ICBPdm1mUGtnL092bWZYZW4uZmRmICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCj4g
IE92bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mICAgfCAzICsrKwo+ICBP
dm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20gIHwgNiArKysrKysKPiAg
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5uYXNtYiB8IDIgKysKPiAgNSBm
aWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cv
T3ZtZlBrZy5kZWMgYi9Pdm1mUGtnL092bWZQa2cuZGVjCj4gaW5kZXggOTY0MDM2MGY2Mi4uYzJh
MmViZmI5NSAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL092bWZQa2cuZGVjCj4gKysrIGIvT3ZtZlBr
Zy9Pdm1mUGtnLmRlYwo+IEBAIC0yMTgsNiArMjE4LDkgQEAgW1BjZHNGaXhlZEF0QnVpbGRdCj4g
ICAgIyAgVGhlIHZhbHVlIHNob3VsZCBiZSBhIG11bHRpcGxlIG9mIDRLQi4KPiAgICBnVWVmaU92
bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RIaWdoUG1tTWVtb3J5U2l6ZXwweDQwMDAwMHxVSU5UMzJ8
MHgzMQo+ICAKPiArICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RYZW5QdmhTdGFydE9m
RGF5U3RydWN0UHRyfDB4MHxVSU5UMzJ8MHgxNwo+ICsgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VH
dWlkLlBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHJTaXplfDB4MHxVSU5UMzJ8MHgzMgo+ICsK
PiAgW1BjZHNEeW5hbWljLCBQY2RzRHluYW1pY0V4XQo+ICAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3Bh
Y2VHdWlkLlBjZEVtdVZhcmlhYmxlRXZlbnR8MHxVSU5UNjR8Mgo+ICAgIGdVZWZpT3ZtZlBrZ1Rv
a2VuU3BhY2VHdWlkLlBjZE92bWZGbGFzaFZhcmlhYmxlc0VuYWJsZXxGQUxTRXxCT09MRUFOfDB4
MTAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9Pdm1mWGVuLmZkZiBiL092bWZQa2cvT3ZtZlhlbi5m
ZGYKPiBpbmRleCA0M2MyNjhmNmNiLi40OTk5N2ZlZTliIDEwMDY0NAo+IC0tLSBhL092bWZQa2cv
T3ZtZlhlbi5mZGYKPiArKysgYi9Pdm1mUGtnL092bWZYZW4uZmRmCj4gQEAgLTE3Miw2ICsxNzIs
MTAgQEAgW0ZELk1FTUZEXQo+ICAweDAwNzAwMHwweDAwMTAwMAo+ICBnRWZpTWRlUGtnVG9rZW5T
cGFjZUd1aWQuUGNkR3VpZGVkRXh0cmFjdEhhbmRsZXJUYWJsZUFkZHJlc3N8Z1VlZmlPdm1mUGtn
VG9rZW5TcGFjZUd1aWQuUGNkR3VpZGVkRXh0cmFjdEhhbmRsZXJUYWJsZVNpemUKPiAgCj4gKzB4
MDA4MDAwfDB4MDAxMDAwCj4gKyMgVXNlZCBieSBYZW5SZXNldFZlY3RvciB0byBjb21tdW5pY2F0
ZSB3aXRoIFhlblBsYXRmb3JtUGVpCj4gK2dVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhl
blB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHJ8Z1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVu
UHZoU3RhcnRPZkRheVN0cnVjdFB0clNpemUKPiArCj4gIDB4MDEwMDAwfDB4MDEwMDAwCj4gIGdV
ZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZTZWNQZWlUZW1wUmFtQmFzZXxnVWVmaU92
bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RPdm1mU2VjUGVpVGVtcFJhbVNpemUKPiAgCj4gZGlmZiAt
LWdpdCBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mIGIvT3ZtZlBr
Zy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5pbmYKPiBpbmRleCAwOTdmYzliNWI0Li40
NmIxMzNhODM0IDEwMDY0NAo+IC0tLSBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRW
ZWN0b3IuaW5mCj4gKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5p
bmYKPiBAQCAtMzYsMyArMzYsNiBAQCBbQnVpbGRPcHRpb25zXQo+ICBbUGNkXQo+ICAgIGdVZWZp
T3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZTZWNQYWdlVGFibGVzQmFzZQo+ICAgIGdVZWZp
T3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZTZWNQYWdlVGFibGVzU2l6ZQo+ICsKPiArICBn
VWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RYZW5QdmhTdGFydE9mRGF5U3RydWN0UHRyCj4g
KyAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVjdFB0
clNpemUKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1h
aW4uYXNtIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCj4gaW5k
ZXggMmExN2ZlZDUyZi4uZjQyZGYzZGJhMiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblJlc2V0
VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KPiArKysgYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9y
L0lhMzIvWGVuUFZITWFpbi5hc20KPiBAQCAtMjIsNiArMjIsMTIgQEAgeGVuUFZITWFpbjoKPiAg
ICAgIDsKPiAgICAgIHhvciAgICAgZXNwLCBlc3AKPiAgCj4gKyAgICA7Cj4gKyAgICA7IFN0b3Jl
ICJTdGFydCBvZiBkYXkiIHN0cnVjdCBwb2ludGVyIGZvciBsYXRlciB1c2UKPiArICAgIDsKPiAr
ICAgIG1vdiAgICAgZHdvcmRbUFZIX1NQQUNFICgwKV0sIGVieAo+ICsgICAgbW92ICAgICBkd29y
ZFtQVkhfU1BBQ0UgKDQpXSwgJ1hQVkgnCj4gKwo+ICAgICAgbW92ICAgICBlYngsIEFERFJfT0Yo
Z2R0cikKPiAgICAgIGxnZHQgICAgW2VieF0KPiAgCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVu
UmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IubmFzbWIgYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9y
L1hlblJlc2V0VmVjdG9yLm5hc21iCj4gaW5kZXggMGRiYzRmMmMxZC4uYjJjYjQwNWQ1NCAxMDA2
NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL1hlblJlc2V0VmVjdG9yLm5hc21iCj4g
KysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5uYXNtYgo+IEBAIC0z
NCw2ICszNCw4IEBACj4gIAo+ICAlaW5jbHVkZSAiQ29tbW9uTWFjcm9zLmluYyIKPiAgCj4gKyVk
ZWZpbmUgUFZIX1NQQUNFKE9mZnNldCkgKEZpeGVkUGNkR2V0MzIgKFBjZFhlblB2aFN0YXJ0T2ZE
YXlTdHJ1Y3RQdHIpICsgKE9mZnNldCkpCj4gKwo+ICAlaW5jbHVkZSAiUG9zdENvZGVzLmluYyIK
PiAgCj4gICVpZmRlZiBERUJVR19QT1JUODAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
