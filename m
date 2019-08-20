Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E949627A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 16:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i057k-0001bE-IY; Tue, 20 Aug 2019 14:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYQB=WQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i057i-0001b9-Ke
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 14:28:34 +0000
X-Inumbo-ID: c9d6e92a-c356-11e9-adb5-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c9d6e92a-c356-11e9-adb5-12813bfff9fa;
 Tue, 20 Aug 2019 14:28:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07A7528;
 Tue, 20 Aug 2019 07:28:33 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65F913F246;
 Tue, 20 Aug 2019 07:28:31 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190416125832.32881-2-wipawel@amazon.de>
 <20190820132854.110843-1-wipawel@amazon.de>
 <7401194e-6070-968f-6254-cfdeaf7514a1@arm.com>
 <CB3FCDBE-6DD1-4F17-B106-AE26E478AB74@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c6b76dbd-bf18-aa66-0e55-84b9adedb45a@arm.com>
Date: Tue, 20 Aug 2019 15:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CB3FCDBE-6DD1-4F17-B106-AE26E478AB74@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch: independ. modules v2 2/3] livepatch:
 Allow to override inter-modules buildid dependency
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wOC8yMDE5IDE1OjA5LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4g
Cj4+IE9uIDIwLiBBdWcgMjAxOSwgYXQgMTU6MzUsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gU29tZXRoaW5nIGxvb2tzIGZpc2h5IGlu
IHRoZSB0aHJlYWRpbmc6Cj4+Cj4+ICAgLSBUaGUgcGF0Y2ggIzEgaXMgYW5zd2VyZWQgaW4gcmVw
bHktdG8gdGhlIHBhdGNoICMxIG9mIHZlcnNpb24gMS4KPj4gICAtIFRoaXMgcGF0Y2ggKCMyKSBp
cyBhbnN3ZXJlZCBpbiByZXBseS10byB0aGUgcGF0Y2ggIzIgb2YgdmVyc2lvbiAxLgo+PiAgIC0g
VGhlIHBhdGNoICMzIGlzIGxhYmVsZWQgYXMgdjMgYW4gaW4gcmVwbHktdG8gdGhlIHBhdGNoICMz
IG9mIHZlcnNpb24gMS4KPj4KPj4gSWYgeW91IHNlbmQgdGhlbSBhcyBzZXJpZXMsIHRoZW4gdGhl
eSBzaG91bGQgYmUgc2VudCB0b2dldGhlciBmb3IgYSBuZXcgdmVyc2lvbiBhbmQgaW4gYSBuZXcg
dGhyZWFkLiBOb3QgbWFuZ2xlZCB0byB0aGUgcHJldmlvdXMgdGhyZWFkIGFzIHRoaXMgbWFrZXMg
cXVpdGUgZGlmZmljdWx0IHRvIGZvbGxvdyB3aGF0J3MgZ29pbmcgb24uCj4+Cj4+IEFsc28gaXQg
bG9va3MgbGlrZSB0aGUgc2VyaWVzIGlzIHN0aWxsIGxhY2tpbmcgb2YgdGhlIGNvdmVyIGxldHRl
ci4gU28gSSBzdGlsbCBoYXZlIG5vIGNsdWUgd2hhdCAibGl2ZXBhdGNoOiBpbmRlcGVuZC4gbW9k
dWxlcyIgaW4geW91ciBbLi4uXSByZWZlcnMgdG8uCj4+Cj4gCj4gWWVhaCwgc2luY2UgSSBnb3Qg
ZmVlZGJhY2sgYW5kIHJldmlld3Mgb24gdmFyaW91cyBwYXRjaGVzIHRoYXQgSSBoYXZlIGFscmVh
ZHkgc3VibWl0dGVkIHRoZSB3YXkgSSBkaWQsCj4gSSBzaW1wbHkgY29udGludWUgd2l0aCB3aGF0
IEkgaGF2ZSB1bnRpbCBhbGwgY29tbWVudHMgYXJlIGFkZHJlc3NlZCAoSSBkbyBub3Qgd2FudCB0
byBsb3NlIGFueXRoaW5nKS4KCldoYXQgZG8geW91IG1lYW4gYnkgImFsbCBjb21tZW50cyBhcmUg
YWRkcmVzc2VkIj8gVXN1YWxseSB5b3UgZ2F0aGVyIGEgc2V0IG9mIApjb21tZW50cyBmb3IgYSBz
ZXJpZXMsIGFkZHJlc3MgdGhlbSBhbmQgdGhlbiByZXNlbmQgdGhlIHNlcmllcyB3aXRoIGFsbCBv
ZiB0aGVtIAphZGRyZXNzZWQuCgo+IAo+IFRoZW4sIEkgd2lsbCByZS1zZW5kIHRoZSBwYXRjaGVz
IGluIDIgc2VyaWVzOiBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgYW5kIHhlbiB3aXRoIGFsbCBjaGFu
Z2VzLAo+IFJldmlld2VkLWJ5L0Fja2VkLWJ5IGFuZCBjb3ZlciBsZXR0ZXJzLiBUaGlzIGlzIHRo
ZSB3YXkgcmVjb21tZW5kZWQgYnkgQW5kcmV3LgoKUGxlYXNlIGRvbid0IHNlbmQgdGhlIHBhdGNo
IG9uZSBieSBvbmUgdG8gY2hlY2sgaWYgZXZlcnlvbmUgaXMgaGFwcHkuIEp1c3QgCnJlc2VuZCBh
bGwgb2YgdGhlbSBpbiBvbmUgZ28gb25jZSB5b3UgZ2F0aGVyZWQgZW5vdWdoIGZlZWRiYWNrLgoK
PiAKPiBVbmZvcnR1bmF0ZWx5LCBpdCB3aWxsIGJlIGFsc28gcXVpdGUgY29uZnVzaW5nIEkgdGhp
bmssIGJlY2F1c2UgdmFyaW91cyBjaGFuZ2VzIGJlbG9uZ2luZyB0byBkaWZmZXJlbnQgdG9waWNz
LAo+IGFyZSBkaXN0cmlidXRlZCBiZXR3ZWVuIHRob3NlIDIgZGlzdGluY3QgcmVwb3MuCgpUaGF0
IGFsc28gaGFwcGVuIHdoZW4geW91IGhhdmUgbXVsdGlwbGUgcGF0Y2hlcyBpbiBhIHNlcmllcy4g
RmVhdHVyZSBpbXBsZW1lbnRlZCAKYWNjcm9zcyBtdWx0aXBsZSBwYXRjaCBuZWVkcyBhIHBsYWNl
IHRvIGRpc2N1c3MuIFRoaXMgY2FuIHVzdWFsbHkgYmUgZG9uZSBpbiB0aGUgCmNvdmVyIGxldHRl
ci4gRm9yIG11bHRpIHJlcG8gc2VyaWVzLCB5b3UgY2FuIHN0ZWVyIHRoZSBkaXNjdXNzaW9uIG9u
IGEgc2luZ2xlIApyZXBvIGFuZCBqdXN0IHJlcGxpY2F0ZSB0aGUgY2hhbmdlcyBpbiB0aGUgb3Ro
ZXIgb25lIG9uY2UgdGhlcmUgYXJlIGFuIGFncmVlbWVudC4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
