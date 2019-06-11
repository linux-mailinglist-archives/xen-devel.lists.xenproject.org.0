Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33BF3CDAC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 15:54:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hahCA-0005hY-8t; Tue, 11 Jun 2019 13:52:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hahC9-0005hT-Ar
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 13:52:13 +0000
X-Inumbo-ID: 1c7eacf8-8c50-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1c7eacf8-8c50-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 13:52:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B969344;
 Tue, 11 Jun 2019 06:52:11 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE39B3F557;
 Tue, 11 Jun 2019 06:52:09 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
 <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
 <5CFF4DA60200007800236D45@prv1-mh.provo.novell.com>
 <0fab9902-a644-7aaf-d61c-bad37616b51c@arm.com>
 <5CFF774D0200007800236E83@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <42961ee0-31c1-e120-dd27-d4b3ed3a84c5@arm.com>
Date: Tue, 11 Jun 2019 14:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CFF774D0200007800236E83@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMS8wNi8yMDE5IDEwOjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMS4wNi4x
OSBhdCAxMToyNywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gSGkgSmFuLAo+Pgo+
PiBPbiA2LzExLzE5IDc6NDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDYu
MTkgYXQgMjI6MDMsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gSGksCj4+Pj4K
Pj4+PiBPbiA2LzUvMTkgNTowMSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+ICAgICA+IE9u
IDA1LzA2LzIwMTkgMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gSnVsaWVuLAo+Pj4+
Pj4KPj4+Pj4+Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+IHdyb3RlOgo+Pj4+Pj4+IEFzIGJ1aWxkIHN5c3RlbSBub3cgc3VwcG9ydHMgKl9kZWZj
b25maWcgcnVsZXMgaXQgaXMgZ29vZCB0byBiZSBhYmxlCj4+Pj4+Pj4gdG8gY29uZmlndXJlIG1p
bmltYWwgWEVOIGltYWdlIHdpdGgKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICBtYWtlIHRpbnk2NF9kZWZj
b25maWcKPj4+Pj4+Pgo+Pj4+Pj4+IGNvbW1hbmQuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4+Pj4+
Pgo+Pj4+Pj4geW91IGhhZCBvYmplY3Rpb25zIGhlcmUsIGFuZCB0aGUgZmlyc3QgcGF0Y2ggbWFr
ZXMgbGl0dGxlIHNlbnNlCj4+Pj4+PiB3aXRob3V0IHRoZSAybmQuIE1heSBJIGFzayB3aGF0IHRo
ZSB2ZXJkaWN0IGlzLCBpLmUuIHdoZXRoZXIgSSBzaG91bGQKPj4+Pj4+IGRyb3AgdGhlc2UgdHdv
IGZyb20gbXkgbGlzdCBvZiBwZW5kaW5nIHBhdGNoZXM/Cj4+Pj4+Cj4+Pj4+IFZvbG9keW15ciB3
YXMgZ29pbmcgdG8gcmVzZW5kIHRoZSBzZXJpZXMgd2l0aCBkb2N1bWVudGF0aW9uIChhcyBhCj4+
Pj4+IHNlcGFyYXRlIHBhdGNoKS4gQnV0IEkgd291bGQgYmUgaGFwcHkgdG8gdGFrZSAjMSBhbmQg
IzIgYXNzdW1pbmcgdGhhdAo+Pj4+PiBkb2N1bWVudGF0aW9uIHBhdGNoIGlzIGdvaW5nIHRvIGJl
IHNlbnQuCj4+Pj4+Cj4+Pj4+IFlvdSBjYW4gY29uc2lkZXIgdGhpcyBhcyBhbiBhY2tlZDoKPj4+
Pj4KPj4+Pj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IGZv
ciB0aGUgdHdvIHBhdGNoZXMuCj4+Pj4KPj4+PiBJIHdhcyBhYm91dCB0byBhcHBseSB0aGUgdHdv
IHBhdGNoZXMsIGJ1dCBJIGRvbid0IHNlZW0gdG8gYmUgYWJsZSB0bwo+Pj4+IGFwcGx5IGl0IGJl
Y2F1c2Ugc29tZSBsaW5lcyBjb250YWlucyA9MjAuIEFGQUlDVCwgaXQgaXMgaW4gcmVwbGFjZW1l
bnQKPj4+PiBvZiAic3BhY2UiIGluIGNlcnRhaW4gY2FzZS4KPj4+Cj4+PiBXZWxsLCBpbmRlcGVu
ZGVudCBvZiBhbnkgZm9ybWF0dGluZyBpc3N1ZXMgeW91IG91Z2h0IHRvIGhhdmUgdHJvdWJsZQo+
Pj4gYXBwbHlpbmcgdGhlbSBzaW5jZSBJIGRpZCBzbyBhbHJlYWR5Lgo+Pgo+PiBIbW0sIEkgbWlz
c2VkIHRoYXQuIFNvcnJ5IGZvciBub2lzZS4KPj4KPj4gT3V0IG9mIGludGVyZXN0LCBob3cgZGlk
IHlvdSBtYW5hZ2UgdG8gYXBwbHkgaXQgd2l0aCB0aGUgPTIwIGluIHRoZSBwYXRjaD8KPiAKPiBU
aGVyZSBhcmUgbm8gPTIwIGluIHRoZSBtYWlsIHRoYXQgSSBkaWQgcmVjZWl2ZS4KClNvcnJ5LCBJ
IHdhcyB0YWxraW5nIGFib3V0IHBhdGNoICMxLiBJbnRlcmVzdGluZ2x5IHRoZSBDb250ZW50LVR5
cGUgaXMgZGlmZmVyZW50IApiZXR3ZWVuIHRoZSBlLW1haWwgcmVjZWl2ZWQgZnJvbSBleGNoYW5n
ZSAodGhpcyBpcyBhIGRpcmVjdCBjb3B5KSBhbmQgZ21haWwgCih0aGlzIGlzIHJlY2VpdmVkIGZy
b20geGVuLWRldmVsKS4KClRoZSBnbWFpbCB2ZXJzaW9uIGRvZXNuJ3QgY29udGFpbiBpdCwgd2hp
bGUgdGhlIGV4Y2hhbmdlIHZlcnNpb24gZG9lcy4uLiBIbW1tLi4uCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
