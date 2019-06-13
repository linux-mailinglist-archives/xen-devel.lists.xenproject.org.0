Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5B43713
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:04:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbQI2-0005DM-6j; Thu, 13 Jun 2019 14:01:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2com=UM=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hbQI0-0005DE-Kh
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:01:16 +0000
X-Inumbo-ID: b5038448-8de3-11e9-92c4-2badc56cb3ec
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5038448-8de3-11e9-92c4-2badc56cb3ec;
 Thu, 13 Jun 2019 14:01:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 07:01:14 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2019 07:01:12 -0700
Date: Thu, 13 Jun 2019 22:05:26 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190613140524.GA2355@gao-cwp>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
 <20190611124604.GB22930@gao-cwp> <20190611160416.GB44426@otc-nc-03>
 <5D00ABF70200007800237502@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D00ABF70200007800237502@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6Mzg6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMTEuMDYuMTkgYXQgMTg6MDQsIDxhc2hvay5yYWpAaW50ZWwuY29tPiB3cm90
ZToKPj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDg6NDY6MDRQTSArMDgwMCwgQ2hhbyBHYW8g
d3JvdGU6Cj4+PiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAwODo1Mzo0NkFNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+ID4KPj4+ID4+IEBAIC0zMDcsOCArMzAzLDcgQEAgc3RhdGljIGlu
dCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAKPj4gKnBhdGNo
KQo+Pj4gPj4gIAo+Pj4gPj4gICAgICBtY19pbnRlbCA9IHBhdGNoLT5tY19pbnRlbDsKPj4+ID4+
ICAKPj4+ID4+IC0gICAgLyogc2VyaWFsaXplIGFjY2VzcyB0byB0aGUgcGh5c2ljYWwgd3JpdGUg
dG8gTVNSIDB4NzkgKi8KPj4+ID4+IC0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJm1pY3JvY29kZV91
cGRhdGVfbG9jaywgZmxhZ3MpOwo+Pj4gPj4gKyAgICBCVUdfT04obG9jYWxfaXJxX2lzX2VuYWJs
ZWQoKSk7Cj4+PiA+PiAgCj4+PiA+PiAgICAgIC8qCj4+PiA+PiAgICAgICAqIFdyaXRlYmFjayBh
bmQgaW52YWxpZGF0ZSBjYWNoZXMgYmVmb3JlIHVwZGF0aW5nIG1pY3JvY29kZSB0byBhdm9pZAo+
Pj4gPgo+Pj4gPlRoaW5raW5nIGFib3V0IGl0IC0gd2hhdCBoYXBwZW5zIGlmIHdlIGhpdCBhbiBO
TUkgb3IgI01DIGhlcmU/Cj4+PiA+d2F0Y2hkb2dfZGlzYWJsZSgpLCBhIGNhbGwgdG8gd2hpY2gg
eW91IGFkZCBpbiBhbiBlYXJsaWVyIHBhdGNoLAo+Pj4gPmRvZXNuJ3QgcmVhbGx5IHN1cHByZXNz
IHRoZSBnZW5lcmF0aW9uIG9mIE5NSXMsIGl0IG9ubHkgdGVsbHMgdGhlCj4+PiA+aGFuZGxlciBu
b3QgdG8gbG9vayBhdCB0aGUgYWNjdW11bGF0ZWQgc3RhdGlzdGljcy4KPj4+IAo+Pj4gSSB0aGlu
ayB0aGV5IHNob3VsZCBiZSBzdXBwcmVzc2VkLiBBc2hvaywgY291bGQgeW91IGNvbmZpcm0gaXQ/
Cj4+IAo+PiBJIHRoaW5rIHRoZSBvbmx5IHNvdXJjZXMgd291bGQgYmUgdGhlIHdhdGNoZG9nIGFz
IHlvdSBwb2ludGVkIG91dAo+PiB3aGljaCB3ZSBhbHJlYWR5IHRvdWNoIHRvIGtlZXAgaXQgZnJv
bSBleHBpcmluZy4gVGhlIHBlcmYgY291bnRlcnMKPj4gaSdtIG5vdCBhbiBleHBlcnQgaW4sIGJ1
dCBpJ2xsIGNoZWNrLiBXaGVuIHdlIGFyZSBpbiBzdG9wX21hY2hpbmUoKSB0eXBlCj4+IGZsb3cs
IGl0cyBub3QgY2xlYXIgaWYgYW55IG9mIHRob3NlIHdvdWxkIGZpcmUuIChJIG1pZ2h0IGJlIHdy
b25nLCBidXQgbGV0Cj4+IG1lIGNoZWNrKS4KPgo+V2VsbCwgd2l0aG91dCBkaXNhcm1pbmcgdGhl
IHdhdGNoZG9nIE5NSSBhdCB0aGUgTEFQSUMgLyBJTy1BUElDLAo+aG93IHdvdWxkIGl0IF9ub3Rf
IHBvdGVudGlhbGx5IGZpcmU/CgpXZSBwbGFuIG5vdCB0byBwcmV2ZW50IE5NSSBiZWluZyBmaXJl
ZC4gSW5zdGVhZCwgaWYgb25lIHRocmVhZCBvZiBhIGNvcmUKaXMgdXBkYXRpbmcgbWljcm9jb2Rl
LCBvdGhlciB0aHJlYWRzIG9mIHRoaXMgY29yZSB3b3VsZCBzdG9wIGluIHRoZQpoYW5kbGVyIG9m
IE5NSSB1bnRpbCB0aGUgdXBkYXRlIGNvbXBsZXRpb24uIElzIHRoaXMgYXBwcm9hY2ggYWNjZXB0
YWJsZT8KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
