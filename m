Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339C7F57E8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 06:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639353.996617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r62iO-0004ZV-4F; Thu, 23 Nov 2023 05:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639353.996617; Thu, 23 Nov 2023 05:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r62iO-0004XW-17; Thu, 23 Nov 2023 05:57:28 +0000
Received: by outflank-mailman (input) for mailman id 639353;
 Thu, 23 Nov 2023 05:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBIp=HE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r62iM-0004XQ-4v
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 05:57:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb3aca7-89c5-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 06:57:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 349272198E;
 Thu, 23 Nov 2023 05:57:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA487132B3;
 Thu, 23 Nov 2023 05:57:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SZfKM8HpXmWOSgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Nov 2023 05:57:21 +0000
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
X-Inumbo-ID: 2bb3aca7-89c5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700719042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=taW9v6tXmgV7+CsBDfFOLOJfeGdsbGCBTkfYexiG968=;
	b=plD8ycbv5k1kzH729MJLCLACrXhQ9mR2Ul8gS+RvmH1MfeilhCNy7TzMnsD52tldmDW1Wm
	A0FBbGNsqdPKwQ7PVmW174SMgXLuEuXeY4/tZPzN8c4aOVkBpPCAyYKaP0jXhoHNo/h3pD
	3R0i09/8hNimOpyn0LPqnQoTS7T55PA=
Message-ID: <fade29d2-2383-4f99-9735-6edebc66cd87@suse.com>
Date: Thu, 23 Nov 2023 06:57:21 +0100
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
 <ff31f5a6-396e-48cc-8b1b-6941369c620b@suse.com>
 <alpine.DEB.2.22.394.2311221501340.2053963@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311221501340.2053963@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QAlukW0nmNK2q1e5RZad7YEx"
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
--------------QAlukW0nmNK2q1e5RZad7YEx
Content-Type: multipart/mixed; boundary="------------5wLnuhSTjhOmZnUviGeo1piC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, oleksandr_tyshchenko@epam.com
Message-ID: <fade29d2-2383-4f99-9735-6edebc66cd87@suse.com>
Subject: Re: [linux-linus test] 183794: regressions - FAIL
References: <osstest-183794-mainreport@xen.org>
 <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com>
 <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>
 <ff31f5a6-396e-48cc-8b1b-6941369c620b@suse.com>
 <alpine.DEB.2.22.394.2311221501340.2053963@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2311221501340.2053963@ubuntu-linux-20-04-desktop>

--------------5wLnuhSTjhOmZnUviGeo1piC
Content-Type: multipart/mixed; boundary="------------kYlSgRghCseImdwhpCjyaqdd"

--------------kYlSgRghCseImdwhpCjyaqdd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTEuMjMgMDA6MDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gV2Vk
LCAyMiBOb3YgMjAyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDIyLjExLjIzIDA0
OjA3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gT24gTW9uLCAyMCBOb3YgMjAy
MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBNb24sIDIwIE5vdiAyMDIz
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4gT24gMjAuMTEuMjMgMDM6MjEsIG9zc3Rl
c3Qgc2VydmljZSBvd25lciB3cm90ZToNCj4+Pj4+PiBmbGlnaHQgMTgzNzk0IGxpbnV4LWxp
bnVzIHJlYWwgW3JlYWxdDQo+Pj4+Pj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9sb2dzLzE4Mzc5NC8NCj4+Pj4+Pg0KPj4+Pj4+IFJlZ3Jlc3Npb25z
IDotKA0KPj4+Pj4+DQo+Pj4+Pj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBh
cmUgYmxvY2tpbmcsDQo+Pj4+Pj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBi
ZSBydW46DQo+Pj4+Pj4gICAgIHRlc3QtYXJtNjQtYXJtNjQtZXhhbWluZSAgICAgIDggcmVi
b290ICAgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4NCj4+Pj4+PiB2cy4NCj4+Pj4+PiAx
ODM3NjYNCj4+Pj4+DQo+Pj4+PiBJJ20gc2VlaW5nIHRoZSBmb2xsb3dpbmcgaW4gdGhlIHNl
cmlhbCBsb2c6DQo+Pj4+Pg0KPj4+Pj4gTm92IDIwIDAwOjI1OjQxLjU4NjcxMiBbICAgIDAu
NTY3MzE4XSBrZXJuZWwgQlVHIGF0DQo+Pj4+PiBhcmNoL2FybTY0L3hlbi8uLi8uLi9hcm0v
eGVuL2VubGlnaHRlbi5jOjE2NCENCj4+Pj4+IE5vdiAyMCAwMDoyNTo0MS41OTg3MTEgWyAg
ICAwLjU3NDAwMl0gSW50ZXJuYWwgZXJyb3I6IE9vcHMgLSBCVUc6DQo+Pj4+PiAwMDAwMDAw
MGYyMDAwODAwIFsjMV0gUFJFRU1QVCBTTVANCj4+Pj4+DQo+Pj4+PiBUaGUgcmVsYXRlZCBz
b3VyY2UgY29kZSBsaW5lcyBpbiB0aGUga2VybmVsIGFyZToNCj4+Pj4+DQo+Pj4+PiDCt8K3
wrfCt8K3wrfCt8K3ZXJyID0gSFlQRVJWSVNPUl92Y3B1X29wKFZDUFVPUF9yZWdpc3Rlcl92
Y3B1X2luZm8sDQo+Pj4+PiB4ZW5fdmNwdV9ucihjcHUpLA0KPj4+Pj4gwrfCt8K3wrfCt8K3
wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCt8K3wrfCtyAm
aW5mbyk7DQo+Pj4+PiDCt8K3wrfCt8K3wrfCt8K3QlVHX09OKGVycik7DQo+Pj4+Pg0KPj4+
Pj4gSSBzdXNwZWN0IGNvbW1pdCAyMGYzYjhlYWZlMGJhIHRvIGJlIHRoZSBjdWxwcml0Lg0K
Pj4+Pj4NCj4+Pj4+IFN0ZWZhbm8sIGNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2s/DQo+
Pj4NCj4+PiBUaGUgZ29vZCBuZXdzIGFuZCBiYWQgbmV3cyBpcyB0aGF0IEkgY2Fubm90IHJl
cHJvIHRoaXMgbmVpdGhlciB3aXRoIG5vcg0KPj4+IHdpdGhvdXQgQ09ORklHX1VOTUFQX0tF
Uk5FTF9BVF9FTDAuIEkgbG9va2VkIGF0IGNvbW1pdCAyMGYzYjhlYWZlMGJhIGJ1dA0KPj4+
IEkgY2Fubm90IHNlZSBhbnl0aGluZyB3cm9uZyB3aXRoIGl0LiBMb29raW5nIGF0IHRoZSBy
ZWdpc3RlciBkdW1wLCBmcm9tOg0KPj4+DQo+Pj4geDAgOiBmZmZmZmZmZmZmZmZmZmZhDQo+
Pj4NCj4+PiBJIGFtIGd1ZXNzaW5nIHRoZSBlcnJvciB3YXMgLUVOWElPIHdoaWNoIGlzIHJl
dHVybmVkIGZyb20gbWFwX2d1ZXN0X2FyZWENCj4+PiBpbiBYZW4uDQo+Pj4NCj4+PiBDb3Vs
ZCBpdCBiZSB0aGF0IHRoZSBzdHJ1Y3QgaXMgY3Jvc3NpbmcgYSBwYWdlIGJvdW5kYXJ5PyBP
ciB0aGF0IGl0IGlzDQo+Pj4gbm90IDY0LWJpdCBhbGlnbmVkPyBEbyB3ZSBuZWVkIHRvIGRv
IHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmc/DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0veGVuL2VubGlnaHRlbi5jIGIvYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jDQo+
Pj4gaW5kZXggOWFmZGM0YzRhNWRjLi41MzI2MDcwYzVkYzAgMTAwNjQ0DQo+Pj4gLS0tIGEv
YXJjaC9hcm0veGVuL2VubGlnaHRlbi5jDQo+Pj4gKysrIGIvYXJjaC9hcm0veGVuL2VubGln
aHRlbi5jDQo+Pj4gQEAgLTQ4NCw3ICs0ODUsNyBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5f
Z3Vlc3RfaW5pdCh2b2lkKQ0KPj4+ICAgIAkgKiBmb3Igc2Vjb25kYXJ5IENQVXMgYXMgdGhl
eSBhcmUgYnJvdWdodCB1cC4NCj4+PiAgICAJICogRm9yIHVuaWZvcm1pdHkgd2UgdXNlIFZD
UFVPUF9yZWdpc3Rlcl92Y3B1X2luZm8gZXZlbiBvbiBjcHUwLg0KPj4+ICAgIAkgKi8NCj4+
PiAtCXhlbl92Y3B1X2luZm8gPSBhbGxvY19wZXJjcHUoc3RydWN0IHZjcHVfaW5mbyk7DQo+
Pj4gKwl4ZW5fdmNwdV9pbmZvID0gX19hbGxvY19wZXJjcHUoc3RydWN0IHZjcHVfaW5mbywg
UEFHRV9TSVpFKTsNCj4+PiAgICAJaWYgKHhlbl92Y3B1X2luZm8gPT0gTlVMTCkNCj4+PiAg
ICAJCXJldHVybiAtRU5PTUVNOw0KPj4+ICAgIA0KPj4NCj4+IE1heSBJIHN1Z2dlc3QgdG8g
dXNlIGEgc21hbGxlciBhbGlnbm1lbnQ/IFdoYXQgYWJvdXQ6DQo+Pg0KPj4gMSA8PCBmbHMo
c2l6ZW9mKHN0cnVjdCB2Y3B1X2luZm8pIC0gMSkNCj4gDQo+IFNlZSBiZWxvdw0KPiANCj4g
LS0tDQo+IFtQQVRDSF0gYXJtL3hlbjogZml4IHhlbl92Y3B1X2luZm8gYWxsb2NhdGlvbiBh
bGlnbm1lbnQNCj4gDQo+IHhlbl92Y3B1X2luZm8gaXMgYSBwZXJjcHUgYXJlYSB0aGFuIG5l
ZWRzIHRvIGJlIG1hcHBlZCBieSBYZW4uDQo+IEN1cnJlbnRseSwgaXQgY291bGQgY3Jvc3Mg
YSBwYWdlIGJvdW5kYXJ5IHJlc3VsdGluZyBpbiBYZW4gYmVpbmcgdW5hYmxlDQo+IHRvIG1h
cCBpdDoNCj4gDQo+IFsgICAgMC41NjczMThdIGtlcm5lbCBCVUcgYXQgYXJjaC9hcm02NC94
ZW4vLi4vLi4vYXJtL3hlbi9lbmxpZ2h0ZW4uYzoxNjQhDQo+IFsgICAgMC41NzQwMDJdIElu
dGVybmFsIGVycm9yOiBPb3BzIC0gQlVHOiAwMDAwMDAwMGYyMDAwODAwIFsjMV0gUFJFRU1Q
VCBTTVANCj4gDQo+IEZpeCB0aGUgaXNzdWUgYnkgdXNpbmcgX19hbGxvY19wZXJjcHUgYW5k
IHJlcXVlc3RpbmcgYWxpZ25tZW50IGZvciB0aGUNCj4gbWVtb3J5IGFsbG9jYXRpb24uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVs
bGluaUBhbWQuY29tPg0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9lbmxpZ2h0
ZW4uYyBiL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYw0KPiBpbmRleCA5YWZkYzRjNGE1ZGMu
LjA5ZWI3NGEwN2RmYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0veGVuL2VubGlnaHRlbi5j
DQo+ICsrKyBiL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYw0KPiBAQCAtNDg0LDcgKzQ4NCw4
IEBAIHN0YXRpYyBpbnQgX19pbml0IHhlbl9ndWVzdF9pbml0KHZvaWQpDQo+ICAgCSAqIGZv
ciBzZWNvbmRhcnkgQ1BVcyBhcyB0aGV5IGFyZSBicm91Z2h0IHVwLg0KPiAgIAkgKiBGb3Ig
dW5pZm9ybWl0eSB3ZSB1c2UgVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfaW5mbyBldmVuIG9uIGNw
dTAuDQo+ICAgCSAqLw0KPiAtCXhlbl92Y3B1X2luZm8gPSBhbGxvY19wZXJjcHUoc3RydWN0
IHZjcHVfaW5mbyk7DQo+ICsJeGVuX3ZjcHVfaW5mbyA9IF9fYWxsb2NfcGVyY3B1KHNpemVv
ZihzdHJ1Y3QgdmNwdV9pbmZvKSwNCj4gKwkJCSAgICAgICAgICAgICAgICAgICAgICAgMSA8
PCBmbHMoc2l6ZW9mKHN0cnVjdCB2Y3B1X2luZm8pIC0gMSkpOw0KDQpOaXQ6IG9uZSB0YWIg
bGVzcywgcGxlYXNlIChjYW4gYmUgZml4ZWQgd2hpbGUgY29tbWl0dGluZykuDQoNCj4gICAJ
aWYgKHhlbl92Y3B1X2luZm8gPT0gTlVMTCkNCj4gICAJCXJldHVybiAtRU5PTUVNOw0KPiAg
IA0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoN
Ckp1ZXJnZW4NCg==
--------------kYlSgRghCseImdwhpCjyaqdd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------kYlSgRghCseImdwhpCjyaqdd--

--------------5wLnuhSTjhOmZnUviGeo1piC--

--------------QAlukW0nmNK2q1e5RZad7YEx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVe6cEFAwAAAAAACgkQsN6d1ii/Ey+m
mwgAgqIwGB4/rMOl7iBiSwpyo1YscmXUrTAPYqGJS1XvCKDcSumW5zV8N0zvTVufTYaSeyKmT6uR
dFRfsQ1oibbf7S7cRjAke/42G7L3uTZVdjnjgZLUJ0P1cjj7c4+bzIvvyyo+Q4sKRKx6rjRJgnpn
BQgAoMhrwefNoFalkr0TsLBEXW9EGFdeo0aZqxX2NFPj4x73+Xf1B9RygNMWpkEVpsDEXhnhVS7C
VyYi56+Rq53Os8uL9vGrakdYOZkDegtm+Q4WyT1MIo+4nV4TwxVhFzScsAcXCqvhvM41RbFajFTd
tcZUJyMZLpeW8envNK1ygIzAv7pjfEXOBLgOHzKfCw==
=9cEj
-----END PGP SIGNATURE-----

--------------QAlukW0nmNK2q1e5RZad7YEx--

