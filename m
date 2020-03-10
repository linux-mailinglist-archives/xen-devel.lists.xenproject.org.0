Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B489D17F07A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 07:25:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBYHD-0004Sn-C8; Tue, 10 Mar 2020 06:22:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBYHC-0004Si-Bw
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 06:22:02 +0000
X-Inumbo-ID: 73a4ab4c-6297-11ea-bdac-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73a4ab4c-6297-11ea-bdac-bc764e2007e4;
 Tue, 10 Mar 2020 06:22:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC0BBB35A;
 Tue, 10 Mar 2020 06:21:59 +0000 (UTC)
To: Yan Yankovskyi <yyankovskyi@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20200307134322.GA27756@kbp1-lhp-F74019>
 <d190793c-fe6b-263e-7793-ccd73f9ccad4@oracle.com>
 <20200308131944.GA18740@kbp1-lhp-F74019>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <eccf0d74-fdc6-d3bb-ca79-5761008c3efd@suse.com>
Date: Tue, 10 Mar 2020 07:21:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200308131944.GA18740@kbp1-lhp-F74019>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: Use evtchn_type_t as a type for
 event channels
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-kernel@vger.kernel.org, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDMuMjAgMTQ6MTksIFlhbiBZYW5rb3Zza3lpIHdyb3RlOgo+IE9uIFNhdCwgTWFyIDA3
LCAyMDIwIGF0IDAyOjQxOjQ0UE0gLTA1MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4KPj4K
Pj4gT24gMy83LzIwIDg6NDMgQU0sIFlhbiBZYW5rb3Zza3lpIHdyb3RlOgo+Pj4gTWFrZSBldmVu
dCBjaGFubmVsIGZ1bmN0aW9ucyBwYXNzIGV2ZW50IGNoYW5uZWwgcG9ydCB1c2luZwo+Pj4gZXZ0
Y2huX3BvcnRfdCB0eXBlLiBJdCBlbGltaW5hdGVzIHNpZ25lZCA8LT4gdW5zaWduZWQgY29udmVy
c2lvbi4KPj4+Cj4+Cj4+Cj4+PiAgIHN0YXRpYyBpbnQgZmluZF92aXJxKHVuc2lnbmVkIGludCB2
aXJxLCB1bnNpZ25lZCBpbnQgY3B1KQo+Pj4gICB7Cj4+PiAgIAlzdHJ1Y3QgZXZ0Y2huX3N0YXR1
cyBzdGF0dXM7Cj4+PiAtCWludCBwb3J0LCByYyA9IC1FTk9FTlQ7Cj4+PiArCWV2dGNobl9wb3J0
X3QgcG9ydDsKPj4+ICsJaW50IHJjID0gLUVOT0VOVDsKPj4+ICAgCj4+PiAgIAltZW1zZXQoJnN0
YXR1cywgMCwgc2l6ZW9mKHN0YXR1cykpOwo+Pj4gICAJZm9yIChwb3J0ID0gMDsgcG9ydCA8IHhl
bl9ldnRjaG5fbWF4X2NoYW5uZWxzKCk7IHBvcnQrKykgewo+Pj4gQEAgLTk2Miw3ICs5NjMsOCBA
QCBFWFBPUlRfU1lNQk9MX0dQTCh4ZW5fZXZ0Y2huX25yX2NoYW5uZWxzKTsKPj4+ICAgaW50IGJp
bmRfdmlycV90b19pcnEodW5zaWduZWQgaW50IHZpcnEsIHVuc2lnbmVkIGludCBjcHUsIGJvb2wg
cGVyY3B1KQo+Pj4gICB7Cj4+PiAgIAlzdHJ1Y3QgZXZ0Y2huX2JpbmRfdmlycSBiaW5kX3ZpcnE7
Cj4+PiAtCWludCBldnRjaG4sIGlycSwgcmV0Owo+Pj4gKwlldnRjaG5fcG9ydF90IGV2dGNobiA9
IHhlbl9ldnRjaG5fbWF4X2NoYW5uZWxzKCk7Cj4+PiArCWludCBpcnEsIHJldDsKPj4+ICAgCj4+
PiAgIAltdXRleF9sb2NrKCZpcnFfbWFwcGluZ191cGRhdGVfbG9jayk7Cj4+PiAgIAo+Pj4gQEAg
LTk5MCw3ICs5OTIsNiBAQCBpbnQgYmluZF92aXJxX3RvX2lycSh1bnNpZ25lZCBpbnQgdmlycSwg
dW5zaWduZWQgaW50IGNwdSwgYm9vbCBwZXJjcHUpCj4+PiAgIAkJCWlmIChyZXQgPT0gLUVFWElT
VCkKPj4+ICAgCQkJCXJldCA9IGZpbmRfdmlycSh2aXJxLCBjcHUpOwo+Pj4gICAJCQlCVUdfT04o
cmV0IDwgMCk7Cj4+PiAtCQkJZXZ0Y2huID0gcmV0Owo+Pgo+Pgo+PiBUaGlzIGxvb2tzIHN1c3Bp
Y2lvdXMuIFdoYXQgd291bGQgeW91IGJlIHBhc3NpbmcgdG8KPj4geGVuX2lycV9pbmZvX3ZpcnFf
c2V0dXAoKSBiZWxvdz8KPiAKPiBSaWdodCwgdGhpcyBsaW5lIHNob3VsZCBiZSBwcmVzZXJ2ZWQu
Cj4gCj4+IEkgYWxzbyB0aGluayB0aGF0LCBnaXZlbiB0aGF0IHRoaXMgcGF0Y2ggaXMgdHJ5aW5n
IHRvIGdldCB0eXBlcyBpbgo+PiBvcmRlciwgZmluZF92aXJxKCkgd2lsbCBuZWVkIG1vcmUgY2hh
bmdlczogaXQgaXMgc3VwcG9zZWQgdG8gcmV0dXJuCj4+IGV2dGNobl9wb3J0X3QuIEJ1dCB0aGVu
IGl0IGFsc28gd2FudHMgdG8gcmV0dXJuIGEgKHNpZ25lZCkgZXJyb3IuCj4gICAKPiBBcyB3ZSBk
b24ndCBjYXJlIHdoaWNoIGVycm9yIHdlIGdvdCBkdXJpbmcgZmluZF92aXJxIGNhbGwsIHdlIGNh
biBqdXN0Cj4gcmV0dXJuIDAgaW4gY2FzZSBvZiBlcnJvciwgYW5kIHBvcnQgbnVtYmVyIG90aGVy
d2lzZS4gUG9ydCAwIGlzIG5ldmVyCj4gdmFsaWQsIHNvIHRoaXMgYXBwcm9hY2ggY2FuIHdvcmsg
Zm9yIHRoZSBvdGhlciBmdW5jdGlvbnMgYXMgd2VsbC4KPiBPbiB0aGUgb3RoZXIgaGFuZCwgcGFz
c2luZyBwb3J0IHVzaW5nIHBvaW50ZXIgYW5kIHJldHVybmluZyBhY3R1YWwKPiBlcnJvciBtZXNz
YWdlLCBhcyBpdCdzIGRvbmUgaW4geGVuYnVzX2FsbG9jX2V2dGNobigpLCBzb3VuZHMgbGlrZSBh
Cj4gYmV0dGVyIGFwcHJvYWNoIG92ZXJhbGwuIFdoYXQgZG8geW91IHRoaW5rPwoKWW91IGNhbiB1
c2UgdGhlIHNhbWUgYXBwcm9hY2ggYXMgWGVuIHRvb2xzIGRvIGFuZCBkZWZpbmUgc29tZXRoaW5n
IGxpa2U6Cgp0eXBlZGVmIGludCBldnRjaG5fcG9ydF9vcl9lcnJvcl90OwoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
