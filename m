Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8BF14B886
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:24:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRkK-0002FU-0h; Tue, 28 Jan 2020 14:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwRkI-0002Ek-33
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:21:38 +0000
X-Inumbo-ID: 7e707364-41d9-11ea-86df-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e707364-41d9-11ea-86df-12813bfff9fa;
 Tue, 28 Jan 2020 14:21:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRkG-0001Qf-PP; Tue, 28 Jan 2020 14:21:36 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRkG-0005m3-Ee; Tue, 28 Jan 2020 14:21:36 +0000
Date: Tue, 28 Jan 2020 14:21:33 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyxia@amazon.com>
Message-ID: <20200128142133.eqvyj52xdu5lzbdw@debian>
References: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDE6NTA6MDVQTSArMDAwMCwgSG9uZ3lhbiBYaWEgd3Jv
dGU6Cj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBXZSBhcmUgZ29p
bmcgdG8gc3dpdGNoIHRvIHVzaW5nIGRvbWhlYXAgcGFnZSBmb3IgcGFnZSB0YWJsZXMuCj4gQSBu
ZXcgc2V0IG9mIEFQSXMgaXMgaW50cm9kdWNlZCB0byBhbGxvY2F0ZSBhbmQgZnJlZSBwYWdlcyBv
ZiBwYWdlCj4gdGFibGVzIGJhc2VkIG9uIG1mbiBpbnN0ZWFkIG9mIHRoZSB4ZW5oZWFwIGRpcmVj
dCBtYXAgYWRkcmVzcy4gVGhlCj4gYWxsb2NhdGlvbiBhbmQgZGVhbGxvY2F0aW9uIHdvcmsgb24g
bWZuX3QgYnV0IG5vdCBwYWdlX2luZm8sIGJlY2F1c2UKPiB0aGV5IGFyZSByZXF1aXJlZCB0byB3
b3JrIGV2ZW4gYmVmb3JlIGZyYW1lIHRhYmxlIGlzIHNldCB1cC4KPiAKPiBJbXBsZW1lbnQgdGhl
IG9sZCBmdW5jdGlvbnMgd2l0aCB0aGUgbmV3IG9uZXMuIFdlIHdpbGwgcmV3cml0ZSwgc2l0ZQo+
IGJ5IHNpdGUsIG90aGVyIG1tIGZ1bmN0aW9ucyB0aGF0IG1hbmlwdWxhdGUgcGFnZSB0YWJsZXMg
dG8gdXNlIHRoZSBuZXcKPiBBUElzLgo+IAo+IEFmdGVyIHRoZSBhbGxvY2F0aW9uLCBvbmUgbmVl
ZHMgdG8gbWFwIGFuZCB1bm1hcCB2aWEgbWFwX2RvbWFpbl9wYWdlIHRvCj4gYWNjZXNzIHRoZSBQ
VEVzLiBUaGlzIGRvZXMgbm90IGJyZWFrIHhlbiBoYWxmIHdheSwgc2luY2UgdGhlIG5ldyBBUElz
Cj4gc3RpbGwgdXNlIHhlbmhlYXAgcGFnZXMgdW5kZXJuZWF0aCwgYW5kIG1hcF9kb21haW5fcGFn
ZSB3aWxsIGp1c3QgdXNlCj4gdGhlIGRpcmVjdG1hcCBmb3IgbWFwcGluZ3MuIFRoZXkgd2lsbCBi
ZSBzd2l0Y2hlZCB0byB1c2UgZG9taGVhcCBhbmQKPiBkeW5hbWljIG1hcHBpbmdzIHdoZW4gdXNh
Z2Ugb2Ygb2xkIEFQSXMgaXMgZWxpbWluYXRlZC4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBp
bnRlbmRlZCBpbiB0aGlzIHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFt
YXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
