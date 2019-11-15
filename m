Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63966FDFC7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:10:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcFo-0002XO-Dx; Fri, 15 Nov 2019 14:07:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVcFm-0002XC-Rg
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:07:14 +0000
X-Inumbo-ID: 38ae2752-07b1-11ea-a26f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ae2752-07b1-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 14:07:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 968CDAD05;
 Fri, 15 Nov 2019 14:07:12 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-10-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b30133bd-1bf0-242a-fc92-851452806ce4@suse.com>
Date: Fri, 15 Nov 2019 15:07:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191021155718.28653-10-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next v3 9/9] x86: introduce
 CONFIG_HYPERV and detection code
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
S2NvbmZpZwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4gQEAgLTE2NCw2ICsxNjQsMTUg
QEAgZW5kY2hvaWNlCj4gIGNvbmZpZyBHVUVTVAo+ICAJYm9vbAo+ICAKPiArY29uZmlnIEhZUEVS
Vl9HVUVTVAo+ICsJZGVmX2Jvb2wgbgo+ICsJc2VsZWN0IEdVRVNUCj4gKwlwcm9tcHQgIkh5cGVy
LVYgR3Vlc3QiCgpQbGVhc2UgY2FuIHlvdSBhdm9pZCBmb2xsb3dpbmcgdGhlIGJhZCBleGFtcGxl
IFhFTl9HVUVTVCBnaXZlcyAoYW5kCnBlcmhhcHMgZXZlbiB0YWtlIHRoZSBvcHBvcnR1bml0eSBo
ZXJlIG9yIGluIHRoZSBlYXJsaWVyIHBhdGNoCmFkZGluZyBHVUVTVCB0byBjaGFuZ2UgdGhhdCBv
bmUgYXMgd2VsbCk/IFdoYXQgeW91IHdhbnQgaXMKCmNvbmZpZyBIWVBFUlZfR1VFU1QKCWJvb2wg
Ikh5cGVyLVYgR3Vlc3QiCglzZWxlY3QgR1VFU1QKCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBAQCAtMCwwICsxLDU0IEBACj4gKy8q
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioKPiArICogYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
Cj4gKyAqCj4gKyAqIFN1cHBvcnQgZm9yIGRldGVjdGluZyBhbmQgcnVubmluZyB1bmRlciBIeXBl
ci1WLgo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+ICsgKiB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNl
LCBvcgo+ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ICsgKgo+ICsg
KiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhl
IGltcGxpZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQo+ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+ICsgKgo+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQo+ICsgKiBhbG9u
ZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy8+Lgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0Lgo+ICsgKi8K
PiArI2luY2x1ZGUgPHhlbi9pbml0Lmg+Cj4gKwo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4g
Kwo+ICtib29sIF9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPiArewo+ICsgICAgdWludDMyX3Qg
ZWF4LCBlYngsIGVjeCwgZWR4Owo+ICsKPiArICAgIGNwdWlkKDB4NDAwMDAwMDAsICZlYXgsICZl
YngsICZlY3gsICZlZHgpOwo+ICsgICAgaWYgKCAhKChlYnggPT0gMHg3MjYzNjk0ZCkgJiYgIC8q
ICJNaWNyIiAqLwo+ICsgICAgICAgICAgIChlY3ggPT0gMHg2NjZmNzM2ZikgJiYgIC8qICJvc29m
IiAqLwo+ICsgICAgICAgICAgIChlZHggPT0gMHg3NjQ4MjA3NCkpICkgIC8qICJ0IEh2IiAqLwo+
ICsgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAgICBjcHVpZCgweDQwMDAwMDAxLCAmZWF4
LCAmZWJ4LCAmZWN4LCAmZWR4KTsKPiArICAgIGlmICggZWF4ICE9IDB4MzEyMzc2NDggKSAgICAv
KiBIdiMxICovCj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiArICAgIHJldHVybiB0cnVl
Owo+ICt9Cj4gKwo+ICtzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgaHlwZXJ2X29wcyA9IHsKCmNvbnN0
IGFnYWluLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gKysrIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+IEBAIC00Myw2ICs0MywxNCBAQCBib29s
IGh5cGVydmlzb3JfcHJvYmUodm9pZCkKPiAgICAgIH0KPiAgI2VuZGlmCj4gIAo+ICsjaWZkZWYg
Q09ORklHX0hZUEVSVl9HVUVTVAo+ICsgICAgaWYgKCBoeXBlcnZfcHJvYmUoKSApCj4gKyAgICB7
Cj4gKyAgICAgICAgaG9wcyA9ICZoeXBlcnZfb3BzOwo+ICsgICAgICAgIHJldHVybiB0cnVlOwo+
ICsgICAgfQo+ICsjZW5kaWYKClRoaXMgcmVjdXJyaW5nICNpZmRlZiBDT05GSUdfKl9HVUVTVCBp
cyBnb2luZyB0byBzdGFydCBsb29raW5nIHVnbHkKdGhlIGxhdGVzdCB3aGVuIG9uZSBvciB0d28g
bW9yZSBnZXQgYWRkZWQuIFBlcmhhcHMgYmV0dGVyIHByb3ZpZGluZwoqX3Byb2JlKCkgc3R1YnMg
cmV0dXJuaW5nIGZhbHNlLCBhbmQgKGxpa2Ugd2UgZG8gZWxzZXdoZXJlKSByZWx5IG9uCkRDRSB0
byBnZXQgcmlkIG9mIHRoZSAqX29wcyByZWZlcmVuY2U/IChBbmQgcmVhbGx5IHlvdSBhbHJlYWR5
IGhhdmUKc3VjaCBhIHN0dWIgLSBhbGwgeW91IG5lZWQgdG8gZG8gaXMgcHV0IHRoZSBoeXBlcnZf
b3BzIGRlY2xhcmF0aW9uCm91dHNpZGUgdGhlICNpZmRlZiAoYnV0IHJlYWQgb24pLgoKQWxzbyBo
b3cgYWJvdXQgaGF2aW5nICpfcHJvYmUoKSByZXR1cm4gdGhlIGFkZHJlc3Mgb2YgKl9vcHMsIHN1
Y2gKdGhhdCB0aGUgbGF0dGVyIGNvdWxkIGFsbCBiZWNvbWUgc3RhdGljPwoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
