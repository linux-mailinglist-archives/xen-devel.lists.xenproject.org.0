Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478FB0CDF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:27:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8MHc-00049c-Rz; Thu, 12 Sep 2019 10:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8MHb-00049M-HT
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:24:59 +0000
X-Inumbo-ID: 91b39d1a-d547-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91b39d1a-d547-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 10:24:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34DA5AF6B;
 Thu, 12 Sep 2019 10:24:57 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-2-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb664aac-8068-be59-39f2-745b5f986307@suse.com>
Date: Thu, 12 Sep 2019 12:24:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-2-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 01/16] microcode/intel: extend
 microcode_update_match()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2
L21pY3JvY29kZV9pbnRlbC5jCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5j
Cj4gQEAgLTEzNCwyMSArMTM0LDExIEBAIHN0YXRpYyBpbnQgY29sbGVjdF9jcHVfaW5mbyh1bnNp
Z25lZCBpbnQgY3B1X251bSwgc3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpCj4gICAgICByZXR1
cm4gMDsKPiAgfQo+ICAKPiAtc3RhdGljIGlubGluZSBpbnQgbWljcm9jb2RlX3VwZGF0ZV9tYXRj
aCgKPiAtICAgIHVuc2lnbmVkIGludCBjcHVfbnVtLCBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hl
YWRlcl9pbnRlbCAqbWNfaGVhZGVyLAo+IC0gICAgaW50IHNpZywgaW50IHBmKQo+ICtzdGF0aWMg
aW50IG1pY3JvY29kZV9zYW5pdHlfY2hlY2soY29uc3Qgdm9pZCAqbWMpCj4gIHsKPiAtICAgIHN0
cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdV9u
dW0pOwo+IC0KPiAtICAgIHJldHVybiAoc2lnbWF0Y2goc2lnLCB1Y2ktPmNwdV9zaWcuc2lnLCBw
ZiwgdWNpLT5jcHVfc2lnLnBmKSAmJgo+IC0gICAgICAgICAgICAobWNfaGVhZGVyLT5yZXYgPiB1
Y2ktPmNwdV9zaWcucmV2KSk7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbnQgbWljcm9jb2RlX3Nhbml0
eV9jaGVjayh2b2lkICptYykKPiAtewo+IC0gICAgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50
ZWwgKm1jX2hlYWRlciA9IG1jOwo+IC0gICAgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpleHRf
aGVhZGVyID0gTlVMTDsKPiAtICAgIHN0cnVjdCBleHRlbmRlZF9zaWduYXR1cmUgKmV4dF9zaWc7
Cj4gKyAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqbWNfaGVhZGVyID0g
bWM7Cj4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lndGFibGUgKmV4dF9oZWFkZXIgPSBO
VUxMOwo+ICsgICAgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ25hdHVyZSAqZXh0X3NpZzsKPiAg
ICAgIHVuc2lnbmVkIGxvbmcgdG90YWxfc2l6ZSwgZGF0YV9zaXplLCBleHRfdGFibGVfc2l6ZTsK
PiAgICAgIHVuc2lnbmVkIGludCBleHRfc2lnY291bnQgPSAwLCBpOwo+ICAgICAgdWludDMyX3Qg
c3VtLCBvcmlnX3N1bTsKPiBAQCAtMjM0LDYgKzIyNCw0MiBAQCBzdGF0aWMgaW50IG1pY3JvY29k
ZV9zYW5pdHlfY2hlY2sodm9pZCAqbWMpCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiArLyog
Q2hlY2sgYW4gdXBkYXRlIGFnYWluc3QgdGhlIENQVSBzaWduYXR1cmUgYW5kIGN1cnJlbnQgdXBk
YXRlIHJldmlzaW9uICovCj4gK3N0YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgbWlj
cm9jb2RlX3VwZGF0ZV9tYXRjaCgKPiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVy
X2ludGVsICptY19oZWFkZXIsIHVuc2lnbmVkIGludCBjcHUpCj4gK3sKPiArICAgIGNvbnN0IHN0
cnVjdCBleHRlbmRlZF9zaWd0YWJsZSAqZXh0X2hlYWRlcjsKPiArICAgIGNvbnN0IHN0cnVjdCBl
eHRlbmRlZF9zaWduYXR1cmUgKmV4dF9zaWc7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiArICAg
IHN0cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNw
dSk7Cj4gKyAgICB1bnNpZ25lZCBpbnQgc2lnID0gdWNpLT5jcHVfc2lnLnNpZzsKPiArICAgIHVu
c2lnbmVkIGludCBwZiA9IHVjaS0+Y3B1X3NpZy5wZjsKPiArICAgIHVuc2lnbmVkIGludCByZXYg
PSB1Y2ktPmNwdV9zaWcucmV2Owo+ICsgICAgdW5zaWduZWQgbG9uZyBkYXRhX3NpemUgPSBnZXRf
ZGF0YXNpemUobWNfaGVhZGVyKTsKPiArICAgIGNvbnN0IHZvaWQgKmVuZCA9IChjb25zdCB2b2lk
ICopbWNfaGVhZGVyICsgZ2V0X3RvdGFsc2l6ZShtY19oZWFkZXIpOwo+ICsKPiArICAgIEFTU0VS
VCghbWljcm9jb2RlX3Nhbml0eV9jaGVjayhtY19oZWFkZXIpKTsKPiArICAgIGlmICggc2lnbWF0
Y2goc2lnLCBtY19oZWFkZXItPnNpZywgcGYsIG1jX2hlYWRlci0+cGYpICkKPiArICAgICAgICBy
ZXR1cm4gKG1jX2hlYWRlci0+cmV2ID4gcmV2KSA/IE5FV19VQ09ERSA6IE9MRF9VQ09ERTsKPiAr
Cj4gKyAgICBleHRfaGVhZGVyID0gKGNvbnN0IHZvaWQgKikobWNfaGVhZGVyICsgMSkgKyBkYXRh
X3NpemU7Cj4gKyAgICBleHRfc2lnID0gKGNvbnN0IHZvaWQgKikoZXh0X2hlYWRlciArIDEpOwo+
ICsKPiArICAgIC8qCj4gKyAgICAgKiBNYWtlIHN1cmUgdGhlcmUgaXMgZW5vdWdoIHNwYWNlIHRv
IGhvbGQgYW4gZXh0ZW5kZWQgaGVhZGVyIGFuZCBlbm91Z2gKPiArICAgICAqIGFycmF5IGVsZW1l
bnRzLgo+ICsgICAgICovCj4gKyAgICBpZiAoIChlbmQgPCAoY29uc3Qgdm9pZCAqKWV4dF9zaWcp
IHx8Cj4gKyAgICAgICAgIChlbmQgPCAoY29uc3Qgdm9pZCAqKShleHRfc2lnICsgZXh0X2hlYWRl
ci0+Y291bnQpKSApCj4gKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsKCldpdGggeW91IG5vdyBh
c3N1bWluZyB0aGF0IHRoZSBibG9iIGhhcyBwcmV2aW91c2x5IHBhc3NlZAptaWNyb2NvZGVfc2Fu
aXR5X2NoZWNrKCksIHRoaXMgb25seSBuZWVkcyB0byBiZQoKICAgIGlmICggKGVuZCA8PSAoY29u
c3Qgdm9pZCAqKWV4dF9zaWcpICkKICAgICAgICByZXR1cm4gTUlTX1VDT0RFOwoKbm93IGFmYWlj
dC4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CnByZWZlcmFi
bHkgd2l0aCB0aGlzIGFkanVzdG1lbnQgKGFzc3VtaW5nIHlvdSBhZ3JlZSkuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
