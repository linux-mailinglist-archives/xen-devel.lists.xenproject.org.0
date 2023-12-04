Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A736D802BE8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646521.1008845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA36V-0000Cw-4F; Mon, 04 Dec 2023 07:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646521.1008845; Mon, 04 Dec 2023 07:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA36V-0000AH-0f; Mon, 04 Dec 2023 07:10:55 +0000
Received: by outflank-mailman (input) for mailman id 646521;
 Mon, 04 Dec 2023 07:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rA36T-0000A3-Jv
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:10:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4164a683-9274-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 08:10:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8A981FE4F;
 Mon,  4 Dec 2023 07:10:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 780D31398A;
 Mon,  4 Dec 2023 07:10:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oUOXG3p7bWU7CwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 07:10:50 +0000
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
X-Inumbo-ID: 4164a683-9274-11ee-9b0f-b553b5be7939
Message-ID: <b7e347af-c85b-4a54-b5d7-3bd8d6bdf2c7@suse.com>
Date: Mon, 4 Dec 2023 08:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
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
In-Reply-To: <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FsJjaZnlEOK8Mxc0ueRCiJz3"
X-Spamd-Bar: ++++++++++++++++++++
X-Spam-Score: 20.63
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine)
X-Rspamd-Queue-Id: A8A981FE4F
X-Spam-Flag: NO
X-Spam-Level: ********************
X-Spamd-Result: default: False [20.63 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:~,6:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(2.16)[0.719];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain,text/x-patch];
	 NEURAL_SPAM_LONG(3.47)[0.992];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FsJjaZnlEOK8Mxc0ueRCiJz3
Content-Type: multipart/mixed; boundary="------------K4r0694pD4KCcgN7DyyueSPB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <b7e347af-c85b-4a54-b5d7-3bd8d6bdf2c7@suse.com>
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
In-Reply-To: <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>

--------------K4r0694pD4KCcgN7DyyueSPB
Content-Type: multipart/mixed; boundary="------------M480jiEajsjJ0vYZPWba35o5"

--------------M480jiEajsjJ0vYZPWba35o5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjMgMjE6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAxLzEyLzIw
MjMgNzo1OSBwbSwgUmVuw6kgV2ludGhlciBIw7hqZ2FhcmQgd3JvdGU6DQo+PiBJZiBJIHNl
dCBzbXQ9b2ZmIGFuZCB0cnkgdG8gY29uZmlndXJlIGNwdXBvb2xzIHdpdGggY3JlZGl0KDEp
IGFzIGlmDQo+PiBhbGwgY29yZXMgYXJlIGF2YWlsYWJsZSwgSSBnZXQgdGhlIGZvbGxvd2lu
ZyBjcmFzaC4NCj4+DQo+PiBUaGUgY3Jhc2ggaGFwcGVucyB3aGVuIEkgdHJ5IHRvIHVzZSB4
bCBjcHVwb29sLWFkZC1jcHUgb24gdGhlIGRpc2FibGVkDQo+PiBIVCBzaWJsaW5nIGNvcmVz
Lg0KPj4NCj4+IEh5cGVyLXRocmVhZGluZyBpcyBlbmFibGVkIGluIHRoZSBmaXJtd2FyZSwg
YW5kIG9ubHkgZGlzYWJsZWQgd2l0aA0KPj4gc210PW9mZi4NCj4gDQo+IENDJ2luZyBzb21l
IG1haW50YWluZXJzLg0KDQpBdHRhY2hlZCBwYXRjaCBzaG91bGQgZml4IHRoZSBjcmFzaC4N
Cg0KUmVuw6ksIGFyZSB5b3UgZmluZSB3aXRoIHRoZSAiUmVwb3J0ZWQtYnk6IiB0YWcgYmVp
bmcgYWRkZWQgdG8gdGhlIHBhdGNoPw0KDQpJJ2xsIHNlbmQgYSBwcm9wZXIgcGF0Y2ggbWFp
bCB3aGVuIGhhdmluZyBoZWFyZCBmcm9tIHlvdS4NCg0KDQpKdWVyZ2VuDQo=
--------------M480jiEajsjJ0vYZPWba35o5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-adding-offline-cpu-to-cpupool.patch"
Content-Disposition: attachment;
 filename="0001-xen-sched-fix-adding-offline-cpu-to-cpupool.patch"
Content-Transfer-Encoding: base64

RnJvbSA2NWM3MGNjNTNkZjNhNzEyMjViMTFjYjk1ODQ4ZjEyZjVhNTY1ZDVkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IE1vbiwgNCBEZWMgMjAyMyAwODowMDoyMSArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IHhlbi9zY2hlZDogZml4IGFkZGluZyBvZmZsaW5lIGNwdSB0byBjcHVwb29sCk1JTUUtVmVy
c2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUcnlpbmcgdG8gYWRkIGFuIG9mZmxpbmUg
Y3B1IHRvIGEgY3B1cG9vbCBjYW4gY3Jhc2ggdGhlIGh5cGVydmlzb3IsCmFzIHRoZSBwcm9i
YWJseSBub24tZXhpc3RpbmcgcGVyY3B1IGFyZWEgb2YgdGhlIGNwdSBpcyBhY2Nlc3NlZCBi
ZWZvcmUKdGhlIGF2YWlsYWJpbGl0eSBvZiB0aGUgY3B1IGlzIGJlaW5nIHRlc3RlZC4KCkZp
eCB0aGF0IGJ5IHRlc3RpbmcgdGhlIGNwdSB0byBiZSBvbmxpbmUuCgpGaXhlczogY2I1NjNk
NzY2NWYyICgieGVuL3NjaGVkOiBzdXBwb3J0IGNvcmUgc2NoZWR1bGluZyBmb3IgbW92aW5n
IGNwdXMgdG8vZnJvbSBjcHVwb29scyIpClJlcG9ydGVkLWJ5OiBSZW7DqSBXaW50aGVyIEjD
uGpnYWFyZCA8cmVuZXdpbkBwcm90b24ubWU+ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5j
CmluZGV4IDJlMDk0YjBjZmEuLmFkOGY2MDg0NjIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24v
c2NoZWQvY3B1cG9vbC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCkBAIC04
OTIsNiArODkyLDggQEAgaW50IGNwdXBvb2xfZG9fc3lzY3RsKHN0cnVjdCB4ZW5fc3lzY3Rs
X2NwdXBvb2xfb3AgKm9wKQogICAgICAgICBpZiAoIGNwdSA+PSBucl9jcHVfaWRzICkKICAg
ICAgICAgICAgIGdvdG8gYWRkY3B1X291dDsKICAgICAgICAgcmV0ID0gLUVOT0RFVjsKKyAg
ICAgICAgaWYgKCAhY3B1X29ubGluZShjcHUpICkKKyAgICAgICAgICAgIGdvdG8gYWRkY3B1
X291dDsKICAgICAgICAgY3B1cyA9IHNjaGVkX2dldF9vcHRfY3B1bWFzayhjLT5ncmFuLCBj
cHUpOwogICAgICAgICBpZiAoICFjcHVtYXNrX3N1YnNldChjcHVzLCAmY3B1cG9vbF9mcmVl
X2NwdXMpIHx8CiAgICAgICAgICAgICAgY3B1bWFza19pbnRlcnNlY3RzKGNwdXMsICZjcHVw
b29sX2xvY2tlZF9jcHVzKSApCi0tIAoyLjM1LjMKCg==
--------------M480jiEajsjJ0vYZPWba35o5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------M480jiEajsjJ0vYZPWba35o5--

--------------K4r0694pD4KCcgN7DyyueSPB--

--------------FsJjaZnlEOK8Mxc0ueRCiJz3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVte3kFAwAAAAAACgkQsN6d1ii/Ey9h
GQf+KJYnVaakcd9QBpwDSlzzvGKqhaKBNG5Zt1k4H5cDa+SOoW07lGKL+3U5RQpMIbeSODMytB1I
CuyCFgUCMD6mHUkdEVd4VoBn/Qgrcp3M82vvomnmx9xuFyL4TkVsxtgI6QZKaOIQdT6nuQiE/8s7
TcS/deaV9bCCfkKgqZun48cPomxq84ZztPi6rJriRyPV4ef5n/Ty3EMqdW6+IIcbS0wEXcZJfqMD
KctBhbMAdQum6rlBhhnup7AkbMW5Ytqo9vdOw0qQ6u3ue68saaXbvGCF9KLDuz1/G8Kg5rAa1+1T
s26WviNPhcMEDci2PXh+TFolgS9u0Wg9WjzaIuN2zQ==
=LxaN
-----END PGP SIGNATURE-----

--------------FsJjaZnlEOK8Mxc0ueRCiJz3--

