Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232C1280E5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 17:49:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiLPr-00044u-HR; Fri, 20 Dec 2019 16:46:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiLPp-00044p-CF
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 16:46:13 +0000
X-Inumbo-ID: 3aea1bf4-2348-11ea-939a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aea1bf4-2348-11ea-939a-12813bfff9fa;
 Fri, 20 Dec 2019 16:46:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD8FDB00A;
 Fri, 20 Dec 2019 16:46:11 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
Date: Fri, 20 Dec 2019 17:46:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAyMDo0MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEN1cnJlbnRseSB0
aGUgaHZtIHBhcmFtZXRlcnMgYXJlIG9ubHkgYWNjZXNzaWJsZSB2aWEgdGhlIEhWTU9QIGh5cGVy
Y2FsbHMuIEJ5Cj4gZXhwb3NpbmcgaHZtX3tnZXQvc2V0fV9wYXJhbSBpdCB3aWxsIGJlIHBvc3Np
YmxlIGZvciBWTSBmb3JraW5nIHRvIGNvcHkgdGhlCj4gcGFyYW1ldGVycyBkaXJlY3RseSBpbnRv
IHRoZSBjbG9uZSBkb21haW4uCgpIYXZpbmcgcGVla2VkIGFoZWFkIGF0IHBhdGNoIDE3LCB3aGVy
ZSB0aGlzIGdldHMgdXNlZCwgSSB3b25kZXIgd2h5CnlvdSB3YW50IGEgcGFpciBvZiBvbmUtYnkt
b25lIGZ1bmN0aW9ucywgcmF0aGVyIHRoYW4gYSBjb3B5LWFsbCBvbmUuClRoaXMgdGhlbiB3b3Vs
ZG4ndCByZXF1aXJlIGV4cG9zdXJlIG9mIHRoZSBmdW5jdGlvbnMgeW91IHRvdWNoIGhlcmUuCgo+
IEBAIC00NDI5LDQyICs0NDQ2LDYwIEBAIHN0YXRpYyBpbnQgaHZtb3BfZ2V0X3BhcmFtKAo+ICAg
ICAgaWYgKCAhaXNfaHZtX2RvbWFpbihkKSApCj4gICAgICAgICAgZ290byBvdXQ7Cj4gIAo+IC0g
ICAgcmMgPSBodm1fYWxsb3dfZ2V0X3BhcmFtKGQsICZhKTsKPiArICAgIHJjID0gaHZtX2dldF9w
YXJhbShkLCBhLmluZGV4LCAmYS52YWx1ZSk7Cj4gICAgICBpZiAoIHJjICkKPiAgICAgICAgICBn
b3RvIG91dDsKPiAgCj4gLSAgICBzd2l0Y2ggKCBhLmluZGV4ICkKPiArICAgIHJjID0gX19jb3B5
X3RvX2d1ZXN0KGFyZywgJmEsIDEpID8gLUVGQVVMVCA6IDA7Cj4gKwo+ICsgICAgSFZNX0RCR19M
T0coREJHX0xFVkVMX0hDQUxMLCAiZ2V0IHBhcmFtICV1ID0gJSJQUkl4NjQsCj4gKyAgICAgICAg
ICAgICAgICBhLmluZGV4LCBhLnZhbHVlKTsKPiArCj4gKyBvdXQ6Cj4gKyAgICByY3VfdW5sb2Nr
X2RvbWFpbihkKTsKPiArICAgIHJldHVybiByYzsKPiArfQo+ICsKPiAraW50IGh2bV9nZXRfcGFy
YW0oCj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkLAoKSWYgdGhpcyBpcyB0byBiZSBub24tc3RhdGlj
LCBJIHRoaW5rIGl0IHdvdWxkIGJlIHF1aXRlIG5pY2UgaWYKdGhpcyBwYXJhbWV0ZXIgd2FzIGNv
bnN0LiBUaGlzIHdpbGwgdGFrZSBhIHByZXJlcSBwYXRjaCB0bwpjb25zdGlmeSB0aGUgWFNNIHBh
dGggaW52b2x2ZWQsIGJ1dCBvdGhlciB0aGFuIHRoaXMgSSBjYW4ndApzZWUgYW55dGhpbmcgZ2V0
dGluZyBpbiB0aGUgd2F5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
