Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E115F611C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 08:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416615.661252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogKVl-00085P-F9; Thu, 06 Oct 2022 06:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416615.661252; Thu, 06 Oct 2022 06:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogKVl-00081z-Bu; Thu, 06 Oct 2022 06:37:37 +0000
Received: by outflank-mailman (input) for mailman id 416615;
 Thu, 06 Oct 2022 06:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogKVk-00081t-6s
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 06:37:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c731f31-4541-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 08:37:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D10D219E5;
 Thu,  6 Oct 2022 06:37:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FD521376E;
 Thu,  6 Oct 2022 06:37:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zWdhBq53PmMuAwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 06:37:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5c731f31-4541-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665038254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0N0EjVsoEiBxet6Ymx5PiI6kbwHet0IlX3Q1zJFWCc=;
	b=VoRPVClIdrXpXBr88Uc4EIetWgvvC9kuuh+u9Yp2k+CVSJOzl9s7MhSQKvW4A97ATwagN3
	gPSKZ3iVD7igwaPZb9pkeMxJQA4FZYCCto050SloLKurfKbkFn4k2/7RbCnDLL4sY+IqHc
	aLlC64VDc+OCu7OXjYYYiW3B2F7rCJc=
Message-ID: <15abd7fd-8fc6-5246-5c37-7e6423b025c5@suse.com>
Date: Thu, 6 Oct 2022 08:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com> <Yz2L9eTdbA3vS43g@mail-itl>
 <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com> <Yz2kKU5qEvD25iJX@mail-itl>
 <a8366482-ba75-19e7-4e82-ba968ec9ddcb@suse.com> <Yz21RxJ9xXP8ODb0@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
In-Reply-To: <Yz21RxJ9xXP8ODb0@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d55YQkVR09uIb8CsSygj709H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d55YQkVR09uIb8CsSygj709H
Content-Type: multipart/mixed; boundary="------------BkOKCgskQkPAePMqf4ZCGFtU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <15abd7fd-8fc6-5246-5c37-7e6423b025c5@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com> <Yz2L9eTdbA3vS43g@mail-itl>
 <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com> <Yz2kKU5qEvD25iJX@mail-itl>
 <a8366482-ba75-19e7-4e82-ba968ec9ddcb@suse.com> <Yz21RxJ9xXP8ODb0@mail-itl>
In-Reply-To: <Yz21RxJ9xXP8ODb0@mail-itl>

--------------BkOKCgskQkPAePMqf4ZCGFtU
Content-Type: multipart/mixed; boundary="------------3Gr6CaA0yyRf4wh8dOqwqRoq"

--------------3Gr6CaA0yyRf4wh8dOqwqRoq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjIgMTg6NDgsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDU6NDU6NTZQTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IE9uIDA1LjEwLjIyIDE3OjM1LCBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgd3JvdGU6DQo+Pj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDU6MDQ6MjlQ
TSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMDUuMTAuMjIgMTU6NTEs
IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4+IE9uIFdlZCwgT2N0
IDA1LCAyMDIyIGF0IDAzOjM0OjU2UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
Pj4+Pj4gT24gMDUuMTAuMjIgMTU6MjUsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3
cm90ZToNCj4+Pj4+Pj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDI6NTc6MDFQTSArMDIw
MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4+Pj4+IE9uIDA1LjEwLjIyIDE0OjQxLCBN
YXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+Pj4+Pj4+Pj4gSGksDQo+Pj4+
Pj4+Pj4NCj4+Pj4+Pj4+PiBXaGVuIGJvb3RpbmcgWGVuIHdpdGggTGludXggZG9tMCBuZXN0
ZWQgdW5kZXIgS1ZNLA0KPj4+Pj4+Pj4+IENPTkZJR19YRU5fVklSVElPX0ZPUkNFX0dSQU5U
PXkgbWFrZXMgaXQgdW5hYmxlIHRvIHVzZSB2aXJ0aW8gZGV2aWNlcw0KPj4+Pj4+Pj4+IHBy
b3ZpZGVkIGJ5IEwwIGh5cGVydmlzb3IgKEtWTSB3aXRoIHFlbXUpLiBXaXRoIFBWIGRvbTAs
IGdyYW50cyBhcmUNCj4+Pj4+Pj4+PiByZXF1aXJlZCBmb3IgdmlydGlvIGV2ZW4gaWYganVz
dCBDT05GSUdfWEVOX1ZJUlRJTyBpcyBlbmFibGVkLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4g
VGhpcyBpcyBwcm9iYWJseSB1bmNvbW1vbiBjb3JuZXIgY2FzZSwgYnV0IG9uZSB0aGF0IGhh
cyBiaXR0ZW4gbWUgaW4gbXkNCj4+Pj4+Pj4+PiBDSSBzZXR1cC4uLiBJIHRoaW5rIFhlbiBz
aG91bGQgc2V0IHNtYXJ0ZXINCj4+Pj4+Pj4+PiB2aXJ0aW9fcmVxdWlyZV9yZXN0cmljdGVk
X21lbV9hY2MoKSwgdGhhdCBlbmZvcmNlcyBpdCBvbmx5IGZvciBkZXZpY2VzDQo+Pj4+Pj4+
Pj4gcmVhbGx5IHByb3ZpZGVkIGJ5IGFub3RoZXIgWGVuIFZNIChub3QgYnkgdGhlICJvdXRl
ciBob3N0IiksIGJ1dCBJJ20gbm90DQo+Pj4+Pj4+Pj4gc3VyZSBob3cgdGhhdCBjb3VsZCBi
ZSBkb25lLiBBbnkgaWRlYXM/DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJdCBz
aG91bGQgYmUgcG9zc2libGUgdG8gYWRkIGEgYm9vdCBwYXJhbWV0ZXIgZm9yIHRoYXQgcHVy
cG9zZS4gVXNpbmcgaXQNCj4+Pj4+Pj4+IHdvdWxkIG9wZW4gYSBzZWN1cml0eSBob2xlLCB0
aG91Z2ggKGJhc2ljYWxseSBsaWtlIGFsbCBQQ0kgcGFzc3Rocm91Z2ggdG8NCj4+Pj4+Pj4+
IFBWIGd1ZXN0cykuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFdoYXQgYWJvdXQgZXhjbHVkaW5nIGp1
c3QgZG9tMD8gQXQgbGVhc3QgY3VycmVudGx5LCB0aGVyZSBpcyBubyB3YXkgZm9yDQo+Pj4+
Pj4+IGRvbTAgdG8gc2VlIHZpcnRpbyBkZXZpY2VzIHByb3ZpZGVkIGJ5IGFub3RoZXIgWGVu
IGRvbVUuDQo+Pj4+Pj4NCj4+Pj4+PiBFdmVuIG5vdCB2aWEgaG90cGx1Zz8NCj4+Pj4+DQo+
Pj4+PiBUaGF0J3Mgd2h5IEkgc2FpZCAiY3VycmVudGx5IiwgSUlVQyBob3RwbHVnIG9mIHZp
cnRpbyBkZXZpY2VzIHVuZGVyIFhlbg0KPj4+Pj4gZG9lc24ndCB3b3JrIHlldCwgbm8/DQo+
Pj4+PiBXaXRoIGhvdHBsdWcgd29ya2luZywgaXQgd291bGQgbmVlZCB0byBiZSBhIHByb3Bl
ciBkZXRlY3Rpb24gd2hlcmUgdGhlDQo+Pj4+PiBiYWNrZW5kIGxpdmVzLCBhbmQgcHJvYmFi
bHkgd2l0aCBzb21lIGV4dHJhIGNvbnNpZGVyYXRpb25zIHJlIFhlbiBvbg0KPj4+Pj4gWGVu
IChiYXNlZCBvbiBiZWxvdywgcHYtc2hpbSBjb3VsZCB1c2UgZ3JhbnRzKS4NCj4+Pj4NCj4+
Pj4gQXMgc3RhdGVkIGJlZm9yZSwgdGhpcyBpc24ndCBhIHByb2JsZW0gc3BlY2lmaWMgdG8g
dmlydGlvIGRldmljZXMuIFRoZSBzYW1lDQo+Pj4+IGFwcGxpZXMgdG8gWGVuIFBWIGRldmlj
ZXMuDQo+Pj4NCj4+PiBXaHkgaXMgdGhhdCBhbiBpc3N1ZSBmb3IgWGVuIFBWIGRldmljZXM/
IFRoZXkgYWx3YXlzIHVzZSBncmFudHMsIHNvIG5vIG5lZWQNCj4+PiBmb3IgZXhjZXB0aW9u
LiBCdXQgbW9yZSByZWxldmFudCBoZXJlLCB0aGVyZSBpcyBubyBwcm90b2NvbCBmb3IgTDAN
Cj4+PiBoeXBlcnZpc29yICh0aGF0IHdvdWxkIG5lZWQgdG8gYmUgWGVuKSB0byBwcm92aWRl
IFBWIGRldmljZSB0byBuZXN0ZWQgTDENCj4+PiBndWVzdCAoYmVzaWRlcyBwdi1zaGltIGNh
c2UsIHdoaWNoIGlzIGFscmVhZHkgaGFuZGxlZCksIHNvIEwxIGd1ZXN0DQo+Pj4gY2Fubm90
IGNvbmZ1c2UgUFYgZGV2aWNlIHByb3ZpZGVkIGJ5IEwwIGFuZCBMMS4NCj4+DQo+PiBUaGF0
J3MgdGhlIHBvaW50LiBUb2RheSB1c2luZyB2aXJ0aW8gdGhlIHdheSB5b3UgYXJlIHVzaW5n
IGl0IGlzIHBvc3NpYmxlDQo+PiBvbmx5IGJlY2F1c2UgdmlydGlvIGRldmljZXMgZG9uJ3Qg
aGF2ZSB0aGUgc2VjdXJpdHkgZmVhdHVyZXMgb2YgWGVuIFBWDQo+PiBkZXZpY2VzLiBXaXRo
IGFkZGluZyBncmFudCBzdXBwb3J0IGZvciB2aXJ0aW8gZGV2aWNlcyB0aGlzIGhhcyBjaGFu
Z2VkLg0KPj4NCj4+IEJUVywgeW91IGNhbiBoYXZlIHRoZSBvbGQgdmlydGlvIGJlaGF2aW9y
IGJhY2sgYnkgbm90IGVuYWJsaW5nDQo+PiBDT05GSUdfWEVOX1ZJUlRJTy4NCj4gDQo+IFll
cywgSSBrbm93LCBhbmQgY3VycmVudGx5IEknbSBkb2luZyBpdC4gQnV0IGF0IHNvbWUgcG9p
bnQgSSdkIGxpa2UgdG8NCj4gYmUgYWJsZSB0byBlbmFibGUgQ09ORklHX1hFTl9WSVJUSU8g
d2l0aG91dCBicmVha2luZyB0aGUgbmVzdGVkIHZpcnQNCj4gY2FzZS4gSWRlYWxseSBLVk0g
dmlydGlvIGRldmljZXMgd291bGQgdXNlIHNvbWV0aGluZyBsaWtlIGdyYW50cywgYW5kDQo+
IHRoYXQgdGhpbmcgd291bGQgd29yayBldmVuIHRocm91Z2ggbmVzdGVkIHZpcnQsIGJ1dCBJ
IGRvbid0IHRoaW5rIHRoYXQncw0KPiBzdHJpY3RseSBuZWNlc3NhcnkgZm9yIGVuc3VyaW5n
IG5ldyBzZWN1cml0eSBwcm9wZXJ0aWVzIG9mIHZpcnRpbw0KPiBkZXZpY2VzIHdoZXJlIHRo
ZXkgY2FuIGJlIGVuZm9yY2VkLg0KPiANCj4+Pj4+IEZvciBtZSBzcGVjaWZpY2FsbHksIGEg
Y29tbWFuZCBsaW5lIG9wdGlvbiB3b3VsZCB3b3JrIChiZWNhdXNlIEkgZG9uJ3QNCj4+Pj4+
IHVzZSBYZW4tYmFzZWQgdmlydGlvIGRldmljZXMgd2hlbiBuZXN0ZWQgdW5kZXIgS1ZNLCBv
ciBhbnl3aGVyZSBhdCBhbGwsDQo+Pj4+PiBhdCBsZWFzdCBub3QgeWV0KSwgYnV0IEkgY2Fu
IHNlZSBmdXR1cmUgY2FzZXMgd2hlcmUgeW91IGhhdmUgdmlydGlvDQo+Pj4+PiBkZXZpY2Vz
IGZyb20gYm90aCBMMCBhbmQgTDEgaW4gdGhlIHNhbWUgZ3Vlc3QsIGFuZCB0aGVuIGl0IHdv
dWxkbid0IGJlDQo+Pj4+PiB0aGF0IHNpbXBsZS4NCj4+Pj4NCj4+Pj4gTGV0cyB0aGluayBv
ZiBhIGdlbmVyYWwgc29sdXRpb24gY292ZXJpbmcgYWxsIFBWIGRldmljZXMgKFhlbiBhbmQg
dmlydGlvKS4NCj4+Pg0KPj4+IEluIGZhY3QsIEkgd29uZGVyIHdoYXQncyB0aGUgc2VjdXJp
dHkgYmVuZWZpdCBvZg0KPj4+IENPTkZJR19YRU5fVklSVElPX0ZPUkNFX0dSQU5ULiBJZiB0
aGUgYmFja2VuZCBsaXZlcyBpbiBkb20wIChvcg0KPj4+IHN0dWJkb21haW4pLCBpdCBjYW4g
YWNjZXNzIHdob2xlIGd1ZXN0IG1lbW9yeSBhbnl3YXksIHdoZXRoZXIgZnJvbnRlbmQNCj4+
PiBsaWtlcyBpdCBvciBub3QuIEJ1dCBpZiB0aGUgYmFja2VuZCBpcyBlbHNld2hlcmUgKG9y
IGd1ZXN0IGlzIHByb3RlY3RlZA0KPj4+IHdpdGggQU1EIFNFVi1TTlAsIFhTTSBvciBzaW1p
bGFyKSwgdGhlbiB0aGUgYmFja2VuZCB3b24ndCBiZSBhYmxlIHRvIGFjY2Vzcw0KPj4+IG1l
bW9yeSBvdXRzaWRlIG9mIHdoYXQgZnJvbnRlbmQgc2hhcmVzIGV4cGxpY2l0bHkuIFNvLCBp
biB0aGUgbm9uLWRvbTAgY2FzZSwNCj4+PiBiYWNrZW5kIHRyeWluZyB0byBwcm92aWRlIG5v
bi1ncmFudC1iYXNlZCB2aXJ0aW8gZGV2aWNlIHdpbGwgc2ltcGx5IG5vdA0KPj4+IGZ1bmN0
aW9uIChiZWNhdXNlIG9mIGluYWJpbGl0eSB0byBhY2Nlc3MgZ3Vlc3QncyBtZW1vcnkpLCBp
bnN0ZWFkIG9mDQo+Pj4gZ2FpbmluZyB1bmludGVuZGVkIGFjY2Vzcy4gQW0gSSBtaXNzaW5n
IHNvbWUgaW1wbGljaXQgbWVtb3J5IHNoYXJpbmcNCj4+PiBoZXJlPw0KPj4NCj4+IFlvdSBh
cmUgbWlzc2luZyB0aGUgcG9zc2liaWxpdHkgdG8gaGF2ZSBhIGRlcHJpdmlsZWdlZCB1c2Vy
IGxhbmQgdmlydGlvDQo+PiBiYWNrZW5kLg0KPiANCj4gT2ssIGJ1dCB0aGF0IGJhY2tlbmQg
ZWl0aGVyIGNhbiB4ZW5mb3JlaWdubWVtb3J5X21hcCgpIGFyYml0cmFyeSBndWVzdCdzDQo+
IHBhZ2UgKGluIHdoaWNoIGNhc2UgaXQgZG9lc24ndCBtYXR0ZXIgaWYgdGhlIGZyb250ZW5k
IGRyaXZlciBsaWtlcw0KPiBub24tZ3JhbnQtYmFzZWQgZGV2aWNlIG9yIG5vdCksIG9yIGl0
IGNhbm5vdCAoaW4gd2hpY2ggY2FzZSwNCj4gbm9uLWdyYW50LWJhc2VkIGRldmljZSB3aWxs
IHNpbXBseSBub3Qgd29yaywgYmFja2VuZCBzdGlsbCB3b24ndCBoYXZlDQo+IGFjY2VzcyB0
byB0aGUgZ3Vlc3QgbWVtb3J5KS4NCj4gDQo+IFN1cmUsIHRoZSBlcnJvciByZXBvcnRpbmcg
bWlnaHQgYmUgZGlmZmVyZW50LCBidXQgSSBkb24ndCB0aGluayBpdA0KPiBjaGFuZ2VzIHRo
ZSBvdXRjb21lIHNlY3VyaXR5LXdpc2UuDQoNClRoZSBtYWluIHByb2JsZW0gd2l0aCBQViBn
dWVzdHMgaXMgdGhhdCBpbiBub3JtYWwgY2FzZXMgKG5vdCBuZXN0ZWQgdmlydCkNCnRoZSBi
YWNrZW5kIG11c3QgYmUgYXdhcmUgdGhhdCB0aGUgZnJvbnRlbmQgaXMgdXNpbmcgTUZOcyBp
bnN0ZWFkIG9mIGd1ZXN0DQpQRk5zIGZvciB2aXJ0aW8uIFRoaXMgaXMgdGhlIG9ubHkgcmVh
c29uIHdoeSB5b3UgY2FuIHVzZSB2aXJ0aW8gaW4gYQ0KbmVzdGVkIGRvbTAgdG9kYXkuDQoN
Ck5vdCByZXF1aXJpbmcgZ3JhbnRzIGZvciBQViBkb21haW5zIG1lYW5zIHRoYXQgdGhlICJu
b3JtYWwiIGNhc2Ugb2YgYSBub3QNCm5lc3RlZCBzZXR1cCB3aWxsIGZhaWwgbWlzZXJhYmx5
LiBTbyB0aGUgcmFyZSBjYXNlIG9mIG5lc3RlZCBzZXR1cHMgc2hvdWxkDQpiZSBzcGVjaWFs
IGNhc2VkIChlLmcuIHZpYSBhIGJvb3QgcGFyYW1ldGVyIG9mIHRoZSBndWVzdCksIGluIG9y
ZGVyIHRvIG5vdA0KY2F1c2Ugd2VpcmQgY3Jhc2hlcyBmb3IgdGhlIG5vbi1uZXN0ZWQgc2V0
dXAuDQoNCg0KSnVlcmdlbg0K
--------------3Gr6CaA0yyRf4wh8dOqwqRoq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3Gr6CaA0yyRf4wh8dOqwqRoq--

--------------BkOKCgskQkPAePMqf4ZCGFtU--

--------------d55YQkVR09uIb8CsSygj709H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM+d60FAwAAAAAACgkQsN6d1ii/Ey/t
Vwf+MSYQTCqnLIv73xZsU/oV2qmVmenRRCtPasiwKw2vVVNAnK3v/iNVwh0abM45S4sOunIQazDy
c6qjBY3KHIh4V4XjjuEp7rNIfnieBOhiBud/0HzgGVF+DlipI3mGoqRWAy2RP7yivePa4Oesm3u2
YiV3m7YdI3b9s0oszyau0/DUlgbLL3SMZvacWjyLap186XwylNmAmK/oyasbHAI3b/+jGsSW2hXv
fgOkDnTWgbtdHHS6vptqdO/9I7mNjrVz28CrC9t2hrGy8AleZc6AZns8BaPeRjM+1+wa/bpl1e8r
yfrmxuA+B4dJv0VPoYXQr1BOPhOlbaVc1Rxg7yx5sg==
=LtmR
-----END PGP SIGNATURE-----

--------------d55YQkVR09uIb8CsSygj709H--

