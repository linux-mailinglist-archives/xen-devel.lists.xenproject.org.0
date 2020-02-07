Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B17155383
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 09:10:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izygM-00032h-1h; Fri, 07 Feb 2020 08:08:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izygK-00032c-LB
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 08:08:08 +0000
X-Inumbo-ID: f95abdce-4980-11ea-a759-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f95abdce-4980-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 08:08:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 129FFB035;
 Fri,  7 Feb 2020 08:08:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
Message-ID: <5ecf685c-7109-4ad6-cba9-bb138f750268@suse.com>
Date: Fri, 7 Feb 2020 09:08:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/p2m: drop p2m_access_t parameter from
 set_mmio_p2m_entry()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+IEBA
IC0zMDM3LDkgKzMwMzcsOCBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhz
dHJ1Cj4gICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KHBnLCBkLCBTSEFSRV9ydyk7Cj4g
ICAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuID0gbWZuOwo+ICAKPiAtICAgIHJl
dHVybiBzZXRfbW1pb19wMm1fZW50cnkoZCwgcGFkZHJfdG9fcGZuKEFQSUNfREVGQVVMVF9QSFlT
X0JBU0UpLCBtZm4sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJf
NEssCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9nZXRfaG9zdHAybShkKS0+
ZGVmYXVsdF9hY2Nlc3MpOwo+ICsgICAgcmV0dXJuIHNldF9tbWlvX3AybV9lbnRyeShkLCBnYWRk
cl90b19nZm4oQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSksIG1mbiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUEFHRV9PUkRFUl80Syk7Cj4gIH0KClVwb24gMm5kIHRob3VnaHQgLSBk
b2VzIHRoaXMgcmVhbGx5IHdhbnQgdG8gdXNlIGRlZmF1bHQgYWNjZXNzPwpFeGVjdXRlIHBlcm1p
c3Npb24gZm9yIHRoaXMgcGFnZSBsb29rcyBhIGxpdHRsZSBzdXNwaWNpb3VzLgpJc24ndCBpdCB0
aGUgY2FzZSB0aGF0IHRoaXMgcGFnZSBkb2Vzbid0IChub3JtYWxseT8pIGdldAphY2Nlc3NlZCBh
dCBhbGwsIGFuZCBpbnN0ZWFkIGl0cyBhZGRyZXNzIHNlcnZlcyBhcyBhbiBpbmRpY2F0b3IKdG8g
dGhlIENQVT8gKEkgZXZlbiB2YWd1ZWx5IHJlY2FsbCBpdCBoYXZpbmcgYmVlbiBjb25zaWRlcmVk
IHRvCmNvbnNvbGlkYXRlIHRoaXMsIHRvIGUuZy4gYSBzaW5nbGUgcGFnZSBwZXIgZG9tYWluLikg
SW4gd2hpY2gKY2FzZSBldmVuIHAybV9hY2Nlc3NfbiBtaWdodCBiZSBnb29kIGVub3VnaD8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
