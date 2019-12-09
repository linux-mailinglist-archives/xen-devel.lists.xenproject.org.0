Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C4116CDF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:11:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHqJ-0003GP-0g; Mon, 09 Dec 2019 12:08:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieHqH-0003GI-95
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:08:45 +0000
X-Inumbo-ID: a566fbb6-1a7c-11ea-87c6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a566fbb6-1a7c-11ea-87c6-12813bfff9fa;
 Mon, 09 Dec 2019 12:08:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9D1FADFB;
 Mon,  9 Dec 2019 12:08:43 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
 <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
Date: Mon, 9 Dec 2019 13:08:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTM6MDMsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPj4g
U2VudDogMDkgRGVjZW1iZXIgMjAxOSAxMTo1NQo+PiBUbzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBEdXJyYW50LCBQYXVsCj4+IDxwZHVycmFudEBhbWF6b24uY29t
Pgo+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBTdGVmYW5vCj4+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBCb3JpcyBPc3Ryb3Zza3kKPj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3aGVuIHN0
YXRlIGlzIGZvcmNlZCB0bwo+PiBjbG9zZWQKPj4KPj4gT24gMDkuMTIuMTkgMTI6MzksIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUaHUsIERlYyAwNSwgMjAxOSBhdCAwMjowMToyMVBN
ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4gT25seSBmb3JjZSBzdGF0ZSB0byBjbG9z
ZWQgaW4gdGhlIGNhc2Ugd2hlbiB0aGUgdG9vbHN0YWNrIG1heSBuZWVkIHRvCj4+Pj4gY2xlYW4g
dXAuIFRoaXMgY2FuIGJlIGRldGVjdGVkIGJ5IGNoZWNraW5nIHdoZXRoZXIgdGhlIHN0YXRlIGlu
Cj4+IHhlbnN0b3JlCj4+Pj4gaGFzIGJlZW4gc2V0IHRvIGNsb3NpbmcgcHJpb3IgdG8gZGV2aWNl
IHJlbW92YWwuCj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIEkgc2VlIHRoZSBwb2ludCBvZiB0aGlzLCBJ
IHdvdWxkIGV4cGVjdCB0aGF0IGEgZmFpbHVyZSB0bwo+Pj4gcHJvYmUgb3IgdGhlIHJlbW92YWwg
b2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVuYnVzIHN0YXRlIGFzCj4+PiBjbG9zZWQs
IHdoaWNoIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgYWN0dWFsIGRyaXZlciBzdGF0ZS4KPj4+Cj4+
PiBDYW4geW91IGV4cGxhaW4gd2hhdCdzIHRoZSBiZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZpY2Ug
d2l0aG91dCBhCj4+PiBkcml2ZXIgaW4gc3VjaCB1bmtub3duIHN0YXRlPwo+Pgo+PiBBbmQgbW9y
ZSBjb25jZXJuaW5nOiBkaWQgeW91IGNoZWNrIHRoYXQgbm8gZnJvbnRlbmQvYmFja2VuZCBpcwo+
PiByZWx5aW5nIG9uIHRoZSBjbG9zZWQgc3RhdGUgdG8gYmUgdmlzaWJsZSB3aXRob3V0IGNsb3Np
bmcgaGF2aW5nIGJlZW4KPj4gc2V0IGJlZm9yZT8KPiAKPiBCbGtmcm9udCBkb2Vzbid0IHNlZW0g
dG8gbWluZCBhbmQgSSBiZWxpZXZlIHRoZSBXaW5kb3dzIFBWIGRyaXZlcnMgY29wZSwgYnV0IEkg
ZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIGNvbW1lbnQgc2luY2UgdGhpcyBwYXRjaCBpcyBh
Y3R1YWxseSByZW1vdmluZyBhIGNhc2Ugd2hlcmUgdGhlIGJhY2tlbmQgdHJhbnNpdGlvbnMgZGly
ZWN0bHkgdG8gY2xvc2VkLgoKSSdtIG5vdCBzcGVha2luZyBvZiBibGtmcm9udC9ibGtiYWNrIG9u
bHksIGJ1dCBvZiBuZXQsIHRwbSwgc2NzaSwgcHZjYWxsCmV0Yy4gZnJvbnRlbmRzL2JhY2tlbmRz
LiBBZnRlciBhbGwgeW91IGFyZSBtb2RpZnlpbmcgYSBmdW5jdGlvbiBjb21tb24KdG8gYWxsIFBW
IGRyaXZlciBwYWlycy4KCllvdSBhcmUgcmVtb3ZpbmcgYSBzdGF0ZSBzd2l0YyB0byAiY2xvc2Vk
IiBpbiBjYXNlIHRoZSBzdGF0ZSB3YXMgX25vdF8KImNsb3NpbmciIGJlZm9yZS4gU28gYW55IFBW
IGRyaXZlciByZWFjdGluZyB0byAiY2xvc2VkIiBvZiB0aGUgb3RoZXIgZW5kCmluIGNhc2UgdGhl
IHByZXZpb3VzIHN0YXRlIG1pZ2h0IG5vdCBoYXZlIGJlZW4gImNsb3NpbmciIGJlZm9yZSBpcyBh
dApyaXNrIHRvIG1pc2JlaGF2ZSB3aXRoIHlvdXIgcGF0Y2guCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
