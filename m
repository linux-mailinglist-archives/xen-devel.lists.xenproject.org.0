Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9CC7F444E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638683.995528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ko0-0000h1-Pl; Wed, 22 Nov 2023 10:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638683.995528; Wed, 22 Nov 2023 10:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ko0-0000dP-N8; Wed, 22 Nov 2023 10:50:04 +0000
Received: by outflank-mailman (input) for mailman id 638683;
 Wed, 22 Nov 2023 10:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5knz-0000Lw-7m
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:50:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3246798-8924-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 11:50:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57DA421961;
 Wed, 22 Nov 2023 10:50:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 031DB139FD;
 Wed, 22 Nov 2023 10:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3PKbOtjcXWXUHwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 10:50:00 +0000
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
X-Inumbo-ID: e3246798-8924-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700650201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W4CSGw4FGehKfwyjMkzrYtIF5+wXDEd39knSFeWOgKk=;
	b=ZbTD/P7N/xweUDNS8icAquI54BgIAdyL4U7XSmNvCHOx84sGQ86b0rjZtYgrWL3YssJ/JX
	O7oIpKINAMgKCLlqGaPL+rbJSKmzbkUOfX+X5bOkP0QpTBJ42ySP6J5SSr7qTl4p+IvTrs
	TMxWFmHR4nmK6J0wLAYyzCGbSvbtzs4=
Message-ID: <e19b7790-413f-40cf-b9a6-57e4d6a40640@suse.com>
Date: Wed, 22 Nov 2023 11:50:00 +0100
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
 <84234983-f811-4e5a-b01a-0a68f2e73447@suse.com>
 <1ff6aaca-af90-4982-a8a1-a9d8c8e2934f@suse.com>
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
In-Reply-To: <1ff6aaca-af90-4982-a8a1-a9d8c8e2934f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1kW1gJgdsa2jf7uhvLyJ6XTA"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.19
X-Spamd-Result: default: False [-5.19 / 50.00];
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
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
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
--------------1kW1gJgdsa2jf7uhvLyJ6XTA
Content-Type: multipart/mixed; boundary="------------1YHss0JKdoLMcZKleAtn0pJa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <e19b7790-413f-40cf-b9a6-57e4d6a40640@suse.com>
Subject: Re: [PATCH 2/2] tools/python: add .gitignore file
References: <20231122083153.24101-1-jgross@suse.com>
 <20231122083153.24101-3-jgross@suse.com>
 <5471227c-40d9-4b85-b4f6-d0a41c471166@suse.com>
 <2016455e-6bbf-400a-82c9-05128487c5d4@suse.com>
 <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>
 <84234983-f811-4e5a-b01a-0a68f2e73447@suse.com>
 <1ff6aaca-af90-4982-a8a1-a9d8c8e2934f@suse.com>
In-Reply-To: <1ff6aaca-af90-4982-a8a1-a9d8c8e2934f@suse.com>

--------------1YHss0JKdoLMcZKleAtn0pJa
Content-Type: multipart/mixed; boundary="------------zt9gv0zvoU265b0HoyRZTBi4"

--------------zt9gv0zvoU265b0HoyRZTBi4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMTEuMjMgMTA6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4xMS4yMDIz
IDEwOjUzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjIuMTEuMjMgMTA6MjEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjExLjIwMjMgMDk6NTcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDIyLjExLjIzIDA5OjM5LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDIyLjExLjIwMjMgMDk6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gLS0tIC9kZXYvbnVsbA0KPj4+Pj4+ICsrKyBiL3Rvb2xzL3B5dGhvbi8uZ2l0aWdub3Jl
DQo+Pj4+Pj4gQEAgLTAsMCArMSw0IEBADQo+Pj4+Pj4gK2J1aWxkLyoNCj4+Pj4+DQo+Pj4+
PiBBcmUgdGhpcyBhbmQganVzdCBidWlsZC8gYWN0dWFsbHkgZXF1aXZhbGVudD8gTG9va2lu
ZyBhdCBvdXIgdG9wLWxldmVsDQo+Pj4+PiAuZ2l0aWdub3JlLCBJIHNlZSBlLmcuIGV4dHJh
cy8gYW5kIGluc3RhbGwvKiwgd2hpY2ggSSB3b3VsZCBleHBlY3Qgd2FudA0KPj4+Pj4gYm90
aCB0cmVhdGluZyB0aGUgc2FtZT8gVGhlIGZvcm0gd2l0aCBhIHdpbGRjYXJkLCB0byBtZSBh
dCBsZWFzdCwNCj4+Pj4+IGRvZXNuJ3Qgb2J2aW91c2x5IGluY2x1ZGUgdGhlIGRpcmVjdG9y
eSBpdHNlbGYgLi4uDQo+Pj4+DQo+Pj4+IFRoZSAuZ2l0aWdub3JlIHNwZWNpZmljYXRpb24g
WzFdIHN1Z2dlc3RzIHRoYXQgd2Ugc2hvdWxkIHVzZSBidWlsZC8gKHNhbWUgZm9yDQo+Pj4+
IHRoZSBuZXcgZW50cnkpLCBhcyBvdGhlcndpc2UgZW50cmllcyBpbiBzdWJkaXJlY3Rvcmll
cyB3b3VsZCBub3QgbWF0Y2guDQo+Pj4NCj4+PiBUaGUgZGVzY3JpcHRpb24gdGhlcmUgb2Yg
d2hhdCBhIHRyYWlsaW5nIHNsYXNoIG1lYW5zIGlzbid0IHJlYWxseSBjbGVhci4NCj4+DQo+
PiAiSWYgdGhlcmUgaXMgYSBzZXBhcmF0b3IgYXQgdGhlIGVuZCBvZiB0aGUgcGF0dGVybiB0
aGVuIHRoZSBwYXR0ZXJuIHdpbGwgb25seQ0KPj4gbWF0Y2ggZGlyZWN0b3JpZXMsIG90aGVy
d2lzZSB0aGUgcGF0dGVybiBjYW4gbWF0Y2ggYm90aCBmaWxlcyBhbmQgZGlyZWN0b3JpZXMu
Ig0KPj4NCj4+ICJUaGUgcGF0dGVybiBmb28vIHdpbGwgbWF0Y2ggYSBkaXJlY3RvcnkgZm9v
IGFuZCBwYXRocyB1bmRlcm5lYXRoIGl0LCBidXQgd2lsbA0KPj4gbm90IG1hdGNoIGEgcmVn
dWxhciBmaWxlIG9yIGEgc3ltYm9saWMgbGluayBmb28iDQo+IA0KPiBCdXQgdGhpcyBpcyBh
bGwgYWJvdXQgZW50cmllcyBuYW1lZCAiZm9vIi4gTm90aGluZyBpcyBzYWlkIGFib3V0IHdo
ZXRoZXINCj4gZm9vLyBhbHNvIGluY2x1ZGVzIGZvby9iYXIuYy4NCj4gDQo+Pj4gTm90aGlu
ZyBpcyBzYWlkIGFib3V0IGFueXRoaW5nIHVuZGVybmVhdGggdGhlIHNwZWNpZmllZCBkaXJl
Y3RvcnkuIEFsc28NCj4+PiBub3RoaW5nIGlzIHNhaWQgYWJvdXQgd2hhdCBhIHRyYWlsaW5n
IC8qIG1lYW5zIHRvd2FyZHMgdGhlIG5hbWVkIGRpcmVjdG9yeS4NCj4+DQo+PiAiVGhlIHBh
dHRlcm4gZm9vLyosIG1hdGNoZXMgZm9vL3Rlc3QuanNvbiAoYSByZWd1bGFyIGZpbGUpLCBm
b28vYmFyIChhDQo+PiBkaXJlY3RvcnkpLCBidXQgaXQgZG9lcyBub3QgbWF0Y2ggZm9vL2Jh
ci9oZWxsby5jIChhIHJlZ3VsYXIgZmlsZSksIGFzIHRoZQ0KPj4gYXN0ZXJpc2sgaW4gdGhl
IHBhdHRlcm4gZG9lcyBub3QgbWF0Y2ggYmFyL2hlbGxvLmMgd2hpY2ggaGFzIGEgc2xhc2gg
aW4gaXQuIg0KPiANCj4gU2ltaWxhcmx5IGhlcmUgLSBub3RoaW5nIGlzIHNhaWQgYWJvdXQg
Zm9vIGl0c2VsZi4gWWV0IGZyb20gdXMgc3VjY2Vzc2Z1bGx5DQo+IHVzaW5nIGZvby8qIGVu
dHJpZXMgSSBkZXJpdmUgdGhhdCB0aGV5IGFjdHVhbGx5IGNvdmVyIGZvbyBhcyB3ZWxsLCBu
byBtYXR0ZXINCj4gd2hldGhlciB0aGF0J3MgYWN0dWFsbHkgc2Vuc2libGUuDQoNClRoaXMg
Y2FuIGFsbCBiZSB0ZXN0ZWQgcmF0aGVyIGVhc2lseSB3aXRoICJnaXQgY2hlY2staWdub3Jl
IiAoYXNzdW1pbmcgdGhhdCBnaXQNCml0c2VsZiBpcyB0cnVzdGVkIHRvIGFjdCBjb3JyZWN0
bHkpLg0KDQpNeSB0ZXN0cyB3ZXJlIGRvbmUgd2l0aCBnaXQgdmVyc2lvbiAyLjM1LjMNCg0K
VGhpcyB0ZXN0IHN1Z2dlc3RzIHRoYXQgIi9idWlsZC8qIiB3b24ndCBtYXRjaCB3aXRoICJi
dWlsZCIsIGJ1dCB3aXRoICJidWlsZC94Ig0KYW5kICJidWlsZC94L3kiLg0KDQoiL2J1aWxk
LyIgbWF0Y2hlcyB3aXRoICJidWlsZCIsICJidWlsZC94IiBhbmQgImJ1aWxkL3gveSIuDQoN
ClNvIHVzaW5nICIvYnVpbGQvIiBzZWVtcyB0byBiZSB0aGUgcGF0dGVybiB0byB1c2UuDQoN
Cg0KSnVlcmdlbg0K
--------------zt9gv0zvoU265b0HoyRZTBi4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zt9gv0zvoU265b0HoyRZTBi4--

--------------1YHss0JKdoLMcZKleAtn0pJa--

--------------1kW1gJgdsa2jf7uhvLyJ6XTA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVd3NgFAwAAAAAACgkQsN6d1ii/Ey9y
WAf9EfffF7Lp6p4ugxtJ5If8JWZY+UE3FG4zXUALkRloNWF1G0JV7BYy5h1Sg+tPVwVLcSx1olr4
18g2d17vOV4EMcTYeutJd+Llltlr8Wj/Itqww8YkI6Hfmyql6fabgrSuNaLpVBL44DpRS2iWa3dA
v2gCPVTiddNitDyB2SORUyGXXSfuWonmT+CfjqEKE6o+UodF/QNtRqVo0rTKkqCIF2ga/jj0LFDr
wytL9ovlLrj49EG16+/4bAPTTyCA7MlZHITGuaZcgV4xiPHeLkaVoK7cHMa/g7WDtGfIrakkB7dX
wpEk6vdTln2AjE1AbRqHznUVluZAqD6zkhQBJdJ9Xw==
=Lt/j
-----END PGP SIGNATURE-----

--------------1kW1gJgdsa2jf7uhvLyJ6XTA--

