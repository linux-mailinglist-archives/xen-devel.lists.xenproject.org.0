Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6617E0CA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 14:09:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBI7R-0000SB-Rv; Mon, 09 Mar 2020 13:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBI7Q-0000S5-Ia
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 13:06:52 +0000
X-Inumbo-ID: d744b3c2-6206-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d744b3c2-6206-11ea-8eb5-bc764e2007e4;
 Mon, 09 Mar 2020 13:06:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7CA6AB149;
 Mon,  9 Mar 2020 13:06:50 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-2-jgross@suse.com>
 <d3b83513-8fc2-634c-fa89-00df84c5c4fb@xen.org>
 <471c2f88-2ac2-823d-546f-6fc817e34ec8@suse.com>
 <f101fc47-329c-e704-86cd-0411b6a15f99@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <daec17e3-3964-f189-6974-bdf86689f235@suse.com>
Date: Mon, 9 Mar 2020 14:06:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f101fc47-329c-e704-86cd-0411b6a15f99@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/12] xen: allow only sizeof(bool)
 variables for boolean_param()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxNDowMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwOS4wMy4yMCAx
Mjo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjAzLjIwMjAgMTI6NDMsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+IE9uIDI2LzAyLzIwMjAgMTI6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4+Pj4gQEAgLTQ2LDcgKzQ4LDggQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZXJuZWxfcGFyYW0g
X19wYXJhbV9zdGFydFtdLCBfX3BhcmFtX2VuZFtdOwo+Pj4+ICAgICAgICBfX2twYXJhbSBfX3Nl
dHVwXyMjX3ZhciA9IFwKPj4+PiAgICAgICAgICAgIHsgLm5hbWUgPSBfX3NldHVwX3N0cl8jI192
YXIsIFwKPj4+PiAgICAgICAgICAgICAgLnR5cGUgPSBPUFRfQk9PTCwgXAo+Pj4+IC0gICAgICAg
ICAgLmxlbiA9IHNpemVvZihfdmFyKSwgXAo+Pj4+ICsgICAgICAgICAgLmxlbiA9IHNpemVvZihf
dmFyKSArIFwKPj4+PiArICAgICAgICAgICAgICAgICBCVUlMRF9CVUdfT05fWkVSTyhzaXplb2Yo
X3ZhcikgIT0gc2l6ZW9mKGJvb2wpKSwgXAo+Pj4KPj4+ICAgRnJvbSBteSB1bmRlcnN0YW5kaW5n
LCBzaXplb2YoYm9vbCkgaXMgbm90IG5lY2Vzc2FyaWx5IDEgKGl0IGNhbiBiZQo+Pj4gZ3JlYXRl
cikuIFdoaWxlIHRoaXMgaXMgZmluZSB0byB1c2UgaXQgaW4gWGVuLCBJIHRoaW5rIHdlIHdhbnQg
aXQgdG8KPj4+IGFsd2F5cyBiZSBvbmUgd2hlbiBleHBvc2VkIGluIHRoZSBoeXBmcy4KPj4KPj4g
SSBkb24ndCB0aGluayBzbzogV2Ugd2FudCB2YXJpYWJsZSBvZiB0eXBlICdib29sJyB0byBiZSB1
cGRhdGVkCj4+IGNvbnNpc3RlbnRseSAoaS5lLiBieSBhIHdyaXRlIHRvIHRoZSBmdWxsIHZhcmlh
YmxlKS4gSGVuY2UgSQo+PiB0aGluayBzaXplb2YoYm9vbCkgaXMgY29ycmVjdCBoZXJlLiBJIGNh
biBzZWUgdGhvdWdoIHRoYXQgdGhlCj4+IGh5cGVyY2FsbCBpbnRlcmZhY2UgdGhlbiBnYWlucyBh
IGRlcGVuZGVuY3kgb24gdGhlIGh5cGVydmlzb3Incwo+PiByZXByZXNlbnRhdGlvbiBvZiAnYm9v
bCcsIGJ1dCBJIHRoaW5rIHN1Y2ggb3VnaHQgdG8gYmUgdGFrZW4KPj4gY2FyZSBvZiBpbiB0aGUg
ZnVuY3Rpb24gY2Fycnlpbmcgb3V0IHRoZSB3cml0ZSwgbm90IGluIHRoZQo+PiBtYWNybyBoZXJl
Lgo+IAo+IFNvIHlvdSB0aGluayBJIHNob3VsZCBzcGVjaWFsIGNhc2UgYm9vbCBlbnRyaWVzIHdo
ZW4gcmV0dXJuaW5nIHRoZQo+IHNpemUgaW5mb3JtYXRpb24/IE9yIGRvIHlvdSB0aGluayBpdHMg
ZmluZSB0byBoYXZlIHRoZSBoeXBlcnZpc29yJ3MKPiBzaXplIHJlcG9ydGVkIGFuZCBsZXQgdGhl
IGxpYiBkbyB0aGUgc2l6ZSBoYW5kbGluZyBjb3JyZWN0bHk/CgpFaXRoZXIgd2F5IHdvdWxkIGJl
IGZpbmUgYnkgbWUsIGJ1dCBJIHRoaW5rIG5vdCBoYXZpbmcgY2FsbGVycyBoYXZlCmEgKHJlcXVp
cmVkKSB3YXkgdG8ga25vdyB0aGUgaHlwZXJ2aXNvcidzIHNpemVvZihib29sKSB3b3VsZCBiZSBh
Cm1vcmUgY2xlYW4gaW50ZXJmYWNlIG92ZXJhbGwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
