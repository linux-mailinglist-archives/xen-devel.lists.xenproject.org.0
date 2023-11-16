Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594AD7EDF28
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 12:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634120.989383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3aCK-0004NO-3c; Thu, 16 Nov 2023 11:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634120.989383; Thu, 16 Nov 2023 11:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3aCK-0004L6-0S; Thu, 16 Nov 2023 11:06:12 +0000
Received: by outflank-mailman (input) for mailman id 634120;
 Thu, 16 Nov 2023 11:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pm+N=G5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r3aCI-0004L0-Kj
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 11:06:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22e43633-8470-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 12:06:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A7DA3204FF;
 Thu, 16 Nov 2023 11:06:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D3AE139C4;
 Thu, 16 Nov 2023 11:06:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OBYXHZz3VWX5PQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 16 Nov 2023 11:06:04 +0000
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
X-Inumbo-ID: 22e43633-8470-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700132764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+nA+TmpLdgB8xIBrmVgjfVNMLiBjkUKOe/p/rKNm2Cw=;
	b=ssP4qEs5yHtBstNCex8uEUovlSA5QDPipa9NCh2bQ0h2Zu698sUs0V2lZShsTmTEOOvWJU
	NWoiMysZkeP2aERcVYQG9GEcXF+3ldOgwPvpTvg0otyNDwIBWKy1fRcviONZnNnrUKB89e
	RS6rg+CtEx4JAenExWTKrZFaoUjALNo=
Message-ID: <d9e3939c-d0a9-44c1-b2ad-e10ab12466ea@suse.com>
Date: Thu, 16 Nov 2023 12:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 4.18 vs mini-os
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9202e48c-d2fe-4474-abd5-3110b805cf89@suse.com>
 <d4778dd4-8b7b-470b-adaa-ab5e7c36f097@xen.org>
Content-Language: en-US
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
In-Reply-To: <d4778dd4-8b7b-470b-adaa-ab5e7c36f097@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AtkHqfS0CgV0Beuf9MmJNhz7"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.58
X-Spamd-Result: default: False [-4.58 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-1.39)[90.83%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
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
--------------AtkHqfS0CgV0Beuf9MmJNhz7
Content-Type: multipart/mixed; boundary="------------3DooOHdc07xcmZmPP6mQqYib";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d9e3939c-d0a9-44c1-b2ad-e10ab12466ea@suse.com>
Subject: Re: 4.18 vs mini-os
References: <9202e48c-d2fe-4474-abd5-3110b805cf89@suse.com>
 <d4778dd4-8b7b-470b-adaa-ab5e7c36f097@xen.org>
In-Reply-To: <d4778dd4-8b7b-470b-adaa-ab5e7c36f097@xen.org>

--------------3DooOHdc07xcmZmPP6mQqYib
Content-Type: multipart/mixed; boundary="------------shUfe5AtKof3d3SU3C5rHpsW"

--------------shUfe5AtKof3d3SU3C5rHpsW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTEuMjMgMTI6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gKyBKdWVyZ2VuDQo+
IA0KPiBPbiAxNi8xMS8yMDIzIDA3OjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IEFsbCwN
Cj4gDQo+IEhpIEphbiwNCj4gDQo+PiBtYXkgSSBhc2sgb24gd2hhdCBiYXNpcyB0aGUgeGVu
LVJFTEVBU0UtNC4xOC4wIHRhZyBwbGFjZW1lbnQgd2FzIGNob3Nlbj8NCj4+IEl0IG1hdGNo
ZXMgdGhlIDQuMTcgb25lcywgZGVzcGl0ZSB0aGVyZSBoYXZpbmcgYmVlbiBuZXcgY29tbWl0
cyBmcm9tDQo+PiBKw7xyZ2VuIGRhdGluZyBiYWNrIHRvIEphbnVhcnkgLyBGZWJydWFyeS4g
KE15IG93biBidWlsZCBmaXggd291bGQgaGF2ZQ0KPj4gYmVlbiBuaWNlIHRvIGhhdmUsIHRv
bywgYnV0IEkgY2FuIHNlZSBob3cgdGhhdCBjYW1lIGxhdGUuKQ0KPiANCj4gQmVmb3JlIHRo
ZSB0YWdnaW5nLCB0aGUgbGFzdCB0aW1lIHdlIHVwZGF0ZWQgdG8gTUlOSU9TX1VQU1RSRUFN
X0NPTU1JVCB3YXMgaW4gDQo+IEp1bHkgMjAyMiAoc2VlIGJlbG93KS4NCj4gDQo+IFdoZW4g
SSBwcmVwYXJlIHRoZSByZWxlYXNlLCBJIGRvbid0IGhhdmUgc3RlcHMgdG8gY2hlY2sgdGhp
cyBpcyB0aGUgbGF0ZXN0IA0KPiBNaW5pLU9TLiBJbnN0ZWFkLCBJIHVzZSB0aGUgY29tbWl0
IGluIHRoZSB0YWcuDQo+IA0KPiBJIGJlbGlldmUgdGhpcyBpcyB0aGUgcmVzcG9uc2liaWxp
dHkgb2Ygd2hvZXZlciBkZWNpZGUgdG8gYWRkIGEgY29tbWl0IGluIA0KPiBNaW5pLU9TIHRv
IGFsc28gbWFrZSBzdXJlIENvbmZpZy5tayBpcyB1cGRhdGVkIGFjY29yZGluZ2x5Lg0KPiAN
Cj4gQW55d2F5LCB3ZSBuZXZlciB0ZXN0ZWQgWGVuIDQuMTggKGV2ZW4gYmVmb3JlIFJDKSB3
aXRoIHRoZSBuZXcgTWluaS1PUy4gU28gSSANCj4gZG9uJ3QgdGhpbmsgaXQgaXMgc2Vuc2li
bGUgdG8gdXBkYXRlIGl0IGF0IHRoaXMgc3RhZ2Ugb2YgdGhlIHJlbGVhc2UuIEJ1dCBJIA0K
PiB3b3VsZCBzdWdnZXN0IHRvIHNlbmQgYSBwYXRjaCB0byB1cGRhdGUgQ29uZmlnLm1rIHNv
IHRoZSBwcm9ibGVtIGRvZXNuJ3QgDQo+IHJlLW9jY3VyIGZvciA0LjE5Lg0KDQpJIHdhbnRl
ZCB0byBkbyB0aGlzIGFmdGVyIG15IGN1cnJlbnQgcGVuZGluZyBNaW5pLU9TIHBhdGNoZXMg
aGF2ZSBiZWVuIGFkZGVkDQp0byB0aGUgdHJlZS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------shUfe5AtKof3d3SU3C5rHpsW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------shUfe5AtKof3d3SU3C5rHpsW--

--------------3DooOHdc07xcmZmPP6mQqYib--

--------------AtkHqfS0CgV0Beuf9MmJNhz7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVV95wFAwAAAAAACgkQsN6d1ii/Ey+F
KggAmKVdle+VZEVDJ0U/FPzi/6XWH9yBajpu6AoJrMy9XrJLMoMftuR9oyPsMtlfsGHk4PpM3wnC
uovgpzZ8HtpplG82t1PMiDc0BrJHch1jag5YKt6yqhqJGAVUIHhyFPkzEd7kGAE6pkDh/y4qd6el
f1gO8csMcMeVH2CnE207yYYC5iVSUSAfVBKKQT6kgMHlot6TRreDFkDs3qR5vON9WRXn6iGmA6fI
XlfJXOcsPTWXIsRqhEThAx7dIH/7HOimTgCVDfwRvU3n7wMR0omEWlsk+pt7SOCSWaxc7J6NdJto
Z0i9CZ+GKPQKx34UABCP98Fin5/HOGDQp/i3HTdCsQ==
=g4Gm
-----END PGP SIGNATURE-----

--------------AtkHqfS0CgV0Beuf9MmJNhz7--

