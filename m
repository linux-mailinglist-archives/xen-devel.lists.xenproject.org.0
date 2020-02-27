Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B91711F9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 09:09:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7ECo-0007VK-QM; Thu, 27 Feb 2020 08:07:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7ECn-0007VF-AR
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 08:07:37 +0000
X-Inumbo-ID: 370e2dec-5938-11ea-8fc3-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 370e2dec-5938-11ea-8fc3-bc764e2007e4;
 Thu, 27 Feb 2020 08:07:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F3C31AC1D;
 Thu, 27 Feb 2020 08:07:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88c175bc-ebeb-c40b-fc4e-5e175706c3af@suse.com>
Date: Thu, 27 Feb 2020 09:07:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/10] x86/msr: Compile out unused
 logic/objects
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

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtNzYsMTYgKzc3
LDI3IEBAIHZvaWQgX19pbml0IGluaXRfZ3Vlc3RfbXNyX3BvbGljeSh2b2lkKQo+ICB7Cj4gICAg
ICBjYWxjdWxhdGVfcmF3X3BvbGljeSgpOwo+ICAgICAgY2FsY3VsYXRlX2hvc3RfcG9saWN5KCk7
Cj4gLSAgICBjYWxjdWxhdGVfaHZtX21heF9wb2xpY3koKTsKPiAtICAgIGNhbGN1bGF0ZV9wdl9t
YXhfcG9saWN5KCk7Cj4gKwo+ICsgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19QVikgKQo+ICsg
ICAgICAgIGNhbGN1bGF0ZV9wdl9tYXhfcG9saWN5KCk7Cj4gKwo+ICsgICAgaWYgKCBodm1fZW5h
YmxlZCApCgoKQW55IGNoYW5jZSBvZiB0YWxraW5nIHlvdSBpbnRvIGRvaW5nIHRoaW5ncyBtb3Jl
IHN5bW1ldHJpY2FsbHksCmJ5IGVpdGhlciBhbHNvIHVzaW5nIElTX0VOQUJMRUQoQ09ORklHX0hW
TSkgaGVyZSBvciAuLi4KCj4gKyAgICAgICAgY2FsY3VsYXRlX2h2bV9tYXhfcG9saWN5KCk7Cj4g
IH0KPiAgCj4gIGludCBpbml0X2RvbWFpbl9tc3JfcG9saWN5KHN0cnVjdCBkb21haW4gKmQpCj4g
IHsKPiAtICAgIHN0cnVjdCBtc3JfcG9saWN5ICptcCA9Cj4gLSAgICAgICAgeG1lbWR1cChpc19w
dl9kb21haW4oZCkgPyAgJnB2X21heF9tc3JfcG9saWN5Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOiAmaHZtX21heF9tc3JfcG9saWN5KTsKPiArICAgIHN0cnVjdCBtc3JfcG9s
aWN5ICptcCA9IGlzX3B2X2RvbWFpbihkKQo+ICsgICAgICAgID8gKElTX0VOQUJMRUQoQ09ORklH
X1BWKSAgPyAgJnB2X21heF9tc3JfcG9saWN5IDogTlVMTCkKPiArICAgICAgICA6IChJU19FTkFC
TEVEKENPTkZJR19IVk0pID8gJmh2bV9tYXhfbXNyX3BvbGljeSA6IE5VTEwpOwoKLi4uIChpbW8g
cHJlZmVyYWJseSkgaHZtX2VuYWJsZWQgaGVyZT8gRWl0aGVyIHdheQpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
