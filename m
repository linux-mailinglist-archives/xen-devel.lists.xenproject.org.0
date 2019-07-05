Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE89608C5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 17:10:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPnk-0006TH-PA; Fri, 05 Jul 2019 15:07:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjPnj-0006T9-1S
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 15:07:03 +0000
X-Inumbo-ID: 8ae066a4-9f36-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8ae066a4-9f36-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 15:07:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92B6483F42;
 Fri,  5 Jul 2019 15:06:56 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C8718000;
 Fri,  5 Jul 2019 15:06:54 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <3e02faaa-419a-6cef-ac73-75430f66b364@redhat.com>
Date: Fri, 5 Jul 2019 17:06:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 05 Jul 2019 15:07:01 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 00/35] Specific platform to run OVMF in
 Xen PVH and HVM guests
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFBhdGNoIHNlcmllcyBh
dmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOgo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dp
dC1odHRwL3Blb3BsZS9hcGVyYXJkL292bWYuZ2l0IGJyLnBsYXRmb3JtLXhlbi1wdmgtdjMKPiAK
PiBIaSwKPiAKPiBJJ3ZlIHN0YXJ0ZWQgdG8gY3JlYXRlIGEgWGVuIHNwZWNpZmljIHBsYXRmb3Jt
LCBpbiBPdm1mUGtnL1hlbk92bWYuZHNjCj4gd2l0aCB0aGUgZ29hbCB0byBtYWtlIGl0IHdvcmsg
b24gYm90aCBYZW4gSFZNIGFuZCBYZW4gUFZILgo+IAo+IFRoZSBmaXJzdCBmZXcgcGF0Y2hlcyBv
bmx5IGNyZWF0ZSB0aGUgcGxhdGZvcm0gYW5kIGR1cGxpY2F0ZSBzb21lIGNvZGUgZnJvbQo+IE92
bWZQa2cgYW5kIHRoZSBsYXRlciBwYXRjaGVzIG1ha2VzIE9WTUYgYm9vdCBpbiBhIFhlbiBQVkgg
Z3Vlc3QgYW5kIGNhbiBib290Cj4gYSBMaW51eCBndWVzdC4KPiAKPiBBZnRlciB0aGlzIHBhdGNo
IHNlcmllcywgSSdkIGxpa2UgdG8gd2FpdCBhIGJpdCBiZWZvcmUgcmVtb3ZpbmcgWGVuIHN1cHBv
cnQKPiBmcm9tIHRoZSBPdm1mUGtnKi5kc2MsIHRvIGFsbG93IHRpbWUgdG8gc3dpdGNoIHRvIHRo
ZSBuZXcgWGVuIG9ubHkgcGxhdGZvcm0sCj4gbWF5YmUgMSB5ZWFyLgo+IAo+IFRvIGJ1aWxkIGFu
ZCBib290Ogo+IAo+IFRvIGJ1aWxkLCBzaW1wbHkgcnVuIE92bWZQa2cvYnVpbGQuc2ggLXAgT3Zt
ZlBrZy9Pdm1mWGVuLmRzYwo+IFRoZW4gdXNlIE9WTUYuZmQgYXMgYSBrZXJuZWwgb2YgYSBwdmgg
Z3Vlc3QgY29uZmlnIGZpbGUgKHdpdGggeGwvbGlieGwpLgo+IAo+IFBhdGNoIHNlcmllcyBhdmFp
bGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOgo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1o
dHRwL3Blb3BsZS9hcGVyYXJkL292bWYuZ2l0IGJyLnBsYXRmb3JtLXhlbi1wdmgtdjMKCkkgaW50
ZW5kIHRvIGNvbnRpbnVlIHRoZSByZXZpZXcgd2l0aCBbUEFUQ0ggdjMgMTEvMzVdLCBuZXh0IHdl
ZWsuCgpUaGFua3MKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
