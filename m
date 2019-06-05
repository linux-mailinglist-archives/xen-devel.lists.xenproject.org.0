Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A3435FAF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:55:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYXIZ-0001Ie-4b; Wed, 05 Jun 2019 14:53:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYXIX-0001IX-P1
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:53:53 +0000
X-Inumbo-ID: bae74af4-87a1-11e9-bf8e-8334f84c4b05
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bae74af4-87a1-11e9-bf8e-8334f84c4b05;
 Wed, 05 Jun 2019 14:53:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 08:53:50 -0600
Message-Id: <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 08:53:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
In-Reply-To: <1558945891-3015-10-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Disposition: inline
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

Pj4+IE9uIDI3LjA1LjE5IGF0IDEwOjMxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBt
aWNyb2NvZGVfdXBkYXRlX2xvY2sgaXMgdG8gcHJldmVudCBsb2dpYyB0aHJlYWRzIG9mIGEgc2Ft
ZSBjb3JlIGZyb20KPiB1cGRhdGluZyBtaWNyb2NvZGUgYXQgdGhlIHNhbWUgdGltZS4gQnV0IGR1
ZSB0byB1c2luZyBhIGdsb2JhbCBsb2NrLCBpdAo+IGFsc28gcHJldmVudGVkIHBhcmFsbGVsIG1p
Y3JvY29kZSB1cGRhdGluZyBvbiBkaWZmZXJlbnQgY29yZXMuCj4gCj4gUmVtb3ZlIHRoaXMgbG9j
ayBpbiBvcmRlciB0byB1cGRhdGUgbWljcm9jb2RlIGluIHBhcmFsbGVsLiBJdCBpcyBzYWZlCj4g
YmVjYXVzZSB3ZSBoYXZlIGFscmVhZHkgZW5zdXJlZCBzZXJpYWxpemF0aW9uIG9mIHNpYmxpbmcg
dGhyZWFkcyBhdCB0aGUKPiBjYWxsZXIgc2lkZS4KPiAxLkZvciBsYXRlIG1pY3JvY29kZSB1cGRh
dGUsIGRvX21pY3JvY29kZV91cGRhdGUoKSBlbnN1cmVzIHRoYXQgb25seSBvbmUKPiAgIHNpYmls
aW5nIHRocmVhZCBvZiBhIGNvcmUgY2FuIHVwZGF0ZSBtaWNyb2NvZGUuCj4gMi5Gb3IgbWljcm9j
b2RlIHVwZGF0ZSBkdXJpbmcgc3lzdGVtIHN0YXJ0dXAgb3IgQ1BVLWhvdHBsdWcsCj4gICBtaWNy
b2NvZGVfbXV0ZXgoKSBndWFyYW50ZWVzIHVwZGF0ZSBzZXJpYWxpemF0aW9uIG9mIGxvZ2ljYWwg
dGhyZWFkcy4KPiAzLmdldC9wdXRfY3B1X2JpdG1hcHMoKSBwcmV2ZW50cyB0aGUgY29uY3VycmVu
Y3kgb2YgQ1BVLWhvdHBsdWcgYW5kCj4gICBsYXRlIG1pY3JvY29kZSB1cGRhdGUuCj4gCj4gTm90
ZSB0aGF0IHByaW50ayBpbiBhcHBseV9taWNyb2NvZGUoKSBhbmQgc3ZtX2hvc3Rfb3N2bV9pbml0
KCkgKGZvciBBTUQKPiBvbmx5KSBhcmUgc3RpbGwgcHJvY2Vzc2VkIHNlcXVlbnRpYWxseS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCj4gLS0tCj4gQ2hhbmdlcyBpbiB2
NzoKPiAgLSByZXdvcmtlZC4gUmVtb3ZlIGNvbXBsZXggbG9jayBsb2dpY3MgaW50cm9kdWNlZCBp
biB2NSBhbmQgdjYuIFRoZSBtaWNyb2NvZGUKPiAgcGF0Y2ggdG8gYmUgYXBwbGllZCBpcyBwYXNz
ZWQgYXMgYW4gYXJndW1lbnQgd2l0aG91dCBhbnkgZ2xvYmFsIHZhcmlhYmxlLiBUaHVzCj4gIG5v
IGxvY2sgaXMgYWRkZWQgdG8gc2VyaWFsaXplIHBvdGVudGlhbCByZWFkZXJzL3dyaXRlcnMuIENh
bGxlcnMgb2YKPiAgYXBwbHlfbWljcm9jb2RlKCkgd2lsbCBndWFyYW50ZWUgdGhlIGNvcnJlY3Ru
ZXNzOiB0aGUgcGF0Y2ggcG9uaW50ZWQgYnkgdGhlCj4gIGFyZ3VtZW50cyB3b24ndCBiZSBjaGFu
Z2VkIGJ5IG90aGVycy4KCk11Y2ggYmV0dGVyIHRoaXMgd2F5IGluZGVlZC4KCj4gQEAgLTMwNyw4
ICszMDMsNyBAQCBzdGF0aWMgaW50IGFwcGx5X21pY3JvY29kZShjb25zdCBzdHJ1Y3QgbWljcm9j
b2RlX3BhdGNoICpwYXRjaCkKPiAgCj4gICAgICBtY19pbnRlbCA9IHBhdGNoLT5tY19pbnRlbDsK
PiAgCj4gLSAgICAvKiBzZXJpYWxpemUgYWNjZXNzIHRvIHRoZSBwaHlzaWNhbCB3cml0ZSB0byBN
U1IgMHg3OSAqLwo+IC0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJm1pY3JvY29kZV91cGRhdGVfbG9j
aywgZmxhZ3MpOwo+ICsgICAgQlVHX09OKGxvY2FsX2lycV9pc19lbmFibGVkKCkpOwo+ICAKPiAg
ICAgIC8qCj4gICAgICAgKiBXcml0ZWJhY2sgYW5kIGludmFsaWRhdGUgY2FjaGVzIGJlZm9yZSB1
cGRhdGluZyBtaWNyb2NvZGUgdG8gYXZvaWQKClRoaW5raW5nIGFib3V0IGl0IC0gd2hhdCBoYXBw
ZW5zIGlmIHdlIGhpdCBhbiBOTUkgb3IgI01DIGhlcmU/CndhdGNoZG9nX2Rpc2FibGUoKSwgYSBj
YWxsIHRvIHdoaWNoIHlvdSBhZGQgaW4gYW4gZWFybGllciBwYXRjaCwKZG9lc24ndCByZWFsbHkg
c3VwcHJlc3MgdGhlIGdlbmVyYXRpb24gb2YgTk1JcywgaXQgb25seSB0ZWxscyB0aGUKaGFuZGxl
ciBub3QgdG8gbG9vayBhdCB0aGUgYWNjdW11bGF0ZWQgc3RhdGlzdGljcy4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
