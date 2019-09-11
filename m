Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EEEAFFDB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:22:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84Q5-0001x7-09; Wed, 11 Sep 2019 15:20:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84Q2-0001wx-OP
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:20:30 +0000
X-Inumbo-ID: b0555614-d4a7-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0555614-d4a7-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 15:20:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17482B66E;
 Wed, 11 Sep 2019 15:20:29 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
 <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
 <02c7841c-1b16-97ec-c12d-695bfe0b766f@suse.com>
 <19e6dbb5-82c0-4d7e-321b-0255178b8e75@suse.com>
 <c66af277-f2e0-37ca-4aa3-274d20265ac5@suse.com>
 <b92f1173-c2b4-17b3-021a-fc2df69a40f9@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f423603-3c62-39bb-6829-b84ebe2ee4b4@suse.com>
Date: Wed, 11 Sep 2019 17:20:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b92f1173-c2b4-17b3-021a-fc2df69a40f9@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAxNzowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wOS4xOSAx
NzowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjA5LjIwMTkgMTU6MDEsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBBbmQgd2l0aCB0aGUgaWRlYSB0byAibW91bnQiIGl0IGluIHRoZSBk
b20wIGtlcm5lbCdzIHN5c2ZzIEkgdGhpbmsKPj4+IHhlbnN5c2ZzIChvciB4ZW5oeXBmcz8pIHNl
ZW1zIGFwcHJvcHJpYXRlLgo+Pgo+PiBXZWxsLCBzdWNoICJtb3VudGluZyIgaXMgZ29pbmcgdG8g
YmUgaW5kaXJlY3QsIEkgd291bGQgYXNzdW1lPwo+PiBJLmUuIG5vdCBkaXJlY3RseSBmb3J3YXJk
IGZpbGVzeXN0ZW0gbGlrZSByZXF1ZXN0cyBhcyBzdWNoIHRvCj4+IFhlbj8KPiAKPiBGb3IgcGxh
aW4gZW50cmllcyAocmVhZHMgYW5kIGV2ZW50dWFsbHkgd3JpdGVzKSBJIHN1cmVseSB3b3VsZCBq
dXN0Cj4gZm9yd2FyZCB0aGVtLiBJbiBjYXNlIHRoaXMgaXMgcG9zc2libGUgZm9yIGRpcmVjdG9y
aWVzLCB0b28sIEknZCByYXRoZXIKPiBkbyBubyBjYWNoaW5nIGluIHRoZSBrZXJuZWwsIHNvIGZv
cndhcmRpbmcgdGhlbSB3b3VsZCBzZWVtIHRvIGJlCj4gYXBwcm9wcmlhdGUgKHJlamVjdGluZyBh
bnl0aGluZyBidXQgcmVhZGluZyBhIGRpcmVjdG9yeSwgb2YgY291cnNlKS4KCkJ1dCB0aGF0J3Mg
c3RpbGwgYSBrZXJuZWwgYmFzZWQgZmlsZSBzeXN0ZW0sIHNpbXBseSB0YWtpbmcgaXRzCmRhdGEg
ZnJvbSBYZW4uIEl0J3Mgbm90IGxpa2UgZmlsZSBzeXN0ZW0gcmVxdWVzdHMgYXMgc3VjaCB3b3Vs
ZApiZSBmb3J3YXJkZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
