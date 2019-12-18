Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FEF1242AA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:17:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVPp-0004dq-GF; Wed, 18 Dec 2019 09:14:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihVPn-0004dJ-KS
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:14:43 +0000
X-Inumbo-ID: d2e2d7ef-2176-11ea-904a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2e2d7ef-2176-11ea-904a-12813bfff9fa;
 Wed, 18 Dec 2019 09:14:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32546B12C;
 Wed, 18 Dec 2019 09:14:41 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-2-jgross@suse.com>
 <2ee2b27f31eeb85bff40bcfd588a6d45c7e80488.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f876474b-64a3-ebf2-7825-1359deb4d41c@suse.com>
Date: Wed, 18 Dec 2019 10:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <2ee2b27f31eeb85bff40bcfd588a6d45c7e80488.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/9] xen/sched: move schedulers and cpupool
 coding to dedicated directory
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMDk6NTgsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0x
Mi0xOCBhdCAwODo0OCArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gTW92ZSBzY2hlZCpj
IGFuZCBjcHVwb29sLmMgdG8gYSBuZXcgZGlyZWN0b3J5IGNvbW1vbi9zY2hlZC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAtLS0KPj4gICBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICst
LQo+PiAgIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNjYgKy0tLS0tLS0tLS0tCj4+IC0tLS0tLS0tLS0KPj4gICB4ZW4vY29tbW9uL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICstLQo+PiAgIHhlbi9jb21tb24v
c2NoZWQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNjUKPj4gKysrKysrKysr
KysrKysrKysrKysrCj4+ICAgeGVuL2NvbW1vbi9zY2hlZC9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNyArKysKPj4gICAuLi4ve2NvbXBhdC9zY2hlZHVsZS5jID0+IHNjaGVk
L2NvbXBhdF9zY2hlZHVsZS5jfSB8ICAyICstCj4+ICAgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9j
cHVwb29sLmMgICAgICAgICAgICAgICAgICAgfCAgMAo+PiAgIHhlbi9jb21tb24veyA9PiBzY2hl
ZH0vc2NoZWRfYXJpbmM2NTMuYyAgICAgICAgICAgIHwgIDAKPj4gICB4ZW4vY29tbW9uL3sgPT4g
c2NoZWR9L3NjaGVkX2NyZWRpdC5jICAgICAgICAgICAgICB8ICAwCj4+ICAgeGVuL2NvbW1vbi97
ID0+IHNjaGVkfS9zY2hlZF9jcmVkaXQyLmMgICAgICAgICAgICAgfCAgMAo+PiAgIHhlbi9jb21t
b24veyA9PiBzY2hlZH0vc2NoZWRfbnVsbC5jICAgICAgICAgICAgICAgIHwgIDAKPj4gICB4ZW4v
Y29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX3J0LmMgICAgICAgICAgICAgICAgICB8ICAwCj4+ICAg
eGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hlZHVsZS5jICAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+PiAgIDEzIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygt
KQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL3NjaGVkL0tjb25maWcKPj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9zY2hlZC9NYWtlZmlsZQo+PiAgIHJlbmFtZSB4
ZW4vY29tbW9uL3tjb21wYXQvc2NoZWR1bGUuYyA9PiBzY2hlZC9jb21wYXRfc2NoZWR1bGUuY30K
Pj4gKDk3JSkKPj4gICByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9jcHVwb29sLmMgKDEw
MCUpCj4+ICAgcmVuYW1lIHhlbi9jb21tb24veyA9PiBzY2hlZH0vc2NoZWRfYXJpbmM2NTMuYyAo
MTAwJSkKPj4gICByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hlZF9jcmVkaXQuYyAo
MTAwJSkKPj4gICByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hlZF9jcmVkaXQyLmMg
KDEwMCUpCj4+ICAgcmVuYW1lIHhlbi9jb21tb24veyA9PiBzY2hlZH0vc2NoZWRfbnVsbC5jICgx
MDAlKQo+PiAgIHJlbmFtZSB4ZW4vY29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX3J0LmMgKDEwMCUp
Cj4+ICAgcmVuYW1lIHhlbi9jb21tb24veyA9PiBzY2hlZH0vc2NoZWR1bGUuYyAoOTklKQo+Pgo+
IE1hdHRlciBvZiB0YXN0ZSwgSSBndWVzcywgYnV0IHdoYXQgYWJvdXQgbm90IHJlcGVhdGluZyAn
c2NoZWQnLCBpLmUuOgo+IAo+IHhlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMgIC0tPiB4ZW4vY29t
bW9uL3NjaGVkL2NyZWRpdC5jCj4geGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgLS0+IHhlbi9j
b21tb24vc2NoZWQvY3JlZGl0Mi5jCj4geGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgICAgLS0+IHhl
bi9jb21tb24vc2NoZWQvbnVsbC5jCj4gLi4uCj4gCj4gc2NoZWR1bGUuYyBjYW4gYmUgY2FsbGVk
IHNvbWV0aGluZyBsaWtlICdjb3JlLmMnLCBvciAnY29tbW9uLmMnIG9yIGp1c3QKPiAnc2NoZWQu
YycgKHRoZSByZXBldGl0aW9uIGJlaW5nLCBpbiB0aGlzIGNhc2UsIGludGVudGlvbmFsKQoKU3Vy
ZSwgSSdsbCBnbyB3aXRoIGNvcmUuYwoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
