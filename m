Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2C102A03
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 17:57:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6mk-0005Zd-Cv; Tue, 19 Nov 2019 16:55:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iX6mi-0005ZQ-Ax
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:55:24 +0000
X-Inumbo-ID: 604cfe84-0aed-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 604cfe84-0aed-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 16:55:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 346F3C19D;
 Tue, 19 Nov 2019 16:55:22 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20191116234717.1458-1-marmarek@invisiblethingslab.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0d53ed57-aca0-ea4d-c5e3-534bb550ab1f@suse.com>
Date: Tue, 19 Nov 2019 17:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191116234717.1458-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] efi: do not use runtime services
 table with efi=no-rs
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
Cc: Roman Shaposhnik <roman@zededa.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTEuMTkgMDA6NDcsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBC
ZWZvcmUgZGZjY2NjNjYzMSAiZWZpOiB1c2UgZGlyZWN0bWFwIHRvIGFjY2VzcyBydW50aW1lIHNl
cnZpY2VzIHRhYmxlIgo+IGFsbCB1c2FnZXMgb2YgZWZpX3JzIHBvaW50ZXIgd2VyZSBndWFyZGVk
IGJ5IGVmaV9yc19lbnRlcigpLCB3aGljaAo+IGltcGxpY2l0bHkgcmVmdXNlZCB0byBvcGVyYXRl
IHdpdGggZWZpPW5vLXJzIChieSBjaGVja2luZyBpZgo+IGVmaV9sNF9wZ3RhYmxlIGlzIE5VTEwg
LSB3aGljaCBpcyB0aGUgY2FzZSBmb3IgZWZpPW5vLXJzKS4gVGhlIHNhaWQKPiBjb21taXQgKHJl
KW1vdmVkIHRoYXQgY2FsbCBhcyB1bm5lZWRlZCBmb3IganVzdCByZWFkaW5nIGNvbnRlbnQgb2YK
PiBlZmlfcnMgc3RydWN0dXJlIC0gdG8gYXZvaWQgdW5uZWNlc3NhcnkgcGFnZSB0YWJsZXMgc3dp
dGNoLiBCdXQgaXQKPiBuZWdsZWN0ZWQgdG8gY2hlY2sgaWYgZWZpX3JzIGFjY2VzcyBpcyBsZWdh
bC4KPiAKPiBGaXggdGhpcyBieSBhZGRpbmcgZXhwbGljaXQgY2hlY2sgZm9yIHJ1bnRpbWUgc2Vy
dmljZSBiZWluZyBlbmFibGVkIGluCj4gdGhlIGNhc2VzIHRoYXQgZG8gbm90IHVzZSBlZmlfcnNf
ZW50ZXIoKS4KPiAKPiBSZXBvcnRlZC1ieTogUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRh
LmNvbT4KPiBGaXhlczogZGZjY2NjNjYzMSAiZWZpOiB1c2UgZGlyZWN0bWFwIHRvIGFjY2VzcyBy
dW50aW1lIHNlcnZpY2VzIHRhYmxlIgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KClJlbGVhc2UtYWNr
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
