Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA917C062
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 15:38:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAE4x-0002rX-Of; Fri, 06 Mar 2020 14:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D+BG=4X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jAE4w-0002rS-B8
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 14:35:54 +0000
X-Inumbo-ID: c8469ce2-5fb7-11ea-a7f7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8469ce2-5fb7-11ea-a7f7-12813bfff9fa;
 Fri, 06 Mar 2020 14:35:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6CF12AD5D;
 Fri,  6 Mar 2020 14:35:52 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200304063212.20843-1-jgross@suse.com>
 <20200304063212.20843-6-jgross@suse.com>
 <de613cc1-d444-7290-d96b-0d3193fce276@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0e284f2e-0da6-9dc6-9b1e-d6966a8a36e8@suse.com>
Date: Fri, 6 Mar 2020 15:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <de613cc1-d444-7290-d96b-0d3193fce276@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/rcu: add assertions to debug
 build
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAgMTQ6NDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAwNC8w
My8yMDIwIDA2OjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3JjdXBkYXRlLmggYi94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAo+PiBpbmRl
eCAzMWM4Yjg2ZDEzLi45ZjZkNDIwODk4IDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
cmN1cGRhdGUuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAo+PiBAQCAtMzQs
MTAgKzM0LDQwIEBACj4+IMKgICNpbmNsdWRlIDx4ZW4vY2FjaGUuaD4KPj4gwqAgI2luY2x1ZGUg
PHhlbi9zcGlubG9jay5oPgo+PiDCoCAjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KPj4gLSNpbmNs
dWRlIDx4ZW4vcHJlZW1wdC5oPgo+PiArI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KPj4gKyNpbmNs
dWRlIDxhc20vYXRvbWljLmg+Cj4+IMKgICNkZWZpbmUgX19yY3UKPj4gKyNpZm5kZWYgTkRFQlVH
Cj4+ICtERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCByY3VfbG9ja19jbnQpOwo+PiArCj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgcmN1X3F1aWVzY2VfZGlzYWJsZSh2b2lkKQo+PiArewo+PiAr
wqDCoMKgIHRoaXNfY3B1KHJjdV9sb2NrX2NudCkrKzsKPj4gK8KgwqDCoCBhcmNoX2xvY2tfYWNx
dWlyZV9iYXJyaWVyKCk7Cj4gCj4gSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHRoZSBnb2Fs
IG9mIHRoaXMgYmFycmllci4gV2hhdCBhcmUgeW91IAo+IHRyeWluZyB0byBwcm90ZWN0IGFnYWlu
c3Q/CgpUaGlzIGlzIHRoZSByZXN1bHQgb2YgYSByZXF1ZXN0IGJ5IFJvZ2VyLCB3aGljaCBzZWVt
ZWQgcmVhc29uYWJsZSwKYWx0aG91Z2ggSSBzaG91bGQgaGF2ZSBjaGVja2VkIHRoZSBzdWdnZXN0
ZWQgYmFycmllciB0eXBlIG1vcmUKdGhvcm91Z2hseS4KCkhlIHN1Z2dlc3RlZCB0byBhZGQgYmFy
cmllcnMgbGlrZSBpbiB0aGUgZm9ybWVyIHByZWVtcHRfW2VufGRpc11hYmxlKCkKY2FzZXMsIGJ1
dCB0byB1c2UgdGhlIGFjcXVpcmUgYW5kIHJlbGVhc2UgYmFycmllcnMgbGlrZSBpbiBsb2Nrcy4K
ClRoaW5raW5nIG1vcmUgYWJvdXQgaXQgSSB0aGluayBhIHNpbXBsZSBiYXJyaWVyKCkgc2hvdWxk
IGRvIHRoZSB0cmljayBhcwpvbmx5IGNwdSBsb2NhbCBwcm90ZWN0aW9uIGlzIG5lZWRlZC4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
