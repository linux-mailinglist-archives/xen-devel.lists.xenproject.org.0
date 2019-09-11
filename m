Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C004AFF9A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84Cb-0000Fw-1A; Wed, 11 Sep 2019 15:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i84CZ-0000FK-Ef
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:06:35 +0000
X-Inumbo-ID: be6fda32-d4a5-11e9-83d7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be6fda32-d4a5-11e9-83d7-12813bfff9fa;
 Wed, 11 Sep 2019 15:06:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2F40B775;
 Wed, 11 Sep 2019 15:06:33 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
 <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
 <02c7841c-1b16-97ec-c12d-695bfe0b766f@suse.com>
 <19e6dbb5-82c0-4d7e-321b-0255178b8e75@suse.com>
 <c66af277-f2e0-37ca-4aa3-274d20265ac5@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b92f1173-c2b4-17b3-021a-fc2df69a40f9@suse.com>
Date: Wed, 11 Sep 2019 17:06:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c66af277-f2e0-37ca-4aa3-274d20265ac5@suse.com>
Content-Language: de-DE
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTc6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMTU6
MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDExLjA5LjE5IDEzOjU0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDExLjA5LjIwMTkgMTM6MjksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMTEuMDkuMTkgMTM6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFNlY29uZCwg
aXMgeGVuZnMgcmVhbGx5IHRoZSBiZXN0IG5hbWUgaGVyZT/CoCBJdCBpcyBhbWJpZ3VvdXMgd2l0
aCB0aGUKPj4+Pj4gc3RpbGwtZXNzZW50aWFsIChldmVuIHRob3VnaCBpdCByZWFsbHkgbmVlZHMg
dG8gZGlzYXBwZWFyKSBMaW51eAo+Pj4+PiBmaWxlc3lzdGVtIGJ5IHRoZSBuYW1lIHhlbmZzLgo+
Pj4+Cj4+Pj4gWWVzLCBJJ20gYXdhcmUgb2YgdGhhdCBhbWJpZ3VpdHkuIEknbSBhYnNvbHV0ZWx5
IGluIGZhdm9yIG9mIGZpbmRpbmcgYQo+Pj4+IGJldHRlciBuYW1lLgo+Pj4+Cj4+Pj4gTWF5YmUg
eGVuc3lzZnM/Cj4+Pgo+Pj4gT3IganVzdCB4ZW5zeXMgKGFsYmVpdCB0aGF0J3MgbGlrZWx5IGdl
dHRpbmcgYW1iaWd1b3VzKT8gSSdtCj4+PiBub3QgZnVsbHkgY29udmluY2VkIGNhbGxpbmcgdGhp
cyBhIGZpbGUgc3lzdGVtIGlzIGEgZ29vZCBpZGVhLgo+Pj4gV2luZG93cycgbmFtZS12YWx1ZSBw
YWlyIHN0b3JlIGlzIGNhbGxlZCByZWdpc3RyeSwgZm9yCj4+PiBleGFtcGxlLCBkZXNwaXRlIGl0
IGFsc28gcmVzZW1ibGluZyBhIGZpbGUgc3lzdGVtIHRvIGEgY2VydGFpbgo+Pj4gZGVncmVlLgo+
Pgo+PiAiUmVnaXN0cnkiIGRvZXNuJ3Qgc2VlbSBjb3JyZWN0IHJlZ2FyZGluZyB0aGUgcG90ZW50
aWFsIGR5bmFtaWNhbGx5Cj4+IGdlbmVyYXRlZCBlbnRyaWVzLgo+IAo+IEkgYWxzbyBkaWRuJ3Qg
bWVhbiB0byBzdWdnZXN0ICJyZWdpc3RyeSIgYXMgYSBuYW1lLiBUaGUgV2luZG93cwo+IHJlZ2lz
dHJ5IGRvZXMsIGhvd2V2ZXIgKGFuZCBkZXNwaXRlIGl0cyBuYW1lKSwgY29udGFpbiBkeW5hbWlj
Cj4gZGF0YSBhZmFpayAoY2VydGFpbiBwZXJmb3JtYW5jZSBjb3VudGVycyBmb3IgZXhhbXBsZSku
Cj4gCj4+IEFuZCB3aXRoIHRoZSBpZGVhIHRvICJtb3VudCIgaXQgaW4gdGhlIGRvbTAga2VybmVs
J3Mgc3lzZnMgSSB0aGluawo+PiB4ZW5zeXNmcyAob3IgeGVuaHlwZnM/KSBzZWVtcyBhcHByb3By
aWF0ZS4KPiAKPiBXZWxsLCBzdWNoICJtb3VudGluZyIgaXMgZ29pbmcgdG8gYmUgaW5kaXJlY3Qs
IEkgd291bGQgYXNzdW1lPwo+IEkuZS4gbm90IGRpcmVjdGx5IGZvcndhcmQgZmlsZXN5c3RlbSBs
aWtlIHJlcXVlc3RzIGFzIHN1Y2ggdG8KPiBYZW4/CgpGb3IgcGxhaW4gZW50cmllcyAocmVhZHMg
YW5kIGV2ZW50dWFsbHkgd3JpdGVzKSBJIHN1cmVseSB3b3VsZCBqdXN0CmZvcndhcmQgdGhlbS4g
SW4gY2FzZSB0aGlzIGlzIHBvc3NpYmxlIGZvciBkaXJlY3RvcmllcywgdG9vLCBJJ2QgcmF0aGVy
CmRvIG5vIGNhY2hpbmcgaW4gdGhlIGtlcm5lbCwgc28gZm9yd2FyZGluZyB0aGVtIHdvdWxkIHNl
ZW0gdG8gYmUKYXBwcm9wcmlhdGUgKHJlamVjdGluZyBhbnl0aGluZyBidXQgcmVhZGluZyBhIGRp
cmVjdG9yeSwgb2YgY291cnNlKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
