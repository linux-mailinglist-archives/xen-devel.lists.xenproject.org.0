Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F5F10042B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 12:31:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWfCN-0005cV-Bf; Mon, 18 Nov 2019 11:28:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWfCL-0005cQ-Q8
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 11:28:01 +0000
X-Inumbo-ID: 7a25c7b6-09f6-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a25c7b6-09f6-11ea-984a-bc764e2007e4;
 Mon, 18 Nov 2019 11:28:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0851DB149;
 Mon, 18 Nov 2019 11:28:00 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191116234717.1458-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bb27e92-991a-a344-50e6-434e65d83238@suse.com>
Date: Mon, 18 Nov 2019 12:27:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Roman Shaposhnik <roman@zededa.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTEuMjAxOSAwMDo0NywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBCZWZvcmUgZGZjY2NjNjYzMSAiZWZpOiB1c2UgZGlyZWN0bWFwIHRvIGFjY2VzcyBydW50aW1l
IHNlcnZpY2VzIHRhYmxlIgo+IGFsbCB1c2FnZXMgb2YgZWZpX3JzIHBvaW50ZXIgd2VyZSBndWFy
ZGVkIGJ5IGVmaV9yc19lbnRlcigpLCB3aGljaAo+IGltcGxpY2l0bHkgcmVmdXNlZCB0byBvcGVy
YXRlIHdpdGggZWZpPW5vLXJzIChieSBjaGVja2luZyBpZgo+IGVmaV9sNF9wZ3RhYmxlIGlzIE5V
TEwgLSB3aGljaCBpcyB0aGUgY2FzZSBmb3IgZWZpPW5vLXJzKS4gVGhlIHNhaWQKPiBjb21taXQg
KHJlKW1vdmVkIHRoYXQgY2FsbCBhcyB1bm5lZWRlZCBmb3IganVzdCByZWFkaW5nIGNvbnRlbnQg
b2YKPiBlZmlfcnMgc3RydWN0dXJlIC0gdG8gYXZvaWQgdW5uZWNlc3NhcnkgcGFnZSB0YWJsZXMg
c3dpdGNoLiBCdXQgaXQKPiBuZWdsZWN0ZWQgdG8gY2hlY2sgaWYgZWZpX3JzIGFjY2VzcyBpcyBs
ZWdhbC4KPiAKPiBGaXggdGhpcyBieSBhZGRpbmcgZXhwbGljaXQgY2hlY2sgZm9yIHJ1bnRpbWUg
c2VydmljZSBiZWluZyBlbmFibGVkIGluCj4gdGhlIGNhc2VzIHRoYXQgZG8gbm90IHVzZSBlZmlf
cnNfZW50ZXIoKS4KPiAKPiBSZXBvcnRlZC1ieTogUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVk
ZWRhLmNvbT4KPiBGaXhlczogZGZjY2NjNjYzMSAiZWZpOiB1c2UgZGlyZWN0bWFwIHRvIGFjY2Vz
cyBydW50aW1lIHNlcnZpY2VzIHRhYmxlIgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBbGJlaXQgSSB3b3VsZCBoYXZl
IHByZWZlcnJlZCAuLi4KCj4gQEAgLTYxMyw2ICs2MTUsOCBAQCBpbnQgZWZpX3J1bnRpbWVfY2Fs
bChzdHJ1Y3QgeGVucGZfZWZpX3J1bnRpbWVfY2FsbCAqb3ApCj4gICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgIH0KPiAgCj4gKyAgICAgICAgaWYgKCAhZWZpX2VuYWJsZWQoRUZJX1JTKSAp
Cj4gKyAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiAgICAgICAgICBpZiAoIChlZmlf
cnMtPkhkci5SZXZpc2lvbiA+PiAxNikgPCAyICkKPiAgICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOwo+ICAgICAgICAgIHN0YXRlID0gZWZpX3JzX2VudGVyKCk7Cj4gQEAgLTYzMSw2ICs2
MzUsOCBAQCBpbnQgZWZpX3J1bnRpbWVfY2FsbChzdHJ1Y3QgeGVucGZfZWZpX3J1bnRpbWVfY2Fs
bCAqb3ApCj4gICAgICAgICAgaWYgKCBvcC0+bWlzYyApCj4gICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+ICAKPiArICAgICAgICBpZiAoICFlZmlfZW5hYmxlZChFRklfUlMpICkKPiArICAg
ICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgICAgICAgIGlmICggKGVmaV9ycy0+SGRy
LlJldmlzaW9uID4+IDE2KSA8IDIgKQo+ICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7
CgouLi4gaWYgdGhlc2UgdHdvIHBhaXJzIG9mIGlmKCktcyB3b3VsZCBlYWNoIGhhdmUgYmVlbiBm
b2xkZWQ7IEkgbWF5CnRha2UgdGhlIGxpYmVydHkgdG8gZG8gc28gd2hpbGUgY29tbWl0dGluZyBp
ZiBJIGVuZCB1cCBiZWluZyB0aGUKY29tbWl0dGVyIG9mIHRoaXMuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
