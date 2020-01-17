Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EBA140591
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 09:42:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNA5-0000Yj-SQ; Fri, 17 Jan 2020 08:39:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isNA4-0000Ye-F9
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 08:39:24 +0000
X-Inumbo-ID: d7bc82e2-3904-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7bc82e2-3904-11ea-b89f-bc764e2007e4;
 Fri, 17 Jan 2020 08:39:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 989B8ADEF;
 Fri, 17 Jan 2020 08:39:14 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200109134825.31482-1-jgross@suse.com>
 <20200109134825.31482-2-jgross@suse.com>
 <f1e82975-0789-68b8-691b-02f557c27400@suse.com>
 <aacfae4e-39ca-b183-8b8a-b347415ba553@suse.com>
 <251bd26c-1937-e70b-3ec3-6ebb10e879dc@suse.com>
 <aedc415a-5a54-5f54-8daa-14685eb78276@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3be7b516-26f0-080a-f683-f9e0fe99e0ea@suse.com>
Date: Fri, 17 Jan 2020 09:39:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <aedc415a-5a54-5f54-8daa-14685eb78276@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxOTo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8wMS8yMDIw
IDE2OjEyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTQuMDEuMjAyMCAxNzowMCwgSsO8cmdl
biBHcm/DnyB3cm90ZToKPj4+IE9uIDE0LjAxLjIwIDE2OjQ3LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAwOS4wMS4yMDIwIDE0OjQ4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiAtLS0g
YS94ZW4vS2NvbmZpZy5kZWJ1Zwo+Pj4+PiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zwo+Pj4+PiBA
QCAtODEsNiArODEsMTIgQEAgY29uZmlnIFBFUkZfQVJSQVlTCj4+Pj4+ICAgCS0tLWhlbHAtLS0K
Pj4+Pj4gICAJICBFbmFibGVzIHNvZnR3YXJlIHBlcmZvcm1hbmNlIGNvdW50ZXIgYXJyYXkgaGlz
dG9ncmFtcy4KPj4+Pj4gICAKPj4+Pj4gK2NvbmZpZyBERUJVR19CVUdWRVJCT1NFCj4+Pj4+ICsJ
Ym9vbCAiVmVyYm9zZSBCVUdfT04gbWVzc2FnZXMiCj4+Pj4+ICsJZGVmYXVsdCBERUJVRwo+Pj4+
PiArCS0tLWhlbHAtLS0KPj4+Pj4gKwkgIEluIGNhc2UgYSBCVUdfT04gdHJpZ2dlcnMgYWRkaXRp
b25hbGx5IHByaW50IHRoZSB0cmlnZ2VyaW5nCj4+Pj4+ICsJICBjb25kaXRpb24gb24gdGhlIGNv
bnNvbGUuCj4+Pj4+ICAgCj4+Pj4+ICAgY29uZmlnIFZFUkJPU0VfREVCVUcKPj4+PiBXaGlsZSBJ
IGNhbiBzZWUgcmVhc29ucyB0byBwdXQgdGhpcyBoZXJlLCBkb2luZyBzbyBtZWFucyB0aGUgb3B0
aW9uCj4+Pj4gd2lsbCBiZSB1bmF2YWlsYWJsZSBpbiBub24tRVhQRVJUIHJlbGVhc2UgYnVpbGRz
LiBJcyBpdCBpbnRlbmRlZCB0bwo+Pj4+IGJlIHRoYXQgd2F5Pwo+Pj4gSSBjYW4gbW92ZSBpdCBl
aXRoZXIgdG8geGVuL0tjb25maWcgb3IgaW4gS2NvbmZpZy5kZWJ1ZyBvdXQgb2YgdGhlCj4+PiAi
aWYgZXhwZXJ0IiBzZWN0aW9uIGlmIHlvdSB3YW50Lgo+PiBJIHRoaW5rIHRoaXMgd291bGQgYmUg
YmV0dGVyLCBidXQgZ2l2ZSBvdGhlcnMgYSBjaGFuY2UgdG8gdm9pY2UKPj4gb3BpbmlvbnMuCj4g
Cj4gVEJILCBJIGRvbid0IHRoaW5rIGFueW9uZSB3aWxsIGJlIGludGVyZXN0ZWQgaW4gbm90IGhh
dmluZyB0aGUgc3RyaW5ncy7CoAo+IFRoZSBjaGFuZ2UgaXMgd2hhdD8gYSBjb3VwbGUgb2YgaHVu
ZHJlZCBieXRlcz/CoCBUaGF0IGlzIGEgZnJhY3Rpb24gb2YKPiB0aGUgc2l6ZSBvZiBzb21lIGZ1
bmN0aW9ucyB3ZSBoYXZlLgoKV2VsbCwgaXQncyBhIGNvdXBsZSB0aG91c2FuZCAoYWJvdXQgN2sg
YWNjb3JkaW5nIHRvIG15IHNpbXBsaXN0aWMKZXN0aW1hdGlvbiwgYnV0IHRoaXMgaXMgdGFraW5n
IEFybSBhbmQgeDg2IHRvZ2V0aGVyKS4gSXQncyBub3QgdGhlCmVuZCBvZiB0aGUgd29ybGQsIGJ1
dCBpbiBwYXJ0aWN1bGFyIGVtYmVkZGVkIHVzZXJzIG1heSB3YW50IHRvIGdldApyaWQgb2YgdGhp
cy4gVGhlcmUncyBhIHJlYXNvbiBhZnRlciBhbGwgKEkgYXNzdW1lKSB0aGF0IExpbnV4IGhhcwp0
aGUgb3B0aW9uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
