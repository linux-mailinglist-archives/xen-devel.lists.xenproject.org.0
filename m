Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76934AB956
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:35:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6EMy-0003F0-OA; Fri, 06 Sep 2019 13:33:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6EMx-0003Et-7B
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:33:43 +0000
X-Inumbo-ID: f0e9b9fa-d0aa-11e9-abf6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0e9b9fa-d0aa-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 13:33:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 621B1AFF1;
 Fri,  6 Sep 2019 13:33:41 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190905160424.6686-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e210725e-78f5-67fd-14ba-113598278512@suse.com>
Date: Fri, 6 Sep 2019 15:33:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905160424.6686-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xstate: make use_xsave non-init
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxODowNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94c3RhdGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94c3RhdGUuYwo+IEBAIC01Nzcs
NyArNTc3LDExIEBAIHVuc2lnbmVkIGludCB4c3RhdGVfY3R4dF9zaXplKHU2NCB4Y3IwKQo+ICAv
KiBDb2xsZWN0IHRoZSBpbmZvcm1hdGlvbiBvZiBwcm9jZXNzb3IncyBleHRlbmRlZCBzdGF0ZSAq
Lwo+ICB2b2lkIHhzdGF0ZV9pbml0KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKPiAgewo+IC0gICAg
c3RhdGljIGJvb2wgX19pbml0ZGF0YSB1c2VfeHNhdmUgPSB0cnVlOwo+ICsgICAgLyoKPiArICAg
ICAqIE5COiB1c2VfeHNhdmUgY2Fubm90IGxpdmUgaW4gaW5pdGRhdGEgYmVjYXVzZSBsbHZtIG1p
Z2h0IG9wdGltaXplCj4gKyAgICAgKiByZWFkaW5nIGl0LCBzZWU6IGh0dHBzOi8vYnVncy5sbHZt
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9Mzk3MDcKPiArICAgICAqLwo+ICsgICAgc3RhdGljIGJvb2wg
dXNlX3hzYXZlID0gdHJ1ZTsKPiAgICAgIGJvb2xlYW5fcGFyYW0oInhzYXZlIiwgdXNlX3hzYXZl
KTsKPiAgCj4gICAgICBib29sIGJzcCA9IGMgPT0gJmJvb3RfY3B1X2RhdGE7CgpJIHRoaW5rIHdl
J2Qgd2FudCB0byB1c2UgX19yZWFkX21vc3RseSB0aGVuIGluc3RlYWQuIENhbiBiZSBhZGRlZAp3
aGlsZSBjb21taXR0aW5nIG9mIGNvdXJzZSwgaWYgeW91IGFncmVlLiBXaXRoIHRoZSBhZGRpdGlv
bgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
