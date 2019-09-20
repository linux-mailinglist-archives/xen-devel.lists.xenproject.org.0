Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E0B8F0F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 13:39:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBHBs-0008KW-R9; Fri, 20 Sep 2019 11:35:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBHBr-0008KR-NC
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 11:35:07 +0000
X-Inumbo-ID: b10b8584-db9a-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b10b8584-db9a-11e9-a337-bc764e2007e4;
 Fri, 20 Sep 2019 11:35:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4388AC90;
 Fri, 20 Sep 2019 11:35:04 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
Date: Fri, 20 Sep 2019 13:35:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190903161428.7159-7-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+IEBA
IC0xNDkzLDkgKzE0OTMsMTggQEAgaW50IGh2bV9zZW5kX2lvcmVxKGlvc2VydmlkX3QgaWQsIGlv
cmVxX3QgKnByb3RvX3AsIGJvb2wgYnVmZmVyZWQpCj4gIAo+ICAgICAgQVNTRVJUKHMpOwo+ICAK
PiArICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSAmJiBidWZmZXJlZCApCj4gKyAg
ICB7Cj4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gKyAgICAgICAgcmV0dXJuIFg4
NkVNVUxfVU5IQU5ETEVBQkxFOwo+ICsgICAgfQo+ICsKPiAgICAgIGlmICggYnVmZmVyZWQgKQo+
ICAgICAgICAgIHJldHVybiBodm1fc2VuZF9idWZmZXJlZF9pb3JlcShzLCBwcm90b19wKTsKClBl
cmhhcHMgYmV0dGVyICh0byBhdm9pZCB5ZXQgYW5vdGhlciBjb25kaXRpb25hbCBvbiB0aGUgbm9u
LQpidWZmZXJlZCBwYXRoKQoKICAgIGlmICggYnVmZmVyZWQgKQogICAgewogICAgICAgIGlmICgg
bGlrZWx5KCFodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpKSApCiAgICAgICAgICAgIHJldHVybiBo
dm1fc2VuZF9idWZmZXJlZF9pb3JlcShzLCBwcm90b19wKTsKCiAgICAgICAgQVNTRVJUX1VOUkVB
Q0hBQkxFKCk7CiAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwogICAgfQoKPwoK
PiArICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSApCj4gKyAgICAgICAgcmV0dXJu
IHMtPmhhbmRsZXIoY3VyciwgcHJvdG9fcCwgcy0+ZGF0YSk7CgpBdCB0aGlzIHBvaW50IEknbSBi
ZWNvbWluZyBjdXJpb3VzIHdoYXQgdGhlIHNpZ25pZmljYW5jZSBvZgppb3JlcV90J3Mgc3RhdGUg
ZmllbGQgaXMgZm9yIGludGVybmFsIHNlcnZlcnMsIGFzIG5vdGhpbmcgd2FzCnNhaWQgc28gZmFy
IGluIHRoaXMgcmVnYXJkOiBJcyBpdCBlbnRpcmVseSB1bnVzZWQ/IElzIGV2ZXJ5CmhhbmRsZXIg
c3VwcG9zZWQgdG8gZHJpdmUgaXQ/IElmIHNvLCB3aGF0IGFib3V0IHJldHVybiB2YWx1ZQpoZXJl
IGFuZCBwcm90b19wLT5zdGF0ZSBub3QgcmVhbGx5IG1hdGNoaW5nIHVwPyBBbmQgaWYgbm90LApz
aG91bGRuJ3QgeW91IHVwZGF0ZSB0aGUgZmllbGQgaGVyZSwgYXQgdGhlIHZlcnkgbGVhc3QgdG8K
YXZvaWQgYW55IGNoYW5jZSBvZiBjb25mdXNpbmcgY2FsbGVycz8KCkEgcG9zc2libGUgY29uc2Vx
dWVuY2Ugb2YgdGhlIGFuc3dlcnMgdG8gdGhpcyBtaWdodCBiZSBmb3IKdGhlIGhvb2sncyBtaWRk
bGUgcGFyYW1ldGVyIHRvIGJlIGNvbnN0aWZpZWQgKGluIHBhdGNoIDQpLgoKSGF2aW5nIHNhaWQg
dGhpcywgYXMgYSByZXN1bHQgb2YgaGF2aW5nIGxvb2tlZCBhdCBzb21lIG9mIHRoZQppbnZvbHZl
ZCBjb2RlLCBhbmQgd2l0aCB0aGUgY292ZXIgbGV0dGVyIG5vdCBjbGFyaWZ5aW5nIHRoaXMsCndo
YXQncyB0aGUgcmVhc29uIGZvciBnb2luZyB0aGlzIHNlZW1pbmdseSBtb3JlIGNvbXBsaWNhdGVk
CnJvdXRlLCByYXRoZXIgdGhhbiBwdXR0aW5nIHZQQ0kgYmVoaW5kIHRoZSBodm1faW9faW50ZXJj
ZXB0KCkKbWFjaGluZXJ5LCBqdXN0IGxpa2UgaXMgdGhlIGNhc2UgZm9yIG90aGVyIGludGVybmFs
IGhhbmRsaW5nPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
