Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E681BC664
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:13:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCii6-0004Yx-3I; Tue, 24 Sep 2019 11:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCii4-0004YJ-FU
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:10:20 +0000
X-Inumbo-ID: 85e401ce-deab-11e9-ae5c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 85e401ce-deab-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 09:13:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9AC50B6A8;
 Tue, 24 Sep 2019 09:13:07 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <6de11867-b872-a2a1-7c26-af004164bfea@suse.com>
 <6b8b0d5e09c24b068ede852c4eab50dc@AMSPEX02CL03.citrite.net>
 <6d5b8ac4-6787-0f01-fa6a-8301cbb9d5e3@suse.com>
 <10bdff68f43d48829437404735bb383e@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1417398a-db8a-0e14-011b-78acd32e093f@suse.com>
Date: Tue, 24 Sep 2019 11:13:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <10bdff68f43d48829437404735bb383e@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxMTowOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNlbnQ6IDI0IFNlcHRlbWJlciAyMDE5IDEwOjAy
Cj4+Cj4+IE9uIDIzLjA5LjIwMTkgMTg6MjUsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+PiBGcm9t
OiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBC
ZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4+PiBTZW50OiAxOSBTZXB0ZW1iZXIgMjAxOSAxNDoyNAo+
Pj4+Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hbWQtaW9tbXUuaAo+Pj4+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvYW1kLWlvbW11LmgKPj4+PiBAQCAtMTA2LDEyICsxMDYsMTYg
QEAgc3RydWN0IGFtZF9pb21tdSB7Cj4+Pj4gIH07Cj4+Pj4KPj4+PiAgc3RydWN0IGl2cnNfbWFw
cGluZ3Mgewo+Pj4+IC0gICAgdTE2IGR0ZV9yZXF1ZXN0b3JfaWQ7Cj4+Pj4gLSAgICB1OCBkdGVf
YWxsb3dfZXhjbHVzaW9uOwo+Pj4+IC0gICAgdTggdW5pdHlfbWFwX2VuYWJsZTsKPj4+PiAtICAg
IHU4IHdyaXRlX3Blcm1pc3Npb247Cj4+Pj4gLSAgICB1OCByZWFkX3Blcm1pc3Npb247Cj4+Pj4g
KyAgICB1aW50MTZfdCBkdGVfcmVxdWVzdG9yX2lkOwo+Pj4+ICAgICAgYm9vbCB2YWxpZDsKPj4+
PiArICAgIGJvb2wgZHRlX2FsbG93X2V4Y2x1c2lvbjsKPj4+PiArICAgIGJvb2wgdW5pdHlfbWFw
X2VuYWJsZTsKPj4+PiArICAgIGJvb2wgd3JpdGVfcGVybWlzc2lvbjsKPj4+PiArICAgIGJvb2wg
cmVhZF9wZXJtaXNzaW9uOwo+Pj4KPj4+IENvdWxkIHlvdSBzaHJpbmsgdGhpcyBldmVuIG1vcmUg
YnkgdXNpbmcgYSBiaXQtZmllbGQgaW5zdGVhZCBvZiB0aGlzIHNlcXVlbmNlIG9mIGJvb2xzPwo+
Pgo+PiBJbmRlZWQgSSBoYWQgYmVlbiBjb25zaWRlcmluZyB0aGlzLiBCZXNpZGVzIHRoZSBmYWN0
IHRoYXQgbWFraW5nCj4+IHN1Y2ggYSBtb3ZlIHNpbXBseSBkaWRuJ3QgbG9vayB0byBmaXQgb3Ro
ZXIgdGhpbmdzIGhlcmUgdmVyeSB3ZWxsCj4+IHdoZW4gaW50cm9kdWNpbmcgdGhlICJ2YWxpZCIg
ZmxhZyBpbiBhbiBlYXJsaWVyIHBhdGgsIGFuZCB0aGVuCj4+IGFsc28gbm90IGhlcmUsIGRvIHlv
dSByZWFsaXplIHRob3VnaCB0aGF0IHRoaXMgd291bGRuJ3Qgc2hyaW5rCj4+IHRoZSBzdHJ1Y3R1
cmUncyBzaXplIHJpZ2h0IG5vdyAoaS5lLiBpdCB3b3VsZCBvbmx5IGJlIHBvdGVudGlhbGx5Cj4+
IHJlZHVjaW5nIGZ1dHVyZSBncm93dGgpPwo+IAo+IFllcywgSSdkIGZhaWxlZCB0byBub3RlIHRo
ZSAndW5zaWduZWQgbG9uZycgYWZ0ZXJ3YXJkcywgYnV0Li4uCj4gCj4+IFRoaXMgd2FzIG15IG1h
aW4gYXJndW1lbnQgYWdhaW5zdCBnb2luZwo+PiB0aGlzIGZ1cnRoZXIgc3RlcDsgbGV0IG1lIGtu
b3cgd2hhdCB5b3UgdGhpbmsuCj4+Cj4gCj4gSSBzdGlsbCB0aGluayBhIHByZS1lbXB0aXZlIHNx
dWFzaCBpbnRvIGEgdWludDhfdCBiaXQtZmllbGQgZm9sbG93ZWQKPiBieSB0aGUgZGV2aWNlX2Zs
YWdzIGZpZWxkIHdvdWxkIGdpdmUgdGhlIHN0cnVjdCBhIG5pY2UgMzItYml0IGhvbGUKPiBmb3Ig
cG90ZW50aWFsIGZ1dHVyZSB1c2UuCgpPa2F5LCB3aWxsIGRvIHRoZW4uIEkgdGFrZSBpdCB5b3Vy
IFItYiBjYW4gcmVtYWluIGluIHBsYWNlIHdpdGggdGhpcwpleHRyYSBjaGFuZ2UuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
