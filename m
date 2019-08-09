Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB6588123
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 19:27:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw8dd-0007OF-Np; Fri, 09 Aug 2019 17:25:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw8db-0007O2-EN
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 17:25:11 +0000
X-Inumbo-ID: a290bb32-baca-11e9-93cd-ef0d0608e2e6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a290bb32-baca-11e9-93cd-ef0d0608e2e6;
 Fri, 09 Aug 2019 17:25:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF8215A2;
 Fri,  9 Aug 2019 10:25:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77C753F694;
 Fri,  9 Aug 2019 10:25:07 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a7c6458b-891c-8de4-65d2-25c0ba89c73d@arm.com>
Date: Fri, 9 Aug 2019 18:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807002311.9906-3-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/6] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, JBeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNy8wOC8yMDE5IDAxOjIzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jCj4gaW5k
ZXggMjY3NGNhYTAwNS4uMDYzNTIzYzdmNyAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWN0
bC5jCj4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwo+IEBAIC05MjAsNiArOTIwLDcgQEAgbG9u
ZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3Rs
KQo+ICAgICAgICAgICB1bnNpZ25lZCBsb25nIG1mbl9lbmQgPSBtZm4gKyBucl9tZm5zIC0gMTsK
PiAgICAgICAgICAgaW50IGFkZCA9IG9wLT51Lm1lbW9yeV9tYXBwaW5nLmFkZF9tYXBwaW5nOwo+
ICAgICAgICAgICBwMm1fdHlwZV90IHAybXQ7Cj4gKyAgICAgICAgdW5zaWduZWQgaW50IG1lbW9y
eV9wb2xpY3kgPSBvcC0+dS5tZW1vcnlfbWFwcGluZy5tZW1vcnlfcG9saWN5Owo+ICAgCj4gICAg
ICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gICAgICAgICAgIGlmICggbWZuX2VuZCA8IG1mbiB8fCAv
KiB3cmFwPyAqLwo+IEBAIC05NTAsOSArOTUxLDI5IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKPiAgICAgICAgICAgaWYgKCBh
ZGQgKQo+ICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfREVCVUcK
PiAtICAgICAgICAgICAgICAgICAgICJtZW1vcnlfbWFwOmFkZDogZG9tJWQgZ2ZuPSVseCBtZm49
JWx4IG5yPSVseFxuIiwKPiAtICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgZ2ZuLCBt
Zm4sIG5yX21mbnMpOwo+ICsgICAgICAgICAgICAgICAgICAgIm1lbW9yeV9tYXA6YWRkOiBkb20l
ZCBnZm49JWx4IG1mbj0lbHggbnI9JWx4IHBvbGljeT0ldVxuIiwKPiArICAgICAgICAgICAgICAg
ICAgIGQtPmRvbWFpbl9pZCwgZ2ZuLCBtZm4sIG5yX21mbnMsIG1lbW9yeV9wb2xpY3kpOwo+ICAg
Cj4gKyAgICAgICAgICAgIHN3aXRjaCAoIG1lbW9yeV9wb2xpY3kgKQo+ICsgICAgICAgICAgICB7
Cj4gKyNpZmRlZiBDT05GSUdfQVJNCj4gKyAgICAgICAgICAgICAgICBjYXNlIE1FTU9SWV9QT0xJ
Q1lfQVJNX01FTV9XQjoKPiArICAgICAgICAgICAgICAgICAgICBwMm10ID0gcDJtX21taW9fZGly
ZWN0X2M7Cj4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgICBj
YXNlIE1FTU9SWV9QT0xJQ1lfQVJNX0RFVl9uR25SRToKPiArICAgICAgICAgICAgICAgICAgICBw
Mm10ID0gcDJtX21taW9fZGlyZWN0X2RldjsKPiArICAgICAgICAgICAgICAgICAgICBicmVhazsK
PiArI2VuZGlmCj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4gKyAgICAgICAgICAgICAgICBjYXNlIE1F
TU9SWV9QT0xJQ1lfREVGQVVMVDoKPiArICAgICAgICAgICAgICAgICAgICBwMm10ID0gcDJtX21t
aW9fZGlyZWN0Owo+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsjZW5kaWYKCkkgd291
bGQgcHJlZmVyIGlmIHRoZSBhcmNoIHNwZWNpZmljIGJpdHMgYXJlIGRvbmUgaW4gYXJjaCBjb2Rl
IGFuZCBub3QgaW4gY29tbW9uIApjb2RlLiBUaGlzIGNvdWxkIGJlIGRvbmUgaW4gYSBzZXBhcmF0
ZSBwYXRjaCBpZiB5b3UgZG9uJ3QgcGxhbiB0byByZXNwaW4gaXQuCgpUaGUgcmVzdCBsb29rcyBn
b29kIHRvIG1lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
