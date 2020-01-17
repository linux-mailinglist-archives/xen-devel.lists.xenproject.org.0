Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C9140898
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:04:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPNH-0006Yi-2G; Fri, 17 Jan 2020 11:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isPNF-0006Yd-Fp
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:01:09 +0000
X-Inumbo-ID: a4ce7b42-3918-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4ce7b42-3918-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 11:01:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 07982ADAD;
 Fri, 17 Jan 2020 11:00:59 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200116170004.14373-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c29c92e3-eb20-7e0a-0174-ef72398b0998@suse.com>
Date: Fri, 17 Jan 2020 12:01:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200116170004.14373-1-jgross@suse.com>
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

T24gMTYuMDEuMjAyMCAxODowMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgM2FhNmMx
OWQyZjM4YmUgKCJ4ZW4vYmFsbG9vbjogU3VwcG9ydCB4ZW5kLWJhc2VkIHRvb2xzdGFjayIpCj4g
dHJpZWQgdG8gZml4IGEgcmVncmVzc2lvbiB3aXRoIHJ1bm5pbmcgb24gcmF0aGVyIGFuY2llbnQg
WGVuIHZlcnNpb25zLgo+IFVuZm9ydHVuYXRlbHkgdGhlIGZpeCB3YXMgYmFzZWQgb24gdGhlIGFz
c3VtcHRpb24gdGhhdCB4ZW5kIHdvdWxkCj4ganVzdCB1c2UgYW5vdGhlciBYZW5zdG9yZSBub2Rl
LCBidXQgaW4gcmVhbGl0eSBvbmx5IHNvbWUgZG93bnN0cmVhbQo+IHZlcnNpb25zIG9mIHhlbmQg
YXJlIGRvaW5nIHRoYXQuIFRoZSB1cHN0cmVhbSB4ZW5kIGRvZXMgbm90IHdyaXRlCj4gdGhhdCBY
ZW5zdG9yZSBub2RlIGF0IGFsbCwgc28gdGhlIHByb2JsZW0gbXVzdCBiZSBmaXhlZCBpbiBhbm90
aGVyCj4gd2F5Lgo+IAo+IFRoZSBlYXNpZXN0IHdheSB0byBhY2hpZXZlIHRoYXQgaXMgdG8gZmFs
bCBiYWNrIHRvIHRoZSBiZWhhdmlvciBiZWZvcmUKPiBjb21taXQgNTI2NmI4ZTQ0NDVjICgieGVu
OiBmaXggYm9vdGluZyBiYWxsb29uZWQgZG93biBodm0gZ3Vlc3QiKQo+IGluIGNhc2UgdGhlIHN0
YXRpYyBtZW1vcnkgbWF4aW11bSBjYW4ndCBiZSByZWFkLgoKSSBjb3VsZCB1c2Ugc29tZSBoZWxw
IGhlcmU6IFByaW9yIHRvIHNhaWQgY29tbWl0IHRoZXJlIHdhcwoKCXRhcmdldF9kaWZmID0gbmV3
X3RhcmdldCAtIGJhbGxvb25fc3RhdHMudGFyZ2V0X3BhZ2VzOwoKCldoaWNoIGlzLCBhZmFpY3Qs
IC4uLgoKPiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tYmFsbG9vbi5jCj4gKysrIGIvZHJpdmVycy94
ZW4veGVuLWJhbGxvb24uYwo+IEBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyB2b2lkIHdhdGNoX3Rh
cmdldChzdHJ1Y3QgeGVuYnVzX3dhdGNoICp3YXRjaCwKPiAgCQkJCSAgIiVsbHUiLCAmc3RhdGlj
X21heCkgPT0gMSkpCj4gIAkJCXN0YXRpY19tYXggPj49IFBBR0VfU0hJRlQgLSAxMDsKPiAgCQll
bHNlCj4gLQkJCXN0YXRpY19tYXggPSBuZXdfdGFyZ2V0Owo+ICsJCQlzdGF0aWNfbWF4ID0gYmFs
bG9vbl9zdGF0cy5jdXJyZW50X3BhZ2VzOwo+ICAKPiAgCQl0YXJnZXRfZGlmZiA9ICh4ZW5fcHZf
ZG9tYWluKCkgfHwgeGVuX2luaXRpYWxfZG9tYWluKCkpID8gMAo+ICAJCQkJOiBzdGF0aWNfbWF4
IC0gYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXM7CgouLi4gd2hhdCB0aGUgY29kZSBkb2VzIGJl
Zm9yZSB5b3VyIGNoYW5nZS4gQWZhaWN0IHRoZXJlIHdhcwpuZXZlciBhIHVzZSBvZiBiYWxsb29u
X3N0YXRzLmN1cnJlbnRfcGFnZXMgaW4gdGhpcyBmdW5jdGlvbi4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
