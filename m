Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760BE13AF55
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:28:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irP0F-0003kl-MC; Tue, 14 Jan 2020 16:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irP0D-0003kg-Ti
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:25:13 +0000
X-Inumbo-ID: 6bd75302-36ea-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd75302-36ea-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 16:25:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 61F35AEC4;
 Tue, 14 Jan 2020 16:25:04 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3ed87ff-5142-5105-2c6f-97a185d0b8e9@suse.com>
Date: Tue, 14 Jan 2020 17:25:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113175020.32730-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] x86/page: Remove bifurcated
 PAGE_HYPERVISOR constant
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxODo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEZXNwaXRlIGJlaW5n
IHZhZ3VlbHkgYXdhcmUsIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gUEFHRV9IWVBFUlZJU09SIGlu
IEFTTSBhbmQKPiBDIGNvZGUgaGFzIG5ldmVydGhlbGVzcyBjYXVzZWQgc2V2ZXJhbCBidWdzIEkg
c2hvdWxkIGhhdmUga25vd24gYmV0dGVyIGFib3V0LAo+IGFuZCBjb250cmlidXRlZCB0byByZXZp
ZXcgY29uZnVzaW9uLgo+IAo+IFRoZXJlIGFyZSBleGFjdGx5IDQgdXNlcyBvZiB0aGVzZSBjb25z
dGFudHMgaW4gYXNtIGNvZGUgKGFuZCBvbmUgaXMgc2hvcnRseQo+IGdvaW5nIHRvIGRpc2FwcGVh
cikuCj4gCj4gSW5zdGVhZCBvZiBjcmVhdGluZyB0aGUgY29uc3RhbnRzIHdoaWNoIGJlaGF2ZSBk
aWZmZXJlbnRseSBiZXR3ZWVuIEFTTSBhbmQgQwo+IGNvZGUsIGV4cG9zZSBhbGwgdGhlIGNvbnN0
YW50cyBhbmQgdXNlIG5vbi1hbWJpZ3VvdXMgbm9uLU5YIG9uZXMgaW4gQVNNLgoKSSdtIG9rYXkg
d2l0aCB0aGlzIGluIHByaW5jaXBsZSwgYnV0IC4uLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L3g4Nl82NC9wYWdlLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3g4Nl82NC9wYWdl
LmgKPiBAQCAtMTcyLDE4ICsxNzIsMTEgQEAgc3RhdGljIGlubGluZSBpbnRwdGVfdCBwdXRfcHRl
X2ZsYWdzKHVuc2lnbmVkIGludCB4KQo+ICAjZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9SWCAgICAg
IChfX1BBR0VfSFlQRVJWSVNPUl9SWCAgICAgIHwgX1BBR0VfR0xPQkFMKQo+ICAjZGVmaW5lIFBB
R0VfSFlQRVJWSVNPUl9SV1ggICAgIChfX1BBR0VfSFlQRVJWSVNPUiAgICAgICAgIHwgX1BBR0Vf
R0xPQkFMKQo+ICAKPiAtI2lmZGVmIF9fQVNTRU1CTFlfXwo+IC0vKiBEZXBlbmRlbmN5IG9uIE5Y
IGJlaW5nIGF2YWlsYWJsZSBjYW4ndCBiZSBleHByZXNzZWQuICovCj4gLSMgZGVmaW5lIFBBR0Vf
SFlQRVJWSVNPUiAgICAgICAgIFBBR0VfSFlQRVJWSVNPUl9SV1gKPiAtIyBkZWZpbmUgUEFHRV9I
WVBFUlZJU09SX1VDTUlOVVMgKF9fUEFHRV9IWVBFUlZJU09SX1VDTUlOVVMgfCBfUEFHRV9HTE9C
QUwpCj4gLSMgZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9VQyAgICAgIChfX1BBR0VfSFlQRVJWSVNP
Ul9VQyAgICAgIHwgX1BBR0VfR0xPQkFMKQo+IC0jZWxzZQo+ICAjIGRlZmluZSBQQUdFX0hZUEVS
VklTT1IgICAgICAgICBQQUdFX0hZUEVSVklTT1JfUlcKPiAgIyBkZWZpbmUgUEFHRV9IWVBFUlZJ
U09SX1VDTUlOVVMgKF9fUEFHRV9IWVBFUlZJU09SX1VDTUlOVVMgfCBcCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBfUEFHRV9HTE9CQUwgfCBfUEFHRV9OWCkKPiAgIyBkZWZp
bmUgUEFHRV9IWVBFUlZJU09SX1VDICAgICAgKF9fUEFHRV9IWVBFUlZJU09SX1VDIHwgXAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX1BBR0VfR0xPQkFMIHwgX1BBR0VfTlgp
CgouLi4gSSdtIGFmcmFpZCB0aGUgYXNzZW1ibGVyIGVycm9yIHJlc3VsdGluZyBmcm9tIHNvbWVv
bmUgYWN0dWFsbHkKKGFuZCBtaXN0YWtlbmx5KSB1c2luZyBvbmUgb2YgdGhlIGNvbnN0YW50cyBt
YWtpbmcgdXNlIG9mIF9QQUdFX05YCmlzIGdvaW5nIHRvIGJlIHJhdGhlciBjcnlwdGljLiBXaGlj
aCBpbiB0dXJuIG1heSBtb3RpdmF0ZSBwZW9wbGUKdG8gYWN0dWFsbHkgdHJ5IHRvIG1ha2UgX1BB
R0VfTlggIndvcmsiIGluIGFzc2VtYmx5IGNvZGUuIFRoZXJlZm9yZQpJJ2QgbGlrZSB0byBhc2sg
dGhhdCB0b2dldGhlciB3aXRoIHRoZSBjaGFuZ2VzIGhlcmUgX1BBR0VfTlgncwojZGVmaW5lIGJl
IGZyYW1lZCBieSAjaWZuZGVmIF9fQVNTRU1CTFlfXywgc3VjaCB0aGF0IGFueQpkaWFnbm9zdGlj
LCBpZiBpdCBtZW50aW9ucyBhIHN5bWJvbCBuYW1lLCB3b3VsZCBuYW1lIHRoZSBhY3R1YWwKcHJv
YmxlbSwgcmF0aGVyIHRoYW4gYSBkZXJpdmVkIG9uZS4KCkZ1cnRoZXJtb3JlIGZyb20gYSBzdHls
ZSBwZXJzcGVjdGl2ZSB0aGUgYmxhbmtzIGJldHdlZW4gIyBhbmQKImRlZmluZSIgd2lsbCBhbHNv
IHdhbnQgdG8gZ28gYXdheSBub3cuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
