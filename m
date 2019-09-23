Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD849BAEC5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 09:57:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCJAh-0002b7-4E; Mon, 23 Sep 2019 07:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCJAf-0002b2-KT
 for xen-devel@lists.xen.org; Mon, 23 Sep 2019 07:54:09 +0000
X-Inumbo-ID: 51a32e1e-ddd7-11e9-95f4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51a32e1e-ddd7-11e9-95f4-12813bfff9fa;
 Mon, 23 Sep 2019 07:54:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09E65B725;
 Mon, 23 Sep 2019 07:54:05 +0000 (UTC)
To: Sarah Newman <srn@prgmr.com>
References: <aecc7e18-40ff-8bb8-467c-24bfe99ee8f1@prgmr.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <470f5ce1-d43f-a5dd-a00d-e2ec339b06c0@suse.com>
Date: Mon, 23 Sep 2019 09:54:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aecc7e18-40ff-8bb8-467c-24bfe99ee8f1@prgmr.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Crash with nested HVM and Linux v5.1+
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
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDkuMjAxOSAwMToxNCwgU2FyYWggTmV3bWFuIHdyb3RlOgo+IFdpdGggbmVzdGVkaHZt
PTEsIHRoZSBMMiBIVk0gZ3Vlc3QgaXMgZWl0aGVyIGhhbmdpbmcgKFhlbiA0LjgpIG9yIGNyYXNo
aW5nIChYZW4gNC4xMi4xKSB0aGUgTDEgWGVuIGh5cGVydmlzb3Igd2l0aCByZWNlbnQgdmVyc2lv
bnMgb2YgTGludXguIFdlIAo+IGlzb2xhdGVkIHRoZSBjb21taXQgdG86Cj4gCj4gY29tbWl0IDA5
M2FlOGY5YTg2YTk3NGM5MjBiNjEzODYwZjFmN2ZkNWJiZDcwYWIKPiBBdXRob3I6IEJvcmlzbGF2
IFBldGtvdiA8YnBAc3VzZS5kZT4KPiBEYXRlOiAgIFRodSBBcHIgMTIgMTM6MTE6MzYgMjAxOCAr
MDIwMAoKVGhhbmtzIGZvciBkb2luZyB0aGUgYmlzZWN0aW9uIG9uIHRoZSBMaW51eCBzaWRlLiBX
b3VsZCB5b3UgcGxlYXNlIGFsc28KcHJvdmlkZSB0aGUgYWN0dWFsIGRhdGEgYWJvdXQgdGhlIEwx
IFhlbiBjcmFzaCAoaS5lLiBhIG1heGltdW0KdmVyYm9zaXR5IEwxIGxvZyBvZiBhIGRlYnVnIGJ1
aWxkIG9mIFhlbik/IEl0IG1pZ2h0IGFsc28gdHVybiBvdXQKaGVscGZ1bCBpZiB5b3UgY291bGQg
cHJvdmlkZSB0aGUgY29ycmVzcG9uZGluZyBMMCBYZW4gbG9nLCBhc3N1bWluZyB5b3UKaGF2ZSBo
b3N0IGFjY2Vzcy4KCkphbgoKPiAgICAgIHg4Ni9UU0M6IFVzZSBSRFRTQ1AKPiAKPiAgICAgIEN1
cnJlbnRseSwgdGhlIGtlcm5lbCB1c2VzCj4gCj4gICAgICAgIFtMTV1GRU5DRTsgUkRUU0MKPiAK
PiAgICAgIGluIHRoZSB0aW1la2VlcGluZyBjb2RlLCB0byBndWFyYW50ZWUgbW9ub3RvbmljaXR5
IG9mIHRpbWUgd2hlcmUgdGhlCj4gICAgICAqRkVOQ0UgaXMgc2VsZWN0ZWQgYmFzZWQgb24gdmVu
ZG9yLgo+IAo+ICAgICAgUmVwbGFjZSB0aGF0IHNlcXVlbmNlIHdpdGggUkRUU0NQIHdoaWNoIGlz
IGZhc3RlciBvciBvbi1wYXIgYW5kIGdpdmVzCj4gICAgICB0aGUgc2FtZSBndWFyYW50ZWVzLgo+
IAo+ICAgICAgQSBtaWNyb2JlbmNobWFyayBvbiBJbnRlbCBzaG93cyB0aGF0IHRoZSBjaGFuZ2Ug
aXMgb24tcGFyLgo+IAo+ICAgICAgT24gQU1ELCB0aGUgY2hhbmdlIGlzIGVpdGhlciBvbi1wYXIg
d2l0aCB0aGUgY3VycmVudCBMRkVOQ0UtcHJlZml4ZWQKPiAgICAgIFJEVFNDIG9yIHNsaWdodGx5
IGJldHRlciB3aXRoIFJEVFNDUC4KPiAKPiAgICAgIFRoZSBjb21wYXJpc29uIGlzIGRvbmUgd2l0
aCB0aGUgTEZFTkNFLXByZWZpeGVkIFJEVFNDIChhbmQgbm90IHdpdGggdGhlCj4gICAgICBNRkVO
Q0UtcHJlZml4ZWQgb25lLCBhcyBvbmUgd291bGQgbm9ybWFsbHkgZXhwZWN0KSBiZWNhdXNlIGFs
bCBtb2Rlcm4KPiAgICAgIEFNRCBmYW1pbGllcyBtYWtlIExGRU5DRSBzZXJpYWxpemluZyBhbmQg
dGh1cyBhdm9pZCB0aGUgaGVhdnkgTUZFTkNFIGJ5Cj4gICAgICBlZmZlY3RpdmVseSBlbmFibGlu
ZyBYODZfRkVBVFVSRV9MRkVOQ0VfUkRUU0MuCj4gCj4gSSBjb3VsZCBub3QgZmluZCBSRFRTQ1Ag
aW5zdHJ1Y3Rpb24gYmVpbmcgdXNlZCBieSBMaW51eCBiZWZvcmUgdGhlIGdpdmVuIGNvbW1pdCwg
d2hpY2ggaXMgcHJlc2VudCBpbiBMaW51eCB2NS4xIGFuZCBuZXdlci4gQXMgZXhwZWN0ZWQsIG1h
c2tpbmcgb2ZmIAo+IHRoZSBSRFRTQ1AgY3B1aWQgZmxhZyBpbiBsZWFmIDB4ODAwMDAwMDEgcHJl
dmVudHMgYSBjb29wZXJhdGl2ZSBndWVzdCBmcm9tIHVzaW5nIHRoYXQgaW5zdHJ1Y3Rpb24gYW5k
IHRoZXJlZm9yZSBwcmV2ZW50cyB0aGUgY3Jhc2guCj4gCj4gLS1TYXJhaAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxp
bmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
