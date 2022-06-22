Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22BB554558
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353759.580737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xrZ-0003YY-Np; Wed, 22 Jun 2022 10:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353759.580737; Wed, 22 Jun 2022 10:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xrZ-0003V6-Ka; Wed, 22 Jun 2022 10:45:33 +0000
Received: by outflank-mailman (input) for mailman id 353759;
 Wed, 22 Jun 2022 10:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3xrY-0003V0-Hj
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:45:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd562b2-f218-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 12:45:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CCBC421A97;
 Wed, 22 Jun 2022 10:45:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD89B134A9;
 Wed, 22 Jun 2022 10:45:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +UzKKMrysmJPVQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 10:45:30 +0000
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
X-Inumbo-ID: 6fd562b2-f218-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655894730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=aRapF1oRH7n+rUj6AqavtElno3IhEnMrbC5x00uKDR4=;
	b=PPiyCV2q2kJhKctVq8iv7cx5ew7fY7V7VKRIZjc4TSsM2aOl6YUtc900DI1oeeEBovmyx1
	oeDFVgfxYdMafqgzesTBHQ/qcJXaDEuN23m5iLHAn376AIEvuEt8Auvd4U6OJGBu6BuYBO
	y+0fNOebKtBjHP8IM/jXTrOx+5f6vz0=
Message-ID: <d465abfb-6d44-0739-9959-3e3311dd671c@suse.com>
Date: Wed, 22 Jun 2022 12:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Tentative fix for dom0 boot problem
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------envwsNKROTDCMCw20S0Myj33"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------envwsNKROTDCMCw20S0Myj33
Content-Type: multipart/mixed; boundary="------------3BYPQVRNjCFz0IeZEydB0qyT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d465abfb-6d44-0739-9959-3e3311dd671c@suse.com>
Subject: Tentative fix for dom0 boot problem

--------------3BYPQVRNjCFz0IeZEydB0qyT
Content-Type: multipart/mixed; boundary="------------lF0NVraN6G0wylrX4pR4NAAH"

--------------lF0NVraN6G0wylrX4pR4NAAH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SnVsaWVuLA0KDQpjb3VsZCB5b3UgcGxlYXNlIHRlc3QgdGhlIGF0dGFjaGVkIHBhdGNoZXM/
DQoNCg0KSnVlcmdlbg0K
--------------lF0NVraN6G0wylrX4pR4NAAH
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-x86-xen-use-clear_bss-for-Xen-PV-guests.patch"
Content-Disposition: attachment;
 filename="0001-x86-xen-use-clear_bss-for-Xen-PV-guests.patch"
Content-Transfer-Encoding: base64

RnJvbSA3ZDY3MzRlNTE3YjY1YzM3MDJhMjc5ZmMyYzFmZmY1YmE3OTI3ZWY5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IFdlZCwgMjIgSnVuIDIwMjIgMTI6MTk6NTUgKzAyMDAKU3ViamVjdDogW1BBVENI
IDEvMl0geDg2L3hlbjogdXNlIGNsZWFyX2JzcygpIGZvciBYZW4gUFYgZ3Vlc3RzCgpJbnN0
ZWFkIG9mIGNsZWFyaW5nIHRoZSBic3MgYXJlYSBpbiBhc3NlbWJseSBjb2RlLCB1c2UgdGhl
IGNsZWFyX2JzcygpCmZ1bmN0aW9uLgoKVGhpcyByZXF1aXJlcyB0byBwYXNzIHRoZSBzdGFy
dF9pbmZvIGFkZHJlc3MgYXMgcGFyYW1ldGVyIHRvCnhlbl9zdGFydF9rZXJuZWwoKSBpbiBv
cmRlciB0byBhdm9pZCB0aGUgeGVuX3N0YXJ0X2luZm8gYmVpbmcgemVyb2VkCmFnYWluLgoK
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL3NldHVwLmggfCAgMyArKysKIGFyY2gveDg2L2tlcm5lbC9o
ZWFkNjQuYyAgICAgfCAgMiArLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jICB8ICA4
ICsrKysrKy0tCiBhcmNoL3g4Ni94ZW4veGVuLWhlYWQuUyAgICAgIHwgMTAgKy0tLS0tLS0t
LQogNCBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vc2V0dXAuaAppbmRleCBmOGI5ZWU5N2E4OTEuLmYzN2NiZmY3MzU0YyAx
MDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9zZXR1cC5oCkBAIC0xMjAsNiArMTIwLDkgQEAgdm9pZCAqZXh0ZW5k
X2JyayhzaXplX3Qgc2l6ZSwgc2l6ZV90IGFsaWduKTsKIAlzdGF0aWMgY2hhciBfX2Jya18j
I25hbWVbc2l6ZV0KIAogZXh0ZXJuIHZvaWQgcHJvYmVfcm9tcyh2b2lkKTsKKwordm9pZCBj
bGVhcl9ic3Modm9pZCk7CisKICNpZmRlZiBfX2kzODZfXwogCiBhc21saW5rYWdlIHZvaWQg
X19pbml0IGkzODZfc3RhcnRfa2VybmVsKHZvaWQpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a2VybmVsL2hlYWQ2NC5jIGIvYXJjaC94ODYva2VybmVsL2hlYWQ2NC5jCmluZGV4IGJkNGEz
NDEwMGVkMC4uZTdlMjMzMjA5YThjIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvaGVh
ZDY0LmMKKysrIGIvYXJjaC94ODYva2VybmVsL2hlYWQ2NC5jCkBAIC00MjYsNyArNDI2LDcg
QEAgdm9pZCBfX2luaXQgZG9fZWFybHlfZXhjZXB0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCBpbnQgdHJhcG5yKQogCiAvKiBEb24ndCBhZGQgYSBwcmludGsgaW4gdGhlcmUuIHByaW50
ayByZWxpZXMgb24gdGhlIFBEQSB3aGljaCBpcyBub3QgaW5pdGlhbGl6ZWQgCiAgICB5ZXQu
ICovCi1zdGF0aWMgdm9pZCBfX2luaXQgY2xlYXJfYnNzKHZvaWQpCit2b2lkIF9faW5pdCBj
bGVhcl9ic3Modm9pZCkKIHsKIAltZW1zZXQoX19ic3Nfc3RhcnQsIDAsCiAJICAgICAgICh1
bnNpZ25lZCBsb25nKSBfX2Jzc19zdG9wIC0gKHVuc2lnbmVkIGxvbmcpIF9fYnNzX3N0YXJ0
KTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5fcHYuYwppbmRleCBlMzI5N2IxNTcwMWMuLjcwZmIyZWE4NWU5MCAx
MDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCisrKyBiL2FyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5fcHYuYwpAQCAtMTE4MywxNSArMTE4MywxOSBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgeGVuX2RvbXVfc2V0X2xlZ2FjeV9mZWF0dXJlcyh2b2lkKQogZXh0ZXJuIHZv
aWQgZWFybHlfeGVuX2lyZXRfcGF0Y2godm9pZCk7CiAKIC8qIEZpcnN0IEMgZnVuY3Rpb24g
dG8gYmUgY2FsbGVkIG9uIFhlbiBib290ICovCi1hc21saW5rYWdlIF9fdmlzaWJsZSB2b2lk
IF9faW5pdCB4ZW5fc3RhcnRfa2VybmVsKHZvaWQpCithc21saW5rYWdlIF9fdmlzaWJsZSB2
b2lkIF9faW5pdCB4ZW5fc3RhcnRfa2VybmVsKHN0cnVjdCBzdGFydF9pbmZvICpzaSkKIHsK
IAlzdHJ1Y3QgcGh5c2Rldl9zZXRfaW9wbCBzZXRfaW9wbDsKIAl1bnNpZ25lZCBsb25nIGlu
aXRyZF9zdGFydCA9IDA7CiAJaW50IHJjOwogCi0JaWYgKCF4ZW5fc3RhcnRfaW5mbykKKwlp
ZiAoIXNpKQogCQlyZXR1cm47CiAKKwljbGVhcl9ic3MoKTsKKworCXhlbl9zdGFydF9pbmZv
ID0gc2k7CisKIAlfX3RleHRfZ2VuX2luc24oJmVhcmx5X3hlbl9pcmV0X3BhdGNoLAogCQkJ
Sk1QMzJfSU5TTl9PUENPREUsICZlYXJseV94ZW5faXJldF9wYXRjaCwgJnhlbl9pcmV0LAog
CQkJSk1QMzJfSU5TTl9TSVpFKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4taGVh
ZC5TIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKaW5kZXggM2EyY2Q5M2JmMDU5Li4xM2Fm
NmZlNDUzZTMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TCisrKyBiL2Fy
Y2gveDg2L3hlbi94ZW4taGVhZC5TCkBAIC00OCwxNSArNDgsNiBAQCBTWU1fQ09ERV9TVEFS
VChzdGFydHVwX3hlbikKIAlBTk5PVEFURV9OT0VOREJSCiAJY2xkCiAKLQkvKiBDbGVhciAu
YnNzICovCi0JeG9yICVlYXgsJWVheAotCW1vdiAkX19ic3Nfc3RhcnQsICVyZGkKLQltb3Yg
JF9fYnNzX3N0b3AsICVyY3gKLQlzdWIgJXJkaSwgJXJjeAotCXNociAkMywgJXJjeAotCXJl
cCBzdG9zcQotCi0JbW92ICVyc2ksIHhlbl9zdGFydF9pbmZvCiAJbW92IGluaXRpYWxfc3Rh
Y2soJXJpcCksICVyc3AKIAogCS8qIFNldCB1cCAlZ3MuCkBAIC03MSw2ICs2Miw3IEBAIFNZ
TV9DT0RFX1NUQVJUKHN0YXJ0dXBfeGVuKQogCWNkcQogCXdybXNyCiAKKwltb3YJJXJzaSwg
JXJkaQogCWNhbGwgeGVuX3N0YXJ0X2tlcm5lbAogU1lNX0NPREVfRU5EKHN0YXJ0dXBfeGVu
KQogCV9fRklOSVQKLS0gCjIuMzUuMwoK
--------------lF0NVraN6G0wylrX4pR4NAAH
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-x86-fix-setup-of-brk-area.patch"
Content-Disposition: attachment;
 filename="0002-x86-fix-setup-of-brk-area.patch"
Content-Transfer-Encoding: base64

RnJvbSBmZjM1YmMzM2M1ZWUxODQ4NjhkNDFiZjc2ZGNjNzMyMjE5MWY5ZmQzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IFdlZCwgMjIgSnVuIDIwMjIgMTI6MTc6NDcgKzAyMDAKU3ViamVjdDogW1BBVENI
IDIvMl0geDg2OiBmaXggc2V0dXAgb2YgYnJrIGFyZWEKCkNvbW1pdCBlMzI2ODNjNmY3ZDIg
KCJ4ODYvbW06IEZpeCBSRVNFUlZFX0JSSygpIGZvciBvbGRlciBiaW51dGlscyIpCnB1dCB0
aGUgYnJrIGFyZWEgaW50byB0aGUgLmJzcyBzZWdtZW50LCBjYXVzaW5nIGl0IG5vdCB0byBi
ZSBjbGVhcmVkCmluaXRpYWxseS4gQXMgdGhlIGJyayBhcmVhIGlzIHVzZWQgdG8gYWxsb2Nh
dGUgZWFybHkgcGFnZSB0YWJsZXMsIHRoZXNlCm1pZ2h0IGNvbnRhaW4gZ2FyYmFnZSBpbiBu
b3QgZXhwbGljaXRseSB3cml0dGVuIGVudHJpZXMuCgpGaXggdGhhdCBieSBsZXR0aW5nIGNs
ZWFyX2JzcygpIGNsZWFyIHRoZSBicmsgYXJlYSwgdG9vLgoKRml4ZXM6IGUzMjY4M2M2Zjdk
MiAoIng4Ni9tbTogRml4IFJFU0VSVkVfQlJLKCkgZm9yIG9sZGVyIGJpbnV0aWxzIikKU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGFyY2gv
eDg2L2tlcm5lbC9oZWFkNjQuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvaGVhZDY0LmMgYi9hcmNoL3g4
Ni9rZXJuZWwvaGVhZDY0LmMKaW5kZXggZTdlMjMzMjA5YThjLi42YTNjZmFmNmI3MmEgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9oZWFkNjQuYworKysgYi9hcmNoL3g4Ni9rZXJu
ZWwvaGVhZDY0LmMKQEAgLTQzMCw2ICs0MzAsOCBAQCB2b2lkIF9faW5pdCBjbGVhcl9ic3Mo
dm9pZCkKIHsKIAltZW1zZXQoX19ic3Nfc3RhcnQsIDAsCiAJICAgICAgICh1bnNpZ25lZCBs
b25nKSBfX2Jzc19zdG9wIC0gKHVuc2lnbmVkIGxvbmcpIF9fYnNzX3N0YXJ0KTsKKwltZW1z
ZXQoX19icmtfYmFzZSwgMCwKKwkgICAgICAgKHVuc2lnbmVkIGxvbmcpIF9fYnJrX2xpbWl0
IC0gKHVuc2lnbmVkIGxvbmcpIF9fYnJrX2Jhc2UpOwogfQogCiBzdGF0aWMgdW5zaWduZWQg
bG9uZyBnZXRfY21kX2xpbmVfcHRyKHZvaWQpCi0tIAoyLjM1LjMKCg==
--------------lF0NVraN6G0wylrX4pR4NAAH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------lF0NVraN6G0wylrX4pR4NAAH--

--------------3BYPQVRNjCFz0IeZEydB0qyT--

--------------envwsNKROTDCMCw20S0Myj33
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKy8soFAwAAAAAACgkQsN6d1ii/Ey/M
gAf+Pmx0AqeqQ98JMe9TIWqkLfjNnrNpdedGi/wHNxmLKb8rd3Suo/m03K3cjge+lt/31guw5WPl
amPvQKUT8KbFmyhSXLukxN11fQcr30Ket7KRnRhRZu23ytFf45VP5gBl999y4oQkCcCc5uuAc87D
yg00cmBZkP90nudB/+pwF7l5aGtDZ9EnJkw6x1Cb3u+F8rsQKpiMWm6g3rIgdXGRLcFNDKQp1JV4
8JRcOp6VCR2g2M68Ww9oeyD+gSWZYRKJshMmAqtsLeCqoKFWazTt7ZvMWxbx3d4HprdVg4fVhInK
TckZv3q5Vq4spfNutWYLwRg5IqZG8hgzc+4OEaUD+g==
=mTwu
-----END PGP SIGNATURE-----

--------------envwsNKROTDCMCw20S0Myj33--

