Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1C7EBCF3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 07:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633491.988306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r39AT-0004em-Rb; Wed, 15 Nov 2023 06:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633491.988306; Wed, 15 Nov 2023 06:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r39AT-0004cs-OX; Wed, 15 Nov 2023 06:14:29 +0000
Received: by outflank-mailman (input) for mailman id 633491;
 Wed, 15 Nov 2023 06:14:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzjc=G4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r39AS-0004cm-24
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 06:14:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aa73476-837e-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 07:14:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0577C1F8B2;
 Wed, 15 Nov 2023 06:14:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAF6313587;
 Wed, 15 Nov 2023 06:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mpILMMFhVGVgUQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Nov 2023 06:14:25 +0000
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
X-Inumbo-ID: 3aa73476-837e-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700028866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=V+3VVeR3eiXuQskMznGZs5Ws+JgwlInYkxkD03u/83U=;
	b=tuuQ4Hz3yG8mFzrotJA9lb8Yp7ZHvW0ScOpBzhR88wZiMjt/QkXUBhy3JKz1gIsum/srfk
	D0o9vld4FICYKcMAFj8nr/vq6Veh+pmzDTT3eTa0vA7p3M0LxgvLtJfUtehLRK3nPkYgvY
	mdrqE6mwcWXGQX99NhZb09TLF+y3S5g=
Message-ID: <34c2307e-f99d-41ab-b76c-948389c64bd0@suse.com>
Date: Wed, 15 Nov 2023 07:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
 <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
 <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>
 <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
 <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org>
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
In-Reply-To: <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Erl0GRqFPYieUOy2dZv9qPQ9"
Authentication-Results: smtp-out2.suse.de;
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
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 BAYES_HAM(-3.00)[100.00%];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Erl0GRqFPYieUOy2dZv9qPQ9
Content-Type: multipart/mixed; boundary="------------ukmo90m6dgRB3fMahOoe00bF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <34c2307e-f99d-41ab-b76c-948389c64bd0@suse.com>
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
 <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
 <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>
 <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
 <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org>
In-Reply-To: <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org>

--------------ukmo90m6dgRB3fMahOoe00bF
Content-Type: multipart/mixed; boundary="------------0t8MhRR4yn3PAGB0o6h46WU6"

--------------0t8MhRR4yn3PAGB0o6h46WU6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjMgMjE6NTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE0LzExLzIwMjMgMDk6MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxNC4xMS4yMyAxMDoxMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxNC8xMS8yMDIzIDA2OjQ1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBPbiAxMy4xMS4yMyAyMzoyNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gSGkg
SnVlcmdlbiwNCj4+Pj4+DQo+Pj4+PiBPbiAxMC8xMS8yMDIzIDE2OjA4LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOg0KPj4+Pj4+IEFkZCBzb21lIGhlbHBlcnMgZm9yIGhhbmRsaW5nIGZpbGVu
YW1lcyB3aGljaCBtaWdodCBuZWVkIGRpZmZlcmVudA0KPj4+Pj4+IGltcGxlbWVudGF0aW9u
cyBiZXR3ZWVuIHN0dWJkb20gYW5kIGRhZW1vbiBlbnZpcm9ubWVudHM6DQo+Pj4+Pj4NCj4+
Pj4+PiAtIGV4cGFuc2lvbiBvZiByZWxhdGl2ZSBmaWxlbmFtZXMgKHRob3NlIGFyZSBub3Qg
cmVhbGx5IGRlZmluZWQgdG9kYXksDQo+Pj4+Pj4gwqDCoCBqdXN0IGV4cGFuZCB0aGVtIHRv
IGJlIHJlbGF0aXZlIHRvIC92YXIvbGliL3hlbi94ZW5zdG9yZSkNCj4+Pj4+PiAtIGV4cGFu
c2lvbiBvZiB4ZW5zdG9yZV9kYWVtb25fcnVuZGlyKCkgKHVzZWQgZS5nLiBmb3Igc2F2aW5n
IHRoZSBzdGF0ZQ0KPj4+Pj4+IMKgwqAgZmlsZSBpbiBjYXNlIG9mIGxpdmUgdXBkYXRlIC0g
bmVlZHMgdG8gYmUgdW5jaGFuZ2VkIGluIHRoZSBkYWVtb24NCj4+Pj4+PiDCoMKgIGNhc2Us
IGJ1dCBzaG91bGQgcmVzdWx0IGluIC92YXIvbGliL3hlbi94ZW5zdG9yZSBmb3Igc3R1YmRv
bSkNCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCj4+Pj4+PiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5
dWtAZ21haWwuY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9j
b3JlLmPCoMKgwqDCoMKgIHwgOSArKysrKysrKy0NCj4+Pj4+PiDCoCB0b29scy94ZW5zdG9y
ZWQvY29yZS5owqDCoMKgwqDCoCB8IDMgKysrDQo+Pj4+Pj4gwqAgdG9vbHMveGVuc3RvcmVk
L2x1X2RhZW1vbi5jIHwgNCArKy0tDQo+Pj4+Pj4gwqAgdG9vbHMveGVuc3RvcmVkL21pbmlv
cy5jwqDCoMKgIHwgNSArKysrKw0KPj4+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9wb3NpeC5j
wqDCoMKgwqAgfCA1ICsrKysrDQo+Pj4+Pj4gwqAgNSBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMgYi90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+Pj4+
Pj4gaW5kZXggNGE5ZDg3NGYxNy4uNzdiZWZkMjRjOSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS90
b29scy94ZW5zdG9yZWQvY29yZS5jDQo+Pj4+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2Nv
cmUuYw0KPj4+Pj4+IEBAIC0xNTgsNiArMTU4LDEzIEBAIHZvaWQgdHJhY2VfZGVzdHJveShj
b25zdCB2b2lkICpkYXRhLCBjb25zdCBjaGFyICp0eXBlKQ0KPj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCB0cmFjZSgib2JqOiBERVNUUk9ZICVzICVwXG4iLCB0eXBlLCBkYXRhKTsNCj4+
Pj4+PiDCoCB9DQo+Pj4+Pj4gK2NoYXIgKmFic29sdXRlX2ZpbGVuYW1lKGNvbnN0IHZvaWQg
KmN0eCwgY29uc3QgY2hhciAqZmlsZW5hbWUpDQo+Pj4+Pg0KPj4+Pj4gQ2FuIHRoZSByZXR1
cm4gYmUgY29uc3Q/DQo+Pj4+DQo+Pj4+IEknbGwgaGF2ZSBhIGxvb2suDQo+Pj4+DQo+Pj4+
Pg0KPj4+Pj4+ICt7DQo+Pj4+Pj4gK8KgwqDCoCBpZiAoZmlsZW5hbWVbMF0gIT0gJy8nKQ0K
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gdGFsbG9jX2FzcHJpbnRmKGN0eCwgWEVO
U1RPUkVfTElCX0RJUiAiLyVzIiwgZmlsZW5hbWUpOw0KPj4+Pj4NCj4+Pj4+IExvb2tpbmcg
YXQgdGhlIHJlc3Qgb2YgcGF0Y2gsIHlvdSB3aWxsIGJlIHVzaW5nIHhlbnN0b3JlX3J1bmRp
cigpLiBJIHdvbmRlciANCj4+Pj4+IHdoZXRoZXIgaXQgd291bGQgbm90IGJlIGJldHRlciB0
byBzd2l0Y2ggdG8geGVuc3RvcmVfcnVuZGlyKCkgc28uLi4NCj4+Pj4+DQo+Pj4+Pj4gK8Kg
wqDCoCByZXR1cm4gdGFsbG9jX3N0cmR1cChjdHgsIGZpbGVuYW1lKTsNCj4+Pj4+PiArfQ0K
Pj4+Pj4+ICsNCj4+Pj4+PiDCoCAvKioNCj4+Pj4+PiDCoMKgICogU2lnbmFsIGhhbmRsZXIg
Zm9yIFNJR0hVUCwgd2hpY2ggcmVxdWVzdHMgdGhhdCB0aGUgdHJhY2UgbG9nIGlzIHJlb3Bl
bmVkDQo+Pj4+Pj4gwqDCoCAqIChpbiB0aGUgbWFpbiBsb29wKS7CoCBBIHNpbmdsZSBieXRl
IGlzIHdyaXR0ZW4gdG8gcmVvcGVuX2xvZ19waXBlLCB0byANCj4+Pj4+PiBhd2FrZW4NCj4+
Pj4+PiBAQCAtMjk4Myw3ICsyOTkwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkNCj4+Pj4+PiDCoMKgwqDCoMKgIHNpZ25hbChTSUdIVVAsIHRyaWdnZXJfcmVvcGVu
X2xvZyk7DQo+Pj4+Pj4gwqDCoMKgwqDCoCBpZiAodHJhY2VmaWxlKQ0KPj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoCB0cmFjZWZpbGUgPSB0YWxsb2Nfc3RyZHVwKE5VTEwsIHRyYWNlZmlsZSk7
DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHRyYWNlZmlsZSA9IGFic29sdXRlX2ZpbGVuYW1l
KE5VTEwsIHRyYWNlZmlsZSk7DQo+Pj4+Pj4gwqAgI2lmbmRlZiBOT19MSVZFX1VQREFURQ0K
Pj4+Pj4+IMKgwqDCoMKgwqAgLyogUmVhZCBzdGF0ZSBpbiBjYXNlIG9mIGxpdmUgdXBkYXRl
LiAqLw0KPj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvY29yZS5oIGIvdG9v
bHMveGVuc3RvcmVkL2NvcmUuaA0KPj4+Pj4+IGluZGV4IGEwZDM1OTI5NjEuLjUxZTFkZGRi
MjIgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuaA0KPj4+Pj4+
ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmgNCj4+Pj4+PiBAQCAtMzkzLDYgKzM5Myw5
IEBAIHZvaWQgZWFybHlfaW5pdCh2b2lkKTsNCj4+Pj4+PiDCoCB2b2lkIG1vdW50XzlwZnMo
dm9pZCk7DQo+Pj4+Pj4gwqAgI2VuZGlmDQo+Pj4+Pj4gK2NvbnN0IGNoYXIgKnhlbnN0b3Jl
X3J1bmRpcih2b2lkKTsNCj4+Pj4+PiArY2hhciAqYWJzb2x1dGVfZmlsZW5hbWUoY29uc3Qg
dm9pZCAqY3R4LCBjb25zdCBjaGFyICpmaWxlbmFtZSk7DQo+Pj4+Pj4gKw0KPj4+Pj4+IMKg
IC8qIFdyaXRlIG91dCB0aGUgcGlkZmlsZSAqLw0KPj4+Pj4+IMKgIHZvaWQgd3JpdGVfcGlk
ZmlsZShjb25zdCBjaGFyICpwaWRmaWxlKTsNCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
eGVuc3RvcmVkL2x1X2RhZW1vbi5jIGIvdG9vbHMveGVuc3RvcmVkL2x1X2RhZW1vbi5jDQo+
Pj4+Pj4gaW5kZXggNzFiY2FiYWRkMy4uNjM1MTExMWFiMCAxMDA2NDQNCj4+Pj4+PiAtLS0g
YS90b29scy94ZW5zdG9yZWQvbHVfZGFlbW9uLmMNCj4+Pj4+PiArKysgYi90b29scy94ZW5z
dG9yZWQvbHVfZGFlbW9uLmMNCj4+Pj4+PiBAQCAtMjQsNyArMjQsNyBAQCB2b2lkIGx1X2dl
dF9kdW1wX3N0YXRlKHN0cnVjdCBsdV9kdW1wX3N0YXRlICpzdGF0ZSkNCj4+Pj4+PiDCoMKg
wqDCoMKgIHN0YXRlLT5zaXplID0gMDsNCj4+Pj4+PiDCoMKgwqDCoMKgIHN0YXRlLT5maWxl
bmFtZSA9IHRhbGxvY19hc3ByaW50ZihOVUxMLCAiJXMvc3RhdGVfZHVtcCIsDQo+Pj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW5zdG9yZV9k
YWVtb25fcnVuZGlyKCkpOw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVuc3RvcmVfcnVuZGlyKCkpOw0KPj4+Pj4NCj4+Pj4+IC4uLiBj
YWxsIGFuZCAuLi4NCj4+Pj4+DQo+Pj4+Pj4gwqDCoMKgwqDCoCBpZiAoIXN0YXRlLT5maWxl
bmFtZSkNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYmFyZigiQWxsb2NhdGlvbiBmYWls
dXJlIik7DQo+Pj4+Pj4gQEAgLTY1LDcgKzY1LDcgQEAgRklMRSAqbHVfZHVtcF9vcGVuKGNv
bnN0IHZvaWQgKmN0eCkNCj4+Pj4+PiDCoMKgwqDCoMKgIGludCBmZDsNCj4+Pj4+PiDCoMKg
wqDCoMKgIGZpbGVuYW1lID0gdGFsbG9jX2FzcHJpbnRmKGN0eCwgIiVzL3N0YXRlX2R1bXAi
LA0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuc3Rv
cmVfZGFlbW9uX3J1bmRpcigpKTsNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHhlbnN0b3JlX3J1bmRpcigpKTsNCj4+Pj4+DQo+Pj4+PiAuLi4gdGhp
cyBvbmUgY291bGQgYmUgcmVwbGFjZWQgd2l0aCBhYnNvbHV0ZV9maWxlbmFtZSgpLg0KPj4+
Pg0KPj4+PiBObywgSSBkb24ndCB0aGluayB0aGlzIGlzIGEgZ29vZCBpZGVhLg0KPj4+Pg0K
Pj4+PiBJIGRvbid0IHdhbnQgdGhlIGRhZW1vbiB0byBzdG9yZSB0cmFjZSBmaWxlcyBzcGVj
aWZpZWQgYXMgcmVsYXRpdmUgZmlsZXMNCj4+Pj4gdG8gYmUgc3RvcmVkIGluIC92YXIvcnVu
L3hlbiwgd2hpbGUgSSB3YW50IGFsbCBmaWxlcyBvZiB0aGUgc3R1YmRvbSB0byBiZQ0KPj4+
PiBzdG9yZWQgdW5kZXIgL3Zhci9saWIveGVuLg0KPj4+DQo+Pj4gV2h5PyBUaGlzIGlzIGEg
Yml0IG9kZCB0byBoYXZlIGEgZGlmZmVyZW50IGJlaGF2aW9yIGJldHdlZW4gc3R1YmRvbSBh
bmQgDQo+Pj4gZGFlbW9uLiBJdCB3b3VsZCBiZSBtdWNoIGVhc2llciBmb3IgdGhlIHVzZXIg
aWYgdGhleSBrbmV3IGFsbCB0aGUgZmlsZXMgd291bGQgDQo+Pj4gYmUgYXQgdGhlIHNhbWUg
cGxhY2UgcmVnYXJkbGVzcyB0aGUgdmVyc2lvbiB1c2VkLg0KPj4NCj4+IFRoZSBtYWluIGRp
ZmZlcmVuY2UgaXMgdGhhdCBzdHViZG9tIGhhcyBhY2Nlc3MgdG8gb25seSBfb25lXyBkaXJl
Y3RvcnkgaW4gZG9tMC4NCj4gDQo+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIGV4cGxhaW4gd2h5
IHdlIGNhbiBvbmx5IGdpdmUgYWNjZXNzIHRvIGEgc2luZ2xlIGRpcmVjdG9yeT8gDQo+IElz
IHRoaXMgYmVjYXVzZSBvZiB0aGUgOXBmcyBwcm90b2NvbD8NCg0KWWVzLiBJIGNhbiBtb3Vu
dCBhIHNwZWNpZmljIGRvbTAgZGlyZWN0b3J5IGluIHRoZSBndWVzdC4NCg0KPiANCj4+IEkg
L2NvdWxkLyBnaXZlIGl0IGFjY2VzcyB0byAiLyIsIGJ1dCBkbyB3ZSByZWFsbHkgd2FudCB0
aGF0Pw0KPiANCj4gSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGdpdmUgYWNjZXNzIHRvICIv
Ii4NCj4gDQo+Pg0KPj4gV2UgY2FuJ3QgZ2V0IHJpZCBvZiB0aGUgL3Zhci9ydW4veGVuIGFj
Y2VzcyBpbiB4ZW5zdG9yZWQsIGFzIGl0IGlzIHVzZWQgZm9yDQo+PiBsaXZlIHVwZGF0ZSwg
c28gdGhlIG9sZCBhbmQgdGhlIG5ldyB4ZW5zdG9yZWQgbmVlZCB0byBhZ3JlZSBvbiB0aGUg
bG9jYXRpb24gb2YNCj4+IHRoZSBzdGF0ZSBmaWxlLg0KPiANCj4gV2VsbCwgWGVuc3RvcmVk
IExpdmUtVXBkYXRlIGlzIHRlY2huaWNhbGx5IGEgdGVjaCBwcmV2aWV3IGZlYXR1cmUuIFNv
IHdlICpjb3VsZCogDQo+IGJyZWFrIGl0IGFuZCBhbGxvdyB0aGUgc3RhdGUgZmlsZSB0byBi
ZSBzcGVjaWZpZWQgb24gdGhlIGNvbW1hbmQgbGluZS4NCj4gDQo+IEFueXdheSwgSSBhbSBv
ayBpZiB5b3Ugd2FudCB0aGVtIHRvIGhhdmUgdGhlIGxpdmUtdXBkYXRlIHN0YXRlIGluIGEg
c2VwYXJhdGUgDQo+IGhvd2V2ZXIuLi4NCj4gDQo+IA0KPj4gQW5kIHdlIGNhbid0IGRyb3Ag
dGhlIHBvc3NpYmlsaXR5IG9mIHNwZWNpZnlpbmcgYWJzb2x1dGUgcGF0aHMNCj4+IGZvciBl
LmcuIHRyYWNlIGZpbGVzLCBhcyB0aG9zZSBtaWdodCBiZSBpbiB1c2UgYnkgdXNlcnMgYWxy
ZWFkeS4NCj4+DQo+Pj4gQWxzbywgcmVnYXJkaW5nIHRoZSBiYWNrZ3JvdW5kIG9mIG15IHF1
ZXN0aW9uLiBZb3UgYXJlIGludHJvZHVjaW5nIGEgZnVuY3Rpb24gDQo+Pj4gY2FsbCBhYnNv
bHV0ZV9maWxlbmFtZSgpLiBGcm9tIHRoZSBuYW1lLCB0aGVyZSBpcyBub3RoaW5nIGluZGlj
YXRpbmcgdGhhdCANCj4+PiB0aGlzIHNob3VsZCBvbmx5IGJlIHVzZWQgZm9yIHRyYWNlIGZp
bGVzLiBJZiB0aGlzIGlzIG9ubHkgaW5kZW50ZWQgZm9yIA0KPj4+IHRyYWNlZmlsZSwgdGhl
biBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIHJlbmFtZWQgdG8gc29tZXRoaW5nIGxpa2UgDQo+
Pj4gYWJzb2x1dGVfdHJhY2VmaWxlKC4uLikuDQo+Pg0KPj4gQWZ0ZXIgdGhlIGxhc3QgcGF0
Y2ggb2YgdGhpcyBzZXJpZXMgInhlbnN0b3JlLWNvbnRyb2wgbWVtcmVwb3J0IDxmaWxlPiIg
d2lsbCB1c2UNCj4+IGl0LCB0b28uDQo+IA0KPiAuLi4gdGhpcyBkb2Vzbid0IGNoYW5nZSBt
eSBwb2ludCBoZXJlLiBUaGUgZnVuY3Rpb24gbmFtZSBkb2Vzbid0ICp0ZWxsKiBtZSB3aHkg
DQo+IGl0IGNhbid0IGJlIHVzZWQgZm9yIGxpdmUtdXBkYXRlIGZpbGVzLg0KPiANCj4gSWYg
dGhpcyBjYW4ndCBiZSBjbGFyaWZpZWQgaW4gdGhlIG5hbWUsIHRoZW4gaXQgc2hvdWxkIGJl
IGNsYXJpZmllZCBpbiBhIA0KPiBjb21tZW50LiBNYXliZSBvbmUgdG9wIG9mIHRoZSBMaXZl
LVVwZGF0ZSBjb2RlLg0KDQpJIHRoaW5rIGEgY29tbWVudCBiZWZvcmUgdGhlIGFic29sdXRl
X2ZpbGVuYW1lKCkgZnVuY3Rpb24gd291bGQgYmUgdGhlIGJlc3QNCmZpdC4NCg0KDQpKdWVy
Z2VuDQo=
--------------0t8MhRR4yn3PAGB0o6h46WU6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0t8MhRR4yn3PAGB0o6h46WU6--

--------------ukmo90m6dgRB3fMahOoe00bF--

--------------Erl0GRqFPYieUOy2dZv9qPQ9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVUYcEFAwAAAAAACgkQsN6d1ii/Ey9E
NQgAiVBWfEX0NqOx/ogioJqT6CFUMrA9kh3nEmhMUi9aRbplFs1kRR9Vv9IER6oqarsEQ2McnwB0
La/9cc9jV3bIgApIcDhV8ShGvryOyp+ocJs7bmrhspJpTT7CjBv3YkW0CccAsUFDFB3kbiSA2oom
BtsWppuM3B6Uq9WwuxfEuCSPeM7vHTTaaMIXE7Lm5X4O+Di3DxT/e/rnuCXUVcDzcwSTn8j9udPE
VRjLBD8SOfmcLsVcrPbPwGzXwYNBAzw4bSO4TWWmn6GPvMnAX+HKDStNP16mhOnmDoURLvZi3YuL
az1xo94oEpc2WX9LagDzWvJManRBrzRHIMfq8BkojQ==
=wRZ1
-----END PGP SIGNATURE-----

--------------Erl0GRqFPYieUOy2dZv9qPQ9--

