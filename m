Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167614EE61
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:26:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXDL-0001qJ-SB; Fri, 31 Jan 2020 14:24:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixXDK-0001qD-N8
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:24:06 +0000
X-Inumbo-ID: 552c583f-4435-11ea-8bd1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 552c583f-4435-11ea-8bd1-12813bfff9fa;
 Fri, 31 Jan 2020 14:24:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 37D7FB1D4;
 Fri, 31 Jan 2020 14:24:05 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6afc369b-a93e-1512-d6ea-f9260fb83c7c@suse.com>
Date: Fri, 31 Jan 2020 15:24:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129202034.15052-9-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAyMToyMCwgV2VpIExpdSB3cm90ZToKPiBJIHRyaWVkIHVzaW5nIHRoZSBh
c20oIi5lcXUgLi4iKSB0cmljayBidXQgaGl0IGEgcHJvYmxlbSB3aXRoICVjIGFnYWluLgo+IAo+
IG1tLmM6NTczNjo1OiBlcnJvcjogaW52YWxpZCAnYXNtJzogb3BlcmFuZCBpcyBub3QgYSBjb25k
aXRpb24gY29kZSwgaW52YWxpZCBvcGVyYW5kIGNvZGUgJ2MnCj4gICAgICAgICAgICAgICAgYXNt
ICggIi5lcXUgSFZfSENBTExfUEFHRSwgJWMwOyAuZ2xvYmFsIEhWX0hDQUxMX1BBR0UiCgpXb3Vs
ZCB5b3UgbWluZCBhbHNvIGluZGljYXRpbmcgd2hhdCB0aGUgaW5wdXQgb3BlcmFuZCBhY3R1YWxs
eQp3YXM/IEFjY29yZGluZyB0byBteSBsb29raW5nIGF0IGdjYyBzb3VyY2VzIHdoZW4geW91IGZp
cnN0Cm1lbnRpb25lZCB0aGlzIChvbiBpcmMgaWlyYyksIG11Y2ggZGVwZW5kcyBvbiBpdCBhY3R1
YWxseSBiZQpyZWNvZ25pemFibGUgYXMgYSBjb25zdGFudCBieSB0aGUgY29tcGlsZXIuCgo+ICtz
dGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2FsbCh1aW50NjRfdCBjb250cm9sLCBw
YWRkcl90IGlucHV0X2FkZHIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhZGRyX3Qgb3V0cHV0X2FkZHIpCj4gK3sKPiArICAgIHVpbnQ2NF90IHN0YXR1czsKPiAr
ICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgcjggYXNtKCJyOCIpID0gb3V0cHV0X2FkZHI7CgpJ
IGd1ZXNzIHN0cmljdGx5IHNwZWFraW5nIHRoaXMgd2FudHMgdG8gYmUgYXNtICggInI4IiApLAph
bGJlaXQgSSBub3cgcmVhbGl6ZSB0aGF0IEkndmUgc2ltaWxhcmx5IG5vdCBwbGF5ZWQgYnkgc3R5
bGUKaW4gYWx0ZXJuYXRpdmVfY2FsbE4oKS4gSW4gdGhlIGVuZCBJIGd1ZXNzIC0gZWl0aGVyIHdh
eS4KCj4gKyAgICBhc20gdm9sYXRpbGUgKCAiY2FsbCBodl9oY2FsbF9wYWdlIgo+ICsgICAgICAg
ICAgICAgICAgICAgOiAiPWEiIChzdGF0dXMpLCAiK2MiIChjb250cm9sKSwKPiArICAgICAgICAg
ICAgICAgICAgICAgIitkIiAoaW5wdXRfYWRkcikgQVNNX0NBTExfQ09OU1RSQUlOVAo+ICsgICAg
ICAgICAgICAgICAgICAgOiAiciIgKHI4KQoKV2h5ICIrYyIgYW5kICIrZCIgYnV0IGp1c3QgInIi
PyBJZiByOCBnZXRzIHRyZWF0ZWQgZGlmZmVyZW50bHkKZnJvbSByY3ggYW5kIHJkeCwgcGxlYXNl
IGF0dGFjaCBhIGJyaWVmIGNvbW1lbnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
