Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6C1528C3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:00:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHR0-0001UN-2O; Wed, 05 Feb 2020 09:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHQx-0001UI-VV
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:57:23 +0000
X-Inumbo-ID: e7887b56-47fd-11ea-90b4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7887b56-47fd-11ea-90b4-12813bfff9fa;
 Wed, 05 Feb 2020 09:57:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9285AC92;
 Wed,  5 Feb 2020 09:57:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89901b01-ba20-e099-cf06-a047abc88761@suse.com>
Date: Wed, 5 Feb 2020 10:57:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203144340.4614-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] AMD/IOMMU: Delete iommu_{get, set,
 clear}_bit() helpers
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

T24gMDMuMDIuMjAyMCAxNTo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtODUsMTYgKzg1
LDE0IEBAIHN0YXRpYyB2b2lkIGZsdXNoX2NvbW1hbmRfYnVmZmVyKHN0cnVjdCBhbWRfaW9tbXUg
KmlvbW11KQo+ICAgICAgbG9vcF9jb3VudCA9IDEwMDA7Cj4gICAgICBkbyB7Cj4gICAgICAgICAg
c3RhdHVzID0gcmVhZGwoaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX1NUQVRVU19NTUlPX09GRlNF
VCk7Cj4gLSAgICAgICAgY29tcF93YWl0ID0gZ2V0X2ZpZWxkX2Zyb21fcmVnX3UzMihzdGF0dXMs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9TVEFU
VVNfQ09NUF9XQUlUX0lOVF9NQVNLLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgSU9NTVVfU1RBVFVTX0NPTVBfV0FJVF9JTlRfU0hJRlQpOwo+ICsgICAgICAg
IGNvbXBfd2FpdCA9IHN0YXR1cyAmIElPTU1VX1NUQVRVU19DT01QX1dBSVRfSU5UOwoKVW5sZXNz
IHlvdSBhbHNvIGNoYW5nZSBjb21wX3dhaXQgdG8gYm9vbCwgdGhpcyBqdXN0IGhhcHBlbnMgdG8K
YmUgY29ycmVjdCB0aGlzIHdheSBiZWNhdXNlIG9mIHRoZSBiaXQgY2hlY2tlZCBiZWluZyBhdCBh
IGxvdwplbm91Z2ggcG9zaXRpb24uCgo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9pbml0LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW5pdC5jCj4gQEAgLTM1MSwxMyArMzUxLDEyIEBAIHN0YXRpYyB2b2lkIGlvbW11X3Jlc2V0X2xv
ZyhzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKPiAgICAgIEJVR19PTighaW9tbXUgfHwgKChsb2cg
IT0gJmlvbW11LT5ldmVudF9sb2cpICYmIChsb2cgIT0gJmlvbW11LT5wcHJfbG9nKSkpOwo+ICAK
PiAgICAgIHJ1bl9iaXQgPSAoIGxvZyA9PSAmaW9tbXUtPmV2ZW50X2xvZyApID8KPiAtICAgICAg
ICBJT01NVV9TVEFUVVNfRVZFTlRfTE9HX1JVTl9TSElGVCA6Cj4gLSAgICAgICAgSU9NTVVfU1RB
VFVTX1BQUl9MT0dfUlVOX1NISUZUOwo+ICsgICAgICAgIElPTU1VX1NUQVRVU19FVkVOVF9MT0df
UlVOIDogSU9NTVVfU1RBVFVTX1BQUl9MT0dfUlVOOwo+ICAKPiAgICAgIC8qIHdhaXQgdW50aWwg
RXZlbnRMb2dSdW4gYml0ID0gMCAqLwo+ICAgICAgZG8gewo+ICAgICAgICAgIGVudHJ5ID0gcmVh
ZGwoaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX1NUQVRVU19NTUlPX09GRlNFVCk7Cj4gLSAgICAg
ICAgbG9nX3J1biA9IGlvbW11X2dldF9iaXQoZW50cnksIHJ1bl9iaXQpOwo+ICsgICAgICAgIGxv
Z19ydW4gPSBlbnRyeSAmIHJ1bl9iaXQ7CgpTYW1lIGhlcmUgZm9yIGxvZ19ydW4gdGhlbi4gSSBh
bHNvIHRoaW5rIHJ1bl9iaXQgd291bGQgYmV0dGVyCmJlY29tZSB1bnNpZ25lZCBpbnQgdGhlbi4K
CldpdGggdGhlc2UgdGFrZW4gY2FyZSBvZgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
