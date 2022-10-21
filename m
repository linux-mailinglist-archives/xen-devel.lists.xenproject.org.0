Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD96074C9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427531.676689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olp33-0001F1-Nc; Fri, 21 Oct 2022 10:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427531.676689; Fri, 21 Oct 2022 10:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olp33-0001D2-K5; Fri, 21 Oct 2022 10:14:41 +0000
Received: by outflank-mailman (input) for mailman id 427531;
 Fri, 21 Oct 2022 10:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olp31-00013k-Rl
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:14:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba6caa1-5129-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 12:14:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6114122865;
 Fri, 21 Oct 2022 10:14:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FFE413A0E;
 Fri, 21 Oct 2022 10:14:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hsjdCQ5xUmNBFAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 10:14:38 +0000
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
X-Inumbo-ID: 2ba6caa1-5129-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666347278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=No7Yx/o1GPE15QfLjpHngpXcw+ynzm2wDJm35rvOGUg=;
	b=abxvCX3sWW9tO9nCb9H/xUdvzhX806HuzxcmONtEMCiImv/13UMxPYUH/b4zqjciM8Itrv
	HvtFSBzlbii+c59JOfopmy8hUSDodXJW0dv+T1CZQnO+fKmlRGTNBZL3sbLbT5nh1CZ7ux
	KrDpcR49ashh5S6Z11QDBSOcRB0Mio4=
Message-ID: <1e3fd219-ffb4-acfb-5dfc-1a4ae054c7e7@suse.com>
Date: Fri, 21 Oct 2022 12:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
References: <20221021061042.12083-1-jgross@suse.com>
 <e661d49da44ff2f6d17ab7371f10bb38ae61369f.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
In-Reply-To: <e661d49da44ff2f6d17ab7371f10bb38ae61369f.camel@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4s5Q1iqXxscEwEYR9FGhUM02"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4s5Q1iqXxscEwEYR9FGhUM02
Content-Type: multipart/mixed; boundary="------------3I8Dmcc120wZ91svG0Yo6OkS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
Message-ID: <1e3fd219-ffb4-acfb-5dfc-1a4ae054c7e7@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
References: <20221021061042.12083-1-jgross@suse.com>
 <e661d49da44ff2f6d17ab7371f10bb38ae61369f.camel@suse.com>
In-Reply-To: <e661d49da44ff2f6d17ab7371f10bb38ae61369f.camel@suse.com>

--------------3I8Dmcc120wZ91svG0Yo6OkS
Content-Type: multipart/mixed; boundary="------------HNIk8s7LGod1Ir7fTZzZRzfn"

--------------HNIk8s7LGod1Ir7fTZzZRzfn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTAuMjIgMTE6MzcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOg0KPiBPaywgYW5kIG5v
dywgc29tZXRoaW5nIG5vdCByZWFsbHkgcmVsYXRlZCB0byB0aGUgYnVnIGJlaW5nIGZpeGVk
IGhlcmUsDQo+IGJ1dCBhYm91dCB0aGUgY29kZSB0aGF0IGlzIGJlaW5nIHRvdWNoZWQ6DQo+
IA0KPiBPbiBGcmksIDIwMjItMTAtMjEgYXQgMDg6MTAgKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9ydC5jIGIveGVuL2Nv
bW1vbi9zY2hlZC9ydC5jDQo+PiBpbmRleCBkNmRlMjU1MzFiLi45NjBhODAzM2UyIDEwMDY0
NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9ydC5jDQo+PiArKysgYi94ZW4vY29tbW9u
L3NjaGVkL3J0LmMNCj4+IEBAIC0xMDg3LDYgKzEwODcsNyBAQCBydF9zY2hlZHVsZShjb25z
dCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdA0KPj4gc2NoZWRfdW5pdCAqY3VycnVu
aXQsDQo+PiAgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmICggIXVuaXRfcnVubmFibGVfc3Rh
dGUoc25leHQtPnVuaXQpICkNCj4+ICDCoMKgwqDCoMKgwqDCoMKgIHsNCj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcV9yZW1vdmUoc25leHQpOw0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVwbHFfcmVtb3ZlKG9wcywgc25leHQpOw0KPj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzbmV4dCA9IHJ0X3VuaXQoc2NoZWRfaWRsZV91bml0KHNjaGVkX2NwdSkp
Ow0KPj4gIMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gICANCj4gU28sIGFkZGluZyBhIGZldyBt
b3JlIGNvbnRleHQgaGVyZSwgdGhlIGNvZGUgbG9va3MgbGlrZSB0aGlzOg0KPiANCj4gICAg
ICAgICAgc25leHQgPSBydW5xX3BpY2sob3BzLCBjcHVtYXNrX29mKHNjaGVkX2NwdSksIGN1
cl9jcHUpOw0KPiANCj4gICAgICAgICAgaWYgKCBzbmV4dCA9PSBOVUxMICkNCj4gICAgICAg
ICAgICAgIHNuZXh0ID0gcnRfdW5pdChzY2hlZF9pZGxlX3VuaXQoc2NoZWRfY3B1KSk7DQo+
ICAgICAgICAgIGVsc2UgaWYgKCAhdW5pdF9ydW5uYWJsZV9zdGF0ZShzbmV4dC0+dW5pdCkg
KQ0KPiAgICAgICAgICB7DQo+ICAgICAgICAgICAgICBxX3JlbW92ZShzbmV4dCk7DQo+ICAg
ICAgICAgICAgICBzbmV4dCA9IHJ0X3VuaXQoc2NoZWRfaWRsZV91bml0KHNjaGVkX2NwdSkp
Ow0KPiAgICAgICAgICB9DQo+IA0KPiBCYXNpY2FsbHksIHdlJ3ZlIHRyaWVkIHRvIHBpY2st
dXAgdGhlIGhpZ2hlc3QgcHJpb3JpdHkgdGFzayBmcm9tIHRoZQ0KPiBydW5xdWV1ZS4gSWYg
c25leHQgaXMgTlVMTCwgdGhlIHJ1bnF1ZXVlIHdhcyBqdXN0IGVtcHR5LCBzbyB3ZSBwaWNr
IHVwDQo+IGlkbGUgKGFuZCB0aGVuLCBsYXRlciwgd2UnbGwgY2hlY2sgd2hldGhlciB0aGUg
Y3VycmVudGx5IHJ1bm5pbmcgdW5pdA0KPiBpcyBzdGlsbCBydW5uYWJsZTsgYW5kIGlmIGl0
IGlzLCB3ZSdsbCBjb250aW51ZSB0byBydW4gaXQsIG9mIGNvdXJzZSkuDQo+IA0KPiBIb3dl
dmVyLCBpdCBjYW4gaGFwcGVuIHRoYXQgLS1lLmcuLCBkdWUgdG8gY29yZS1zY2hlZHVsaW5n
LS0gd2UgcGlja2VkDQo+IHVwIGEgdW5pdCB0aGF0LCBkZXNwaXRlIGJlaW5nIGluIHRoZSBy
dW5xdWV1ZSwgaXMgbm90IHJ1bm5hYmxlLiBBdCB0aGlzDQo+IHBvaW50IHdoYXQgd2UgZG8g
aXMgcmVtb3ZpbmcgaXQgZnJvbSB0aGUgcnVucXVldWUgKHRvIGF2b2lkIHBpY2tpbmcgaXQN
Cj4gdXAgYWdhaW4pIGFuZCB3ZSBnbyBmb3IgaWRsZS4NCj4gDQo+IE5vdywgSSBtYXkgYmUg
bWlzc2luZy9taXNyZW1lbWJlcmluZyBzb21ldGhpbmcsIGJ1dCBpdCBsb29rcyB0byBtZSB0
aGF0DQo+IGl0J3MgcG9zc2libGUgdGhhdCB0aGVyZSBhcmUgb3RoZXIgcnVubmFibGUgdW5p
dHMgaW4gdGhlIHJ1bnF1ZXVlLiBBbmQNCj4gaWYgdGhhdCdzIHRoZSBjYXNlLCB3aHkgZG8g
d2UganVzdCBwaWNrIGlkbGUgYW5kIG1vdmUgb24sIGluc3RlYWQgb2YNCj4gY29udGludWlu
ZyB0cnlpbmc/DQo+IA0KPiBKdWVyZ2VuLi4uIEFtIEkgbWlzc2luZyBvciBtaXNyZW1lbWJl
cmluZyBhbnkgZnVuZGFtZW50YWwgcmVhc29uIHdoeSB3ZQ0KPiBjYW5ub3QgY29udGludWUg
dG8gc2NhbiB0aGUgcnVucXVldWUgdW50aWwgdGhlIGZpcnN0IHJ1bm5hYmxlIHVuaXQgKGlm
DQo+IGFueSkgaXMgZm91bmQ/DQoNCk5vLiBUaGlzIGNvZGUgd2FzIGludHJvZHVjZWQgaW4g
dGhlIFJGQyBWMiBzZXJpZXMgb2YgY29yZSBzY2hlZHVsaW5nLg0KQW5kIGl0IHdhcyBub3Qg
dGhlIHJlc3VsdCBvZiBhIHByZXZpb3VzIGRpc2N1c3Npb24gb24geGVuLWRldmVsLg0KDQo+
IE9mIGNvdXJzZSwgdGhpcyBpcyBub3QgcmVhbGx5IHJlbGF0ZWQgd2l0aCB0aGUgYnVnIHRo
aXMgcGF0Y2ggaXMNCj4gZml4aW5nLCB3aGljaCBpcyBjb3JyZWN0IGFuZCBzaG91bGQgYmUg
YXBwbGllZCwgbm8gbWF0dGVyIHdoYXQgdGhlDQo+IG91dGNvbWUgb2YgdGhpcyBzdWJ0aHJl
YWQgd2lsbCBiZS4gOi0pDQoNCkkgY2FuIHdyaXRlIGFub3RoZXIgcGF0Y2ggdHJ5aW5nIHRv
IGZpeCB0aGF0LCBidXQgdGhhdCBzaG91bGRuJ3QgYmUNCjQuMTcgbWF0ZXJpYWwgSU1ITy4N
Cg0KDQpKdWVyZ2VuDQo=
--------------HNIk8s7LGod1Ir7fTZzZRzfn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HNIk8s7LGod1Ir7fTZzZRzfn--

--------------3I8Dmcc120wZ91svG0Yo6OkS--

--------------4s5Q1iqXxscEwEYR9FGhUM02
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNScQ0FAwAAAAAACgkQsN6d1ii/Ey9T
wwf/TZPF5oy4YLchRpBmGFYbHZda6yENDh2mV+ekxnCPD+GAoEDn+W3cCqngFTsR49MZPOIzRG9y
tsTecP3mvHsn5AMD7mcQEjQP6Npf62iRymc03OiYOWffXgN614x3taTIBf2bm54MpJM671sseTlU
Y3BGfnuwuAk29IqEys8XaJ4A4bHd1sDGADM+cnXULFuhidwvUL0xRPlUru5LJO32lTzZBbeibFUI
kLh4Xo0x0PwKYi2Dxi15r/BP+Ui/pUMRrMtgbqN5LpjWY9xMXFpbqT1uMJ/HNS70bzeI7fW8iPVJ
Diti0yqGEZi8fXrMKJ/EemTjF1VCJqWDGOrvxDWENA==
=3yMh
-----END PGP SIGNATURE-----

--------------4s5Q1iqXxscEwEYR9FGhUM02--

