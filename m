Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29211A8CE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 11:24:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iez7V-0002VU-1R; Wed, 11 Dec 2019 10:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K8rm=2B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iez7T-0002VP-12
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 10:21:23 +0000
X-Inumbo-ID: fa276986-1bff-11ea-8aeb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa276986-1bff-11ea-8aeb-12813bfff9fa;
 Wed, 11 Dec 2019 10:21:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2EAF4B2CF;
 Wed, 11 Dec 2019 10:21:21 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191210113347.3404-1-pdurrant@amazon.com>
 <20191210113347.3404-3-pdurrant@amazon.com>
 <20191211100627.GI980@Air-de-Roger>
 <86a7d140501047028c49736c43fe547c@EX13D32EUC003.ant.amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a5506f58-a469-913d-6860-1214fa346089@suse.com>
Date: Wed, 11 Dec 2019 11:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <86a7d140501047028c49736c43fe547c@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] xenbus: limit when state is forced
 to closed
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTE6MTQsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+PiBTZW50OiAxMSBEZWNlbWJlciAyMDE5IDEwOjA2Cj4+IFRvOiBEdXJyYW50LCBQYXVs
IDxwZHVycmFudEBhbWF6b24uY29tPgo+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBKdWVyZ2VuCj4+IEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Owo+PiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDIvNF0geGVuYnVzOiBsaW1pdCB3aGVuIHN0
YXRlIGlzIGZvcmNlZAo+PiB0byBjbG9zZWQKPj4KPj4gT24gVHVlLCBEZWMgMTAsIDIwMTkgYXQg
MTE6MzM6NDVBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gSWYgYSBkcml2ZXIgcHJv
YmUoKSBmYWlscyB0aGVuIGxlYXZlIHRoZSB4ZW5zdG9yZSBzdGF0ZSBhbG9uZS4gVGhlcmUgaXMK
Pj4gbm8KPj4+IHJlYXNvbiB0byBtb2RpZnkgaXQgYXMgdGhlIGZhaWx1cmUgbWF5IGJlIGR1ZSB0
byB0cmFuc2llbnQgcmVzb3VyY2UKPj4+IGFsbG9jYXRpb24gaXNzdWVzIGFuZCBoZW5jZSBhIHN1
YnNlcXVlbnQgcHJvYmUoKSBtYXkgc3VjY2VlZC4KPj4+Cj4+PiBJZiB0aGUgZHJpdmVyIHN1cHBv
cnRzIHJlLWJpbmRpbmcgdGhlbiBvbmx5IGZvcmNlIHN0YXRlIHRvIGNsb3NlZCBkdXJpbmcKPj4+
IHJlbW92ZSgpIG9ubHkgaW4gdGhlIGNhc2Ugd2hlbiB0aGUgdG9vbHN0YWNrIG1heSBuZWVkIHRv
IGNsZWFuIHVwLiBUaGlzCj4+IGNhbgo+Pj4gYmUgZGV0ZWN0ZWQgYnkgY2hlY2tpbmcgd2hldGhl
ciB0aGUgc3RhdGUgaW4geGVuc3RvcmUgaGFzIGJlZW4gc2V0IHRvCj4+PiBjbG9zaW5nIHByaW9y
IHRvIGRldmljZSByZW1vdmFsLgo+Pj4KPj4+IE5PVEU6IFJlLWJpbmQgc3VwcG9ydCBpcyBpbmRp
Y2F0ZWQgYnkgbmV3IGJvb2xlYW4gaW4gc3RydWN0Cj4+IHhlbmJ1c19kcml2ZXIsCj4+PiAgICAg
ICAgd2hpY2ggZGVmYXVsdHMgdG8gZmFsc2UuIFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGFkZCBz
dXBwb3J0IHRvCj4+PiAgICAgICAgc29tZSBiYWNrZW5kIGRyaXZlcnMuCj4+Cj4+IE15IGludGVu
dGlvbiB3YXMgdG8gc3BlY2lmeSB3aGV0aGVyIHlvdSB3YW50IHRvIGNsb3NlIHRoZQo+PiBiYWNr
ZW5kcyBvbiB1bmJpbmQgaW4gc3lzZnMsIHNvIHRoYXQgYW4gdXNlciBjYW4gZGVjaWRlIGF0IHJ1
bnRpbWUsCj4+IHJhdGhlciB0aGFuIGhhdmluZyBhIGhhcmRjb2RlZCB2YWx1ZSBpbiB0aGUgZHJp
dmVyLgo+Pgo+PiBBbnl3YXksIEknbSBsZXNzIHN1cmUgd2hldGhlciBzdWNoIHJ1bnRpbWUgdHVu
YWJsZSBpcyB1c2VmdWwgYXQgYWxsLAo+PiBzbyBsZXQncyBsZWF2ZSBpdCBvdXQgYW5kIGNhbiBh
bHdheXMgYmUgYWRkZWQgYWZ0ZXJ3YXJkcy4gQXQgdGhlIGVuZAo+PiBvZiBkYXkgYSB1c2VyIHdy
b25nbHkgZG9pbmcgYSBybW1vZCBibGtiYWNrIGNhbiBhbHdheXMgcmVjb3Zlcgo+PiBncmFjZWZ1
bGx5IGJ5IGxvYWRpbmcgYmxrYmFjayBhZ2FpbiB3aXRoIHlvdXIgcHJvcG9zZWQgYXBwcm9hY2gg
dG8KPj4gbGVhdmUgY29ubmVjdGlvbnMgb3BlbiBvbiBtb2R1bGUgcmVtb3ZhbC4KPj4KPj4gU29y
cnkgZm9yIHRoZSBleHRyYSB3b3JrLgo+Pgo+IAo+IERvZXMgdGhpcyBtZWFuIHlvdSBkb24ndCB0
aGluayB0aGUgZXh0cmEgZHJpdmVyIGZsYWcgaXMgbmVjZXNzYXJ5IGFueSBtb3JlPyBOQjogbm93
IHRoYXQgeGVuYnVzIGFjdHVhbGx5IHRha2VzIG1vZHVsZSByZWZlcmVuY2VzIHlvdSBjYW4ndCBh
Y2NpZGVudGFsbHkgcm1tb2QgYW55IG1vcmUgOi0pCgpJJ2QgbGlrZSBpdCB0byBiZSBrZXB0LCBw
bGVhc2UuCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
