Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E8E77EC5
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2019 11:27:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrfQB-000354-FM; Sun, 28 Jul 2019 09:24:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hrfQ9-00034z-8e
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2019 09:24:49 +0000
X-Inumbo-ID: 8a60d65d-b119-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a60d65d-b119-11e9-8980-bc764e045a96;
 Sun, 28 Jul 2019 09:24:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09D69AF38;
 Sun, 28 Jul 2019 09:24:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-3-jgross@suse.com>
 <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
 <4e74ddbe-f6f1-02e9-82f3-5f07e060ba19@suse.com>
 <1f382b48-c3ba-f427-85d7-3c88403d8deb@suse.com>
 <0f067c18-b9c3-f5bf-de82-9feb9f9b6cba@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <91dce85f-cab7-804c-3b1a-d156c6dcce12@suse.com>
Date: Sun, 28 Jul 2019 11:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0f067c18-b9c3-f5bf-de82-9feb9f9b6cba@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 JulienGrall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMTkgMTM6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjYvMDcvMjAxOSAx
Mjo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjYuMDcuMTkgMTM6MzUsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMjYuMDcuMjAxOSAxMTo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBPbiAyNC8wNy8yMDE5IDEyOjI2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBAQCAt
MTgyLDMwICsxNzgsMjQgQEAgc3RhdGljIHZvaWQgX19wcmVwYXJlX3RvX3dhaXQoc3RydWN0Cj4+
Pj4+IHdhaXRxdWV1ZV92Y3B1ICp3cXYpCj4+Pj4+ICDCoMKgIHN0YXRpYyB2b2lkIF9fZmluaXNo
X3dhaXQoc3RydWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYpCj4+Pj4+ICDCoMKgIHsKPj4+Pj4gIMKg
wqDCoMKgwqDCoCB3cXYtPmVzcCA9IE5VTEw7Cj4+Pj4+IC3CoMKgwqAgKHZvaWQpdmNwdV9zZXRf
aGFyZF9hZmZpbml0eShjdXJyZW50LCAmd3F2LT5zYXZlZF9hZmZpbml0eSk7Cj4+Pj4+ICvCoMKg
wqAgdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoY3VycmVudCwgTlJfQ1BVUywgVkNQVV9BRkZJTklU
WV9XQUlUKTsKPj4+Pj4gIMKgwqAgfQo+Pj4+PiAgwqDCoCDCoMKgIHZvaWQgY2hlY2tfd2FrZXVw
X2Zyb21fd2FpdCh2b2lkKQo+Pj4+PiAgwqDCoCB7Cj4+Pj4+IC3CoMKgwqAgc3RydWN0IHdhaXRx
dWV1ZV92Y3B1ICp3cXYgPSBjdXJyZW50LT53YWl0cXVldWVfdmNwdTsKPj4+Pj4gK8KgwqDCoCBz
dHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHdhaXRxdWV1
ZV92Y3B1ICp3cXYgPSBjdXJyLT53YWl0cXVldWVfdmNwdTsKPj4+Pj4gIMKgwqAgwqDCoMKgwqDC
oMKgIEFTU0VSVChsaXN0X2VtcHR5KCZ3cXYtPmxpc3QpKTsKPj4+Pj4gIMKgwqAgwqDCoMKgwqDC
oMKgIGlmICggbGlrZWx5KHdxdi0+ZXNwID09IE5VTEwpICkKPj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybjsKPj4+Pj4gIMKgwqAgLcKgwqDCoCAvKiBDaGVjayBpZiB3ZSB3b2tlIHVw
IG9uIHRoZSB3cm9uZyBDUFUuICovCj4+Pj4+IC3CoMKgwqAgaWYgKCB1bmxpa2VseShzbXBfcHJv
Y2Vzc29yX2lkKCkgIT0gd3F2LT53YWtldXBfY3B1KSApCj4+Pj4+ICvCoMKgwqAgLyogQ2hlY2sg
aWYgd2UgYXJlIHN0aWxsIHBpbm5lZC4gKi8KPj4+Pj4gK8KgwqDCoCBpZiAoIHVubGlrZWx5KCEo
Y3Vyci0+YWZmaW5pdHlfYnJva2VuICYgVkNQVV9BRkZJTklUWV9XQUlUKSkgKQo+Pj4+PiAgwqDC
oMKgwqDCoMKgIHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC8qIFJlLXNldCBWQ1BVIGFmZmluaXR5
IGFuZCByZS1lbnRlciB0aGUgc2NoZWR1bGVyLiAqLwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Owo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgY3B1bWFza19j
b3B5KCZ3cXYtPnNhdmVkX2FmZmluaXR5LCBjdXJyLT5jcHVfaGFyZF9hZmZpbml0eSk7Cj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoCBpZiAoIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoY3VyciwKPj4+Pj4g
Y3B1bWFza19vZih3cXYtPndha2V1cF9jcHUpKSApCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB7Cj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJVbmFibGUg
dG8gc2V0IHZjcHUgYWZmaW5pdHlcbiIpOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
b21haW5fY3Jhc2goY3VycmVudC0+ZG9tYWluKTsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIH0KPj4+
Pj4gLcKgwqDCoMKgwqDCoMKgIHdhaXQoKTsgLyogdGFrZXMgdXMgYmFjayBpbnRvIHRoZSBzY2hl
ZHVsZXIgKi8KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJ2Y3B1
IGFmZmluaXR5IGxvc3RcbiIpOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZG9tYWluX2NyYXNoKGN1
cnItPmRvbWFpbik7Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgfQo+Pj4+Cj4+Pj4gSSdtIHNvcnJ5IHRv
IHJldHJhY3QgbXkgUi1ieSBhZnRlciB0aGUgZmFjdCwgYnV0IEkndmUgb25seSBqdXN0IG5vdGlj
ZWQKPj4+PiAod2hpbGUgcmViYXNpbmcgc29tZSBvZiBteSBwZW5kaW5nIHdvcmsgb3ZlciB0aGlz
KSB0aGF0IGl0IGlzIGJ1Z2d5Lgo+Pj4+Cj4+Pj4gVGhlIHJlYXNvbiB3YWl0KCkgd2FzIGNhbGxl
ZCBpcyBiZWNhdXNlIGl0IGlzIG5vdCBzYWZlIHRvIGxlYXZlIHRoYXQKPj4+PiBpZigpIGNsYXVz
ZS4KPj4+Pgo+Pj4+IFdpdGggdGhpcyBjaGFuZ2UgaW4gcGxhY2UsIHdlJ2xsIGFycmFuZ2UgZm9y
IHRoZSBWTSB0byBiZSBjcmFzaGVkLCB0aGVuCj4+Pj4gbG9uZ2p1bXAgYmFjayBpbnRvIHRoZSBz
dGFjayBmcm9tIGZyb20gdGhlIHdhaXRpbmcgdkNQVSwgb24gdGhlIHdyb25nCj4+Pj4gQ1BVLsKg
IEFueSBjYWxsZXIgd2l0aCBzbXBfcHJvY2Vzc29yX2lkKCkgb3IgdGhyZWFkLWxvY2FsIHZhcmlh
Ymxlcwo+Pj4+IGNhY2hlCj4+Pj4gYnkgcG9pbnRlciBvbiB0aGUgc3RhY2sgd2lsbCB0aGVuIGNh
dXNlIG1lbW9yeSBjb3JydXB0aW9uLgo+Pj4+Cj4+Pj4gSXRzIG5vdCBpbW1lZGlhdGVseSBvYnZp
b3VzIGhvdyB0byBmaXggdGhpcywgYnV0IGJlYXIgaW4gbWluZCB0aGF0IGFzCj4+Pj4gc29vbiBh
cyB0aGUgdm0tZXZlbnQgaW50ZXJmYWNlIGlzIGRvbmUsIEkgcGxhbiB0byBkZWxldGUgdGhpcyB3
aG9sZQo+Pj4+IHdhaXRxdWV1ZSBpbmZyYXN0cnVjdHVyZSBhbnl3YXkuCj4+Pgo+Pj4gSW4gd2hp
Y2ggY2FzZSAtIHNob3VsZCB3ZSByZXZlcnQgdGhlIGNvbW1pdCB1bnRpbCB0aGlzIGlzIHJlc29s
dmVkPwo+Pgo+PiBJbiBteSBvcGluaW9uIGl0IGlzIG5vdCB0aGF0IHVyZ2VudC4gSSBkb24ndCB0
aGluayBhbnkgb2Ygb3VyIE9TU3Rlc3RzCj4+IHdpbGwgZXZlciBiZSBhYmxlIHRvIHRyaWdnZXIg
dGhpcyBpc3N1ZSwgYXMgQUZBSUsgbm8gdGVzdCBpcyB1c2luZyB0aGUKPj4gd2FpdF9ldmVudCgp
IGludGVyZmFjZSBub3IgZG8gdGhleSB0ZXN0IHN1c3BlbmQvcmVzdW1lLiBBbmQgYm90aCBuZWVk
Cj4+IHRvIGJlIHRydWUgKGF0IHRoZSBzYW1lIHRpbWUhKSBwbHVzIGEgY3B1IG5lZWRzIHRvIGZh
aWwgY29taW5nIHVwIHdoZW4KPj4gcmVzdW1pbmcgYWdhaW4uCj4gCj4gWWVhaCAtIEkgZG9uJ3Qg
dGhpbmsgcmV2ZXJ0aW5nIGl0IGlzIG5lY2Vzc2FyeSwgYnV0IEkgd2lsbCBmbGFnCj4gInJlc29s
dmluZyB0aGlzIHNvbWVob3ciIGFzIGEgNC4xMiBibG9ja2VyLgo+IAo+IFRoZSBIVkkgc2NhbGUg
dGVzdHMgdHJpZ2dlciB0aGlzIHBhdGguwqAgR3Vlc3MgaG93IEkgZGlzY292ZXJlZCB0aGF0Cj4g
SW50cm9zcGVjdGlvbiArIExpdmVwYXRjaGluZyA9IGJvb20uCj4gCj4gSSBhbSBsZWFuaW5nIG9u
IHRoZSBzaWRlIG9mIHBhbmljKCkuwqAgSSBhZ3JlZSB0aGF0IGlmIHRoZSBBUElzIGFyZSB1c2Vk
Cj4gY29ycmVjdGx5LCBpdCBjYW4ndCBvY2N1ci4KCkhtbSwgc2hvdWxkbid0CgogICAgZG9tYWlu
X2NyYXNoKCk7CiAgICByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpOwogICAgcmV0dXJu
OwoKaW4gY2hlY2tfd2FrZXVwX2Zyb21fd2FpdCgpIGp1c3Qgd29yaz8KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
