Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA8D9E96C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 15:32:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2bWj-0003VG-AC; Tue, 27 Aug 2019 13:28:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2bWh-0003VB-MU
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:28:47 +0000
X-Inumbo-ID: 97e7d0c8-c8ce-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97e7d0c8-c8ce-11e9-951b-bc764e2007e4;
 Tue, 27 Aug 2019 13:28:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27E32B675;
 Tue, 27 Aug 2019 13:28:44 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-5-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e67b882b-64ff-9735-9006-b0c4592a3995@suse.com>
Date: Tue, 27 Aug 2019 15:28:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566324587-3442-5-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 4/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDguMjAxOSAyMDowOSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9j
LmgKPiBAQCAtMzUsNiArMzUsMTggQEAKPiAgICNkZWZpbmUgeHphbGxvY19hcnJheShfdHlwZSwg
X251bSkgXAo+ICAgICAgICgoX3R5cGUgKilfeHphbGxvY19hcnJheShzaXplb2YoX3R5cGUpLCBf
X2FsaWdub2ZfXyhfdHlwZSksIF9udW0pKQo+ICAgCj4gKy8qIFJlLWFsbG9jYXRlIHNwYWNlIGZv
ciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlwZWQgb2JqZWN0cy4gKi8K
PiArI2RlZmluZSB4cmVhbGxvY19mbGV4X3N0cnVjdChfcHRyLCBfdHlwZSwgX2ZpZWxkLCBfbGVu
KSAoeyAgICAgICAgICAgICAgICAgICBcCgpNYXkgSSBhc2sgdGhhdCB5b3UgZG9uJ3QgZXh0ZW5k
IHRoZSBiYWQgdXNlIG9mIGxlYWRpbmcgdW5kZXJzY29yZXMgaGVyZT8KCj4gKyAgICAvKiB0eXBl
IGNoZWNraW5nOiBtYWtlIHN1cmUgdGhhdCBpbmNvbWluZyBwb2ludGVyIGlzIG9mIGNvcnJlY3Qg
dHlwZSAqLyAgXAoKQ29tbWVudCBzdHlsZSAoc2hvdWxkIHN0YXJ0IHdpdGggdXBwZXIgY2FzZSBj
aGFyKQoKPiArICAgICh2b2lkKSgodHlwZW9mKF9wdHIpKSAwID09IChfdHlwZSAqKSAwKTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCgpTdHJheSBibGFua3MgYmVmb3JlIDAuIEFu
ZCB3aHkgbm90IHNpbXBseSAiKHZvaWQpKChwdHIpID09ICh0eXBlICopMCkiPwooWW91J2QgbmVl
ZCB0byBhdm9pZCB0aGUgZG91YmxlIGV2YWx1YXRpb24gb2YgcHRyLCB5ZXMuKQoKPiArICAgICgo
X3R5cGUgKilfeHJlYWxsb2MoX3B0ciwgb2Zmc2V0b2YoX3R5cGUsIF9maWVsZFtfbGVuXSksICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIF9fYWxpZ25vZl9fKF90
eXBlKSkpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAoKVW5uZWNlc3NhcnkgcGFp
ciBvZiBvdXRlcm1vc3QgcGFyZW50aGVzZXMuCgo+ICt9KQo+ICsKPiArLyogQWxsb2NhdGUgc3Bh
Y2UgZm9yIGEgc3RydWN0dXJlIHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCBvYmplY3Rz
LiAqLwo+ICsjZGVmaW5lIHhtYWxsb2NfZmxleF9zdHJ1Y3QoX3R5cGUsIF9maWVsZCwgX2xlbikg
XAo+ICsgICAgKChfdHlwZSAqKV94bWFsbG9jKG9mZnNldG9mKF90eXBlLCBfZmllbGRbX2xlbl0p
LCBfX2FsaWdub2ZfXyhfdHlwZSkpKQoKSSB0aGluayB0aGlzIHdhbnRzIHRvIGdvIGFoZWFkIG9m
IGl0cyByZS1hbGxvYyBjb3VudGVycGFydC4KCkluIGJvdGggY2FzZXMgSSdkIGFsc28gbGlrZSB0
byBzdWdnZXN0IHVzaW5nICJuciIgaW5zdGVhZCBvZiAibGVuIiwKYXMgc29tZXRoaW5nIGNhbGxl
ZCAibGVuZ3RoIiBjYW4gYmUgbWlzdGFrZW4gdG8gcmVwcmVzZW50IHRoZQpvdmVyYWxsIGxlbmd0
aCBvZiB0aGUgcmVzdWx0aW5nIG9iamVjdCwgcmF0aGVyIHRoYW4gdGhlIG51bWJlciBvZgphcnJh
eSBlbGVtZW50cy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
