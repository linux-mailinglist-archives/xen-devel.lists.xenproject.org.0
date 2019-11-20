Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412E103510
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 08:18:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXKAt-0005F5-NO; Wed, 20 Nov 2019 07:13:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXKAs-0005F0-NV
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 07:13:14 +0000
X-Inumbo-ID: 3731f1da-0b65-11ea-a309-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3731f1da-0b65-11ea-a309-12813bfff9fa;
 Wed, 20 Nov 2019 07:13:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BFE04B2E0;
 Wed, 20 Nov 2019 07:13:12 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
 <09359c00-5769-0e0d-4af9-963897d3b498@suse.com>
 <40267a5b-8f1b-6463-72cd-f8f354c58bc4@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5988a7d-4cc0-390d-92a3-98e00038c3ea@suse.com>
Date: Wed, 20 Nov 2019 08:13:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <40267a5b-8f1b-6463-72cd-f8f354c58bc4@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH 0/2] x86/Xen/32: xen_iret_crit_fixup
 adjustments
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxODo1MCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDExLzE5LzE5
IDc6NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxMS4xMS4yMDE5IDE1OjMwLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IFRoZSBmaXJzdCBwYXRjaCBoZXJlIGZpeGVzIGFub3RoZXIgcmVn
cmVzc2lvbiBmcm9tIDNjODhjNjkyYzI4Nwo+Pj4gKCJ4ODYvc3RhY2tmcmFtZS8zMjogUHJvdmlk
ZSBjb25zaXN0ZW50IHB0X3JlZ3MiKSwgYmVzaWRlcyB0aGUKPj4+IG9uZSBhbHJlYWR5IGFkZHJl
c3NlZCBieQo+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTEwL21zZzAxOTg4Lmh0bWwuCj4+PiBUaGUgc2Vjb25kIHBhdGNoIGlzIGEg
bWluaW1hbCBiaXQgb2YgY2xlYW51cCBvbiB0b3AuCj4+Pgo+Pj4gMTogbWFrZSB4ZW5faXJldF9j
cml0X2ZpeHVwIGluZGVwZW5kZW50IG9mIGZyYW1lIGxheW91dAo+Pj4gMjogc2ltcGxpZnkgeGVu
X2lyZXRfY3JpdF9maXh1cCdzIHJpbmcgY2hlY2sKPj4gU2VlaW5nIHRoYXQgdGhlIG90aGVyIHJl
Z3Jlc3Npb24gZml4IGhhcyBiZWVuIHRha2VuIGludG8gLXRpcCwKPj4gd2hhdCBpcyB0aGUgc2l0
dWF0aW9uIGhlcmU/IFNob3VsZCA1LjQgcmVhbGx5IHNoaXAgd2l0aCB0aGlzCj4+IHN0aWxsIHVu
Zml4ZWQ/Cj4gCj4gCj4gSSBhbSBzdGlsbCB1bmFibGUgdG8gYm9vdCBhIDMyLWJpdCBndWVzdCB3
aXRoIHRob3NlIHBhdGNoZXMsIGNyYXNoaW5nIGluCj4gaW50M19leGNlcHRpb25fbm90aWZ5IHdp
dGggcmVncy0+c3AgemVyby4KPiAKPiBXaGVuIEkgcmV2ZXJ0IHRvIDNjODhjNjkyYzI4NyB0aGUg
Z3Vlc3QgYWN0dWFsbHkgYm9vdHMgc28gbXkgKD8pIHByb2JsZW0KPiB3YXMgaW50cm9kdWNlZCBz
b21ld2hlcmUgaW4tYmV0d2Vlbi4KCkluIG9yZGVyIHRvIGV2ZW4gZ2V0IGFzIGZhciBhcyB0aGUg
cGF0Y2hlcyBoZXJlIHRha2luZyBlZmZlY3QKeW91IGZpcnN0IG5lZWQgIng4Ni9zdGFja2ZyYW1l
LzMyOiByZXBhaXIgMzItYml0IFhlbiBQViIgKHdoaWNoCmlzIHdoYXQgInRoZSBvdGhlciByZWdy
ZXNzaW9uIGZpeCIgaW4gbXkgcGluZyByZWZlcnMgdG8pLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
