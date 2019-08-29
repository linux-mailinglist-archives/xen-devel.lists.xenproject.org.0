Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95226A126A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 09:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Eac-0003Rx-Ru; Thu, 29 Aug 2019 07:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELCR=WZ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3Eaa-0003Rs-L2
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 07:11:24 +0000
X-Inumbo-ID: 33bc6fa0-ca2c-11e9-ae5b-12813bfff9fa
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33bc6fa0-ca2c-11e9-ae5b-12813bfff9fa;
 Thu, 29 Aug 2019 07:11:21 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 00:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="197739879"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2019 00:11:19 -0700
Date: Thu, 29 Aug 2019 15:15:23 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190829071521.GA12650@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-2-git-send-email-chao.gao@intel.com>
 <af707ba6-c606-0ec1-97aa-bb8f8bbdac3b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af707ba6-c606-0ec1-97aa-bb8f8bbdac3b@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 01/15] microcode/intel: extend
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDU6MTI6MzRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAxOS4wOC4yMDE5IDAzOjI1LCBDaGFvIEdhbyB3cm90ZToKPj4gdG8gYSBtb3JlIGdl
bmVyaWMgZnVuY3Rpb24uIFNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgYWxvbmUgdG8gY2hlY2sKPj4g
YW4gdXBkYXRlIGFnYWluc3QgdGhlIENQVSBzaWduYXR1cmUgYW5kIGN1cnJlbnQgdXBkYXRlIHJl
dmlzaW9uLgo+PiAKPj4gTm90ZSB0aGF0IGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCB3aWxs
IGJlIHVzZWQgaW4gY29tbW9uIGNvZGUKPj4gKGFrYSBtaWNyb2NvZGUuYyksIGl0IGhhcyBiZWVu
IHBsYWNlZCBpbiB0aGUgY29tbW9uIGhlYWRlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8g
R2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPgo+SSBkb24ndCB0aGluayB0aGVzZSBjYW4gYmUgbGVnaXRpbWF0ZWx5
IHJldGFpbmVkIHdpdGggLi4uCj4KPj4gQ2hhbmdlcyBpbiB2OToKPj4gIC0gbWljcm9jb2RlX3Vw
ZGF0ZV9tYXRjaCgpIGRvZXNuJ3QgYWNjZXB0IChzaWcsIHBmLCByZXYpIGFueSBsb25nZXIuCj4+
ICBIZW5jZSwgaXQgd29uJ3QgYmUgdXNlZCB0byBjb21wYXJlIHR3byBhcmJpdHJhcnkgdXBkYXRl
cy4KPgo+Li4uIHRoaXMga2luZCBvZiBhIGNoYW5nZS4KCldpbGwgZHJvcCBSQnMuCgo+Cj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+PiArKysgYi94ZW4vYXJjaC94ODYv
bWljcm9jb2RlX2ludGVsLmMKPj4gQEAgLTEzNCwxNCArMTM0LDM5IEBAIHN0YXRpYyBpbnQgY29s
bGVjdF9jcHVfaW5mbyh1bnNpZ25lZCBpbnQgY3B1X251bSwgc3RydWN0IGNwdV9zaWduYXR1cmUg
KmNzaWcpCj4+ICAgICAgcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gLXN0YXRpYyBpbmxpbmUgaW50
IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4+IC0gICAgdW5zaWduZWQgaW50IGNwdV9udW0sIGNv
bnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsCj4+IC0gICAgaW50
IHNpZywgaW50IHBmKQo+PiArLyogQ2hlY2sgYW4gdXBkYXRlIGFnYWluc3QgdGhlIENQVSBzaWdu
YXR1cmUgYW5kIGN1cnJlbnQgdXBkYXRlIHJldmlzaW9uICovCj4+ICtzdGF0aWMgZW51bSBtaWNy
b2NvZGVfbWF0Y2hfcmVzdWx0IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4+ICsgICAgY29uc3Qg
c3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciwgdW5zaWduZWQgaW50IGNw
dSkKPj4gIHsKPj4gLSAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVj
b2RlX2NwdV9pbmZvLCBjcHVfbnVtKTsKPj4gLQo+PiAtICAgIHJldHVybiAoc2lnbWF0Y2goc2ln
LCB1Y2ktPmNwdV9zaWcuc2lnLCBwZiwgdWNpLT5jcHVfc2lnLnBmKSAmJgo+PiAtICAgICAgICAg
ICAgKG1jX2hlYWRlci0+cmV2ID4gdWNpLT5jcHVfc2lnLnJldikpOwo+PiArICAgIGNvbnN0IHN0
cnVjdCBleHRlbmRlZF9zaWd0YWJsZSAqZXh0X2hlYWRlcjsKPj4gKyAgICBjb25zdCBzdHJ1Y3Qg
ZXh0ZW5kZWRfc2lnbmF0dXJlICpleHRfc2lnOwo+PiArICAgIHVuc2lnbmVkIGludCBpOwo+PiAr
ICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8s
IGNwdSk7Cj4+ICsgICAgdW5zaWduZWQgaW50IHNpZyA9IHVjaS0+Y3B1X3NpZy5zaWc7Cj4+ICsg
ICAgdW5zaWduZWQgaW50IHBmID0gdWNpLT5jcHVfc2lnLnBmOwo+PiArICAgIHVuc2lnbmVkIGlu
dCByZXYgPSB1Y2ktPmNwdV9zaWcucmV2Owo+PiArICAgIHVuc2lnbmVkIGxvbmcgZGF0YV9zaXpl
ID0gZ2V0X2RhdGFzaXplKG1jX2hlYWRlcik7Cj4+ICsgICAgY29uc3Qgdm9pZCAqZW5kID0gKGNv
bnN0IHZvaWQgKiltY19oZWFkZXIgKyBnZXRfdG90YWxzaXplKG1jX2hlYWRlcik7Cj4+ICsKPj4g
KyAgICBpZiAoIHNpZ21hdGNoKHNpZywgbWNfaGVhZGVyLT5zaWcsIHBmLCBtY19oZWFkZXItPnBm
KSApCj4+ICsgICAgICAgIHJldHVybiAobWNfaGVhZGVyLT5yZXYgPiByZXYpID8gTkVXX1VDT0RF
IDogT0xEX1VDT0RFOwo+Cj5EaWRuJ3QgeW91IGxvc2UgYSByYW5nZSBjaGVjayBhZ2FpbnN0ICJl
bmQiIGFoZWFkIG9mIHRoaXMgaWYoKT8KPmdldF90b3RhbHNpemUoKSBhbmQgZ2V0X2RhdGFzaXpl
KCkgYWl1aSBhbHNvIHdvdWxkIG5lZWQgdG8gbGl2ZQo+YWZ0ZXIgYSByYW5nZSBjaGVjaywganVz
dCBhIHNpemVvZigpIChpLmUuIE1DX0hFQURFUl9TSVpFKSBiYXNlZAo+b25lLiBUaGlzIHdvdWxk
IGFsc28gYWZmZWN0IHRoZSBjYWxsZXIgYXMgaXQgc2VlbXMuCgpJIHRoaW5rIG1pY3JvY29kZV9z
YW5pdHlfY2hlY2soKSBpcyBmb3IgdGhpcyBwdXJwb3NlLiBXZSBjYW4gZG8Kc2FuaXR5IGNoZWNr
IGJlZm9yZSB0aGUgaWYoKS4gUGVyaGFwcywgd2UgY2FuIGp1c3QgYWRkIGFuIGFzc2VydGlvbgp0
aGF0IHNhbml0eSBjaGVjayB3b24ndCBmYWlsLiBCZWNhdXNlIHdoZW5ldmVyIHNhbml0eSBjaGVj
ayBmYWlsZWQKd2hlbiBwYXNpbmcgYW4gdWNvZGUgYmxvYiwgd2UganVzdCBkcm9wIHRoZSB1Y29k
ZTsgd2Ugd29uJ3QgcGFzcyBhbgpicm9rZW4gdWNvZGUgdG8gdGhpcyBmdW5jdGlvbi4KClRoYW5r
cwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
