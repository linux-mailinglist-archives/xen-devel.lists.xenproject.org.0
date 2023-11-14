Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CE7EACB2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632257.986469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pT3-0002BF-7M; Tue, 14 Nov 2023 09:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632257.986469; Tue, 14 Nov 2023 09:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pT3-00029M-4R; Tue, 14 Nov 2023 09:12:21 +0000
Received: by outflank-mailman (input) for mailman id 632257;
 Tue, 14 Nov 2023 09:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2pT1-00029G-2o
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:12:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8a4bcaa-82cd-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 10:12:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FD8A21898;
 Tue, 14 Nov 2023 09:12:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62FFB13460;
 Tue, 14 Nov 2023 09:12:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EdF5Fu05U2XACAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 09:12:13 +0000
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
X-Inumbo-ID: e8a4bcaa-82cd-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699953133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=92AqrPF99V4z2YoTdE/m0ePSBktQuFEuxnHTIMeIkag=;
	b=ZMP9Y2/SqqEM0JGdnZdIcIVfTkK5TZ2V6KRP9ydIciaZXkM4+FWnKQPgxWw4Z0FjC7dYnO
	WrBg1LFSL1Z/KqWh68ngs9YxsdplohsNaYse+U02ZT7owPsAX3vMKFJMhLml4iR2UdIMk6
	pWxQfHtBIe8+hMMFjAHZFgo+hkCM+IU=
Message-ID: <e5d9e34c-da64-4386-b04c-d8bf2c171e07@suse.com>
Date: Tue, 14 Nov 2023 10:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
 <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
 <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
 <6062375b-ed94-46ba-a405-e3e7148ddc6f@xen.org>
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
In-Reply-To: <6062375b-ed94-46ba-a405-e3e7148ddc6f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hGDMVu8RKG4uTsmxiSZrEnoo"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hGDMVu8RKG4uTsmxiSZrEnoo
Content-Type: multipart/mixed; boundary="------------0FVxLQuq9TCn1frYEJAnnUcP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <e5d9e34c-da64-4386-b04c-d8bf2c171e07@suse.com>
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
 <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
 <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
 <6062375b-ed94-46ba-a405-e3e7148ddc6f@xen.org>
In-Reply-To: <6062375b-ed94-46ba-a405-e3e7148ddc6f@xen.org>

--------------0FVxLQuq9TCn1frYEJAnnUcP
Content-Type: multipart/mixed; boundary="------------GK0Detf91UVVT04hsBgrdbQ3"

--------------GK0Detf91UVVT04hsBgrdbQ3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjMgMDk6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxNC8xMS8yMDIzIDA2OjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTMuMTEu
MjMgMjM6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMTAvMTEvMjAyMyAxNjowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gV2hl
biBydW5uaW5nIGFzIHN0dWJkb20sIG1hcCB0aGUgc3R1YmRvbSdzIFhlbnN0b3JlIHJpbmcg
cGFnZSBpbiBvcmRlcg0KPj4+PiB0byBzdXBwb3J0IHVzaW5nIHRoZSA5cGZzIGZyb250ZW5k
Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoCB0b29scy94ZW5zdG9yZWQvY29yZS5jwqDCoCB8
wqAgMiArKw0KPj4+PiDCoCB0b29scy94ZW5zdG9yZWQvZG9tYWluLmMgfCAyNyArKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4+Pj4gwqAgdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5o
IHzCoCAxICsNCj4+Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQv
Y29yZS5jIGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPj4+PiBpbmRleCBiOWVjNTBiMzRj
Li40YTlkODc0ZjE3IDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvY29yZS5j
DQo+Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+Pj4gQEAgLTI5OTEsNiAr
Mjk5MSw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pDQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBsdV9yZWFkX3N0YXRlKCk7DQo+Pj4+IMKgICNlbmRpZg0KPj4+PiAr
wqDCoMKgIHN0dWJkb21faW5pdCgpOw0KPj4+PiArDQo+Pj4+IMKgwqDCoMKgwqAgY2hlY2tf
c3RvcmUoKTsNCj4+Pj4gwqDCoMKgwqDCoCAvKiBHZXQgcmVhZHkgdG8gbGlzdGVuIHRvIHRo
ZSB0b29scy4gKi8NCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4u
YyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4+PiBpbmRleCBmYTE3ZjY4NjE4Li4x
NjJiODdiNDYwIDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvZG9tYWluLmMN
Cj4+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+Pj4+IEBAIC0zNyw2ICsz
NywxMCBAQA0KPj4+PiDCoCAjaW5jbHVkZSA8eGVuY3RybC5oPg0KPj4+PiDCoCAjaW5jbHVk
ZSA8eGVuL2dyYW50X3RhYmxlLmg+DQo+Pj4+ICsjaWZkZWYgX19NSU5JT1NfXw0KPj4+PiAr
I2luY2x1ZGUgPG1pbmktb3MveGVuYnVzLmg+DQo+Pj4+ICsjZW5kaWYNCj4+Pj4gKw0KPj4+
PiDCoCBzdGF0aWMgeGNfaW50ZXJmYWNlICoqeGNfaGFuZGxlOw0KPj4+PiDCoCB4ZW5nbnR0
YWJfaGFuZGxlICoqeGd0X2hhbmRsZTsNCj4+Pj4gwqAgc3RhdGljIGV2dGNobl9wb3J0X3Qg
dmlycV9wb3J0Ow0KPj4+PiBAQCAtNTAwLDYgKzUwNCwxMSBAQCBzdGF0aWMgdm9pZCAqbWFw
X2ludGVyZmFjZShkb21pZF90IGRvbWlkKQ0KPj4+PiDCoMKgwqDCoMKgIGlmIChkb21pZCA9
PSB4ZW5idXNfbWFzdGVyX2RvbWlkKCkpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4geGVuYnVzX21hcCgpOw0KPj4+PiArI2lmZGVmIF9fTUlOSU9TX18NCj4+Pj4gK8KgwqDC
oCBpZiAoZG9taWQgPT0gc3R1Yl9kb21pZCkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biB4ZW5zdG9yZV9idWY7DQo+Pj4+ICsjZW5kaWYNCj4+Pj4gKw0KPj4+PiDCoMKgwqDCoMKg
IHJldHVybiB4ZW5nbnR0YWJfbWFwX2dyYW50X3JlZigqeGd0X2hhbmRsZSwgZG9taWQsDQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBH
TlRUQUJfUkVTRVJWRURfWEVOU1RPUkUsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQUk9UX1JFQUR8UFJPVF9XUklURSk7DQo+Pj4+
IEBAIC01MDksNyArNTE4LDcgQEAgc3RhdGljIHZvaWQgdW5tYXBfaW50ZXJmYWNlKGRvbWlk
X3QgZG9taWQsIHZvaWQgKmludGVyZmFjZSkNCj4+Pj4gwqAgew0KPj4+PiDCoMKgwqDCoMKg
IGlmIChkb21pZCA9PSB4ZW5idXNfbWFzdGVyX2RvbWlkKCkpDQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCB1bm1hcF94ZW5idXMoaW50ZXJmYWNlKTsNCj4+Pj4gLcKgwqDCoCBlbHNlDQo+
Pj4+ICvCoMKgwqAgZWxzZSBpZiAoZG9taWQgIT0gc3R1Yl9kb21pZCkNCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHhlbmdudHRhYl91bm1hcCgqeGd0X2hhbmRsZSwgaW50ZXJmYWNlLCAx
KTsNCj4+Pj4gwqAgfQ0KPj4+PiBAQCAtMTIxNCw2ICsxMjIzLDIyIEBAIHZvaWQgZG9tMF9p
bml0KHZvaWQpDQo+Pj4+IMKgwqDCoMKgwqAgeGVuZXZ0Y2huX25vdGlmeSh4Y2VfaGFuZGxl
LCBkb20wLT5wb3J0KTsNCj4+Pj4gwqAgfQ0KPj4+PiArdm9pZCBzdHViZG9tX2luaXQodm9p
ZCkNCj4+Pj4gK3sNCj4+Pj4gKyNpZmRlZiBfX01JTklPU19fDQo+Pj4+ICvCoMKgwqAgc3Ry
dWN0IGRvbWFpbiAqc3R1YmRvbTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGlmIChzdHViX2Rv
bWlkIDwgMCkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+Pj4gKw0KPj4+PiAr
wqDCoMKgIHN0dWJkb20gPSBpbnRyb2R1Y2VfZG9tYWluKE5VTEwsIHN0dWJfZG9taWQsIHhl
bmJ1c19ldnRjaG4sIGZhbHNlKTsNCj4+Pj4gK8KgwqDCoCBpZiAoIXN0dWJkb20pDQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBiYXJmX3BlcnJvcigiRmFpbGVkIHRvIGluaXRpYWxpemUgc3R1
YmRvbSIpOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgeGVuZXZ0Y2huX25vdGlmeSh4Y2VfaGFu
ZGxlLCBzdHViZG9tLT5wb3J0KTsNCj4+Pg0KPj4+IElmIEkgY29tcGFyZSB0byBpbnRyb2R1
Y2VfZG9tYWluKCksIGl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB0byBtZSB3aHkgdGhlIA0K
Pj4+IG5vdGlmaWNhdGlvbiBpcyBkb25lIHVuY29uZGl0aW9uYWxseSBoZXJlLiBDYW4geW91
IGNsYXJpZnk/DQo+Pg0KPj4gVGhlcmUgaXMgbm8gcmVhc29uIHRvIGRvIGl0IGNvbmRpdGlv
bmFsbHksIGFzIHdlIGNhbiBiZSBzdXJlIHRoZSBldmVudCBjaGFubmVsDQo+PiBpcyBleGlz
dGluZyBhbmQgdGhlIHJpbmcgcGFnZSBpcyBhY2Nlc3NpYmxlLg0KPiANCj4gSG1tbS4uLiBC
dXQgdGhlcmUgaXMgYSBzZWNvbmQgcGFydCBpbiB0aGUgY29uZGl0aW9uOg0KPiANCj4gZG9t
YWluLT5pbnRlcmZhY2UtPmNvbm5lY3Rpb24gPT0gWEVOU1RPUkVfUkVDT05ORUNUDQo+IA0K
PiBXaHkgaXNuJ3QgaXQgbmVjZXNzYXJ5IGhlcmU/IFdoYXQgSSBhbSBsb29raW5nIGZvciBw
YXJ0aWN1bGFybHkgaXMgc29tZSBpbi1jb2RlIA0KPiBjb21tZW50IChvciBhdCBsZWFzdCBp
biB0aGUgY29tbWl0IG1lc3NhZ2UpIGJlY2F1c2UgdGhpcyBpcyBub3QgMTAwJSBjbGVhciB3
aHkgDQo+IHdlIGFyZSBkaXZlcmdpbmcuDQoNClRoZSB0ZXN0IG9mIFhFTlNUT1JFX1JFQ09O
TkVDVCBpcyBkb25lIGZvciBkb21VcyBzdGFydGVkIGJlZm9yZSBvciB0b2dldGhlciB3aXRo
DQpkb20wIGluIG9yZGVyIHRvIGdpdmUgdGhlbSBhIHNpZ25hbCB0aGF0IHRoZXkgY2FuIHN0
YXJ0IHRvIHVzZSBYZW5zdG9yZS4NCg0KSGVyZSB3ZSBhcmUgaW5pdGlhbGl6aW5nIG91ciBv
d24gY29ubmVjdGlvbiwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byB0ZXN0IHdoZXRoZXINCnRo
ZSBvdGhlciBlbmQgaXMgd2FpdGluZyBmb3IgdXMuIFdlIGtub3cgdGhlcmUgaXMgbm8gcG9z
c2libGUgcHJvYmxlbSBzZW5kaW5nDQp0aGUgZXZlbnQsIHNvIHdlIGNhbiBqdXN0IGRvIGl0
LiBUaGUgbWFpbiBpbnN0cnVjdGlvbiBndWFyZGVkIGJ5IHRoZSB0ZXN0IG9mDQpYRU5TVE9S
RV9SRUNPTk5FQ1QgaXMgdGhlIHNldHRpbmcgb2YgWEVOU1RPUkVfQ09OTkVDVEVELCB3aGlj
aCB0aGVuIG5lZWRzIHRoZQ0KZXZlbnQgdG8gYmUgc2VudCB0byBzaWduYWwgdGhhdCBjaGFu
Z2UgaW4gdGhlIGNvbm5lY3Rpb24gc3RhdGUuDQoNCkluIHRoZSBlbmQgd2UgYXJlIF9ub3Rf
IGRpdmVyZ2luZy4gWW91IHNob3VsZCBqdXN0IGNvbXBhcmUgdGhlIGNvZGUgdG8gdGhlIG1v
cmUNCmNvbXBhcmFibGUgZG9tMF9pbml0KCkgY29kZS4gVGhlcmUgdGhlIGV2ZW50IGlzIGJl
aW5nIHNlbnQgdW5jb25kaXRpb25hbGx5LCB0b28uDQoNCg0KSnVlcmdlbg0K
--------------GK0Detf91UVVT04hsBgrdbQ3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GK0Detf91UVVT04hsBgrdbQ3--

--------------0FVxLQuq9TCn1frYEJAnnUcP--

--------------hGDMVu8RKG4uTsmxiSZrEnoo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTOewFAwAAAAAACgkQsN6d1ii/Ey93
hQf+PlaXJKyx9vUgVOigATGvb9MHxQTdz9zw3IxK7FVh3PVN/X0XGeVXS722Bk9cuKjGrM8QHZBN
4x3vXsdWTToKDuZg4xqYjKZnhi33F1fDJMbg2V9iyd4TT6XvnT7pS3iyLdDASP9M/f17fDh+52ru
1ujZTxYLugeyV/uCl9SM+dC1D75WfpCnXFxyH6Q13HVNUoHeF6kMQZByxPnUacn9mnL9zDxk/mYL
IXyrlcAd2C0CrpUIRCHBpbHWgTPfra/v/4nKhZiCyXOik8AThD6IP934o/vxkgz/2ZzmUj6t3aEw
9SIXFn1i/+ZOs6vML8viHYdNte4F4PX+PRIywXWBmA==
=Ua9Q
-----END PGP SIGNATURE-----

--------------hGDMVu8RKG4uTsmxiSZrEnoo--

