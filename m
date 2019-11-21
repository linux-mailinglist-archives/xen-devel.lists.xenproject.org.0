Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C61510570E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 17:29:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpIQ-0002Ps-5G; Thu, 21 Nov 2019 16:27:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXpIO-0002Pn-Sv
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:27:04 +0000
X-Inumbo-ID: c037556c-0c7b-11ea-a33c-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c037556c-0c7b-11ea-a33c-12813bfff9fa;
 Thu, 21 Nov 2019 16:27:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t26so4419540wmi.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 08:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ewNme1Kb5+sPNOVgRmiEgEm8g8089Cgw3LLxo43xrDQ=;
 b=FAWoNMKT+K6rvLF8HgjsngATeaixDPPcfTvyRXE8wV038QbyJKdeOXmnCwhRcdO5wD
 kBeRGVxOVd6FO5dz7+zG0dyEyTaXush8/CXxhz3aPa0JQhoNKqu+auK9afp323WcTQOI
 OK9XOQlJwPAn/BccyZRWqVlxvUEAsw3sRHyDEWj/thKQY/gg0tdImSOMDQtRCsSvsLtp
 6ZjKVvaHQuiVDTD1CbNm+LTJO7WOVH00UkFwRvBSt0j+QnDzND1Hk4xpm8Jwj8KJ2gpn
 1enCV3nD7dE99ql1YifnuyIcC6URQebqiR5U94xwlDy4Fit38wTJcmI2O8z2wVUxK9Zv
 aT/w==
X-Gm-Message-State: APjAAAWGvWM4j3+iSzTqtmsdofHkajPBeP62K9oLhjHclrCkqrCq39sZ
 h53ZxNvDlJd9HJT+ZCK7VZU=
X-Google-Smtp-Source: APXvYqxhICGiI3KjAWIQm/E2UfNvBkUUU9WwtSk0a76sx6DzZCr6o/cbaezUOSYEYdsmxRWgiecYWA==
X-Received: by 2002:a05:600c:22d1:: with SMTP id
 17mr11664537wmg.31.1574353622938; 
 Thu, 21 Nov 2019 08:27:02 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id x10sm3850699wrv.60.2019.11.21.08.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 08:27:02 -0800 (PST)
Date: Thu, 21 Nov 2019 16:27:00 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121162700.hpkrjcuebdylttjm@debian>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-10-liuwe@microsoft.com>
 <b30133bd-1bf0-242a-fc92-851452806ce4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b30133bd-1bf0-242a-fc92-851452806ce4@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDM6MDc6MjlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9LY29uZmlnCj4gPiArKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gQEAgLTE2
NCw2ICsxNjQsMTUgQEAgZW5kY2hvaWNlCj4gPiAgY29uZmlnIEdVRVNUCj4gPiAgCWJvb2wKPiA+
ICAKPiA+ICtjb25maWcgSFlQRVJWX0dVRVNUCj4gPiArCWRlZl9ib29sIG4KPiA+ICsJc2VsZWN0
IEdVRVNUCj4gPiArCXByb21wdCAiSHlwZXItViBHdWVzdCIKPiAKPiBQbGVhc2UgY2FuIHlvdSBh
dm9pZCBmb2xsb3dpbmcgdGhlIGJhZCBleGFtcGxlIFhFTl9HVUVTVCBnaXZlcyAoYW5kCj4gcGVy
aGFwcyBldmVuIHRha2UgdGhlIG9wcG9ydHVuaXR5IGhlcmUgb3IgaW4gdGhlIGVhcmxpZXIgcGF0
Y2gKPiBhZGRpbmcgR1VFU1QgdG8gY2hhbmdlIHRoYXQgb25lIGFzIHdlbGwpPyBXaGF0IHlvdSB3
YW50IGlzCj4gCj4gY29uZmlnIEhZUEVSVl9HVUVTVAo+IAlib29sICJIeXBlci1WIEd1ZXN0Igo+
IAlzZWxlY3QgR1VFU1QKCkFjay4KCj4gCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiBAQCAtMCwwICsxLDU0IEBACj4gPiAr
LyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgo+ID4gKyAqIGFyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYwo+ID4gKyAqCj4gPiArICogU3VwcG9ydCBmb3IgZGV0ZWN0aW5nIGFuZCBydW5uaW5nIHVu
ZGVyIEh5cGVyLVYuCj4gPiArICoKPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+ID4gKyAqIGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVk
IGJ5Cj4gPiArICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24g
MiBvZiB0aGUgTGljZW5zZSwgb3IKPiA+ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgo+ID4gKyAqCj4gPiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4gPiArICogYnV0IFdJVEhPVVQgQU5ZIFdB
UlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiA+ICsgKiBNRVJD
SEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhl
Cj4gPiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiA+
ICsgKgo+ID4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gPiArICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElm
IG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KPiA+ICsgKgo+ID4gKyAq
IENvcHlyaWdodCAoYykgMjAxOSBNaWNyb3NvZnQuCj4gPiArICovCj4gPiArI2luY2x1ZGUgPHhl
bi9pbml0Lmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+ID4gKwo+ID4gK2Jv
b2wgX19pbml0IGh5cGVydl9wcm9iZSh2b2lkKQo+ID4gK3sKPiA+ICsgICAgdWludDMyX3QgZWF4
LCBlYngsIGVjeCwgZWR4Owo+ID4gKwo+ID4gKyAgICBjcHVpZCgweDQwMDAwMDAwLCAmZWF4LCAm
ZWJ4LCAmZWN4LCAmZWR4KTsKPiA+ICsgICAgaWYgKCAhKChlYnggPT0gMHg3MjYzNjk0ZCkgJiYg
IC8qICJNaWNyIiAqLwo+ID4gKyAgICAgICAgICAgKGVjeCA9PSAweDY2NmY3MzZmKSAmJiAgLyog
Im9zb2YiICovCj4gPiArICAgICAgICAgICAoZWR4ID09IDB4NzY0ODIwNzQpKSApICAvKiAidCBI
diIgKi8KPiA+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsKPiA+ICsgICAgY3B1aWQoMHg0
MDAwMDAwMSwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7Cj4gPiArICAgIGlmICggZWF4ICE9IDB4
MzEyMzc2NDggKSAgICAvKiBIdiMxICovCj4gPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAr
Cj4gPiArICAgIHJldHVybiB0cnVlOwo+ID4gK30KPiA+ICsKPiA+ICtzdHJ1Y3QgaHlwZXJ2aXNv
cl9vcHMgaHlwZXJ2X29wcyA9IHsKPiAKPiBjb25zdCBhZ2Fpbi4KPiAKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnZpc29yLmMKPiA+IEBAIC00Myw2ICs0MywxNCBAQCBib29sIGh5cGVydmlzb3JfcHJvYmUo
dm9pZCkKPiA+ICAgICAgfQo+ID4gICNlbmRpZgo+ID4gIAo+ID4gKyNpZmRlZiBDT05GSUdfSFlQ
RVJWX0dVRVNUCj4gPiArICAgIGlmICggaHlwZXJ2X3Byb2JlKCkgKQo+ID4gKyAgICB7Cj4gPiAr
ICAgICAgICBob3BzID0gJmh5cGVydl9vcHM7Cj4gPiArICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
ICsgICAgfQo+ID4gKyNlbmRpZgo+IAo+IFRoaXMgcmVjdXJyaW5nICNpZmRlZiBDT05GSUdfKl9H
VUVTVCBpcyBnb2luZyB0byBzdGFydCBsb29raW5nIHVnbHkKPiB0aGUgbGF0ZXN0IHdoZW4gb25l
IG9yIHR3byBtb3JlIGdldCBhZGRlZC4gUGVyaGFwcyBiZXR0ZXIgcHJvdmlkaW5nCj4gKl9wcm9i
ZSgpIHN0dWJzIHJldHVybmluZyBmYWxzZSwgYW5kIChsaWtlIHdlIGRvIGVsc2V3aGVyZSkgcmVs
eSBvbgo+IERDRSB0byBnZXQgcmlkIG9mIHRoZSAqX29wcyByZWZlcmVuY2U/IChBbmQgcmVhbGx5
IHlvdSBhbHJlYWR5IGhhdmUKPiBzdWNoIGEgc3R1YiAtIGFsbCB5b3UgbmVlZCB0byBkbyBpcyBw
dXQgdGhlIGh5cGVydl9vcHMgZGVjbGFyYXRpb24KPiBvdXRzaWRlIHRoZSAjaWZkZWYgKGJ1dCBy
ZWFkIG9uKS4KPiAKPiBBbHNvIGhvdyBhYm91dCBoYXZpbmcgKl9wcm9iZSgpIHJldHVybiB0aGUg
YWRkcmVzcyBvZiAqX29wcywgc3VjaAo+IHRoYXQgdGhlIGxhdHRlciBjb3VsZCBhbGwgYmVjb21l
IHN0YXRpYz8KClByZXZpb3VzbHkgeW91IG1hZGUgYSBzdWdnZXN0aW9uIHRvIG1ha2UgcHJvYmUg
cmV0dXJuIHRoZSBuYW1lIG9mIHRoZQpoeXBlcnZpc29yLiBIZXJlIHlvdSBhc2sgZm9yIGFkZHJl
c3Mgb2Ygb3BzLiBJIGFjdHVhbGx5IHByZWZlciB0aGUKbWV0aG9kIHN1Z2dlc3RlZCBoZXJlLCBi
dXQgdGhpcyBtZWFucyBJIHdpbGwgbmVlZCB0byBrZWVwCmh5cGVydmlzb3JfbmFtZSBhcm91bmQu
CgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
