Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A303D1B6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:06:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajG1-00006d-KK; Tue, 11 Jun 2019 16:04:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+3hp=UK=intel.com=ashok.raj@srs-us1.protection.inumbo.net>)
 id 1hajG0-00006R-6V
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:04:20 +0000
X-Inumbo-ID: 90f664ea-8c62-11e9-8980-bc764e045a96
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 90f664ea-8c62-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 16:04:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 09:04:17 -0700
X-ExtLoop1: 1
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.145])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2019 09:04:17 -0700
Date: Tue, 11 Jun 2019 09:04:17 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190611160416.GB44426@otc-nc-03>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
 <20190611124604.GB22930@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611124604.GB22930@gao-cwp>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Xen-devel] [PATCH v7 09/10] microcode: remove
 microcode_update_lock
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
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDg6NDY6MDRQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDg6NTM6NDZBTSAtMDYwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPgo+ID4+IEBAIC0zMDcsOCArMzAzLDcgQEAgc3RhdGljIGludCBhcHBseV9taWNy
b2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCj4gPj4gIAo+ID4+ICAg
ICAgbWNfaW50ZWwgPSBwYXRjaC0+bWNfaW50ZWw7Cj4gPj4gIAo+ID4+IC0gICAgLyogc2VyaWFs
aXplIGFjY2VzcyB0byB0aGUgcGh5c2ljYWwgd3JpdGUgdG8gTVNSIDB4NzkgKi8KPiA+PiAtICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdzKTsKPiA+PiAr
ICAgIEJVR19PTihsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPiA+PiAgCj4gPj4gICAgICAvKgo+
ID4+ICAgICAgICogV3JpdGViYWNrIGFuZCBpbnZhbGlkYXRlIGNhY2hlcyBiZWZvcmUgdXBkYXRp
bmcgbWljcm9jb2RlIHRvIGF2b2lkCj4gPgo+ID5UaGlua2luZyBhYm91dCBpdCAtIHdoYXQgaGFw
cGVucyBpZiB3ZSBoaXQgYW4gTk1JIG9yICNNQyBoZXJlPwo+ID53YXRjaGRvZ19kaXNhYmxlKCks
IGEgY2FsbCB0byB3aGljaCB5b3UgYWRkIGluIGFuIGVhcmxpZXIgcGF0Y2gsCj4gPmRvZXNuJ3Qg
cmVhbGx5IHN1cHByZXNzIHRoZSBnZW5lcmF0aW9uIG9mIE5NSXMsIGl0IG9ubHkgdGVsbHMgdGhl
Cj4gPmhhbmRsZXIgbm90IHRvIGxvb2sgYXQgdGhlIGFjY3VtdWxhdGVkIHN0YXRpc3RpY3MuCj4g
Cj4gSSB0aGluayB0aGV5IHNob3VsZCBiZSBzdXBwcmVzc2VkLiBBc2hvaywgY291bGQgeW91IGNv
bmZpcm0gaXQ/CgpJIHRoaW5rIHRoZSBvbmx5IHNvdXJjZXMgd291bGQgYmUgdGhlIHdhdGNoZG9n
IGFzIHlvdSBwb2ludGVkIG91dAp3aGljaCB3ZSBhbHJlYWR5IHRvdWNoIHRvIGtlZXAgaXQgZnJv
bSBleHBpcmluZy4gVGhlIHBlcmYgY291bnRlcnMKaSdtIG5vdCBhbiBleHBlcnQgaW4sIGJ1dCBp
J2xsIGNoZWNrLiBXaGVuIHdlIGFyZSBpbiBzdG9wX21hY2hpbmUoKSB0eXBlCmZsb3csIGl0cyBu
b3QgY2xlYXIgaWYgYW55IG9mIHRob3NlIHdvdWxkIGZpcmUuIChJIG1pZ2h0IGJlIHdyb25nLCBi
dXQgbGV0Cm1lIGNoZWNrKS4KCiNNQyBzaG91bGRuJ3QgZmlyZSBvbmNlIHlvdSBlbnRlcmVkIHRo
ZSByZW5kZXp2b3VzLCBpZiBpdCBkb2VzIGl0cyB1c3VhbGx5CmZhdGFsIGxpa2UgYSAzc3RyaWtl
IG9yIHNvbWV0aGluZy4gTWFjaGluZSBpcyBnb2luZyBkb3duIGF0IHRoYXQgdGltZQpzbyBub3Ro
aW5nIHdlIGNvdWxkIGRvIHRvIGhhbmRsZS4KCkNoZWVycywKQXNob2sKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
