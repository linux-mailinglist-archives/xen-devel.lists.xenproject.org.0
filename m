Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59227EAD01
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632277.986519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2phI-0000bu-I5; Tue, 14 Nov 2023 09:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632277.986519; Tue, 14 Nov 2023 09:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2phI-0000Ze-F8; Tue, 14 Nov 2023 09:27:04 +0000
Received: by outflank-mailman (input) for mailman id 632277;
 Tue, 14 Nov 2023 09:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2phH-0000YF-Sp
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:27:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f76b828e-82cf-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 10:27:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5068D21898;
 Tue, 14 Nov 2023 09:26:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1917D13416;
 Tue, 14 Nov 2023 09:26:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o30VBGE9U2UVEAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 09:26:57 +0000
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
X-Inumbo-ID: f76b828e-82cf-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699954017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fESEarvq/ZotGomgDSqLljUxtSwEMQa0p34ZO1VdIyo=;
	b=S7FN1RpfZbWh2kw5hqPTQK+2qlNKZdfZr5IEH8tFlHXzsdMEsvDoDPVzo+bLJzxgvz7WIS
	KYUHG8uOQkjjydETC+iqN23J62HpLYSNh10+XZqHwsbuICbwEKonQy1ZFSKYSt/ziYZ5DZ
	Z5YghSjRulJ9qe2H1LbddvpA+vqctAc=
Message-ID: <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
Date: Tue, 14 Nov 2023 10:26:56 +0100
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
In-Reply-To: <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O2mVEr1GPjzi7wHuphwM0hxT"
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
--------------O2mVEr1GPjzi7wHuphwM0hxT
Content-Type: multipart/mixed; boundary="------------S2jAiSRMSCht9HdtL8vgjA8T";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
 <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
 <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>
In-Reply-To: <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org>

--------------S2jAiSRMSCht9HdtL8vgjA8T
Content-Type: multipart/mixed; boundary="------------o7Dlm7ZfGI5Fl2i5Ctl4boGx"

--------------o7Dlm7ZfGI5Fl2i5Ctl4boGx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjMgMTA6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE0LzExLzIwMjMgMDY6NDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxMy4xMS4yMyAyMzoyNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxMC8xMS8yMDIzIDE2OjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBBZGQgc29tZSBoZWxwZXJzIGZvciBoYW5kbGluZyBmaWxlbmFtZXMgd2hpY2ggbWln
aHQgbmVlZCBkaWZmZXJlbnQNCj4+Pj4gaW1wbGVtZW50YXRpb25zIGJldHdlZW4gc3R1YmRv
bSBhbmQgZGFlbW9uIGVudmlyb25tZW50czoNCj4+Pj4NCj4+Pj4gLSBleHBhbnNpb24gb2Yg
cmVsYXRpdmUgZmlsZW5hbWVzICh0aG9zZSBhcmUgbm90IHJlYWxseSBkZWZpbmVkIHRvZGF5
LA0KPj4+PiDCoMKgIGp1c3QgZXhwYW5kIHRoZW0gdG8gYmUgcmVsYXRpdmUgdG8gL3Zhci9s
aWIveGVuL3hlbnN0b3JlKQ0KPj4+PiAtIGV4cGFuc2lvbiBvZiB4ZW5zdG9yZV9kYWVtb25f
cnVuZGlyKCkgKHVzZWQgZS5nLiBmb3Igc2F2aW5nIHRoZSBzdGF0ZQ0KPj4+PiDCoMKgIGZp
bGUgaW4gY2FzZSBvZiBsaXZlIHVwZGF0ZSAtIG5lZWRzIHRvIGJlIHVuY2hhbmdlZCBpbiB0
aGUgZGFlbW9uDQo+Pj4+IMKgwqAgY2FzZSwgYnV0IHNob3VsZCByZXN1bHQgaW4gL3Zhci9s
aWIveGVuL3hlbnN0b3JlIGZvciBzdHViZG9tKQ0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBK
YXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoCB0
b29scy94ZW5zdG9yZWQvY29yZS5jwqDCoMKgwqDCoCB8IDkgKysrKysrKystDQo+Pj4+IMKg
IHRvb2xzL3hlbnN0b3JlZC9jb3JlLmjCoMKgwqDCoMKgIHwgMyArKysNCj4+Pj4gwqAgdG9v
bHMveGVuc3RvcmVkL2x1X2RhZW1vbi5jIHwgNCArKy0tDQo+Pj4+IMKgIHRvb2xzL3hlbnN0
b3JlZC9taW5pb3MuY8KgwqDCoCB8IDUgKysrKysNCj4+Pj4gwqAgdG9vbHMveGVuc3RvcmVk
L3Bvc2l4LmPCoMKgwqDCoCB8IDUgKysrKysNCj4+Pj4gwqAgNSBmaWxlcyBjaGFuZ2VkLCAy
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+
Pj4gaW5kZXggNGE5ZDg3NGYxNy4uNzdiZWZkMjRjOSAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9v
bHMveGVuc3RvcmVkL2NvcmUuYw0KPj4+PiArKysgYi90b29scy94ZW5zdG9yZWQvY29yZS5j
DQo+Pj4+IEBAIC0xNTgsNiArMTU4LDEzIEBAIHZvaWQgdHJhY2VfZGVzdHJveShjb25zdCB2
b2lkICpkYXRhLCBjb25zdCBjaGFyICp0eXBlKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
dHJhY2UoIm9iajogREVTVFJPWSAlcyAlcFxuIiwgdHlwZSwgZGF0YSk7DQo+Pj4+IMKgIH0N
Cj4+Pj4gK2NoYXIgKmFic29sdXRlX2ZpbGVuYW1lKGNvbnN0IHZvaWQgKmN0eCwgY29uc3Qg
Y2hhciAqZmlsZW5hbWUpDQo+Pj4NCj4+PiBDYW4gdGhlIHJldHVybiBiZSBjb25zdD8NCj4+
DQo+PiBJJ2xsIGhhdmUgYSBsb29rLg0KPj4NCj4+Pg0KPj4+PiArew0KPj4+PiArwqDCoMKg
IGlmIChmaWxlbmFtZVswXSAhPSAnLycpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
dGFsbG9jX2FzcHJpbnRmKGN0eCwgWEVOU1RPUkVfTElCX0RJUiAiLyVzIiwgZmlsZW5hbWUp
Ow0KPj4+DQo+Pj4gTG9va2luZyBhdCB0aGUgcmVzdCBvZiBwYXRjaCwgeW91IHdpbGwgYmUg
dXNpbmcgeGVuc3RvcmVfcnVuZGlyKCkuIEkgd29uZGVyIA0KPj4+IHdoZXRoZXIgaXQgd291
bGQgbm90IGJlIGJldHRlciB0byBzd2l0Y2ggdG8geGVuc3RvcmVfcnVuZGlyKCkgc28uLi4N
Cj4+Pg0KPj4+PiArwqDCoMKgIHJldHVybiB0YWxsb2Nfc3RyZHVwKGN0eCwgZmlsZW5hbWUp
Ow0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+IMKgIC8qKg0KPj4+PiDCoMKgICogU2lnbmFsIGhh
bmRsZXIgZm9yIFNJR0hVUCwgd2hpY2ggcmVxdWVzdHMgdGhhdCB0aGUgdHJhY2UgbG9nIGlz
IHJlb3BlbmVkDQo+Pj4+IMKgwqAgKiAoaW4gdGhlIG1haW4gbG9vcCkuwqAgQSBzaW5nbGUg
Ynl0ZSBpcyB3cml0dGVuIHRvIHJlb3Blbl9sb2dfcGlwZSwgdG8gDQo+Pj4+IGF3YWtlbg0K
Pj4+PiBAQCAtMjk4Myw3ICsyOTkwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkNCj4+Pj4gwqDCoMKgwqDCoCBzaWduYWwoU0lHSFVQLCB0cmlnZ2VyX3Jlb3Blbl9s
b2cpOw0KPj4+PiDCoMKgwqDCoMKgIGlmICh0cmFjZWZpbGUpDQo+Pj4+IC3CoMKgwqDCoMKg
wqDCoCB0cmFjZWZpbGUgPSB0YWxsb2Nfc3RyZHVwKE5VTEwsIHRyYWNlZmlsZSk7DQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB0cmFjZWZpbGUgPSBhYnNvbHV0ZV9maWxlbmFtZShOVUxMLCB0
cmFjZWZpbGUpOw0KPj4+PiDCoCAjaWZuZGVmIE5PX0xJVkVfVVBEQVRFDQo+Pj4+IMKgwqDC
oMKgwqAgLyogUmVhZCBzdGF0ZSBpbiBjYXNlIG9mIGxpdmUgdXBkYXRlLiAqLw0KPj4+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuaCBiL3Rvb2xzL3hlbnN0b3JlZC9j
b3JlLmgNCj4+Pj4gaW5kZXggYTBkMzU5Mjk2MS4uNTFlMWRkZGIyMiAxMDA2NDQNCj4+Pj4g
LS0tIGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuaA0KPj4+PiArKysgYi90b29scy94ZW5zdG9y
ZWQvY29yZS5oDQo+Pj4+IEBAIC0zOTMsNiArMzkzLDkgQEAgdm9pZCBlYXJseV9pbml0KHZv
aWQpOw0KPj4+PiDCoCB2b2lkIG1vdW50XzlwZnModm9pZCk7DQo+Pj4+IMKgICNlbmRpZg0K
Pj4+PiArY29uc3QgY2hhciAqeGVuc3RvcmVfcnVuZGlyKHZvaWQpOw0KPj4+PiArY2hhciAq
YWJzb2x1dGVfZmlsZW5hbWUoY29uc3Qgdm9pZCAqY3R4LCBjb25zdCBjaGFyICpmaWxlbmFt
ZSk7DQo+Pj4+ICsNCj4+Pj4gwqAgLyogV3JpdGUgb3V0IHRoZSBwaWRmaWxlICovDQo+Pj4+
IMKgIHZvaWQgd3JpdGVfcGlkZmlsZShjb25zdCBjaGFyICpwaWRmaWxlKTsNCj4+Pj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9sdV9kYWVtb24uYyBiL3Rvb2xzL3hlbnN0b3Jl
ZC9sdV9kYWVtb24uYw0KPj4+PiBpbmRleCA3MWJjYWJhZGQzLi42MzUxMTExYWIwIDEwMDY0
NA0KPj4+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvbHVfZGFlbW9uLmMNCj4+Pj4gKysrIGIv
dG9vbHMveGVuc3RvcmVkL2x1X2RhZW1vbi5jDQo+Pj4+IEBAIC0yNCw3ICsyNCw3IEBAIHZv
aWQgbHVfZ2V0X2R1bXBfc3RhdGUoc3RydWN0IGx1X2R1bXBfc3RhdGUgKnN0YXRlKQ0KPj4+
PiDCoMKgwqDCoMKgIHN0YXRlLT5zaXplID0gMDsNCj4+Pj4gwqDCoMKgwqDCoCBzdGF0ZS0+
ZmlsZW5hbWUgPSB0YWxsb2NfYXNwcmludGYoTlVMTCwgIiVzL3N0YXRlX2R1bXAiLA0KPj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlbnN0b3Jl
X2RhZW1vbl9ydW5kaXIoKSk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVuc3RvcmVfcnVuZGlyKCkpOw0KPj4+DQo+Pj4gLi4uIGNhbGwg
YW5kIC4uLg0KPj4+DQo+Pj4+IMKgwqDCoMKgwqAgaWYgKCFzdGF0ZS0+ZmlsZW5hbWUpDQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBiYXJmKCJBbGxvY2F0aW9uIGZhaWx1cmUiKTsNCj4+
Pj4gQEAgLTY1LDcgKzY1LDcgQEAgRklMRSAqbHVfZHVtcF9vcGVuKGNvbnN0IHZvaWQgKmN0
eCkNCj4+Pj4gwqDCoMKgwqDCoCBpbnQgZmQ7DQo+Pj4+IMKgwqDCoMKgwqAgZmlsZW5hbWUg
PSB0YWxsb2NfYXNwcmludGYoY3R4LCAiJXMvc3RhdGVfZHVtcCIsDQo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuc3RvcmVfZGFlbW9uX3J1bmRpcigp
KTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW5zdG9y
ZV9ydW5kaXIoKSk7DQo+Pj4NCj4+PiAuLi4gdGhpcyBvbmUgY291bGQgYmUgcmVwbGFjZWQg
d2l0aCBhYnNvbHV0ZV9maWxlbmFtZSgpLg0KPj4NCj4+IE5vLCBJIGRvbid0IHRoaW5rIHRo
aXMgaXMgYSBnb29kIGlkZWEuDQo+Pg0KPj4gSSBkb24ndCB3YW50IHRoZSBkYWVtb24gdG8g
c3RvcmUgdHJhY2UgZmlsZXMgc3BlY2lmaWVkIGFzIHJlbGF0aXZlIGZpbGVzDQo+PiB0byBi
ZSBzdG9yZWQgaW4gL3Zhci9ydW4veGVuLCB3aGlsZSBJIHdhbnQgYWxsIGZpbGVzIG9mIHRo
ZSBzdHViZG9tIHRvIGJlDQo+PiBzdG9yZWQgdW5kZXIgL3Zhci9saWIveGVuLg0KPiANCj4g
V2h5PyBUaGlzIGlzIGEgYml0IG9kZCB0byBoYXZlIGEgZGlmZmVyZW50IGJlaGF2aW9yIGJl
dHdlZW4gc3R1YmRvbSBhbmQgZGFlbW9uLiANCj4gSXQgd291bGQgYmUgbXVjaCBlYXNpZXIg
Zm9yIHRoZSB1c2VyIGlmIHRoZXkga25ldyBhbGwgdGhlIGZpbGVzIHdvdWxkIGJlIGF0IHRo
ZSANCj4gc2FtZSBwbGFjZSByZWdhcmRsZXNzIHRoZSB2ZXJzaW9uIHVzZWQuDQoNClRoZSBt
YWluIGRpZmZlcmVuY2UgaXMgdGhhdCBzdHViZG9tIGhhcyBhY2Nlc3MgdG8gb25seSBfb25l
XyBkaXJlY3RvcnkgaW4gZG9tMC4NCkkgL2NvdWxkLyBnaXZlIGl0IGFjY2VzcyB0byAiLyIs
IGJ1dCBkbyB3ZSByZWFsbHkgd2FudCB0aGF0Pw0KDQpXZSBjYW4ndCBnZXQgcmlkIG9mIHRo
ZSAvdmFyL3J1bi94ZW4gYWNjZXNzIGluIHhlbnN0b3JlZCwgYXMgaXQgaXMgdXNlZCBmb3IN
CmxpdmUgdXBkYXRlLCBzbyB0aGUgb2xkIGFuZCB0aGUgbmV3IHhlbnN0b3JlZCBuZWVkIHRv
IGFncmVlIG9uIHRoZSBsb2NhdGlvbiBvZg0KdGhlIHN0YXRlIGZpbGUuIEFuZCB3ZSBjYW4n
dCBkcm9wIHRoZSBwb3NzaWJpbGl0eSBvZiBzcGVjaWZ5aW5nIGFic29sdXRlIHBhdGhzDQpm
b3IgZS5nLiB0cmFjZSBmaWxlcywgYXMgdGhvc2UgbWlnaHQgYmUgaW4gdXNlIGJ5IHVzZXJz
IGFscmVhZHkuDQoNCj4gQWxzbywgcmVnYXJkaW5nIHRoZSBiYWNrZ3JvdW5kIG9mIG15IHF1
ZXN0aW9uLiBZb3UgYXJlIGludHJvZHVjaW5nIGEgZnVuY3Rpb24gDQo+IGNhbGwgYWJzb2x1
dGVfZmlsZW5hbWUoKS4gRnJvbSB0aGUgbmFtZSwgdGhlcmUgaXMgbm90aGluZyBpbmRpY2F0
aW5nIHRoYXQgdGhpcyANCj4gc2hvdWxkIG9ubHkgYmUgdXNlZCBmb3IgdHJhY2UgZmlsZXMu
IElmIHRoaXMgaXMgb25seSBpbmRlbnRlZCBmb3IgdHJhY2VmaWxlLCANCj4gdGhlbiBJIHRo
aW5rIHRoaXMgc2hvdWxkIGJlIHJlbmFtZWQgdG8gc29tZXRoaW5nIGxpa2UgYWJzb2x1dGVf
dHJhY2VmaWxlKC4uLikuDQoNCkFmdGVyIHRoZSBsYXN0IHBhdGNoIG9mIHRoaXMgc2VyaWVz
ICJ4ZW5zdG9yZS1jb250cm9sIG1lbXJlcG9ydCA8ZmlsZT4iIHdpbGwgdXNlDQppdCwgdG9v
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------o7Dlm7ZfGI5Fl2i5Ctl4boGx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------o7Dlm7ZfGI5Fl2i5Ctl4boGx--

--------------S2jAiSRMSCht9HdtL8vgjA8T--

--------------O2mVEr1GPjzi7wHuphwM0hxT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTPWAFAwAAAAAACgkQsN6d1ii/Ey/N
YAf+LE8HEdXH+w/Aa5o9mo3akgK473CB7dIAtRfjf8fPBWPhLn6+8BHo8vwG/67SeaK/ISa+I0pj
F7h5grFNbYito7aUqG2qvhS9GaJdOccnDelBz3iyWcvfnZQJ9FtybzT30QElCdrlTtfHRdZN8qED
yCf/P/JYkWXKX0MeczZJSAIPwRVYe1tBKZOmKUr76Zbn4zLlV3z16/vEuQSilz6XZE3c1ABN1pAP
fIH3UFgPD4Tlne0i3BnG1WjXzqfQ8YUWWuM/eKcLSPJiKHBQMdjsXeoHkI2bvaiZOiT16cpTq8xr
vtBrfg+W14QKywUQS5g/nYTvs1uiELRN3x5QXS8Zyg==
=SQ7W
-----END PGP SIGNATURE-----

--------------O2mVEr1GPjzi7wHuphwM0hxT--

