Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73885963
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 06:37:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hva9Q-0006yw-3h; Thu, 08 Aug 2019 04:35:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hva9O-0006yp-MK
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 04:35:42 +0000
X-Inumbo-ID: f956f1ec-b995-11e9-abdc-1bbc446273b3
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f956f1ec-b995-11e9-abdc-1bbc446273b3;
 Thu, 08 Aug 2019 04:35:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54FC8ABD4;
 Thu,  8 Aug 2019 04:35:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-3-jgross@suse.com>
 <eb3fc6dc-b048-0060-9558-3adea4c61990@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <add42639-4063-a785-01ad-6d20cae85d50@suse.com>
Date: Thu, 8 Aug 2019 06:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eb3fc6dc-b048-0060-9558-3adea4c61990@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/4] xen: add new CONFIG_SPINLOCK_DEBUG
 option
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMTkgMTk6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDcvMDgvMjAxOSAx
NTozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW5zdGVhZCBvZiBlbmFibGluZyBzcGlubG9j
ayBkZWJ1Z2dpbmcgZm9yIGRlYnVnIGJ1aWxkcyBvbmx5IGFkZCBhCj4+IGRlZGljYXRlZCBLY29u
ZmlnIG9wdGlvbiBmb3IgdGhhdCBwdXJwb3NlIHdoaWNoIGRlZmF1bHRzIHRvIERFQlVHLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+
PiAgIHhlbi9LY29uZmlnLmRlYnVnICAgICAgICAgIHwgNyArKysrKysrCj4+ICAgeGVuL2NvbW1v
bi9zcGlubG9jay5jICAgICAgfCA0ICsrLS0KPj4gICB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2su
aCB8IDIgKy0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vS2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmln
LmRlYnVnCj4+IGluZGV4IGUxMGUzMTRlMjUuLjVkYjNlN2VjMjUgMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9LY29uZmlnLmRlYnVnCj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnCj4+IEBAIC00NCw2ICs0
NCwxMyBAQCBjb25maWcgQ09WRVJBR0UKPj4gICAKPj4gICAJICBJZiB1bnN1cmUsIHNheSBOIGhl
cmUuCj4+ICAgCj4+ICtjb25maWcgU1BJTkxPQ0tfREVCVUcKPj4gKwlib29sICJTcGlubG9jayBk
ZWJ1Z2dpbmciCj4+ICsJZGVmYXVsdCBERUJVRwo+PiArCS0tLWhlbHAtLS0KPj4gKwkgIEVuYWJs
ZSBkZWJ1Z2dpbmcgZmVhdHVyZXMgb2Ygc3BpbmxvY2sgaGFuZGxpbmcuICBTb21lIGFkZGl0aW9u
YWwKPj4gKyAgICAgICAgICBjaGVja3Mgd2lsbCBiZSBwZXJmb3JtZWQgd2hlbiBhY3F1aXJpbmcg
YW5kIHJlbGVhc2luZyBsb2Nrcy4KPiAKPiBNaXNzaW5nIHRhYiBvbiB0aGUgZmluYWwgbGluZS4g
IENhbiBiZSBmaXhlZCBvbiBjb21taXQpLgoKT2gsIHNvcnJ5LiBXaWxsIGZpeCBpbiBWMi4KCj4g
Cj4gT3RoZXJ3aXNlLCBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPiAKClRoYW5rcywKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
