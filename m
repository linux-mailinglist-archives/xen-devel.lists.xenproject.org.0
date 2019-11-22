Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4098107273
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 13:50:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY8MX-0002HF-7h; Fri, 22 Nov 2019 12:48:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VfmI=ZO=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iY8MV-0002HA-PP
 for xen-devel@lists.xen.org; Fri, 22 Nov 2019 12:48:35 +0000
X-Inumbo-ID: 6488f468-0d26-11ea-a350-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6488f468-0d26-11ea-a350-12813bfff9fa;
 Fri, 22 Nov 2019 12:48:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 04:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="238593870"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2019 04:48:28 -0800
Date: Fri, 22 Nov 2019 20:52:29 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191122125228.GA28552@gao-cwp>
References: <20191122105202.25507-1-sergey.dyasli@citrix.com>
 <22b7b490-6140-36ab-d49a-2177c817d28d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22b7b490-6140-36ab-d49a-2177c817d28d@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v1 for 4.13] x86/microcode: refuse to load
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6MTk6NDFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAyMi4xMS4yMDE5IDExOjUyLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBDdXJyZW50
bHkgaWYgYSB1c2VyIHRyaWVzIHRvIGxpdmUtbG9hZCB0aGUgc2FtZSB1Y29kZSByZXZpc2lvbiB0
aGF0IENQVQo+PiBhbHJlYWR5IGhhcywgaGUgd2lsbCBnZXQgYSBzaW5nbGUgbWVzc2FnZSBpbiBY
ZW4gbG9nIGxpa2U6Cj4+IAo+PiAgICAgKFhFTikgMTI4IGNvcmVzIGFyZSB0byB1cGRhdGUgdGhl
aXIgbWljcm9jb2RlCj4+IAo+PiBObyBhY3R1YWwgdWNvZGUgbG9hZGluZyB3aWxsIGhhcHBlbiBh
bmQgdGhpcyBzaXR1YXRpb24gY2FuIGJlIHF1aXRlCj4+IGNvbmZ1c2luZy4gRml4IHRoaXMgYnkg
c3RhcnRpbmcgdWNvZGUgdXBkYXRlIG9ubHkgd2hlbiBhIG5ld2VyIHVjb2RlCj4+IHJldmlzaW9u
IGhhcyBiZWVuIHByb3ZpZGVkLiBUaGlzIGlzIGJhc2VkIG9uIGFuIGFzc3VtcHRpb24gdGhhdCBh
bGwgQ1BVcwo+PiBpbiB0aGUgc3lzdGVtIGhhdmUgdGhlIHNhbWUgdWNvZGUgcmV2aXNpb24uIElm
IHRoYXQncyBub3QgdGhlIGNhc2UsCj4+IHRoZSBzeXN0ZW0gbXVzdCBiZSBjb25zaWRlcmVkIHVu
c3RhYmxlLgo+Cj5VbnN0YWJsZSBvciBub3QsIEkgZGlkIHNwZWNpZmljYWxseSBjb252aW5jZSBD
aGFvIHRvIGhhbmRsZSBzdWNoCj5zeXN0ZW1zLCBicmluZ2luZyB0aGVtIGludG8gYmV0dGVyIHNo
YXBlLiBJIGNhbiBvbmx5IHJlcGVhdCB0aGF0Cj5JIGFjdHVhbGx5IGhhdmUgYSBzeXN0ZW0gd2hl
cmUgb24gZWFjaCBzb2NrZXQgZmlybXdhcmUgbG9hZHMgdWNvZGUKPm9ubHkgb24gdGhlIGZpcnN0
IGNvcmUuIEkgZG9uJ3Qgc2VlIHdoeSBib290IHRpbWUgbG9hZGluZyBhbmQgbGF0ZQo+bG9hZGlu
ZyBzaG91bGQgZGlmZmVyIGluIGJlaGF2aW9yIGZvciBzdWNoIGEgc3lzdGVtLgoKWWVzLiAKCkkg
dHJpZWQgdG8gbG9hZCBhbiBvbGRlciB1Y29kZSBidXQgYWxzbyBnb3QgdGhlIHNhbWUgbWVzc2Fn
ZS4gU28gSSB0aGluawphbiBvcHRpbWl6YXRpb24gY2FuIGJlIGRvbmU6CndlIGNhbiBhc3N1bWUg
dGhhdCBpZiB0aGVyZSBpcyBhIG1pY3JvY29kZV9jYWNoZSwgYWxsIENQVXMKc2hvdWxkIGhhdmUg
ZXF1YWwgb3IgbmV3ZXIgcmV2aXNpb24gdGhhbiB0aGUgbWljcm9jb2RlX2NhY2hlLiBJZgp0aGUg
cGF0Y2ggdG8gYmUgbG9hZGVkIGhhcyBlcXVhbCBvciBvbGRlciByZXZpc2lvbiwgd2UgY2FuIHJl
ZnVzZSB0bwpsb2FkIHRvIGF2b2lkIHRoZSBoZWF2eSBzdG9wX21hY2hpbmUoKS4KClRoYW5rcwpD
aGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
