Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72CC0520
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpLi-000689-Kx; Fri, 27 Sep 2019 12:27:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDpLh-000681-CC
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:27:49 +0000
X-Inumbo-ID: 370ac438-e122-11e9-9677-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 370ac438-e122-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:27:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5074FAE8A;
 Fri, 27 Sep 2019 12:27:47 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <c446916b9572a6425a994e9f8c6c995b8b38c518.1569470669.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46f2394b-120a-8fe8-eda1-2f4c8fcbadb8@suse.com>
Date: Fri, 27 Sep 2019 14:27:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c446916b9572a6425a994e9f8c6c995b8b38c518.1569470669.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7.1 4/4] xen/x86: Allow stubdom access to
 irq created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAwNjowNSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBTdHViZG9tYWlucyBuZWVkIHRvIGJlIGdpdmVuIHN1ZmZpY2llbnQgcHJpdmlsZWdlIG92ZXIg
dGhlIGd1ZXN0IHdoaWNoIGl0Cj4gcHJvdmlkZXMgZW11bGF0aW9uIGZvciBpbiBvcmRlciBmb3Ig
UENJIHBhc3N0aHJvdWdoIHRvIHdvcmsgY29ycmVjdGx5Lgo+IFdoZW4gYSBIVk0gZG9tYWluIHRy
eSB0byBlbmFibGUgTVNJLCBRRU1VIGluIHN0dWJkb21haW4gY2FsbHMKPiBQSFlTREVWT1BfbWFw
X3BpcnEsIGJ1dCBsYXRlciBpdCBuZWVkcyB0byBjYWxsIFhFTl9ET01DVExfYmluZF9wdF9pcnEg
YXMKPiBwYXJ0IG9mIHhjX2RvbWFpbl91cGRhdGVfbXNpX2lycS4gR2l2ZSB0aGUgc3R1YmRvbWFp
biBlbm91Z2ggcGVybWlzc2lvbnMKPiBvdmVyIHRoZSBtYXBwZWQgaW50ZXJydXB0IGluIG9yZGVy
IHRvIGJpbmQgaXQgc3VjY2Vzc2Z1bGx5IHRvIGl0J3MKPiB0YXJnZXQgZG9tYWluLgo+IAo+IFRo
aXMgaXMgbm90IG5lZWRlZCBmb3IgUENJIElOVHgsIGJlY2F1c2UgSVJRIGluIHRoYXQgY2FzZSBp
cyBrbm93bgo+IGJlZm9yZWhhbmQgYW5kIHRoZSBzdHViZG9tYWluIGlzIGdpdmVuIHBlcm1pc3Np
b25zIG92ZXIgdGhpcyBJUlEgYnkKPiBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQgKHRoZXJlJ3MgYSBk
b19wY2lfYWRkIGFnYWluc3QgdGhlIHN0dWJkb21haW4pLgo+IAo+IGNyZWF0ZV9pcnEoKSBhbHJl
YWR5IGdyYW50IElSUSBhY2Nlc3MgdG8gaGFyZHdhcmVfZG9tYWluLCB3aXRoCj4gYXNzdW1wdGlv
biB0aGUgZGV2aWNlIG1vZGVsIGxpdmVzIHRoZXJlLgo+IE1vZGlmeSBjcmVhdGVfaXJxKCkgdG8g
dGFrZSBhZGRpdGlvbmFsIHBhcmFtZXRlciwgd2hldGhlciB0byBncmFudAo+IHBlcm1pc3Npb25z
IHRvIHRoZSBkb21haW4gY3JlYXRpbmcgdGhlIElSUSwgd2hpY2ggbWF5IGJlIGRvbTAgb3IgYQo+
IHN0dWJkb21haW4uIERvIHRoaXMgaW5zdGVhZCBvZiBncmFudGluZyBhY2Nlc3MgYWx3YXlzIHRv
Cj4gaGFyZHdhcmVfZG9tYWluLiBTYXZlIElEIG9mIHRoZSBkb21haW4gZ2l2ZW4gcGVybWlzc2lv
biwgdG8gcmV2b2tlIGl0IGluCj4gZGVzdHJveV9pcnEoKSAtIGVhc2llciBhbmQgY2xlYW5lciB0
aGFuIHJlcGxheWluZyBsb2dpYyBvZiBjcmVhdGVfaXJxKCkKPiBwYXJhbWV0ZXIuIFVzZSBkb21p
ZCBpbnN0ZWFkIG9mIGFjdHVhbCByZWZlcmVuY2UgdG8gdGhlIGRvbWFpbiwKPiBiZWNhdXNlIGl0
IG1pZ2h0IGdldCBkZXN0cm95ZWQgYmVmb3JlIGRlc3Ryb3lpbmcgSVJRIChzdHViZG9tYWluIGlz
Cj4gZGVzdHJveWVkIGJlZm9yZSBpdHMgdGFyZ2V0IGRvbWFpbikuIEFuZCBpdCBpcyBub3QgYW4g
aXNzdWUsCj4gYmVjYXVzZSBJUlEgcGVybWlzc2lvbnMgbGl2ZSB3aXRoaW4gZG9tYWluIHN0cnVj
dHVyZSwgc28gZGVzdHJveWluZwo+IGEgZG9tYWluIGFsc28gaW1wbGljaXRseSByZXZva2UgdGhl
IHBlcm1pc3Npb24uICBQb3RlbnRpYWwgZG9taWQKPiByZXVzZSBpcyBkZXRlY3RlZCBieSBjaGVj
a2luZyBpZiB0aGF0IGRvbWFpbiBkb2VzIGhhdmUgcGVybWlzc2lvbgo+IG92ZXIgdGhlIElSUSBi
ZWluZyBkZXN0cm95ZWQuCj4gCj4gVGhlbiwgYWRqdXN0IGFsbCBjYWxsZXJzIHRvIHByb3ZpZGUg
dGhlIHBhcmFtZXRlci4gSW4gY2FzZSBvZiBYZW4KPiBpbnRlcm5hbCBhbGxvY2F0aW9ucywgc2V0
IGl0IHRvIGZhbHNlLCBidXQgZm9yIGRvbWFpbiBhY2Nlc3NpYmxlCj4gaW50ZXJydXB0IHNldCBp
dCB0byB0cnVlLgo+IAo+IEluc3BpcmVkIGJ5IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuWFQveGVu
Y2xpZW50LW9lL2Jsb2IvNWUwZTczMDRhNWEzYzc1ZWYwMTI0MGExZTM2NzM2NjViMmFhZjA1ZS9y
ZWNpcGVzLWV4dGVuZGVkL3hlbi9maWxlcy9zdHViZG9tYWluLW1zaS1pcnEtYWNjZXNzLnBhdGNo
IGJ5IEVyaWMgQ2hhbnVkZXQgPGNoYW51ZGV0ZUBhaW5mb3NlYy5jb20+Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFNpbW9uIEdhaXNlciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJs
ZXRoaW5nc2xhYi5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
d2l0aCBhIGNvdXBsZSBvZiBjb3NtZXRpYyB0aGluZ3MgYWRkcmVzc2VkLCB3aGljaCBJJ2xsIGRv
IHdoaWxlCmNvbW1pdHRpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
