Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223303C8E8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:28:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadyS-00046T-HZ; Tue, 11 Jun 2019 10:25:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8eLM=UK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hadyQ-00046L-LF
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:25:50 +0000
X-Inumbo-ID: 461f2eda-8c33-11e9-b6c2-6b19796272b6
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 461f2eda-8c33-11e9-b6c2-6b19796272b6;
 Tue, 11 Jun 2019 10:25:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 462E1AE13;
 Tue, 11 Jun 2019 10:25:45 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>,
 Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1560244837-31477-1-git-send-email-chenbaodong@mxnavi.com>
 <76828671-6c65-bc1f-d7a1-8324491d2200@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bb5ed3ee-94ac-e06c-6edc-ce07cce00e21@suse.com>
Date: Tue, 11 Jun 2019 12:25:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <76828671-6c65-bc1f-d7a1-8324491d2200@citrix.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDYuMTkgMTI6MTgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gNi8xMS8xOSAxMDoy
MCBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+PiAqIFJlbW92ZSByZWR1bmRhbnQgc2V0ICdET01E
WUlOR19kZWFkJwo+PiBkb21haW5fY3JlYXRlKCkgd2lsbCBzZXQgdGhpcyB3aGVuIGZhaWwsIHRo
dXMgbm8gbmVlZAo+PiBzZXQgaW4gYXJjaF9kb21haW5fY3JlYXRlKCkuCj4+Cj4+ICogU2V0IGVy
cm9yIHdoZW4gcmVhbGx5IGhhcHBlbmVkCj4gCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gaW5kZXggODYzNDFiYy4uZDZjZGNm
OCAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21t
b24vc2NoZWR1bGUuYwo+PiBAQCAtMTg5NCw5ICsxODk0LDExIEBAIHN0cnVjdCBzY2hlZHVsZXIg
KnNjaGVkdWxlcl9hbGxvYyh1bnNpZ25lZCBpbnQgc2NoZWRfaWQsIGludCAqcGVycikKPj4gICAg
ICAgcmV0dXJuIE5VTEw7Cj4+ICAgCj4+ICAgIGZvdW5kOgo+PiAtICAgICpwZXJyID0gLUVOT01F
TTsKPj4gICAgICAgaWYgKCAoc2NoZWQgPSB4bWFsbG9jKHN0cnVjdCBzY2hlZHVsZXIpKSA9PSBO
VUxMICkKPj4gKyAgICB7Cj4+ICsgICAgICAgICpwZXJyID0gLUVOT01FTTsKPj4gICAgICAgICAg
IHJldHVybiBOVUxMOwo+PiArICAgIH0KPj4gICAgICAgbWVtY3B5KHNjaGVkLCBzY2hlZHVsZXJz
W2ldLCBzaXplb2YoKnNjaGVkKSk7Cj4+ICAgICAgIGlmICggKCpwZXJyID0gU0NIRURfT1Aoc2No
ZWQsIGluaXQpKSAhPSAwICkKPiAKPiBJIHdhcyBnb2luZyB0byBzYXksIHRoaXMgaXMgYSBjb21t
b24gaWRpb20gaW4gdGhlIFhlbiBjb2RlLCBhbmQgdGhlCj4gY29tcGlsZXIgd2lsbCBlbmQgdXAg
cmUtb3JnYW5pemluZyB0aGluZ3Mgc3VjaCB0aGF0IHRoZSB3cml0ZSBkb2Vzbid0Cj4gaGFwcGVu
IGFueXdheS4gIEJ1dCBpbiB0aGlzIGNhc2UsIGl0cycgYWN0dWFsbHkgd3JpdGluZyB0aHJvdWdo
IGEKPiBwb2ludGVyIGJlZm9yZSBhbmQgYWZ0ZXIgYSBmdW5jdGlvbiBjYWxsOyBJIGRvbid0IHRo
aW5rIHRoZSBjb21waWxlcgo+IHdvdWxkIGFjdHVhbGx5IGJlIGFsbG93ZWQgdG8gb3B0aW1pemUg
dGhpcyB3cml0ZSBhd2F5Lgo+IAo+IFNvLCBJIGd1ZXNzIEknZCBiZSBPSyB3aXRoIHRoaXMgcGFy
dGljdWxhciBodW5rLiAgRGFyaW8sIGFueSBvcGluaW9ucz8KCkknZCByYXRoZXIgc3dpdGNoIHRv
IFBUUl9FUlIoKSBoZXJlIGRyb3BwaW5nIHRoZSBwZXJyIHBhcmFtZXRlci4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
