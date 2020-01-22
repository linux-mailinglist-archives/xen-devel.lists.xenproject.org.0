Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C312145910
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:53:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuIHM-0007UU-L9; Wed, 22 Jan 2020 15:50:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuIHL-0007UP-8H
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:50:51 +0000
X-Inumbo-ID: f68d5e8e-3d2e-11ea-bc8d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f68d5e8e-3d2e-11ea-bc8d-12813bfff9fa;
 Wed, 22 Jan 2020 15:50:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1040AC23;
 Wed, 22 Jan 2020 15:50:49 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <018a1293-ad4f-44e3-ab73-90491077e434@suse.com>
Date: Wed, 22 Jan 2020 16:50:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200121120009.1767-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86 / hvm: add
 domain_relinquish_resources() method
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxMzowMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZXJlIGFyZSB0d28g
ZnVuY3Rpb25zIGluIGh2bS5jIHRvIGRlYWwgd2l0aCB0ZWFyLWRvd24gYW5kIGEgZG9tYWluOgo+
IGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBhbmQgaHZtX2RvbWFpbl9kZXN0cm95
KCkuIEhvd2V2ZXIsIG9ubHkKPiB0aGUgbGF0dGVyIGhhcyBhbiBhc3NvY2lhdGVkIG1ldGhvZCBp
biAnaHZtX2Z1bmNzJy4gVGhpcyBwYXRjaCBhZGRzCj4gYSBtZXRob2QgZm9yIHRoZSBmb3JtZXIg
YW5kIHN0dWIgZGVmaW5pdGlvbnMgZm9yIFNWTSBhbmQgVk1YLgoKV2h5IHRoZSBzdHVicz8gU2lt
cGx5IC4uLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS9odm0uYwo+IEBAIC03MTUsNiArNzE1LDggQEAgaW50IGh2bV9kb21haW5faW5pdGlh
bGlzZShzdHJ1Y3QgZG9tYWluICpkKQo+ICAKPiAgdm9pZCBodm1fZG9tYWluX3JlbGlucXVpc2hf
cmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpCj4gIHsKPiArICAgIGh2bV9mdW5jcy5kb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoZCk7CgouLi4gc3RpY2sgYSBOVUxMIGNoZWNrIGFyb3VuZCB0
aGlzIG9uZS4gSSBhbHNvIHdvbmRlciB3aGV0aGVyLCBpdApiZWluZyBlbnRpcmVseSBuZXcsIHRo
aXMgd291bGRuJ3QgYmV0dGVyIHVzZSBhbHRlcm5hdGl2ZSBjYWxsCnBhdGNoaW5nIHJpZ2h0IGZy
b20gdGhlIGJlZ2lubmluZy4gSXQncyBub3QgdGhlIGhvdHRlc3QgcGF0aCwgYnV0CmF2b2lkaW5n
IGluZGlyZWN0IGNhbGxzIHNlZW1zIHF1aXRlIGRlc2lyYWJsZSwgZXNwZWNpYWxseSB3aGVuCmRv
aW5nIHNvIGlzIHJlbGF0aXZlbHkgY2hlYXAuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
