Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FE8AFF89
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:06:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i847O-0008UI-1p; Wed, 11 Sep 2019 15:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i847M-0008UD-Be
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:01:12 +0000
X-Inumbo-ID: fdddcb30-d4a4-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdddcb30-d4a4-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 15:01:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E14B69C90;
 Wed, 11 Sep 2019 15:01:10 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
 <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
 <02c7841c-1b16-97ec-c12d-695bfe0b766f@suse.com>
 <19e6dbb5-82c0-4d7e-321b-0255178b8e75@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c66af277-f2e0-37ca-4aa3-274d20265ac5@suse.com>
Date: Wed, 11 Sep 2019 17:01:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <19e6dbb5-82c0-4d7e-321b-0255178b8e75@suse.com>
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

T24gMTEuMDkuMjAxOSAxNTowMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wOS4xOSAx
Mzo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjA5LjIwMTkgMTM6MjksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxMS4wOS4xOSAxMzoxNywgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBTZWNvbmQsIGlzIHhlbmZzIHJlYWxseSB0aGUgYmVzdCBuYW1lIGhlcmU/wqAgSXQgaXMg
YW1iaWd1b3VzIHdpdGggdGhlCj4+Pj4gc3RpbGwtZXNzZW50aWFsIChldmVuIHRob3VnaCBpdCBy
ZWFsbHkgbmVlZHMgdG8gZGlzYXBwZWFyKSBMaW51eAo+Pj4+IGZpbGVzeXN0ZW0gYnkgdGhlIG5h
bWUgeGVuZnMuCj4+Pgo+Pj4gWWVzLCBJJ20gYXdhcmUgb2YgdGhhdCBhbWJpZ3VpdHkuIEknbSBh
YnNvbHV0ZWx5IGluIGZhdm9yIG9mIGZpbmRpbmcgYQo+Pj4gYmV0dGVyIG5hbWUuCj4+Pgo+Pj4g
TWF5YmUgeGVuc3lzZnM/Cj4+Cj4+IE9yIGp1c3QgeGVuc3lzIChhbGJlaXQgdGhhdCdzIGxpa2Vs
eSBnZXR0aW5nIGFtYmlndW91cyk/IEknbQo+PiBub3QgZnVsbHkgY29udmluY2VkIGNhbGxpbmcg
dGhpcyBhIGZpbGUgc3lzdGVtIGlzIGEgZ29vZCBpZGVhLgo+PiBXaW5kb3dzJyBuYW1lLXZhbHVl
IHBhaXIgc3RvcmUgaXMgY2FsbGVkIHJlZ2lzdHJ5LCBmb3IKPj4gZXhhbXBsZSwgZGVzcGl0ZSBp
dCBhbHNvIHJlc2VtYmxpbmcgYSBmaWxlIHN5c3RlbSB0byBhIGNlcnRhaW4KPj4gZGVncmVlLgo+
IAo+ICJSZWdpc3RyeSIgZG9lc24ndCBzZWVtIGNvcnJlY3QgcmVnYXJkaW5nIHRoZSBwb3RlbnRp
YWwgZHluYW1pY2FsbHkKPiBnZW5lcmF0ZWQgZW50cmllcy4KCkkgYWxzbyBkaWRuJ3QgbWVhbiB0
byBzdWdnZXN0ICJyZWdpc3RyeSIgYXMgYSBuYW1lLiBUaGUgV2luZG93cwpyZWdpc3RyeSBkb2Vz
LCBob3dldmVyIChhbmQgZGVzcGl0ZSBpdHMgbmFtZSksIGNvbnRhaW4gZHluYW1pYwpkYXRhIGFm
YWlrIChjZXJ0YWluIHBlcmZvcm1hbmNlIGNvdW50ZXJzIGZvciBleGFtcGxlKS4KCj4gQW5kIHdp
dGggdGhlIGlkZWEgdG8gIm1vdW50IiBpdCBpbiB0aGUgZG9tMCBrZXJuZWwncyBzeXNmcyBJIHRo
aW5rCj4geGVuc3lzZnMgKG9yIHhlbmh5cGZzPykgc2VlbXMgYXBwcm9wcmlhdGUuCgpXZWxsLCBz
dWNoICJtb3VudGluZyIgaXMgZ29pbmcgdG8gYmUgaW5kaXJlY3QsIEkgd291bGQgYXNzdW1lPwpJ
LmUuIG5vdCBkaXJlY3RseSBmb3J3YXJkIGZpbGVzeXN0ZW0gbGlrZSByZXF1ZXN0cyBhcyBzdWNo
IHRvClhlbj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
