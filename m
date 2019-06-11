Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C160F3C904
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hae2D-0004O5-FH; Tue, 11 Jun 2019 10:29:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8eLM=UK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hae2C-0004Nz-Op
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:29:44 +0000
X-Inumbo-ID: d2eaa656-8c33-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d2eaa656-8c33-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 10:29:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C913FADDD;
 Tue, 11 Jun 2019 10:29:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1560244837-31477-1-git-send-email-chenbaodong@mxnavi.com>
 <76828671-6c65-bc1f-d7a1-8324491d2200@citrix.com>
 <bb5ed3ee-94ac-e06c-6edc-ce07cce00e21@suse.com>
 <14948bfa-1203-97f2-f595-abc0c2c78a6a@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <28ad7e86-d724-0fcc-85fa-3289dc485c1a@suse.com>
Date: Tue, 11 Jun 2019 12:29:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <14948bfa-1203-97f2-f595-abc0c2c78a6a@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] xen: superficial clean-ups
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDYuMTkgMTI6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTEvMDYvMjAxOSAx
MToyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTEuMDYuMTkgMTI6MTgsIEdlb3JnZSBE
dW5sYXAgd3JvdGU6Cj4+PiBPbiA2LzExLzE5IDEwOjIwIEFNLCBCYW9kb25nIENoZW4gd3JvdGU6
Cj4+Pj4gKiBSZW1vdmUgcmVkdW5kYW50IHNldCAnRE9NRFlJTkdfZGVhZCcKPj4+PiBkb21haW5f
Y3JlYXRlKCkgd2lsbCBzZXQgdGhpcyB3aGVuIGZhaWwsIHRodXMgbm8gbmVlZAo+Pj4+IHNldCBp
biBhcmNoX2RvbWFpbl9jcmVhdGUoKS4KPj4+Pgo+Pj4+ICogU2V0IGVycm9yIHdoZW4gcmVhbGx5
IGhhcHBlbmVkCj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94
ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+PiBpbmRleCA4NjM0MWJjLi5kNmNkY2Y4IDEwMDY0NAo+
Pj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vc2No
ZWR1bGUuYwo+Pj4+IEBAIC0xODk0LDkgKzE4OTQsMTEgQEAgc3RydWN0IHNjaGVkdWxlciAqc2No
ZWR1bGVyX2FsbG9jKHVuc2lnbmVkCj4+Pj4gaW50IHNjaGVkX2lkLCBpbnQgKnBlcnIpCj4+Pj4g
IMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+Pj4gIMKgIMKgwqAgZm91bmQ6Cj4+Pj4gLcKgwqDC
oCAqcGVyciA9IC1FTk9NRU07Cj4+Pj4gIMKgwqDCoMKgwqAgaWYgKCAoc2NoZWQgPSB4bWFsbG9j
KHN0cnVjdCBzY2hlZHVsZXIpKSA9PSBOVUxMICkKPj4+PiArwqDCoMKgIHsKPj4+PiArwqDCoMKg
wqDCoMKgwqAgKnBlcnIgPSAtRU5PTUVNOwo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IE5VTEw7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gIMKgwqDCoMKgwqAgbWVtY3B5KHNjaGVkLCBzY2hl
ZHVsZXJzW2ldLCBzaXplb2YoKnNjaGVkKSk7Cj4+Pj4gIMKgwqDCoMKgwqAgaWYgKCAoKnBlcnIg
PSBTQ0hFRF9PUChzY2hlZCwgaW5pdCkpICE9IDAgKQo+Pj4KPj4+IEkgd2FzIGdvaW5nIHRvIHNh
eSwgdGhpcyBpcyBhIGNvbW1vbiBpZGlvbSBpbiB0aGUgWGVuIGNvZGUsIGFuZCB0aGUKPj4+IGNv
bXBpbGVyIHdpbGwgZW5kIHVwIHJlLW9yZ2FuaXppbmcgdGhpbmdzIHN1Y2ggdGhhdCB0aGUgd3Jp
dGUgZG9lc24ndAo+Pj4gaGFwcGVuIGFueXdheS7CoCBCdXQgaW4gdGhpcyBjYXNlLCBpdHMnIGFj
dHVhbGx5IHdyaXRpbmcgdGhyb3VnaCBhCj4+PiBwb2ludGVyIGJlZm9yZSBhbmQgYWZ0ZXIgYSBm
dW5jdGlvbiBjYWxsOyBJIGRvbid0IHRoaW5rIHRoZSBjb21waWxlcgo+Pj4gd291bGQgYWN0dWFs
bHkgYmUgYWxsb3dlZCB0byBvcHRpbWl6ZSB0aGlzIHdyaXRlIGF3YXkuCj4+Pgo+Pj4gU28sIEkg
Z3Vlc3MgSSdkIGJlIE9LIHdpdGggdGhpcyBwYXJ0aWN1bGFyIGh1bmsuwqAgRGFyaW8sIGFueSBv
cGluaW9ucz8KPj4KPj4gSSdkIHJhdGhlciBzd2l0Y2ggdG8gUFRSX0VSUigpIGhlcmUgZHJvcHBp
bmcgdGhlIHBlcnIgcGFyYW1ldGVyLgo+IAo+ICsyIGZvciB0aGlzLCBidXQgSSB3YXMgZ29pbmcg
dG8gd2FpdCB1bnRpbCBjb3JlIHNjaGVkdWxpbmcgaGFkIGdvdHRlbiBhCj4gYml0IGZ1cnRoZXIg
YmVmb3JlIHN1Z2dlc3RpbmcgY2xlYW51cCB3aGljaCBpcyBndWFyYW50ZWVkIHRvIGNvbGxpZGUu
Cj4gCj4gU2FkbHksIGl0J3MgZmFpcmx5IGludHJ1c2l2ZSBpbiB0aGUgY3B1cG9vbCBjb2RlIGFz
IHdlbGwuCgpJIGNhbiBhZGQgdGhpcyB0byBteSBsaXN0IG9mIHNjaGVkdWxlciBjbGVhbnVwcyB0
byBkby4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
