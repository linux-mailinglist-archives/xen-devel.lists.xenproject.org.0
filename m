Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950141260BD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:22:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtqh-0005g1-Nk; Thu, 19 Dec 2019 11:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihtqg-0005ew-58
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:20:06 +0000
X-Inumbo-ID: 7cba7a80-2251-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cba7a80-2251-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 11:19:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45C48AB91;
 Thu, 19 Dec 2019 11:19:56 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191219034941.19141-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0e27fbe-e2f7-22ca-c3f4-bafb252c7bcc@suse.com>
Date: Thu, 19 Dec 2019 12:20:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219034941.19141-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen-pciback: optionally allow interrupt
 enable flag writes
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAwNDo0OSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiArZW51bSBpbnRlcnJ1cHRfdHlwZSB4ZW5fcGNpYmtfZ2V0X2ludGVycnVwdF90eXBlKHN0cnVj
dCBwY2lfZGV2ICpkZXYpCj4gK3sKPiArCWludCBlcnI7Cj4gKwl1MTYgdmFsOwo+ICsKPiArCWVy
ciA9IHBjaV9yZWFkX2NvbmZpZ193b3JkKGRldiwgUENJX0NPTU1BTkQsICZ2YWwpOwo+ICsJaWYg
KGVycikKPiArCQlyZXR1cm4gSU5URVJSVVBUX1RZUEVfRVJSOwo+ICsJaWYgKCEodmFsICYgUENJ
X0NPTU1BTkRfSU5UWF9ESVNBQkxFKSkKPiArCQlyZXR1cm4gSU5URVJSVVBUX1RZUEVfSU5UWDsK
PiArCj4gKwkvKiBEbyBub3QgdHJ1c3QgZGV2LT5tc2koeClfZW5hYmxlZCBoZXJlLCBhcyBlbmFi
bGluZyBjb3VsZCBiZSBkb25lCj4gKwkgKiBieXBhc3NpbmcgdGhlIHBjaV8qbXNpKiBmdW5jdGlv
bnMsIGJ5IHRoZSBxZW11Lgo+ICsJICovCgpKdWRnaW5nIGZyb20gdGhpcyBjb21tZW50LCBob3cg
Y2FuIHlvdSBhc3N1bWUgb25seSBvbmUgb2YgdGhlCnRocmVlIHZhcmlhbnRzIGlzIGFjdHVhbGx5
IGVuYWJsZWQ/IEl0J3MgYWdhaW5zdCB0aGUgc3BlYywgeWVzLApidXQgaXQncyBub3QgYXQgYWxs
IGltcG9zc2libGUgYWZhaWN0LiBJIHRoaW5rIHlvdSB3YW50IHRoZQpyZXR1cm4gdmFsdWUgaGVy
ZSB0byBiZQotIG5lZ2F0aXZlIGVycm5vIHZhbHVlcyAobm8gbmVlZCB0byBkaXNjYXJkIHRoZSBh
Y3R1YWwgZXJyb3IKICBjb2Rlcykgb3IKLSBhIG5vbi1uZWdhdGl2ZSBiaXRtYXAgaW5kaWNhdGlu
ZyB3aGljaCBvZiB0aGUgaW50ZXJydXB0IHR5cGVzCiAgaXMvYXJlIGN1cnJlbnRseSBlbmFibGVk
LgpUaGF0IHdheSAuLi4KCj4gK3N0YXRpYyBpbnQgbXNpX21zaXhfZmxhZ3Nfd3JpdGUoc3RydWN0
IHBjaV9kZXYgKmRldiwgaW50IG9mZnNldCwgdTE2IG5ld192YWx1ZSwKPiArCQkJCXZvaWQgKmRh
dGEpCj4gK3sKPiArCWludCBlcnI7Cj4gKwl1MTYgb2xkX3ZhbHVlOwo+ICsJY29uc3Qgc3RydWN0
IG1zaV9tc2l4X2ZpZWxkX2NvbmZpZyAqZmllbGRfY29uZmlnID0gZGF0YTsKPiArCWNvbnN0IHN0
cnVjdCB4ZW5fcGNpYmtfZGV2X2RhdGEgKmRldl9kYXRhID0gcGNpX2dldF9kcnZkYXRhKGRldik7
Cj4gKwo+ICsJaWYgKHhlbl9wY2lia19wZXJtaXNzaXZlIHx8IGRldl9kYXRhLT5wZXJtaXNzaXZl
KQo+ICsJCWdvdG8gd3JpdGU7Cj4gKwo+ICsJZXJyID0gcGNpX3JlYWRfY29uZmlnX3dvcmQoZGV2
LCBvZmZzZXQsICZvbGRfdmFsdWUpOwo+ICsJaWYgKGVycikKPiArCQlyZXR1cm4gZXJyOwo+ICsK
PiArCWlmIChuZXdfdmFsdWUgPT0gb2xkX3ZhbHVlKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWlm
ICghZGV2X2RhdGEtPmFsbG93X2ludGVycnVwdF9jb250cm9sIHx8Cj4gKwkgICAgKG5ld192YWx1
ZSBeIG9sZF92YWx1ZSkgJiB+ZmllbGRfY29uZmlnLT5lbmFibGVfYml0KQo+ICsJCXJldHVybiBQ
Q0lCSU9TX1NFVF9GQUlMRUQ7Cj4gKwo+ICsJaWYgKG5ld192YWx1ZSAmIGZpZWxkX2NvbmZpZy0+
ZW5hYmxlX2JpdCkgewo+ICsJCS8qIGRvbid0IGFsbG93IGVuYWJsaW5nIHRvZ2V0aGVyIHdpdGgg
b3RoZXIgaW50ZXJydXB0IHR5cGVzICovCj4gKwkJY29uc3QgZW51bSBpbnRlcnJ1cHRfdHlwZSBp
bnRfdHlwZSA9IHhlbl9wY2lia19nZXRfaW50ZXJydXB0X3R5cGUoZGV2KTsKPiArCQlpZiAoaW50
X3R5cGUgPT0gSU5URVJSVVBUX1RZUEVfTk9ORSB8fAo+ICsJCSAgICBpbnRfdHlwZSA9PSBmaWVs
ZF9jb25maWctPmludF90eXBlKQoKLi4uIGVxdWFsaXR5IGNvbXBhcmlzb25zIGxpa2UgdGhpcyBv
bmUgd2lsbCBhY3R1YWxseSBiZWNvbWUgc2FmZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
