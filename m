Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21866E2157
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNK0h-0001Nj-7r; Wed, 23 Oct 2019 17:01:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u5x0=YQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iNK0f-0001Ne-IL
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:01:21 +0000
X-Inumbo-ID: b9195a4a-f5b6-11e9-9488-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b9195a4a-f5b6-11e9-9488-12813bfff9fa;
 Wed, 23 Oct 2019 17:01:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBDE428;
 Wed, 23 Oct 2019 10:01:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC6293F718;
 Wed, 23 Oct 2019 10:01:13 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>
References: <20191010141231.25363-1-al1img@gmail.com>
 <23968.40555.917945.129929@mariner.uk.xensource.com>
 <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
 <alpine.DEB.2.21.1910111017050.6326@sstabellini-ThinkPad-T480s>
 <CACvf2oWENPf27aqQdve6StQOBv_TitKF_HSxhqFTcfJtmkL6eg@mail.gmail.com>
 <950c69d8-8f0c-b3f7-11da-9accef793c37@arm.com>
 <CACvf2oVCL_FMkHS82p=hKhRq4xUPyLT_qhDd3dTicTWU-yWPGw@mail.gmail.com>
 <d37bb4f0-d8bd-665c-1d11-9f635b813881@arm.com>
 <ae16f2ef-ef5b-3445-42ed-d5bd73fdedbd@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <32957f94-2f0f-760d-7945-163447886e92@arm.com>
Date: Wed, 23 Oct 2019 18:01:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ae16f2ef-ef5b-3445-42ed-d5bd73fdedbd@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
Cc: Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMTAvMjAxOSAxNzoxMSwgT2xla3NhbmRyIHdyb3RlOgo+IAo+IE9uIDE2LjEwLjE5IDE4
OjA0LCBKdWxpZW4gR3JhbGwgd3JvdGU6CgpIaSwKCj4+PiBCZWxvdyBpcyBleGFtcGxlIGZyb20g
bGludXgga2VybmVsIHNvdXJjZXM6Cj4+Pgo+Pj4gbGludXgvc291bmQvcHBjL2F3YWNzLmM6NzQx
OsKgwqDCoCBpZiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJQb3dlckJvb2szLDEiKQo+Pj4g
bGludXgvc291bmQvcHBjL2F3YWNzLmM6NzQyOsKgwqDCoMKgwqDCoMKgIHx8Cj4+PiBvZl9tYWNo
aW5lX2lzX2NvbXBhdGlibGUoIlBvd2VyQm9vazMsMiIpKSB7Cj4+PiBsaW51eC9zb3VuZC9wcGMv
YXdhY3MuYzo3NzA6I2RlZmluZSBJU19QTTc1MDAKPj4+IChvZl9tYWNoaW5lX2lzX2NvbXBhdGli
bGUoIkFBUEwsNzUwMCIpIFwKPj4+IGxpbnV4L3NvdW5kL3BwYy9hd2Fjcy5jOjc3MTrCoMKgwqDC
oMKgwqDCoCB8fCBvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoIkFBUEwsODUwMCIpIFwKPj4+IGxp
bnV4L3NvdW5kL3BwYy9hd2Fjcy5jOjc3MjrCoMKgwqDCoMKgwqDCoCB8fCBvZl9tYWNoaW5lX2lz
X2NvbXBhdGlibGUoIkFBUEwsOTUwMCIpKQo+Pj4gLi4uCj4+PiBsaW51eC9hcmNoL2FybS9tYWNo
LW9tYXAyL3BkYXRhLXF1aXJrcy5jOjcwMzrCoMKgwqDCoMKgwqDCoCBpZgo+Pj4gKG9mX21hY2hp
bmVfaXNfY29tcGF0aWJsZShxdWlya3MtPmNvbXBhdGlibGUpKSB7Cj4+PiBsaW51eC9hcmNoL2Fy
bS9tYWNoLW9tYXAyL3BkYXRhLXF1aXJrcy5jOjcxNzrCoMKgwqAgaWYKPj4+IChvZl9tYWNoaW5l
X2lzX2NvbXBhdGlibGUoInRpLG9tYXAyNDIwIikgfHwKPj4+IGxpbnV4L2FyY2gvYXJtL21hY2gt
b21hcDIvcGRhdGEtcXVpcmtzLmM6NzE4Ogo+Pj4gb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJ0
aSxvbWFwMyIpKQo+Pj4gbGludXgvYXJjaC9hcm0vbWFjaC1vbWFwMi9wZGF0YS1xdWlya3MuYzo3
MjE6wqDCoMKgIGlmCj4+PiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJ0aSxvbWFwMyIpKQo+
Pj4gLi4uCj4+Pgo+Pj4gQWxzbyBzZWUgWzFdCj4+Pgo+Pj4gWzFdIAo+Pj4gaHR0cHM6Ly9zb3Vy
Y2UuY29kZWF1cm9yYS5vcmcvZXh0ZXJuYWwvaW14L2lteC14ZW4vY29tbWl0Lz9oPWlteF80LjE0
Ljk4XzIuMC4wX2dhJmlkPTZlNThkNDc4MjAzNjM5ZTcxZGEzZGE2OWZmZWFlM2ZhNWRjMDE5N2Ig
Cj4+Pgo+Pgo+PiBTbyB0aGlzIGlzIGEgZ3JlcCBmcm9tIExpbnV4LCBJIGhhdmUgYWxyZWFkeSBk
b25lIHRoYXQuIFdoYXQgSSBhbSBsb29raW5nIGF0IAo+PiBpcyBhbiBleGFjdCBkZXNjcmlwdGlv
biBvZiB5b3VyIHByb2JsZW0uIENhbiB5b3UgdGVsbCBtZSB3aGF0IHlvdSBhcmUgdHJ5aW5nIAo+
PiB0byBwYXNzdGhyb3VnaD8gQ2FuIHlvdSBhbHNvIHByb3ZpZGUgYSBwb2ludGVyIHRvIHRoZSBM
aW51eCBjb2RlIGNoZWNraW5nIHRoZSAKPj4gY29tcGF0aWJsZSBmb3IgeW91ciBwcm9ibGVtPwo+
IAo+IEkgaGF2ZSBubyBpZGVhIHdoZXRoZXIgaXQgaXMgb2sgb3Igbm90IHRvIHBhc3MgbWFjaGlu
ZS9Tb0MgY29tcGF0aWJsZSB0byBhIGd1ZXN0IAo+IGZyb20gdGhlIHNhZmV0eSBQb1YsIHNvIEkg
YW0gbm90IGdvaW5nIHRvIGNvbW1lbnQgcmVnYXJkaW5nIHNhZmV0eS4KPiBJIGp1c3Qgd291bGQg
bGlrZSB0byBwcm92aWRlIGRlc2NyaXB0aW9uIG9mIHRoZSBwcm9ibGVtIHdlIGNvdWxkIGZhY2Ug
d2hlbiBub3QgCj4gcGFzc2luZyBtYWNoaW5lL1NvQyBjb21wYXRpYmxlIHRvIGEgZ3Vlc3Qgd2hp
Y2ggcnVucyByZWFsIEgvVyAobm90IFBWKSBkZXZpY2VzLgo+IAo+IC4uLgo+IAo+IEkgaGF2ZSBq
dXN0IGNoZWNrZWQgd2l0aG91dCBwYXNzaW5nIHJlYWwgImR0X2NvbXBhdGlibGUiIHRvIGEgZ3Vl
c3Qgb24gdGhlIE0zTiAKPiBib2FyZC4gU28sIHRoaXMgY2FuIGJlIGNvbnNpZGVyZWQgYXMgcmVh
bCBleGFtcGxlLgo+IEkgbm90aWNlZCB0aGF0IGF0IGxlYXN0IHR3byBIL1cgZGV2aWNlcyAod2hp
Y2ggYXJlIHBhc3MgdGhyb3VnaGVkIHRvIHRoZSBndWVzdCkgCj4gc3VmZmVyZWQgZnJvbSB0aGUg
bGFjayBvZiBjb21wYXRpYmxlOiBzZGhpX2ludGVybmFsX2RtYWMgYW5kIHhoY2ktaGNkLiBBbmQg
YXMgCj4gcmVzdWx0IFNEIGNhcmQgYW5kIFVTQiBob3N0IGFyZSBub3QgZnVuY3Rpb25hbC4KPiBX
aHkgdGhpcyBoYXBwZW5lZD8gVGhlcmUgaXMgU29DIElkZW50aWZpY2F0aW9uIGZyYW1ld29yayB3
aGljaCBwdXJwb3NlIGlzIHRvIAo+IGRldGVjdCBTb0MncyBpZC9yZXZpc2lvbiBmb3IgdGhlIGZ1
dHVyZSB1c2UgaW4gZHJpdmVycyB0byBwcm9wZXJseSBhcHBseSBzb21lIAo+IHF1aXJrcyAoaWYg
bmVlZGVkKS4gQW5kIHdpdGhvdXQgcmVhbCBjb21wYXRpYmxlIHN0cmluZyBpbiBwbGFjZSB0aGUg
ZnJhbWV3b3JrIGZhaWxzCj4gdG8gcHJvY2VlZCBsZWF2aW5nIHRoZSBTb0MgYXR0cmlidXRlcyB1
bnJlZ2lzdGVyZWQgWzFdLiBUaGlzIHJlc3VsdHMgaW4gU0RISSAKPiBJbnRlcm5hbCBETUFDIGNv
bnRyb2xsZXIgZmFpbHMgdG8gaWRlbnRpZnkgdGhlIFNvQyBbMl0sIHNvIGNhbid0IG9wZXJhdGUu
CgpUaGFuayB5b3UgZm9yIGdpdmluZyBtb3JlIGluZm9ybWF0aW9uIG9uIHRoZSBwcm9ibGVtLgoK
VXN1YWxseSB3aGVuIHlvdSBoYXZlIHF1aXJrcyByZXF1aXJlZCBmb3IgYSBkZXZpY2UsIHRoZXkg
d2lsbCBiZSB0aGUgc2FtZSBmb3IgCmFsbCBwbGF0Zm9ybXMgdXNpbmcgdGhlIHNhbWUgZGV2aWNl
IHJldmlzaW9uLiBTbyBpdCBmZWVscyBhIGJpdCBvZGQgdG8gYmFzZSBpdCAKb24gYSBTb0MgSUQv
cmV2aXNpb24uCgpUaGUgcHJvYmxlbSB5b3UgZGVzY3JpYmVkIGFib3ZlIHdvdWxkIGFsc28gaGFw
cGVuIGlmIHlvdSBtb3ZlIHRvIGEgbmV3IFNvQyB3aXRoIAp0aGUgc2FtZSBkZXZpY2UgcmV2aXNp
b24uIFlvdSB3aWxsIG5lZWQgdG8gdXBkYXRlIExpbnV4IGluIG9yZGVyIHRvIHVzZSB0aGF0IGRl
dmljZS4KClhlbiBWTSBpcyBjb21wYXJhYmxlIHRvIGEgIlNvQyIuIEZvciBpbnN0YW5jZSwgd2Ug
bmVlZGVkIHRvIGFkZCBYZW4ga25vd2xlZGdlIGluIApMaW51eCBzbyBpdCBjYW4gYm9vdC4gSW4g
dGhlIGNhc2Ugb2YgRGV2aWNlIGFzc2lnbm1lbnQsIHlvdSBjYW4gdmlldyB0aGlzIGFzIGEgCmRl
cml2YXRpb24gb2YgWGVuIFZNIChsZXQncyBjYWxsIGl0ICJYZW4gVk0gQmFyIikuCgpBcyBmb3Ig
YW55IG5ldyBTb0MsIGlmIHlvdSB3YW50IHlvdXIgT1MgdG8gZnVuY3Rpb24gb24gIlhlbiBWTSBC
YXIiLCB5b3UgbWF5IGJlIApyZXF1aXJlZCB0byBtb2RpZnkgaXQuCgpUaGUgYXBwcm9hY2ggc3Vn
Z2VzdGVkIGluIHRoaXMgcGF0Y2ggbWF5IHdvcmsgZm9yIHlvdSwgYnV0IEkgZG9uJ3QgdGhpbmsg
dGhpcyBpcyAKYW4gYXBwcm9hY2ggdGhhdCBzaG91bGQgYmUgdGFrZW4gYnkgWGVuIHVwc3RyZWFt
LiBJbnN0ZWFkLCB3ZSBzaG91bGQgd29yayB3aXRoIAp0aGUgY29tbXVuaXR5IHRvIHJlcGxhY2Ug
cXVpcmtzIGJhc2VkIG9uIFNvQy9JRCB3aXRoIHF1aXJrcyBiYXNlZCBvbiBkZXZpY2UgCmJpbmRp
bmcgcHJvcGVydHkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
