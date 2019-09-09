Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1DBAD655
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:07:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7GXt-0001Gh-LO; Mon, 09 Sep 2019 10:05:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7GXs-0001Gb-Cg
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:05:16 +0000
X-Inumbo-ID: 51856f94-d2e9-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51856f94-d2e9-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 10:05:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65021ABE3;
 Mon,  9 Sep 2019 10:05:14 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190909092506.24792-1-jgross@suse.com>
 <20190909092506.24792-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74f4e23a-e306-8372-e55d-dd361fd29e72@suse.com>
Date: Mon, 9 Sep 2019 12:05:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909092506.24792-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 4/5] xen: add per-cpu buffer option to
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

T24gMDkuMDkuMjAxOSAxMToyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBkZWJ1Z3RyYWNlIGlz
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
Y2hAc3VzZS5jb20+CmFsYmVpdCBwcmVmZXJhYmx5IHdpdGggdGhlIF9fcmVhZF9tb3N0bHkgYWRk
ZWQgYXMgaW5kaWNhdGVkIGluCnJlcGx5IHRvIHY2IChjYW4gc3RpbGwgYmUgZG9uZSB3aGlsZSBj
b21taXR0aW5nKS4KCj4gLS0tCj4gVjI6Cj4gLSBvbmx5IGFsbG9jYXRlIGJ1ZmZlciBpZiBub3Qg
YWxyZWFkeSBkb25lIHNvCj4gVjQ6Cj4gLSB1bnNpZ25lZCBpbnQgLT4gdW5zaWduZWQgbG9uZyAo
SmFuIEJldWxpY2gpCj4gLSByZXBsYWNlIGNoZWNrIGZvciBieXRlcyA8IFBBR0VfU0laRSBieSAh
Ynl0ZXMgKEphbiBCZXVsaWNoKQo+IC0gcHJpbnQgaW5mbyB3aGljaCBidWZmZXIgYWxsb2NhdGlv
biBmYWlsZWQgKEphbiBCZXVsaWNoKQo+IC0gcmVwbGFjZSBzd2l0Y2ggYnkgaWYgaW4gY3B1IG5v
dGlmaWVyIGhhbmRsZXIgKEphbiBCZXVsaWNoKQo+IFY1Ogo+IC0gZG9uJ3Qgc2lsZW50bHkgaWdu
b3JlIHRyYWlsaW5nIGNoYXJhY3RlcnMgd2hlbiBwYXJzaW5nIGJ1ZmZlciBzaXplCj4gICAoSmFu
IEJldWxpY2gpCj4gLSBsaW1pdCBzY29wZSBvZiBzb21lIHZhcmlhYmxlcyAoSmFuIEJldWxpY2gp
Cj4gLSBhZGp1c3QgZXJyb3IgbWVzc2FnZSBmb3JtYXQgKEphbiBCZXVsaWNoKQo+IFY2Ogo+IC0g
bW92ZSBjYWxjdWxhdGlvbiBvZiBmaW5hbCBkZWJ1Z3RyYWNlX2J5dGVzIHZhbHVlIHRvIHBhcmFt
ZXRlciBwYXJzaW5nCgpWNzogLi4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
