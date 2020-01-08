Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2D1341B2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:29:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAPo-0002C8-Ds; Wed, 08 Jan 2020 12:26:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipAPn-0002C3-Bn
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:26:23 +0000
X-Inumbo-ID: 14624820-3212-11ea-b7d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14624820-3212-11ea-b7d9-12813bfff9fa;
 Wed, 08 Jan 2020 12:26:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 855AFAD78;
 Wed,  8 Jan 2020 12:26:21 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200107173902.13768-1-liuwe@microsoft.com>
 <20200107173902.13768-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5405f981-d7b4-11ce-38a5-fc221454d99a@suse.com>
Date: Wed, 8 Jan 2020 13:26:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107173902.13768-2-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/hyperv: drop usage of GENMASK_ULL
 from hyperv-tlfs.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxODozOSwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVydi10bGZzLmgKPiBAQCAtNDE1LDEzICs0MTUsMTMgQEAgZW51bSBIVl9HRU5FUklD
X1NFVF9GT1JNQVQgewo+ICAJSFZfR0VORVJJQ19TRVRfQUxMLAo+ICB9Owo+ICAKPiAtI2RlZmlu
ZSBIVl9IWVBFUkNBTExfUkVTVUxUX01BU0sJR0VOTUFTS19VTEwoMTUsIDApCj4gKyNkZWZpbmUg
SFZfSFlQRVJDQUxMX1JFU1VMVF9NQVNLCTB4ZmZmZiAvKiBHRU5NQVNLX1VMTCgxNSwgMCkgKi8K
PiAgI2RlZmluZSBIVl9IWVBFUkNBTExfRkFTVF9CSVQJCUJJVCgxNiwgVUwpCj4gICNkZWZpbmUg
SFZfSFlQRVJDQUxMX1ZBUkhFQURfT0ZGU0VUCTE3Cj4gICNkZWZpbmUgSFZfSFlQRVJDQUxMX1JF
UF9DT01QX09GRlNFVAkzMgo+IC0jZGVmaW5lIEhWX0hZUEVSQ0FMTF9SRVBfQ09NUF9NQVNLCUdF
Tk1BU0tfVUxMKDQzLCAzMikKPiArI2RlZmluZSBIVl9IWVBFUkNBTExfUkVQX0NPTVBfTUFTSwkw
eGZmZjAwMDAwMDAwIC8qIEdFTk1BU0tfVUxMKDQzLCAzMikgKi8KPiAgI2RlZmluZSBIVl9IWVBF
UkNBTExfUkVQX1NUQVJUX09GRlNFVAk0OAo+IC0jZGVmaW5lIEhWX0hZUEVSQ0FMTF9SRVBfU1RB
UlRfTUFTSwlHRU5NQVNLX1VMTCg1OSwgNDgpCj4gKyNkZWZpbmUgSFZfSFlQRVJDQUxMX1JFUF9T
VEFSVF9NQVNLCTB4ZmZmMDAwMDAwMDAwMDAwIC8qIEdFTk1BU0tfVUxMKDU5LCA0OCkgKi8KClRo
ZSBsYXN0IHR3byBzaG91bGQgZ2FpbiBVTEwgKG9yIGF0IGxlYXN0IFVMKSBzdWZmaXhlcy4gSSBh
bHNvCndvbmRlciB3aGV0aGVyIGJvdGggd291bGRuJ3QgYmV0dGVyIGJlIGV4cHJlc3NlZCBhcyAo
MHhmZmZVTEwgPDwgTikuCldpdGggYXQgbGVhc3QgdGhlIHN1ZmZpeGVzIGFkZGVkCkFja2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
