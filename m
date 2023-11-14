Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919097EACB8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632259.986478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pTz-0002it-Ga; Tue, 14 Nov 2023 09:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632259.986478; Tue, 14 Nov 2023 09:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pTz-0002gt-DU; Tue, 14 Nov 2023 09:13:19 +0000
Received: by outflank-mailman (input) for mailman id 632259;
 Tue, 14 Nov 2023 09:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2pTy-0002gh-4f
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:13:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bec20c2-82ce-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 10:13:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB6DC21898;
 Tue, 14 Nov 2023 09:13:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABB6713460;
 Tue, 14 Nov 2023 09:13:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WN09KCw6U2XACAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 09:13:16 +0000
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
X-Inumbo-ID: 0bec20c2-82ce-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699953196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PnDofMebKnj3bOUtkIJcwaHY54NLwFY/k7Rjr3iMHrE=;
	b=pNzzv9qt+jA0oPHmMoBO6fAyMIlFaGHpwKn524YZl6yVAoxFo4xL2rkUMwBd22TazPc7/Y
	/l/8NtGfT/vyiHQEVwW8zpDFONHzLfdq3sJp8V1mPDCBzhGxs7r8j6zRLb0PzgZqr+g9bv
	OmzWqaZPjZGZql4HazN1hmQiIVNClgM=
Message-ID: <3b077cde-bc06-48af-82b4-23798ecfd64c@suse.com>
Date: Tue, 14 Nov 2023 10:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/29] tools/xenstored: mount 9pfs device in stubdom
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-27-jgross@suse.com>
 <e637cc9f-246e-4834-b255-b4cdeb40178f@xen.org>
 <fe1e5b10-a9cb-4347-b148-8e5e0d290428@suse.com>
 <6a63e87e-16ab-4e2c-a0fe-a213d52de2b2@xen.org>
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
In-Reply-To: <6a63e87e-16ab-4e2c-a0fe-a213d52de2b2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0xTGJaafb1HP78ofBT5CFYNg"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 CLAM_VIRUS_FAIL(0.00)[failed to scan and retransmits exceed];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 BAYES_HAM(-3.00)[100.00%];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0xTGJaafb1HP78ofBT5CFYNg
Content-Type: multipart/mixed; boundary="------------hDBkol7LRhSm3dEC0cRPYBwK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <3b077cde-bc06-48af-82b4-23798ecfd64c@suse.com>
Subject: Re: [PATCH v2 26/29] tools/xenstored: mount 9pfs device in stubdom
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-27-jgross@suse.com>
 <e637cc9f-246e-4834-b255-b4cdeb40178f@xen.org>
 <fe1e5b10-a9cb-4347-b148-8e5e0d290428@suse.com>
 <6a63e87e-16ab-4e2c-a0fe-a213d52de2b2@xen.org>
In-Reply-To: <6a63e87e-16ab-4e2c-a0fe-a213d52de2b2@xen.org>

--------------hDBkol7LRhSm3dEC0cRPYBwK
Content-Type: multipart/mixed; boundary="------------4GGN7fPJphDsiSxBL09NkJGW"

--------------4GGN7fPJphDsiSxBL09NkJGW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjMgMTA6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE0LzExLzIwMjMgMDY6NDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxMy4xMS4yMyAyMzowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxMC8xMS8yMDIzIDE2OjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVu
c3RvcmVkL2RvbWFpbi5jDQo+Pj4+IGluZGV4IDE2MmI4N2I0NjAuLjQyNjNjMTM2MGYgMTAw
NjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4+PiArKysgYi90
b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+Pj4gQEAgLTEyMzYsNiArMTIzNiw4IEBAIHZv
aWQgc3R1YmRvbV9pbml0KHZvaWQpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBiYXJmX3Bl
cnJvcigiRmFpbGVkIHRvIGluaXRpYWxpemUgc3R1YmRvbSIpOw0KPj4+PiDCoMKgwqDCoMKg
IHhlbmV2dGNobl9ub3RpZnkoeGNlX2hhbmRsZSwgc3R1YmRvbS0+cG9ydCk7DQo+Pj4+ICsN
Cj4+Pj4gK8KgwqDCoCBtb3VudF85cGZzKCk7DQo+Pj4+IMKgICNlbmRpZg0KPj4+PiDCoCB9
DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvbWluaW9zLmMgYi90b29scy94
ZW5zdG9yZWQvbWluaW9zLmMNCj4+Pj4gaW5kZXggMjAyZDcwMzg3YS4uZmRkYmVkZTg2OSAx
MDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL21pbmlvcy5jDQo+Pj4+ICsrKyBi
L3Rvb2xzL3hlbnN0b3JlZC9taW5pb3MuYw0KPj4+PiBAQCAtMTksOCArMTksMTYgQEANCj4+
Pj4gwqAgI2luY2x1ZGUgPHN5cy9tbWFuLmg+DQo+Pj4+IMKgICNpbmNsdWRlICJjb3JlLmgi
DQo+Pj4+IMKgICNpbmNsdWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4NCj4+Pj4gKyNpbmNsdWRl
IDxtaW5pLW9zLzlwZnJvbnQuaD4NCj4+Pj4gwqAgI2luY2x1ZGUgPG1pbmktb3MvZXZlbnRz
Lmg+DQo+Pj4+IMKgICNpbmNsdWRlIDxtaW5pLW9zL2dudHRhYi5oPg0KPj4+PiArI2luY2x1
ZGUgPG1pbmktb3Mvc2NoZWQuaD4NCj4+Pj4gKyNpbmNsdWRlIDxtaW5pLW9zL3hlbmJ1cy5o
Pg0KPj4+PiArI2luY2x1ZGUgPG1pbmktb3MveG1hbGxvYy5oPg0KPj4+PiArDQo+Pj4+ICsj
ZGVmaW5lIFA5X1NUQVRFX1BBVEjCoMKgwqAgImRldmljZS85cGZzLzAvc3RhdGUiDQo+Pj4+
ICsNCj4+Pj4gK3N0YXRpYyB2b2lkICpwOV9kZXZpY2U7DQo+Pj4+IMKgIHZvaWQgd3JpdGVf
cGlkZmlsZShjb25zdCBjaGFyICpwaWRmaWxlKQ0KPj4+PiDCoCB7DQo+Pj4+IEBAIC02Miwz
ICs3MCwzMSBAQCB2b2lkIGVhcmx5X2luaXQodm9pZCkNCj4+Pj4gwqDCoMKgwqDCoCBpZiAo
c3R1Yl9kb21pZCA9PSBET01JRF9JTlZBTElEKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
YmFyZigiY291bGQgbm90IGdldCBvd24gZG9taWQiKTsNCj4+Pj4gwqAgfQ0KPj4+PiArDQo+
Pj4+ICtzdGF0aWMgdm9pZCBtb3VudF90aHJlYWQodm9pZCAqcCkNCj4+Pj4gK3sNCj4+Pj4g
K8KgwqDCoCB4ZW5idXNfZXZlbnRfcXVldWUgZXZlbnRzID0gTlVMTDsNCj4+Pj4gK8KgwqDC
oCBjaGFyICplcnI7DQo+Pj4+ICvCoMKgwqAgY2hhciAqZHVtbXk7DQo+Pj4+ICsNCj4+Pj4g
K8KgwqDCoCBmcmVlKHhlbmJ1c193YXRjaF9wYXRoX3Rva2VuKFhCVF9OSUwsIFA5X1NUQVRF
X1BBVEgsICI5cGZzIiwgJmV2ZW50cykpOw0KPj4+DQo+Pj4gQUZBSUNULCB4ZW5idXNfd2F0
Y2hfcGF0aF90b2tlbigpIGNhbiBmYWlsLiBJIGFncmVlIHRoaXMgaXMgdW5saWtlbHksIGJ1
dCBpZiANCj4+PiBpdCBmYWlscywgdGhlbiBpdCB3b3VsZCBiZSB1c2VmdWwgdG8gZ2V0IHNv
bWUgbG9ncy4gT3RoZXJ3aXNlLi4uDQo+Pj4NCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGZvciAo
OzspIHsNCj4+Pg0KPj4+IC4uLiB0aGlzIGxvb3Agd291bGQgYmUgaW5maW5pdGUuDQo+Pg0K
Pj4gT2theSwgd2lsbCBhZGQgbG9nZ2luZy4NCj4+DQo+Pj4NCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHhlbmJ1c193YWl0X2Zvcl93YXRjaCgmZXZlbnRzKTsNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGVyciA9IHhlbmJ1c19yZWFkKFhCVF9OSUwsIFA5X1NUQVRFX1BBVEgsICZkdW1teSk7
DQo+Pj4NCj4+PiBDYW4geW91IGV4cGxhaW4gd2h5IGRvbid0IGNhcmUgYWJvdXQgdGhlIHZh
bHVlIG9mIHRoZSBub2RlPw0KPj4NCj4+IEkgb25seSBjYXJlIGFib3V0IHRoZSBwcmVzZW5j
ZSBvZiB0aGUgInN0YXRlIiBub2RlLiBBbGwgcmVhbCBzdGF0ZSBjaGFuZ2VzDQo+PiB3aWxs
IGJlIGhhbmRsZWQgaW4gaW5pdF85cGZyb250KCkuDQo+IA0KPiBPay4gQ2FuIHRoaXMgYmUg
ZG9jdW1lbnRlZCBpbiB0aGUgY29kZT8NCg0KRmluZSB3aXRoIG1lLg0KDQo+IA0KPj4NCj4+
Pg0KPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFlcnIpDQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgZnJlZShlcnIpOw0KPj4+
PiArwqDCoMKgIH0NCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGZyZWUoZHVtbXkpOw0KPj4+PiAr
DQo+Pj4+ICvCoMKgwqAgZnJlZSh4ZW5idXNfdW53YXRjaF9wYXRoX3Rva2VuKFhCVF9OSUws
IFA5X1NUQVRFX1BBVEgsICI5cGZzIikpOw0KPj4+DQo+Pj4geGVuYnVzX3Vud2F0Y2hfcGF0
aF90b2tlbigpIGNvdWxkIHRlY2huaWNhbGx5IGZhaWxzLiBJdCB3b3VsZCBiZSBoZWxwZnVs
IHRvIA0KPj4+IHByaW50IGEgbWVzc2FnZS4NCj4+DQo+PiBJIGNhbiBhZGQgdGhhdCwgYnV0
IGRvIHdlIHJlYWxseSBjYXJlPyANCj4gDQo+IFdlbGwuLi4gU3VjaCBhcHByb2FjaCBpcyBv
ayB1bnRpbCB0aGUgZGF5IGFsbCB0aGUgd2F0Y2hlcyBhcmUgZXhoYXVzdGVkLiBBdCB0aGlz
IA0KPiBwb2ludCwgdGhlIGRldmVsb3BwZXIgd2hvIGhpdCB0aGUgYnVnIHdpbGwgbGlrZWx5
IHdpc2ggdGhlcmUgd2VyZSBzb21lIGRlYnVnZ2luZy4NCj4gDQo+PiBUaGlzIGlzIGEgY29t
bW9uIHBhdHRlcm4gaW4gTWluaS1PUy4NCj4gDQo+IFlvdSBhcmUgbm90IHNlbGxpbmcgTWlu
aS1PUyA6KS4gUmVhbGx5IGFsbCB0aGUgY2FsbGVycyBzaG91bGQgY2hlY2sgZXJyb3IgcmV0
dXJuIA0KPiBhbmQgcHJpbnQgZXJyb3JzLiBMZXQncyBub3Qgc3ByZWFkIHRoYXQgbWlzdGFr
ZSBpbiBYZW5zdG9yZWQuDQoNCk9rYXkuIDotKQ0KDQoNCkp1ZXJnZW4NCg==
--------------4GGN7fPJphDsiSxBL09NkJGW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4GGN7fPJphDsiSxBL09NkJGW--

--------------hDBkol7LRhSm3dEC0cRPYBwK--

--------------0xTGJaafb1HP78ofBT5CFYNg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTOiwFAwAAAAAACgkQsN6d1ii/Ey/Y
0Af+Lue7Sx8xplHKL/X7det4UTBKeC/toDbwQAiqGK+Ac9AYGV7naGGf9NmSuLxST6243l2ks+fP
2g/9w5ub8HumNJahVU7ih/gtMmdFWeW94CkHklgtuIa/PU0Hy189LeJjG6rgFswOVrmM+Aquf5Mk
mCr2DUmtRktn3wYw6yXbtlBqHLsyxwzfoiIaiHWFjYUgITiWtFInFZhYyz4Xmf7BAjXtykM2s5j4
7Wd60LxN0fn/RJ4Kf5hE7WdteclS3pdNJ80+sz7XJDTzeOew1DX6wX51m2kDi+Hpu8KMwY2tyFLQ
d1NtPceo6fZF7sxuVRh68K/4k6hdRVUTGV1mQuKZLQ==
=yIkW
-----END PGP SIGNATURE-----

--------------0xTGJaafb1HP78ofBT5CFYNg--

