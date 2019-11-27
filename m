Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499AD10A901
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 04:10:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZnfG-0001Ob-Qi; Wed, 27 Nov 2019 03:06:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ALDp=ZT=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iZnfG-0001OW-3d
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 03:06:50 +0000
X-Inumbo-ID: f387193e-10c2-11ea-a3a9-12813bfff9fa
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f387193e-10c2-11ea-a3a9-12813bfff9fa;
 Wed, 27 Nov 2019 03:06:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 19:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,247,1571727600"; d="scan'208";a="240170122"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 19:06:42 -0800
Date: Wed, 27 Nov 2019 11:10:43 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20191127031041.GA14015@gao-cwp>
References: <20191126154153.12144-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126154153.12144-1-sergey.dyasli@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v3 for 4.13] x86/microcode: refuse to load
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

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6NDE6NTNQTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3
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
bmRseSBtZXNzYWdlIGlmIG5vIG1hdGNoaW5nIG9yIG5ld2VyCj51Y29kZSBjYW4gYmUgZm91bmQg
aW4gdGhlIHByb3ZpZGVkIGJsb2IuIFRoaXMgYWxzbyByZXF1aXJlcyBpZ25vcmluZwo+LUVOT0RB
VEEgaW4gQU1ELXNpZGUgY29kZSwgb3RoZXJ3aXNlIHRoZSBtZXNzYWdlIGdpdmVuIHRvIHRoZSB1
c2VyIGlzOgo+Cj4gICAgKFhFTikgUGFyc2luZyBtaWNyb2NvZGUgYmxvYiBlcnJvciAtNjEKPgo+
V2hpY2ggYWN0dWFsbHkgbWVhbnMgdGhhdCBhIHVjb2RlIGJsb2Igd2FzIHBhcnNlZCBmaW5lLCBi
dXQgbm8gbWF0Y2hpbmcKPnVjb2RlIHdhcyBmb3VuZC4KPgo+U2lnbmVkLW9mZi1ieTogU2VyZ2V5
IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+LS0tCj52MiAtLT4gdjM6Cj4tIG1v
dmUgdWNvZGUgY29tcGFyaXNvbiB0byBnZW5lcmljIGNvZGUKPi0gaWdub3JlIC1FTk9EQVRBIGlu
IGEgZGlmZmVyZW50IGNvZGUgc2VjdGlvbgo+Cj52MSAtLT4gdjI6Cj4tIGNvbXBhcmUgcHJvdmlk
ZWQgdWNvZGUgd2l0aCB0aGUgY3VycmVudGx5IGNhY2hlZCBvbmUKPgo+Q0M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
Q0M6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj5DQzogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+LS0tCj4geGVuL2FyY2gveDg2L21pY3JvY29kZS5jICAgICB8IDE5ICsr
KysrKysrKysrKysrKysrKysKPiB4ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jIHwgIDcgKysr
KysrKwo+IDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21pY3JvY29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj5pbmRl
eCA2NWQxZjQxZTdjLi40NGVmYzJkOWIzIDEwMDY0NAo+LS0tIGEveGVuL2FyY2gveDg2L21pY3Jv
Y29kZS5jCj4rKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKPkBAIC02NDAsMTAgKzY0MCwy
OSBAQCBpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3Zv
aWQpIGJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4pCj4gCj4gICAgIGlmICggIXBhdGNoICkKPiAgICAg
ewo+KyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJtaWNyb2NvZGU6IGNvdWxkbid0IGZp
bmQgYW55IG1hdGNoaW5nIHVjb2RlIGluICIKPisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAidGhlIHByb3ZpZGVkIGJsb2IhXG4iKTsKPiAgICAgICAgIHJldCA9IC1FTk9FTlQ7Cj4gICAg
ICAgICBnb3RvIHB1dDsKPiAgICAgfQo+IAo+KyAgICAvKgo+KyAgICAgKiBJZiBtaWNyb2NvZGVf
Y2FjaGUgZXhpc3RzLCBhbGwgQ1BVcyBpbiB0aGUgc3lzdGVtIHNob3VsZCBoYXZlIGF0IGxlYXN0
Cj4rICAgICAqIHRoYXQgdWNvZGUgcmV2aXNpb24uCj4rICAgICAqLwo+KyAgICBzcGluX2xvY2so
Jm1pY3JvY29kZV9tdXRleCk7Cj4rICAgIGlmICggbWljcm9jb2RlX2NhY2hlICYmCj4rICAgICAg
ICAgbWljcm9jb2RlX29wcy0+Y29tcGFyZV9wYXRjaChwYXRjaCwgbWljcm9jb2RlX2NhY2hlKSAh
PSBORVdfVUNPREUgKQo+KyAgICB7Cj4rICAgICAgICBzcGluX3VubG9jaygmbWljcm9jb2RlX211
dGV4KTsKPisgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAibWljcm9jb2RlOiBjb3VsZG4n
dCBmaW5kIGFueSBuZXdlciByZXZpc2lvbiAiCj4rICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgImluIHRoZSBwcm92aWRlZCBibG9iIVxuIik7CgpUaGUgcGF0Y2ggbmVlZHMgdG8gYmUgZnJl
ZWQuCgpXaXRoIGl0IGZpeGVkLApSZXZpZXdlZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVs
LmNvbT4KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
