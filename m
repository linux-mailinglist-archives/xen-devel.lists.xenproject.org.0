Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E413D9A8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 13:07:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is3ss-0003Na-BF; Thu, 16 Jan 2020 12:04:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is3sq-0003NV-9I
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 12:04:20 +0000
X-Inumbo-ID: 513e3d98-3858-11ea-8710-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 513e3d98-3858-11ea-8710-12813bfff9fa;
 Thu, 16 Jan 2020 12:04:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3BF4FAE6F;
 Thu, 16 Jan 2020 12:04:15 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>, Wei Liu <wei.liu2@citrix.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
Date: Thu, 16 Jan 2020 13:04:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxMzowNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gQEAgLTQ5OTIsMjIgKzQ5
OTMsNTUgQEAgaW50IG1tY2ZnX2ludGVyY2VwdF93cml0ZSgKPiAgfQo+ICAKPiAgdm9pZCAqYWxs
b2NfeGVuX3BhZ2V0YWJsZSh2b2lkKQo+ICt7Cj4gKyAgICBtZm5fdCBtZm4gPSBhbGxvY194ZW5f
cGFnZXRhYmxlX25ldygpOwo+ICsKPiArICAgIHJldHVybiBtZm5fZXEobWZuLCBJTlZBTElEX01G
TikgPyBOVUxMIDogbWZuX3RvX3ZpcnQobWZuX3gobWZuKSk7Cj4gK30KCklzbid0IGl0IG1vcmUg
ZGFuZ2Vyb3VzIHRvIGRvIHRoZSBtYXBwaW5nIHRoaXMgd2F5IHJvdW5kIHRoYW4gdGhlCm9wcG9z
aXRlIChuZXcgY2FsbHMgb2xkKT8gRG9uZSB0aGUgb3Bwb3NpdGUgd2F5IHRoZSBuZXcgZnVuY3Rp
b25zCmNvdWxkIGJlIHN3aXRjaGVkIHRvIHRoZWlyIG5ldyBpbXBsZW1lbnRhdGlvbnMgYWhlYWQg
b2YgdGhlCnJlbW92YWwgb2YgdGhlIG9sZCBvbmVzLCBhbmQgLSBpZiBzdWl0YWJseSBpc29sYXRl
ZCAtIHBlcmhhcHMKc29tZSBvZiB0aGVpciB1c2Vycy4gQW55d2F5LCBwZXJoYXBzIG1vcmUgYSB0
aGVvcmV0aWNhbCByZW1hcmsuCgo+ICt2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KQo+
ICt7Cj4gKyAgICBtZm5fdCBtZm4gPSB2ID8gdmlydF90b19tZm4odikgOiBJTlZBTElEX01GTjsK
PiArCj4gKyAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCApCj4g
KyAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOwoKVGhlIGNvbmRpdGlvbiBpcyAo
cGFydGx5KSByZWR1bmRhbnQgd2l0aCB3aGF0CmZyZWVfeGVuX3BhZ2V0YWJsZV9uZXcoKSBkb2Vz
LiBUaGVyZWZvcmUgSSdkIGxpa2UgdG8gYXNrIHRoYXQKZWl0aGVyIHRoZSBpZigpIGJlIGRyb3Bw
ZWQgaGVyZSwgb3IgYmUgY29tcGxldGVkIGJ5IGFsc28KY2hlY2tpbmcgdiB0byBiZSBub24tTlVM
TCwgYXQgd2hpY2ggcG9pbnQgdGhpcyB3b3VsZCBsaWtlbHkKYmVjb21lIGp1c3QKCnZvaWQgZnJl
ZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpCnsKICAgIGlmICggdiAmJiBzeXN0ZW1fc3RhdGUgIT0g
U1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQogICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZV9uZXcodmly
dF90b19tZm4odikpOwp9Cgo+ICsvKiB2IGNhbiBwb2ludCB0byBhbiBlbnRyeSB3aXRoaW4gYSB0
YWJsZSBvciBiZSBOVUxMICovCj4gK3ZvaWQgdW5tYXBfeGVuX3BhZ2V0YWJsZShjb25zdCB2b2lk
ICp2KQoKV2h5ICJlbnRyeSIgaW4gdGhlIGNvbW1lbnQ/CgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
