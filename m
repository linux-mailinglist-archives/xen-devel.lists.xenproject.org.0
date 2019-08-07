Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E384B55
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKw8-0006Uq-1A; Wed, 07 Aug 2019 12:21:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvKw6-0006Uk-5d
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:20:58 +0000
X-Inumbo-ID: ce8b57b0-b90d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ce8b57b0-b90d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:20:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6787B024;
 Wed,  7 Aug 2019 12:20:55 +0000 (UTC)
To: "Elnikety, Eslam" <elnikety@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
 <9F89B8B5-D92E-4CA6-ABCF-5F8E9707AE94@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a5f6fa6-d387-a665-47f1-e5a1b0534a6e@suse.com>
Date: Wed, 7 Aug 2019 14:20:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9F89B8B5-D92E-4CA6-ABCF-5F8E9707AE94@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNDowNywgIEVsbmlrZXR5LCBFc2xhbSAgd3JvdGU6Cj4+IE9uIDcuIEF1
ZyAyMDE5LCBhdCAxMzo0MCwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+IE9uIDA3LzA4LzIwMTkgMTI6MjAsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+
Pj4gQWRkaW5nIHN1cHBvcnQgZm9yIEZJRk8gZXZlbnQgY2hhbm5lbCBBQkkgd2FzIGZpcnN0IGlu
dHJvZHVjZWQgaW4gWGVuIDQuNAo+Pj4gKHNlZSA4ODkxMDA2MWVjNikuIE1ha2UgdGhpcyBzdXBw
b3J0IHR1bmFibGUsIHNpbmNlIHRoZSBjaG9pY2Ugb2Ygd2hpY2gKPj4+IGV2ZW50IGNoYW5uZWwg
QUJJIGhhcyBpbXBsaWNhdGlvbnMgZm9yIGhpYmVybmF0aW9uLiBDb25zaWRlciByZXN1bWluZyBh
Cj4+PiBwcmUgWGVuIDQuNCBoaWJlcm5hdGVkIExpbnV4IGd1ZXN0LiBUaGUgZ3Vlc3QgYm9vdCBr
ZXJuZWwgZGVmYXVsdHMgdG8gRklGTwo+Pj4gQUJJLCB3aGVyZWFzIHRoZSByZXN1bWUga2VybmVs
IGFzc3VtZXMgMkwuIFRoaXMsIGluIHR1cm4sIHJlc3VsdHMgaW4gWGVuCj4+PiBhbmQgdGhlIHJl
c3VtZWQga2VybmVsIHRhbGtpbmcgcGFzdCBlYWNoIG90aGVyIChkdWUgdG8gZGlmZmVyZW50IHBy
b3RvY29scwo+Pj4gRklGTyB2cyAyTCkuCj4+Cj4+IEknbSBhZnJhaWQgSSBkb24ndCBmb2xsb3cu
Cj4+Cj4+IFdlIGhhdmUgYSBMaW51eCBrZXJuZWwgd2hpY2gga25vd3MgYWJvdXQgRklGTywgd2hp
Y2ggd2FzIGZpcnN0IGJvb3RlZCBvbgo+PiBYZW4gPCA0LjQsIHNvIGNvbmZpZ3VyZWQgMkwgbW9k
ZS4KPj4KPj4gSXQgaXMgdGhlbiBzdXNwZW5kZWQsIGFuZCByZXN1bWVkIG9uIGEgbmV3ZXIgWGVu
ID49IDQuNC4gIFRoZSBndWVzdCBub3cKPj4gaGFzIGEgY2hvaWNlIGJldHdlZW4gMkwgbW9kZSwg
YW5kIEZJRk8gbW9kZS4KPj4KPj4gV2hhdCBpcyB0aGUgcHJvYmxlbT8KPj4KPj4gV2hlbiByZXN1
bWluZywgdGhlIGd1ZXN0IGluIHF1ZXN0aW9uIHNob3VsZCBjb250aW51ZSB0byB1c2UgMkwgbW9k
ZSwKPj4gYmVjYXVzZSB0aGF0IGlzIHdoYXQgaXQgd2FzIHVzaW5nIHByZXZpb3VzbHkuCj4gCj4g
QWZ0ZXIgcmVzdW1pbmcgKGkuZS4sIExpbnV4J3Mgc29mdHdhcmVfcmVzdW1lKSwgdGhlIGd1ZXN0
IHdpbGwgaW5kZWVkIGNvbnRpbnVlCj4gdG8gdXNlIDJMLiBIb3dldmVyLCBYZW4gaGFzIGFscmVh
ZHkgZG9uZSBldnRjaG5fZmlmb19pbml0X2NvbnRyb2wgYXMgcGFydCBvZgo+IHRoZSBib290IGtl
cm5lbCBpbml0IChiZWZvcmUgdGhlIGd1ZXN0J3Mgc29mdHdhcmVfcmVzdW1lKS4gVGhlbiwgd2Ug
cmVhY2ggdGhlCj4gcG9pbnQgd2hlcmUgZ3Vlc3QgYXNzdW1lcyAyTCBhbmQgWGVuIGFzc3VtZXMg
RklGTy4KClRoaXMgaW52b2x2ZW1lbnQgb2YgdHdvIGRpc3RpbmN0IGtlcm5lbHMgd2Fzbid0IG9i
dmlvdXMgYXQgYWxsIGZyb20KdGhlIGluaXRpYWwgcG9zdGluZywgZGVzcGl0ZSB0aGUgdXNlIG9m
IHRoZSB0ZXJtcyAiZ3Vlc3QgYm9vdCBrZXJuZWwiCmFuZCAicmVzdW1lZCBrZXJuZWwiLiBJbiBh
bnkgZXZlbnQgLSBpc24ndCB0aGlzIGFuIGlzc3VlIHRvIGJlIHNvbHZlZApiZXR3ZWVuIHRoZSB0
d28ga2VybmVscywgd2l0aG91dCAoYXMgZmFyIGFzIHBvc3NpYmxlKSBYZW4ncwppbnZvbHZlbWVu
dCwgYW5kIHdpdGhvdXQgcmVzdHJpY3RpbmcgZ3Vlc3QgY2FwYWJpbGl0aWVzPwoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
