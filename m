Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16A110093
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:47:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9Qf-0000sb-JX; Tue, 03 Dec 2019 14:45:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic9Qd-0000sW-LQ
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:45:27 +0000
X-Inumbo-ID: 8af86bd4-15db-11ea-81e0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8af86bd4-15db-11ea-81e0-12813bfff9fa;
 Tue, 03 Dec 2019 14:45:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5610B34F;
 Tue,  3 Dec 2019 14:45:25 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
 <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
 <3e83ed09-823a-5533-b04d-ca09d7b5016f@citrix.com>
 <21107177-aee4-e3ff-f4c2-8f2f23c70755@suse.com>
 <e286db34-0d24-b62b-2294-1d8a76373318@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a079204b-1256-29b7-3004-30555f4282d0@suse.com>
Date: Tue, 3 Dec 2019 15:45:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e286db34-0d24-b62b-2294-1d8a76373318@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, wl@xen.org,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAxNTo0MSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDMvMTIvMjAx
OSAxNDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjEyLjIwMTkgMTU6MjEsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMDMvMTIvMjAxOSAxMDowOCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjkuMTEuMjAxOSAyMTowMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2
L2NwdS9jb21tb24uYwo+Pj4+PiBAQCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IGZvcmNlZF9jYXBzW05DQVBJTlRTXTsKPj4+Pj4gIAo+Pj4+PiAgREVGSU5FX1BFUl9DUFUoYm9v
bCwgZnVsbF9nZHRfbG9hZGVkKTsKPj4+Pj4gIAo+Pj4+PiAtdm9pZCBfX2luaXQgc2V0dXBfY2xl
YXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+Pj4+PiArdm9pZCBzZXR1cF9jbGVhcl9jcHVf
Y2FwKHVuc2lnbmVkIGludCBjYXApCj4+Pj4+ICB7Cj4+Pj4+ICAJY29uc3QgdWludDMyX3QgKmRm
czsKPj4+Pj4gIAl1bnNpZ25lZCBpbnQgaTsKPj4+Pj4gQEAgLTgzLDcgKzgzLDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+Pj4+PiAgCX0KPj4+
Pj4gIH0KPj4+Pj4gIAo+Pj4+PiAtdm9pZCBfX2luaXQgc2V0dXBfZm9yY2VfY3B1X2NhcCh1bnNp
Z25lZCBpbnQgY2FwKQo+Pj4+PiArdm9pZCBzZXR1cF9mb3JjZV9jcHVfY2FwKHVuc2lnbmVkIGlu
dCBjYXApCj4+Pj4+ICB7Cj4+Pj4+ICAJaWYgKF9fdGVzdF9hbmRfc2V0X2JpdChjYXAsIGZvcmNl
ZF9jYXBzKSkKPj4+Pj4gIAkJcmV0dXJuOwo+Pj4+Cj4+Pj4gVGhlIHR3byBmdW5jdGlvbnMgYXJl
IGRlbGliZXJhdGVseSBfX2luaXQsIGFzIGFueSBjYWxsIHRvIHRoZW0KPj4+PiBwb3N0LWluaXQg
aXMgbm90IGdvaW5nIHRvIHRha2Ugc3lzdGVtLXdpZGUgZWZmZWN0LiBUaGVzZSBmdW5jdGlvbnMK
Pj4+PiBzaG91bGQgcmVhbGx5IGJlIF9faW5pdF9wcmVzbXAsIGlmIHdlIGhhZCBzb21ldGhpbmcg
bGlrZSB0aGlzLiBObwo+Pj4+IHVzZSBvZiB0aGVtIG9uIGFuIEFQIGJvb3QgcGF0aCBpcyBnb2lu
ZyB0byBhZmZlY3QgdGhlIEJTUCwgYW5kCj4+Pj4gaGVuY2Ugd2lsbCBsZWF2ZSB0aGUgc3lzdGVt
IGluIGFuIGluY29uc2lzdGVudCBzdGF0ZS4KPj4+Cj4+PiBPbiBzZWNvbmQgdGhvdWdodCwgbG9v
a2luZyBhdCBob3cgbWFueSBwbGFjZXMgYWN0dWFsbHkgY2FsbCAKPj4+IHNldHVwX3tmb3JjZSxj
bGVhcn1fY3B1X2NhcCgpIG9uIEFQIGluaXQgcGF0aCBpdCBzdGlsbCBtYWtlcyBzZW5zZQo+Pj4g
dG8ga2VlcCB0aGUgdjEgYXBwcm9hY2ggYXMgb3RoZXJ3aXNlIHdlIHdpbGwgaGF2ZSB0byBtYW51
YWxseSB3b3JrYXJvdW5kCj4+PiBldmVyeSBzaW5nbGUgcGxhY2Ugd2hlcmUgaXQgaGFwcGVucy4K
Pj4KPj4gV2hpbGUgbm90IGFsbCBvZiB0aGUgb3RoZXIgdXNlcyBvZiB0aGUgZnVuY3Rpb25zIGhh
cHBlbiBmcm9tIF9faW5pdAo+PiBmdW5jdGlvbnMsIGFsbCBvZiB0aGVtIGFyZSB1bnJlYWNoYWJs
ZSBvbiBBUHMgYWZhaWN0IC0gSSd2ZSBqdXN0Cj4+IGdvbmUgdGhyb3VnaCBhbGwgaW5zdGFuY2Vz
Lgo+IAo+IEkgc2VlIDIgcGxhY2VzIHdoZXJlIGl0IGxvb2tzIHN1c3BpY2lvdXM6Cj4gcHNyX2Nw
dV9pbml0KCksIG13YWl0X2lkbGVfY3B1X2luaXQoKQoKICAgIGlmICggIXBzcl9hbGxvY19mZWF0
X2VuYWJsZWQoKSB8fCAhYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1BRRSkgKQogICAgICAgIGdv
dG8gYXNzb2NfaW5pdDsKCiAgICBpZiAoIGJvb3RfY3B1X2RhdGEuY3B1aWRfbGV2ZWwgPCBQU1Jf
Q1BVSURfTEVWRUxfQ0FUICkKICAgIHsKICAgICAgICBzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9G
RUFUVVJFX1BRRSk7CiAgICAgICAgZ290byBhc3NvY19pbml0OwogICAgfQoKVGhlIGJvb3RfY3B1
X2hhcyhYODZfRkVBVFVSRV9QUUUpIHdpbGwgcHJldmVudCB0aGUgMm5kIGlmKCkgZnJvbQpiZWlu
ZyByZWFjaGVkIGJ5IGFuIEFQLCBpZiB0aGUgQlNQIGZvcmNlLWNsZWFyZWQgdGhlIGZlYXR1cmUu
CgoJCWlmIChzdGF0ZSA+IDIgJiYgIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9OT05TVE9QX1RT
QykgJiYKCQkgICAgIXBtX2lkbGVfc2F2ZSkKCQkJc2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVB
VFVSRV9UU0NfUkVMSUFCTEUpOwoKVGhlICFwbV9pZGxlX3NhdmUgY2hlY2sgaXMgdGhlIGd1YXJk
IGhlcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
