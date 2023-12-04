Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5043802FEC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646768.1009304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5yu-0004XG-1U; Mon, 04 Dec 2023 10:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646768.1009304; Mon, 04 Dec 2023 10:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5yt-0004Tc-Uz; Mon, 04 Dec 2023 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 646768;
 Mon, 04 Dec 2023 10:15:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rA5ys-0004Ss-Mv
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:15:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 015787af-928e-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 11:15:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 728211F8A6;
 Mon,  4 Dec 2023 10:15:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D035139AA;
 Mon,  4 Dec 2023 10:15:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SCPPEK2mbWV/UAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 10:15:09 +0000
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
X-Inumbo-ID: 015787af-928e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701684909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HpEIUACtZSPLVODOo4JLcfN87Fff3k6rA6d+5gVjnt8=;
	b=e9GdNsGuCJjxroTwyURegXHt6F09ijlUUHslbZQVGOEQ89OuvIyzTdr6DsZ2Mwq8xQaO4d
	f3D7ca3WkjuhRNVhlYbP1h1bURlgEiHdtGyRm6V6vvHjJYXQUG/xjBTfTOkq7/+VWsHX57
	iISspmjNwToCs+ytjc34k4hSCbFcUP8=
Message-ID: <4e78257a-5411-4853-b70c-c7ea0de4fe79@suse.com>
Date: Mon, 4 Dec 2023 11:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Moving domain from credit2 to credit cpupool crash xen
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?UmVuw6kgV2ludGhlciBIw7hqZ2Fh?=
 =?UTF-8?Q?rd?= <renewin@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dnfWU_V9cXmbF4wNEEzLue_FUJefwMiic1J0gTnWryyEIiB3hV-h3zC_CjBeBJkcQS8ZMA5ZdkTbJBK2hf_1a1oY3GJvteqG8NqEduCjCrY=@proton.me>
 <d42fedb6-ac96-4404-8478-66783118dbd1@suse.com>
 <fc2f93f3-7a65-44b3-a25a-9383fe95b16b@suse.com>
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
In-Reply-To: <fc2f93f3-7a65-44b3-a25a-9383fe95b16b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Wpw4ZPruGFks68kdaDvRcD8s"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.99
X-Spamd-Result: default: False [-2.99 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Wpw4ZPruGFks68kdaDvRcD8s
Content-Type: multipart/mixed; boundary="------------k0iq6QkQteaoV3Gf4zmiFBPC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?UmVuw6kgV2ludGhlciBIw7hqZ2Fh?=
 =?UTF-8?Q?rd?= <renewin@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4e78257a-5411-4853-b70c-c7ea0de4fe79@suse.com>
Subject: Re: Moving domain from credit2 to credit cpupool crash xen
References: <dnfWU_V9cXmbF4wNEEzLue_FUJefwMiic1J0gTnWryyEIiB3hV-h3zC_CjBeBJkcQS8ZMA5ZdkTbJBK2hf_1a1oY3GJvteqG8NqEduCjCrY=@proton.me>
 <d42fedb6-ac96-4404-8478-66783118dbd1@suse.com>
 <fc2f93f3-7a65-44b3-a25a-9383fe95b16b@suse.com>
In-Reply-To: <fc2f93f3-7a65-44b3-a25a-9383fe95b16b@suse.com>

--------------k0iq6QkQteaoV3Gf4zmiFBPC
Content-Type: multipart/mixed; boundary="------------oxzyCRA0zGeaGRSaLLPB5bG8"

--------------oxzyCRA0zGeaGRSaLLPB5bG8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjMgMTA6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4xMi4yMDIz
IDEwOjIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDAxLjEyLjIwMjMgMjE6MTMsIFJl
bsOpIFdpbnRoZXIgSMO4amdhYXJkIHdyb3RlOg0KPj4+IFdoZW4gSSBtb3ZlIGEgZG9tYWlu
IGZyb20gcG9vbDAgd2l0aCBjcmVkaXQyIHRvIGFueSBwb29sIHdpdGggY3JlZGl0KDEpIEkg
Z2V0IHRoZSBmb2xsb3dpbmcgY3Jhc2guDQo+Pj4NCj4+Pg0KPj4+IFNvZnR3YXJlOiBYZW4t
NC4xNy4zIC8gUXViZXMgT1MgNC4yLjAtUkM1DQo+Pj4gRmlybXdhcmU6IERhc2hhcm8gMC45
LjAgLSBaNzkwUA0KPj4+IEhhcmR3YXJlOiAxMzkwMEsNCj4+PiAoWEVOKSBYZW4gQlVHIGF0
IGNvbW1vbi9zY2hlZC9jcmVkaXQuYzoxMDUxKFhFTikgLS0tLVsgWGVuLTQuMTcuMy1wcmUg
wqB4ODZfNjQgwqBkZWJ1Zz15IMKgTm90IHRhaW50ZWQgXS0tLS0NCj4+PiAoWEVOKSBDUFU6
IMKgIMKgMg0KPj4+IChYRU4pIFJJUDogwqAgwqBlMDA4Ols8ZmZmZjgyZDA0MDIzN2NmZD5d
IGNyZWRpdC5jI2NzY2hlZF9mcmVlX3VkYXRhKzB4MTIvMHgxNA0KPj4+IChYRU4pIFJGTEFH
UzogMDAwMDAwMDAwMDAxMDIwMiDCoCBDT05URVhUOiBoeXBlcnZpc29yIChkMHYyKQ0KPj4+
IChYRU4pIHJheDogZmZmZjgyZDA0MDIzN2NlYiDCoCByYng6IDAwMDAwMDAwMDAwMDAwMTQg
wqAgcmN4OiAwMDAwMDAwMDAwMDAwMDEzDQo+Pj4gKFhFTikgcmR4OiBmZmZmODMxMDg3ZDdm
ZmZmIMKgIHJzaTogZmZmZjgzMGFkODBlOGRhMCDCoCByZGk6IGZmZmY4MzBhZDgwZThkYTAN
Cj4+PiAoWEVOKSByYnA6IDAwMDAwMDAwMDAwMDAwMDAgwqAgcnNwOiBmZmZmODMxMDg3ZDdm
YzkwIMKgIHI4OiDCoGZmZmY4MzBlMmQ2YTQ5YjANCj4+PiAoWEVOKSByOTogwqBmZmZmODMx
MDg3ZDdmYmUwIMKgIHIxMDogZmZmZjgzMTA3YzQ4MTA2OCDCoCByMTE6IDAwMDAwMDJjZmQx
YzI3NGENCj4+PiAoWEVOKSByMTI6IGZmZmY4MzBhZDgwZThjODAgwqAgcjEzOiBmZmZmODMx
MDdjNDViZWUwIMKgIHIxNDogMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4pIHIxNTogZmZm
ZjgyZDA0MDVhOTI4OCDCoCBjcjA6IDAwMDAwMDAwODAwNTAwMzMgwqAgY3I0OiAwMDAwMDAw
MDAwYjUyNmUwDQo+Pj4gKFhFTikgY3IzOiAwMDAwMDAwOTI4NGQ4MDAwIMKgIGNyMjogMDAw
MDdmYjUzNTE4MTI0MA0KPj4+IChYRU4pIGZzYjogMDAwMDdmYjUzNGM1ZjM4MCDCoCBnc2I6
IGZmZmY4ODgxYjlkMDAwMDAgwqAgZ3NzOiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4gKFhFTikg
ZHM6IDAwMDAgwqAgZXM6IDAwMDAgwqAgZnM6IDAwMDAgwqAgZ3M6IDAwMDAgwqAgc3M6IGUw
MTAgwqAgY3M6IGUwMDgNCj4+PiAoWEVOKSBYZW4gY29kZSBhcm91bmQgPGZmZmY4MmQwNDAy
MzdjZmQ+IChjcmVkaXQuYyNjc2NoZWRfZnJlZV91ZGF0YSsweDEyLzB4MTQpOg0KPj4+IChY
RU4pIMKgNzUgMDYgZTggMTkgNzQgZmYgZmYgYzMgPDBmPiAwYiBmMyAwZiAxZSBmYSA1MyA0
OCA4YiA1ZiAxOCA0OCA4NSBkYiA3NCAyYg0KPj4+IChYRU4pIFhlbiBzdGFjayB0cmFjZSBm
cm9tIHJzcD1mZmZmODMxMDg3ZDdmYzkwOg0KPj4+IChYRU4pIMKgIMKgZmZmZjgyZDA0MDI0
NzUwMyAwMDAwMDAxMzAwMDAyMDMwIGZmZmY4MzBhZDgwZThiZjAgZmZmZjgyZDA0MDVhOTI4
OA0KPj4+IChYRU4pIMKgIMKgZmZmZjgzMTA3ZjU5YWE4MCBmZmZmODMwYWQ4MGU4YzgwIGZm
ZmY4MzEwN2M0NWJlZTAgZmZmZjgzMGFkODBlOGJmMA0KPj4+IChYRU4pIMKgIMKgZmZmZjgz
MTAwMGFmMTAxMCBmZmZmODMxMDdjNDViZWUwIGZmZmY4MzBhZDgwZWQwMDAgZmZmZjgzMTA3
YzQ1YmVlMA0KPj4+IChYRU4pIMKgIMKgMDAwMDAwMDAwMDAwMDAwMCBmZmZmODJkMDQwNDVk
NWQ4IGZmZmY4MmQwNDA1YWU2ODAgZmZmZjgyZDA0MDIzNTMwMw0KPj4+IChYRU4pIMKgIMKg
ZmZmZjgzMTA4N2Q3ZmUyMCAwMDAwMDAwMGZmZmZmZmZlIGZmZmY4MmQwNDAyMzZlYzMgZmZm
ZjgzMGFkODBlZDAwMA0KPj4+IChYRU4pIMKgIMKgMDAwMDAwMDAwMDAwMDAwMCAwMDAwN2Zi
NTM1MjMwMDEwIGZmZmY4MzEwODdkN2ZmZmYgMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4p
IMKgIMKgZmZmZjgyZDA0MDQ1ZDVkOCBmZmZmODJkMDQwMjM0NzYzIDAwMDAwMDAwYzAwMDAx
MDIgMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4pIMKgIMKgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMGMwMDAwMTAyIDAwMDAwMDBkMDAwMDAwMDAgZmZmZmZmZmY4MTAxZWRlNg0KPj4+
IChYRU4pIMKgIMKgMDAwMDAwMDAwMDAwZTAzMyAwMDAwMDAwMDAwMDExMDgyIGZmZmZjOTAw
NDZlYmJhOTAgMDAwMDAwMDAwMDAwZTAyYg0KPj4+IChYRU4pIMKgIMKgNWEzM2ExYTY1MzUy
YmVlZiBmZWFkZjllZmZkZjFiZWVmIDEyMmFlMmZhNzM2YmJlZWYgNDYwMjNlOWFmMTc0YmVl
Zg0KPj4+IChYRU4pIMKgIMKgZmZmZjgyZDA0MDIyN2NjNiBmZmZmODMxMDg3ZDdmZTQ4IDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAxMTA4Mg0KPj4+IChYRU4pIMKgIMKgMDAwMDAw
MDAwMDAwMDAwMCBmZmZmODMxMDg3ZDdmZmZmIDAwMDAwMDAwMDAwMDAwMDAgZmZmZmZmZmY4
MTAxZWRlNA0KPj4+IChYRU4pIMKgIMKgZmZmZjgyZDA0MDM0OTVkMCAwMDAwMDAxNTAwMDAw
MDEyIDAwMDAwMDAxMDAwMDAwMDYgMDAwMDAwMGQwMDAwMDAwMA0KPj4+IChYRU4pIMKgIMKg
MDAwMDdmZmRmOTNmYjNmYyAwMDAwMDAwMDAwNDMxMDQyIDAwMDAwMDAwMDA0M2Q5OTAgMDAw
MDAwMDAwMDQzZDliMA0KPj4+IChYRU4pIMKgIMKgMDAwMDdmYjUzNGViODQzNCAwMDAwN2Zm
ZGY5M2ZiNDAwIDAwMDAwMDAwMDAwMDAwMTMgMDAwMDAwMDAwMjM2MTgzOA0KPj4+IChYRU4p
IMKgIMKgMDQ0NTdmZTgxZjdjZjMwMCAwMDAwMDAwMDAyMzYwODcwIGZmZmZmZmZmZmZmZmZm
ODAgMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4pIMKgIMKgMDAwMDdmZmRmOTNmYzY1MiAw
MDAwMDAwMDAwNDNkOTgwIGZmZmY4MzEwODdkN2ZlZjggMDAwMDAwMDAwMDAwMDAyMw0KPj4+
IChYRU4pIMKgIMKgZmZmZjgzMTA3ZjU0NDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4pIMKgIMKgZmZmZjgyZDA0MDJk
ZDA3ZiBmZmZmODMxMDdmNTQ0MDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MA0KPj4+IChYRU4pIMKgIMKgZmZmZjgyZDA0MDIwMTJiNyAwMDAwMDAwMDAwMDAwMDAwIGZm
ZmY4ODgxMWFiYmMxMDAgMDAwMDdmZmRmOTNmYjJjMA0KPj4+IChYRU4pIFhlbiBjYWxsIHRy
YWNlOg0KPj4+IChYRU4pIMKgIMKgWzxmZmZmODJkMDQwMjM3Y2ZkPl0gUiBjcmVkaXQuYyNj
c2NoZWRfZnJlZV91ZGF0YSsweDEyLzB4MTQNCj4+PiAoWEVOKSDCoCDCoFs8ZmZmZjgyZDA0
MDI0NzUwMz5dIFMgc2NoZWRfbW92ZV9kb21haW4rMHg1YjAvMHg1Y2MNCj4+DQo+PiBIbW0s
IGxvb2tzIGxpa2Ugc2NoZWRfbW92ZV9kb21haW4oKSdzIGNhbGxpbmcgb2Ygc2NoZWRfZnJl
ZV91ZGF0YSgpIHVzZXMgdGhlDQo+PiBuZXcgcG9vbCdzIHNjaGVkdWxlciwgbm90IHRoYXQg
b2YgdGhlIG9yaWdpbmFsIHBvb2wuIEknbSBwdXp6bGVkIHRob3VnaCB0aGF0DQo+PiB0aGVy
ZSdzIG5vIHNpZ24gYXQgYWxsIGluIHRoZSBmdW5jdGlvbiBvZiBpdCBjYXJpbmcgYWJvdXQg
d2hhdCB0aGUgb3JpZ2luYWwNCj4+IHBvb2wgd2FzLiBJT1cgSSdtIG5vdCBzdXJlIHRoYXQg
dGhlIHNpbXBsZSBhbmQgb2J2aW91cyBjaGFuZ2UgdG8gbGF0Y2ggdGhlDQo+PiBvcmlnaW5h
bCBwb29sIGludG8gYSBsb2NhbCBhbmQgdGhlbiB1c2UgaXQgb24gdGhlICJvdXRfZnJlZSIg
cGF0aCBpcyBnb2luZw0KPj4gdG8gYmUgZW5vdWdoLiBKw7xyZ2VuIChzb3JyeSwgYWdhaW4g
eW91KT8NCj4gDQo+IEhtbSwgc2hvdWxkIGhhdmUgYWRkZWQgImluIHRoZSBlcnJvciBjYXNl
Ii4gU2VlaW5nIHRoZXJlIGlzIG9sZF9vcHMsIHBlcmhhcHMNCj4gc2ltcGx5DQo+IA0KPiAt
LS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVk
L2NvcmUuYw0KPiBAQCAtODEwLDcgKzgxMCw3IEBADQo+ICAgICAgIGZvciAoIHVuaXQgPSBv
bGRfdW5pdHM7IHVuaXQ7ICkNCj4gICAgICAgew0KPiAgICAgICAgICAgaWYgKCB1bml0LT5w
cml2ICkNCj4gLSAgICAgICAgICAgIHNjaGVkX2ZyZWVfdWRhdGEoYy0+c2NoZWQsIHVuaXQt
PnByaXYpOw0KPiArICAgICAgICAgICAgc2NoZWRfZnJlZV91ZGF0YShyZXQgPyBjLT5zY2hl
ZCA6IG9sZF9vcHMsIHVuaXQtPnByaXYpOw0KPiAgICAgICAgICAgb2xkX3VuaXQgPSB1bml0
Ow0KPiAgICAgICAgICAgdW5pdCA9IHVuaXQtPm5leHRfaW5fbGlzdDsNCj4gICAgICAgICAg
IHhmcmVlKG9sZF91bml0KTsNCj4gDQoNClllcywgdGhpcyBsb29rcyBmaW5lLg0KDQpJbiBj
YXNlIHlvdSB3YW50IHRvIHNlbmQgYSBwcm9wZXIgcGF0Y2gsIHlvdSBjYW4gYWRkIG15DQoN
ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVl
cmdlbg0K
--------------oxzyCRA0zGeaGRSaLLPB5bG8
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

--------------oxzyCRA0zGeaGRSaLLPB5bG8--

--------------k0iq6QkQteaoV3Gf4zmiFBPC--

--------------Wpw4ZPruGFks68kdaDvRcD8s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVtpqwFAwAAAAAACgkQsN6d1ii/Ey+W
Hwf9HaAwVvcpnKBjrfywTZLkKLl1LwWBXkt1p38a/RI+syKKFmOrxaD1cVWeqJVJcKh2l5YwBSQa
6Iu1krklN4KRh4vgtpQJzF4oxDACJpqBbnSTuWaHv+OfF+CnJ46bHW+aRGOxN4vW16VzeReCF6O6
KZ3PLFF7LqCQPO/RIx0K4FtSvGhIQXZlDWL0DFvGYzSylibiJsentVoDHsJ3DK0JABuehmfCYYw+
j+NAyTGZwFEkX/WwglMJFtYjlbd9wQURNeNytCJcY7hwMGBgnm/FYY23K/BoEXa/2b0TcD6Qqcch
E5SNubdk0zqmczTzZy1VnTMKB8Tb9LSOGISVPqLeuw==
=wmog
-----END PGP SIGNATURE-----

--------------Wpw4ZPruGFks68kdaDvRcD8s--

