Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E5158CE2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 11:42:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Sx6-0005mz-KH; Tue, 11 Feb 2020 10:39:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1Sx5-0005mt-5d
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 10:39:35 +0000
X-Inumbo-ID: c9c26d10-4cba-11ea-b559-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9c26d10-4cba-11ea-b559-12813bfff9fa;
 Tue, 11 Feb 2020 10:39:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C58C5AB3D;
 Tue, 11 Feb 2020 10:39:32 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20200210153920.4297-1-jgross@suse.com>
 <ab00b9b4e25d9d690c803ae5a986881cfa1b6fbd.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5eca3e9d-94cf-3c0d-a00e-eb6fc2ad6584@suse.com>
Date: Tue, 11 Feb 2020 11:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <ab00b9b4e25d9d690c803ae5a986881cfa1b6fbd.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove sched_init_pdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAgMTE6MzcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIE1vbiwgMjAyMC0w
Mi0xMCBhdCAxNjozOSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gc2NoZWRfaW5pdF9w
ZGF0YSgpIGlzIHVzZWQgbm93aGVyZSwgaXQgY2FuIGJlIHJlbW92ZWQuIFNhbWUgYXBwbGllcwo+
PiB0bwo+PiB0aGUgLmluaXRfcGRhdGEgaG9vayBvZiB0aGUgcGVyLXNjaGVkdWxlciBpbnRlcmZh
Y2UuCj4+Cj4gUmlnaHQsIGFuZCB0aGF0IGFwcGVhciB0byBiZSB0aGUgY2FzZSBzaW5jZQo+IGY4
NTVkZDk2MjUyM2I2Y2I0N2E5MjAzN2JkZDI4YjE0ODUxNDFhYmUgKCJzY2hlZDogYWRkIG1pbmlt
YWxpc3RpYyBpZGxlCj4gc2NoZWR1bGVyIGZvciBmcmVlIGNwdXMiKSwgd2hpY2ggcmVtb3ZlZCBh
bGwgY2FsbCBzaXRlcy4KPiAKPiBBbmQgdGhhdCBpcyBiZWNhdXNlIHN3aXRjaGluZyB0byBhIHNj
aGVkdWxlciBhbHdheXMgaGFwcGVucyB2aWEKPiBzd2l0Y2hfc2NoZWQgZnJvbSB0aGUgaWRsZSBz
Y2hlZHVsZXIsIGFuZCBpdCdzIHRoZXJlIHRoYXQgd2UgZG8gYWxsIHRoZQo+IGluaXRpYWxpemF0
aW9ucywgcmlnaHQ/Cj4gCj4gVGhpcyBjaGFuZ2UgaXMgb2J2aW91c2x5IGRvaW5nIHRoZSByaWdo
dCB0aGluZywgcmVtb3ZpbmcgY29kZSB0aGF0IGlzCj4gbmV2ZXIgY2FsbGVkISA6LSkKPiAKPiBD
YW4gd2UsIHRob3VnaDoKPiAtIGFkZCBhIG1lbnRpb24gdG8gdGhlIGNvbW1pdCBhYm92ZSBhbmQg
YSBxdWljayBleHBsYW5hdGlvbiBvZiB0aGluZ3MKPiAgICBpbiB0aGUgY2hhbmdlbG9nPwoKT2th
eS4KCj4gLSB1cGRhdGUgdGhlIGZvbGxvd2luZyBjb21tZW50cyB0b286Cj4gICAgMSkgaW4gY3B1
X3NjaGVkdWxlX2NhbGxiYWNrKCkKPiAKPiAiKiBUaGlzIGhhcHBlbnMgYnkgY2FsbGluZyB0aGUg
ZGVpbml0X3BkYXRhIGFuZCBmcmVlX3BkYXRhIGhvb2tzLCBpbiB0aGlzCj4gICAqIG9yZGVyLiBJ
ZiBubyBwZXItcENQVSBtZW1vcnkgd2FzIGFsbG9jYXRlZCwgdGhlcmUgaXMgbm8gbmVlZCB0bwo+
ICAgKiBwcm92aWRlIGFuIGltcGxlbWVudGF0aW9uIG9mIGZyZWVfcGRhdGEuIGRlaW5pdF9wZGF0
YSBtYXksIGhvd2V2ZXIsCj4gICAqIGJlIG5lY2Vzc2FyeS91c2VmdWwgaW4gdGhpcyBjYXNlIHRv
byAoZS5nLiwgaXQgY2FuIHVuZG8gc29tZXRoaW5nIGRvbmUKPiAgICogb24gc2NoZWR1bGVyIHdp
ZGUgZGF0YSBzdHJ1Y3R1cmUgZHVyaW5nIGluaXRfcGRhdGEpLiBCb3RoIGRlaW5pdF9wZGF0YQo+
ICAgKiBhbmQgZnJlZV9wZGF0YSBhcmUgY2FsbGVkIGR1cmluZyBDUFVfREVBRC4iCj4gCj4gICAg
Mikgc2NoZWR1bGVfY3B1X2FkZCgpCj4gCj4gIiogIC0gYSB2YWxpZCBpbnN0YW5jZSBvZiBwZXIt
Q1BVIHNjaGVkdWxlciBzcGVjaWZpYyBkYXRhLCBhcyBpdCBpcwo+ICAgKiAgICBhbGxvY2F0ZWQg
Ynkgc2NoZWRfYWxsb2NfcGRhdGEoKS4gTm90ZSB0aGF0IHdlIGRvIG5vdCB3YW50IHRvCj4gICAq
ICAgIGluaXRpYWxpemUgaXQgeWV0IChpLmUuLCB3ZSBhcmUgbm90IGNhbGxpbmcgc2NoZWRfaW5p
dF9wZGF0YSgpKS4KPiAgICogICAgVGhhdCB3aWxsIGJlIGRvbmUgYnkgdGhlIHRhcmdldCBzY2hl
ZHVsZXIsIGluIHNjaGVkX3N3aXRjaF9zY2hlZCgpLAo+ICAgKiAgICBpbiBwcm9wZXIgb3JkZXJp
bmcgYW5kIHdpdGggbG9ja2luZy4iCgpPaCwgSSBtaXNzZWQgdGhvc2UuIFdpbGwgbW9kaWZ5IHRo
ZSBjb21tZW50cy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
