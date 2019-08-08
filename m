Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172268619E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:28:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhTS-0003d5-GL; Thu, 08 Aug 2019 12:24:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvhTR-0003cu-2V
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 12:24:53 +0000
X-Inumbo-ID: 8481b748-b9d7-11e9-8c26-b7a72c6262fe
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8481b748-b9d7-11e9-8c26-b7a72c6262fe;
 Thu, 08 Aug 2019 12:24:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C6F615A2;
 Thu,  8 Aug 2019 05:24:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77EBD3F694;
 Thu,  8 Aug 2019 05:24:49 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
 <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
 <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2dfcda6f-c5da-7b86-429f-f11827ad1b08@arm.com>
Date: Thu, 8 Aug 2019 13:24:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOC8wOC8yMDE5IDEyOjIzLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gT24gMDguMDguMTkg
MTQ6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gCj4gSGksIFJvZ2VyLgo+IAo+IAo+PiBP
biBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwMTo1MzoyM1BNICswMzAwLCBPbGVrc2FuZHIgVHlzaGNo
ZW5rbyB3cm90ZToKPj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlz
aGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+PiBEb24ndCBza2lwIElPTU1VIG5vZGVzIHdoZW4gY3Jl
YXRpbmcgRFQgZm9yIERvbTAgaWYgSU9NTVUgaGFzIGJlZW4KPj4+IGZvcmNpYmx5IGRpc2FibGVk
IGluIGJvb3RhcmdzIChlLmcuICJpb21tdT0wIikgaW4gb3JkZXIgdG8gbGV0Cj4+PiB0aGUgSU9N
TVUgYmUgYWNjZXNzaWJsZSBieSBET00wLgoKSSBkb24ndCB0aGluayB5b3VyIGNvZGUgaXMgZG9p
bmcgd2hhdCB5b3UgZXhwZWN0Li4uIElmIGlvbW11PTAsIHRoZW4gWGVuIHdpbGwgCm5vdCBsb29r
dXAgZm9yIElPTU1VcyAoaW9tbXVfaGFyZHdhcmVfc2V0dXAoKSB3aWxsIG5vdCBiZSBjYWxsZWQp
LiBTbyBub25lIG9mIAp0aGUgZGV2aWNlIHdpbGwgaGF2ZSBERVZJQ0VfSU9NTVUgc2V0IGFuZCBo
ZW5jZSB0aGV5IGFyZSBhbHJlYWR5IGdpdmVuIHRvIGRvbTAuCgpCdXQgSSB0aGluayBpdCBpcyB3
cm9uZyB0byBnaXZlIHRoZSBJT01NVXMgdG8gRG9tMCB3aGVuIGlvbW11PTAuIFRoaXMgaXMgbm90
IHRoZSAKZ29hbCBvZiB0aGlzIG9wdGlvbi4gSWYgeW91IHdhbnQgdG8gcGFzc3Rocm91Z2ggdGhl
IElPTU1VIHRvIERvbTAsIHRoZW4geW91IApzaG91bGQgdXNlIHRoZSBwYXJhbWV0ZXIgaW9tbXVf
aHdkb21fcGFzc3Rocm91Z2guCgpIb3dldmVyLCBJIGFncmVlIHdpdGggUm9nZXIgdGhhdCBnaXZp
bmcgdGhlIElPTU1VIHRvIGRvbTAgaXMgYSBwcmV0dHkgYmFkIGlkZWEuIApTbyB0aGlzIHNob3Vs
ZCBiZSBmaXhlZC4KCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28g
PG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4gLS0tCj4+PiBJIGhhdmUgaGVhcmQg
dGhlcmUgaXMgYSAicG9zc2libGUiIGNhc2Ugd2hlbiB0aGUgSU9NTVUgY291bGQgYmUgYWNjZXNz
aWJsZSBieSAKPj4+IERPTTAuCj4+PiBTbywgSSB0aGluaywgZm9yIHRoaXMgdG8gd29yayB3ZSBu
ZWVkIHRvIGNyZWF0ZSBjb3JyZXNwb25kaW5nIERUIG5vZGVzIGluIHRoZSBEVAo+Pj4gYXQgbGVh
c3QuCj4+IGRvbTAgb24gQVJNIGJlaW5nIGFuIGF1dG90cmFuc2xhdGVkIGd1ZXN0IEknbSBub3Qg
c3VyZSBob3cgaXQncyBnb2luZwo+PiB0byBwcm9ncmFtIHRoZSBETUEgcmVtYXBwaW5nIGluIHRo
ZSBpb21tdSwgc2luY2UgaXQgZG9lc24ndCBrbm93IHRoZQo+PiBtZm5zIG9mIHRoZSBtZW1vcnkg
aXQgdXNlcyBhdCBhbGwsIGhlbmNlIEkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBpbgo+PiBleHBvc2lu
ZyB0aGUgaGFyZHdhcmUgaW9tbXUgdG8gZG9tMCB1bmxlc3MgdGhlcmUncyBzb21lIGVtdWxhdGlv
biBkb25lCj4+IHRvIG1ha2UgZG9tMCBhYmxlIHRvIGFjY2VzcyBpdC4KPiAKPiBDdXJyZW50bHks
IERvbTAgb24gQVJNIGlzIGFsd2F5cyAxOjEgbWFwcGVkIChnZm4gPT0gbWZuKS4gSG93ZXZlciwg
SSBkb24ndCAKPiByZWFsbHkga25vdyBob3cgbG9uZyB0aGlzIGFzc3VtcHRpb24gaXQgaXMgZ29p
bmcgdG8gYmUgdHJ1ZS4KClRoZSAxOjEgbWFwcGVkIGlzIG9ubHkgY29ycmVjdCBmb3IgRG9tMCBS
QU0uIEFueSBmb3JlaWduIG1hcHBpbmcgd2lsbCBub3QgYmUgCm1hcHBlZCAxOjEuCgpXZSBhY3R1
YWxseSBoYXZlIGNvZGUgaW4gTGludXggdG8ga2VlcCB0cmFjayBvZiB0aGUgZm9yZWlnbiBtYXBw
aW5nIGFzIGFueSBETUEgCmFjY2VzcyBzaG91bGQgYmUgdXNpbmcgdGhlIG1hY2hpbmUgcGh5c2lj
YWwgYWRkcmVzcyAoYW5kIG5vdCBEb20wIHBoeXNpY2FsIGFkZHJlc3MpLgoKVGhpcyBicmluZ3Mg
c29tZSBoZWFkYWNoZSB3aGVuIElPTU1VIGlzIHVzZWQgaW4gWGVuIGJlY2F1c2Ugd2UgaGF2ZSB0
byBhZGQgYSAxOjEgCm1hcHBpbmcgZm9yIGZvcmVpZ24gcGFnZSBzbyB5b3UgY2FuIHN0aWxsIERN
QSBpbiBpdC4gVGhpcyB3aWxsIGJlIGZ1biB0cnlpbmcgdG8gCmZpeCBYU0EtMzAwIGJlY2F1c2Ug
b2YgdGhhdC4uLgoKSWRlYWxseSB0aGUgMToxIG1hcHBpbmcgc2hvdWxkIG9ubHkgYmUgdXNlZCB3
aGVuIG5lY2Vzc2FyeS4gVW5mb3J0dW5hdGVseSB0aGlzIAppcyBub3QgdHJpdmlhbCB0byByZW1v
dmUuIEZvciBhIGZpcnN0LCBMaW51eCBpcyBhc3N1bWluZyB0aGUgMToxIG1hcHBpbmcgc28geW91
IApuZWVkIHRvIHRlYWNoIExpbnV4IHRvIG5vdCBhc3N1bWUgdGhhdCBhbnltb3JlLiBTbyB3ZSBu
ZWVkIHRvIGtub3cgaWYgdGhlIGtlcm5lbCAKaXMgYWJsZSB0byBkZWFsIHdpdGggaXQgd2hlbiBi
dWlsZGluZyBkb20wLgoKRnVydGhlcm1vcmUsIGhhdmluZyBhbiBJT01NVSBvbiBhIHBsYXRmb3Jt
IHNhZGx5IGRvZXNuJ3QgbWVhbiBhbGwgRE1BLWNhcGFibGUgCmRldmljZXMgd2lsbCBiZSBiZWhp
bmQgaXQuIFRoaXMgaXMgYSBiaXQgZGlmZmljdWx0IHRvIGZpbmQgb3V0IGluIFhlbi4KCkluIHNo
b3J0LCB0aGlzIGlzIHF1aXRlIGEgbWVzcyB0byByZXNvbHZlIDovLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
