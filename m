Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CE11CCC8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:06:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNCT-0005IQ-OT; Thu, 12 Dec 2019 12:04:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifNCS-0005ID-Q6
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:04:08 +0000
X-Inumbo-ID: 7fb3c0f4-1cd7-11ea-8d35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fb3c0f4-1cd7-11ea-8d35-12813bfff9fa;
 Thu, 12 Dec 2019 12:04:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B36E2AFAA;
 Thu, 12 Dec 2019 12:04:06 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>
References: <20191211152956.5168-1-pdurrant@amazon.com>
 <20191211152956.5168-5-pdurrant@amazon.com>
 <20191212114616.GC11756@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <48e2da7d-2bf5-9f2a-0675-366ae8d3ce77@suse.com>
Date: Thu, 12 Dec 2019 13:04:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212114616.GC11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/4] xen-blkback: support dynamic
 unbind/bind
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMTkgMTI6NDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBEZWMg
MTEsIDIwMTkgYXQgMDM6Mjk6NTZQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBCeSBz
aW1wbHkgcmUtYXR0YWNoaW5nIHRvIHNoYXJlZCByaW5ncyBkdXJpbmcgY29ubmVjdF9yaW5nKCkg
cmF0aGVyIHRoYW4KPj4gYXNzdW1pbmcgdGhleSBhcmUgZnJlc2hseSBhbGxvY2F0ZWQgKGkuZSBh
c3N1bWluZyB0aGUgY291bnRlcnMgYXJlIHplcm8pCj4+IGl0IGlzIHBvc3NpYmxlIGZvciB2YmQg
aW5zdGFuY2VzIHRvIGJlIHVuYm91bmQgYW5kIHJlLWJvdW5kIGZyb20gYW5kIHRvCj4+IChyZXNw
ZWN0aXZlbHkpIGEgcnVubmluZyBndWVzdC4KPj4KPj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgYnkg
cnVubmluZzoKPj4KPj4gd2hpbGUgdHJ1ZTsKPj4gICAgZG8gZmlvIC0tbmFtZT1yYW5kd3JpdGUg
LS1pb2VuZ2luZT1saWJhaW8gLS1pb2RlcHRoPTE2IFwKPj4gICAgLS1ydz1yYW5kd3JpdGUgLS1i
cz00ayAtLWRpcmVjdD0xIC0tc2l6ZT0xRyAtLXZlcmlmeT1jcmMzMjsKPj4gICAgZG9uZQo+Pgo+
PiBpbiBhIFBWIGd1ZXN0IHdoaWxzdCBydW5uaW5nOgo+Pgo+PiB3aGlsZSB0cnVlOwo+PiAgICBk
byBlY2hvIHZiZC0kRE9NSUQtJFZCRCA+dW5iaW5kOwo+PiAgICBlY2hvIHVuYm91bmQ7Cj4+ICAg
IHNsZWVwIDU7Cj4+ICAgIGVjaG8gdmJkLSRET01JRC0kVkJEID5iaW5kOwo+PiAgICBlY2hvIGJv
dW5kOwo+PiAgICBzbGVlcCAzOwo+PiAgICBkb25lCj4+Cj4+IGluIGRvbTAgZnJvbSAvc3lzL2J1
cy94ZW4tYmFja2VuZC9kcml2ZXJzL3ZiZCB0byBjb250aW51b3VzbHkgdW5iaW5kIGFuZAo+PiBy
ZS1iaW5kIGl0cyBzeXN0ZW0gZGlzayBpbWFnZS4KPj4KPj4gVGhpcyBpcyBhIGhpZ2hseSB1c2Vm
dWwgZmVhdHVyZSBmb3IgYSBiYWNrZW5kIG1vZHVsZSBhcyBpdCBhbGxvd3MgaXQgdG8gYmUKPj4g
dW5sb2FkZWQgYW5kIHJlLWxvYWRlZCAoaS5lLiB1cGRhdGVkKSB3aXRob3V0IHJlcXVpcmluZyBk
b21VcyB0byBiZSBoYWx0ZWQuCj4+IFRoaXMgd2FzIGFsc28gdGVzdGVkIGJ5IHJ1bm5pbmc6Cj4+
Cj4+IHdoaWxlIHRydWU7Cj4+ICAgIGRvIGVjaG8gdmJkLSRET01JRC0kVkJEID51bmJpbmQ7Cj4+
ICAgIGVjaG8gdW5ib3VuZDsKPj4gICAgc2xlZXAgNTsKPj4gICAgcm1tb2QgeGVuLWJsa2JhY2s7
Cj4+ICAgIGVjaG8gdW5sb2FkZWQ7Cj4+ICAgIHNsZWVwIDE7Cj4+ICAgIG1vZHByb2JlIHhlbi1i
bGtiYWNrOwo+PiAgICBlY2hvIGJvdW5kOwo+PiAgICBjZCAkKHB3ZCk7Cj4+ICAgIHNsZWVwIDM7
Cj4+ICAgIGRvbmUKPj4KPj4gaW4gZG9tMCB3aGlsc3QgcnVubmluZyB0aGUgc2FtZSBsb29wIGFz
IGFib3ZlIGluIHRoZSAoc2luZ2xlKSBQViBndWVzdC4KPj4KPj4gU29tZSAobGVzcyBzdHJlc3Nm
dWwpIHRlc3RpbmcgaGFzIGFsc28gYmVlbiBkb25lIHVzaW5nIGEgV2luZG93cyBIVk0gZ3Vlc3QK
Pj4gd2l0aCB0aGUgbGF0ZXN0IDkuMCBQViBkcml2ZXJzIGluc3RhbGxlZC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IAo+IFJldmlld2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBUaGFua3Mh
Cj4gCj4gSnVlcmdlbjogSSBndWVzcyB5b3Ugd2lsbCBhbHNvIHBpY2sgdGhpcyBzZXJpZXMgYW5k
IG1lcmdlIGl0IGZyb20gdGhlCj4gWGVuIHRyZWUgaW5zdGVhZCBvZiB0aGUgYmxvY2sgb25lPwoK
WWVzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
