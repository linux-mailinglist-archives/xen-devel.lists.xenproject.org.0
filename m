Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9678286414
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:13:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvj7f-0004pQ-BG; Thu, 08 Aug 2019 14:10:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvj7e-0004pJ-9e
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:10:30 +0000
X-Inumbo-ID: 469d057c-b9e6-11e9-930c-4b6c578373b8
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 469d057c-b9e6-11e9-930c-4b6c578373b8;
 Thu, 08 Aug 2019 14:10:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDAC415A2;
 Thu,  8 Aug 2019 07:10:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 802D13F706;
 Thu,  8 Aug 2019 07:10:27 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-2-julien.grall@arm.com>
 <1adc84d1-dc16-5390-a056-e67d8eb9ab95@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d86b54ba-cf10-892b-b6a0-aa2a4f1e3a07@arm.com>
Date: Thu, 8 Aug 2019 15:10:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1adc84d1-dc16-5390-a056-e67d8eb9ab95@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen/console: Don't treat NUL
 character as the end of the buffer
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDgvMDgvMjAxOSAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUu
MDguMjAxOSAxNToyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBAQCAtMTI2MSwxNCArMTI1OSwx
NSBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+PiAgICAg
ICBBU1NFUlQoZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9ieXRlcyAtIDFdID09IDApOwo+PiAg
ICAKPj4gICAgICAgdmFfc3RhcnQoYXJncywgZm10KTsKPj4gLSAgICB2c25wcmludGYoYnVmLCBz
aXplb2YoYnVmKSwgZm10LCBhcmdzKTsKPj4gKyAgICBuciA9IHZzY25wcmludGYoYnVmLCBzaXpl
b2YoYnVmKSwgZm10LCBhcmdzKTsKPj4gICAgICAgdmFfZW5kKGFyZ3MpOwo+PiAgIAo+PiAgICAg
ICBpZiAoIGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlICkKPj4gICAgICAgewo+PiAtICAgICAg
ICBzbnByaW50ZihjbnRidWYsIHNpemVvZihjbnRidWYpLCAiJXUgIiwgKytjb3VudCk7Cj4+IC0g
ICAgICAgIHNlcmlhbF9wdXRzKHNlcmNvbl9oYW5kbGUsIGNudGJ1Zik7Cj4+IC0gICAgICAgIHNl
cmlhbF9wdXRzKHNlcmNvbl9oYW5kbGUsIGJ1Zik7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBu
ID0gc25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIiV1ICIsICsrY291bnQpOwo+IAo+
IFdoaWxlIC0gZ2l2ZW4gdGhlIHNpemUgb2YgY250YnVmIC0gdGhlIGRpZmZlcmVuY2UgaXMgbW9z
dGx5Cj4gYmVuaWduLCB5b3UgdXNpbmcgdnNjbnByaW50ZigpIGFib3ZlIGNhbGxzIGZvciB5b3Ug
YWxzbwo+IHVzaW5nIHNjbnByaW50ZigpIGhlcmUuCgpHb29kIHBvaW50LCBpdCB3b3VsZCBiZSBz
YWZlciB0b28uIEkgd2lsbCB1cGRhdGUgaXQuCgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
dmlkZW8uaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdmlkZW8uaAo+PiBAQCAtMTMsMTEgKzEz
LDExIEBACj4+ICAgCj4+ICAgI2lmZGVmIENPTkZJR19WSURFTwo+PiAgIHZvaWQgdmlkZW9faW5p
dCh2b2lkKTsKPj4gLWV4dGVybiB2b2lkICgqdmlkZW9fcHV0cykoY29uc3QgY2hhciAqKTsKPj4g
K2V4dGVybiB2b2lkICgqdmlkZW9fcHV0cykoY29uc3QgY2hhciAqLCBzaXplX3QgbnIpOwo+PiAg
IHZvaWQgdmlkZW9fZW5kYm9vdCh2b2lkKTsKPj4gICAjZWxzZQo+PiAgICNkZWZpbmUgdmlkZW9f
aW5pdCgpICAgICgodm9pZCkwKQo+PiAtI2RlZmluZSB2aWRlb19wdXRzKHMpICAgKCh2b2lkKTAp
Cj4+ICsjZGVmaW5lIHZpZGVvX3B1dHMocywgbnIpICAgKCh2b2lkKTApCj4gCj4gV2hpbGUgSSBk
b24ndCB0aGluayB0aGVyZSdzIG92ZXJseSBtdWNoIHJpc2sgb2YgInMiIGdldHRpbmcgYW4KPiBh
cmd1bWVudCB3aXRoIHNpZGUgZWZmZWN0cyBwYXNzZWQsIEkgdGhpbmsgdGhhdCBmb3IgIm5yIiB0
aGUKPiByaXNrIGlzIHRoZXJlLiBNYXkgSSBhc2sgdGhhdCB5b3UgZXZhbHVhdGUgYm90aCBoZXJl
LCBqdXN0IGluCj4gY2FzZT8KCkFyZSB5b3UgaGFwcHkgd2l0aCB0aGUgZm9sbG93aW5nIGNvZGUg
KE5vdCB5ZXQgY29tcGlsZWQhKToKCiNkZWZpbmUgdmlkZW9fcHR1cyhzLCBucikgKCh2b2lkKShz
KSwgKHZvaWQpKG5yKSkKCj4gCj4gUHJlZmVyYWJseSB3aXRoIHRoZXNlIGFkanVzdG1lbnRzCj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rIHlvdSEK
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
