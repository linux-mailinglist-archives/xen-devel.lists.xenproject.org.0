Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7EF113D4D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 09:47:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icmjj-0004RF-3P; Thu, 05 Dec 2019 08:43:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icmji-0004RA-5m
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 08:43:46 +0000
X-Inumbo-ID: 58fd20aa-173b-11ea-8216-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58fd20aa-173b-11ea-8216-12813bfff9fa;
 Thu, 05 Dec 2019 08:43:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9386BB2B4;
 Thu,  5 Dec 2019 08:43:44 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <ce5bd41b-90ed-fcf3-9e2d-a536ff1fcf90@eikelenboom.it>
 <59ac3962-a947-337b-b758-7ecfb69561ca@suse.com>
 <08b761ad-c84b-3dad-2dd1-f9b69b0fe2a7@eikelenboom.it>
 <62b58da082e449eb960bada0ea34e3f9@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9ef56d9-9220-72e5-8ea6-0bd87436991b@suse.com>
Date: Thu, 5 Dec 2019 09:43:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <62b58da082e449eb960bada0ea34e3f9@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] xen-unstable (4.14 to be): Assertion
 '!preempt_count()' failed at preempt.c:36
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
Cc: Paul Durrant <paul@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAwOTozNSwgRHVycmFudCwgUGF1bCB3cm90ZToKPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jCj4gQEAgLTE2OTYsMTYgKzE2OTYsMTIgQEAgaW50IGlvbW11X2RvX3BjaV9kb21jdGwoCj4g
Cj4gICAgICAgICAgcGNpZGV2c19sb2NrKCk7Cj4gICAgICAgICAgcmV0ID0gZGV2aWNlX2Fzc2ln
bmVkKHNlZywgYnVzLCBkZXZmbik7Cj4gLSAgICAgICAgaWYgKCBkb21jdGwtPmNtZCA9PSBYRU5f
RE9NQ1RMX3Rlc3RfYXNzaWduX2RldmljZSApCj4gKyAgICAgICAgaWYgKCByZXQgJiYgZG9tY3Rs
LT5jbWQgPT0gWEVOX0RPTUNUTF90ZXN0X2Fzc2lnbl9kZXZpY2UgKQo+ICAgICAgICAgIHsKPiAt
ICAgICAgICAgICAgaWYgKCByZXQgKQo+IC0gICAgICAgICAgICB7Cj4gLSAgICAgICAgICAgICAg
ICBwcmludGsoWEVOTE9HX0dfSU5GTwo+IC0gICAgICAgICAgICAgICAgICAgICAgICIlMDR4OiUw
Mng6JTAyeC4ldSBhbHJlYWR5IGFzc2lnbmVkLCBvciBub24tZXhpc3RlbnRcbiIsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2
Zm4pKTsKPiAtICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gLSAgICAgICAgICAgIH0K
PiAtICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19JTkZP
Cj4gKyAgICAgICAgICAgICAgICAgICAiJTA0eDolMDJ4OiUwMnguJXUgYWxyZWFkeSBhc3NpZ25l
ZCwgb3Igbm9uLWV4aXN0ZW50XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgc2VnLCBidXMsIFBD
SV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pKTsKPiArICAgICAgICAgICAgcmV0ID0gLUVJ
TlZBTDsKPiAgICAgICAgICB9CgpCdXQgdGhpcyBzZWVtcyB3cm9uZyAtIHlvdSdkIGVuZCB1cCBj
YWxsaW5nIGFzc2lnbl9kZXZpY2UoKSBldmVuCmZvciB0aGUgWEVOX0RPTUNUTF90ZXN0X2Fzc2ln
bl9kZXZpY2UgY2FzZSwgd2hlbiByZXQgaXMgMC4gQWxsIHdlCndhbnQgaXMgdG8gZGVsZXRlIHRo
ZSBicmVhayBzdGF0ZW1lbnQgYWZhaWN0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
