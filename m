Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECB10867A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 03:23:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZ3xK-0006fC-Fq; Mon, 25 Nov 2019 02:18:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q4Vk=ZR=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iZ3xJ-0006f7-AB
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 02:18:25 +0000
X-Inumbo-ID: da8835ca-0f29-11ea-b08b-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da8835ca-0f29-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 02:18:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Nov 2019 18:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,239,1571727600"; d="scan'208";a="216824937"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2019 18:18:19 -0800
Date: Mon, 25 Nov 2019 10:22:21 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20191125022219.GA4712@gao-cwp>
References: <20191122164723.1302-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122164723.1302-1-sergey.dyasli@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v2 for 4.13] x86/microcode: refuse to load
 the same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDQ6NDc6MjNQTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPkN1cnJlbnRseSBpZiBhIHVzZXIgdHJpZXMgdG8gbGl2ZS1sb2FkIHRoZSBzYW1lIG9y
IG9sZGVyIHVjb2RlIHJldmlzaW9uCj50aGFuIENQVSBhbHJlYWR5IGhhcywgaGUgd2lsbCBnZXQg
YSBzaW5nbGUgbWVzc2FnZSBpbiBYZW4gbG9nIGxpa2U6Cj4KPiAgICAoWEVOKSAxMjggY29yZXMg
YXJlIHRvIHVwZGF0ZSB0aGVpciBtaWNyb2NvZGUKPgo+Tm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcg
d2lsbCBoYXBwZW4gYW5kIHRoaXMgc2l0dWF0aW9uIGNhbiBiZSBxdWl0ZQo+Y29uZnVzaW5nLiBG
aXggdGhpcyBieSBzdGFydGluZyB1Y29kZSB1cGRhdGUgb25seSB3aGVuIHRoZSBwcm92aWRlZAo+
dWNvZGUgcmV2aXNpb24gaXMgaGlnaGVyIHRoYW4gdGhlIGN1cnJlbnRseSBjYWNoZWQgb25lIChp
ZiBhbnkpLgo+VGhpcyBpcyBiYXNlZCBvbiB0aGUgcHJvcGVydHkgdGhhdCBpZiBtaWNyb2NvZGVf
Y2FjaGUgZXhpc3RzLCBhbGwgQ1BVcwo+aW4gdGhlIHN5c3RlbSBzaG91bGQgaGF2ZSBhdCBsZWFz
dCB0aGF0IHVjb2RlIHJldmlzaW9uLgo+Cj5BZGRpdGlvbmFsbHksIHByaW50IGEgdXNlciBmcmll
bmRseSBtZXNzYWdlIGlmIG5vIG5ld2VyIHVjb2RlIGNhbiBiZQo+Zm91bmQgaW4gdGhlIHByb3Zp
ZGVkIGJsb2IuIFRoaXMgYWxzbyByZXF1aXJlcyBpZ25vcmluZyAtRU5PREFUQSBpbgo+QU1ELXNp
ZGUgY29kZSwgb3RoZXJ3aXNlIHRoZSBtZXNzYWdlIGdpdmVuIHRvIHRoZSB1c2VyIGlzOgo+Cj4g
ICAgKFhFTikgUGFyc2luZyBtaWNyb2NvZGUgYmxvYiBlcnJvciAtNjEKPgo+V2hpY2ggYWN0dWFs
bHkgbWVhbnMgdGhhdCBhIHVjb2RlIGJsb2Igd2FzIHBhcnNlZCBmaW5lLCBidXQgbm8gbWF0Y2hp
bmcKPnVjb2RlIHdhcyBmb3VuZC4KPgo+U2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2Vy
Z2V5LmR5YXNsaUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0Bp
bnRlbC5jb20+CgpJIHdvbmRlciB3aGV0aGVyIGl0IGlzIGJldHRlciB0byBwdXQgdGhlIGNvbXBh
cmlzb24gLi4uCgo+LS0tCj52MSAtLT4gdjI6Cj4tIGNvbXBhcmUgcHJvdmlkZWQgdWNvZGUgd2l0
aCB0aGUgY3VycmVudGx5IGNhY2hlZCBvbmUKPgo+Q0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Q0M6IENoYW8gR2Fv
IDxjaGFvLmdhb0BpbnRlbC5jb20+Cj5DQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+LS0tCj4geGVuL2FyY2gveDg2L21pY3JvY29kZS5jICAgICAgICB8IDEyICsrKysrKysrKyst
LQo+IHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMgICAgfCAxNCArKysrKysrKysrLS0tLQo+
IHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYyAgfCAxMiArKysrKysrKystLS0KPiB4ZW4v
aW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oIHwgIDMgKystCj4gNCBmaWxlcyBjaGFuZ2VkLCAz
MSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9taWNyb2NvZGUuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+aW5kZXggNjVkMWY0
MWU3Yy4uZGNkMmMzZmY3NyAxMDA2NDQKPi0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+
KysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj5AQCAtMjY2LDEwICsyNjYsMTYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm5taV9wYXRjaCA9IFpFUk9fQkxPQ0tf
UFRSOwo+ICAqLwo+IHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXJzZV9ibG9iKGNv
bnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGxlbikKPiB7Cj4rICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0
Y2ggKnJldCA9IE5VTEw7Cj4rCj4gICAgIGlmICggbGlrZWx5KCFtaWNyb2NvZGVfb3BzLT5jb2xs
ZWN0X2NwdV9pbmZvKCZ0aGlzX2NwdShjcHVfc2lnKSkpICkKPi0gICAgICAgIHJldHVybiBtaWNy
b2NvZGVfb3BzLT5jcHVfcmVxdWVzdF9taWNyb2NvZGUoYnVmLCBsZW4pOwo+KyAgICB7Cj4rICAg
ICAgICBzcGluX2xvY2soJm1pY3JvY29kZV9tdXRleCk7Cj4rICAgICAgICByZXQgPSBtaWNyb2Nv
ZGVfb3BzLT5jcHVfcmVxdWVzdF9taWNyb2NvZGUoYnVmLCBsZW4sIG1pY3JvY29kZV9jYWNoZSk7
Cj4rICAgICAgICBzcGluX3VubG9jaygmbWljcm9jb2RlX211dGV4KTsKPisgICAgfQo+IAo+LSAg
ICByZXR1cm4gTlVMTDsKPisgICAgcmV0dXJuIHJldDsKPiB9Cj4gCj4gdm9pZCBtaWNyb2NvZGVf
ZnJlZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVfcGF0Y2gpCj5AQCAt
NjQxLDYgKzY0Nyw4IEBAIGludCBtaWNyb2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFS
QU0oY29uc3Rfdm9pZCkgYnVmLCB1bnNpZ25lZCBsb25nIGxlbikKPiAgICAgaWYgKCAhcGF0Y2gg
KQo+ICAgICB7Cj4gICAgICAgICByZXQgPSAtRU5PRU5UOwo+KyAgICAgICAgcHJpbnRrKFhFTkxP
R19XQVJOSU5HICJtaWNyb2NvZGU6IGNvdWxkbid0IGZpbmQgYW55IG5ld2VyIHJldmlzaW9uIGlu
ICIKPisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidGhlIHByb3ZpZGVkIGJsb2IhXG4i
KTsKPiAgICAgICAgIGdvdG8gcHV0Owo+ICAgICB9CgouLi4gYWZ0ZXIgdGhpcyBpZigpLiBUaGVu
IHlvdSBuZWVkbid0IG1vZGlmeSBhbnkgdmVuZG9yLXNwZWNpZmljIGNvZGUuCgpUaGFua3MKQ2hh
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
