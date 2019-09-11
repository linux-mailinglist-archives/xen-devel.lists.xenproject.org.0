Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB725AFD5F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 15:05:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i82Fp-0006Eh-Ky; Wed, 11 Sep 2019 13:01:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i82Fn-0006Ec-Uc
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 13:01:47 +0000
X-Inumbo-ID: 4f3ccc62-d494-11e9-83d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f3ccc62-d494-11e9-83d5-12813bfff9fa;
 Wed, 11 Sep 2019 13:01:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C6F5AC3E;
 Wed, 11 Sep 2019 13:01:45 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
 <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
 <02c7841c-1b16-97ec-c12d-695bfe0b766f@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <19e6dbb5-82c0-4d7e-321b-0255178b8e75@suse.com>
Date: Wed, 11 Sep 2019 15:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <02c7841c-1b16-97ec-c12d-695bfe0b766f@suse.com>
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

T24gMTEuMDkuMTkgMTM6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMTM6
MjksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDExLjA5LjE5IDEzOjE3LCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4gU2Vjb25kLCBpcyB4ZW5mcyByZWFsbHkgdGhlIGJlc3QgbmFtZSBoZXJl
P8KgIEl0IGlzIGFtYmlndW91cyB3aXRoIHRoZQo+Pj4gc3RpbGwtZXNzZW50aWFsIChldmVuIHRo
b3VnaCBpdCByZWFsbHkgbmVlZHMgdG8gZGlzYXBwZWFyKSBMaW51eAo+Pj4gZmlsZXN5c3RlbSBi
eSB0aGUgbmFtZSB4ZW5mcy4KPj4KPj4gWWVzLCBJJ20gYXdhcmUgb2YgdGhhdCBhbWJpZ3VpdHku
IEknbSBhYnNvbHV0ZWx5IGluIGZhdm9yIG9mIGZpbmRpbmcgYQo+PiBiZXR0ZXIgbmFtZS4KPj4K
Pj4gTWF5YmUgeGVuc3lzZnM/Cj4gCj4gT3IganVzdCB4ZW5zeXMgKGFsYmVpdCB0aGF0J3MgbGlr
ZWx5IGdldHRpbmcgYW1iaWd1b3VzKT8gSSdtCj4gbm90IGZ1bGx5IGNvbnZpbmNlZCBjYWxsaW5n
IHRoaXMgYSBmaWxlIHN5c3RlbSBpcyBhIGdvb2QgaWRlYS4KPiBXaW5kb3dzJyBuYW1lLXZhbHVl
IHBhaXIgc3RvcmUgaXMgY2FsbGVkIHJlZ2lzdHJ5LCBmb3IKPiBleGFtcGxlLCBkZXNwaXRlIGl0
IGFsc28gcmVzZW1ibGluZyBhIGZpbGUgc3lzdGVtIHRvIGEgY2VydGFpbgo+IGRlZ3JlZS4KCiJS
ZWdpc3RyeSIgZG9lc24ndCBzZWVtIGNvcnJlY3QgcmVnYXJkaW5nIHRoZSBwb3RlbnRpYWwgZHlu
YW1pY2FsbHkKZ2VuZXJhdGVkIGVudHJpZXMuCgpBbmQgd2l0aCB0aGUgaWRlYSB0byAibW91bnQi
IGl0IGluIHRoZSBkb20wIGtlcm5lbCdzIHN5c2ZzIEkgdGhpbmsKeGVuc3lzZnMgKG9yIHhlbmh5
cGZzPykgc2VlbXMgYXBwcm9wcmlhdGUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
