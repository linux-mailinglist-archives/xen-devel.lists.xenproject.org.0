Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50810D80E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:47:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaiSs-0002wW-F9; Fri, 29 Nov 2019 15:45:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaiSr-0002wP-92
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:45:49 +0000
X-Inumbo-ID: 5059f89a-12bf-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5059f89a-12bf-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 15:45:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12679B266;
 Fri, 29 Nov 2019 15:45:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Durrant, Paul" <pdurrant@amazon.com>
References: <20191129134306.2738-1-pdurrant@amazon.com>
 <20191129134306.2738-3-pdurrant@amazon.com>
 <20191129150006.GZ980@Air-de-Roger>
 <f06bf1967bdf43ca9b218f9b5c5202a6@EX13D32EUC003.ant.amazon.com>
 <20191129150757.GA980@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <625a2843-ec65-90a5-8312-82131cc281c5@suse.com>
Date: Fri, 29 Nov 2019 16:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191129150757.GA980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] block/xen-blkback: allow module to
 be cleanly unloaded
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTY6MDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBOb3Yg
MjksIDIwMTkgYXQgMDM6MDI6MzdQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPj4+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTU6MDAKPj4+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+Pj4gQ2M6IGxpbnV4LWJsb2Nr
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLQo+Pj4g
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEtvbnJhZCBSemVzenV0ZWsgV2lsawo+Pj4gPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+OyBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+Cj4+PiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gYmxvY2sveGVuLWJsa2JhY2s6IGFsbG93IG1vZHVs
ZSB0byBiZSBjbGVhbmx5Cj4+PiB1bmxvYWRlZAo+Pj4KPj4+IE9uIEZyaSwgTm92IDI5LCAyMDE5
IGF0IDAxOjQzOjA2UE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+PiBBZGQgYSBtb2R1
bGVfZXhpdCgpIHRvIHBlcmZvcm0gdGhlIG5lY2Vzc2FyeSBjbGVhbi11cC4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPj4+Cj4+PiBM
R1RNOgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPj4+Cj4+Cj4+IFRoYW5rcy4KPj4KPj4+IEFGQUlDVCB3ZSBzaG91bGQgbWFrZSBz
dXJlIHRoaXMgaXMgbm90IGNvbW1pdHRlZCBiZWZvcmUgcGF0Y2ggMSwgb3IKPj4+IGVsc2UgeW91
IGNvdWxkIHVubG9hZCBhIGJsa2JhY2sgbW9kdWxlIHRoYXQncyBzdGlsbCBpbiB1c2U/Cj4+Pgo+
Pgo+PiBZZXMsIHRoYXQncyBjb3JyZWN0Lgo+IAo+IEdpdmVuIHRoaXMgaXMgYSB2ZXJ5IHNtYWxs
IGNoYW5nZSwgYW5kIG5vdCByZWFsbHkgYmxvY2sgcmVsYXRlZCBJCj4gdGhpbmsgaXQgd291bGQg
YmUgYmV0dGVyIGZvciBib3RoIHBhdGNoZXMgdG8gYmUgY29tbWl0dGVkIGZyb20gdGhlIFhlbgo+
IHRyZWUsIGlmIEplbnMsIEp1ZXJnZW4gYW5kIEJvcmlzIGFncmVlLgoKSSdtIGZpbmUgd2l0aCB0
aGF0LgoKQW5kOgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
