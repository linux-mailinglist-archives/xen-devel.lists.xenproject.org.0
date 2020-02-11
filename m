Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170EC158FA0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:14:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1VJa-0002z2-Jl; Tue, 11 Feb 2020 13:10:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1VJZ-0002yx-Ih
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 13:10:57 +0000
X-Inumbo-ID: f07a23aa-4ccf-11ea-b595-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f07a23aa-4ccf-11ea-b595-12813bfff9fa;
 Tue, 11 Feb 2020 13:10:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 037E6BD79;
 Tue, 11 Feb 2020 13:10:55 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200211122736.16714-1-jgross@suse.com>
 <ab86650e-62b2-9967-c88d-3e0fc50bba11@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <54c6223a-4ca5-40d2-d377-b7ec8eb19eb0@suse.com>
Date: Tue, 11 Feb 2020 14:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <ab86650e-62b2-9967-c88d-3e0fc50bba11@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: add some diagnostic info in
 the run queue keyhandler
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAgMTQ6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjAyLjIwMjAgMTM6
MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdoZW4gZHVtcGluZyB0aGUgcnVuIHF1ZXVlIGlu
Zm9ybWF0aW9uIGFkZCBzb21lIG1vcmUgZGF0YSByZWdhcmRpbmcKPj4gY3VycmVudCBhbmQgKGlm
IGtub3duKSBwcmV2aW91cyB2Y3B1IGZvciBlYWNoIHBoeXNpY2FsIGNwdS4KPj4KPj4gV2l0aCBj
b3JlIHNjaGVkdWxpbmcgYWN0aXZhdGVkIHRoZSBwcmludGVkIGRhdGEgd2lsbCBiZSBlLmcuOgo+
Pgo+PiAoWEVOKSBDUFVzIGluZm86Cj4+IChYRU4pIENQVVswMF0gY3VycmVudD1kW0lETEVddjAs
IGN1cnI9ZFtJRExFXXYwLCBwcmV2PU5VTEwKPj4gKFhFTikgQ1BVWzAxXSBjdXJyZW50PWRbSURM
RV12MQo+PiAoWEVOKSBDUFVbMDJdIGN1cnJlbnQ9ZFtJRExFXXYyLCBjdXJyPWRbSURMRV12Miwg
cHJldj1OVUxMCj4+IChYRU4pIENQVVswM10gY3VycmVudD1kW0lETEVddjMKPj4KPj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAtLS0KPj4gVjI6IGFk
ZCBwcm9wZXIgbG9ja2luZwo+IAo+ICJQcm9wZXIiIGlzIGFtYmlndW91cyBpbiB0aGUgY29udGV4
dCBvZiBkdW1waW5nIGZ1bmN0aW9ucy4gSW4gYQo+IG51bWJlciBvZiBwbGFjZXMgd2UgdXNlIHRy
eS1sb2NrLCB0byBhdm9pZCB0aGUgZHVtcGluZyBoYW5naW5nCj4gb24gc29tZXRoaW5nIGVsc2Ug
bW9ub3BvbGl6aW5nIHRoZSBsb2NrLiBJJ2QgbGlrZSB0byBzdWdnZXN0IHRvCj4gZG8gc28gaGVy
ZSwgdG9vLgoKQWxsIHRoZSBzY2hlZHVsZXIgcmVsYXRlZCBkdW1waW5nIGZ1bmN0aW9ucyBhcmUg
dXNpbmcgdGhlICJyZWFsIiBsb2Nrcy4KU28gdXNpbmcgdHJ5bG9jayBpbiB0aGlzIHNpbmdsZSBj
YXNlIHdvdWxkbid0IGhlbHAgYXQgYWxsLiBBZGRpdGlvbmFsbHkKdXNpbmcgdHJ5bG9jayBvbmx5
IHdvdWxkIG1ha2UgYSBjcmFzaCBkdXJpbmcgZHVtcGluZyB0aGUgZGF0YSBtb3JlCnByb2JhYmxl
LCBzbyBJJ20gbm90IHN1cmUgd2Ugd2FudCB0aGF0LgoKSW5zdGVhZCBvZiB1bmNvbmRpdGlvbmFs
bHkgdXNpbmcgdHJ5bG9jayBpbiBkdW1waW5nIGZ1bmN0aW9ucyBJIGNvdWxkCmltYWdpbmUgdG8g
aGF2ZSBhICJkdW1wbG9jayIgdXNpbmcgcHJvcGVyIGxvY2tpbmcgYnkgZGVmYXVsdCB3aGljaCBj
YW4KYmUgdG9nZ2xlZCB0byB0cnlsb2NrIGluIGNhc2UgaXQgaXMgbmVlZGVkIChvciBtYXliZSBh
dXRvbWF0aWNhbGx5IGJ5CmFkZGluZyBhIHRpbWVvdXQgdG8gdGhlIGR1bXBsb2NrIHZhcmlhbnQp
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
