Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2E18423F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:11:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfNf-0002s5-NY; Fri, 13 Mar 2020 08:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCfNe-0002rx-R3
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:09:18 +0000
X-Inumbo-ID: efba1fc0-6501-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efba1fc0-6501-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 08:09:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A8ED2AC24;
 Fri, 13 Mar 2020 08:09:17 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20200312082831.22280-1-jgross@suse.com>
 <20200312082831.22280-4-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9fd5b45b-a8a9-8203-9985-482ea72921f2@suse.com>
Date: Fri, 13 Mar 2020 09:09:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312082831.22280-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen/rcu: add assertions to debug
 build
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAgMDk6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gWGVuJ3MgUkNVIGltcGxl
bWVudGF0aW9uIHJlbGllcyBvbiBubyBzb2Z0aXJxIGhhbmRsaW5nIHRha2luZyBwbGFjZQo+IHdo
aWxlIGJlaW5nIGluIGEgUkNVIGNyaXRpY2FsIHNlY3Rpb24uIEFkZCBBU1NFUlQoKXMgaW4gZGVi
dWcgYnVpbGRzCj4gaW4gb3JkZXIgdG8gY2F0Y2ggYW55IHZpb2xhdGlvbnMuCj4gCj4gRm9yIHRo
YXQgcHVycG9zZSBtb2RpZnkgcmN1X3JlYWRfW3VuXWxvY2soKSB0byB1c2UgYSBkZWRpY2F0ZWQg
cGVyY3B1Cj4gY291bnRlciBpbnN0ZWFkIG9mIHByZWVtcHRfW2VufGRpc11hYmxlKCkgYXMgdGhp
cyBlbmFibGVzIHRvIHRlc3QKPiB0aGF0IGNvbmRpdGlvbiBpbiBfX2RvX3NvZnRpcnEoKSAoQVNT
RVJUX05PVF9JTl9BVE9NSUMoKSBpcyBub3QKPiB1c2FibGUgdGhlcmUgZHVlIHRvIF9fY3B1X3Vw
KCkgY2FsbGluZyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKQo+IHdoaWxlIGhvbGRpbmcgdGhl
IGNwdSBob3RwbHVnIGxvY2spLgo+IAo+IERyb3BwaW5nIHRoZSBub3cgbm8gbG9uZ2VyIG5lZWRl
ZCAjaW5jbHVkZSBvZiBwcmVlbXB0LmggaW4gcmN1cGRhdGUuaAo+IHJlcXVpcmVzIGFkZGluZyBp
dCBpbiBzb21lIHNvdXJjZXMuCj4gCj4gV2hpbGUgYXQgaXQgc3dpdGNoIHRoZSByY3VfcmVhZF9b
dW5dbG9jaygpIGltcGxlbWVudGF0aW9uIHRvIHN0YXRpYwo+IGlubGluZSBmdW5jdGlvbnMgaW5z
dGVhZCBvZiBtYWNyb3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgoKRGVwZW5kaW5nIG9uIHRoZSBhY2NlcHRhbmNlIG9mIG15IGp1c3Qgc2VudCBz
ZXJpZXMgZm9yIGZpeGluZwpwcmVlbXB0aW9uIGRpc2FibGluZyBpbiBsb2NrcyBJIG1pZ2h0IHNl
bmQgYSBmaXh1cCB0byB0aGlzIHBhdGNoLCB0b28sCnJlLWFkZGluZyBwcmVlbXB0X2Rpc2FibGUo
KSB0byByY3VfcmVhZF9sb2NrKCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
