Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56E116E15
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 14:42:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJFH-00036o-Fd; Mon, 09 Dec 2019 13:38:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieJFF-00036j-Vk
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:38:38 +0000
X-Inumbo-ID: 338a100c-1a89-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 338a100c-1a89-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 13:38:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3009DB1B8;
 Mon,  9 Dec 2019 13:38:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
 <20191207211634.9958-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57b4ce90-7756-6073-0985-0310f8709f25@suse.com>
Date: Mon, 9 Dec 2019 14:38:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191207211634.9958-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] xen/flask: Drop the gen-policy.py
 script
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTIuMjAxOSAyMjoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIveGVuL3hzbS9mbGFzay9mbGFzay1wb2xpY3kuUwo+IEBAIC0wLDAgKzEsMjAgQEAK
PiArICAgICAgICAuc2VjdGlvbiAuaW5pdC5yb2RhdGEsICJhIiwgJXByb2diaXRzCj4gKwo+ICsv
KiBjb25zdCB1bnNpZ25lZCBjaGFyIHhzbV9mbGFza19pbml0X3BvbGljeVtdIF9faW5pdGNvbnN0
ICovCj4gKyAgICAgICAgLmFsaWduIDQKCkknbSBhZnJhaWQgLmFsaWduIGlzIG5vdCB1bml2ZXJz
YWwgZW5vdWdoIHRvIGJlIHVzZWQgaGVyZSAtIGlpcmMKc29tZSBhcmNoaXRlY3R1cmVzIGhhdmUg
aXQgYWxpYXMgLnAyYWxpZ24gcmF0aGVyIHRoYW4gKGhvdyBlLmcuCng4NiBiZWhhdmVzKSAuYmFs
aWduLiBMb29rcyBsaWtlIC5wMmFsaWduIGlzIGF2YWlsYWJsZSBpbiBhbGwKYmludXRpbHMgdmVy
c2lvbnMgd2UgY2xhaW0gdG8gYmUgYWJsZSB0byBiZSBidWlsdCB3aXRoLiAoSSdtCm5vdCBzdXJl
IHRoZSBvbmUgaGVyZSBpcyBuZWVkZWQgYW55d2F5LCBidXQgdGhlIG9uZSBiZWxvdyB3ZQpzdXJl
bHkgd2FudC4pCgo+ICsgICAgICAgIC5nbG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5Cj4gK3hz
bV9mbGFza19pbml0X3BvbGljeToKPiArICAgICAgICAuaW5jYmluICJwb2xpY3kuYmluIgo+ICsu
TGVuZDoKPiArCj4gKyAgICAgICAgLnR5cGUgeHNtX2ZsYXNrX2luaXRfcG9saWN5LCAlb2JqZWN0
Cj4gKyAgICAgICAgLnNpemUgeHNtX2ZsYXNrX2luaXRfcG9saWN5LCAuIC0geHNtX2ZsYXNrX2lu
aXRfcG9saWN5Cj4gKwo+ICsvKiBjb25zdCB1bnNpZ25lZCBpbnQgX19pbml0Y29uc3QgeHNtX2Zs
YXNrX2luaXRfcG9saWN5X3NpemUgKi8KPiArICAgICAgICAuYWxpZ24gNAo+ICsgICAgICAgIC5n
bG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5X3NpemUKPiAreHNtX2ZsYXNrX2luaXRfcG9saWN5
X3NpemU6Cj4gKyAgICAgICAgLmxvbmcgLkxlbmQgLSB4c21fZmxhc2tfaW5pdF9wb2xpY3kKClNp
bWlsYXJseSAubG9uZyBpc24ndCByZWFsbHkgdW5pdmVyc2FsICh2YXJpb3VzIGFyY2hlcyBvdmVy
cmlkZQppdCBpbiBnYXMpLiBBaXVpIC5kYy5sIGlzIGludGVuZGVkIHRvIGJlIHBvcnRhYmxlIChk
ZXNwaXRlIHN0aWxsCmNhcnJ5aW5nIHRoZSAnbCcgaW4gaXRzIG5hbWUsIGFuZCBkZXNwaXRlIGV2
ZW4gdGhpcyBvbmUgZ2V0dGluZwpvdmVycmlkZGVuIGJ5IHR3byBhcmNoZXMpLiBCdXQgcGVyaGFw
cyBiZXN0IHRvIGFzayBvbiB0aGUKYmludXRpbHMgbGlzdC4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
