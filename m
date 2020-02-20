Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB41659A3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:53:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hWb-0006VT-5w; Thu, 20 Feb 2020 08:49:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4hWZ-0006VO-CP
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:49:35 +0000
X-Inumbo-ID: eab7c95a-53bd-11ea-84e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eab7c95a-53bd-11ea-84e8-12813bfff9fa;
 Thu, 20 Feb 2020 08:49:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34501B028;
 Thu, 20 Feb 2020 08:49:33 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-9-jgross@suse.com>
 <28a1b6e6-2d55-999a-ff23-caae5d0e8c08@suse.com>
 <7f14b966-2494-870a-b35c-23ea44e9989b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f398a33-30a7-aa98-0981-1a9f7dd2884e@suse.com>
Date: Thu, 20 Feb 2020 09:49:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7f14b966-2494-870a-b35c-23ea44e9989b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 8/8] xen: add runtime parameter access
 support to hypfs
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAwOToyMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxOS4wMi4yMCAx
Nzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjAgMDk6MTEsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4+PiArKysgYi94
ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4+PiBAQCAtODksNiArODksMTEgQEAgU0VDVElPTlMKPj4+
ICAgICAgICAgIF9fc3RhcnRfc2NoZWR1bGVyc19hcnJheSA9IC47Cj4+PiAgICAgICAgICAqKC5k
YXRhLnNjaGVkdWxlcnMpCj4+PiAgICAgICAgICBfX2VuZF9zY2hlZHVsZXJzX2FycmF5ID0gLjsK
Pj4+ICsKPj4+ICsgICAgICAgLiA9IEFMSUdOKDgpOwo+Pj4gKyAgICAgICBfX3BhcmFtaHlwZnNf
c3RhcnQgPSAuOwo+Pj4gKyAgICAgICAqKC5kYXRhLnBhcmFtaHlwZnMpCj4+PiArICAgICAgIF9f
cGFyYW1oeXBmc19lbmQgPSAuOwo+Pgo+PiBEbyB5b3UgcmVhbGx5IG5lZWQgOC1ieXRlIGFsaWdu
bWVudCBldmVuIG9uIDMyLWJpdCBBcm0/Cj4gCj4gSSBqdXN0IGZvbGxvd2VkIHRoZSBnZW5lcmFs
IHBhdHRlcm4gaW4gdGhpcyBmaWxlLgoKV2VsbCwgaXQnbGwgYmUgdGhlIEFybSBtYWludGFpbmVy
cyB0byBqdWRnZSBhbnl3YXkuIEl0IG1lcmVseQpjYXVnaHQgbXkgZXllLgoKPj4+IEBAIC05OSwy
OCArMTAxLDMzIEBAIHN0YXRpYyBpbnQgcGFyc2VfZ250dGFiX2xpbWl0KGNvbnN0IGNoYXIgKnBh
cmFtLCBjb25zdCBjaGFyICphcmcsCj4+PiAgICAgICAgICAgcmV0dXJuIC1FUkFOR0U7Cj4+PiAg
IAo+Pj4gICAgICAgKnZhbHAgPSB2YWw7Cj4+PiArICAgIHNucHJpbnRmKHBhcl92YWwsIFBBUl9W
QUxfU1osICIlbHUiLCB2YWwpOwo+Pj4gICAKPj4+ICAgICAgIHJldHVybiAwOwo+Pj4gICB9Cj4+
PiAgIAo+Pj4gICB1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBvcHRfbWF4X2dyYW50X2ZyYW1l
cyA9IDY0Owo+Pj4gK3N0YXRpYyBjaGFyIGdudHRhYl9tYXhfZnJhbWVzX3ZhbFtQQVJfVkFMX1Na
XSA9ICI2NCI7Cj4+Cj4+IFRoaXMgYW5kIHRoZSBvdGhlciBvcHRpb24gYXJlIHBsYWluIGludGVn
ZXIgb25lcyBmcm9tIGEgcHJlc2VudGF0aW9uCj4+IHBvdiwgc28gaXQgd291bGQgYmUgbmljZSB0
byBnZXQgYXdheSBoZXJlIHdpdGhvdXQgdGhlIGV4dHJhIGJ1ZmZlcnMuCj4gCj4gVGhlcmUgaXMg
bW9yZSB0aGFuIHB1cmUgaW50ZWdlciBzZW1hbnRpY3MgaGVyZTogdGhlIHZhbHVlIGlzIGxpbWl0
ZWQsCj4gc28gSSBjYW4ndCBqdXN0IHVzZSB0aGUgbm9ybWFsIGludGVnZXIgYXNzaWdubWVudC4K
CldoaWNoIGlzIHdoeSBJJ3ZlIHNhaWQgImZyb20gYSBwcmVzZW50YXRpb24gcG92IiwgaS5lLiB3
aGVuIGNvbnN1bWluZwp0aGUgdmFsdWUgZm9yIHBhc3NpbmcgYmFjayBhcyBhIHN0cmluZy4KCj4g
SXRzIG5vdCBhcyBpZiB0aG9zZSBmdW5jdGlvbnMgYXJlIHBlcmZvcm1hbmNlIGNyaXRpY2FsLCBh
bmQgc3BlY2lhbAo+IGNhc2luZyBmb3Igc3BhcmluZyB0aGUgYnVmZmVyIG1lbW9yeSB3aWxsIHBy
b2JhYmx5IHdhc3RlIG1vcmUgbWVtb3J5Cj4gZHVlIHRvIGxhcmdlciBjb2RlIHNpemUuCgpXZWxs
LCBpdCdzIG5vdCBzbyBtdWNoIHRoZSBtZW1vcnkgc2F2aW5ncywgYnV0IHRoZSByZWR1Y3Rpb24g
b2YKcmVkdW5kYW50IGluZm9ybWF0aW9uIGJlaW5nIGtlcHQuIEJ1dCBpZiBpdCdzIG5vdCBzdWZm
aWNpZW50bHkgc2ltcGxlCnRvIGdlbmVyYWxpemUsIHNvIGJlIGl0IHRoZW4uCgo+Pj4gQEAgLTIz
LDEwICsyNCwxNyBAQCBzdHJ1Y3Qga2VybmVsX3BhcmFtIHsKPj4+ICAgICAgIH0gcGFyOwo+Pj4g
ICB9Owo+Pj4gICAKPj4+ICtzdHJ1Y3QgcGFyYW1faHlwZnMgewo+Pj4gKyAgICBjb25zdCBzdHJ1
Y3Qga2VybmVsX3BhcmFtICpwYXJhbTsKPj4KPj4gQXMgbG9uZyBhcyB0aGlzIGlzIGhlcmUsIEkg
ZG9uJ3QgdGhpbmsgLi4uCj4+Cj4+PiBAQCAtNzYsNDAgKzg0LDg3IEBAIGV4dGVybiBjb25zdCBz
dHJ1Y3Qga2VybmVsX3BhcmFtIF9fcGFyYW1fc3RhcnRbXSwgX19wYXJhbV9lbmRbXTsKPj4+ICAg
ICAgICAgICAgIC50eXBlID0gT1BUX0lHTk9SRSB9Cj4+PiAgIAo+Pj4gICAjZGVmaW5lIF9fcnRw
YXJhbSAgICAgICAgIF9fcGFyYW0oX19kYXRhcGFyYW0pCj4+PiArI2RlZmluZSBfX3BhcmFtZnMg
ICAgICAgICBzdGF0aWMgX19wYXJhbWh5cGZzIFwKPj4+ICsgICAgX19hdHRyaWJ1dGVfXygoX19h
bGlnbmVkX18oc2l6ZW9mKHZvaWQgKikpKSkgc3RydWN0IHBhcmFtX2h5cGZzCj4+Cj4+IC4uLiB5
b3UgbmVlZCB0aGUgYWxpZ25tZW50IGF0dHJpYnV0ZSBoZXJlLiBCdXQgc2VlIGJlbG93Lgo+Pgo+
Pj4gLSNkZWZpbmUgY3VzdG9tX3J1bnRpbWVfb25seV9wYXJhbShfbmFtZSwgX3ZhcikgXAo+Pj4g
KyNkZWZpbmUgY3VzdG9tX3J1bnRpbWVfb25seV9wYXJhbShfbmFtZSwgX3ZhciwgY29udHZhcikg
XAo+Pj4gICAgICAgX19ydHBhcmFtIF9fcnRwYXJfIyNfdmFyID0gXAo+Pj4gICAgICAgICB7IC5u
YW1lID0gX25hbWUsIFwKPj4+ICAgICAgICAgICAgIC50eXBlID0gT1BUX0NVU1RPTSwgXAo+Pj4g
LSAgICAgICAgICAucGFyLmZ1bmMgPSBfdmFyIH0KPj4+ICsgICAgICAgICAgLnBhci5mdW5jID0g
X3ZhciB9OyBcCj4+PiArICAgIF9fcGFyYW1mcyBfX3BhcmZzXyMjX3ZhciA9IFwKPj4+ICsgICAg
ICAgIHsgLnBhcmFtID0gJl9fcnRwYXJfIyNfdmFyLCBcCj4+Cj4+IEluc3RlYWQgb2YgYSBwb2lu
dGVyLCBjYW4ndCB0aGUgcGFyYW0gc3RydWN0IGJlIHBhcnQgb2YgdGhpcwo+PiBiaWdnZXIgc3Ry
dWN0dXJlPwo+IAo+IEkgaGF2ZSBzb21lIGZ1cnRoZXIgcGF0Y2hlcyBpbiBteSBwaXBlbGluZSB3
aGljaCB3aWxsIGRvIGV2ZW4gbW9yZSwKPiBieSByZW1vdmluZyB0aGUgc3lzY3RsIGZvciBzZXR0
aW5nIHBhcmFtZXRlcnMgYW5kIHVzaW5nIGh5cGZzIGZvcgo+IHRoYXQgcHVycG9zZSBpbiBsaWJ4
bC4gVGhpcyB3aWxsIHJlbW92ZSB0aGUgbmVlZCBmb3IgdGhlIHJ1bnRpbWUKPiBjb3B5IG9mIHN0
cnVjdCBrZXJuZWxfcGFyYW0gY29tcGxldGVseS4KCkFoLCBnb29kIHRvIGtub3cuIFdoaWxlIHJl
dmlld2luZyB0aGlzIEkgd2FzIHdvbmRlcmluZyBhYm91dCBleGFjdGx5CnRoaXMuCgo+IEJ1dCBy
Cgo/Pz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
