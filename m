Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B97F7328A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:13:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqIvl-0003gm-40; Wed, 24 Jul 2019 15:11:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqIvk-0003gg-D5
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:11:48 +0000
X-Inumbo-ID: 59db17e0-ae25-11e9-8738-0f30ba1f8376
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59db17e0-ae25-11e9-8738-0f30ba1f8376;
 Wed, 24 Jul 2019 15:11:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D648FAE0C;
 Wed, 24 Jul 2019 15:11:44 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
 <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
 <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
 <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
 <114b18be-6119-58b9-72fc-61c3b8077902@suse.com>
 <ab98171d-8cdc-f3f2-079b-90e69de655b2@citrix.com>
 <2311b239-507e-f215-c5b6-01c0a45b7a4c@suse.com>
 <659621ed-2635-24ac-443f-e6d9894f8e07@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7d873f15-b831-4e7a-8dc1-a707c492148f@suse.com>
Date: Wed, 24 Jul 2019 17:11:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <659621ed-2635-24ac-443f-e6d9894f8e07@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMTkgMTY6NTQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMjQvMDcvMjAxOSAx
MDoxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlIGZpeCBpcyBhIG9uZS1saW5lci4gOi0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKPj4gaW5kZXggZjBiYzViMzE2MS4uZGE5ZWZiMTQ3ZiAxMDA2NDQKPj4gLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBA
QCAtMjIwNyw2ICsyMjA3LDcgQEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF93YWl0
X3JlbmRlenZvdXNfaW4oc3RydWN0IHNjaGVkX3VuaXQgKnByZXYsCj4+ICDCoMKgwqDCoMKgwqDC
oMKgIGlmICggdW5saWtlbHkoIXNjaGVkdWxlcl9hY3RpdmUpICkKPj4gIMKgwqDCoMKgwqDCoMKg
wqAgewo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVChpc19pZGxlX3VuaXQocHJl
dikpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdG9taWNfc2V0KCZwcmV2LT5uZXh0X3Rh
c2stPnJlbmRlenZvdXNfb3V0X2NudCwgMCk7Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cHJldi0+cmVuZGV6dm91c19pbl9jbnQgPSAwOwo+PiAgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICDC
oMKgwqDCoCB9Cj4gCj4gRXZlbiB3aXRoIHRoYXQgYXBwbGllZCwgSSdtIHN0aWxsIHNlZWluZyBp
dCA6KAoKSW50ZXJlc3RpbmcsIGZvciBtZSBpdCB3YXMgZ29uZS4KClRpbWUgZm9yIG1vcmUgdGVz
dHMgYW5kIHNvbWUgZGVidWcgY29kZS4uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
