Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9357C7DB9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 08:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616266.958136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrBiI-0005Zb-HK; Fri, 13 Oct 2023 06:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616266.958136; Fri, 13 Oct 2023 06:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrBiI-0005Wp-DK; Fri, 13 Oct 2023 06:31:58 +0000
Received: by outflank-mailman (input) for mailman id 616266;
 Fri, 13 Oct 2023 06:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrBiG-0005Wj-JU
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 06:31:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32c43906-6992-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 08:31:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD04E1FD80;
 Fri, 13 Oct 2023 06:31:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F754138EF;
 Fri, 13 Oct 2023 06:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gFAtEVjkKGVFOwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 06:31:52 +0000
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
X-Inumbo-ID: 32c43906-6992-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697178712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qvZQFgoKrbb5VgyvobfwQt4FBUVtHWSsQXGeazGg8f0=;
	b=R1xrR5TKLPpzltXKa63bfenEEmrtLgu8lsX5MufajH0yhqoi/fy0ywr1dohM+LqPIbQM2g
	ywsh90U6e/+Z1OmRSwq+Wqpat9BJ+37RfDkBzTgPZvx4OtKLdX/9Pq3jAlXr9ndb1OaPwN
	i+0qLTccK1S/owThdhxZfAL+OlxL4lw=
Message-ID: <502c7fb1-eead-4e88-971e-2970fe7264ee@suse.com>
Date: Fri, 13 Oct 2023 08:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
Content-Language: en-US
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
In-Reply-To: <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yGzAdyBAc4LEA8cq5ZbNTSAR"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.99
X-Spamd-Result: default: False [-7.99 / 50.00];
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
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
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
--------------yGzAdyBAc4LEA8cq5ZbNTSAR
Content-Type: multipart/mixed; boundary="------------Z1588f711IEdLoOwc0KvyekV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
Message-ID: <502c7fb1-eead-4e88-971e-2970fe7264ee@suse.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>

--------------Z1588f711IEdLoOwc0KvyekV
Content-Type: multipart/mixed; boundary="------------VKKKo5mFcoUzrrWrqSdPPF70"

--------------VKKKo5mFcoUzrrWrqSdPPF70
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjMgMDA6MzYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gVGh1
LCAxMiBPY3QgMjAyMywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+Pj4gU3RvcCB0aW5rZXJp
bmcgaW4gdGhlIGhvcGUgdGhhdCBpdCBoaWRlcyB0aGUgcHJvYmxlbS4gIFlvdSdyZSBvbmx5
DQo+Pj4+IG1ha2luZyBpdCBoYXJkZXIgdG8gZml4IHByb3Blcmx5Lg0KPj4+DQo+Pj4gTWFr
aW5nIGl0IGhhcmRlciB0byBmaXggcHJvcGVybHkgd291bGQgYmUgYSB2YWxpZCByZWFzb24g
bm90IHRvIGNvbW1pdA0KPj4+IHRoZSAobWF5YmUgcGFydGlhbCkgZml4LiBCdXQgbG9va2lu
ZyBhdCB0aGUgZml4IGFnYWluOg0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0
b3JlZC9kb21haW4uYyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4+IGluZGV4IGE2
Y2QxOTlmZGMuLjljZDY2NzgwMTUgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmVk
L2RvbWFpbi5jDQo+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+Pj4gQEAg
LTk4OSw2ICs5ODksNyBAQCBzdGF0aWMgc3RydWN0IGRvbWFpbiAqaW50cm9kdWNlX2RvbWFp
bihjb25zdCB2b2lkICpjdHgsDQo+Pj4gICAgICAgICAgICAgICAgICB0YWxsb2Nfc3RlYWwo
ZG9tYWluLT5jb25uLCBkb21haW4pOw0KPj4+DQo+Pj4gICAgICAgICAgICAgICAgICBpZiAo
IXJlc3RvcmUpIHsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICBkb21haW5fY29ubl9y
ZXNldChkb21haW4pOw0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBOb3RpZnkg
dGhlIGRvbWFpbiB0aGF0IHhlbnN0b3JlIGlzIGF2YWlsYWJsZSAqLw0KPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnRlcmZhY2UtPmNvbm5lY3Rpb24gPSBYRU5TVE9SRV9DT05O
RUNURUQ7DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHhlbmV2dGNobl9ub3RpZnko
eGNlX2hhbmRsZSwgZG9tYWluLT5wb3J0KTsNCj4+PiBAQCAtMTAzMSw4ICsxMDMyLDYgQEAg
aW50IGRvX2ludHJvZHVjZShjb25zdCB2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9uICpj
b25uLA0KPj4+ICAgICAgICAgIGlmICghZG9tYWluKQ0KPj4+ICAgICAgICAgICAgICAgICAg
cmV0dXJuIGVycm5vOw0KPj4+DQo+Pj4gLSAgICAgICBkb21haW5fY29ubl9yZXNldChkb21h
aW4pOw0KPj4+IC0NCj4+PiAgICAgICAgICBzZW5kX2Fjayhjb25uLCBYU19JTlRST0RVQ0Up
Ow0KPj4+DQo+Pj4gSXQgaXMgYSAxLWxpbmUgbW92ZW1lbnQuIFRleHR1YWxseSBzbWFsbC4g
RWFzeSB0byB1bmRlcnN0YW5kIGFuZCB0bw0KPj4+IHJldmVydC4gSXQgZG9lc24ndCBzZWVt
IHRvIGJlIG1ha2luZyB0aGluZ3MgaGFyZGVyIHRvIGZpeD8gV2UgY291bGQNCj4+PiByZXZl
cnQgaXQgYW55IHRpbWUgaWYgYSBiZXR0ZXIgZml4IGlzIG9mZmVyZWQuDQo+Pj4NCj4+PiBN
YXliZSB3ZSBjb3VsZCBoYXZlIGEgWFhYIG5vdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9y
IGluLWNvZGUNCj4+PiBjb21tZW50Pw0KPj4NCj4+IEl0IG1vdmVzIGEgbGluZSBmcm9tIG9u
ZSBmdW5jdGlvbiAoZG9fZG9tYWluX2ludHJvZHVjZSgpKSBpbnRvIGENCj4+IGNvbXBsZXRl
bHkgZGlmZmVyZW50IGZ1bmN0aW9uIChpbnRyb2R1Y2VfZG9tYWluKCkpLCBuZXN0ZWQgaW5z
aWRlIHR3bw0KPj4gaWYoKSBzdGF0ZW1lbnRzOyB3aXRoIG5vIGFuYWx5c2lzIG9uIGhvdyB0
aGUgY2hhbmdlIHdpbGwgaW1wYWN0DQo+PiB0aGluZ3MuDQo+IA0KPiBJIGFtIG5vdCB0aGUg
b3JpZ2luYWwgYXV0aG9yIG9mIHRoZSBwYXRjaCwgYW5kIEkgYW0gbm90IHRoZSBtYWludGFp
bmVyDQo+IG9mIHRoZSBjb2RlLCBzbyBJIGRvbid0IGZlZWwgSSBoYXZlIHRoZSBxdWFsaWZp
Y2F0aW9ucyB0byBnaXZlIHlvdSB0aGUNCj4gYW5zd2VycyB5b3UgYXJlIHNlZWtpbmcuIEp1
bGllbiBhcyBhdXRob3Igb2YgdGhlIHBhdGNoIGFuZCB4ZW5zdG9yZQ0KPiByZXZpZXdlciBt
aWdodCBiZSBpbiBhIGJldHRlciBwb3NpdGlvbiB0byBhbnN3ZXIuIE9yIEp1ZXJnZW4gYXMg
eGVuc3RvcmUNCj4gbWFpbnRhaW5lci4NCg0KSSBkaWQgYWxyZWFkeSBwcm92aWRlIHNvbWUg
ZmVlZGJhY2sgd2hlbiB0aGUgcGF0Y2ggd2FzIHNlbnQgdGhlIGZpcnN0IHRpbWUNCmluIE1h
eS4NCg0KPiANCj4gIEZyb20gd2hhdCBJIGNhbiBzZWUgdGhlIHBhdGNoIGlzIGNvcnJlY3Qu
DQoNCllvdSByZW1vdmVkIHRoZSBkb20wIHNwZWNpYWwgY2FzaW5nIGFnYWluLCB3aGljaCBJ
IGFza2VkIGZvciB0byBhZGQgYmFjaw0KdGhlbi4gQW5kIEkgc3RpbGwgdGhpbmsgdGhlcmUg
YXJlIG1pc3NpbmcgYmFycmllcnMgKGF0IGxlYXN0IGZvciBBcm0pLg0KDQo+IA0KPiBXZSBh
cmUgcmVtb3ZpbmcgYSBjYWxsIHRvIGRvbWFpbl9jb25uX3Jlc2V0IGluIGRvX2ludHJvZHVj
ZS4NCj4gV2UgYXJlIGFkZGluZyBhIGNhbGwgdG8gZG9tYWluX2Nvbm5fcmVzZXQgaW4gaW50
cm9kdWNlX2RvbWFpbiwgd2hpY2ggaXMNCj4gY2FsbGVkIHJpZ2h0IGJlZm9yZSBpbiBpbnRy
b2R1Y2VfZG9tYWluLiBZZXMgdGhlcmUgYXJlIDIgaWYgc3RhdGVtZW50cw0KPiBidXQgdGhl
IGRvbWFpbl9jb25uX3Jlc2V0IGlzIGFkZGVkIGluIHRoZSByaWdodCBsb2NhdGlvbjogdGhl
DQo+IG5vbi1hbHJlYWR5LWludHJvZHVjZWQgbm9uLXJlc3RvcmUgY29kZSBwYXRoLg0KPiAN
Cj4gDQo+PiBBcmUgdGhlcmUgYW55IHBhdGhzIHRocm91Z2ggZG9fZG9tYWluX2ludHJvZHVj
ZSgpIHRoYXQgbm93ICp3b24ndCogZ2V0DQo+PiBhIGRvbWFpbl9jb25uX3Jlc2V0KCkgY2Fs
bD8gIElzIHRoYXQgT0s/DQo+IA0KPiBZZXMsIHRoZSBhbHJlYWR5LWludHJvZHVjZWQgYW5k
IHRoZSByZXN0b3JlIGNvZGUgcGF0aHMuIFRoZSBvcGVyYXRpb25zIGluDQo+IHRoZSBhbHJl
YWR5LWludHJvZHVjZWQgb3IgdGhlIHJlc3RvcmUgY29kZSBwYXRocyBzZWVtIHNpbXBsZSBl
bm91Z2ggbm90DQo+IHRvIHJlcXVpcmUgYSBkb21haW5fY29ubl9yZXNldC4gSnVsaWVuIGFu
ZCBKdWVyZ2VuIHNob3VsZCBjb25maXJtLg0KPiANCj4gDQo+PiBJcyBpbnRyb2R1Y2VfZG9t
YWluKCkgY2FsbGVkIGluIG90aGVyIHBsYWNlcz8gIFdpbGwgdGhvc2UgcGxhY2VzIG5vdw0K
Pj4gZ2V0IGV4dHJhIGRvbWFpbl9jb25uX3Jlc2V0KCkgY2FsbHMgdGhleSB3ZXJlbid0IGV4
cGVjdGluZz8gIElzIHRoYXQNCj4+IE9LPw0KPiANCj4gaW50cm9kdWNlX2RvbWFpbiBpcyBj
YWxsZWQgYnkgZG9tMF9pbml0LCBidXQgSSBhbSBndWVzc2luZyB0aGF0IGRvbTAgaXMNCj4g
YWxyZWFkeS1pbnRyb2R1Y2VkIHNvIGl0IHdvdWxkbid0IGdldCBhbiBleHRyYSBkb21haW5f
Y29ubl9yZXNldC4gSnVsaWVuDQo+IGFuZCBKdXJnZW4gc2hvdWxkIGNvbmZpcm0uDQoNCkkg
ZG9uJ3QgdGhpbmsgdGhpcyBpcyBjb3JyZWN0LiBkb20wIHdpbGwgb25seSBiZSBpbnRyb2R1
Y2VkIHZpYSBkb20wX2luaXQoKS4NCg0KDQpKdWVyZ2VuDQo=
--------------VKKKo5mFcoUzrrWrqSdPPF70
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------VKKKo5mFcoUzrrWrqSdPPF70--

--------------Z1588f711IEdLoOwc0KvyekV--

--------------yGzAdyBAc4LEA8cq5ZbNTSAR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUo5FcFAwAAAAAACgkQsN6d1ii/Ey+G
agf+K/mLGHpWiANGnO0yv5m2tYVV4WcVdhZtLaKBSm/CJ+w8lCgGz07Gcu/xP8gEugT/dqX9jwVL
WevfaS9x3+/RalSJZENGeBPd98BErkz+Eb/+tyAmELs6WQAx7UBpteLl9fIoxLJLqwtJP5TsIxhM
R9gXV6namZprRVu2ny+mWOU3roZbUYZ99cOGnXbS599nfVfyIiw8i1QfOKpEGSnf/SnlMKbSlZmi
TrU+sLLGB1OOyMQDQJaZwqP+6+RBDKagrYch7lTzaurpiUfJ+SQnKoK6YUqYUNotjd1yV86xD36j
KMOl+MeZ4+oFOzUaTf70DsJQYmM6Zz9NLqmJNZ1FTA==
=3+Yh
-----END PGP SIGNATURE-----

--------------yGzAdyBAc4LEA8cq5ZbNTSAR--

