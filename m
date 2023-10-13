Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D77C8811
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 16:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616611.958754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJRn-0007hJ-G0; Fri, 13 Oct 2023 14:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616611.958754; Fri, 13 Oct 2023 14:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJRn-0007eg-Cm; Fri, 13 Oct 2023 14:47:27 +0000
Received: by outflank-mailman (input) for mailman id 616611;
 Fri, 13 Oct 2023 14:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrJRm-0006sA-BN
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 14:47:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c77f041-69d7-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 16:47:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C639B2188E;
 Fri, 13 Oct 2023 14:47:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7076B138EF;
 Fri, 13 Oct 2023 14:47:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RLCZGXxYKWW/OgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 14:47:24 +0000
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
X-Inumbo-ID: 6c77f041-69d7-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697208444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bejJXO8Vqfv8E2pAMwJrx83RBeAkmrFFcYNwGrFO4B4=;
	b=lIyZjiSm9ciWecu27HoPRSDUqTNzLQIhwvKUWm19nSmQMZwOl1dXZrTxodFcXb2zSoqj6j
	tLQvl53dZPdJZuO92aZClBxjJktoUq6QdzgFUglGdHPQyIjZoQ93UGoKJ7Pj95ja6Cp2WC
	Y2Nrp9eW5Q8nUmB7r5i/GVD4WqvlwRI=
Message-ID: <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
Date: Fri, 13 Oct 2023 16:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-US
To: Julien Grall <julien@xen.org>, George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org>
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
In-Reply-To: <a93839b8-932a-4634-9549-081df950afb2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0fyiXdGR0Xh06dpW74G73v0o"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0fyiXdGR0Xh06dpW74G73v0o
Content-Type: multipart/mixed; boundary="------------2LSrz6n6BZgq8Gv1Dkf4QCII";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
Message-ID: <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org>
In-Reply-To: <a93839b8-932a-4634-9549-081df950afb2@xen.org>

--------------2LSrz6n6BZgq8Gv1Dkf4QCII
Content-Type: multipart/mixed; boundary="------------gbr2Uoo9zLlfZGNBeWOmIT3z"

--------------gbr2Uoo9zLlfZGNBeWOmIT3z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjMgMTM6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgR2VvcmdlLA0K
PiANCj4gT24gMTMvMTAvMjAyMyAxMToxNiwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+IE9u
IFRodSwgT2N0IDEyLCAyMDIzIGF0IDExOjM24oCvUE0gU3RlZmFubyBTdGFiZWxsaW5pDQo+
PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4NCj4+PiBPbiBUaHUsIDEy
IE9jdCAyMDIzLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+Pj4+IFN0b3AgdGlua2VyaW5n
IGluIHRoZSBob3BlIHRoYXQgaXQgaGlkZXMgdGhlIHByb2JsZW0uwqAgWW91J3JlIG9ubHkN
Cj4+Pj4+PiBtYWtpbmcgaXQgaGFyZGVyIHRvIGZpeCBwcm9wZXJseS4NCj4+Pj4+DQo+Pj4+
PiBNYWtpbmcgaXQgaGFyZGVyIHRvIGZpeCBwcm9wZXJseSB3b3VsZCBiZSBhIHZhbGlkIHJl
YXNvbiBub3QgdG8gY29tbWl0DQo+Pj4+PiB0aGUgKG1heWJlIHBhcnRpYWwpIGZpeC4gQnV0
IGxvb2tpbmcgYXQgdGhlIGZpeCBhZ2FpbjoNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+
Pj4+PiBpbmRleCBhNmNkMTk5ZmRjLi45Y2Q2Njc4MDE1IDEwMDY0NA0KPj4+Pj4gLS0tIGEv
dG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+Pj4+PiArKysgYi90b29scy94ZW5zdG9yZWQv
ZG9tYWluLmMNCj4+Pj4+IEBAIC05ODksNiArOTg5LDcgQEAgc3RhdGljIHN0cnVjdCBkb21h
aW4gKmludHJvZHVjZV9kb21haW4oY29uc3Qgdm9pZCAqY3R4LA0KPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFsbG9jX3N0ZWFsKGRvbWFpbi0+Y29ubiwgZG9t
YWluKTsNCj4+Pj4+DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIXJlc3RvcmUpIHsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkb21haW5fY29ubl9yZXNldChkb21haW4pOw0KPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIE5vdGlmeSB0
aGUgZG9tYWluIHRoYXQgeGVuc3RvcmUgaXMgYXZhaWxhYmxlICovDQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJmYWNlLT5j
b25uZWN0aW9uID0gWEVOU1RPUkVfQ09OTkVDVEVEOw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlbmV2dGNobl9ub3RpZnkoeGNl
X2hhbmRsZSwgZG9tYWluLT5wb3J0KTsNCj4+Pj4+IEBAIC0xMDMxLDggKzEwMzIsNiBAQCBp
bnQgZG9faW50cm9kdWNlKGNvbnN0IHZvaWQgKmN0eCwgc3RydWN0IGNvbm5lY3Rpb24gDQo+
Pj4+PiAqY29ubiwNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFkb21haW4pDQo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJybm87DQo+Pj4+
Pg0KPj4+Pj4gLcKgwqDCoMKgwqDCoCBkb21haW5fY29ubl9yZXNldChkb21haW4pOw0KPj4+
Pj4gLQ0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBzZW5kX2Fjayhjb25uLCBYU19JTlRST0RV
Q0UpOw0KPj4+Pj4NCj4+Pj4+IEl0IGlzIGEgMS1saW5lIG1vdmVtZW50LiBUZXh0dWFsbHkg
c21hbGwuIEVhc3kgdG8gdW5kZXJzdGFuZCBhbmQgdG8NCj4+Pj4+IHJldmVydC4gSXQgZG9l
c24ndCBzZWVtIHRvIGJlIG1ha2luZyB0aGluZ3MgaGFyZGVyIHRvIGZpeD8gV2UgY291bGQN
Cj4+Pj4+IHJldmVydCBpdCBhbnkgdGltZSBpZiBhIGJldHRlciBmaXggaXMgb2ZmZXJlZC4N
Cj4+Pj4+DQo+Pj4+PiBNYXliZSB3ZSBjb3VsZCBoYXZlIGEgWFhYIG5vdGUgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIG9yIGluLWNvZGUNCj4+Pj4+IGNvbW1lbnQ/DQo+Pj4+DQo+Pj4+IEl0
IG1vdmVzIGEgbGluZSBmcm9tIG9uZSBmdW5jdGlvbiAoZG9fZG9tYWluX2ludHJvZHVjZSgp
KSBpbnRvIGENCj4+Pj4gY29tcGxldGVseSBkaWZmZXJlbnQgZnVuY3Rpb24gKGludHJvZHVj
ZV9kb21haW4oKSksIG5lc3RlZCBpbnNpZGUgdHdvDQo+Pj4+IGlmKCkgc3RhdGVtZW50czsg
d2l0aCBubyBhbmFseXNpcyBvbiBob3cgdGhlIGNoYW5nZSB3aWxsIGltcGFjdA0KPj4+PiB0
aGluZ3MuDQo+Pj4NCj4+PiBJIGFtIG5vdCB0aGUgb3JpZ2luYWwgYXV0aG9yIG9mIHRoZSBw
YXRjaCwgYW5kIEkgYW0gbm90IHRoZSBtYWludGFpbmVyDQo+Pj4gb2YgdGhlIGNvZGUsIHNv
IEkgZG9uJ3QgZmVlbCBJIGhhdmUgdGhlIHF1YWxpZmljYXRpb25zIHRvIGdpdmUgeW91IHRo
ZQ0KPj4+IGFuc3dlcnMgeW91IGFyZSBzZWVraW5nLiBKdWxpZW4gYXMgYXV0aG9yIG9mIHRo
ZSBwYXRjaCBhbmQgeGVuc3RvcmUNCj4+PiByZXZpZXdlciBtaWdodCBiZSBpbiBhIGJldHRl
ciBwb3NpdGlvbiB0byBhbnN3ZXIuIE9yIEp1ZXJnZW4gYXMgeGVuc3RvcmUNCj4+PiBtYWlu
dGFpbmVyLg0KPj4NCj4+IEkgdW5kZXJzdGFuZCB0aGF0OyBteSBtYWluIHBvaW50IGlzIHRo
YXQgdGhlIGNoYW5nZSBpcyBtb3JlIGNvbXBsZXgNCj4+IHRoYW4geW91J3JlIGNoYXJhY3Rl
cml6aW5nIGl0LsKgIFRoaXMgaXMgaW5mb3JtYXRpb24gbmVjZXNzYXJ5IHRvDQo+PiB1bmRl
cnN0YW5kIHdoZXRoZXIgdGhlIHBhdGNoIGlzIGNvcnJlY3QsIGJ1dCBpdCdzIG5vdCBpbiB0
aGUgcGF0Y2gNCj4+IGRlc2NyaXB0aW9uLCBub3IgaW4gdGhlIHN1YnNlcXVlbnQgdGhyZWFk
IGJhY2sgaW4gTWF5Lg0KPj4NCj4+Pj4gQXJlIHRoZXJlIGFueSBwYXRocyB0aHJvdWdoIGRv
X2RvbWFpbl9pbnRyb2R1Y2UoKSB0aGF0IG5vdyAqd29uJ3QqIGdldA0KPj4+PiBhIGRvbWFp
bl9jb25uX3Jlc2V0KCkgY2FsbD/CoCBJcyB0aGF0IE9LPw0KPj4+DQo+Pj4gWWVzLCB0aGUg
YWxyZWFkeS1pbnRyb2R1Y2VkIGFuZCB0aGUgcmVzdG9yZSBjb2RlIHBhdGhzLiBUaGUgb3Bl
cmF0aW9ucyBpbg0KPj4+IHRoZSBhbHJlYWR5LWludHJvZHVjZWQgb3IgdGhlIHJlc3RvcmUg
Y29kZSBwYXRocyBzZWVtIHNpbXBsZSBlbm91Z2ggbm90DQo+Pj4gdG8gcmVxdWlyZSBhIGRv
bWFpbl9jb25uX3Jlc2V0LiBKdWxpZW4gYW5kIEp1ZXJnZW4gc2hvdWxkIGNvbmZpcm0uDQo+
Pg0KPj4gVGhlcmUgaXMgbm8gInJlc3RvcmUiIGNvZGVwYXRoIHRocm91Z2ggZG9fZG9tYWlu
X2ludHJvZHVjZSgpOyBpdA0KPj4gcGFzc2VzICJmYWxzZSIgZm9yIHRoZSAicmVzdG9yZSIg
YXJndW1lbnQuwqAgU28gd2XCoCBvbmx5IGhhdmUgdHdvIHBhdGhzDQo+PiB0byBjb25zaWRl
ciB0aHJvdWdoIGRvX2RvbWFpbl9pbnRyb2R1Y2UoKTogVGhlICJub3QgaW50cm9kdWNlZCBh
bmQgbm90DQo+PiByZXN0b3JpbmciIHBhdGgsIGFuZCB0aGUgImFscmVhZHktaW50cm9kdWNl
ZCIgcGF0aC4NCj4+DQo+PiBJJ20gbm90IHN1cmUgd2hhdCB0aGUgInNpbXBsZSIgZWxlbWVu
dHMgb24gdGhlIGJyYW5jaCBpbg0KPj4gaW50cm9kdWNlX2RvbWFpbigpIGhhdmUgdG8gZG8g
d2l0aCB3aGV0aGVyIHRoZSBjb250ZW50IG9mIHRoZSBwYWdlDQo+PiBuZWVkcyB0byBiZSBj
bGVhbmVkIHVwLsKgIEFzIEkgc2FpZCwgSSBkb24ndCAxMDAlIHVuZGVyc3RhbmQgdGhpcyBj
b2RlLA0KPj4gYnV0IGl0IHNlZW1zIGxpa2UgaWYgYW55dGhpbmcsIHRoZSByZXNldCB3b3Vs
ZCBiZSAqbW9yZSogaW1wb3J0YW50IHRvDQo+PiBoYXZlIGluIHRoZSAicmVpbnRyb2R1Y2Ui
IGNhc2UgdGhhbiBpbiB0aGUgImluaXRpYWwgaW50cm9kdWN0aW9uIg0KPj4gY2FzZSwgc2lu
Y2UgSSdkIGV4cGVjdCB0aGUgImluaXRpYWwgaW50cm9kdWN0aW9uIiBjYXNlIHRvIGJlIGVt
cHR5DQo+PiBhbHJlYWR5Lg0KPiBJbmRlZWQsIHRoZXJlIHNob3VsZCBiZSBubyB3YXRjaGVz
L3RyYW5zYWN0aW9ucy9idWZmZXJlZCBJL08gZm9yIHRoZSBpbml0aWFsIA0KPiBpbnRyb2R1
Y3Rpb24uIEhvd2V2ZXIsIHRoZSBmdW5jdGlvbiBpcyBhbHNvIGNsZWFyIHBhcnQgb2YgdGhl
IGludGVyZmFjZSBiZWNhdXNlIA0KPiB3ZSBjYW4ndCBndWFyYW50ZWVkIGl0IHdhcyB6ZXJv
ZWQuDQo+IA0KPiBUaGUgbGF0dGVyIG1hdHRlciBmb3IgdGhlIGluaXRpYWwgaW50cm9kdWN0
aW9uLiBJIGJlbGlldmUgdGhlIHJlc3QgaXMganVzdCANCj4gY2FsbGVkIGZvciBzaW1wbGlj
aXR5Lg0KPiANCj4+DQo+Pj4gRG9lc24ndCBpdCBzZWVtIHdlaXJkIHRvIHlvdSB0aGF0IHdl
IHNldCBhIGNvbm5lY3Rpb24gdG8gQ09OTkVDVEVELA0KPj4+IG5vdGlmeSB0aGUgZG9tYWlu
IHRoYXQgaXQgaXMgcmVhZHkgdG8gZ28sIGFuZCBvbmx5ICphZnRlciogdGhhdCB3ZSByZXNl
dA0KPj4+IHRoZSBjb25uZWN0aW9uIHRvIHplcm8/DQo+Pj4NCj4+PiBXaGF0IGhhcHBlbnMg
aWYgYSBkb21haW4gc3RhcnRzIHVzaW5nIHRoZSBjb25uZWN0aW9uIGFzIHNvb24gYXMgaXQN
Cj4+PiByZWNlaXZlcyB0aGUgZXZlbnQgY2hhbm5lbCBub3RpZmljYXRpb24gYW5kIGJlZm9y
ZSBkb21haW5fY29ubl9yZXNldCBpcw0KPj4+IGNhbGxlZD8NCj4+DQo+PiBZZXMsIGl0IGRv
ZXMgc2VlbSB3ZWlyZCwgd2hpY2ggaXMgd2h5IEkgc2FpZCB0aGUgZm9sbG93aW5nLiA6LSkN
Cj4+DQo+Pj4+IEkgbWVhbiwgaXQgY2VydGFpbmx5IHNlZW1zIHN0cmFuZ2UgdG8gc2V0IHRo
ZSBzdGF0ZSB0byBDT05ORUNURUQsIHNlbmQNCj4+Pj4gb2ZmIGFuIGV2ZW50IGNoYW5uZWws
IGFuZCB0aGVuIGFmdGVyIHRoYXQgZGVsZXRlIGFsbCB3YXRjaGVzIC8NCj4+Pj4gdHJhbnNh
Y3Rpb25zIC8gYnVmZmVyZWQgZGF0YSBhbmQgc28gb247DQo+Pg0KPj4gQnV0IGp1c3QgYmVj
YXVzZSB0aGUgY3VycmVudCBjb2RlIGlzIHByb2JhYmx5IHdyb25nLCBkb2Vzbid0IG1lYW4g
dGhhdA0KPj4gdGhlIG1vZGlmaWVkIGNvZGUgaXMgcHJvYmFibHkgY29ycmVjdC4NCj4+DQo+
PiBJZiB0aGUgcHJvYmxlbSBpcyB0aGUgZGVsYXkgYmV0d2VlbiB0aGUgeGVuZXZ0Y2huX25v
dGlmeSgpIGluDQo+PiBpbnRyb2R1Y2VfZG9tYWluKCkgYW5kIHRoZSBkb21haW5fY29ubl9y
ZXNldCgpIGFmdGVyd2FyZHMgaW4NCj4+IGRvX2RvbWFpbigpLCB3b3VsZCBpdCBtYWtlIHNl
bnNlIGluc3RlYWQgdG8gbW92ZSB0aGUgbm90aWZpY2F0aW9uIGludG8NCj4+IGRvX2ludHJv
ZHVjZSgpLCBhZnRlciB0aGUgZG9tYWluX2Nvbm5fcmVzZXQoKT/CoCBJdCBpcywgYWZ0ZXIg
YWxsLCBpbg0KPj4gcmVzcG9uc2UgdG8gWFNfSU5UUk9EVUNFIHRoYXQgd2Ugd2FudCB0byBz
ZW5kIHRoZSBub3RpZmljYXRpb24sIG5vdCBpbg0KPj4gZG9tMF9pbml0KCkgb3IgcmVhZF9z
dGF0ZV9jb25uZWN0aW9uKCkgKHdoaWNoIHNlZW1zIHRvIGJlIG1vcmUgYWJvdXQNCj4+IHJl
c3RvcmluZyBhIGRvbWFpbikuDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgZXZlbnQg
Y2hhbm5lbCBub3RpZmljYXRpb24gd2FzIHNwZWNpZmljYWxseSBhZGRlZCBmb3IgDQo+IGRv
bTBsZXNzLiBCdXQgSSBkb24ndCBzZWUgd2h5IHdlIGRvbid0IHdhbnQgdG8gc2VuZCBpdCB0
byBkb20wIGFzIHdlbGwuDQo+IA0KPiBUZWNobmljYWxseSwgZG9tMCBoYXMgZXhhY3RseSB0
aGUgc2FtZSBwcm9ibGVtIGFzIGRvbTBsZXNzIGRvbWFpbnMgaXQgYm9vdHMgDQo+IGJlZm9y
ZSBYZW5zdG9yZWQgaXMgcnVubmluZyBhbmQgdGhlcmVmb3JlIGl0IG1heSBuZWVkIHRvIGtu
b3cgd2hlbiBpdCBpcyByZWFkeSANCj4gdG8gcmVjZWl2ZSBjb21tYW5kcy4NCg0KVW1tLCBu
bywgbm90IHJlYWxseS4NCg0KVGhlIG1haW4gZGlmZmVyZW5jZSBiZXR3ZWVuIGRvbTAgYW5k
IGEgZG9tMGxlc3MgZG9tVSBpcywgdGhhdCB4ZW5zdG9yZWQNCmludHJvZHVjZXMgZG9tMCBi
eSBpdHNlbGYgdmlhIGEgY2FsbCBvZiBkb20wX2luaXQoKSwgd2hpbGUgdGhlIGRvbTBsZXNz
DQpkb21VcyBnZXQgaW50cm9kdWNlZCBieSBYZW4gdG9vbHMgaW4gY2FzZSBhIGRvbTAgaXMg
Y29taW5nIHVwIGxhdGVyLiBBbmQNCnRoYXQgWFNfSU5UUk9EVUNFIHdpbGwgY2xvYmJlciBh
bnkgcmluZyBwYWdlIGNvbnRlbnRzLCB3aGlsZSBhIGNhbGwgb2YNCmRvbTBfaW5pdCgpIHdv
bid0IGRvIHRoYXQuDQoNCkRvbTAgKGVzcGVjaWFsbHkgdGhlIGtlcm5lbCkgaXMgZmluZSB0
byBzdGFydCBmaWxsaW5nIHRoZSByaW5nIHBhZ2Ugd2l0aA0KcmVxdWVzdHMgZXZlbiBiZWZv
cmUgeGVuc3RvcmVkIGlzIHJ1bm5pbmcuIEl0IGp1c3Qgc2hvdWxkbid0IGV4cGVjdCB0bw0K
cmVjZWl2ZSBhbnkgcmVzcG9uc2VzIHJpZ2h0IGF3YXkuDQoNCg0KSnVlcmdlbg0K
--------------gbr2Uoo9zLlfZGNBeWOmIT3z
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gbr2Uoo9zLlfZGNBeWOmIT3z--

--------------2LSrz6n6BZgq8Gv1Dkf4QCII--

--------------0fyiXdGR0Xh06dpW74G73v0o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUpWHwFAwAAAAAACgkQsN6d1ii/Ey8l
7Af/Q11diqcgfj1zXeKjEx8lLt9TtTy25gzzZShiViFflgGcRIDGRQlkzEvgzY7ciCojns+eixQY
w1LYrrR3djXlJUGJ9J7bE1Kbnprpc5I6YYxw/lsSauGMyaARCxesrVyrwG1meUmxVR1XeUCB8Gae
A9/0QUbcxpalUGJ6v0qLH0A0INHlJxlQ6oMBufeNPpwU+hNGa47IHWjC9w7+Sn9JqUpHErYC2yMr
K6KwYc6QZWla/KT4N2hGCu+eQ9sxl8liq/JvrHrSi0WAXv3ujllwa77+AsIjEcZo3sJZowG/Vwmz
bvTBKQVOn5B9Fx4vVhGYe46p11GCCh1oYwibragRyQ==
=x5G0
-----END PGP SIGNATURE-----

--------------0fyiXdGR0Xh06dpW74G73v0o--

