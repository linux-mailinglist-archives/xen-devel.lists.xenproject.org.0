Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CEE4D126C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286628.486218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVN2-00052T-Jx; Tue, 08 Mar 2022 08:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286628.486218; Tue, 08 Mar 2022 08:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVN2-0004zN-GY; Tue, 08 Mar 2022 08:39:04 +0000
Received: by outflank-mailman (input) for mailman id 286628;
 Tue, 08 Mar 2022 08:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PwwU=TT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nRVN0-0004zD-Vd
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:39:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346b0be7-9ebb-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 09:39:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51CCE1F396;
 Tue,  8 Mar 2022 08:39:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 014FD13C2F;
 Tue,  8 Mar 2022 08:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IvwIOiQWJ2J0EAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Mar 2022 08:39:00 +0000
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
X-Inumbo-ID: 346b0be7-9ebb-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646728741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cROBGpqb3bwVXQIc1jIl3XWHkXTT+howIBMcmLUTwWI=;
	b=HZuXVo+qJG8WlOVfm5nythdQwSeXeX1ylHlXscvntYaGBM0CGcYv/opfBbin7QjHSHgRou
	33rkVOoN+weRqUoAbyQkdQbpvAecYtcM9ZddvSYHLA05HiMTdmM6bXuw1Lwmd2Vl9dza2s
	/MuVd9v1gxgDi7yXz5YnHZG2os1ley0=
Message-ID: <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
Date: Tue, 8 Mar 2022 09:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NU7RUvpPhlL9iek00PPLqQLe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NU7RUvpPhlL9iek00PPLqQLe
Content-Type: multipart/mixed; boundary="------------nzb2aBdy5aWzl1IQFAD8SBOB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
In-Reply-To: <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>

--------------nzb2aBdy5aWzl1IQFAD8SBOB
Content-Type: multipart/mixed; boundary="------------lexoRItDrOYUcHHARhg7KGKl"

--------------lexoRItDrOYUcHHARhg7KGKl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDMuMjIgMDk6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4xMi4yMDIx
IDE2OjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gYXZvaWQgaW5k
aXJlY3QgZnVuY3Rpb24gY2FsbHMgb24gdGhlIGh5cGVyY2FsbCBwYXRoIGFzDQo+PiBtdWNo
IGFzIHBvc3NpYmxlIHRoaXMgc2VyaWVzIGlzIHJlbW92aW5nIHRoZSBoeXBlcmNhbGwgZnVu
Y3Rpb24gdGFibGVzDQo+PiBhbmQgaXMgcmVwbGFjaW5nIHRoZSBoeXBlcmNhbGwgaGFuZGxl
ciBjYWxscyB2aWEgdGhlIGZ1bmN0aW9uIGFycmF5DQo+PiBieSBhdXRvbWF0aWNhbGx5IGdl
bmVyYXRlZCBjYWxsIG1hY3Jvcy4NCj4+DQo+PiBBbm90aGVyIGJ5LXByb2R1Y3Qgb2YgZ2Vu
ZXJhdGluZyB0aGUgY2FsbCBtYWNyb3MgaXMgdGhlIGF1dG9tYXRpYw0KPj4gZ2VuZXJhdGlu
ZyBvZiB0aGUgaHlwZXJjYWxsIGhhbmRsZXIgcHJvdG90eXBlcyBmcm9tIHRoZSBzYW1lIGRh
dGEgYmFzZQ0KPj4gd2hpY2ggaXMgdXNlZCB0byBnZW5lcmF0ZSB0aGUgbWFjcm9zLg0KPj4N
Cj4+IFRoaXMgaGFzIHRoZSBhZGRpdGlvbmFsIGFkdmFudGFnZSBvZiB1c2luZyB0eXBlIHNh
ZmUgY2FsbHMgb2YgdGhlDQo+PiBoYW5kbGVycyBhbmQgdG8gZW5zdXJlIHJlbGF0ZWQgaGFu
ZGxlciAoZS5nLiBQViBhbmQgSFZNIG9uZXMpIHNoYXJlDQo+PiB0aGUgc2FtZSBwcm90b3R5
cGVzLg0KPj4NCj4+IEEgdmVyeSBicmllZiBwZXJmb3JtYW5jZSB0ZXN0IChwYXJhbGxlbCBi
dWlsZCBvZiB0aGUgWGVuIGh5cGVydmlzb3INCj4+IGluIGEgNiB2Y3B1IGd1ZXN0KSBzaG93
ZWQgYSB2ZXJ5IHNsaW0gaW1wcm92ZW1lbnQgKGxlc3MgdGhhbiAxJSkgb2YNCj4+IHRoZSBw
ZXJmb3JtYW5jZSB3aXRoIHRoZSBwYXRjaGVzIGFwcGxpZWQuIFRoZSB0ZXN0IHdhcyBwZXJm
b3JtZWQgdXNpbmcNCj4+IGEgUFYgYW5kIGEgUFZIIGd1ZXN0Lg0KPj4NCj4+IENoYW5nZXMg
aW4gVjI6DQo+PiAtIG5ldyBwYXRjaGVzIDYsIDE0LCAxNQ0KPj4gLSBwYXRjaCA3OiBzdXBw
b3J0IGh5cGVyY2FsbCBwcmlvcml0aWVzIGZvciBmYXN0ZXIgY29kZQ0KPj4gLSBjb21tZW50
cyBhZGRyZXNzZWQNCj4+DQo+PiBDaGFuZ2VzIGluIFYzOg0KPj4gLSBwYXRjaGVzIDEgYW5k
IDQgcmVtb3ZlZCBhcyBhbHJlYWR5IGFwcGxpZWQNCj4+IC0gY29tbWVudHMgYWRkcmVzc2Vk
DQo+Pg0KPj4gSnVlcmdlbiBHcm9zcyAoMTMpOg0KPj4gICAgeGVuOiBtb3ZlIGRvX3ZjcHVf
b3AoKSB0byBhcmNoIHNwZWNpZmljIGNvZGUNCj4+ICAgIHhlbjogaGFybW9uaXplIHJldHVy
biB0eXBlcyBvZiBoeXBlcmNhbGwgaGFuZGxlcnMNCj4+ICAgIHhlbjogZG9uJ3QgaW5jbHVk
ZSBhc20vaHlwZXJjYWxsLmggZnJvbSBDIHNvdXJjZXMNCj4+ICAgIHhlbjogaW5jbHVkZSBj
b21wYXQvcGxhdGZvcm0uaCBmcm9tIGh5cGVyY2FsbC5oDQo+PiAgICB4ZW46IGdlbmVyYXRl
IGh5cGVyY2FsbCBpbnRlcmZhY2UgcmVsYXRlZCBjb2RlDQo+PiAgICB4ZW46IHVzZSBnZW5l
cmF0ZWQgcHJvdG90eXBlcyBmb3IgaHlwZXJjYWxsIGhhbmRsZXJzDQo+PiAgICB4ODYvcHYt
c2hpbTogZG9uJ3QgbW9kaWZ5IGh5cGVyY2FsbCB0YWJsZQ0KPj4gICAgeGVuL3g4NjogZG9u
J3QgdXNlIGh5cGVyY2FsbCB0YWJsZSBmb3IgY2FsbGluZyBjb21wYXQgaHlwZXJjYWxscw0K
Pj4gICAgeGVuL3g4NjogY2FsbCBoeXBlcmNhbGwgaGFuZGxlcnMgdmlhIGdlbmVyYXRlZCBt
YWNybw0KPj4gICAgeGVuL2FybTogY2FsbCBoeXBlcmNhbGwgaGFuZGxlcnMgdmlhIGdlbmVy
YXRlZCBtYWNybw0KPj4gICAgeGVuL3g4NjogYWRkIGh5cGVyY2FsbCBwZXJmb3JtYW5jZSBj
b3VudGVycyBmb3IgaHZtLCBjb3JyZWN0IHB2DQo+PiAgICB4ZW46IGRyb3AgY2FsbHNfdG9f
bXVsdGljYWxsIHBlcmZvcm1hbmNlIGNvdW50ZXINCj4+ICAgIHRvb2xzL3hlbnBlcmY6IHVw
ZGF0ZSBoeXBlcmNhbGwgbmFtZXMNCj4gDQo+IEFzIGl0J3MgcHJldHR5IGNlcnRhaW4gbm93
IHRoYXQgcGFydHMgb2YgdGhpcyB3aGljaCBkaWRuJ3QgZ28gaW4geWV0IHdpbGwNCj4gbmVl
ZCByZS1iYXNpbmcsIEknbSBnb2luZyB0byBkcm9wIHRoaXMgZnJvbSBteSB3YWl0aW5nLXRv
LWJlLWFja2VkIGZvbGRlciwNCj4gZXhwZWN0aW5nIGEgdjQgaW5zdGVhZC4NCg0KWWVzLCBJ
IHdhcyBwbGFubmluZyB0byBzcGluIHRoYXQgdXAgc29vbi4NCg0KVGhlIG1haW4gcmVtYWlu
aW5nIHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2Ugd2FudCB0byBzd2l0Y2ggdGhlIHJldHVybiB0
eXBlDQpvZiBhbGwgaHlwZXJjYWxscyAob3IgYXQgbGVhc3QgdGhlIG9uZXMgY29tbW9uIHRv
IGFsbCBhcmNocykgbm90DQpyZXF1aXJpbmcgdG8gcmV0dXJuIDY0LWJpdCB2YWx1ZXMgdG8g
ImludCIsIGFzIEp1bGllbiByZXF1ZXN0ZWQuDQoNCg0KSnVlcmdlbg0K
--------------lexoRItDrOYUcHHARhg7KGKl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------lexoRItDrOYUcHHARhg7KGKl--

--------------nzb2aBdy5aWzl1IQFAD8SBOB--

--------------NU7RUvpPhlL9iek00PPLqQLe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmInFiQFAwAAAAAACgkQsN6d1ii/Ey8R
sQf9Gfremgf8s1E3FmD0OVwBzPPbu32QaBRdXsPLI58aHBoW1/StjrrTpFG8FQ6w6zRdQZoPBxKz
OQ95MT6nTDXKUzEdums1fV4icxblTsZsXHBjidbIGObFq7UaxCZED/kHvxfpM4D8HisUlBN/PHOF
XGXROfKt5QD6Vgcd0xDYTA20cCfSwMtJn5hIOULPcUUHhIndKPxVVwJ3IgWU//R7Zrhf7I4eb1rD
uN8CS4zYYPuya/6U7xiCeFChT2ofG2rHhV8149ViUW6LpKPoynYcT1dirIKlJm508OQkKVKOxzPg
NE2gPrD24By+tLzuKyJugJQStXyXNzfkMO9TiBegsA==
=H7le
-----END PGP SIGNATURE-----

--------------NU7RUvpPhlL9iek00PPLqQLe--

