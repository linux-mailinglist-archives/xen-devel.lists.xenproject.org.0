Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8210AC83
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:18:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtPR-0006d0-8A; Wed, 27 Nov 2019 09:14:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZtPP-0006cr-O0
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:14:51 +0000
X-Inumbo-ID: 5cf5bb2c-10f6-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cf5bb2c-10f6-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 09:14:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3343CAFA8;
 Wed, 27 Nov 2019 09:14:49 +0000 (UTC)
To: Rich Persaud <persaur@gmail.com>
References: <9A92C0ED-DF7C-4951-BF4A-06763F60F266@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c83d62d-cecd-96b4-a856-8294128ebe4e@suse.com>
Date: Wed, 27 Nov 2019 10:14:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9A92C0ED-DF7C-4951-BF4A-06763F60F266@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAyMjoyMCwgUmljaCBQZXJzYXVkIHdyb3RlOgo+IEFzIGFuIGludGVybWVk
aWF0ZSBzdGVwLCBjb3VsZCB3ZSBoYXZlIGFuIHVtYnJlbGxhIG9wdC1pbgo+IEtjb25maWcgb3B0
aW9uIChDT05GSUdfRUZJX05PTlNQRUNfQ09NUEFUSUJJTElUWT8pIHRoYXQKPiBlbmFibGVzIG11
bHRpcGxlIEVGSSBvcHRpb25zIGZvciBtYXhpbXVtIGhhcmR3YXJlIGNvbXBhdGliaWxpdHk/Cj4g
IEZvciB0aGlzIHRocmVhZCBhbmQgWGVuIDQuMTMsIHRoYXQgd291bGQgYmUKPiBFRklfU0VUX1ZJ
UlRVQUxfQUREUkVTU19NQVAgYW5kIGVmaT1hdHRyPXVjLiAgSWYgbW9yZQo+IG9wdGlvbnMvcXVp
cmtzIGFyZSBhZGRlZCBpbiB0aGUgZnV0dXJlLCBkb3duc3RyZWFtcyB1c2luZwo+IEVGSV9OT05T
UEVDX0NPTVBBVElCSUxJVFkgd291bGQgZ2V0IHRoZW0gYnkgZGVmYXVsdC4KCldoaWxlIEkgZG9u
J3QgcGFydGljdWxhcmx5IGxpa2UgaXQsIEknZCBiZSBva2F5IHdpdGggaGF2aW5nIHN1Y2gKYW4g
b3B0aW9uLCBwcm92aWRlZCBpdCBkb2Vzbid0IGhhbXBlciBjb2RlIHJlYWRhYmlsaXR5IHRvbyBt
dWNoLgpIb3dldmVyIC0gd2h5IHdvdWxkIHlvdSBzdG9wIGF0IHRob3NlIHR3byB0aGluZ3M/IFdo
eSBub3QgYWxzbwpleGNsdWRlIHJlYm9vdCB0aHJvdWdoIFVFRkkgKGFzIGluZGljYXRlZCBieSBB
bmRyZXcpLCBvciB1c2Ugb2YKcnVudGltZSBzZXJ2aWNlcyBhcyBhIHdob2xlPyBXaGF0IGFib3V0
IC9tYXBicz8gVGhlIGZ1bmRhbWVudGFsCnByb2JsZW0gSSBzZWUgaGVyZSByZWFsbHkgaXMgLSB3
aGVyZSB3b3VsZCB3ZSBkcmF3IHRoZSBsaW5lPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
