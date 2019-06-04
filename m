Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F8347AB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 15:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY98f-00053V-I6; Tue, 04 Jun 2019 13:06:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY98e-00053P-NQ
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 13:06:04 +0000
X-Inumbo-ID: 81be7e38-86c9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 81be7e38-86c9-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 13:06:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 508A2A78;
 Tue,  4 Jun 2019 06:06:03 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05AA43F690;
 Tue,  4 Jun 2019 06:06:00 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667500200007800235116@prv1-mh.provo.novell.com>
 <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
 <5CF66C2E0200007800235190@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <54648a1c-5f8a-478e-59eb-6d5343eab8e0@arm.com>
Date: Tue, 4 Jun 2019 14:05:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF66C2E0200007800235190@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] PCI: move pdev_list field to common
 structure
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@cirix.com>,
 Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNi80LzE5IDI6MDMgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0
LjA2LjE5IGF0IDE0OjU1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiA2LzQv
MTkgMTo0MiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
cGNpLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+Pj4gQEAgLTEyMSw3ICsxMjEs
OSBAQCBzdHJ1Y3QgcGNpX2RldiB7Cj4+PiAgICB9Owo+Pj4gICAgCj4+PiAgICAjZGVmaW5lIGZv
cl9lYWNoX3BkZXYoZG9tYWluLCBwZGV2KSBcCj4+PiAtICAgIGxpc3RfZm9yX2VhY2hfZW50cnko
cGRldiwgJihkb21haW4tPmFyY2gucGRldl9saXN0KSwgZG9tYWluX2xpc3QpCj4+PiArICAgIGxp
c3RfZm9yX2VhY2hfZW50cnkocGRldiwgJihkb21haW4pLT5wZGV2X2xpc3QsIGRvbWFpbl9saXN0
KQo+Pj4gKwo+Pj4gKyNkZWZpbmUgaGFzX2FyY2hfcGRldnMoZCkgKCFsaXN0X2VtcHR5KCYoZCkt
PnBkZXZfbGlzdCkpCj4+Cj4+IFRoaXMgZmVlbHMgYSBiaXQgc3RyYW5nZSB0byBrZWVwICJhcmNo
IiBpbiB0aGUgbWFjcm8gbmFtZSB3aGVuIHRoZSBjb2RlCj4+IGlzIG5vdyBnZW5lcmljLiBIb3cg
YWJvdXQgImRvbWFpbl9oYXNfcGRldnMiPwo+IAo+IEluZGVlZCBJIGRpZCBub3RpY2UgdGhpcyBv
ZGRpdHkgdG9vLCBidXQgaWYgc3VjaCBhbiBhZGp1c3RtZW50IGlzCj4gdG8gYmUgbWFkZSB0aGVu
IGltbyBub3QgaW4gdGhpcyBwYXRjaC4gQWZ0ZXIgYWxsIGluIHR1cm4gSSdkIG5lZWQKPiB0byBj
aGFuZ2UgYWxsIHVzZSBzaXRlcy4KCkl0IGZlZWxzIHRvIG1lIHRoZXkgYXJlIGtpbmQgb2YgdGll
ZCB0b2dldGhlciBiZWNhdXNlIGhhc19hcmNoX3BkZXZzIGlzIAphbiBhY2Nlc3NvciBvZiB0aGUg
ZmllbGQuCgpCdXQgSSBhbSBoYXBweSB0byBzZWUgdGhpcyBpbiBhIHNlcGFyYXRlIHBhdGNoZXMu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
