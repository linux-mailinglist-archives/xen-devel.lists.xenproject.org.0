Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D416B50E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 05:38:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnaic-00082V-5r; Wed, 17 Jul 2019 03:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zX8a=VO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnaia-00082Q-K1
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 03:35:00 +0000
X-Inumbo-ID: d8316f78-a843-11e9-9b43-d37470024461
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8316f78-a843-11e9-9b43-d37470024461;
 Wed, 17 Jul 2019 03:34:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D95B7AC66;
 Wed, 17 Jul 2019 03:34:54 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562846532-32152-5-git-send-email-zhenzhong.duan@oracle.com>
 <2433589d-a2d2-6b51-cfbd-c1141014ab93@suse.com>
 <67261f6e-5dce-2452-a6d6-aa6ca73dfeec@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <06b1e979-3ac6-1f3c-616f-5756ac16519b@suse.com>
Date: Wed, 17 Jul 2019 05:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <67261f6e-5dce-2452-a6d6-aa6ca73dfeec@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v7 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMTkgMDQ6MDksIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IAo+IE9uIDIwMTkvNy8x
NiAxODo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTEuMDcuMTkgMTQ6MDIsIFpoZW56
aG9uZyBEdWFuIHdyb3RlOgo+Pj4gLi4gYXMgIm5vcHYiIHN1cHBvcnQgbmVlZHMgaXQgdG8gYmUg
Y2hhbmdlYWJsZSBhdCBib290IHVwIHN0YWdlLgo+Pj4KPj4+IENoZWNrcGF0Y2ggcmVwb3J0IHdh
cm5pbmcsIHNvIG1vdmUgdmFyaWFibGUgZGVjbGFyYXRpb25zIGZyb20KPj4+IGh5cGVydmlzb3Iu
YyB0byBoeXBlcnZpc29yLmgKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8
emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KPj4+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPgo+Pj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Cj4+PiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4+PiBDYzogSW5n
byBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4+PiBDYzogQm9yaXNsYXYgUGV0a292IDxicEBh
bGllbjguZGU+Cj4+PiAtLS0KPj4+IMKgIGFyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3Iu
aCB8IDggKysrKysrKysKPj4+IMKgIGFyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jwqAg
fCA4IC0tLS0tLS0tCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vaHlw
ZXJ2aXNvci5oIAo+Pj4gYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmgKPj4+IGlu
ZGV4IGY3YjRjNTMuLmU0MWNiZjIgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9oeXBlcnZpc29yLmgKPj4+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3Iu
aAo+Pj4gQEAgLTU4LDYgKzU4LDE0IEBAIHN0cnVjdCBoeXBlcnZpc29yX3g4NiB7Cj4+PiDCoMKg
wqDCoMKgIGJvb2wgaWdub3JlX25vcHY7Cj4+PiDCoCB9Owo+Pj4gwqAgK2V4dGVybiBjb25zdCBz
dHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3Ztd2FyZTsKPj4+ICtleHRlcm4gY29uc3Qg
c3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl9tc19oeXBlcnY7Cj4+PiArZXh0ZXJuIGNv
bnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVuX3B2Owo+Pj4gK2V4dGVybiBj
b25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX2t2bTsKPj4+ICtleHRlcm4gY29u
c3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl9qYWlsaG91c2U7Cj4+PiArZXh0ZXJu
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfYWNybjsKPj4+ICtleHRlcm4g
c3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtOwo+Pgo+PiBUaGlzIHNob3Vs
ZCBlaXRoZXIgc3RheSBjb25zdCBhbmQgYmUgY2hhbmdlZCBpbiBwYXRjaCA1LCBvciB5b3UKPj4g
c2hvdWxkIGFkYXB0IGl0cyBkZWZpbml0aW9uIGluIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZt
LmMgaW4KPj4gdGhpcyBwYXRjaC4KPiAKPiBPaywgdGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24u
Cj4gCj4gSSdsbCBjaG9vc2UgMm5kIG9waW5pb24gYXMgSSBkb24ndCBuZWVkIHRvIGNoYW5nZSBk
ZXNjcmlwdG9uIHdpdGggdGhhdC4KCkp1c3QgcmVzZW5kIHRoZSBsYXN0IHR3byBtb2RpZmllZCBw
YXRjaGVzIHRoZW4sIHBsZWFzZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
