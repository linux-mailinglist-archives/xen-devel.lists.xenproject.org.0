Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC1B7734
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 12:14:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAtPy-0001Ak-E0; Thu, 19 Sep 2019 10:12:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAtPx-0001AY-6J
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 10:12:05 +0000
X-Inumbo-ID: ec833100-dac5-11e9-b76c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ec833100-dac5-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 10:12:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19C74337;
 Thu, 19 Sep 2019 03:12:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CD923F67D;
 Thu, 19 Sep 2019 03:12:01 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
 <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
 <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
 <f8ab5e72-2475-3884-c23f-84d07eba11ba@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f243004b-9069-566c-1e8c-ba49e401c98d@arm.com>
Date: Thu, 19 Sep 2019 11:12:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f8ab5e72-2475-3884-c23f-84d07eba11ba@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNy8wOS8yMDE5IDE5OjE4LCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gT24gMTcuMDku
MTkgMDk6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IAo+IEhpLCBKYW4KPiAKPj4gT24gMTYuMDku
MjAxOSAyMDowOCwgT2xla3NhbmRyIHdyb3RlOgo+Pj4gT24gMTYuMDkuMTkgMTM6NDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+PiArLyogcGVyLWRldmljZSBJT01NVSBpbnN0YW5jZSBkYXRhICov
Cj4+Pj4+ICtzdHJ1Y3QgaW9tbXVfZndzcGVjIHsKPj4+Pj4gK8KgwqDCoCAvKiB0aGlzIGRldmlj
ZSdzIElPTU1VICovCj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqaW9tbXVfZGV2Owo+Pj4+
PiArwqDCoMKgIC8qIElPTU1VIGRyaXZlciBwcml2YXRlIGRhdGEgZm9yIHRoaXMgZGV2aWNlICov
Cj4+Pj4+ICvCoMKgwqAgdm9pZCAqaW9tbXVfcHJpdjsKPj4+Pj4gK8KgwqDCoCAvKiBudW1iZXIg
b2YgYXNzb2NpYXRlZCBkZXZpY2UgSURzICovCj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IG51
bV9pZHM7Cj4+Pj4+ICvCoMKgwqAgLyogSURzIHdoaWNoIHRoaXMgZGV2aWNlIG1heSBwcmVzZW50
IHRvIHRoZSBJT01NVSAqLwo+Pj4+PiArwqDCoMKgIHVpbnQzMl90IGlkc1sxXTsKPj4+Pj4gK307
Cj4+Pj4gTm90ZSB0aGF0IHlvdSBhYnVzZSB4cmVhbGxvY19mbGV4X3N0cnVjdCgpIHdoZW4gdXNp
bmcgaXQgd2l0aCBzdWNoCj4+Pj4gYSB0eXBlOiBUaGUgbGFzdCBmaWVsZCBpcyBfbm90XyBhIGZs
ZXhpYmxlIGFycmF5IG1lbWJlci4gQ29tcGlsZXJzCj4+Pj4gbWlnaHQgbGVnaXRpbWF0ZWx5IHdh
cm4gaWYgdGhleSBjYW4gcHJvdmUgdGhhdCB5b3UgYWNjZXNzCj4+Pj4gcC0+aWRzWzFdIGFueXdo
ZXJlLCBkZXNwaXRlIHlvdSAocHJlc3VtYWJseSkgaGF2aW5nIGFsbG9jYXRlZCBlbm91Z2gKPj4+
PiBzcGFjZS4gKEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gdGhpbmsgb2YgYSB3YXkgZm9yIHRoZSBt
YWNybyB0bwo+Pj4+IGFjdHVhbGx5IGRldGVjdCBhbmQgaGVuY2UgcmVmdXNlIHN1Y2ggd3Jvbmcg
dXNlcy4pCj4+PiBJbmRlZWQsIHlvdSBhcmUgcmlnaHQuIEkgYW0gaW4gZG91YnQsIHdoZXRoZXIg
dG8gcmV0YWluIHBvcnRlZCBmcm9tCj4+PiBMaW51eCBjb2RlIChpZHNbMV0pCj4+Pgo+Pj4gYW5k
IG1lbnRpb24gYWJvdXQgc3VjaCBhYnVzZSBvciBjaGFuZ2UgaXQgdG8gZGVhbCB3aXRoIHJlYWwg
ZmxleGlibGUKPj4+IGFycmF5IG1lbWJlciAoaWRzW10pLiBBbnkgdGhvdWdodHM/Cj4+IEknbSBv
ZiB0aGUgc3Ryb25nIG9waW5pb24gdGhhdCB5b3Ugc2hvdWxkIHN3aXRjaCB0byBbXSAob3IgYXQK
Pj4gbGVhc3QgWzBdKSBub3RhdGlvbi4KPiAKPiBJIGdvdCBpdC4gV2VsbCwgd2lsbCBzd2l0Y2gg
dG8gaWRzW10gaWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMuCgpJIHN1c3BlY3QgdGhlIHJhdGlv
bmFsZSB0byB1c2UgMSByYXRoZXIgdGhhbiAwIGlzIHRvIGF2b2lkIHRoZSByZS1hbGxvY2F0aW9u
IGluIAp0aGUgY29tbW9uIGNhc2Ugd2hlcmUgYSBkZXZpY2UgaGFzIGEgc2luZ2xlIElELgoKSSB3
b3VsZCBsaWtlIHRvIHJldGFpbiB0aGUgc2ltaWxhciBiZWhhdmlvci4gVGhlIGlkc1sxXSBpcyBw
cm9iYWJseSB0aGUgbW9zdCAKcHJldHR5IHdheSB0byBkbyBpdC4KCkFub3RoZXIgc29sdXRpb24g
d291bGQgdG8gdXNlIHhtYWxsb2NfYnl0ZXMoKSBmb3IgdGhlIGluaXRpYWwgYWxsb2NhdGlvbiBv
ZiAKeG1hbGxvY19ieXRlcygpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
