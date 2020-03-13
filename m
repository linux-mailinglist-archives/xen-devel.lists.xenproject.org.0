Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E718438A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:17:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgNx-0001Nt-RI; Fri, 13 Mar 2020 09:13:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCgNw-0001No-MW
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:13:40 +0000
X-Inumbo-ID: ed7c4f2c-650a-11ea-b2a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed7c4f2c-650a-11ea-b2a9-12813bfff9fa;
 Fri, 13 Mar 2020 09:13:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F4E6ABEF;
 Fri, 13 Mar 2020 09:13:38 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <24170.26671.783256.460525@mariner.uk.xensource.com>
 <20200312175500.GL24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72bacc9c-a64f-9165-c451-ff5b977a36cb@suse.com>
Date: Fri, 13 Mar 2020 10:13:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312175500.GL24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] Stopping much Linux testing in Xen Project CI
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
Cc: Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAyMCAxODo1NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIE1h
ciAxMiwgMjAyMCBhdCAwNDo0OTo1MVBNICswMDAwLCBJYW4gSmFja3NvbiB3cm90ZToKPj4gTGlu
dXggc3RhYmxlIGJyYW5jaGVzLCBhbmQgTGludXggdXBzdHJlYW0gdGlwLCBhcmUgYmFkbHkgYnJv
a2VuIGFuZAo+PiBoYXZlIGJlZW4gZm9yIG1vbnRocy4gIEFwcGFyZW50bHkgbm8tb25lIGlzIGFi
bGUgdG8gKG9yIGhhcyB0aW1lIHRvKQo+PiB0byBpbnZlc3RpZ2F0ZSBhbmQgZml4Lgo+Pgo+PiAg
IGxpbnV4LTQuNCAgICAgICAgICAyMTggZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRlZAo+PiAg
IGxpbnV4LTQuOSAgICAgICAgICAxMzQgZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRlZAo+PiAg
IGxpbnV4LTQuMTQgICAgICAgICAxMzQgZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRlZAo+PiAg
IGxpbnV4LTQuMTkgICAgICAgICAxMzQgZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRlZAo+PiAg
IGxpbnV4LTUuNCAgICAgICAgICAgNTUgZGF5cwo+PiAgIGxpbnV4LWFybS14ZW4gICAgIHVwIHRv
IGRhdGUKPj4gICBsaW51eC1saW51cyAgICAgICAgMzcyIGRheXMgICAgICAgICB0byBiZSBzdXNw
ZW5kZWQKPj4KPj4gVGhlc2UgYXJlIHRpbWVzIHNpbmNlIHRoZSBsYXN0IHB1c2ggLSBpZSwgaG93
IGxvbmcgaXQgaGFzIGJlZW4gYnJva2VuLgo+PiBFdmlkZW50bHkgbm8tb25lIGlzIHBheWluZyBh
bnkgYXR0ZW50aW9uIHRvIHRoaXMuWzFdICBJIGxvb2tlZCBhdCB0aGUKPj4gcmVwb3J0cyBteXNl
bGYgYW5kOgo+Pgo+PiBOZXN0ZWQgSFZNIGlzIGJyb2tlbiBvbiBJbnRlbCBpbiBhbGwgb2YgdGhl
IDQueCBicmFuY2hlcy4KPiAKPiBGV0lXLCBpdCdzIHRoZSBEZWJpYW4gaW5zdGFsbGVyIGtlcm5l
bCB0aGUgb25lIHRoYXQgY3Jhc2hlcyBBRkFJQ1QsCj4gYWxsIHRoZSBmYWlsdXJlcyBhcmU6Cj4g
Cj4gWyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA0LjkuMC02LWFtZDY0IChkZWJpYW4ta2Vy
bmVsQGxpc3RzLmRlYmlhbi5vcmcpIChnY2MgdmVyc2lvbiA2LjMuMCAyMDE3MDUxNiAoRGViaWFu
IDYuMy4wLTE4K2RlYjl1MSkgKSAjMSBTTVAgRGViaWFuIDQuOS44Mi0xK2RlYjl1MyAoMjAxOC0w
My0wMikKPiBbLi4uXQo+IFsgICAgMC4wMDAwMDBdIGNsb2Nrc291cmNlOiBocGV0OiBtYXNrOiAw
eGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiAzMDU4MDE2NzE0
NCBucwo+IFsgICAgMC4wMDAwMDBdIHRzYzogRmFzdCBUU0MgY2FsaWJyYXRpb24gZmFpbGVkCj4g
WyAgICAwLjAwMDAwMF0gdHNjOiBVbmFibGUgdG8gY2FsaWJyYXRlIGFnYWluc3QgUElUCj4gWyAg
ICAwLjAwMDAwMF0gdHNjOiBIUEVUL1BNVElNRVIgY2FsaWJyYXRpb24gZmFpbGVkCj4gWyAgICAw
LjAwMDAwMF0gZGl2aWRlIGVycm9yOiAwMDAwIFsjMV0gU01QCj4gWyAgICAwLjAwMDAwMF0gTW9k
dWxlcyBsaW5rZWQgaW46Cj4gWyAgICAwLjAwMDAwMF0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2Fw
cGVyLzAgTm90IHRhaW50ZWQgNC45LjAtNi1hbWQ2NCAjMSBEZWJpYW4gNC45LjgyLTErZGViOXUz
Cj4gWyAgICAwLjAwMDAwMF0gSGFyZHdhcmUgbmFtZTogWGVuIEhWTSBkb21VLCBCSU9TIDQuMTQt
dW5zdGFibGUgMDMvMTEvMjAyMAo+IFsgICAgMC4wMDAwMDBdIHRhc2s6IGZmZmZmZmZmYWI2MTE1
MDAgdGFzay5zdGFjazogZmZmZmZmZmZhYjYwMDAwMAo+IFsgICAgMC4wMDAwMDBdIFJJUDogMDAx
MDpbPGZmZmZmZmZmYWFhNTllMWY+XSAgWzxmZmZmZmZmZmFhYTU5ZTFmPl0gcHZjbG9ja190c2Nf
a2h6KzB4Zi8weDMwCgpTZWVpbmcgdGhpcyBhbmQgLi4uCgo+IFsgICAgMC4wMDAwMDBdIFJTUDog
MDAwMDpmZmZmZmZmZmFiNjAzZjM4ICBFRkxBR1M6IDAwMDEwMjQ2Cj4gWyAgICAwLjAwMDAwMF0g
UkFYOiAwMDBmNDI0MDAwMDAwMDAwIFJCWDogZmZmZmZmZmZmZmZmZmZmZiBSQ1g6IDAwMDAwMDAw
MDAwMDAwMDAKPiBbICAgIDAuMDAwMDAwXSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAw
MDAwMDAwMDAwMjQ2IFJESTogZmZmZmZmZmZhYjkzOTAyMAo+IFsgICAgMC4wMDAwMDBdIFJCUDog
ZmZmZjkzODA2ZThmMTU0MCBSMDg6IDAwMDAwMDAwM2E2MzczNzQgUjA5OiA2ZjY5NzQ2MTcyNjI2
OTZjCj4gWyAgICAwLjAwMDAwMF0gUjEwOiAwMDAwMDAzMmYzYWY2ZGNkIFIxMTogNGQ1MDJmNTQ0
NTUwNDgyMCBSMTI6IGZmZmZmZmZmYWI3ZGM5MjAKPiBbICAgIDAuMDAwMDAwXSBSMTM6IGZmZmZm
ZmZmYWI3ZTgyZTAgUjE0OiAwMDAwMDAwMDAwMDE0NmYwIFIxNTogMDAwMDAwMDAwMDAwMDA4ZQo+
IFsgICAgMC4wMDAwMDBdIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOTM4MDZl
NjAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDAuMDAwMDAwXSBDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gWyAgICAwLjAw
MDAwMF0gQ1IyOiBmZmZmOTM4MDY1ZjNhMDAwIENSMzogMDAwMDAwMDAyNWMwODAwMCBDUjQ6IDAw
MDAwMDAwMDAwNDA2YjAKPiBbICAgIDAuMDAwMDAwXSBTdGFjazoKPiBbICAgIDAuMDAwMDAwXSAg
ZmZmZmZmZmZhYjc0YjFiNiBmZmZmOTM4MDZlOGYxNTQwIGZmZmZmZmZmYWI3ZGM5MjAgYmE4MWU1
MzdiYTgxZTUxMgo+IFsgICAgMC4wMDAwMDBdICBmZmZmZmZmZmZmZmZmZmZmIGZmZmY5MzgwNmU4
ZjE1NDAgZmZmZmZmZmZhYjczZGViNiBmZmZmZmZmZmFiN2U4MmUwCj4gWyAgICAwLjAwMDAwMF0g
IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAyMCAwMDAwZmZmZmZmZmZhYjczIDAwMDAw
MDAwZmZmZmZmZmYKPiBbICAgIDAuMDAwMDAwXSBDYWxsIFRyYWNlOgo+IFsgICAgMC4wMDAwMDBd
ICBbPGZmZmZmZmZmYWI3NGIxYjY+XSA/IHRzY19pbml0KzB4MzkvMHgyNWIKCi4uLiB0aGlzIGFu
ZCBsb29raW5nIGF0IHhlbl90c2Nfa2h6KCksIGlzbid0IGl0IHN1cHBvc2VkIHRvIHVzZQpwZXJf
Y3B1KHhlbl92Y3B1LCAwKSBpbnN0ZWFkLCBpbiBjYXNlIHZDUFUgaW5mbyBnb3QgcmVsb2NhdGVk
PwooQ29kZSBsb29rcyB0byBiZSB0aGUgc2FtZSBpbiA0LjkgYW5kIDUuNS4gSSdkIGFsc28gcXVl
c3Rpb24KdGhlIGhhcmQtY29kZWQgemVybyBpbiB0aGVyZSwgYnV0IHRoYXQncyBhIGRpZmZlcmVu
dCB0b3BpYy4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
