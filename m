Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A514CDB1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 14:26:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdw6s-0007ew-C6; Thu, 20 Jun 2019 12:24:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Q6/=UT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdw6r-0007er-9m
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 12:24:09 +0000
X-Inumbo-ID: 4c004206-9356-11e9-864d-33e4f686b111
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4c004206-9356-11e9-864d-33e4f686b111;
 Thu, 20 Jun 2019 12:24:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 299E3360;
 Thu, 20 Jun 2019 05:24:06 -0700 (PDT)
Received: from [10.37.9.222] (unknown [10.37.9.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 213343F718;
 Thu, 20 Jun 2019 05:24:04 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-4-git-send-email-andrew.cooper3@citrix.com>
 <3e5cb174-d83f-e1a1-1d6e-4e0073fa9956@arm.com>
 <5cb62752-e2a1-444e-e3e4-98b25dcfb626@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <74705f1c-d0ac-27fd-3c88-a58adfcec81d@arm.com>
Date: Thu, 20 Jun 2019 13:24:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5cb62752-e2a1-444e-e3e4-98b25dcfb626@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/link: Fold .data.read_mostly into
 .data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNi8xOS8xOSAxMDo0OCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxOS8wNi8yMDE5IDIyOjI4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDYvMTkvMTkgOTox
MSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IC5kYXRhLnJlYWRfbW9zdGx5IG9ubHkgbmVl
ZHMgc2VwYXJhdGluZyBmcm9tIGFkamFjZW50IGRhdGEgYnkgb25lCj4+PiBjYWNoZSBsaW5lCj4+
PiB0byBiZSBlZmZlY3RpdmUsIGFuZCBwbGFjaW5nIGl0IGFkamFjZW50IHRvIC5kYXRhLnBhZ2Vf
YWxpZ25lZAo+Pj4gZnVsZmlsbHMgdGhpcwo+Pj4gcmVxdWlyZW1lbnQuCj4+Pgo+Pj4gRm9yIEFS
TSwgLmV4X3RhYmxlIGFwcGVhcnMgdG8gYmUgYSB2ZXN0aWdpYWwgcmVtbmFudC7CoCBOb3RoaW5n
IGluIHRoZQo+Pj4gcmVzdWx0aW5nIGJ1aWxkIGV2ZXIgaW5zcGVjdHMgb3IgYWN0cyBvbiB0aGUg
Y29udGVudHMgb2YgdGhlIHRhYmxlLgo+Pj4gVGhlIGFybTMyCj4+PiBidWlsZCBkb2VzIGhvd2V2
ZXIgaGF2ZSBzb21lIGFzc2VtYmx5IHJvdXRpbmVzIHdoaWNoIGZpbGwgLmV4X3RhYmxlLgo+Pj4K
Pj4+IERyb3AgYWxsIG9mIEFSTSdzIC5leF90YWJsZSBpbmZyYXN0cnVjdHVyZSwgdG8gcmVkdWNl
IHRoZSBzaXplIG9mIHRoZQo+Pj4gY29tcGlsZWQKPj4+IGJpbmFyeSwgYW5kIGF2b2lkIGdpdmlu
ZyB0aGUgaWxsdXNpb24gb2YgZXhjZXB0aW9uIGhhbmRsaW5nIHdvcmtpbmcuCj4+Cj4+IEkgYW0g
bm90IGluIGZhdm9yIG9mIHRoaXMgY2hhbmdlLiBhc3NlbWJsZXIuaCBpcyBtZWFudCB0byBiZSBh
Cj4+IHZlcmJhdGltIGNvcHkgb2YgdGhlIExpbnV4IGNvdW50ZXJwYXJ0Lgo+IAo+IFdoYXQgYWx0
ZXJuYXRpdmUgZG8geW91IHByb3Bvc2UgdGhlbiwgYmVjYXVzZSBoYXZpbmcgaW5mcmFzdHJ1Y3R1
cmUgdGhhdAo+IGdpdmVzIHRoZSBpbGx1c2lvbiBvZiBleGNlcHRpb24gcmVjb3Zlcnkgd29ya2lu
ZyBpcyBhIGZhciB3b3JzZSBvcHRpb24KPiB0aGFuIGRldmlhdGluZyBmcm9tIExpbnV4LgoKSSBs
ZWFybnQgdGhlIGhhcmQgd2F5IGJlZm9yZSB0aGF0IHRyeWluZyB0byBhZGFwdCBhIExpbnV4IGZp
bGUgdG8gWGVuIAptYWtlcyB2ZXJ5IGRpZmZpY3VsdCB0byBrZWVwIHRyYWNrIHdoYXQncyBnb2lu
ZyBvbi4KClNvIG15IHByZWZlcmVuY2UgaGVyZSBpcyB0byBqdXN0IGRpc2FibGUgdGhlIHNlY3Rp
b24gaWYgdGhleSBleGlzdHMuCgo+Pgo+PiBbLi4uXQo+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4+PiBpbmRleCAyYjQ0
ZTVkLi4zZGM1MTE3IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+Pj4gQEAgLTk0LDI3ICs5NCwxMyBAQCBTRUNU
SU9OUwo+Pj4gIMKgwqDCoCBfZXJvZGF0YSA9IC47wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC8qIEVuZCBvZiByZWFkLW9ubHkgZGF0YSAqLwo+Pj4gIMKgIMKgwqDCoCAuZGF0YSA6IHvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBEYXRhICovCj4+PiArwqDC
oMKgwqDCoMKgICooLmRhdGEucmVhZF9tb3N0bHkpCj4+Cj4+IEJlZm9yZSwgLmRhdGEucmVhZF9t
b3N0bHkgd2FzIFNNUF9DQUNIRV9CWVRFUyBhbGlnbmVkLiBOb3csIGl0IHNlZW1zCj4+IHRoZXJl
IGFyZSBubyBhbGlnbm1lbnQuCj4+Cj4+IFRoaXMgbWF5IGVuZCB1cCB0byBoYXZlIF9lcm9kYXRh
IGFuZCAuZGF0YS5yZWFkX21vc3RseSB0byBiZSBwYXJ0IG9mCj4+IHRoZSBzYW1lIHBhZ2UuIEFz
IEFybSBlbmZvcmNlIHJlYWQtb25seSwgeW91IG1heSBjcmFzaCBvbiBhY2Nlc3MgdG8KPj4gLmRh
dGEucmVhZF9tb3N0bHkuCj4+Cj4+IFNvIEkgdGhpbmsgeW91IGhhdmUKPj4gLiA9IEFMSUdOKFBB
R0VfU0laRSkKPj4gKiguZGF0YS5yZWFkX21vc3RseSkKPj4gLmFsaWduKFNNUF9DQUNIRV9CWVRF
UykuCj4gCj4gVGhlc2UgYm90aCBuZWVkIHRvIGJlIFBBR0VfU0laRSwgb3IgLmRhdGEucGFnZV9h
bGlnbmVkIGNhbiBlbmQgdXAgaGF2aW5nCj4gcHJvYmxlbXMuCgpHb29kIHBvaW50LCBJIG1pc3Nl
ZCB0aGUgLmRhdGEucGFnZV9hbGlnbmVkLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
