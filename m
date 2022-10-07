Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7515F774C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 13:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417877.662621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oglMA-0005u4-QY; Fri, 07 Oct 2022 11:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417877.662621; Fri, 07 Oct 2022 11:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oglMA-0005r2-ND; Fri, 07 Oct 2022 11:17:30 +0000
Received: by outflank-mailman (input) for mailman id 417877;
 Fri, 07 Oct 2022 11:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oglM9-0005qw-Bh
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 11:17:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a077f930-4631-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 13:17:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B619621901;
 Fri,  7 Oct 2022 11:17:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 779CA13A9A;
 Fri,  7 Oct 2022 11:17:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4HCtG8cKQGPYQAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Oct 2022 11:17:27 +0000
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
X-Inumbo-ID: a077f930-4631-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665141447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rodz+ksVyPQ7OBPQytc3YNBLWrd23nCfdbAfpYfKunU=;
	b=sLN0cIRhC6FuvbtcEZ4NNM4QGOuAfywIk9zbHszNCD6yRDs9gHDPJkMcwqBya1FLpmu6T5
	jWVi7xWNCVT6eVzgZjYPu5owK9sBmbY0y/BWJMsCFHd8U4mDI3XE2lOIiEDyW/SRbLb8U3
	ePYkFZJXyleK2MX0WK3NwP7R0mN1ig8=
Message-ID: <87437234-02ce-b18e-8442-c081de259ed9@suse.com>
Date: Fri, 7 Oct 2022 13:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <37f0f84cdaf47b1efda59f0368998183dff88a3b.1665137247.git.mykyta_poturai@epam.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 17/19] xen: don't free percpu areas during suspend
In-Reply-To: <37f0f84cdaf47b1efda59f0368998183dff88a3b.1665137247.git.mykyta_poturai@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2cq8xhqiTNmgi1TspXAg68f7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2cq8xhqiTNmgi1TspXAg68f7
Content-Type: multipart/mixed; boundary="------------YX3h6mU6fGSWJb0Dr69DtP7L";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <87437234-02ce-b18e-8442-c081de259ed9@suse.com>
Subject: Re: [PATCH 17/19] xen: don't free percpu areas during suspend
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <37f0f84cdaf47b1efda59f0368998183dff88a3b.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <37f0f84cdaf47b1efda59f0368998183dff88a3b.1665137247.git.mykyta_poturai@epam.com>

--------------YX3h6mU6fGSWJb0Dr69DtP7L
Content-Type: multipart/mixed; boundary="------------TmYiVmpKfPSedR4CIJJuaYkL"

--------------TmYiVmpKfPSedR4CIJJuaYkL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTAuMjIgMTI6MzIsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPiBGcm9tOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBJbnN0ZWFkIG9mIGZyZWVpbmcg
cGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5nIHRoZW0NCj4gYWdh
aW4gd2hlbiByZXN1bWluZyBrZWVwIHRoZW0uIE9ubHkgZnJlZSBhbiBhcmVhIGluIGNhc2Ug
YSBjcHUgZGlkbid0DQo+IGNvbWUgdXAgYWdhaW4gd2hlbiByZXN1bWluZy4NCj4gDQo+IEl0
IHNob3VsZCBiZSBub3RlZCB0aGF0IHRoZXJlIGlzIGEgcG90ZW50aWFsIGNoYW5nZSBpbiBi
ZWhhdmlvdXIgYXMNCj4gdGhlIHBlcmNwdSBhcmVhcyBhcmUgbm8gbG9uZ2VyIHplcm9lZCBv
dXQgZHVyaW5nIHN1c3BlbmQvcmVzdW1lLiBXaGlsZQ0KPiBJIGhhdmUgY2hlY2tlZCB0aGUg
Y2FsbGVkIGNwdSBub3RpZmllciBob29rcyB0byBjb3BlIHdpdGggdGhhdCB0aGVyZQ0KPiBt
aWdodCBiZSBzb21lIHdlbGwgaGlkZGVuIGRlcGVuZGVuY3kgb24gdGhlIHByZXZpb3VzIGJl
aGF2aW91ci4gT1RPSA0KPiBhIGNvbXBvbmVudCBub3QgcmVnaXN0ZXJpbmcgaXRzZWxmIGZv
ciBjcHUgZG93bi91cCBhbmQgZXhwZWN0aW5nIHRvDQo+IHNlZSBhIHplcm9lZCBwZXJjcHUg
dmFyaWFibGUgYWZ0ZXIgc3VzcGVuZC9yZXN1bWUgaXMga2luZCBvZiBicm9rZW4NCj4gYWxy
ZWFkeS4gQW5kIHRoZSBvcHBvc2l0ZSBjYXNlLCB3aGVyZSBhIGNvbXBvbmVudCBpcyBub3Qg
cmVnaXN0ZXJlZA0KPiB0byBiZSBjYWxsZWQgZm9yIGNwdSBkb3duL3VwIGFuZCBpcyBub3Qg
ZXhwZWN0aW5nIGEgcGVyY3B1IHZhcmlhYmxlDQo+IHN1ZGRlbmx5IHRvIGJlIHplcm8gZHVl
IHRvIHN1c3BlbmQvcmVzdW1lIGlzIG11Y2ggbW9yZSBwcm9iYWJsZSwNCj4gZXNwZWNpYWxs
eSBhcyB0aGUgc3VzcGVuZC9yZXN1bWUgZnVuY3Rpb25hbGl0eSBzZWVtcyBub3QgdG8gYmUg
dGVzdGVkDQo+IHRoYXQgb2Z0ZW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCkkgY2FuJ3QgcmVtZW1iZXIgaGF2aW5nIHdyaXR0
ZW4gdGhpcyBwYXRjaC4gVGhlIG9uZSBJIHJlbWVtYmVyIHdhcyBmb3INCng4Ni4NCg0KPiBS
ZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4NCg0KSSBk
b3VidCB0aGF0LCByZWFzb25pbmcgc2VlIGFib3ZlLg0KDQoNCkp1ZXJnZW4NCg0KPiAtLS0N
Cj4gICB4ZW4vYXJjaC9hcm0vcGVyY3B1LmMgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGVy
Y3B1LmMgYi94ZW4vYXJjaC9hcm0vcGVyY3B1LmMNCj4gaW5kZXggMjU0NDJjNDhmZS4uMDY0
MjcwNTU0NCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL3BlcmNwdS5jDQo+ICsrKyBi
L3hlbi9hcmNoL2FybS9wZXJjcHUuYw0KPiBAQCAtNTgsMTAgKzU4LDEzIEBAIHN0YXRpYyBp
bnQgY3B1X3BlcmNwdV9jYWxsYmFjaygNCj4gICAgICAgc3dpdGNoICggYWN0aW9uICkNCj4g
ICAgICAgew0KPiAgICAgICBjYXNlIENQVV9VUF9QUkVQQVJFOg0KPiArICAgICAgaWYgKCBz
eXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX3Jlc3VtZSApDQo+ICAgICAgICAgICByYyA9IGlu
aXRfcGVyY3B1X2FyZWEoY3B1KTsNCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICBjYXNl
IENQVV9VUF9DQU5DRUxFRDoNCj4gICAgICAgY2FzZSBDUFVfREVBRDoNCj4gKyAgICBjYXNl
IENQVV9SRVNVTUVfRkFJTEVEOg0KPiArICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lT
X1NUQVRFX3N1c3BlbmQgKQ0KPiAgICAgICAgICAgZnJlZV9wZXJjcHVfYXJlYShjcHUpOw0K
PiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIGRlZmF1bHQ6DQoNCg==
--------------TmYiVmpKfPSedR4CIJJuaYkL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TmYiVmpKfPSedR4CIJJuaYkL--

--------------YX3h6mU6fGSWJb0Dr69DtP7L--

--------------2cq8xhqiTNmgi1TspXAg68f7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNACsYFAwAAAAAACgkQsN6d1ii/Ey8n
zgf/U4EzIP7JAXO2wi9A932Zwa6WQE6W/rnqbwaM01xoxbyEXvVYMR4asTeGx98S8UoiiozD+ets
lOfFeKvYhno2q0Pk64xH3JiKbBBy/U+8ifHrwq/wRF3ws0TuuS6rK7t2PrQdB/n39yDsp34XSyF7
7WRJjDLufKrXxKwZKMGhDIUrx4E5DvloDZuVw6RwB0Qk68NvKF5b/MbkYTcDRLY7Petl+i0Nys9Z
HLoe24APQOqSCNBf9vPCzhRvBUOmOwJuhLusl0nxmG3si8HkJ8KWqpwM8JAJPHfPRUL6qDWphuEK
DzM509UTbSirqdRDr+tF9La1NeJwMjcO76TJmmdt3w==
=SLyh
-----END PGP SIGNATURE-----

--------------2cq8xhqiTNmgi1TspXAg68f7--

