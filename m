Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9AF7F44B0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 12:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638686.995538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5l3f-0005oz-3f; Wed, 22 Nov 2023 11:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638686.995538; Wed, 22 Nov 2023 11:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5l3f-0005mB-17; Wed, 22 Nov 2023 11:06:15 +0000
Received: by outflank-mailman (input) for mailman id 638686;
 Wed, 22 Nov 2023 11:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5l3d-0005m4-PF
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 11:06:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2519b4a3-8927-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 12:06:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B2F8D218BB;
 Wed, 22 Nov 2023 11:06:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75F03139FD;
 Wed, 22 Nov 2023 11:06:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fuA+G6LgXWVoJwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 11:06:10 +0000
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
X-Inumbo-ID: 2519b4a3-8927-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700651170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3rT3KRkLtQdUHsSypE/8xdzTH91W850dUGO6TiG/aik=;
	b=QKVDgZUmCLWNYj6SedIgL1coHwuBupmhHcV5JnaOxJcBRdPWK7CxCnLWoq3+wY7vFqlE46
	haOJDvlOiSvdH5ELdRphHtKulwYsBxhsaQUoKTMmpjXwugRABvrOpG85WUPtJSbA2HbcyZ
	9GcZtCrY31wcSxvSCKSO39rcFFU0t5A=
Message-ID: <ff31f5a6-396e-48cc-8b1b-6941369c620b@suse.com>
Date: Wed, 22 Nov 2023 12:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-linus test] 183794: regressions - FAIL
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, oleksandr_tyshchenko@epam.com
References: <osstest-183794-mainreport@xen.org>
 <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com>
 <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5yYp1j11r4S2zg2hXKKH0YbW"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.19
X-Spamd-Result: default: False [-6.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5yYp1j11r4S2zg2hXKKH0YbW
Content-Type: multipart/mixed; boundary="------------H6SO5tFDlt3BH0tPGPxcyzt0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, oleksandr_tyshchenko@epam.com
Message-ID: <ff31f5a6-396e-48cc-8b1b-6941369c620b@suse.com>
Subject: Re: [linux-linus test] 183794: regressions - FAIL
References: <osstest-183794-mainreport@xen.org>
 <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com>
 <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>

--------------H6SO5tFDlt3BH0tPGPxcyzt0
Content-Type: multipart/mixed; boundary="------------l0wvTHvJfSFe9nbBzDmh8pVQ"

--------------l0wvTHvJfSFe9nbBzDmh8pVQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMTEuMjMgMDQ6MDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gTW9u
LCAyMCBOb3YgMjAyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gTW9uLCAy
MCBOb3YgMjAyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBPbiAyMC4xMS4yMyAwMzoy
MSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOg0KPj4+PiBmbGlnaHQgMTgzNzk0IGxp
bnV4LWxpbnVzIHJlYWwgW3JlYWxdDQo+Pj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xODM3OTQvDQo+Pj4+DQo+Pj4+IFJlZ3Jlc3Npb25z
IDotKA0KPj4+Pg0KPj4+PiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBi
bG9ja2luZywNCj4+Pj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46
DQo+Pj4+ICAgIHRlc3QtYXJtNjQtYXJtNjQtZXhhbWluZSAgICAgIDggcmVib290ICAgICAg
ICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuDQo+Pj4+IDE4Mzc2Ng0KPj4+DQo+Pj4gSSdt
IHNlZWluZyB0aGUgZm9sbG93aW5nIGluIHRoZSBzZXJpYWwgbG9nOg0KPj4+DQo+Pj4gTm92
IDIwIDAwOjI1OjQxLjU4NjcxMiBbICAgIDAuNTY3MzE4XSBrZXJuZWwgQlVHIGF0DQo+Pj4g
YXJjaC9hcm02NC94ZW4vLi4vLi4vYXJtL3hlbi9lbmxpZ2h0ZW4uYzoxNjQhDQo+Pj4gTm92
IDIwIDAwOjI1OjQxLjU5ODcxMSBbICAgIDAuNTc0MDAyXSBJbnRlcm5hbCBlcnJvcjogT29w
cyAtIEJVRzoNCj4+PiAwMDAwMDAwMGYyMDAwODAwIFsjMV0gUFJFRU1QVCBTTVANCj4+Pg0K
Pj4+IFRoZSByZWxhdGVkIHNvdXJjZSBjb2RlIGxpbmVzIGluIHRoZSBrZXJuZWwgYXJlOg0K
Pj4+DQo+Pj4gwrfCt8K3wrfCt8K3wrfCt2VyciA9IEhZUEVSVklTT1JfdmNwdV9vcChWQ1BV
T1BfcmVnaXN0ZXJfdmNwdV9pbmZvLCB4ZW5fdmNwdV9ucihjcHUpLA0KPj4+IMK3wrfCt8K3
wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3
wrcgJmluZm8pOw0KPj4+IMK3wrfCt8K3wrfCt8K3wrdCVUdfT04oZXJyKTsNCj4+Pg0KPj4+
IEkgc3VzcGVjdCBjb21taXQgMjBmM2I4ZWFmZTBiYSB0byBiZSB0aGUgY3VscHJpdC4NCj4+
Pg0KPj4+IFN0ZWZhbm8sIGNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2s/DQo+IA0KPiBU
aGUgZ29vZCBuZXdzIGFuZCBiYWQgbmV3cyBpcyB0aGF0IEkgY2Fubm90IHJlcHJvIHRoaXMg
bmVpdGhlciB3aXRoIG5vcg0KPiB3aXRob3V0IENPTkZJR19VTk1BUF9LRVJORUxfQVRfRUww
LiBJIGxvb2tlZCBhdCBjb21taXQgMjBmM2I4ZWFmZTBiYSBidXQNCj4gSSBjYW5ub3Qgc2Vl
IGFueXRoaW5nIHdyb25nIHdpdGggaXQuIExvb2tpbmcgYXQgdGhlIHJlZ2lzdGVyIGR1bXAs
IGZyb206DQo+IA0KPiB4MCA6IGZmZmZmZmZmZmZmZmZmZmENCj4gDQo+IEkgYW0gZ3Vlc3Np
bmcgdGhlIGVycm9yIHdhcyAtRU5YSU8gd2hpY2ggaXMgcmV0dXJuZWQgZnJvbSBtYXBfZ3Vl
c3RfYXJlYQ0KPiBpbiBYZW4uDQo+IA0KPiBDb3VsZCBpdCBiZSB0aGF0IHRoZSBzdHJ1Y3Qg
aXMgY3Jvc3NpbmcgYSBwYWdlIGJvdW5kYXJ5PyBPciB0aGF0IGl0IGlzDQo+IG5vdCA2NC1i
aXQgYWxpZ25lZD8gRG8gd2UgbmVlZCB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93
aW5nPw0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYyBiL2Fy
Y2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYw0KPiBpbmRleCA5YWZkYzRjNGE1ZGMuLjUzMjYwNzBj
NWRjMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jDQo+ICsrKyBi
L2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYw0KPiBAQCAtNDg0LDcgKzQ4NSw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IHhlbl9ndWVzdF9pbml0KHZvaWQpDQo+ICAgCSAqIGZvciBzZWNvbmRh
cnkgQ1BVcyBhcyB0aGV5IGFyZSBicm91Z2h0IHVwLg0KPiAgIAkgKiBGb3IgdW5pZm9ybWl0
eSB3ZSB1c2UgVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfaW5mbyBldmVuIG9uIGNwdTAuDQo+ICAg
CSAqLw0KPiAtCXhlbl92Y3B1X2luZm8gPSBhbGxvY19wZXJjcHUoc3RydWN0IHZjcHVfaW5m
byk7DQo+ICsJeGVuX3ZjcHVfaW5mbyA9IF9fYWxsb2NfcGVyY3B1KHN0cnVjdCB2Y3B1X2lu
Zm8sIFBBR0VfU0laRSk7DQo+ICAgCWlmICh4ZW5fdmNwdV9pbmZvID09IE5VTEwpDQo+ICAg
CQlyZXR1cm4gLUVOT01FTTsNCj4gICANCg0KTWF5IEkgc3VnZ2VzdCB0byB1c2UgYSBzbWFs
bGVyIGFsaWdubWVudD8gV2hhdCBhYm91dDoNCg0KMSA8PCBmbHMoc2l6ZW9mKHN0cnVjdCB2
Y3B1X2luZm8pIC0gMSkNCg0KDQpKdWVyZ2VuDQo=
--------------l0wvTHvJfSFe9nbBzDmh8pVQ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------l0wvTHvJfSFe9nbBzDmh8pVQ--

--------------H6SO5tFDlt3BH0tPGPxcyzt0--

--------------5yYp1j11r4S2zg2hXKKH0YbW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVd4KIFAwAAAAAACgkQsN6d1ii/Ey+r
Wgf/aRl9nAsG06CFKeT4WUxbB4HzzHfgvoJ6oSiMlJIFnz8DwrU/zv/ELkvsQE1CTjAI7aWz1a2o
IZ4kcY9G9kRVbR7J/ifpn3q/wG4tfvJopR8U6jydJ2SteWC5nDfXvQnLSL43No3aV5/TNQLf4brj
CowpznhgKcmtCGkRzZ4jwphcQmTRHbvt8ShUKB+Pu9C7VDfMDm7H/faTCF0+I32TgL1jYOuTvTiP
c4CQYsQ9n7VqrIVPmx7+Yy2c9b+Zp7DPu9i3/KFbZdVDZGFk2k6fmn61wuzvUNrBF0Ee7zBE2Pe4
PvkaaOGAPvpQeiGa3ROCfOxJJGXjvheK4CUTdTh4Ig==
=dnd5
-----END PGP SIGNATURE-----

--------------5yYp1j11r4S2zg2hXKKH0YbW--

