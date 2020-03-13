Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD81844C6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:24:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jChRk-0000jY-Gj; Fri, 13 Mar 2020 10:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jChRj-0000jN-BL
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:21:39 +0000
X-Inumbo-ID: 6c7f9d70-6514-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c7f9d70-6514-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 10:21:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 945C9B0AE;
 Fri, 13 Mar 2020 10:21:37 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <24170.26671.783256.460525@mariner.uk.xensource.com>
 <20200312175500.GL24458@Air-de-Roger.citrite.net>
 <72bacc9c-a64f-9165-c451-ff5b977a36cb@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ddb49157-d46f-adda-785d-17c5c0afa4e2@suse.com>
Date: Fri, 13 Mar 2020 11:21:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <72bacc9c-a64f-9165-c451-ff5b977a36cb@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAgMTA6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjAzLjIwMjAgMTg6
NTUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0IDA0
OjQ5OjUxUE0gKzAwMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+Pj4gTGludXggc3RhYmxlIGJyYW5j
aGVzLCBhbmQgTGludXggdXBzdHJlYW0gdGlwLCBhcmUgYmFkbHkgYnJva2VuIGFuZAo+Pj4gaGF2
ZSBiZWVuIGZvciBtb250aHMuICBBcHBhcmVudGx5IG5vLW9uZSBpcyBhYmxlIHRvIChvciBoYXMg
dGltZSB0bykKPj4+IHRvIGludmVzdGlnYXRlIGFuZCBmaXguCj4+Pgo+Pj4gICAgbGludXgtNC40
ICAgICAgICAgIDIxOCBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVkCj4+PiAgICBsaW51eC00
LjkgICAgICAgICAgMTM0IGRheXMgICAgICAgICB0byBiZSBzdXNwZW5kZWQKPj4+ICAgIGxpbnV4
LTQuMTQgICAgICAgICAxMzQgZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRlZAo+Pj4gICAgbGlu
dXgtNC4xOSAgICAgICAgIDEzNCBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVkCj4+PiAgICBs
aW51eC01LjQgICAgICAgICAgIDU1IGRheXMKPj4+ICAgIGxpbnV4LWFybS14ZW4gICAgIHVwIHRv
IGRhdGUKPj4+ICAgIGxpbnV4LWxpbnVzICAgICAgICAzNzIgZGF5cyAgICAgICAgIHRvIGJlIHN1
c3BlbmRlZAo+Pj4KPj4+IFRoZXNlIGFyZSB0aW1lcyBzaW5jZSB0aGUgbGFzdCBwdXNoIC0gaWUs
IGhvdyBsb25nIGl0IGhhcyBiZWVuIGJyb2tlbi4KPj4+IEV2aWRlbnRseSBuby1vbmUgaXMgcGF5
aW5nIGFueSBhdHRlbnRpb24gdG8gdGhpcy5bMV0gIEkgbG9va2VkIGF0IHRoZQo+Pj4gcmVwb3J0
cyBteXNlbGYgYW5kOgo+Pj4KPj4+IE5lc3RlZCBIVk0gaXMgYnJva2VuIG9uIEludGVsIGluIGFs
bCBvZiB0aGUgNC54IGJyYW5jaGVzLgo+Pgo+PiBGV0lXLCBpdCdzIHRoZSBEZWJpYW4gaW5zdGFs
bGVyIGtlcm5lbCB0aGUgb25lIHRoYXQgY3Jhc2hlcyBBRkFJQ1QsCj4+IGFsbCB0aGUgZmFpbHVy
ZXMgYXJlOgo+Pgo+PiBbICAgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9uIDQuOS4wLTYtYW1kNjQg
KGRlYmlhbi1rZXJuZWxAbGlzdHMuZGViaWFuLm9yZykgKGdjYyB2ZXJzaW9uIDYuMy4wIDIwMTcw
NTE2IChEZWJpYW4gNi4zLjAtMTgrZGViOXUxKSApICMxIFNNUCBEZWJpYW4gNC45LjgyLTErZGVi
OXUzICgyMDE4LTAzLTAyKQo+PiBbLi4uXQo+PiBbICAgIDAuMDAwMDAwXSBjbG9ja3NvdXJjZTog
aHBldDogbWFzazogMHhmZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9u
czogMzA1ODAxNjcxNDQgbnMKPj4gWyAgICAwLjAwMDAwMF0gdHNjOiBGYXN0IFRTQyBjYWxpYnJh
dGlvbiBmYWlsZWQKPj4gWyAgICAwLjAwMDAwMF0gdHNjOiBVbmFibGUgdG8gY2FsaWJyYXRlIGFn
YWluc3QgUElUCj4+IFsgICAgMC4wMDAwMDBdIHRzYzogSFBFVC9QTVRJTUVSIGNhbGlicmF0aW9u
IGZhaWxlZAo+PiBbICAgIDAuMDAwMDAwXSBkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBTTVAKPj4g
WyAgICAwLjAwMDAwMF0gTW9kdWxlcyBsaW5rZWQgaW46Cj4+IFsgICAgMC4wMDAwMDBdIENQVTog
MCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDQuOS4wLTYtYW1kNjQgIzEgRGVi
aWFuIDQuOS44Mi0xK2RlYjl1Mwo+PiBbICAgIDAuMDAwMDAwXSBIYXJkd2FyZSBuYW1lOiBYZW4g
SFZNIGRvbVUsIEJJT1MgNC4xNC11bnN0YWJsZSAwMy8xMS8yMDIwCj4+IFsgICAgMC4wMDAwMDBd
IHRhc2s6IGZmZmZmZmZmYWI2MTE1MDAgdGFzay5zdGFjazogZmZmZmZmZmZhYjYwMDAwMAo+PiBb
ICAgIDAuMDAwMDAwXSBSSVA6IDAwMTA6WzxmZmZmZmZmZmFhYTU5ZTFmPl0gIFs8ZmZmZmZmZmZh
YWE1OWUxZj5dIHB2Y2xvY2tfdHNjX2toeisweGYvMHgzMAo+IAo+IFNlZWluZyB0aGlzIGFuZCAu
Li4KPiAKPj4gWyAgICAwLjAwMDAwMF0gUlNQOiAwMDAwOmZmZmZmZmZmYWI2MDNmMzggIEVGTEFH
UzogMDAwMTAyNDYKPj4gWyAgICAwLjAwMDAwMF0gUkFYOiAwMDBmNDI0MDAwMDAwMDAwIFJCWDog
ZmZmZmZmZmZmZmZmZmZmZiBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAKPj4gWyAgICAwLjAwMDAwMF0g
UkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDI0NiBSREk6IGZmZmZmZmZm
YWI5MzkwMjAKPj4gWyAgICAwLjAwMDAwMF0gUkJQOiBmZmZmOTM4MDZlOGYxNTQwIFIwODogMDAw
MDAwMDAzYTYzNzM3NCBSMDk6IDZmNjk3NDYxNzI2MjY5NmMKPj4gWyAgICAwLjAwMDAwMF0gUjEw
OiAwMDAwMDAzMmYzYWY2ZGNkIFIxMTogNGQ1MDJmNTQ0NTUwNDgyMCBSMTI6IGZmZmZmZmZmYWI3
ZGM5MjAKPj4gWyAgICAwLjAwMDAwMF0gUjEzOiBmZmZmZmZmZmFiN2U4MmUwIFIxNDogMDAwMDAw
MDAwMDAxNDZmMCBSMTU6IDAwMDAwMDAwMDAwMDAwOGUKPj4gWyAgICAwLjAwMDAwMF0gRlM6ICAw
MDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5MzgwNmU2MDAwMDAoMDAwMCkga25sR1M6MDAw
MDAwMDAwMDAwMDAwMAo+PiBbICAgIDAuMDAwMDAwXSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4+IFsgICAgMC4wMDAwMDBdIENSMjogZmZmZjkzODA2
NWYzYTAwMCBDUjM6IDAwMDAwMDAwMjVjMDgwMDAgQ1I0OiAwMDAwMDAwMDAwMDQwNmIwCj4+IFsg
ICAgMC4wMDAwMDBdIFN0YWNrOgo+PiBbICAgIDAuMDAwMDAwXSAgZmZmZmZmZmZhYjc0YjFiNiBm
ZmZmOTM4MDZlOGYxNTQwIGZmZmZmZmZmYWI3ZGM5MjAgYmE4MWU1MzdiYTgxZTUxMgo+PiBbICAg
IDAuMDAwMDAwXSAgZmZmZmZmZmZmZmZmZmZmZiBmZmZmOTM4MDZlOGYxNTQwIGZmZmZmZmZmYWI3
M2RlYjYgZmZmZmZmZmZhYjdlODJlMAo+PiBbICAgIDAuMDAwMDAwXSAgMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDIwIDAwMDBmZmZmZmZmZmFiNzMgMDAwMDAwMDBmZmZmZmZmZgo+PiBb
ICAgIDAuMDAwMDAwXSBDYWxsIFRyYWNlOgo+PiBbICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZmFi
NzRiMWI2Pl0gPyB0c2NfaW5pdCsweDM5LzB4MjViCj4gCj4gLi4uIHRoaXMgYW5kIGxvb2tpbmcg
YXQgeGVuX3RzY19raHooKSwgaXNuJ3QgaXQgc3VwcG9zZWQgdG8gdXNlCj4gcGVyX2NwdSh4ZW5f
dmNwdSwgMCkgaW5zdGVhZCwgaW4gY2FzZSB2Q1BVIGluZm8gZ290IHJlbG9jYXRlZD8KPiAoQ29k
ZSBsb29rcyB0byBiZSB0aGUgc2FtZSBpbiA0LjkgYW5kIDUuNS4gSSdkIGFsc28gcXVlc3Rpb24K
PiB0aGUgaGFyZC1jb2RlZCB6ZXJvIGluIHRoZXJlLCBidXQgdGhhdCdzIGEgZGlmZmVyZW50IHRv
cGljLikKCkl0IHNob3VsZCB1c2UgcGVyX2NwdSh4ZW5fdmNwdSwgMCksIGJ1dCBPVE9IIGl0IHNo
b3VsZG4ndCBtYXR0ZXIgdGhhdAptdWNoIGlmIGl0IGRvZXNuJ3QsIGFzIHRoZSB0aW1lIGluZm9y
bWF0aW9uIGZyb20gdGhlIHNoYXJlZCBpbmZvIHBhZ2UKd291bGRuJ3QgZ28gYXdheS4KClNlZWlu
ZyBhIHplcm8gZGl2aXNvciBoZXJlIGluZGljYXRlcyB0aGF0IEhZUEVSVklTT1Jfc2hhcmVkX2lu
Zm8gbWlnaHQKc3RpbGwgcG9pbnQgdG8gdGhlIGR1bW15IHNoYXJlZCBpbmZvIHN0cnVjdHVyZS4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
