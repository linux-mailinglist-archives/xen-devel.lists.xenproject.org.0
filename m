Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83680140923
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:39:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPvt-0001xt-Pe; Fri, 17 Jan 2020 11:36:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isPvs-0001xn-EE
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:36:56 +0000
X-Inumbo-ID: a4f13c40-391d-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4f13c40-391d-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 11:36:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1675AE2C;
 Fri, 17 Jan 2020 11:36:46 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200116170004.14373-1-jgross@suse.com>
 <c29c92e3-eb20-7e0a-0174-ef72398b0998@suse.com>
 <dc509037-a7d6-caa5-8000-28aeb20b638e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ddd12ae-94f7-0b16-346a-46e096d9ae6e@suse.com>
Date: Fri, 17 Jan 2020 12:36:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <dc509037-a7d6-caa5-8000-28aeb20b638e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/balloon: Support xend-based toolstack
 take two
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMjozMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNy4wMS4yMCAx
MjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE2LjAxLjIwMjAgMTg6MDAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBDb21taXQgM2FhNmMxOWQyZjM4YmUgKCJ4ZW4vYmFsbG9vbjogU3Vw
cG9ydCB4ZW5kLWJhc2VkIHRvb2xzdGFjayIpCj4+PiB0cmllZCB0byBmaXggYSByZWdyZXNzaW9u
IHdpdGggcnVubmluZyBvbiByYXRoZXIgYW5jaWVudCBYZW4gdmVyc2lvbnMuCj4+PiBVbmZvcnR1
bmF0ZWx5IHRoZSBmaXggd2FzIGJhc2VkIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgeGVuZCB3b3Vs
ZAo+Pj4ganVzdCB1c2UgYW5vdGhlciBYZW5zdG9yZSBub2RlLCBidXQgaW4gcmVhbGl0eSBvbmx5
IHNvbWUgZG93bnN0cmVhbQo+Pj4gdmVyc2lvbnMgb2YgeGVuZCBhcmUgZG9pbmcgdGhhdC4gVGhl
IHVwc3RyZWFtIHhlbmQgZG9lcyBub3Qgd3JpdGUKPj4+IHRoYXQgWGVuc3RvcmUgbm9kZSBhdCBh
bGwsIHNvIHRoZSBwcm9ibGVtIG11c3QgYmUgZml4ZWQgaW4gYW5vdGhlcgo+Pj4gd2F5Lgo+Pj4K
Pj4+IFRoZSBlYXNpZXN0IHdheSB0byBhY2hpZXZlIHRoYXQgaXMgdG8gZmFsbCBiYWNrIHRvIHRo
ZSBiZWhhdmlvciBiZWZvcmUKPj4+IGNvbW1pdCA1MjY2YjhlNDQ0NWMgKCJ4ZW46IGZpeCBib290
aW5nIGJhbGxvb25lZCBkb3duIGh2bSBndWVzdCIpCj4+PiBpbiBjYXNlIHRoZSBzdGF0aWMgbWVt
b3J5IG1heGltdW0gY2FuJ3QgYmUgcmVhZC4KPj4KPj4gSSBjb3VsZCB1c2Ugc29tZSBoZWxwIGhl
cmU6IFByaW9yIHRvIHNhaWQgY29tbWl0IHRoZXJlIHdhcwo+Pgo+PiAJdGFyZ2V0X2RpZmYgPSBu
ZXdfdGFyZ2V0IC0gYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXM7Cj4+Cj4+Cj4+IFdoaWNoIGlz
LCBhZmFpY3QsIC4uLgo+Pgo+Pj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLWJhbGxvb24uYwo+Pj4g
KysrIGIvZHJpdmVycy94ZW4veGVuLWJhbGxvb24uYwo+Pj4gQEAgLTk0LDcgKzk0LDcgQEAgc3Rh
dGljIHZvaWQgd2F0Y2hfdGFyZ2V0KHN0cnVjdCB4ZW5idXNfd2F0Y2ggKndhdGNoLAo+Pj4gICAJ
CQkJICAiJWxsdSIsICZzdGF0aWNfbWF4KSA9PSAxKSkKPj4+ICAgCQkJc3RhdGljX21heCA+Pj0g
UEFHRV9TSElGVCAtIDEwOwo+Pj4gICAJCWVsc2UKPj4+IC0JCQlzdGF0aWNfbWF4ID0gbmV3X3Rh
cmdldDsKPj4+ICsJCQlzdGF0aWNfbWF4ID0gYmFsbG9vbl9zdGF0cy5jdXJyZW50X3BhZ2VzOwo+
Pj4gICAKPj4+ICAgCQl0YXJnZXRfZGlmZiA9ICh4ZW5fcHZfZG9tYWluKCkgfHwgeGVuX2luaXRp
YWxfZG9tYWluKCkpID8gMAo+Pj4gICAJCQkJOiBzdGF0aWNfbWF4IC0gYmFsbG9vbl9zdGF0cy50
YXJnZXRfcGFnZXM7Cj4+Cj4+IC4uLiB3aGF0IHRoZSBjb2RlIGRvZXMgYmVmb3JlIHlvdXIgY2hh
bmdlLiBBZmFpY3QgdGhlcmUgd2FzCj4+IG5ldmVyIGEgdXNlIG9mIGJhbGxvb25fc3RhdHMuY3Vy
cmVudF9wYWdlcyBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IFRoYXQgaXMgYSBsaXR0bGUgYml0IGlu
ZGlyZWN0LCB5ZXMuIEluIHRoZSBlbmQgSSB3YW50IHN0YXRpY19tYXggdG8KPiBiZSBlaXRoZXIg
dGhlIG1heGltdW0gcmVwb3J0ZWQgYnkgWGVuLCBvciBpZiBub3QgYXZhaWxhYmxlLCB0aGUgY3Vy
cmVudAo+IGFzc3VtZWQgbWVtb3J5IHNpemUsIHdoaWNoIGNhbiBiZSBmb3VuZCBpbiBiYWxsb29u
X3N0YXRzLmN1cnJlbnRfcGFnZXMuCj4gCj4gVGhlIG1haW4gaWRlYSBpcyB0byBhdm9pZCBhIG5l
Z2F0aXZlIHRhcmdldF9kaWZmIHdoaWNoIHdvdWxkIHJlc3VsdCBpbgo+IG5vdCBiYWxsb29uaW5n
IGRvd24uCgpBbGwgdW5kZXJzdG9vZC4gWWV0IHRoZSBjaGFuZ2UgaXMgdGhlbiBub3QgYSByZXN0
b3JlIG9mIHByaW9yIGJlaGF2aW9yCihqdXN0IGluIGEgbGltaXRlZCBjYXNlKSwgYnV0IGEgY2hh
bmdlIHRvIGJlaGF2aW9yIHRoYXQgd2UgbmV2ZXIgdGhlcmUKYmVmb3JlLiBJLmUuIGl0IHdhcyBp
bmRlZWQgbXkgYXNzdW1wdGlvbiB0aGF0IHRoZSBjb2RlIHdhcyByaWdodCwgYnV0CnRoZSBkZXNj
cmlwdGlvbiB3YXMgbWlzbGVhZGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
