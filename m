Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341337F42E5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638595.995338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jvk-0004Qp-06; Wed, 22 Nov 2023 09:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638595.995338; Wed, 22 Nov 2023 09:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jvj-0004P8-Tg; Wed, 22 Nov 2023 09:53:59 +0000
Received: by outflank-mailman (input) for mailman id 638595;
 Wed, 22 Nov 2023 09:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5jvi-0004Ow-CM
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:53:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0db8c61f-891d-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:53:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97F911F85D;
 Wed, 22 Nov 2023 09:53:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 579FF13461;
 Wed, 22 Nov 2023 09:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dAILFLTPXWVTBQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 09:53:56 +0000
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
X-Inumbo-ID: 0db8c61f-891d-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700646836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=07bUMxPH1OAXI0i6MAOvEb1USCyIuY6cycdHyNOH740=;
	b=oyRkdWR1VduWJ6QN+ixBio4i+YS/lT8ODN6eT0bNtdRC7l0dN4/2UrIpFwCIDomJP55qK9
	hiL0RIM1zKBQh51xc+Jt9VskVz+Zwwod9xm1Zdy4ZM/BmhHmB/oPLrfos0fdOIflqRufpn
	2qK9PXrg74m2FlQDb6dx0Sjr63Oa44M=
Message-ID: <84234983-f811-4e5a-b01a-0a68f2e73447@suse.com>
Date: Wed, 22 Nov 2023 10:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/python: add .gitignore file
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20231122083153.24101-1-jgross@suse.com>
 <20231122083153.24101-3-jgross@suse.com>
 <5471227c-40d9-4b85-b4f6-d0a41c471166@suse.com>
 <2016455e-6bbf-400a-82c9-05128487c5d4@suse.com>
 <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>
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
In-Reply-To: <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y7LO0NEA0Z7eu901Dfd0C4TV"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.17
X-Spamd-Result: default: False [-0.17 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-1.18)[88.97%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
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
--------------Y7LO0NEA0Z7eu901Dfd0C4TV
Content-Type: multipart/mixed; boundary="------------RMB03lQjWqoDdeODTT4kQxJF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <84234983-f811-4e5a-b01a-0a68f2e73447@suse.com>
Subject: Re: [PATCH 2/2] tools/python: add .gitignore file
References: <20231122083153.24101-1-jgross@suse.com>
 <20231122083153.24101-3-jgross@suse.com>
 <5471227c-40d9-4b85-b4f6-d0a41c471166@suse.com>
 <2016455e-6bbf-400a-82c9-05128487c5d4@suse.com>
 <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>
In-Reply-To: <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>

--------------RMB03lQjWqoDdeODTT4kQxJF
Content-Type: multipart/mixed; boundary="------------JDIri9qCoHAoyLvq8cHFWFv1"

--------------JDIri9qCoHAoyLvq8cHFWFv1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMTEuMjMgMTA6MjEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4xMS4yMDIz
IDA5OjU3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjIuMTEuMjMgMDk6MzksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjExLjIwMjMgMDk6MzEsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4gKysrIGIvdG9vbHMvcHl0aG9u
Ly5naXRpZ25vcmUNCj4+Pj4gQEAgLTAsMCArMSw0IEBADQo+Pj4+ICtidWlsZC8qDQo+Pj4N
Cj4+PiBBcmUgdGhpcyBhbmQganVzdCBidWlsZC8gYWN0dWFsbHkgZXF1aXZhbGVudD8gTG9v
a2luZyBhdCBvdXIgdG9wLWxldmVsDQo+Pj4gLmdpdGlnbm9yZSwgSSBzZWUgZS5nLiBleHRy
YXMvIGFuZCBpbnN0YWxsLyosIHdoaWNoIEkgd291bGQgZXhwZWN0IHdhbnQNCj4+PiBib3Ro
IHRyZWF0aW5nIHRoZSBzYW1lPyBUaGUgZm9ybSB3aXRoIGEgd2lsZGNhcmQsIHRvIG1lIGF0
IGxlYXN0LA0KPj4+IGRvZXNuJ3Qgb2J2aW91c2x5IGluY2x1ZGUgdGhlIGRpcmVjdG9yeSBp
dHNlbGYgLi4uDQo+Pg0KPj4gVGhlIC5naXRpZ25vcmUgc3BlY2lmaWNhdGlvbiBbMV0gc3Vn
Z2VzdHMgdGhhdCB3ZSBzaG91bGQgdXNlIGJ1aWxkLyAoc2FtZSBmb3INCj4+IHRoZSBuZXcg
ZW50cnkpLCBhcyBvdGhlcndpc2UgZW50cmllcyBpbiBzdWJkaXJlY3RvcmllcyB3b3VsZCBu
b3QgbWF0Y2guDQo+IA0KPiBUaGUgZGVzY3JpcHRpb24gdGhlcmUgb2Ygd2hhdCBhIHRyYWls
aW5nIHNsYXNoIG1lYW5zIGlzbid0IHJlYWxseSBjbGVhci4NCg0KIklmIHRoZXJlIGlzIGEg
c2VwYXJhdG9yIGF0IHRoZSBlbmQgb2YgdGhlIHBhdHRlcm4gdGhlbiB0aGUgcGF0dGVybiB3
aWxsIG9ubHkNCm1hdGNoIGRpcmVjdG9yaWVzLCBvdGhlcndpc2UgdGhlIHBhdHRlcm4gY2Fu
IG1hdGNoIGJvdGggZmlsZXMgYW5kIGRpcmVjdG9yaWVzLiINCg0KIlRoZSBwYXR0ZXJuIGZv
by8gd2lsbCBtYXRjaCBhIGRpcmVjdG9yeSBmb28gYW5kIHBhdGhzIHVuZGVybmVhdGggaXQs
IGJ1dCB3aWxsIA0Kbm90IG1hdGNoIGEgcmVndWxhciBmaWxlIG9yIGEgc3ltYm9saWMgbGlu
ayBmb28iDQoNCj4gTm90aGluZyBpcyBzYWlkIGFib3V0IGFueXRoaW5nIHVuZGVybmVhdGgg
dGhlIHNwZWNpZmllZCBkaXJlY3RvcnkuIEFsc28NCj4gbm90aGluZyBpcyBzYWlkIGFib3V0
IHdoYXQgYSB0cmFpbGluZyAvKiBtZWFucyB0b3dhcmRzIHRoZSBuYW1lZCBkaXJlY3Rvcnku
DQoNCiJUaGUgcGF0dGVybiBmb28vKiwgbWF0Y2hlcyBmb28vdGVzdC5qc29uIChhIHJlZ3Vs
YXIgZmlsZSksIGZvby9iYXIgKGEgDQpkaXJlY3RvcnkpLCBidXQgaXQgZG9lcyBub3QgbWF0
Y2ggZm9vL2Jhci9oZWxsby5jIChhIHJlZ3VsYXIgZmlsZSksIGFzIHRoZSANCmFzdGVyaXNr
IGluIHRoZSBwYXR0ZXJuIGRvZXMgbm90IG1hdGNoIGJhci9oZWxsby5jIHdoaWNoIGhhcyBh
IHNsYXNoIGluIGl0LiINCg0KPiBXaGF0IF9pc18gc2FpZCBpcyB0aGF0IGFsbCB0aGUgbmV3
IGVudHJpZXMgaGVyZSBzaG91bGQgc3RhcnQgd2l0aCBhIHNsYXNoLA0KPiB0byBhdm9pZCBt
YXRjaGluZyBzaW1pbGFybHkgbmFtZWQgc3ViZGlyZWN0b3JpZXMgZnVydGhlciBpbnRvIHRv
b2xzL3B5dGhvbi8uDQo+IFVubGVzcyBJIG1pc3VuZGVyc3RhbmQgdGhlIGludGVudGlvbiBv
ZiB0aGlzIC5naXRpZ25vcmUgZW50cnkgYW5kIHRoZSBnb2FsDQo+IGlzIHRvIG1hdGNoIGFu
eXdoZXJlIGluIHRoZSBzdWJ0cmVlLg0KDQpZb3UgYXJlIHJpZ2h0LCBJIHNob3VsZCBjaGFu
Z2UgdGhhdC4NCg0KDQpKdWVyZ2VuDQo=
--------------JDIri9qCoHAoyLvq8cHFWFv1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JDIri9qCoHAoyLvq8cHFWFv1--

--------------RMB03lQjWqoDdeODTT4kQxJF--

--------------Y7LO0NEA0Z7eu901Dfd0C4TV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVdz7MFAwAAAAAACgkQsN6d1ii/Ey9R
jQf/Uwn7EpgsGW3iKo14f9rgUc7QnTvE1npd2e9x9oAMsPg1ovNYCSY7ic0YqCiUgEVGS0ZFYAqU
5xrwQLKkOaTiQKvDsoDUMmE5i5XWxB3R39zw73hu5ozpa6TfDeFGdJ8QKM3pdzB+jPhRYz/OyruA
BewT1F36GxwzWNr+NyYOpiyCKkdoFu9Pvj5Il253Ey5XEZ7mpmmrT0eS74iNs+yWyTbyr2JREu0S
LfMJ+o/mVPycj//KK9qq0cr0oSUi+FuWhfAtm9+224zvBymM08cNw1mENbdNzsu55TaVW7HMGGjv
/+0Ehgf76mE8j9layWlX6iPT+/A6Ps1dbanUyHC/IQ==
=fcer
-----END PGP SIGNATURE-----

--------------Y7LO0NEA0Z7eu901Dfd0C4TV--

