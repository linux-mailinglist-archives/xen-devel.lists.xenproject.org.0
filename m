Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083D10FBE8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 11:42:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic5b1-00051q-E4; Tue, 03 Dec 2019 10:39:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic5az-00051f-En
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 10:39:53 +0000
X-Inumbo-ID: 3befbbff-15b9-11ea-81d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3befbbff-15b9-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 10:39:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36A81B25A;
 Tue,  3 Dec 2019 10:39:51 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191203054222.7966-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9ccf765b-f828-52db-6778-18e605a80a02@suse.com>
Date: Tue, 3 Dec 2019 11:40:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203054222.7966-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] xen-pciback: optionally allow interrupt
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
 Simon Gaiser <simon@invisiblethingslab.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAwNjo0MSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBAQCAtMTE3LDYgKzExOCwzNSBAQCBzdGF0aWMgaW50IGNvbW1hbmRfd3JpdGUoc3RydWN0IHBj
aV9kZXYgKmRldiwgaW50IG9mZnNldCwgdTE2IHZhbHVlLCB2b2lkICpkYXRhKQo+ICAJCXBjaV9j
bGVhcl9td2koZGV2KTsKPiAgCX0KPiAgCj4gKwlpZiAoZGV2X2RhdGEgJiYgZGV2X2RhdGEtPmFs
bG93X2ludGVycnVwdF9jb250cm9sKSB7Cj4gKwkJaWYgKCEoY21kLT52YWwgJiBQQ0lfQ09NTUFO
RF9JTlRYX0RJU0FCTEUpICYmCj4gKwkJICAgICh2YWx1ZSAmIFBDSV9DT01NQU5EX0lOVFhfRElT
QUJMRSkpIHsKPiArCQkJcGNpX2ludHgoZGV2LCAwKTsKPiArCQl9IGVsc2UgaWYgKChjbWQtPnZh
bCAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSkgJiYKPiArCQkgICAgISh2YWx1ZSAmIFBDSV9D
T01NQU5EX0lOVFhfRElTQUJMRSkpIHsKPiArCQkJLyogRG8gbm90IGFsbG93IGVuYWJsaW5nIElO
VHggdG9nZXRoZXIgd2l0aCBNU0kgb3IgTVNJLVguICovCj4gKwkJCS8qIERvIG5vdCB0cnVzdCBk
ZXYtPm1zaSh4KV9lbmFibGVkIGhlcmUsIGFzIGVuYWJsaW5nIGNvdWxkIGJlIGRvbmUKPiArCQkJ
ICogYnlwYXNzaW5nIHRoZSBwY2lfKm1zaSogZnVuY3Rpb25zLCBieSB0aGUgcWVtdS4KPiArCQkJ
ICovCj4gKwkJCWVyciA9IHBjaV9yZWFkX2NvbmZpZ193b3JkKGRldiwKPiArCQkJCQkJICAgZGV2
LT5tc2lfY2FwICsgUENJX01TSV9GTEFHUywKPiArCQkJCQkJICAgJmNhcF92YWx1ZSk7Cj4gKwkJ
CWlmICghZXJyICYmIChjYXBfdmFsdWUgJiBQQ0lfTVNJX0ZMQUdTX0VOQUJMRSkpCj4gKwkJCQll
cnIgPSAtRUJVU1k7Cj4gKwkJCWlmICghZXJyKQo+ICsJCQkJZXJyID0gcGNpX3JlYWRfY29uZmln
X3dvcmQoZGV2LAo+ICsJCQkJCQkJICAgZGV2LT5tc2l4X2NhcCArIFBDSV9NU0lYX0ZMQUdTLAo+
ICsJCQkJCQkJICAgJmNhcF92YWx1ZSk7CgpXaGF0IGFib3V0IGEgZGV2aWNlIHdpdGhvdXQgTVNJ
IGFuZC9vciBNU0ktWD8gV291bGRuJ3QgeW91IHJlYWQKZnJvbSAoY2xvc2UgdG8pIGNvbmZpZyBz
cGFjZSBvZmZzZXQgMCBpbiB0aGlzIGNhc2UsIGludGVycHJldGluZwpzb21lIHVucmVsYXRlZCBi
aXQocykgYXMgdGhlIE1TSSAvIE1TSS1YIGVuYWJsZSBvbmUocyk/CgpKdXN0IGFzIGFuIGluaXRp
YWwgaW1wbGVtZW50YXRpb24gcmVsYXRlZCByZW1hcmsuIEknbSBzdGlsbCB0bwp0aGluayBhYm91
dCB0aGUgaWRlYSBhcyBhIHdob2xlLCBhbGJlaXQgSSBmaW5kIHRoZSBhcmd1bWVudApwcmV0dHkg
Y29udmluY2luZyBhdCB0aGUgZmlyc3QgZ2xhbmNlIG9mIGRldmljZXMgYmVpbmcgYWJsZSB0bwpy
YWlzZSBNU0kgYW55d2F5IGV2ZW4gd2hlbiBkaXNhYmxlZCBhcyBwZXIgdGhlIGNvbmZpZyBzcGFj
ZQpzZXR0aW5nLiAoT2YgY291cnNlLCBhcyB3aXRoIGFueSBjb25maWcgc3BhY2Ugc2V0dGluZ3Ms
IGRldmljZXMKcHJvdmlkaW5nIGJhY2tkb29yIGFjY2VzcyB3b3VsZCBvcGVuIHNpbWlsYXIgYXZl
bnVlcy4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
