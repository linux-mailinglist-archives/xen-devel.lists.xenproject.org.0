Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F075410D718
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:36:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahLr-0002gr-Q7; Fri, 29 Nov 2019 14:34:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iahLq-0002gl-J8
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:34:30 +0000
X-Inumbo-ID: 59d5d038-12b5-11ea-a3e7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59d5d038-12b5-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 14:34:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19F4CB133;
 Fri, 29 Nov 2019 14:34:29 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Wei Liu <wl@xen.org>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-8-liuwe@microsoft.com>
 <1a0165e1-7905-7482-6551-12e55099b6b5@suse.com>
Message-ID: <852e3583-0300-7d3f-2f1f-06a8511cd1e9@suse.com>
Date: Fri, 29 Nov 2019 15:34:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1a0165e1-7905-7482-6551-12e55099b6b5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/8] x86: be more verbose when running on
 a hypervisor
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxNTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjEuMTEuMjAxOSAx
OTo1MCwgV2VpIExpdSB3cm90ZToKPj4gQEAgLTc2Myw3ICs3NjQsNyBAQCB2b2lkIF9faW5pdCBu
b3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+PiAgICAgICAqIGFsbG9j
aW5nIGFueSB4ZW5oZWFwIHN0cnVjdHVyZXMgd2FudGVkIGluIGxvd2VyIG1lbW9yeS4gKi8KPj4g
ICAgICBrZXhlY19lYXJseV9jYWxjdWxhdGlvbnMoKTsKPj4gIAo+PiAtICAgIGh5cGVydmlzb3Jf
cHJvYmUoKTsKPj4gKyAgICBydW5uaW5nX29uX2h5cGVydmlzb3IgPSAhIWh5cGVydmlzb3JfcHJv
YmUoKTsKPiAKPiBObyBuZWVkIGZvciAhISBJIHRoaW5rPwo+IAo+PiBAQCAtNzg4LDYgKzc4OSw4
IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3Ap
Cj4+ICAgICAgcHJpbnRrKCJDb21tYW5kIGxpbmU6ICVzXG4iLCBjbWRsaW5lKTsKPj4gIAo+PiAg
ICAgIHByaW50aygiWGVuIGltYWdlIGxvYWQgYmFzZSBhZGRyZXNzOiAlI2x4XG4iLCB4ZW5fcGh5
c19zdGFydCk7Cj4+ICsgICAgaWYgKCBydW5uaW5nX29uX2h5cGVydmlzb3IgKQo+PiArICAgICAg
ICBwcmludGsoIlJ1bm5pbmcgb24gJXNcbiIsIGh5cGVydmlzb3JfcHJvYmUoKS0+bmFtZSk7Cj4g
Cj4gSW52b2tpbmcgaHlwZXJ2aXNvcl9wcm9iZSgpIHR3aWNlIHNlZW1zIG9kZCB0byBtZS4gSSBy
ZWFsaXplCj4gdGhlIGZ1bmN0aW9uIGNvcGVzLCBidXQgd2h5IGRvIGV2ZXJ5dGhpbmcgYSAybmQg
dGltZSB3aGVuCj4gbm90IHJ1bm5pbmcgb24gYW55IGh5cGVydmlzb3I/IEZ1cnRoZXJtb3JlIGlm
IHRoaXMgdXNlIGlzCj4gdGhlIG9ubHkgcmVhc29uIHdoeSBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
Y2FuJ3QgYmUgbG9jYWwgdG8KPiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jLCB0aGVu
IEkgdGhpbmsgb25jZSBhZ2Fpbgo+IHRoYXQgdGhlIG5hbWUgc2hvdWxkIGJlIHJldHVybiBmcm9t
IGh5cGVydmlzb3JfcHJvYmUoKS4KCiJMb2NhbCB0byB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jIiB3YXMgcnViYmlzaCBvZgpjb3Vyc2U7IGxvY2FsIHRvIHhlbi9hcmNoL3g4Ni9ndWVz
dC8gd291bGQgYmUgbW9yZSBjb3JyZWN0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
