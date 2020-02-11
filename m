Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A88159570
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 17:57:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Ynz-0006tp-Tm; Tue, 11 Feb 2020 16:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1Yny-0006tk-Ev
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 16:54:34 +0000
X-Inumbo-ID: 2d6b9554-4cef-11ea-b5de-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d6b9554-4cef-11ea-b5de-12813bfff9fa;
 Tue, 11 Feb 2020 16:54:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AE8C8ACE0;
 Tue, 11 Feb 2020 16:54:32 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200211122736.16714-1-jgross@suse.com>
 <ab86650e-62b2-9967-c88d-3e0fc50bba11@suse.com>
 <54c6223a-4ca5-40d2-d377-b7ec8eb19eb0@suse.com>
 <09af5f39-7740-43b1-bc07-3d7d51a8e767@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a3aae1ec-0830-0d65-a53b-338e27fade95@suse.com>
Date: Tue, 11 Feb 2020 17:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <09af5f39-7740-43b1-bc07-3d7d51a8e767@suse.com>
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

T24gMTEuMDIuMjAgMTc6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjAyLjIwMjAgMTQ6
MTAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDExLjAyLjIwIDE0OjAxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDExLjAyLjIwMjAgMTM6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gV2hlbiBkdW1waW5nIHRoZSBydW4gcXVldWUgaW5mb3JtYXRpb24gYWRkIHNvbWUgbW9yZSBk
YXRhIHJlZ2FyZGluZwo+Pj4+IGN1cnJlbnQgYW5kIChpZiBrbm93bikgcHJldmlvdXMgdmNwdSBm
b3IgZWFjaCBwaHlzaWNhbCBjcHUuCj4+Pj4KPj4+PiBXaXRoIGNvcmUgc2NoZWR1bGluZyBhY3Rp
dmF0ZWQgdGhlIHByaW50ZWQgZGF0YSB3aWxsIGJlIGUuZy46Cj4+Pj4KPj4+PiAoWEVOKSBDUFVz
IGluZm86Cj4+Pj4gKFhFTikgQ1BVWzAwXSBjdXJyZW50PWRbSURMRV12MCwgY3Vycj1kW0lETEVd
djAsIHByZXY9TlVMTAo+Pj4+IChYRU4pIENQVVswMV0gY3VycmVudD1kW0lETEVddjEKPj4+PiAo
WEVOKSBDUFVbMDJdIGN1cnJlbnQ9ZFtJRExFXXYyLCBjdXJyPWRbSURMRV12MiwgcHJldj1OVUxM
Cj4+Pj4gKFhFTikgQ1BVWzAzXSBjdXJyZW50PWRbSURMRV12Mwo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+IC0tLQo+Pj4+IFYyOiBh
ZGQgcHJvcGVyIGxvY2tpbmcKPj4+Cj4+PiAiUHJvcGVyIiBpcyBhbWJpZ3VvdXMgaW4gdGhlIGNv
bnRleHQgb2YgZHVtcGluZyBmdW5jdGlvbnMuIEluIGEKPj4+IG51bWJlciBvZiBwbGFjZXMgd2Ug
dXNlIHRyeS1sb2NrLCB0byBhdm9pZCB0aGUgZHVtcGluZyBoYW5naW5nCj4+PiBvbiBzb21ldGhp
bmcgZWxzZSBtb25vcG9saXppbmcgdGhlIGxvY2suIEknZCBsaWtlIHRvIHN1Z2dlc3QgdG8KPj4+
IGRvIHNvIGhlcmUsIHRvby4KPj4KPj4gQWxsIHRoZSBzY2hlZHVsZXIgcmVsYXRlZCBkdW1waW5n
IGZ1bmN0aW9ucyBhcmUgdXNpbmcgdGhlICJyZWFsIiBsb2Nrcy4KPj4gU28gdXNpbmcgdHJ5bG9j
ayBpbiB0aGlzIHNpbmdsZSBjYXNlIHdvdWxkbid0IGhlbHAgYXQgYWxsLiBBZGRpdGlvbmFsbHkK
Pj4gdXNpbmcgdHJ5bG9jayBvbmx5IHdvdWxkIG1ha2UgYSBjcmFzaCBkdXJpbmcgZHVtcGluZyB0
aGUgZGF0YSBtb3JlCj4+IHByb2JhYmxlLCBzbyBJJ20gbm90IHN1cmUgd2Ugd2FudCB0aGF0Lgo+
IAo+IFdoeSB3b3VsZCBpdCBtYWtlIGEgY3Jhc2ggbW9yZSBsaWtlbHk/IElmIHlvdSBjYW4ndCBn
ZXQgdGhlIGxvY2ssCj4geW91J2Qgc2ltcGx5IHNraXAgZHVtcGluZy4KCkFoLCBva2F5LCB0aGVu
IEkgbWlzdW5kZXJzdG9vZCB5b3VyIGludGVudGlvbi4KCkkgc3RpbGwgdGhpbmsgdGhhdCB0aGlz
IHNob3VsZCBiZSBkb25lIG5vdCBvbmx5IGluIG9uZSBwbGFjZSwgYnV0IGluIGEKbW9yZSBnZW5l
cmFsIGZhc2hpb24uIEknZCByYXRoZXIgZ2l2ZSB1cCBvbmx5IGFmdGVyIHNvbWUgdGltZSB0cnlp
bmcKKDEgbWlsbGlzZWNvbmQgcGVyIGRlZmF1bHQ/KSBhbmQgYXBwbHkgdGhlIHNhbWUgc2NoZW1l
IHRvIGFsbCBkdW1waW5nCmZ1bmN0aW9ucy4KCkkgY2FuIGhhdmUgYSB0cnkgZm9yIHN1Y2ggYSBz
ZXJpZXMgaWYgeW91IGFncmVlIG9uIHRha2luZyBhIG1vcmUgZ2VuZXJhbAphcHByb2FjaC4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
