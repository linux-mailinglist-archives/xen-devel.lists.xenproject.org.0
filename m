Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2E73CC60
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 15:02:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagMH-0000U4-S0; Tue, 11 Jun 2019 12:58:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Poke=UK=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hagMF-0000Tr-Od
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:58:35 +0000
X-Inumbo-ID: 9ebb96e0-8c48-11e9-8980-bc764e045a96
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9ebb96e0-8c48-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:58:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 05:58:32 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2019 05:58:30 -0700
Date: Tue, 11 Jun 2019 21:02:44 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190611130244.GD22930@gao-cwp>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-11-git-send-email-chao.gao@intel.com>
 <20190605145601.xgh6x2pz4xw3jgfu@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605145601.xgh6x2pz4xw3jgfu@Air-de-Roger>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v7 10/10] x86/microcode: always
 collect_cpu_info() during boot
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
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDQ6NTY6MDFQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDA0OjMxOjMxUE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBGcm9tOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5j
b20+Cj4+IAo+PiBDdXJyZW50bHkgY3B1X3NpZyBzdHJ1Y3QgaXMgbm90IHVwZGF0ZWQgZHVyaW5n
IGJvb3Qgd2hlbiBlaXRoZXI6Cj4+IAo+PiAgICAgMS4gdWNvZGVfc2NhbiBpcyBzZXQgdG8gZmFs
c2UgKGUuZy4gbm8gInVjb2RlPXNjYW4iIGluIGNtZGxpbmUpCj4+ICAgICAyLiBpbml0cmQgZG9l
cyBub3QgY29udGFpbiBhIG1pY3JvY29kZSBibG9iCj4+IAo+PiBUaGVzZSB3aWxsIHJlc3VsdCBp
biBjcHVfc2lnLnJldiBiZWluZyAwIHdoaWNoIGFmZmVjdHMgQVBJQydzCj4+IGNoZWNrX2RlYWRs
aW5lX2VycmF0YSgpIGFuZCByZXRwb2xpbmVfc2FmZSgpIGZ1bmN0aW9ucy4KPj4gCj4+IEZpeCB0
aGlzIGJ5IGdldHRpbmcgdWNvZGUgcmV2aXNpb24gZWFybHkgZHVyaW5nIGJvb3QgYW5kIFNNUCBi
cmluZyB1cC4KPj4gV2hpbGUgYXQgaXQuCj4KPkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgbGFzdCAi
V2hpbGUgYXQgaXQiIHNlbnRlbmNlLiBDYW4gaXQgYmUKPnJlbW92ZWQ/CgpZZXMuCgo+Cj5JcyB0
aGlzIGFuIGlzc3VlIHdpdGggY3VycmVudCBjb2RlPyBJZiBzbyB0aGlzIGNvdWxkIGJlIG1lcmdl
ZCBhaGVhZCBvZgo+dGhlIHJlc3Qgb2YgdGhlIHNlcmllcywgYW5kIHNob3VsZCBsaWtlbHkgYmUg
cGF0Y2ggMS4KPgo+T1RPSCBpZiB0aGUgaXNzdWUgdGhpcyBwYXRjaCBpcyBmaXhpbmcgaXMgaW50
cm9kdWNlZCBieSB0aGlzIHNlcmllcwo+cGxlYXNlIG1lcmdlIHRoZSBmaXggd2l0aCB0aGUgcmVz
cGVjdGl2ZSBwYXRjaCB0aGF0IGludHJvZHVjZWQgdGhlCj5idWcuCgpJdCBpcyB0aGUgZm9ybWVy
LiBXaWxsIHNlbmQgaXQgc2VwYXJhdGVseS4KUmVhbGx5IGFwcHJlY2lhdGUgeW91ciBvdGhlciBj
b21tZW50cy4KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
