Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734B9FB10
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:09:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLTOi-0005MG-Rd; Tue, 30 Apr 2019 14:06:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5V/=TA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLTOh-0005M6-V7
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:06:15 +0000
X-Inumbo-ID: 1df9b9f0-6b51-11e9-be13-a39662c84741
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1df9b9f0-6b51-11e9-be13-a39662c84741;
 Tue, 30 Apr 2019 14:06:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D411280D;
 Tue, 30 Apr 2019 07:06:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F43F3F719;
 Tue, 30 Apr 2019 07:06:13 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-135420-mainreport@xen.org>
 <23752.17186.527512.614163@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
Date: Tue, 30 Apr 2019 15:06:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23752.17186.527512.614163@mariner.uk.xensource.com>
Content-Language: en-US
Subject: [Xen-devel] qcom_scm: Incompatible pointer type build failure
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
Cc: andy.gross@linaro.org, xen-devel@lists.xenproject.org,
 linux-arm-msm@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 david.brown@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKVGhhbmsgeW91IGZvciB0aGUgcmVwb3J0LgoKT24gMzAvMDQvMjAxOSAxMzo0NCwg
SWFuIEphY2tzb24gd3JvdGU6Cj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltsaW51
eC00LjE5IHRlc3RdIDEzNTQyMDogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4+IGZsaWdodCAxMzU0
MjAgbGludXgtNC4xOSByZWFsIFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1NDIwLwo+Pgo+PiBSZWdyZXNzaW9ucyA6LSgKPj4KPj4g
VGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGlu
ZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+PiAgIGJ1aWxkLWFybWhmLXB2b3BzICAg
ICAgICAgICAgIDYga2VybmVsLWJ1aWxkICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyOTMx
Mwo+IAo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8x
MzU0MjAvYnVpbGQtYXJtaGYtcHZvcHMvNi50cy1rZXJuZWwtYnVpbGQubG9nCj4gCj4gICAgZHJp
dmVycy9maXJtd2FyZS9xY29tX3NjbS5jOiBJbiBmdW5jdGlvbiDDouKCrMuccWNvbV9zY21fYXNz
aWduX21lbcOi4oKs4oSiOgo+ICAgIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20uYzo0Njk6NDc6
IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2Ygw6LigqzLnGRtYV9hbGxvY19jb2hlcmVudMOi
4oKs4oSiIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBhdGli
bGUtcG9pbnRlci10eXBlc10KPiAgICAgIHB0ciA9IGRtYV9hbGxvY19jb2hlcmVudChfX3NjbS0+
ZGV2LCBwdHJfc3osICZwdHJfcGh5cywgR0ZQX0tFUk5FTCk7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gICAgSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20uYzoyMTowOgo+ICAgIC4vaW5jbHVkZS9saW51
eC9kbWEtbWFwcGluZy5oOjU2MDoyMTogbm90ZTogZXhwZWN0ZWQgw6LigqzLnGRtYV9hZGRyX3Qg
KiB7YWthIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQgKn3DouKCrOKEoiBidXQgYXJndW1lbnQgaXMg
b2YgdHlwZSDDouKCrMuccGh5c19hZGRyX3QgKiB7YWthIHVuc2lnbmVkIGludCAqfcOi4oKs4oSi
Cj4gICAgIHN0YXRpYyBpbmxpbmUgdm9pZCAqZG1hX2FsbG9jX2NvaGVyZW50KHN0cnVjdCBkZXZp
Y2UgKmRldiwgc2l6ZV90IHNpemUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+Cj4gICAgY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3Jz
Cj4gICAgc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozMDM6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2
ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLm8nIGZhaWxlZAo+ICAgIG1ha2VbMl06ICoqKiBbZHJpdmVy
cy9maXJtd2FyZS9xY29tX3NjbS5vXSBFcnJvciAxCj4gICAgc2NyaXB0cy9NYWtlZmlsZS5idWls
ZDo1NDQ6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2Zpcm13YXJlJyBmYWlsZWQKPiAgICBt
YWtlWzFdOiAqKiogW2RyaXZlcnMvZmlybXdhcmVdIEVycm9yIDIKPiAgICBtYWtlWzFdOiAqKiog
V2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+IAo+IEkgdGhpbmsgdGhpcyBidWlsZCBm
YWlsdXJlIGlzIHByb2JhYmx5IGEgcmVncmVzc2lvbjsgcmF0aGVyIGl0IGlzIGR1ZQo+IHRvIHRo
ZSBzdHJldGNoIHVwZGF0ZSB3aGljaCBicmluZ3MgaW4gYSBuZXcgY29tcGlsZXIuCgpUaGUgYnVn
IGhhcyBhbHdheXMgYmVlbiBwcmVzZW50IChhbmQgc3RpbGwgcHJlc2VudCBpbiBtYXN0ZXIpLCBp
dCBpcyBwb3NzaWJsZSAKdGhlIGNvbXBpbGVyIGJlY2FtZSBzbWFydGVyIHdpdGggdGhlIHVwZ3Jh
ZGUgdG8gc3RyZXRjaC4KClRoZSBwcm9ibGVtIGlzIHNpbWlsYXIgdG8gWzFdIGFuZCBoYXBwZW4g
d2hlbiB0aGUgc2l6ZSBvZiBwaHlzX2FkZHJfdCBpcyAKZGlmZmVyZW50IHRvIGRtYV9hZGRyX3Qu
CgpJIGhhdmUgQ0NlZCB0aGUgbWFpbnRhaW5lcnMgb2YgdGhpcyBmaWxlLgoKQ2hlZXJzLAoKWzFd
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wNC9tc2cwMDk0MC5odG1sCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
