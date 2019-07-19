Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9676E776
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:37:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTx3-0001hB-R4; Fri, 19 Jul 2019 14:33:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ARRu=VQ=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hoTx1-0001h6-Ss
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:33:35 +0000
X-Inumbo-ID: 301f1697-aa32-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 301f1697-aa32-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 14:33:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15AD53091783;
 Fri, 19 Jul 2019 14:33:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-195.ams2.redhat.com
 [10.36.116.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3402B26FA1;
 Fri, 19 Jul 2019 14:33:32 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
 <a91c8d00-a40b-3906-6432-b9e0c2953843@citrix.com>
 <20190719102008.GB1208@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <03cc01a5-d6a8-84b7-d382-d83fadea486b@redhat.com>
Date: Fri, 19 Jul 2019 16:33:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190719102008.GB1208@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 19 Jul 2019 14:33:34 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMTkvMTkgMTI6MjAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDA1
LCAyMDE5IGF0IDAyOjU3OjA2UE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA0
LzA3LzIwMTkgMTU6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL092
bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtIGIvT3ZtZlBrZy9Y
ZW5SZXNldFZlY3Rvci9JYTE2L1Jlc2V0VmVjdG9yVnRmMC5hc20KPj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi45NTgxOTViYzVlCj4+PiAtLS0gL2Rldi9udWxs
Cj4+PiArKysgYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFz
bQo+Pj4gK3Z0ZlNpZ25hdHVyZToKPj4+ICsgICAgREIgICAgICAnVicsICdUJywgJ0YnLCAwCj4+
PiArCj4+PiArQUxJR04gICAxNgo+Pj4gKwo+Pj4gK3Jlc2V0VmVjdG9yOgo+Pj4gKzsKPj4+ICs7
IFJlc2V0IFZlY3Rvcgo+Pj4gKzsKPj4+ICs7IFRoaXMgaXMgd2hlcmUgdGhlIHByb2Nlc3NvciB3
aWxsIGJlZ2luIGV4ZWN1dGlvbgo+Pj4gKzsKPj4+ICsgICAgbm9wCj4+PiArICAgIG5vcAo+Pgo+
PiBXaHkgdHdvIG5vcHM/Cj4gCj4gSSBkb24ndCBrbm93LCB0aGlzIGlzIGV4aXN0aW5nIGNvZGUg
dGhhdCBJIGR1cGxpY2F0ZWQgdG8gYWxsb3cgYWRkaW5nIGEKPiBuZXcgZW50cnkgcG9pbnQuIChJ
IHdhbnRlZCB0byB1c2UgLS1maW5kLWNvcGllcy1oYXJkZXIgd2hlbiBzZW5kaW5nIHRoZQo+IHBh
dGNoLCBidXQgZm9yZ290IHRoaXMgdGltZS4KCk5vdCBhIGJpZyBwcm9ibGVtOyB3aGlsZSByZXZp
ZXdpbmcgdjMsIEkgZGlkIHN1Y2ggY29tcGFyaXNvbnMgbXlzZWxmLCBpbgpteSBsb2NhbCBjbG9u
ZS4gRmVlbCBmcmVlIHRvIHNraXAgIi0tZmluZC1jb3BpZXMtaGFyZGVyIiB3aGVuIHBvc3Rpbmcg
djQKdG9vOyBJIHRoaW5rIHRoZXJlIGlzbid0IG11Y2ggY2h1cm4gZ29pbmcgb24gaW4gcGFyYWxs
ZWwgcmlnaHQgbm93LgoKSG93ZXZlciwgYSBuZXcgcmVxdWVzdCBmb3IgdjQ6IHBsZWFzZSBtYWtl
IHN1cmUgdGhhdCB0aGUgbmV3IG1vZHVsZXMgLwpwYXRocyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0
Y2ggc2V0IGFyZSBjb3ZlcmVkIGluIE1haW50YWluZXJzLnR4dC4KCj4gVGhpcyBwYXJ0IG9mIHRo
ZSBjaHVuayB3b3VsZCBub3QgYmUgdGhlcmUuKQoKUmVnYXJkaW5nIHRoZSBOT1BzOiBhbGwgSSBj
YW4gdGVsbCB5b3UgaXMgdGhhdCB0aGV5IG9yaWdpbmF0ZSBmcm9tCmNvbW1pdCA4MzMyOTgzZTJl
MzMgKCJVZWZpQ3B1UGtnOiBSZXBsYWNlIHRoZSB1bi1uZWNlc3NhcnkgV0JJTlZECmluc3RydWN0
aW9uIGF0IHRoZSByZXNldCB2ZWN0b3Igd2l0aCB0d28gTk9QcyBpbiBWVEYwLiIsIDIwMTEtMDgt
MDQpLgoKV2hldGhlciB0aGF0IGNoYW5nZSBtYWRlIHNlbnNlIGJhY2sgdGhlbiwgbGV0IGFsb25l
IGlmIGl0IG1ha2VzIHNlbnNlCm5vdzogbm8gY2x1ZS4KClRoYW5rcwpMYXN6bG8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
