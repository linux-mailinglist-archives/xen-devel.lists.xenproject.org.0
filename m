Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FA14D756
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 09:14:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix4vv-0007bX-0K; Thu, 30 Jan 2020 08:12:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix4vt-0007bR-Jk
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 08:12:13 +0000
X-Inumbo-ID: 37fd26ec-4338-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37fd26ec-4338-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 08:12:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32280B1A5;
 Thu, 30 Jan 2020 08:12:12 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-4-liuwe@microsoft.com>
 <c714a185-ee86-c4f4-53fe-4c7f5c05a582@suse.com>
 <20200129183727.t53wphvboeurzuhk@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23bf85b0-976b-09d5-96fe-587069b25679@suse.com>
Date: Thu, 30 Jan 2020 09:12:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129183727.t53wphvboeurzuhk@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/7] x86/hyperv: provide Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxOTozNywgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAyMywgMjAy
MCBhdCAxMjoyODowMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMDEuMjAy
MCAyMToyMywgV2VpIExpdSB3cm90ZToKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmgKPj4+IEBAIC0wLDAgKzEsOTggQEAK
Pj4+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqCj4+PiArICogYXNtLXg4Ni9ndWVzdC9oeXBlcnYt
aGNhbGwuaAo+Pj4gKyAqCj4+PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgo+Pj4gKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUg
dGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYwo+Pj4gKyAqIExp
Y2Vuc2UsIHZlcnNpb24gMiwgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24uCj4+PiArICoKPj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhl
IGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPj4+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FS
UkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgo+Pj4gKyAqIE1FUkNI
QU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUg
R05VCj4+PiArICogR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+Pj4g
KyAqCj4+PiArICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljCj4+PiArICogTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYg
bm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lgo+Pj4gKyAqCj4+PiArICog
Q29weXJpZ2h0IChjKSAyMDE5IE1pY3Jvc29mdC4KPj4+ICsgKi8KPj4+ICsKPj4+ICsjaWZuZGVm
IF9fWDg2X0hZUEVSVl9IQ0FMTF9IX18KPj4+ICsjZGVmaW5lIF9fWDg2X0hZUEVSVl9IQ0FMTF9I
X18KPj4+ICsKPj4+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPgo+Pj4gKyNpbmNsdWRlIDx4ZW4vdHlw
ZXMuaD4KPj4+ICsKPj4+ICsjaW5jbHVkZSA8YXNtL2FzbV9kZWZucy5oPgo+Pj4gKyNpbmNsdWRl
IDxhc20vZml4bWFwLmg+Cj4+PiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5oPgo+
Pj4gKyNpbmNsdWRlIDxhc20vcGFnZS5oPgo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxpbmUgdWludDY0
X3QgaHZfZG9faHlwZXJjYWxsKHVpbnQ2NF90IGNvbnRyb2wsIHBhZGRyX3QgaW5wdXRfYWRkciwK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IG91dHB1
dF9hZGRyKQo+Pj4gK3sKPj4+ICsgICAgdWludDY0X3Qgc3RhdHVzOwo+Pj4gKyAgICByZWdpc3Rl
ciB1bnNpZ25lZCBsb25nIHI4IGFzbSgicjgiKSA9IG91dHB1dF9hZGRyOwo+Pj4gKwo+Pj4gKyAg
ICBhc20gdm9sYXRpbGUgKCJJTkRJUkVDVF9DQUxMICVQW2hjYWxsX3BhZ2VdIgo+Pj4gKyAgICAg
ICAgICAgICAgICAgIDogIj1hIiAoc3RhdHVzKSwgIitjIiAoY29udHJvbCksCj4+PiArICAgICAg
ICAgICAgICAgICAgICAiK2QiIChpbnB1dF9hZGRyKSBBU01fQ0FMTF9DT05TVFJBSU5UCj4+PiAr
ICAgICAgICAgICAgICAgICAgOiAiciIgKHI4KSwKPj4+ICsgICAgICAgICAgICAgICAgICAgIFto
Y2FsbF9wYWdlXSAicCIgKGZpeF94X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkKPj4+ICsg
ICAgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKPj4+ICsKPj4+ICsgICAgcmV0dXJuIHN0YXR1
czsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9kb19mYXN0X2h5
cGVyY2FsbCh1aW50MTZfdCBjb2RlLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDY0X3QgaW5wdXQxLCB1aW50NjRfdCBpbnB1dDIpCj4+PiArewo+
Pj4gKyAgICB1aW50NjRfdCBzdGF0dXM7Cj4+PiArICAgIHVpbnQ2NF90IGNvbnRyb2wgPSBjb2Rl
IHwgSFZfSFlQRVJDQUxMX0ZBU1RfQklUOwo+Pj4gKyAgICByZWdpc3RlciB1bnNpZ25lZCBsb25n
IHI4IGFzbSgicjgiKSA9IGlucHV0MjsKPj4+ICsKPj4+ICsgICAgYXNtIHZvbGF0aWxlICgiSU5E
SVJFQ1RfQ0FMTCAlUFtoY2FsbF9wYWdlXSIKPj4+ICsgICAgICAgICAgICAgICAgICA6ICI9YSIg
KHN0YXR1cyksICIrYyIgKGNvbnRyb2wpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIitkIiAo
aW5wdXQxKSBBU01fQ0FMTF9DT05TVFJBSU5UCj4+PiArICAgICAgICAgICAgICAgICAgOiAiciIg
KHI4KSwKPj4+ICsgICAgICAgICAgICAgICAgICAgIFtoY2FsbF9wYWdlXSAicCIgKGZpeF94X3Rv
X3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkKPj4+ICsgICAgICAgICAgICAgICAgICA6KTsKPj4K
Pj4gVGhpcyBjb21lcyB0aHJvdWdoIGFzIGEgc21pbGV5IGluIG15IG1haWwgdmlld2VyLCBiZWNh
dXNlIG9mIHRoZQo+PiBtaXNzaW5nIGJsYW5rcyBpbW1lZGlhdGVseSBpbnNpZGUgdGhlIG91dGVy
bW9zdCBwYXJlbnRoZXNlcy4KPiAKPiBGaXhlZC4KCkJ5IGRyb3BwaW5nIHRoZSA6LCBJIGFzc3Vt
ZT8gTXkgc3VnZ2VzdGlvbiBvZiBqdXN0IHRoZSBtaXNzaW5nIGJsYW5rCm1heSBoYXZlIGJlZW4g
bWlzbGVhZGluZyBoZXJlIChhbGJlaXQgdGhlIGJsYW5rcyBzdGlsbCBuZWVkIGFkZGluZykuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
