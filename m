Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D833F8B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 09:10:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY3XI-0002rG-4q; Tue, 04 Jun 2019 07:07:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY3XG-0002rB-RH
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 07:07:06 +0000
X-Inumbo-ID: 5978b6b4-8697-11e9-860c-17081707ebda
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5978b6b4-8697-11e9-860c-17081707ebda;
 Tue, 04 Jun 2019 07:07:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 01:07:00 -0600
Message-Id: <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 01:06:56 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Anthony Perard" <anthony.perard@citrix.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
In-Reply-To: <20190603171558.GF2126@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE5OjE1LCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDU6NTI6MTJQTSArMDEwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+PiBUaGUgc2FtZSBlcnJvciBjYW5ub3QgYmUgcmVwcm9kdWNlZCBvbiBsYXh0
b24qLiBMb29raW5nIGF0IHRoZSB0ZXN0IGhpc3RvcnksCj4+IGl0IGxvb2tzIGxpa2UgcWVtdS11
cHN0cmVhbS00LjEyLXRlc3RpbmcgZmxpZ2h0IGhhcyBydW4gc3VjY2Vzc2Z1bGx5IGEgZmV3Cj4+
IHRpbWVzIG9uIHJvY2hlc3RlciouIFNvIHdlIG1heSBoYXZlIGZpeGVkIHRoZSBlcnJvciBpbiBY
ZW4gNC4xMi4KPj4gCj4+IFBvdGVudGlhbCBjYW5kaWRhdGVzIHdvdWxkIGJlOgo+PiAgICAtIDAw
Yzk2ZDc3NDIgInhlbi9hcm06IG1tOiBTZXQtdXAgcGFnZSBwZXJtaXNzaW9uIGZvciBYZW4gbWFw
cGluZ3MgZWFybGllciBvbiIKPj4gICAgLSBmNjA2NThjNmFlICJ4ZW4vYXJtOiBTdG9wIHJlbG9j
YXRpbmcgWGVuIgo+PiAKPj4gSWFuLCBpcyBpdCBzb21ldGhpbmcgdGhlIGJpc2VjdG9yIGNvdWxk
IGF1dG9tYXRpY2FsbHkgbG9vayBhdD8KPj4gSWYgbm90LCBJIHdpbGwgbmVlZCB0byBmaW5kIHNv
bWUgdGltZSBhbmQgYm9ycm93IHRoZSBib2FyZCB0byBiaXNlY3QgdGhlCj4+IGlzc3Vlcy4KPiAK
PiBJIGF0dGVtcHRlZCB0byBkbyB0aGF0IGJpc2VjdGlvbiBteXNlbGYsIGFuZCB0aGUgZmlyc3Qg
Y29tbWl0IHRoYXQgZ2l0Cj4gd2FudGVkIHRvIHRyeSwgYSBjb21tb24gY29tbWl0IHRvIGJvdGgg
YnJhbmNoZXMsIGJvb3RzIGp1c3QgZmluZS4KClRoYW5rcyBmb3IgZG9pbmcgdGhpcyEKCk9uZSB0
aGluZyB0aGF0LCBmb3Igbm93LCBjb21wbGV0ZWx5IGVzY2FwZXMgbWU6IEhvdyBjb21lIHRoZQpt
YWluIDQuMTEgYnJhbmNoIGhhcyBwcm9ncmVzc2VkIGZpbmUsIGJ1dCB0aGUgcWVtdXUgb25lIGhh
cwpnb3Qgc3RhbGxlZCBsaWtlIHRoaXM/Cgo+IEl0IHR1cm5zIG91dCB0aGF0IHRoZSBmaXJzdCBj
b21taXQgdGhhdCBmYWlscyB0byBib290IG9uIHJvY2hlc3RlciBpcwo+ICAgZTIwMmZlYjcxMyB4
ZW4vY21kbGluZTogRml4IGJ1Z2d5IHN0cm5jbXAocywgTElURVJBTCwgc3MgLSBzKSBjb25zdHJ1
Y3QKPiAoZXZlbiB3aXRoIHRoZSAiZWI4YWNiYTgyYSB4ZW46IEZpeCBiYWNrcG9ydCBvZiAuLiIg
YXBwbGllZCkKCk5vdyB0aGF0J3MgcGFydGljdWxhcmx5IG9kZCBhIHJlZ3Jlc3Npb24gY2FuZGlk
YXRlLiBJdCBkb2Vzbid0CnRvdWNoIGFueSBBcm0gY29kZSBhdCBhbGwgKG5vciBkb2VzIHRoZSBm
aXh1cCBjb21taXQpLiBBbmQgdGhlCmNvbW1vbiBjb2RlIGNoYW5nZXMgZG9uJ3QgbG9vayAicmlz
a3kiIGVpdGhlcjsgdGhlIG9uZSB0aGluZyB0aGF0Cmp1bXBzIG91dCBhcyB0aGUgbW9zdCBsaWtl
bHkgb2YgYWxsIHRoZSB1bmxpa2VseSBjYW5kaWRhdGVzIHdvdWxkCnNlZW0gdG8gYmUgdGhlIHhl
bi9jb21tb24vZWZpL2Jvb3QuYyBjaGFuZ2UsIGJ1dCBpZiB0aGVyZSB3YXMKYSBwcm9ibGVtIHRo
ZXJlIHRoZW4gdGhlIEVGSSBib290IG9uIEFybSB3b3VsZCBiZSBsYXRlbnRseQpicm9rZW4gaW4g
b3RoZXIgd2F5cyBhcyB3ZWxsLiBQbHVzLCBvZiBjb3Vyc2UsIHlvdSBzYXkgdGhhdCB0aGUKc2Ft
ZSBjaGFuZ2UgaXMgbm8gcHJvYmxlbSBvbiA0LjEyLgoKT2YgY291cnNlIHRoZSBjb21taXQgaXRz
ZWxmIGNvdWxkIGJlIGZ1cnRoZXIgImJpc2VjdGVkIiAtIGFsbApjaGFuZ2VzIG90aGVyIHRoYW4g
dGhlIGludHJvZHVjdGlvbiBvZiBjbWRsaW5lX3N0cmNtcCgpIGFyZQpjb21wbGV0ZWx5IGluZGVw
ZW5kZW50IG9mIG9uZSBhbm90aGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
