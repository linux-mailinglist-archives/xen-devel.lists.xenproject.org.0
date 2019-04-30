Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8BF472
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 12:47:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLQG1-0004cP-7b; Tue, 30 Apr 2019 10:45:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9h7v=TA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hLQG0-0004cK-7w
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 10:45:04 +0000
X-Inumbo-ID: 017630d4-6b35-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 017630d4-6b35-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 10:45:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8A75AD8F;
 Tue, 30 Apr 2019 10:45:00 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
References: =?UTF-8?B?PDNjZTQ5OThi77+9YThhOO+/vTM3YmTvv71iYjI277+9OTU1MDU3?=
 =?UTF-8?Q?1709b6=40suse=2ecom=3e_=3c5CC82306020000780022A4E3=40prv1?=
 =?UTF-8?Q?=ef=bf=bdmh=2eprovo=2enovell=2ecom=3e_=3cae94fdca-bd2a-2086-450e-?=
 =?UTF-8?Q?c485ca4e59f0=40arm=2ecom=3e_=3c5CC82593020000780022A50D=40suse=2e?=
 =?UTF-8?Q?com=3e?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
Date: Tue, 30 Apr 2019 12:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: Re: [Xen-devel] vcpu_block() and do_poll() question
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDQvMjAxOSAxMjozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDQuMTkg
YXQgMTI6MzEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gCj4+Cj4+IE9uIDMwLzA0
LzIwMTkgMTE6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzAuMDQuMTkgYXQgMTE6
MTMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4+IEluIHhlbi9jb21tb24vc2NoZWR1bGUu
YyB0aGVyZSBpcyBhIHdlaXJkICIjaWZuZGVmIENPTkZJR19YODYiIGluCj4+Pj4gZG9fcG9sbCgp
Lgo+Pj4+Cj4+Pj4gSXQgd2FzIGludHJvZHVjZWQgd2F5IGJlZm9yZSBhbnlvbmUgd291bGQgdGhp
bmsgYWJvdXQgQVJNIGJ5IGNvbW1pdAo+Pj4+IGVmNGM2YjA3OWNjNTVlIChJIGNvdWxkbid0IGZp
bmQgYW55IHhlbi1kZXZlbCBtYWlsIHJlbGF0ZWQgdG8gdGhhdAo+Pj4+IGNvbW1pdCksIHNvIEkg
Z3Vlc3MgaXQgaXMgcmVsYXRlZCB0byBJQTY0Pwo+Pj4KPj4+IFF1aXRlIGNlcnRhaW5seSwgeWVz
IChvciBQUEMgYXMgYW4gYWx0ZXJuYXRpdmUsIGJ1dCBJIGtub3cgbm90aGluZwo+Pj4gYWJvdXQg
dGhlaXIgbWVtb3J5IG9yZGVyaW5nIG1vZGVsKS4KPj4+Cj4+Pj4gUXVlc3Rpb24gaXM6IGNhbiB3
ZSBqdXN0IGRyb3AgaXQsIG9yIGRvZXMgQVJNIGRlcGVuZCBvbiBpdD8gQW5kIGlmIEFSTQo+Pj4+
IHJlYWxseSBuZWVkcyBpdCwgaXMgaXQgdGhlIG1lbW9yeSBiYXJyaWVyIG9ubHk/IEFuZCB3aHkg
d291bGRuJ3QgYQo+Pj4+IHNpbWlsYXIgYmFycmllciBiZSBuZWVkZWQgaW4gdmNwdV9ibG9jaygp
IHRoZW4/Cj4+Pgo+Pj4gSXQncyBub3QgdGhlIG1lbW9yeSBiYXJyaWVyLCBidXQgdGhlIHN1YnNl
cXVlbnQgY2hlY2tzLiBUaGUgYmFycmllcgo+Pj4gaXMgdGhlcmUgb25seSB0byBtYWtlIHN1cmUg
dGhlIGNoZWNrcyBkb24ndCBoYXBwZW4gYmVmb3JlIHRoZQo+Pj4gZWFybGllciB3cml0ZXMuIEFu
ZCBhcyB0aGUgY29tbWVudCBzYXlzIC0gaXQncyB0aGUgY29tYmluYXRpb24gb2YKPj4+IHRoZSAz
IHdyaXRlcyB0aGF0IG1heSBnZXQgbWlzLW9yZGVyZWQgYW5kIGhlbmNlIG1pcy1pbnRlcnByZXRl
ZCBieQo+Pj4gb3RoZXIgKHJlYWRpbmcpIHBhcnRpZXMuIHZjcHVfYmxvY2soKSwgb3RvaCwgc2V0
cyB0aGUgVlBGX2Jsb2NrZWQKPj4+IGJpdCBvbmx5LCBzbyB0aGVyZSdzIG5vIHBvdGVudGlhbCBv
cmRlcmluZyBpc3N1ZSB0aGVyZS4KPj4KPj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoZSBjb21tZW50
IGluIHZjcHVfYmxvY2sgaXMgbm90IGNvcnJlY3Q/Cj4gCj4gTm8uIEJ1dCBJJ20gbm90IHRhbGtp
bmcgYWJvdXQgdGhlIGxvY2FsX2V2ZW50c19uZWVkX2RlbGl2ZXJ5KCkKPiBjaGVja3MgKHdoaWNo
IGV4aXN0IGluIGJvdGggZnVuY3Rpb25zKSwgYnV0IHRoZSBvbmVzIGluc2lkZSB0aGUKPiAjaWZk
ZWYgaW4gZG9fcG9sbCgpICh3aGljaCBoYXZlIG5vIGVxdWl2YWxlbnQgaW4gdmNwdV9ibG9jaygp
KS4KPiBUaGF0J3Mgbm90IHRvIHNheSB0aGF0IHRoZXJlIG1heSBub3QgbmVlZCB0byBiZSBhIGJh
cnJpZXIgYWhlYWQKPiBvZiBsb2NhbF9ldmVudHNfbmVlZF9kZWxpdmVyeSgpIGFzIHdlbGwgLSBJ
J3ZlIHNpbXBseSBub3QgdGhvdWdodAo+IHRocm91Z2ggdGhhdCBmdXJ0aGVyIGNhc2UgKHlldCku
CgpBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSBtZW1vcnkgYmFycmllcnMgYmV0d2VlbiB0aGUgd3Jp
dGVzIG9uIEFSTSwKcmlnaHQ/IE9yIGEgc3Ryb25nIG9yZGVyZWQgc2V0X2JpdCgpIHZhcmlhbnQg
KHdlIGhhZCB0aGF0IGRpc2N1c3Npb24KcmVjZW50bHkgcmVsYXRlZCB0byBhIGJhcnJpZXIgaW4g
QVJNLXNwZWNpZmljIF9fY3B1X2Rpc2FibGUoKSkuCgpUaGVuIHdlIGNvdWxkIGRyb3AgdGhpcyAj
aWZuZGVmIHNlY3Rpb24uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
