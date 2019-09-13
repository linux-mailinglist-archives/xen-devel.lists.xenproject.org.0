Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3775B1891
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 09:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8fXN-00047v-4P; Fri, 13 Sep 2019 06:58:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=59Ls=XI=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i8fXL-00047n-LF
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 06:58:31 +0000
X-Inumbo-ID: e19b416e-d5f3-11e9-95a9-12813bfff9fa
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e19b416e-d5f3-11e9-95a9-12813bfff9fa;
 Fri, 13 Sep 2019 06:58:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 23:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,500,1559545200"; d="scan'208";a="215290730"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2019 23:58:22 -0700
Date: Fri, 13 Sep 2019 15:02:26 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190913070226.GC14305@gao-cwp>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-2-git-send-email-chao.gao@intel.com>
 <eb664aac-8068-be59-39f2-745b5f986307@suse.com>
 <401730a1-3a14-8b43-358c-049fea52bce7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <401730a1-3a14-8b43-358c-049fea52bce7@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDg6NTA6NTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAxMi4wOS4yMDE5IDEyOjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTIuMDku
MjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbWljcm9j
b2RlX2ludGVsLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+Pj4g
QEAgLTEzNCwyMSArMTM0LDExIEBAIHN0YXRpYyBpbnQgY29sbGVjdF9jcHVfaW5mbyh1bnNpZ25l
ZCBpbnQgY3B1X251bSwgc3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpCj4+PiAgICAgIHJldHVy
biAwOwo+Pj4gIH0KPj4+ICAKPj4+IC1zdGF0aWMgaW5saW5lIGludCBtaWNyb2NvZGVfdXBkYXRl
X21hdGNoKAo+Pj4gLSAgICB1bnNpZ25lZCBpbnQgY3B1X251bSwgY29uc3Qgc3RydWN0IG1pY3Jv
Y29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciwKPj4+IC0gICAgaW50IHNpZywgaW50IHBmKQo+
Pj4gK3N0YXRpYyBpbnQgbWljcm9jb2RlX3Nhbml0eV9jaGVjayhjb25zdCB2b2lkICptYykKPj4+
ICB7Cj4+PiAtICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVf
Y3B1X2luZm8sIGNwdV9udW0pOwo+Pj4gLQo+Pj4gLSAgICByZXR1cm4gKHNpZ21hdGNoKHNpZywg
dWNpLT5jcHVfc2lnLnNpZywgcGYsIHVjaS0+Y3B1X3NpZy5wZikgJiYKPj4+IC0gICAgICAgICAg
ICAobWNfaGVhZGVyLT5yZXYgPiB1Y2ktPmNwdV9zaWcucmV2KSk7Cj4+PiAtfQo+Pj4gLQo+Pj4g
LXN0YXRpYyBpbnQgbWljcm9jb2RlX3Nhbml0eV9jaGVjayh2b2lkICptYykKPj4+IC17Cj4+PiAt
ICAgIHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIgPSBtYzsKPj4+IC0g
ICAgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpleHRfaGVhZGVyID0gTlVMTDsKPj4+IC0gICAg
c3RydWN0IGV4dGVuZGVkX3NpZ25hdHVyZSAqZXh0X3NpZzsKPj4+ICsgICAgY29uc3Qgc3RydWN0
IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciA9IG1jOwo+Pj4gKyAgICBjb25zdCBz
dHJ1Y3QgZXh0ZW5kZWRfc2lndGFibGUgKmV4dF9oZWFkZXIgPSBOVUxMOwo+Pj4gKyAgICBjb25z
dCBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJlICpleHRfc2lnOwo+Pj4gICAgICB1bnNpZ25lZCBs
b25nIHRvdGFsX3NpemUsIGRhdGFfc2l6ZSwgZXh0X3RhYmxlX3NpemU7Cj4+PiAgICAgIHVuc2ln
bmVkIGludCBleHRfc2lnY291bnQgPSAwLCBpOwo+Pj4gICAgICB1aW50MzJfdCBzdW0sIG9yaWdf
c3VtOwo+Pj4gQEAgLTIzNCw2ICsyMjQsNDIgQEAgc3RhdGljIGludCBtaWNyb2NvZGVfc2FuaXR5
X2NoZWNrKHZvaWQgKm1jKQo+Pj4gICAgICByZXR1cm4gMDsKPj4+ICB9Cj4+PiAgCj4+PiArLyog
Q2hlY2sgYW4gdXBkYXRlIGFnYWluc3QgdGhlIENQVSBzaWduYXR1cmUgYW5kIGN1cnJlbnQgdXBk
YXRlIHJldmlzaW9uICovCj4+PiArc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCBt
aWNyb2NvZGVfdXBkYXRlX21hdGNoKAo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hl
YWRlcl9pbnRlbCAqbWNfaGVhZGVyLCB1bnNpZ25lZCBpbnQgY3B1KQo+Pj4gK3sKPj4+ICsgICAg
Y29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpleHRfaGVhZGVyOwo+Pj4gKyAgICBjb25z
dCBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJlICpleHRfc2lnOwo+Pj4gKyAgICB1bnNpZ25lZCBp
bnQgaTsKPj4+ICsgICAgc3RydWN0IHVjb2RlX2NwdV9pbmZvICp1Y2kgPSAmcGVyX2NwdSh1Y29k
ZV9jcHVfaW5mbywgY3B1KTsKPj4+ICsgICAgdW5zaWduZWQgaW50IHNpZyA9IHVjaS0+Y3B1X3Np
Zy5zaWc7Cj4+PiArICAgIHVuc2lnbmVkIGludCBwZiA9IHVjaS0+Y3B1X3NpZy5wZjsKPj4+ICsg
ICAgdW5zaWduZWQgaW50IHJldiA9IHVjaS0+Y3B1X3NpZy5yZXY7Cj4+PiArICAgIHVuc2lnbmVk
IGxvbmcgZGF0YV9zaXplID0gZ2V0X2RhdGFzaXplKG1jX2hlYWRlcik7Cj4+PiArICAgIGNvbnN0
IHZvaWQgKmVuZCA9IChjb25zdCB2b2lkICopbWNfaGVhZGVyICsgZ2V0X3RvdGFsc2l6ZShtY19o
ZWFkZXIpOwo+Pj4gKwo+Pj4gKyAgICBBU1NFUlQoIW1pY3JvY29kZV9zYW5pdHlfY2hlY2sobWNf
aGVhZGVyKSk7Cj4+PiArICAgIGlmICggc2lnbWF0Y2goc2lnLCBtY19oZWFkZXItPnNpZywgcGYs
IG1jX2hlYWRlci0+cGYpICkKPj4+ICsgICAgICAgIHJldHVybiAobWNfaGVhZGVyLT5yZXYgPiBy
ZXYpID8gTkVXX1VDT0RFIDogT0xEX1VDT0RFOwo+Pj4gKwo+Pj4gKyAgICBleHRfaGVhZGVyID0g
KGNvbnN0IHZvaWQgKikobWNfaGVhZGVyICsgMSkgKyBkYXRhX3NpemU7Cj4+PiArICAgIGV4dF9z
aWcgPSAoY29uc3Qgdm9pZCAqKShleHRfaGVhZGVyICsgMSk7Cj4+PiArCj4+PiArICAgIC8qCj4+
PiArICAgICAqIE1ha2Ugc3VyZSB0aGVyZSBpcyBlbm91Z2ggc3BhY2UgdG8gaG9sZCBhbiBleHRl
bmRlZCBoZWFkZXIgYW5kIGVub3VnaAo+Pj4gKyAgICAgKiBhcnJheSBlbGVtZW50cy4KPj4+ICsg
ICAgICovCj4+PiArICAgIGlmICggKGVuZCA8IChjb25zdCB2b2lkICopZXh0X3NpZykgfHwKPj4+
ICsgICAgICAgICAoZW5kIDwgKGNvbnN0IHZvaWQgKikoZXh0X3NpZyArIGV4dF9oZWFkZXItPmNv
dW50KSkgKQo+Pj4gKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsKPj4gCj4+IFdpdGggeW91IG5v
dyBhc3N1bWluZyB0aGF0IHRoZSBibG9iIGhhcyBwcmV2aW91c2x5IHBhc3NlZAo+PiBtaWNyb2Nv
ZGVfc2FuaXR5X2NoZWNrKCksIHRoaXMgb25seSBuZWVkcyB0byBiZQo+PiAKPj4gICAgIGlmICgg
KGVuZCA8PSAoY29uc3Qgdm9pZCAqKWV4dF9zaWcpICkKPj4gICAgICAgICByZXR1cm4gTUlTX1VD
T0RFOwo+PiAKPj4gbm93IGFmYWljdC4KPj4gCj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+IHByZWZlcmFibHkgd2l0aCB0aGlzIGFkanVzdG1lbnQgKGFz
c3VtaW5nIHlvdSBhZ3JlZSkuCj4KPkZBT0Q6IEknZCBiZSBoYXBweSB0byBtYWtlIHRoZSBhZGp1
c3RtZW50IHdoaWxlIGNvbW1pdHRpbmcsIGJ1dAo+SSdkIGxpa2UgdG8gaGF2ZSB5b3VyIGNvbnNl
bnQgKG9yIHlvdSBwcm92aW5nIG1lIHdyb25nKS4gVGhpcwo+d291bGQsIGFzIGl0IGxvb2tzLCBh
bGxvdyBldmVyeXRoaW5nIHVwIHRvIHBhdGNoIDggdG8gZ28gaW4uCgpQbGVhc2UgZ28gYWhlYWQu
IFRoYW5rcwoKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
