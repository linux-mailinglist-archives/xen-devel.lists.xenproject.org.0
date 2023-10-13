Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070297C8841
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616644.958794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJi4-0004c4-Rq; Fri, 13 Oct 2023 15:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616644.958794; Fri, 13 Oct 2023 15:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJi4-0004aI-Oi; Fri, 13 Oct 2023 15:04:16 +0000
Received: by outflank-mailman (input) for mailman id 616644;
 Fri, 13 Oct 2023 15:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrJi3-0004aA-Mp
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:04:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3792b2f-69d9-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:04:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACA1A219EC;
 Fri, 13 Oct 2023 15:04:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 539E3138EF;
 Fri, 13 Oct 2023 15:04:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id THflEmlcKWUqQwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 15:04:09 +0000
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
X-Inumbo-ID: c3792b2f-69d9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697209449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZxwgBRs/NTe+F2qJvCdR9vFDN7a/MPHqOddGdF75WNg=;
	b=W1h5V8s5OXEdtX5LPKsGdkU1uaLPm9bH3zDo+O57sXW/72ioqmCtCmO0IsdSKWYFOyC0lr
	S+gWYtB8pQAX/Mjn9/ty9cJgl2yGtN3BbATPIxA+CRzt01h+CY7T5WFOuMF+QJ3jssikFB
	+lxxrv6cTmSVSOVDJy+53QEiYniChXY=
Message-ID: <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
Date: Fri, 13 Oct 2023 17:04:08 +0200
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
 <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
 <e76d5b41-5057-4ebe-affd-ae1a158071a1@xen.org>
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
In-Reply-To: <e76d5b41-5057-4ebe-affd-ae1a158071a1@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1OPAsa0zGAbbc43CX6Zvwh4o"
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
--------------1OPAsa0zGAbbc43CX6Zvwh4o
Content-Type: multipart/mixed; boundary="------------7Veau3AwEzFUQnbE4MzFt9zj";
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
Message-ID: <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org>
 <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
 <e76d5b41-5057-4ebe-affd-ae1a158071a1@xen.org>
In-Reply-To: <e76d5b41-5057-4ebe-affd-ae1a158071a1@xen.org>

--------------7Veau3AwEzFUQnbE4MzFt9zj
Content-Type: multipart/mixed; boundary="------------WU4UepAvLYmWZiJ3sfjQ3iz2"

--------------WU4UepAvLYmWZiJ3sfjQ3iz2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjMgMTY6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEzLzEwLzIwMjMgMTU6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxMy4xMC4yMyAxMzoyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEdlb3JnZSwN
Cj4+Pg0KPj4+IE9uIDEzLzEwLzIwMjMgMTE6MTYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+
Pj4+IE9uIFRodSwgT2N0IDEyLCAyMDIzIGF0IDExOjM24oCvUE0gU3RlZmFubyBTdGFiZWxs
aW5pDQo+Pj4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+DQo+Pj4+
PiBPbiBUaHUsIDEyIE9jdCAyMDIzLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+Pj4+Pj4g
U3RvcCB0aW5rZXJpbmcgaW4gdGhlIGhvcGUgdGhhdCBpdCBoaWRlcyB0aGUgcHJvYmxlbS7C
oCBZb3UncmUgb25seQ0KPj4+Pj4+Pj4gbWFraW5nIGl0IGhhcmRlciB0byBmaXggcHJvcGVy
bHkuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE1ha2luZyBpdCBoYXJkZXIgdG8gZml4IHByb3Blcmx5
IHdvdWxkIGJlIGEgdmFsaWQgcmVhc29uIG5vdCB0byBjb21taXQNCj4+Pj4+Pj4gdGhlICht
YXliZSBwYXJ0aWFsKSBmaXguIEJ1dCBsb29raW5nIGF0IHRoZSBmaXggYWdhaW46DQo+Pj4+
Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvZG9tYWluLmMgYi90
b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+Pj4+Pj4gaW5kZXggYTZjZDE5OWZkYy4uOWNk
NjY3ODAxNSAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5j
DQo+Pj4+Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4+Pj4+PiBAQCAt
OTg5LDYgKzk4OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG9tYWluICppbnRyb2R1Y2VfZG9tYWlu
KGNvbnN0IHZvaWQgKmN0eCwNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdGFsbG9jX3N0ZWFsKGRvbWFpbi0+Y29ubiwgZG9tYWluKTsNCj4+Pj4+Pj4NCj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyZXN0b3JlKSB7
DQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkb21haW5fY29ubl9yZXNldChkb21haW4pOw0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogTm90aWZ5IHRoZSBkb21haW4g
dGhhdCB4ZW5zdG9yZSBpcyBhdmFpbGFibGUgKi8NCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVyZmFjZS0+Y29ubmVjdGlv
biA9IFhFTlNUT1JFX0NPTk5FQ1RFRDsNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlbmV2dGNobl9ub3RpZnkoeGNlX2hhbmRs
ZSwgZG9tYWluLT5wb3J0KTsNCj4+Pj4+Pj4gQEAgLTEwMzEsOCArMTAzMiw2IEBAIGludCBk
b19pbnRyb2R1Y2UoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiANCj4+Pj4+
Pj4gKmNvbm4sDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFkb21haW4pDQo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnJubzsNCj4+
Pj4+Pj4NCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoCBkb21haW5fY29ubl9yZXNldChkb21haW4p
Ow0KPj4+Pj4+PiAtDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgc2VuZF9hY2soY29ubiwg
WFNfSU5UUk9EVUNFKTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gSXQgaXMgYSAxLWxpbmUgbW92ZW1l
bnQuIFRleHR1YWxseSBzbWFsbC4gRWFzeSB0byB1bmRlcnN0YW5kIGFuZCB0bw0KPj4+Pj4+
PiByZXZlcnQuIEl0IGRvZXNuJ3Qgc2VlbSB0byBiZSBtYWtpbmcgdGhpbmdzIGhhcmRlciB0
byBmaXg/IFdlIGNvdWxkDQo+Pj4+Pj4+IHJldmVydCBpdCBhbnkgdGltZSBpZiBhIGJldHRl
ciBmaXggaXMgb2ZmZXJlZC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gTWF5YmUgd2UgY291bGQgaGF2
ZSBhIFhYWCBub3RlIGluIHRoZSBjb21taXQgbWVzc2FnZSBvciBpbi1jb2RlDQo+Pj4+Pj4+
IGNvbW1lbnQ/DQo+Pj4+Pj4NCj4+Pj4+PiBJdCBtb3ZlcyBhIGxpbmUgZnJvbSBvbmUgZnVu
Y3Rpb24gKGRvX2RvbWFpbl9pbnRyb2R1Y2UoKSkgaW50byBhDQo+Pj4+Pj4gY29tcGxldGVs
eSBkaWZmZXJlbnQgZnVuY3Rpb24gKGludHJvZHVjZV9kb21haW4oKSksIG5lc3RlZCBpbnNp
ZGUgdHdvDQo+Pj4+Pj4gaWYoKSBzdGF0ZW1lbnRzOyB3aXRoIG5vIGFuYWx5c2lzIG9uIGhv
dyB0aGUgY2hhbmdlIHdpbGwgaW1wYWN0DQo+Pj4+Pj4gdGhpbmdzLg0KPj4+Pj4NCj4+Pj4+
IEkgYW0gbm90IHRoZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhlIHBhdGNoLCBhbmQgSSBhbSBu
b3QgdGhlIG1haW50YWluZXINCj4+Pj4+IG9mIHRoZSBjb2RlLCBzbyBJIGRvbid0IGZlZWwg
SSBoYXZlIHRoZSBxdWFsaWZpY2F0aW9ucyB0byBnaXZlIHlvdSB0aGUNCj4+Pj4+IGFuc3dl
cnMgeW91IGFyZSBzZWVraW5nLiBKdWxpZW4gYXMgYXV0aG9yIG9mIHRoZSBwYXRjaCBhbmQg
eGVuc3RvcmUNCj4+Pj4+IHJldmlld2VyIG1pZ2h0IGJlIGluIGEgYmV0dGVyIHBvc2l0aW9u
IHRvIGFuc3dlci4gT3IgSnVlcmdlbiBhcyB4ZW5zdG9yZQ0KPj4+Pj4gbWFpbnRhaW5lci4N
Cj4+Pj4NCj4+Pj4gSSB1bmRlcnN0YW5kIHRoYXQ7IG15IG1haW4gcG9pbnQgaXMgdGhhdCB0
aGUgY2hhbmdlIGlzIG1vcmUgY29tcGxleA0KPj4+PiB0aGFuIHlvdSdyZSBjaGFyYWN0ZXJp
emluZyBpdC7CoCBUaGlzIGlzIGluZm9ybWF0aW9uIG5lY2Vzc2FyeSB0bw0KPj4+PiB1bmRl
cnN0YW5kIHdoZXRoZXIgdGhlIHBhdGNoIGlzIGNvcnJlY3QsIGJ1dCBpdCdzIG5vdCBpbiB0
aGUgcGF0Y2gNCj4+Pj4gZGVzY3JpcHRpb24sIG5vciBpbiB0aGUgc3Vic2VxdWVudCB0aHJl
YWQgYmFjayBpbiBNYXkuDQo+Pj4+DQo+Pj4+Pj4gQXJlIHRoZXJlIGFueSBwYXRocyB0aHJv
dWdoIGRvX2RvbWFpbl9pbnRyb2R1Y2UoKSB0aGF0IG5vdyAqd29uJ3QqIGdldA0KPj4+Pj4+
IGEgZG9tYWluX2Nvbm5fcmVzZXQoKSBjYWxsP8KgIElzIHRoYXQgT0s/DQo+Pj4+Pg0KPj4+
Pj4gWWVzLCB0aGUgYWxyZWFkeS1pbnRyb2R1Y2VkIGFuZCB0aGUgcmVzdG9yZSBjb2RlIHBh
dGhzLiBUaGUgb3BlcmF0aW9ucyBpbg0KPj4+Pj4gdGhlIGFscmVhZHktaW50cm9kdWNlZCBv
ciB0aGUgcmVzdG9yZSBjb2RlIHBhdGhzIHNlZW0gc2ltcGxlIGVub3VnaCBub3QNCj4+Pj4+
IHRvIHJlcXVpcmUgYSBkb21haW5fY29ubl9yZXNldC4gSnVsaWVuIGFuZCBKdWVyZ2VuIHNo
b3VsZCBjb25maXJtLg0KPj4+Pg0KPj4+PiBUaGVyZSBpcyBubyAicmVzdG9yZSIgY29kZXBh
dGggdGhyb3VnaCBkb19kb21haW5faW50cm9kdWNlKCk7IGl0DQo+Pj4+IHBhc3NlcyAiZmFs
c2UiIGZvciB0aGUgInJlc3RvcmUiIGFyZ3VtZW50LsKgIFNvIHdlwqAgb25seSBoYXZlIHR3
byBwYXRocw0KPj4+PiB0byBjb25zaWRlciB0aHJvdWdoIGRvX2RvbWFpbl9pbnRyb2R1Y2Uo
KTogVGhlICJub3QgaW50cm9kdWNlZCBhbmQgbm90DQo+Pj4+IHJlc3RvcmluZyIgcGF0aCwg
YW5kIHRoZSAiYWxyZWFkeS1pbnRyb2R1Y2VkIiBwYXRoLg0KPj4+Pg0KPj4+PiBJJ20gbm90
IHN1cmUgd2hhdCB0aGUgInNpbXBsZSIgZWxlbWVudHMgb24gdGhlIGJyYW5jaCBpbg0KPj4+
PiBpbnRyb2R1Y2VfZG9tYWluKCkgaGF2ZSB0byBkbyB3aXRoIHdoZXRoZXIgdGhlIGNvbnRl
bnQgb2YgdGhlIHBhZ2UNCj4+Pj4gbmVlZHMgdG8gYmUgY2xlYW5lZCB1cC7CoCBBcyBJIHNh
aWQsIEkgZG9uJ3QgMTAwJSB1bmRlcnN0YW5kIHRoaXMgY29kZSwNCj4+Pj4gYnV0IGl0IHNl
ZW1zIGxpa2UgaWYgYW55dGhpbmcsIHRoZSByZXNldCB3b3VsZCBiZSAqbW9yZSogaW1wb3J0
YW50IHRvDQo+Pj4+IGhhdmUgaW4gdGhlICJyZWludHJvZHVjZSIgY2FzZSB0aGFuIGluIHRo
ZSAiaW5pdGlhbCBpbnRyb2R1Y3Rpb24iDQo+Pj4+IGNhc2UsIHNpbmNlIEknZCBleHBlY3Qg
dGhlICJpbml0aWFsIGludHJvZHVjdGlvbiIgY2FzZSB0byBiZSBlbXB0eQ0KPj4+PiBhbHJl
YWR5Lg0KPj4+IEluZGVlZCwgdGhlcmUgc2hvdWxkIGJlIG5vIHdhdGNoZXMvdHJhbnNhY3Rp
b25zL2J1ZmZlcmVkIEkvTyBmb3IgdGhlIGluaXRpYWwgDQo+Pj4gaW50cm9kdWN0aW9uLiBI
b3dldmVyLCB0aGUgZnVuY3Rpb24gaXMgYWxzbyBjbGVhciBwYXJ0IG9mIHRoZSBpbnRlcmZh
Y2UgDQo+Pj4gYmVjYXVzZSB3ZSBjYW4ndCBndWFyYW50ZWVkIGl0IHdhcyB6ZXJvZWQuDQo+
Pj4NCj4+PiBUaGUgbGF0dGVyIG1hdHRlciBmb3IgdGhlIGluaXRpYWwgaW50cm9kdWN0aW9u
LiBJIGJlbGlldmUgdGhlIHJlc3QgaXMganVzdCANCj4+PiBjYWxsZWQgZm9yIHNpbXBsaWNp
dHkuDQo+Pj4NCj4+Pj4NCj4+Pj4+IERvZXNuJ3QgaXQgc2VlbSB3ZWlyZCB0byB5b3UgdGhh
dCB3ZSBzZXQgYSBjb25uZWN0aW9uIHRvIENPTk5FQ1RFRCwNCj4+Pj4+IG5vdGlmeSB0aGUg
ZG9tYWluIHRoYXQgaXQgaXMgcmVhZHkgdG8gZ28sIGFuZCBvbmx5ICphZnRlciogdGhhdCB3
ZSByZXNldA0KPj4+Pj4gdGhlIGNvbm5lY3Rpb24gdG8gemVybz8NCj4+Pj4+DQo+Pj4+PiBX
aGF0IGhhcHBlbnMgaWYgYSBkb21haW4gc3RhcnRzIHVzaW5nIHRoZSBjb25uZWN0aW9uIGFz
IHNvb24gYXMgaXQNCj4+Pj4+IHJlY2VpdmVzIHRoZSBldmVudCBjaGFubmVsIG5vdGlmaWNh
dGlvbiBhbmQgYmVmb3JlIGRvbWFpbl9jb25uX3Jlc2V0IGlzDQo+Pj4+PiBjYWxsZWQ/DQo+
Pj4+DQo+Pj4+IFllcywgaXQgZG9lcyBzZWVtIHdlaXJkLCB3aGljaCBpcyB3aHkgSSBzYWlk
IHRoZSBmb2xsb3dpbmcuIDotKQ0KPj4+Pg0KPj4+Pj4+IEkgbWVhbiwgaXQgY2VydGFpbmx5
IHNlZW1zIHN0cmFuZ2UgdG8gc2V0IHRoZSBzdGF0ZSB0byBDT05ORUNURUQsIHNlbmQNCj4+
Pj4+PiBvZmYgYW4gZXZlbnQgY2hhbm5lbCwgYW5kIHRoZW4gYWZ0ZXIgdGhhdCBkZWxldGUg
YWxsIHdhdGNoZXMgLw0KPj4+Pj4+IHRyYW5zYWN0aW9ucyAvIGJ1ZmZlcmVkIGRhdGEgYW5k
IHNvIG9uOw0KPj4+Pg0KPj4+PiBCdXQganVzdCBiZWNhdXNlIHRoZSBjdXJyZW50IGNvZGUg
aXMgcHJvYmFibHkgd3JvbmcsIGRvZXNuJ3QgbWVhbiB0aGF0DQo+Pj4+IHRoZSBtb2RpZmll
ZCBjb2RlIGlzIHByb2JhYmx5IGNvcnJlY3QuDQo+Pj4+DQo+Pj4+IElmIHRoZSBwcm9ibGVt
IGlzIHRoZSBkZWxheSBiZXR3ZWVuIHRoZSB4ZW5ldnRjaG5fbm90aWZ5KCkgaW4NCj4+Pj4g
aW50cm9kdWNlX2RvbWFpbigpIGFuZCB0aGUgZG9tYWluX2Nvbm5fcmVzZXQoKSBhZnRlcndh
cmRzIGluDQo+Pj4+IGRvX2RvbWFpbigpLCB3b3VsZCBpdCBtYWtlIHNlbnNlIGluc3RlYWQg
dG8gbW92ZSB0aGUgbm90aWZpY2F0aW9uIGludG8NCj4+Pj4gZG9faW50cm9kdWNlKCksIGFm
dGVyIHRoZSBkb21haW5fY29ubl9yZXNldCgpP8KgIEl0IGlzLCBhZnRlciBhbGwsIGluDQo+
Pj4+IHJlc3BvbnNlIHRvIFhTX0lOVFJPRFVDRSB0aGF0IHdlIHdhbnQgdG8gc2VuZCB0aGUg
bm90aWZpY2F0aW9uLCBub3QgaW4NCj4+Pj4gZG9tMF9pbml0KCkgb3IgcmVhZF9zdGF0ZV9j
b25uZWN0aW9uKCkgKHdoaWNoIHNlZW1zIHRvIGJlIG1vcmUgYWJvdXQNCj4+Pj4gcmVzdG9y
aW5nIGEgZG9tYWluKS4NCj4+Pg0KPj4+IEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBldmVudCBj
aGFubmVsIG5vdGlmaWNhdGlvbiB3YXMgc3BlY2lmaWNhbGx5IGFkZGVkIGZvciANCj4+PiBk
b20wbGVzcy4gQnV0IEkgZG9uJ3Qgc2VlIHdoeSB3ZSBkb24ndCB3YW50IHRvIHNlbmQgaXQg
dG8gZG9tMCBhcyB3ZWxsLg0KPj4+DQo+Pj4gVGVjaG5pY2FsbHksIGRvbTAgaGFzIGV4YWN0
bHkgdGhlIHNhbWUgcHJvYmxlbSBhcyBkb20wbGVzcyBkb21haW5zIGl0IGJvb3RzIA0KPj4+
IGJlZm9yZSBYZW5zdG9yZWQgaXMgcnVubmluZyBhbmQgdGhlcmVmb3JlIGl0IG1heSBuZWVk
IHRvIGtub3cgd2hlbiBpdCBpcyANCj4+PiByZWFkeSB0byByZWNlaXZlIGNvbW1hbmRzLg0K
Pj4NCj4+IFVtbSwgbm8sIG5vdCByZWFsbHkuDQo+Pg0KPj4gVGhlIG1haW4gZGlmZmVyZW5j
ZSBiZXR3ZWVuIGRvbTAgYW5kIGEgZG9tMGxlc3MgZG9tVSBpcywgdGhhdCB4ZW5zdG9yZWQN
Cj4+IGludHJvZHVjZXMgZG9tMCBieSBpdHNlbGYgdmlhIGEgY2FsbCBvZiBkb20wX2luaXQo
KSwgd2hpbGUgdGhlIGRvbTBsZXNzDQo+PiBkb21VcyBnZXQgaW50cm9kdWNlZCBieSBYZW4g
dG9vbHMgaW4gY2FzZSBhIGRvbTAgaXMgY29taW5nIHVwIGxhdGVyLiBBbmQNCj4+IHRoYXQg
WFNfSU5UUk9EVUNFIHdpbGwgY2xvYmJlciBhbnkgcmluZyBwYWdlIGNvbnRlbnRzLCB3aGls
ZSBhIGNhbGwgb2YNCj4+IGRvbTBfaW5pdCgpIHdvbid0IGRvIHRoYXQuDQo+Pg0KPj4gRG9t
MCAoZXNwZWNpYWxseSB0aGUga2VybmVsKSBpcyBmaW5lIHRvIHN0YXJ0IGZpbGxpbmcgdGhl
IHJpbmcgcGFnZSB3aXRoDQo+PiByZXF1ZXN0cyBldmVuIGJlZm9yZSB4ZW5zdG9yZWQgaXMg
cnVubmluZy4gSXQganVzdCBzaG91bGRuJ3QgZXhwZWN0IHRvDQo+PiByZWNlaXZlIGFueSBy
ZXNwb25zZXMgcmlnaHQgYXdheS4NCj4gSSBhbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5
IGZpbmUuIFlvdSB3aWxsIHNlZSBoYW5nIG5vdGlmaWNhdGlvbnMgaWYgDQo+IFhlbnN0b3Jl
ZCBpcyBub3Qgc3RhcnRlZCBpbiB0aW1lLiBJc24ndCB3aHkgd2UgZGVjaWRlZCB0byBnbyB3
aXRoIGEgZGlmZmVyZW50IA0KPiB3YXkgZm9yIGRvbTBsZXNzPw0KDQpUaGUgbWFpbiBkaWZm
ZXJlbmNlIGlzIHRoYXQgZG9tMCB0ZWxscyB4ZW5zdG9yZWQgdGhlIGNvbm5lY3Rpb24gcGFy
YW1ldGVycyBmb3INCml0c2VsZiwgc28gZG9tMCBfa25vd3NfIHRoYXQgdGhlIHJpbmcgcGFn
ZSBpcyBzZXR1cCBjb3JyZWN0bHkgd2hlbiB4ZW5zdG9yZWQNCnN0YXJ0cyBsb29raW5nIGF0
IGl0IChpdCBpcyBkb20wIHdoaWNoIG5lZWRzIHRvIGRvIHRoZSByaW5nIHBhZ2UgaW5pdCku
DQoNCkEgZG9tMGxlc3MgZG9tVSBkb2Vzbid0IGhhdmUgdGhhdCBuZWdvdGlhdGlvbiB3aXRo
IHhlbnN0b3JlZCwgYXMgeGVuc3RvcmVkIGp1c3QNCnVzZXMgdGhlIHByZS1kZWZpbmVkIGdy
YW50IGZvciBsb29raW5nIGF0IHRoZSByaW5nIHBhZ2UuIEZvciB0aGUgZG9tVSB0aGVyZSBp
cw0Kbm8gd2F5IHRvIHRlbGwgdGhhdCB4ZW5zdG9yZWQgaGFzIGluaXRpYWxpemVkIHRoZSBy
aW5nIHBhZ2UgKGl0IGlzIG5vdCB0aGUgZG9tVQ0KdG8gZG8gdGhlIGluaXRpYWxpemF0aW9u
LCBhcyB0aGUgWFNfSU5UUk9EVUNFIG1pZ2h0IGJlIHNlbnQgYmVmb3JlIHRoZSBkb21VDQpl
dmVuIHN0YXJ0cyBydW5uaW5nKSwgb3RoZXIgdGhhbiB0aGUgImNvbm5lY3RlZCIgaW5kaWNh
dG9yIGluIHRoZSBwYWdlIGl0c2VsZi4NCg0KDQpKdWVyZ2VuDQo=
--------------WU4UepAvLYmWZiJ3sfjQ3iz2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WU4UepAvLYmWZiJ3sfjQ3iz2--

--------------7Veau3AwEzFUQnbE4MzFt9zj--

--------------1OPAsa0zGAbbc43CX6Zvwh4o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUpXGgFAwAAAAAACgkQsN6d1ii/Ey/M
Owf/Z7X8UZlXd1waOk7ix8fsUEZNKjgkYrC34QUbkEoPGnLKQE49Zegn1XXYjRU5x5jKHk3i+Xxp
kPGiAn07AchW3hnm3TzZFnRsiyNBB95K+92sAmnueV/8RbwzKNKAVrjr8mbtG/lVuUoyZsyV9QNZ
eJjeSX5hn3rJlsS6czmeReWRWanjjTomuuWZHSvbguwVWN4Cy/pZHJN71rAd2JhQiMcUTsHAFs+j
0Rn/EN99iWaiB5NGlKASOZgz78Jpv5Y/snLxVGpIIiUPhQkB3EZFaw68yYPZm9Ee2/xQ++KvKCVP
fZfqSSEm/h2BKuu439lCVXiUIycEC2iwO1UWhizBig==
=TsEA
-----END PGP SIGNATURE-----

--------------1OPAsa0zGAbbc43CX6Zvwh4o--

