Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D492760
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 16:47:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hziue-0000vI-5r; Mon, 19 Aug 2019 14:45:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JIwN=WP=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hziuc-0000vD-Ji
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 14:45:34 +0000
X-Inumbo-ID: fef75ac6-c28f-11e9-8bee-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fef75ac6-c28f-11e9-8bee-12813bfff9fa;
 Mon, 19 Aug 2019 14:45:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 07:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="195550904"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2019 07:45:30 -0700
Date: Mon, 19 Aug 2019 22:49:36 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20190819144934.GA12597@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-14-git-send-email-chao.gao@intel.com>
 <ea4e0bee-7151-82da-c293-fec2532f9b92@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea4e0bee-7151-82da-c293-fec2532f9b92@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 13/15] x86/microcode: Synchronize late
 microcode loading
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
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@suse.de>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6Mjc6MzZBTSArMDEwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPj4gK3N0YXRpYyBpbnQgbWFzdGVyX3RocmVhZF9mbihjb25zdCBzdHJ1Y3QgbWljcm9j
b2RlX3BhdGNoICpwYXRjaCkKPj4gK3sKPj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3By
b2Nlc3Nvcl9pZCgpOwo+PiArICAgIGludCByZXQgPSAwOwo+PiArCj4+ICsgICAgd2hpbGUgKCBs
b2FkaW5nX3N0YXRlICE9IExPQURJTkdfQ0FMTElOICkKPj4gKyAgICAgICAgY3B1X3JlbGF4KCk7
Cj4+ICsKPj4gKyAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1X2NhbGxpbl9tYXApOwo+PiAr
Cj4+ICsgICAgd2hpbGUgKCBsb2FkaW5nX3N0YXRlICE9IExPQURJTkdfRU5URVIgKQo+PiArICAg
ICAgICBjcHVfcmVsYXgoKTsKPgo+SWYgSSdtIHJlYWRpbmcgaXQgcmlnaHQsIHRoaXMgd2lsbCB3
YWl0IGZvcmV2ZXIgaW4gY2FzZSB3aGVuLi4uCj4KPj4gKwo+PiArICAgIC8qCj4+ICsgICAgICog
SWYgYW4gZXJyb3IgaGFwcGVuZWQsIGNvbnRyb2wgdGhyZWFkIHdvdWxkIHNldCAnbG9hZGluZ19z
dGF0ZScKPj4gKyAgICAgKiB0byBMT0FESU5HX0VYSVQuIERvbid0IHBlcmZvcm0gdWNvZGUgbG9h
ZGluZyBmb3IgdGhpcyBjYXNlCj4+ICsgICAgICovCj4+ICsgICAgaWYgKCBsb2FkaW5nX3N0YXRl
ID09IExPQURJTkdfRVhJVCApCj4+ICsgICAgICAgIHJldHVybiByZXQ7CgpJIHRyaWVkIHRvIGNo
ZWNrIHdoZXRoZXIgdGhlcmUgd2FzIGFuIGVycm9yIGhlcmUuIEJ1dCBhcyB5b3Ugc2FpZCwgd2UK
Y2Fubm90IHJlYWNoIGhlcmUgaWYgJ2NvbnRyb2wgdGhyZWFkJyBzZXQgbG9hZGluZ19zdGF0ZSBm
cm9tIExPQURJTkdfQ0FMTElOCnRvIExPQURJTkdfRVhJVC4gSSB3aWxsIGRvIHRoaXMgY2hlY2sg
aW4gdGhlIHdoaWxlLWxvb3AgcmlnaHQgYWJvdmUuCgo+PiArCj4+ICsgICAgcmV0ID0gbWljcm9j
b2RlX29wcy0+YXBwbHlfbWljcm9jb2RlKHBhdGNoKTsKPj4gKyAgICBpZiAoICFyZXQgKQo+PiAr
ICAgICAgICBhdG9taWNfaW5jKCZjcHVfdXBkYXRlZCk7Cj4+ICsgICAgYXRvbWljX2luYygmY3B1
X291dCk7Cj4+ICsKPj4gKyAgICB3aGlsZSAoIGxvYWRpbmdfc3RhdGUgIT0gTE9BRElOR19FWElU
ICkKPj4gKyAgICAgICAgY3B1X3JlbGF4KCk7Cj4+ICsKPj4gKyAgICByZXR1cm4gcmV0Owo+PiAr
fQo+PiArCj4+ICtzdGF0aWMgaW50IGNvbnRyb2xfdGhyZWFkX2ZuKGNvbnN0IHN0cnVjdCBtaWNy
b2NvZGVfcGF0Y2ggKnBhdGNoKQo+PiAgewo+PiAtICAgIHVuc2lnbmVkIGludCBjcHU7Cj4+ICsg
ICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKSwgZG9uZTsKPj4gKyAgICB1
bnNpZ25lZCBsb25nIHRpY2s7Cj4+ICsgICAgaW50IHJldDsKPj4gIAo+PiAtICAgIC8qIFN0b3Jl
IHRoZSBwYXRjaCBhZnRlciBhIHN1Y2Nlc3NmdWwgbG9hZGluZyAqLwo+PiAtICAgIGlmICggIW1p
Y3JvY29kZV91cGRhdGVfY3B1KHBhdGNoKSAmJiBwYXRjaCApCj4+ICsgICAgLyogQWxsb3cgdGhy
ZWFkcyB0byBjYWxsIGluICovCj4+ICsgICAgbG9hZGluZ19zdGF0ZSA9IExPQURJTkdfQ0FMTElO
Owo+PiArICAgIHNtcF9tYigpOwo+PiArCj4+ICsgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgJmNw
dV9jYWxsaW5fbWFwKTsKPj4gKwo+PiArICAgIC8qIFdhaXRpbmcgZm9yIGFsbCB0aHJlYWRzIGNh
bGxpbmcgaW4gKi8KPj4gKyAgICByZXQgPSB3YWl0X2Zvcl9jb25kaXRpb24od2FpdF9jcHVfY2Fs
bGluLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKSh1bnNpZ25lZCBs
b25nKW51bV9vbmxpbmVfY3B1cygpLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBN
SUNST0NPREVfQ0FMTElOX1RJTUVPVVRfVVMpOwo+PiArICAgIGlmICggcmV0ICkgewo+PiArICAg
ICAgICBsb2FkaW5nX3N0YXRlID0gTE9BRElOR19FWElUOwo+PiArICAgICAgICByZXR1cm4gcmV0
Owo+PiArICAgIH0KPgo+Li4udGhpcyBjb25kaXRpb24gaG9sZHMuIEhhdmUgeW91IGFjdHVhbGx5
IHRlc3RlZCB0aGlzIGNhc2U/CgpJIGRpZG4ndCBjcmFmdCBhIGNhc2UgdG8gdmVyaWZ5IHRoZSBl
cnJvci1oYW5kbGluZyBwYXRoLiBBbmQgSSBiZWxpZXZlCnRoYXQgeW91IGFyZSByaWdodC4gCgpU
aGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
