Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D07A851B9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 19:08:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvPNy-0000Oo-3D; Wed, 07 Aug 2019 17:06:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvPNw-0000Oj-I2
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 17:06:00 +0000
X-Inumbo-ID: a039a75e-b935-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a039a75e-b935-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 17:05:58 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Vdn18XtFkk3Lw9nBoEIEo24QQPc6MrcpJx4paptbLunMBrNISriyMeWspaATRUFhzQtdTrDUhD
 hauN0ZTJoajOdfCYH4HevoxhBame6O8CjTNf1GdM7XITSxC8oNBvMBPJhnQphidYIhaiL9t7cd
 IDiUWSk7LlCy6i8nGkgH3JFFB/oIhihQ40hhuGgLlWxps2T7D/0tpz9A0e/+WfHTKpWe3Tokwr
 PR86WdS4R8woFirFOoPOhJegcRHuK+HMoDHHuIXzoHmvg3Pay+/AEZ1SjrCZgX3fFHL06Ib8Cu
 Fn8=
X-SBRS: 2.7
X-MesageID: 4123769
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,358,1559534400"; 
   d="scan'208";a="4123769"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dc907eb1-fa33-cd1e-ee88-e64bd62f5a67@citrix.com>
Date: Wed, 7 Aug 2019 18:05:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807143119.8360-2-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA3LzA4LzIwMTkgMTU6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gQWRkIHRoZSBjcHUg
Y3VycmVudGx5IGhvbGRpbmcgdGhlIGxvY2sgdG8gc3RydWN0IGxvY2tfZGVidWcuIFRoaXMgbWFr
ZXMKPiBhbmFseXNpcyBvZiBsb2NraW5nIGVycm9ycyBlYXNpZXIgYW5kIGl0IGNhbiBiZSB0ZXN0
ZWQgd2hldGhlciB0aGUKPiBjb3JyZWN0IGNwdSBpcyByZWxlYXNpbmcgYSBsb2NrIGFnYWluLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkxvb2tp
bmcgYXQgdGhlIHN0cnVjdHVyZToKCnhlbi5naXQveGVuJCBwYWhvbGUgeGVuLXN5bXMgLUUgLUMg
c3BpbmxvY2sKc3RydWN0IHNwaW5sb2NrIHsKCS8qIHR5cGVkZWYgc3BpbmxvY2tfdGlja2V0c190
ICovIHVuaW9uIHsKCQkvKiB0eXBlZGVmIHUzMiAqLyB1bnNpZ25lZCBpbnQgICAgICAgaGVhZF90
YWlsOyAgICAgICAgICAgICAgICAgICAgICAgICAgLyogICAgICAgICAgIDQgKi8KCQlzdHJ1Y3Qg
ewoJCQkvKiB0eXBlZGVmIHUxNiAqLyBzaG9ydCB1bnNpZ25lZCBpbnQgaGVhZDsgICAgICAgICAg
ICAgICAgICAgICAgIC8qICAgICAwICAgICAyICovCgkJCS8qIHR5cGVkZWYgdTE2ICovIHNob3J0
IHVuc2lnbmVkIGludCB0YWlsOyAgICAgICAgICAgICAgICAgICAgICAgLyogICAgIDIgICAgIDIg
Ki8KCQl9OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLyogICAgICAgICAgIDQgKi8KCX0gdGlja2V0czsgLyogICAg
IDAgICAgIDQgKi8KCS8qIHR5cGVkZWYgdTE2ICovIHNob3J0IHVuc2lnbmVkIGludCAgICAgICAg
IHJlY3Vyc2VfY3B1OjEyOyAgICAgICAgICAgICAgICAgICAgIC8qICAgICA0OiA0ICAyICovCgkv
KiB0eXBlZGVmIHUxNiAqLyBzaG9ydCB1bnNpZ25lZCBpbnQgICAgICAgICByZWN1cnNlX2NudDo0
OyAgICAgICAgICAgICAgICAgICAgICAvKiAgICAgNDogMCAgMiAqLwoJdW5pb24gbG9ja19kZWJ1
ZyB7CgkJc2hvcnQgdW5zaWduZWQgaW50IHZhbDsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAyICovCgkJc3RydWN0IHsKCQkJc2hv
cnQgdW5zaWduZWQgaW50IHVudXNlZDoxOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiAgICAgNjoxNSAgMiAqLwoJCQlzaG9ydCB1bnNpZ25lZCBpbnQgaXJxX3NhZmU6MTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qICAgICA2OjE0ICAyICovCgkJCXNo
b3J0IHVuc2lnbmVkIGludCBwYWQ6MjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogICAgIDY6MTIgIDIgKi8KCQkJc2hvcnQgdW5zaWduZWQgaW50IGNwdToxMjsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAgICAgNjogMCAgMiAqLwoJCX07
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiAgICAgICAgICAgMiAqLwoJfSBkZWJ1ZzsgLyogICAgIDYgICAgIDIg
Ki8KCgkvKiBzaXplOiA4LCBjYWNoZWxpbmVzOiAxLCBtZW1iZXJzOiA0ICovCgkvKiBsYXN0IGNh
Y2hlbGluZTogOCBieXRlcyAqLwp9OwoKCndlIG5vdyBnZXQgdHdvIDEyLWJpdCBDUFUgZmllbGRz
IHRyeWluZyB0byBmaXQgaW50byA0IGJ5dGVzLiAgSXMgaXQKcG9zc2libGUgdG8gcmV1c2UgdGhl
IHJlY3Vyc2VfY3B1IGZpZWxkIGZvciBkZWJ1Z2dpbmcgYXMgd2VsbD8KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
