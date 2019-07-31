Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7617C473
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 16:12:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hspIK-0007q5-Cz; Wed, 31 Jul 2019 14:09:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hspII-0007py-9x
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 14:09:30 +0000
X-Inumbo-ID: cfd1835a-b39c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id cfd1835a-b39c-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 14:09:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56419344;
 Wed, 31 Jul 2019 07:09:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A33BC3F694;
 Wed, 31 Jul 2019 07:09:28 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <20190731102856.23215-2-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <79a73d90-b058-9975-f1e9-ab9b372cc250@arm.com>
Date: Wed, 31 Jul 2019 15:09:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731102856.23215-2-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/2] xen/arm: merge make_timer_node and
 make_timer_domU_node
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpOSVQ6IHMvbWVyZ2UvY29uc29saWRhdGUvCgpPbiAzMS8wNy8yMDE5IDExOjI4LCBWaWt0
b3IgTWl0aW4gd3JvdGU6Cj4gTWVyZ2VkIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9k
b21VX25vZGUgaW50byBvbmUgZnVuY3Rpb24KPiBtYWtlX3RpbWVyX25vZGUuCj4gCj4gS2VwdCB0
aGUgZG9tVSB2ZXJzaW9uIGZvciB0aGUgY29tcGF0aWJsZSBhcyBpdCBpcyBzaW1wbGVyLgo+IEtl
cHQgdGhlIGh3IHZlcnNpb24gZm9yIHRoZSBjbG9jayBhcyBpdCBpcyByZWxldmFudCBmb3IgdGhl
IGJvdGggY2FzZXMuCgpUaGUgY29tbWl0IG1lc3NhZ2UgbmVlZHMgYSBiaXQgb2YgcmV3b3JkaW5n
OgogIC0gSXQgaXMgbm90IGNsZWFyIHdoeSB0aGV5IHRoZSB0d28gZnVuY3Rpb25zIGFyZSBtZXJn
ZWQKICAtIFRoaXMgbmVlZHMgbW9yZSB3b3JkIGFyb3VuZCBzbyB0aGUgY29tbWl0IG1lc3NhZ2Ug
bG9va3MgbGlrZSBhIGNvaGVyZW50IHRleHQuCgo+IAo+IFN1Z2dlc3RlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgTWl0aW4g
PHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPiAtLS0KPiB2NCB1cGRhdGVzOgo+ICAgICB1cGRhdGVk
ICJLZXB0IHRoZSBkb21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRpYmxlIGFzIGl0IGlzIHNpbXBs
ZXIiCj4gCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxMDkgKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9u
cygrKSwgNzAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IGQwNGExYzNh
ZWMuLjRkN2MzNDExYTYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTk2NCw4ICs5NjQsMTIg
QEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9naWNfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpk
LCB2b2lkICpmZHQsCj4gICAKPiAgIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShj
b25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+ICAgewo+ICsgICAgaW50IHJlczsKPiAg
ICAgICB2b2lkICpmZHQgPSBraW5mby0+ZmR0Owo+IC0KClBsZWFzZSBhdm9pZCB0byBhZGQgY29k
ZSB0aGF0IHlvdSBkcm9wIGluIGEgcGF0Y2ggbGF0ZXIuCgo+ICsgICAgdW5zaWduZWQgaW50IGly
cVtNQVhfVElNRVJfUFBJXTsKPiArICAgIGdpY19pbnRlcnJ1cHRfdCBpbnRyc1szXTsKPiArICAg
IHUzMiBjbG9ja19mcmVxdWVuY3k7Cj4gKyAgICBib29sIGNsb2NrX3ZhbGlkOwoKVGhpcyBpcyBu
b3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoIGFuZCBvbmx5IGluY3JlYXNlIHRoZSBjb21wbGV4aXR5
IG9mIHRoZSAKcmV2aWV3LiBJZiB5b3Ugd2FudCB0byBkbyByZXNodWZmbGluZyB0aGVuIGl0IHNo
b3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgoKQnV0IHRoZW4sIEkgc2VlIHlvdSByZWFsIHZhbHVl
IG9mIHRoZSByZS1vcmRlcmluZyBoZXJlLgoKPiAgICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0
X2RldmljZV9tYXRjaCB0aW1lcl9pZHNbXSBfX2luaXRjb25zdCA9Cj4gICAgICAgewo+ICAgICAg
ICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJhcm0sYXJtdjctdGltZXIiKSwKPiBAQCAtOTczLDE1
ICs5NzcsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0
IGtlcm5lbF9pbmZvICpraW5mbykKPiAgICAgICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAo+ICAg
ICAgIH07Cj4gICAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXY7Cj4gLSAgICB1MzIgbGVu
Owo+IC0gICAgY29uc3Qgdm9pZCAqY29tcGF0aWJsZTsKPiAtICAgIGludCByZXM7Cj4gLSAgICB1
bnNpZ25lZCBpbnQgaXJxOwo+IC0gICAgZ2ljX2ludGVycnVwdF90IGludHJzWzNdOwo+IC0gICAg
dTMyIGNsb2NrX2ZyZXF1ZW5jeTsKPiAtICAgIGJvb2wgY2xvY2tfdmFsaWQ7Cj4gLQo+IC0gICAg
ZHRfZHByaW50aygiQ3JlYXRlIHRpbWVyIG5vZGVcbiIpOwoKV2h5IGlzIGl0IGRyb3BwZWQ/CgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
