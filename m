Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377CFAD462
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:02:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Ea0-0007n9-EO; Mon, 09 Sep 2019 07:59:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7EZy-0007mx-Dc
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 07:59:18 +0000
X-Inumbo-ID: b8cf1cac-d2d7-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8cf1cac-d2d7-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 07:59:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B1267B049;
 Mon,  9 Sep 2019 07:59:16 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8872a67c-0927-7a3a-3029-21e666cae858@suse.com>
Date: Mon, 9 Sep 2019 09:59:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909073557.16168-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 4/5] xen: add per-cpu buffer option to
 debugtrace
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAwOTozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBkZWJ1Z3RyYWNlIGlz
IG5vcm1hbGx5IHdyaXRpbmcgdHJhY2UgZW50cmllcyBpbnRvIGEgc2luZ2xlIHRyYWNlCj4gYnVm
ZmVyLiBUaGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhpcyBpcyBub3Qgb3B0aW1hbCwgZS5nLiB3aGVu
IGh1bnRpbmcKPiBhIGJ1ZyB3aGljaCByZXF1aXJlcyB3cml0aW5nIGxvdHMgb2YgdHJhY2UgZW50
cmllcyBhbmQgb25lIGNwdSBpcwo+IHN0dWNrLiBUaGlzIHdpbGwgcmVzdWx0IGluIG90aGVyIGNw
dXMgZmlsbGluZyB0aGUgdHJhY2UgYnVmZmVyIGFuZAo+IGZpbmFsbHkgb3ZlcndyaXRpbmcgdGhl
IGludGVyZXN0aW5nIHRyYWNlIGVudHJpZXMgb2YgdGhlIGhhbmdpbmcgY3B1Lgo+IAo+IEluIG9y
ZGVyIHRvIGJlIGFibGUgdG8gZGVidWcgc3VjaCBzaXR1YXRpb25zIGFkZCB0aGUgY2FwYWJpbGl0
eSB0byB1c2UKPiBwZXItY3B1IHRyYWNlIGJ1ZmZlcnMuIFRoaXMgY2FuIGJlIHNlbGVjdGVkIGJ5
IHNwZWNpZnlpbmcgdGhlCj4gZGVidWd0cmFjZSBib290IHBhcmFtZXRlciB3aXRoIHRoZSBtb2Rp
ZmllciAiY3B1OiIsIGxpa2U6Cj4gCj4gICBkZWJ1Z3RyYWNlPWNwdToxNgo+IAo+IEF0IHRoZSBz
YW1lIHRpbWUgc3dpdGNoIHRoZSBwYXJzaW5nIGZ1bmN0aW9uIHRvIGFjY2VwdCBzaXplIG1vZGlm
aWVycwo+IChlLmcuIDRNIG9yIDFHKS4KPiAKPiBQcmludGluZyBvdXQgdGhlIHRyYWNlIGVudHJp
ZXMgaXMgZG9uZSBmb3IgZWFjaCBidWZmZXIgaW4gb3JkZXIgdG8KPiBtaW5pbWl6ZSB0aGUgZWZm
b3J0IG5lZWRlZCBkdXJpbmcgcHJpbnRpbmcuIEFzIGVhY2ggZW50cnkgaXMgcHJlZml4ZWQKPiB3
aXRoIGl0cyBzZXF1ZW5jZSBudW1iZXIgc29ydGluZyB0aGUgZW50cmllcyBjYW4gZWFzaWx5IGJl
IGRvbmUgd2hlbgo+IGFuYWx5emluZyB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CnBlcmhhcHMgd2l0aCAuLi4KCj4gQEAgLTIzLDM1ICsyNCw3OSBAQCBzdHJ1
Y3QgZGVidWd0cmFjZV9kYXRhIHsKPiAgfTsKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgZGVidWd0cmFj
ZV9kYXRhICpkdF9kYXRhOwo+ICtzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGRlYnVndHJh
Y2VfZGF0YSAqLCBkdF9jcHVfZGF0YSk7Cj4gIAo+IC1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVn
dHJhY2Vfa2lsb2J5dGVzID0gMTI4Owo+IC1zdGF0aWMgdW5zaWduZWQgbG9uZyBkZWJ1Z3RyYWNl
X2J5dGVzOwo+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBkZWJ1Z3RyYWNlX2J5dGVzID0gMTI4IDw8
IDEwOwo+ICtzdGF0aWMgYm9vbCBkZWJ1Z3RyYWNlX3Blcl9jcHU7CgouLi4gdHdvIG1vcmUgX19y
ZWFkX21vc3RseSB1c2VkIGhlcmUgKHdoaWNoIGNvdWxkIGFnYWluIGJlIGRvbmUKd2hpbGUgY29t
bWl0dGluZyBpZiB5b3UgYWdyZWUpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
