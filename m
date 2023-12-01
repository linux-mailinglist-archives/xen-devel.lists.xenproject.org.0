Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979A3800595
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 09:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645345.1007469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8yu0-000192-4m; Fri, 01 Dec 2023 08:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645345.1007469; Fri, 01 Dec 2023 08:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8yu0-00015m-1q; Fri, 01 Dec 2023 08:29:36 +0000
Received: by outflank-mailman (input) for mailman id 645345;
 Fri, 01 Dec 2023 08:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hHVa=HM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r8yty-00015g-3x
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 08:29:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0199917-9023-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 09:29:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19A8D1FD58;
 Fri,  1 Dec 2023 08:29:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF2031379A;
 Fri,  1 Dec 2023 08:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HckLOWqZaWXDPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 01 Dec 2023 08:29:30 +0000
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
X-Inumbo-ID: c0199917-9023-11ee-9b0f-b553b5be7939
Message-ID: <258abfda-5f71-4e75-a3a5-abdad85a85f3@suse.com>
Date: Fri, 1 Dec 2023 09:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <ZWf0sWey05VnpH7X@mail-itl>
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
In-Reply-To: <ZWf0sWey05VnpH7X@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YJZFw86K4o5GOOcBX7Rz9rPZ"
X-Spamd-Bar: +++++++++++++++++++++
X-Spam-Score: 21.38
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine)
X-Rspamd-Queue-Id: 19A8D1FD58
X-Spam-Flag: NO
X-Spam-Level: *********************
X-Spamd-Result: default: False [21.38 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_ALL(0.00)[];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_TWO(0.00)[2];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:~,6:~];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(2.88)[0.962];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain,text/x-patch];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YJZFw86K4o5GOOcBX7Rz9rPZ
Content-Type: multipart/mixed; boundary="------------DOEWShImYjJpYmnIkEggIqFL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <258abfda-5f71-4e75-a3a5-abdad85a85f3@suse.com>
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt
References: <ZWf0sWey05VnpH7X@mail-itl>
In-Reply-To: <ZWf0sWey05VnpH7X@mail-itl>

--------------DOEWShImYjJpYmnIkEggIqFL
Content-Type: multipart/mixed; boundary="------------8ixqtW0LZGqWB0V52ZfpphcS"

--------------8ixqtW0LZGqWB0V52ZfpphcS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWFyZWssDQoNCk9uIDMwLjExLjIzIDAzOjM0LCBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kgd3JvdGU6DQo+IEhpLA0KPiANCj4gV2hpbGUgdGVzdGluZyA2LjctcmMzIG9uIFF1
YmVzIE9TIEkgZm91bmQgc2V2ZXJhbCB3YXJuaW5nIGxpa2UgaW4gdGhlDQo+IHN1YmplY3Qg
aW4gZG9tMCBsb2cuIEkgc2VlIHRoZW0gd2hlbiBydW5uaW5nIDYuNy1yYzEgdG9vLiBJJ20g
bm90IHN1cmUNCj4gd2hhdCBleGFjdGx5IHRyaWdnZXJzIHRoZSBpc3N1ZSwgYnV0IG15IGd1
ZXNzIHdvdWxkIGJlIHVuYmluZGluZyBhbg0KPiBldmVudCBjaGFubmVsIGZyb20gdXNlcnNw
YWNlIChjbG9zaW5nIHZjaGFuIGNvbm5lY3Rpb24pLg0KPiANCj4gU3BlY2lmaWMgbWVzc2Fn
ZToNCj4gDQo+IFsgICA4My45NzMzNzddIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQ0KPiBbICAgODMuOTc1NTIzXSBJbnRlcnJ1cHQgZm9yIHBvcnQgNzcsIGJ1dCBh
cHBhcmVudGx5IG5vdCBlbmFibGVkOyBwZXItdXNlciAwMDAwMDAwMGEwZTlmMWQxDQoNCkp1
c3QgYSBndWVzcywgYnV0IEkgdGhpbmsgdGhpcyBtaWdodCBoYXBwZW4gd2hlbiB0aGUgdmNo
YW4gY29ubmVjdGlvbg0KaXMgY2xvc2VkIHdoaWxlIHRoZXJlIGlzIHN0aWxsIHNvbWUgdHJh
ZmZpYy4gVGhpcyBjb3VsZCByZXN1bHQgaW4gZXZlbnRzDQp0cmlnZ2VyaW5nIGluIHBhcmFs
bGVsIHRvIHVuYmluZGluZyB0aGUgZXZlbnQgY2hhbm5lbC4NCg0KQ291bGQgeW91IHBsZWFz
ZSB0ZXN0IHRoZSBhdHRhY2hlZCBwYXRjaCAob25seSBjb21waWxlIHRlc3RlZCk/DQoNCg0K
SnVlcmdlbg0KDQo=
--------------8ixqtW0LZGqWB0V52ZfpphcS
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-events-fix-race-when-unbinding-an-event-channel.patch"
Content-Disposition: attachment;
 filename*0="0001-xen-events-fix-race-when-unbinding-an-event-channel.pat";
 filename*1="ch"
Content-Transfer-Encoding: base64

RnJvbSBlMjk3NjFhOGQ1ZDY4ZDc0MzI2NTlkNjAxYWY2MGY1NTZlMzEzNmE5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwODowMzozOSArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IHhlbi9ldmVudHM6IGZpeCByYWNlIHdoZW4gdW5iaW5kaW5nIGFuIGV2ZW50IGNoYW5uZWwK
TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCldoZW4gdW5iaW5kaW5nIGFu
IGV2ZW50IGNoYW5uZWwgdGhlIHVuYmluZCBmdW5jdGlvbiBzaG91bGQgb25seSByZXR1cm4K
dG8gdGhlIGNhbGxlciB3aGVuIG5vIGludGVycnVwdCBoYW5kbGVyIGNhbiBiZSBhY3RpdmUg
YW55IG1vcmUuCgpXaGVuIHN3aXRjaGluZyBmcm9tIGEgcndsb2NrIHRvIFJDVSBmb3IgZnJl
ZWluZyBldmVudCBjaGFubmVscyB0aGlzCmFzc3VtcHRpb24gd2FzIGJyb2tlbi4KCkZpeCB0
aGF0IGJ5IHJlcGxhY2luZyB0aGUgImlzX2FjdGl2ZSIgZmxhZyBvZiBhbiBldmVudCBjaGFu
bmVsIHdpdGggYW4KYXRvbWljIHVzZWQgdG8ga2VlcCB0cmFjayBvZiBldmVudCBjaGFubmVs
IGZyZWVpbmcgQU5EIGludGVycnVwdApoYW5kbGVyIGFjdGl2aXR5LgoKUmVhcnJhbmdlIHN0
cnVjdCBpcnFfaW5mbyBhIGxpdHRsZSBiaXQgdG8gYXZvaWQgYWRkaW5nIG5ldyBwYWRkaW5n
CmhvbGVzLgoKRml4ZXM6IDg3Nzk3ZmFkNmNjZSAoInhlbi9ldmVudHM6IHJlcGxhY2UgZXZ0
Y2huX3J3bG9jayB3aXRoIFJDVSIpClJlcG9ydGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+ClNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9l
dmVudHMvZXZlbnRzX2Jhc2UuYyB8IDUxICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgYi9kcml2
ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwppbmRleCBmNWVkYjllMjdlM2MuLmM0ODBi
YzQ5OGJhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMK
KysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKQEAgLTEwNiw3ICsxMDYs
NyBAQCBzdHJ1Y3QgaXJxX2luZm8gewogI2RlZmluZSBFVlRfTUFTS19SRUFTT05fRVhQTElD
SVQJMHgwMQogI2RlZmluZSBFVlRfTUFTS19SRUFTT05fVEVNUE9SQVJZCTB4MDIKICNkZWZp
bmUgRVZUX01BU0tfUkVBU09OX0VPSV9QRU5ESU5HCTB4MDQKLQl1OCBpc19hY3RpdmU7CQkv
KiBJcyBldmVudCBqdXN0IGJlaW5nIGhhbmRsZWQ/ICovCisJYm9vbCBpc19zdGF0aWM7ICAg
ICAgICAgICAvKiBJcyBldmVudCBjaGFubmVsIHN0YXRpYyAqLwogCXVuc2lnbmVkIGlycTsK
IAlldnRjaG5fcG9ydF90IGV2dGNobjsgICAvKiBldmVudCBjaGFubmVsICovCiAJdW5zaWdu
ZWQgc2hvcnQgY3B1OyAgICAgLyogY3B1IGJvdW5kICovCkBAIC0xMTQsNyArMTE0LDIzIEBA
IHN0cnVjdCBpcnFfaW5mbyB7CiAJdW5zaWduZWQgaW50IGlycV9lcG9jaDsgLyogSWYgZW9p
X2NwdSB2YWxpZDogaXJxX2Vwb2NoIG9mIGV2ZW50ICovCiAJdTY0IGVvaV90aW1lOyAgICAg
ICAgICAgLyogVGltZSBpbiBqaWZmaWVzIHdoZW4gdG8gRU9JLiAqLwogCXJhd19zcGlubG9j
a190IGxvY2s7Ci0JYm9vbCBpc19zdGF0aWM7ICAgICAgICAgICAvKiBJcyBldmVudCBjaGFu
bmVsIHN0YXRpYyAqLworCisJLyoKKwkgKiBXaGVuIGZyZWVpbmcgYW4gZXZlbnQgY2hhbm5l
bCBpdCBpcyBtYXJrZWQgd2l0aCBFVlRfQUNUX0ZSRUVJTkcuCisJICogV2hlbiBhbiBJUlEg
aGFuZGxlciBpcyBzdGFydGluZyB0aGUgZXZlbnQgY2hhbm5lbCBpcyBtYXJrZWQgd2l0aAor
CSAqIEVWVF9BQ1RfSEFORExFUiB8IEVWVF9BQ1RfRU9JLgorCSAqIFdoZW4gbGVhdmluZyB0
aGUgSVJRIGhhbmRsZXIgRVZUX0FDVF9IQU5ETEVSIGlzIGNsZWFyZWQuIEVWVF9BQ1RfRU9J
CisJICogaXMgY2xlYXJlZCBlaXRoZXIgYXQgdGhlIHNhbWUgdGltZSBvciBpbiBjYXNlIG9m
IGEgbGF0ZS1FT0kgZXZlbnQKKwkgKiB3aGVuIHRoZSBFT0kgaXMgc2lnbmFsbGVkLgorCSAq
IEEgSVJRIGhhbmRsZXIgbWF5IG9ubHkgYmUgZW50ZXJlZCBpZiBub25lIG9mIHRoZSBmbGFn
cyBpcyBzZXQuCisJICogRnJlZWluZyBhbiBldmVudCBjaGFubmVsIGlzIGRvbmUgdmlhIFJD
VSwgYnV0IHRoZSBmcmVlaW5nIGZ1bmN0aW9uCisJICogc3RhcnRpbmcgdGhlIFJDVSBwcm9j
ZXNzIG1heSBvbmx5IHJldHVybiBpZiBFVlRfQUNUX0hBTkRMRVIgaXMgbm90CisJICogc2V0
IChubyBoYW5kbGVyIGlzIGFjdGl2ZSBhbnkgbW9yZSkuCisJICovCisJYXRvbWljX3QgYWN0
aXZlOwkvKiBJcyBldmVudCBqdXN0IGJlaW5nIGhhbmRsZWQ/ICovCisjZGVmaW5lIEVWVF9B
Q1RfSEFORExFUgkJMHgwMDAwMDAwMQkvKiBJUlEgaGFuZGxlciBhY3RpdmUgKi8KKyNkZWZp
bmUgRVZUX0FDVF9FT0kJCTB4MDAwMDAwMDIJLyogRU9JIHBlbmRpbmcgKi8KKyNkZWZpbmUg
RVZUX0FDVF9GUkVFSU5HCQkweDAwMDAwMDA0CS8qIGV2ZW4gY2hhbm5lbCBiZWluZyBmcmVl
ZCAqLwogCiAJdW5pb24gewogCQl1bnNpZ25lZCBzaG9ydCB2aXJxOwpAQCAtNjQwLDggKzY1
Niw4IEBAIHN0YXRpYyB2b2lkIHhlbl9pcnFfbGF0ZWVvaV9sb2NrZWQoc3RydWN0IGlycV9p
bmZvICppbmZvLCBib29sIHNwdXJpb3VzKQogCiAJaW5mby0+ZW9pX3RpbWUgPSAwOwogCi0J
LyogaXNfYWN0aXZlIGhhc24ndCBiZWVuIHJlc2V0IHlldCwgZG8gaXQgbm93LiAqLwotCXNt
cF9zdG9yZV9yZWxlYXNlKCZpbmZvLT5pc19hY3RpdmUsIDApOworCS8qIEVWVF9BQ1RfRU9J
IGhhc24ndCBiZWVuIHJlc2V0IHlldCwgZG8gaXQgbm93LiAqLworCWF0b21pY19mZXRjaF9h
bmRub3RfcmVsZWFzZShFVlRfQUNUX0VPSSwgJmluZm8tPmFjdGl2ZSk7CiAJZG9fdW5tYXNr
KGluZm8sIEVWVF9NQVNLX1JFQVNPTl9FT0lfUEVORElORyk7CiB9CiAKQEAgLTc5Miw5ICs4
MDgsOSBAQCBzdGF0aWMgdm9pZCB4ZW5fZnJlZV9pcnEoc3RydWN0IGlycV9pbmZvICppbmZv
KQogfQogCiAvKiBOb3QgY2FsbGVkIGZvciBsYXRlZW9pIGV2ZW50cy4gKi8KLXN0YXRpYyB2
b2lkIGV2ZW50X2hhbmRsZXJfZXhpdChzdHJ1Y3QgaXJxX2luZm8gKmluZm8pCitzdGF0aWMg
dm9pZCBldmVudF9oYW5kbGVyX2V4aXQoc3RydWN0IGlycV9pbmZvICppbmZvLCBpbnQgZmxh
ZykKIHsKLQlzbXBfc3RvcmVfcmVsZWFzZSgmaW5mby0+aXNfYWN0aXZlLCAwKTsKKwlhdG9t
aWNfZmV0Y2hfYW5kbm90X3JlbGVhc2UoRVZUX0FDVF9IQU5ETEVSIHwgZmxhZywgJmluZm8t
PmFjdGl2ZSk7CiAJY2xlYXJfZXZ0Y2huKGluZm8tPmV2dGNobik7CiB9CiAKQEAgLTgxOSw3
ICs4MzUsNyBAQCBzdGF0aWMgdm9pZCBkb19lb2lfcGlycShzdHJ1Y3QgaXJxX2luZm8gKmlu
Zm8pCiAJaWYgKCFWQUxJRF9FVlRDSE4oaW5mby0+ZXZ0Y2huKSkKIAkJcmV0dXJuOwogCi0J
ZXZlbnRfaGFuZGxlcl9leGl0KGluZm8pOworCWV2ZW50X2hhbmRsZXJfZXhpdChpbmZvLCBF
VlRfQUNUX0VPSSk7CiAKIAlpZiAocGlycV9uZWVkc19lb2koaW5mbykpIHsKIAkJcmMgPSBI
WVBFUlZJU09SX3BoeXNkZXZfb3AoUEhZU0RFVk9QX2VvaSwgJmVvaSk7CkBAIC05NjgsNiAr
OTg0LDggQEAgc3RhdGljIHZvaWQgX191bmJpbmRfZnJvbV9pcnEoc3RydWN0IGlycV9pbmZv
ICppbmZvLCB1bnNpZ25lZCBpbnQgaXJxKQogCQkJcmV0dXJuOwogCX0KIAorCWF0b21pY19m
ZXRjaF9vcl9hY3F1aXJlKEVWVF9BQ1RfRlJFRUlORywgJmluZm8tPmFjdGl2ZSk7CisKIAll
dnRjaG4gPSBpbmZvLT5ldnRjaG47CiAKIAlpZiAoVkFMSURfRVZUQ0hOKGV2dGNobikpIHsK
QEAgLTk5Nyw2ICsxMDE1LDEwIEBAIHN0YXRpYyB2b2lkIF9fdW5iaW5kX2Zyb21faXJxKHN0
cnVjdCBpcnFfaW5mbyAqaW5mbywgdW5zaWduZWQgaW50IGlycSkKIAkJeGVuX2lycV9pbmZv
X2NsZWFudXAoaW5mbyk7CiAJfQogCisJLyogV2FpdCB1bnRpbCBhbGwgSVJRIGhhbmRsZXJz
IGFyZSBnb25lLiAqLworCXdoaWxlIChhdG9taWNfcmVhZF9hY3F1aXJlKCZpbmZvLT5hY3Rp
dmUpICYgRVZUX0FDVF9IQU5ETEVSKQorCQljcHVfcmVsYXgoKTsKKwogCXhlbl9mcmVlX2ly
cShpbmZvKTsKIH0KIApAQCAtMTY2OSw3ICsxNjkxLDggQEAgdm9pZCBoYW5kbGVfaXJxX2Zv
cl9wb3J0KGV2dGNobl9wb3J0X3QgcG9ydCwgc3RydWN0IGV2dGNobl9sb29wX2N0cmwgKmN0
cmwpCiAJCX0KIAl9CiAKLQlpZiAoeGNoZ19hY3F1aXJlKCZpbmZvLT5pc19hY3RpdmUsIDEp
KQorCS8qIE9ubHkgZW50ZXIgaGFuZGxlciBpZiBub3Q6IGZyZWVkLCBoYW5kbGVyIGFjdGl2
ZSwgRU9JIHBlbmRpbmcuICovCisJaWYgKGF0b21pY19jbXB4Y2hnKCZpbmZvLT5hY3RpdmUs
IDAsIEVWVF9BQ1RfSEFORExFUiB8IEVWVF9BQ1RfRU9JKSkKIAkJcmV0dXJuOwogCiAJZGV2
ID0gKGluZm8tPnR5cGUgPT0gSVJRVF9FVlRDSE4pID8gaW5mby0+dS5pbnRlcmRvbWFpbiA6
IE5VTEw7CkBAIC0xODQ2LDcgKzE4NjksNyBAQCBzdGF0aWMgdm9pZCBkb19hY2tfZHluaXJx
KHN0cnVjdCBpcnFfaW5mbyAqaW5mbykKIAlldnRjaG5fcG9ydF90IGV2dGNobiA9IGluZm8t
PmV2dGNobjsKIAogCWlmIChWQUxJRF9FVlRDSE4oZXZ0Y2huKSkKLQkJZXZlbnRfaGFuZGxl
cl9leGl0KGluZm8pOworCQlldmVudF9oYW5kbGVyX2V4aXQoaW5mbywgRVZUX0FDVF9FT0kp
OwogfQogCiBzdGF0aWMgdm9pZCBhY2tfZHluaXJxKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkK
QEAgLTE4NzQsMTEgKzE4OTcsNyBAQCBzdGF0aWMgdm9pZCBsYXRlZW9pX2Fja19keW5pcnEo
c3RydWN0IGlycV9kYXRhICpkYXRhKQogCiAJaWYgKFZBTElEX0VWVENITihldnRjaG4pKSB7
CiAJCWRvX21hc2soaW5mbywgRVZUX01BU0tfUkVBU09OX0VPSV9QRU5ESU5HKTsKLQkJLyoK
LQkJICogRG9uJ3QgY2FsbCBldmVudF9oYW5kbGVyX2V4aXQoKS4KLQkJICogTmVlZCB0byBr
ZWVwIGlzX2FjdGl2ZSBub24temVybyBpbiBvcmRlciB0byBpZ25vcmUgcmUtcmFpc2VkCi0J
CSAqIGV2ZW50cyBhZnRlciBjcHUgYWZmaW5pdHkgY2hhbmdlcyB3aGlsZSBhIGxhdGVlb2kg
aXMgcGVuZGluZy4KLQkJICovCisJCWV2ZW50X2hhbmRsZXJfZXhpdChpbmZvLCAwKTsKIAkJ
Y2xlYXJfZXZ0Y2huKGV2dGNobik7CiAJfQogfQpAQCAtMTg5MCw3ICsxOTA5LDcgQEAgc3Rh
dGljIHZvaWQgbGF0ZWVvaV9tYXNrX2Fja19keW5pcnEoc3RydWN0IGlycV9kYXRhICpkYXRh
KQogCiAJaWYgKFZBTElEX0VWVENITihldnRjaG4pKSB7CiAJCWRvX21hc2soaW5mbywgRVZU
X01BU0tfUkVBU09OX0VYUExJQ0lUKTsKLQkJZXZlbnRfaGFuZGxlcl9leGl0KGluZm8pOwor
CQlldmVudF9oYW5kbGVyX2V4aXQoaW5mbywgRVZUX0FDVF9FT0kpOwogCX0KIH0KIApAQCAt
MjAxMSw3ICsyMDMwLDcgQEAgdm9pZCB4ZW5fY2xlYXJfaXJxX3BlbmRpbmcoaW50IGlycSkK
IAlldnRjaG5fcG9ydF90IGV2dGNobiA9IGluZm8gPyBpbmZvLT5ldnRjaG4gOiAwOwogCiAJ
aWYgKFZBTElEX0VWVENITihldnRjaG4pKQotCQlldmVudF9oYW5kbGVyX2V4aXQoaW5mbyk7
CisJCWV2ZW50X2hhbmRsZXJfZXhpdChpbmZvLCBFVlRfQUNUX0VPSSk7CiB9CiBFWFBPUlRf
U1lNQk9MKHhlbl9jbGVhcl9pcnFfcGVuZGluZyk7CiAKLS0gCjIuMzUuMwoK
--------------8ixqtW0LZGqWB0V52ZfpphcS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8ixqtW0LZGqWB0V52ZfpphcS--

--------------DOEWShImYjJpYmnIkEggIqFL--

--------------YJZFw86K4o5GOOcBX7Rz9rPZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVpmWoFAwAAAAAACgkQsN6d1ii/Ey/i
bAf+KQvZTJtmZ4xt7FY3MhC3q6uP23OMmzR+U6wC0bbhBuy4uJIQ56Vekoq8IFo3xIFuzEqLrkN1
A/BcM8hx/udeWz3Zg6gOQfRlBdV2tWWBhHM13VG5OtLqlbnUbhGO9K9oTEP/8MtnB687FJkcYncE
v4kNcJPidiAVRTiH1E9IRmU5LjPjh/WdwDcwpgA1HZJhJoh1C3sHFf+eKbzrCQ5mMa3nvjMxrP0v
FIUgqBmXjsng3VBcODHmER3k7V8LS0tMbQMmPwklIM2ih20y/ON/nptR4G3A+qdCQhOcWneIDyCr
lJQq3o8me16c/ewqu6LJAnFiQ4RIy6AoL7jmTqgTzA==
=m3YL
-----END PGP SIGNATURE-----

--------------YJZFw86K4o5GOOcBX7Rz9rPZ--

