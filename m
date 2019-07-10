Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009C647F7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 16:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlDL2-0000D5-PM; Wed, 10 Jul 2019 14:12:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iApL=VH=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hlDL2-0000Cw-0N
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 14:12:52 +0000
X-Inumbo-ID: cd14c7de-a31c-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd14c7de-a31c-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 14:12:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50FE23082E09;
 Wed, 10 Jul 2019 14:12:50 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-153.ams2.redhat.com
 [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25810466B9;
 Wed, 10 Jul 2019 14:12:46 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d86279b1-95e4-c06c-c71e-913e7bd45987@redhat.com>
Date: Wed, 10 Jul 2019 16:12:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 10 Jul 2019 14:12:50 +0000 (UTC)
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
dHRwL3Blb3BsZS9hcGVyYXJkL292bWYuZ2l0IGJyLnBsYXRmb3JtLXhlbi1wdmgtdjMKCkkgYmVs
aWV2ZSBJJ3ZlIGNvbXBsZXRlZCB0aGUgdjMgcmV2aWV3LgoKVGhhbmtzLApMYXN6bG8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
