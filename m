Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6D1435E8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 04:31:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itkDt-0003Dn-V9; Tue, 21 Jan 2020 03:29:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O4ZA=3K=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1itkDs-0003Di-MV
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 03:29:00 +0000
X-Inumbo-ID: 28367fb0-3bfe-11ea-ba1f-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.191])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28367fb0-3bfe-11ea-ba1f-12813bfff9fa;
 Tue, 21 Jan 2020 03:28:58 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 338FE655087C8718ED96;
 Tue, 21 Jan 2020 11:28:56 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 21 Jan 2020
 11:28:50 +0800
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <1579232458-26803-1-git-send-email-xuwei5@hisilicon.com>
 <539d5900-1cc6-a490-7319-5357c6aa1219@suse.com>
 <d936960f-214d-788b-29cf-7be147332ea9@xen.org>
 <6d658434-0dfd-24bb-9b84-8ae365e1feac@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E266FF1.2060805@hisilicon.com>
Date: Tue, 21 Jan 2020 11:28:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <6d658434-0dfd-24bb-9b84-8ae365e1feac@suse.com>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] ns16550: Add ACPI support
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, linuxarm@huawei.com,
 shameerali.kolothum.thodi@huawei.com, prime.zeng@hisilicon.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLCBKdWxpZW4sCgpPbiAyMDIwLzEvMjAgMTY6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+
IE9uIDE4LjAxLjIwMjAgMTM6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMTcvMDEvMjAy
MCAwODozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAxNy4wMS4yMDIwIDA0OjQwLCBXZWkg
WHUgd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPj4+PiArKysg
Yi94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+Pj4+IEBAIC0xNjIwLDYgKzE2MjAsNjEgQEAg
RFRfREVWSUNFX1NUQVJUKG5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJQ0VfU0VSSUFMKQo+
Pj4+ICAgIERUX0RFVklDRV9FTkQKPj4+PiAgICAKPj4+PiAgICAjZW5kaWYgLyogSEFTX0RFVklD
RV9UUkVFICovCj4+Pj4gKwo+Pj4+ICsjaWZkZWYgQ09ORklHX0FDUEkKPj4+PiArI2luY2x1ZGUg
PHhlbi9hY3BpLmg+Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlf
dWFydF9pbml0KGNvbnN0IHZvaWQgKmRhdGEpCj4+Pj4gK3sKPj4+PiArICAgIHN0cnVjdCBhY3Bp
X3RhYmxlX3NwY3IgKnNwY3IgPSBOVUxMOwo+Pj4+ICsgICAgYWNwaV9zdGF0dXMgc3RhdHVzOwo+
Pj4+ICsgICAgc3RydWN0IG5zMTY1NTAgKnVhcnQ7Cj4+Pj4gKwo+Pj4+ICsgICAgc3RhdHVzID0g
YWNwaV9nZXRfdGFibGUoQUNQSV9TSUdfU1BDUiwgMCwKPj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIChzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKiopJnNwY3IpOwo+Pj4+ICsKPj4+
PiArICAgIGlmICggQUNQSV9GQUlMVVJFKHN0YXR1cykgKQo+Pj4+ICsgICAgewo+Pj4+ICsgICAg
ICAgIHByaW50aygibnMxNjU1MDogRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsKPj4+PiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+PiArICAgIH0KPj4+PiArCj4+Pj4gKyAgICB1YXJ0
ID0gJm5zMTY1NTBfY29tWzBdOwo+Pj4gWW91IHdhbnQgdG8ganVzdGlmeSB0aGUgY2hvaWNlIG9m
IHdoYXQgKG9uIHg4NiBhdCBsZWFzdD0gd2UnZCBjYWxsCj4+PiBjb20xIGluIHRoZSBwYXRjaCBk
ZXNjcmlwdGlvbi4gQWxzbyB0aGlzIGNvdWxkIGJlIHRoZSBpbml0aWFsaXplcgo+Pj4gb2YgdGhl
IHZhcmlhYmxlLgo+PiBUaGlzIGlzIHRoZSBzYW1lIGNob2ljZSBhcyB3ZSBtYWRlIGZvciB0aGUg
RFQgYmluZGluZyAoc2VlCj4+IG5zMTY1NTBfdWFydCgpKS4gV2Ugb25seSBzdXBwb3J0IG9uZSBV
QVJUIG9uIEFybSB3aGljaCBoYXBwZW4gdG8gYmUKPj4gbnMxNjU1MF9jb21bMF0gKGJ1dCBuYW1l
ZCBkaWZlcnJlbnRseSkuCj4+Cj4+IFRoZSBjb2RlIGJlbG93IGlzIGFjdHVhbGx5IHF1aXRlIHNp
bWlsYXIgdG8gdGhlIERUIHBhcnNpbmcsIHNvIG1heWJlIHdlCj4+IHdhbnQgdG8gcHJvdmlkZSBh
IGNvbW1vbiBoZWxwZXIgaGVyZS4KPiBUaGF0J3MgYWxsIGZpbmUsIGJ1dCBkb2Vzbid0IGVsaW1p
bmF0ZSB0aGUgbmVlZCB0byBzYXkgc28gaW4gdGhlCj4gZGVzY3JpcHRpb24uCj4KPj4+PiArICAg
IC8qICBSZWdpc3RlciB3aXRoIGdlbmVyaWMgc2VyaWFsIGRyaXZlci4gKi8KPj4+PiArICAgIHNl
cmlhbF9yZWdpc3Rlcl91YXJ0KHVhcnQgLSBuczE2NTUwX2NvbSwgJm5zMTY1NTBfZHJpdmVyLCB1
YXJ0KTsKPj4+PiArCj4+Pj4gKyAgICByZXR1cm4gMDsKPj4+PiArfQo+Pj4+ICsKPj4+PiArQUNQ
SV9ERVZJQ0VfU1RBUlQoYW5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJQ0VfU0VSSUFMKQo+
Pj4+ICsgICAgLmNsYXNzX3R5cGUgPSBBQ1BJX0RCRzJfMTY1NTBfQ09NUEFUSUJMRSwKPj4+PiAr
ICAgIC5pbml0ID0gbnMxNjU1MF9hY3BpX3VhcnRfaW5pdCwKPj4+PiArQUNQSV9ERVZJQ0VfRU5E
Cj4+PiBJIGRvbid0IGV4cGVjdCB0aGlzIHRvIGJ1aWxkIG9uIHg4Ni4KPj4gVGhpcyBpcyBvbmx5
IG1lYW50IHRvIHRhcmdldCBBcm0uIFNvIG1heWJlIHdlIHdhbnQgdG8gcHJvdGVjdCB0aGUgd2hv
bGUKPj4gY29kZSB3aXRoIGRlZmluZWQoQ09ORklHX0FDUEkpICYmIGRlZmluZWQoQ09ORklHX0FS
TSkuCj4gSW5kZWVkLCB0aGF0J3Mgd2hhdCB0aGUgcmVtYXJrIHdhcyBhaW1pbmcgYXQuCj4KPiBK
YW4KPgo+IC4KPgoKVGhhbmtzIQpJIHdpbGwgYWRkcmVzcyB0aGUgY29tbWVudHMgaW4gVjIuCgpC
ZXN0IFJlZ2FyZHMsCldlaQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
