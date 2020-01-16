Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BE13D919
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 12:34:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is3MV-0000lj-PD; Thu, 16 Jan 2020 11:30:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is3MU-0000le-1h
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 11:30:54 +0000
X-Inumbo-ID: a4e3e466-3853-11ea-8707-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4e3e466-3853-11ea-8707-12813bfff9fa;
 Thu, 16 Jan 2020 11:30:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D65A3AFAA;
 Thu, 16 Jan 2020 11:30:47 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200115170015.249667-1-anthony.perard@citrix.com>
 <20200115170015.249667-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b0dcb84-425c-48a2-dba8-03385d3bf4e2@suse.com>
Date: Thu, 16 Jan 2020 12:30:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200115170015.249667-3-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 2/6] xen: Have Kconfig check $(CC)'s
 version
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxODowMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL0tj
b25maWcKPiArKysgYi94ZW4vS2NvbmZpZwo+IEBAIC00LDkgKzQsMjUgQEAKPiAgIwo+ICBtYWlu
bWVudSAiWGVuLyQoU1JDQVJDSCkgJChYRU5fRlVMTFZFUlNJT04pIENvbmZpZ3VyYXRpb24iCj4g
IAo+ICtzb3VyY2UgInNjcmlwdHMvS2NvbmZpZy5pbmNsdWRlIgo+ICsKPiAgY29uZmlnIEJST0tF
Tgo+ICAJYm9vbAo+ICAKPiArY29uZmlnIENDX0lTX0dDQwo+ICsJZGVmX2Jvb2wgJChzdWNjZXNz
LCQoQ0MpIC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAgLXEgZ2NjKQo+ICsKPiArY29uZmln
IEdDQ19WRVJTSU9OCj4gKwlpbnQKPiArCWRlZmF1bHQgJChzaGVsbCwkKEJBU0VESVIpL3Njcmlw
dHMvZ2NjLXZlcnNpb24uc2ggJChDQykpCj4gKwo+ICtjb25maWcgQ0NfSVNfQ0xBTkcKPiArCWRl
Zl9ib29sICQoc3VjY2VzcywkKENDKSAtLXZlcnNpb24gfCBoZWFkIC1uIDEgfCBncmVwIC1xIGNs
YW5nKQo+ICsKPiArY29uZmlnIENMQU5HX1ZFUlNJT04KPiArCWludAo+ICsJZGVmYXVsdCAkKHNo
ZWxsLCQoQkFTRURJUikvc2NyaXB0cy9jbGFuZy12ZXJzaW9uLnNoICQoQ0MpKQoKSSBjb250aW51
ZSB0byBiZSB1bmhhcHB5IGFib3V0IHRoZSByZWR1bmRhbmN5LCBidXQgSSB3aWxsIGFjY2VwdApp
dCBpZiBvdGhlcnMgaW5kZWVkIHRoaW5rIHRoaXMgaXMgaGVscGZ1bC4gSG93ZXZlciwgSSBkb24n
dCBzZWUKdGhlbiB3aHkgdGhlIHNldHRpbmcgb2YgQ0NfSVNfKiBuZWVkIGFub3RoZXIgc2hlbGwg
aW52b2NhdGlvbgplYWNoIC0gdGhpcyBjb3VsZCBqdXN0IGJlICpfVkVSU0lPTiA+IDAgdGhlbiwg
c2VlaW5nIHRoYXQgdGhlCnNjcmlwdHMgYWxyZWFkeSB0byBhIHJlc3BlY3RpdmUgZ3JlcCBvZiB0
aGUgLS12ZXJzaW9uIG91dHB1dC4KCkV2ZW4gYmV0dGVyIHdvdWxkIGltbyBiZSwgYXMgc3VnZ2Vz
dGVkIGJlZm9yZSwgYSAiZGVwZW5kcyBvbgpDQ19JU18qIiBvbiBlYWNoICpfVkVSU0lPTi4KCkFz
IGEgbml0IC0gY29tbW9uIHN0eWxlIGVsc2V3aGVyZSB3b3VsZCBzdWdnZXN0IHRoYXQgdGhlcmUg
b3VnaHQKdG8gYmUgYSBibGFuayBhZnRlciB0aGUgY29tbWFzIGluICQobWFjcm8sIC4uLikgaW52
b2NhdGlvbnMuClRoaXMgd291bGQgdGhlbiBleHRlbmQgdG8gS2NvbmZpZy5pbmNsdWRlIGFzIHdl
bGwsIHVubGVzcyB0aGF0J3MKYSBsYXJnZWx5IHZlcmJhdGltIGluaGVyaXRlZCBmaWxlLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
