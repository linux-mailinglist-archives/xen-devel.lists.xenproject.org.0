Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80F14093E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:48:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isQ4Z-0002rq-OT; Fri, 17 Jan 2020 11:45:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1isQ4Y-0002rl-QE
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:45:54 +0000
X-Inumbo-ID: e826547c-391e-11ea-b4e0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e826547c-391e-11ea-b4e0-12813bfff9fa;
 Fri, 17 Jan 2020 11:45:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 132F6AE34;
 Fri, 17 Jan 2020 11:45:49 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200116170004.14373-1-jgross@suse.com>
 <c29c92e3-eb20-7e0a-0174-ef72398b0998@suse.com>
 <dc509037-a7d6-caa5-8000-28aeb20b638e@suse.com>
 <4ddd12ae-94f7-0b16-346a-46e096d9ae6e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fdc9609f-cdd6-abf1-4278-14a377df4451@suse.com>
Date: Fri, 17 Jan 2020 12:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <4ddd12ae-94f7-0b16-346a-46e096d9ae6e@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAgMTI6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE3LjAxLjIwMjAgMTI6
MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDE3LjAxLjIwIDEyOjAxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE2LjAxLjIwMjAgMTg6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQ29tbWl0IDNhYTZjMTlkMmYzOGJlICgieGVuL2JhbGxvb246IFN1cHBvcnQgeGVuZC1iYXNl
ZCB0b29sc3RhY2siKQo+Pj4+IHRyaWVkIHRvIGZpeCBhIHJlZ3Jlc3Npb24gd2l0aCBydW5uaW5n
IG9uIHJhdGhlciBhbmNpZW50IFhlbiB2ZXJzaW9ucy4KPj4+PiBVbmZvcnR1bmF0ZWx5IHRoZSBm
aXggd2FzIGJhc2VkIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgeGVuZCB3b3VsZAo+Pj4+IGp1c3Qg
dXNlIGFub3RoZXIgWGVuc3RvcmUgbm9kZSwgYnV0IGluIHJlYWxpdHkgb25seSBzb21lIGRvd25z
dHJlYW0KPj4+PiB2ZXJzaW9ucyBvZiB4ZW5kIGFyZSBkb2luZyB0aGF0LiBUaGUgdXBzdHJlYW0g
eGVuZCBkb2VzIG5vdCB3cml0ZQo+Pj4+IHRoYXQgWGVuc3RvcmUgbm9kZSBhdCBhbGwsIHNvIHRo
ZSBwcm9ibGVtIG11c3QgYmUgZml4ZWQgaW4gYW5vdGhlcgo+Pj4+IHdheS4KPj4+Pgo+Pj4+IFRo
ZSBlYXNpZXN0IHdheSB0byBhY2hpZXZlIHRoYXQgaXMgdG8gZmFsbCBiYWNrIHRvIHRoZSBiZWhh
dmlvciBiZWZvcmUKPj4+PiBjb21taXQgNTI2NmI4ZTQ0NDVjICgieGVuOiBmaXggYm9vdGluZyBi
YWxsb29uZWQgZG93biBodm0gZ3Vlc3QiKQo+Pj4+IGluIGNhc2UgdGhlIHN0YXRpYyBtZW1vcnkg
bWF4aW11bSBjYW4ndCBiZSByZWFkLgo+Pj4KPj4+IEkgY291bGQgdXNlIHNvbWUgaGVscCBoZXJl
OiBQcmlvciB0byBzYWlkIGNvbW1pdCB0aGVyZSB3YXMKPj4+Cj4+PiAJdGFyZ2V0X2RpZmYgPSBu
ZXdfdGFyZ2V0IC0gYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXM7Cj4+Pgo+Pj4KPj4+IFdoaWNo
IGlzLCBhZmFpY3QsIC4uLgo+Pj4KPj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tYmFsbG9vbi5j
Cj4+Pj4gKysrIGIvZHJpdmVycy94ZW4veGVuLWJhbGxvb24uYwo+Pj4+IEBAIC05NCw3ICs5NCw3
IEBAIHN0YXRpYyB2b2lkIHdhdGNoX3RhcmdldChzdHJ1Y3QgeGVuYnVzX3dhdGNoICp3YXRjaCwK
Pj4+PiAgICAJCQkJICAiJWxsdSIsICZzdGF0aWNfbWF4KSA9PSAxKSkKPj4+PiAgICAJCQlzdGF0
aWNfbWF4ID4+PSBQQUdFX1NISUZUIC0gMTA7Cj4+Pj4gICAgCQllbHNlCj4+Pj4gLQkJCXN0YXRp
Y19tYXggPSBuZXdfdGFyZ2V0Owo+Pj4+ICsJCQlzdGF0aWNfbWF4ID0gYmFsbG9vbl9zdGF0cy5j
dXJyZW50X3BhZ2VzOwo+Pj4+ICAgIAo+Pj4+ICAgIAkJdGFyZ2V0X2RpZmYgPSAoeGVuX3B2X2Rv
bWFpbigpIHx8IHhlbl9pbml0aWFsX2RvbWFpbigpKSA/IDAKPj4+PiAgICAJCQkJOiBzdGF0aWNf
bWF4IC0gYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXM7Cj4+Pgo+Pj4gLi4uIHdoYXQgdGhlIGNv
ZGUgZG9lcyBiZWZvcmUgeW91ciBjaGFuZ2UuIEFmYWljdCB0aGVyZSB3YXMKPj4+IG5ldmVyIGEg
dXNlIG9mIGJhbGxvb25fc3RhdHMuY3VycmVudF9wYWdlcyBpbiB0aGlzIGZ1bmN0aW9uLgo+Pgo+
PiBUaGF0IGlzIGEgbGl0dGxlIGJpdCBpbmRpcmVjdCwgeWVzLiBJbiB0aGUgZW5kIEkgd2FudCBz
dGF0aWNfbWF4IHRvCj4+IGJlIGVpdGhlciB0aGUgbWF4aW11bSByZXBvcnRlZCBieSBYZW4sIG9y
IGlmIG5vdCBhdmFpbGFibGUsIHRoZSBjdXJyZW50Cj4+IGFzc3VtZWQgbWVtb3J5IHNpemUsIHdo
aWNoIGNhbiBiZSBmb3VuZCBpbiBiYWxsb29uX3N0YXRzLmN1cnJlbnRfcGFnZXMuCj4+Cj4+IFRo
ZSBtYWluIGlkZWEgaXMgdG8gYXZvaWQgYSBuZWdhdGl2ZSB0YXJnZXRfZGlmZiB3aGljaCB3b3Vs
ZCByZXN1bHQgaW4KPj4gbm90IGJhbGxvb25pbmcgZG93bi4KPiAKPiBBbGwgdW5kZXJzdG9vZC4g
WWV0IHRoZSBjaGFuZ2UgaXMgdGhlbiBub3QgYSByZXN0b3JlIG9mIHByaW9yIGJlaGF2aW9yCj4g
KGp1c3QgaW4gYSBsaW1pdGVkIGNhc2UpLCBidXQgYSBjaGFuZ2UgdG8gYmVoYXZpb3IgdGhhdCB3
ZSBuZXZlciB0aGVyZQo+IGJlZm9yZS4gSS5lLiBpdCB3YXMgaW5kZWVkIG15IGFzc3VtcHRpb24g
dGhhdCB0aGUgY29kZSB3YXMgcmlnaHQsIGJ1dAo+IHRoZSBkZXNjcmlwdGlvbiB3YXMgbWlzbGVh
ZGluZy4KClRoZSBkZXNjcmlwdGlvbiBpcyBtaXNsZWFkaW5nIGFzIGl0IGZhaWxzIHRvIG1lbnRp
b24gY29tbWl0Cjk2ZWRkNjFkY2Y0NDM2MmQzZSwgd2hpY2ggaW50cm9kdWNlZCB0YXJnZXRfZGlm
Zi4gSSdsbCBhZGQgdGhhdCB0bwp0aGUgY29tbWl0IG1lc3NhZ2UuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
