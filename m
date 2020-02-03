Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B2150795
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:42:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybwm-0007l6-Ug; Mon, 03 Feb 2020 13:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iybwl-0007l1-8d
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:39:27 +0000
X-Inumbo-ID: 980e0e5c-468a-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 980e0e5c-468a-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 13:39:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 22230AE1C;
 Mon,  3 Feb 2020 13:39:25 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58b1a2e5-d63f-ba87-9f20-24b8c0e1097f@suse.com>
Date: Mon, 3 Feb 2020 14:39:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200121084330.18309-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/9] xen: add a generic way to include
 binary files as variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAwOTo0MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIveGVuL3Rvb2xzL2JpbmZpbGUKPiBAQCAtMCwwICsxLDI5IEBACj4gKyMhL2Jpbi9z
aAo+ICsjIHVzYWdlOiBiaW5maWxlIFstaV0gPHRhcmdldC1zcmMuUz4gPGJpbmFyeS1maWxlPiA8
dmFybmFtZT4KPiArIyAtaSAgICAgYWRkIHRvIC5pbml0LnJvZGF0YSAoZGVmYXVsdDogLnJvZGF0
YSkgc2VjdGlvbgo+ICsKPiArWyAiJDEiID0gIi1pIiBdICYmIHsKPiArICAgIHNoaWZ0Cj4gKyAg
ICBzZWN0aW9uPSIuaW5pdCIKPiArfQo+ICsKPiArdGFyZ2V0PSQxCj4gK2JpbnNvdXJjZT0kMgo+
ICt2YXJuYW1lPSQzCj4gKwo+ICtjYXQgPDxFT0YgPiR0YXJnZXQKPiArI2luY2x1ZGUgPGFzbS9h
c21fZGVmbnMuaD4KPiArCj4gKyAgICAgICAgLnNlY3Rpb24gJHNlY3Rpb24ucm9kYXRhLCAiYSIs
ICVwcm9nYml0cwo+ICsKPiArICAgICAgICAuZ2xvYmFsICR2YXJuYW1lCj4gKyR2YXJuYW1lOgo+
ICsgICAgICAgIC5pbmNiaW4gIiRiaW5zb3VyY2UiCj4gKy5MZW5kOgo+ICsKPiArICAgICAgICAu
dHlwZSAkdmFybmFtZSwgJW9iamVjdAo+ICsgICAgICAgIC5zaXplICR2YXJuYW1lLCAuIC0gJHZh
cm5hbWUKCkknZCBwcmVmZXIgaWYgeW91IHVzZWQgLkxlbmQgaGVyZSBhcyB3ZWxsLgoKSSB3b25k
ZXIgd2hldGhlciwgcmlnaHQgZnJvbSB0aGUgYmVnaW5uaW5nLCB0aGVyZSB3b3VsZG4ndCBiZXR0
ZXIKYmUgYSB3YXkgdG8gYWxzbyByZXF1ZXN0IGJldHRlciB0aGFuIGJ5dGUgYWxpZ25tZW50IGZv
ciBzdWNoIGEKYmxvYi4KCj4gLS0tIGEveGVuL3hzbS9mbGFzay9NYWtlZmlsZQo+ICsrKyBiL3hl
bi94c20vZmxhc2svTWFrZWZpbGUKPiBAQCAtMzAsNiArMzAsOSBAQCAkKEFWX0hfRklMRVMpOiAk
KEFWX0hfREVQRU5EKQo+ICBvYmotYmluLSQoQ09ORklHX1hTTV9GTEFTS19QT0xJQ1kpICs9IGZs
YXNrLXBvbGljeS5vCj4gIGZsYXNrLXBvbGljeS5vOiBwb2xpY3kuYmluCj4gIAo+ICtmbGFzay1w
b2xpY3kuUzogJChYRU5fUk9PVCkveGVuL3Rvb2xzL2JpbmZpbGUKPiArCSQoWEVOX1JPT1QpL3hl
bi90b29scy9iaW5maWxlIC1pICRAIHBvbGljeS5iaW4geHNtX2ZsYXNrX2luaXRfcG9saWN5CgpE
b2Vzbid0IG9iamNvcHkgcHJvdmlkZSBhIG1lYW5zIHRvIGNvbnZlcnQgYSBiaW5hcnkgYmxvYiBp
bnRvCmFuIEVMRiBvYmplY3QgY29udGFpbmluZyB0aGUgYmluYXJ5IGRhdGEgZnJvbSB0aGUgaW5w
dXQgZmlsZT8KSWYgc28sIHdoeSBpbnZvbHZlIHRoZSBhc3NlbWJsZXIgYW5kIGFuIGludGVybWVk
aWF0ZSBmaWxlIGhlcmU/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
