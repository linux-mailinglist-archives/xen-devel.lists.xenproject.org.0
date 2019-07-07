Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D248661E3A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:16:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSWD-00017n-EA; Mon, 08 Jul 2019 12:13:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSWB-00017b-Ue
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:13:15 +0000
X-Inumbo-ID: c283dd62-a179-11e9-846a-b7e3df89a686
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c283dd62-a179-11e9-846a-b7e3df89a686;
 Mon, 08 Jul 2019 12:13:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A481B360;
 Mon,  8 Jul 2019 05:13:13 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B37D3F738;
 Mon,  8 Jul 2019 05:13:10 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>, xen-devel@lists.xenproject.org
References: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a94734d2-ea51-3ba3-917b-e7cf21ace1d0@arm.com>
Date: Sun, 7 Jul 2019 19:03:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Switch OMAP5 secondary cores
 into hyp mode
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
Cc: hy-gsoc@hy-research.com, andre.przywara@arm.com, sstabellini@kernel.org,
 tim@xen.org, drhunter95@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGVuaXMsCgpPbiA2LzI4LzE5IDg6NDIgUE0sIERlbmlzIE9icmV6a292IHdyb3RlOgo+IFRo
aXMgZnVuY3Rpb24gYWxsb3dzIHhlbiB0byBicmluZyBzZWNvbmRhcnkgQ1BVIGNvcmVzIGludG8g
bm9uLXNlY3VyZQo+IEhZUCBtb2RlLiBUaGlzIGlzIGRvbmUgYnkgdXNpbmcgYSBTZWN1cmUgTW9u
aXRvciBjYWxsLgpBcyBJIHBvaW50ZWQgb3V0IGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCB0aGUg
Y3VycmVudCBjb2RlIGlzIGxpa2VseSAKd29ya2luZyBvbiBzb21lIG9tYXA1IHBsYXRmb3JtLiBT
byB5b3VyIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBwcm92aWRlIApzb21lIGluZm9ybWF0aW9uIG9u
IHdoeSB0aGlzIGlzIG5lY2Vzc2FyeSBhbmQgb24gd2hpY2ggcGxhdGZvcm0gKGkuZSAKYmVhZ2xl
Ym9hcmQgeDE1KS4KCkl0IHdvdWxkIGJlIG5pY2UgdG8gYWxzbyBoYXZlIHN1bW1hcnkgb2Ygd2h5
IGl0IGlzIGZpbmUgdG8gZXh0ZW5kIHRvIGFsbCAKdGhlIG9tYXA1IHBsYXRmb3JtLiBGb3IgcmVt
aW5kZXIsIGJlbG93IHRoZSBhbmFseXNpcyBJIHdyb3RlIGVhcmxpZXIgb246CgpJIGFtIHRyeWlu
ZyB0byB1bmRlcnN0YW5kIGhvdyB0aGlzIGV2ZXIgd29ya2VkLiBvbWFwNV9zbXBfaW5pdCBpcyBj
YWxsZWQgCmJ5IHR3byBzZXRzIG9mIHBsYXRmb3JtcyAoYmFzZWQgb24gY29tcGF0aWJsZSk6CiAg
ICAtIHRpLGRyYTc6IHRoZXJlIHdlcmUgc29tZSBoYWNrcyBpbiBVLWJvb3QgdG8gYXZvaWQgdGhl
IFNNQy4gSWYgSSBhbSAKcmlnaHQsIHRoZW4gSSB3b3VsZCBub3QgYm90aGVyIHRvIHN1cHBvcnQg
aGFja2VkIFUtYm9vdC4KICAgIC0gdGksb21hcDU6IFsxXSBzdWdnZXN0IHRoYXQgVS1ib290IGRv
IHRoZSBzd2l0Y2ggZm9yIHVzIGJ1dCBpdCBpcyAKbm90IGNsZWFyIHdoZXRoZXIgdGhpcyBpcyB1
cHN0cmVhbWVkLiBAQ2hlbiwgSSBrbm93IHlvdSBkaWQgdGhlIHBvcnQgYSAKbG9uZyB0aW1lIGFn
by4gRG8geW91IHJlY2FsbCBob3cgdGhpcyB3b3JrZWQ/CgpMaW51eCBzZWVtcyB0byB1c2UgdGhl
IHNtYyBvbiBhbnkgZHJhNyBhbmQgb21hcDU0eHguIFNvIG1heWJlIHdlIGNhbiB1c2UgCnNhZmVs
eSBoZXJlLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEZW5pcyBPYnJlemtvdiA8ZGVuaXNvYnJlemtv
dkBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIG1vdmUgY29kZSB0byBwbGF0
Zm9ybSBzcGVjaWZpYyBmaWxlCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1
LmMgfCAxNiArKysrKysrKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRm
b3Jtcy9vbWFwNS5jIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFwNS5jCj4gaW5kZXggYWVl
MjRlNGQyOC4uNzk3NjRhNmNkNiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L29tYXA1LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1LmMKPiBAQCAtMjMs
NiArMjMsMTcgQEAKPiAgICNpbmNsdWRlIDx4ZW4vdm1hcC5oPgo+ICAgI2luY2x1ZGUgPGFzbS9p
by5oPgo+ICAgCj4gK3ZvaWQgb21hcDVfaW5pdF9zZWNvbmRhcnkodm9pZCk7Cj4gK2FzbSAoCj4g
KyAgICAgICAgIi50ZXh0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXG5cdCIKPiArICAg
ICAgICAib21hcDVfaW5pdF9zZWNvbmRhcnk6ICAgICAgICAgICAgICBcblx0Igo+ICsgICAgICAg
ICIgICAgICAgIGxkciAgIHIxMiwgPTB4MTAyICAgICAgICAgIFxuXHQiIC8qIEFQSV9IWVBfRU5U
UlkgKi8KPiArICAgICAgICAiICAgICAgICBhZHIgICByMCwgb21hcDVfaHlwICAgICAgICBcblx0
Igo+ICsgICAgICAgICIgICAgICAgIHNtYyAgICMwICAgICAgICAgICAgICAgICAgIFxuXHQiCj4g
KyAgICAgICAgIm9tYXA1X2h5cDogICAgICAgICAgICAgICAgICAgICAgICAgXG5cdCIKPiArICAg
ICAgICAiICAgICAgICBiICAgICBpbml0X3NlY29uZGFyeSAgICAgICBcblx0Igo+ICsgICAgICAg
ICk7Cj4gKwo+ICAgc3RhdGljIHVpbnQxNl90IG51bV9kZW5bOF1bMl0gPSB7Cj4gICAgICAgeyAg
ICAgICAgIDAsICAgICAgICAgIDAgfSwgIC8qIG5vdCB1c2VkICovCj4gICAgICAgeyAgMjYgKiAg
NjQsICAyNiAqICAxMjUgfSwgIC8qIDEyLjAgTWh6ICovCj4gQEAgLTEyOCw4ICsxMzksOSBAQCBz
dGF0aWMgaW50IF9faW5pdCBvbWFwNV9zbXBfaW5pdCh2b2lkKQo+ICAgICAgIH0KPiAgIAo+ICAg
ICAgIHByaW50aygiU2V0IEF1eENvcmVCb290MSB0byAlIlBSSXBhZGRyIiAoJXApXG4iLAo+IC0g
ICAgICAgICAgIF9fcGEoaW5pdF9zZWNvbmRhcnkpLCBpbml0X3NlY29uZGFyeSk7Cj4gLSAgICB3
cml0ZWwoX19wYShpbml0X3NlY29uZGFyeSksIHd1Z2VuX2Jhc2UgKyBPTUFQX0FVWF9DT1JFX0JP
T1RfMV9PRkZTRVQpOwo+ICsgICAgICAgICAgIF9fcGEob21hcDVfaW5pdF9zZWNvbmRhcnkpLCBv
bWFwNV9pbml0X3NlY29uZGFyeSk7Cj4gKyAgICB3cml0ZWwoX19wYShvbWFwNV9pbml0X3NlY29u
ZGFyeSksCj4gKyAgICAgICAgICAgd3VnZW5fYmFzZSArIE9NQVBfQVVYX0NPUkVfQk9PVF8xX09G
RlNFVCk7Cj4gICAKPiAgICAgICBwcmludGsoIlNldCBBdXhDb3JlQm9vdDAgdG8gMHgyMFxuIik7
Cj4gICAgICAgd3JpdGVsKDB4MjAsIHd1Z2VuX2Jhc2UgKyBPTUFQX0FVWF9DT1JFX0JPT1RfMF9P
RkZTRVQpOwo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
