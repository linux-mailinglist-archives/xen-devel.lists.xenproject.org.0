Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B8C7CC114
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 12:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618203.961580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qshgG-00067R-5O; Tue, 17 Oct 2023 10:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618203.961580; Tue, 17 Oct 2023 10:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qshgG-000656-2j; Tue, 17 Oct 2023 10:52:08 +0000
Received: by outflank-mailman (input) for mailman id 618203;
 Tue, 17 Oct 2023 10:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGTZ=F7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qshgE-000650-JK
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 10:52:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b2c807-6cdb-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 12:52:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E7B221D08;
 Tue, 17 Oct 2023 10:52:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 169E413597;
 Tue, 17 Oct 2023 10:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C/ahA1RnLmWyHQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Oct 2023 10:52:04 +0000
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
X-Inumbo-ID: 35b2c807-6cdb-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697539924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N82czOJhPB446fGiweg7rGQAP3QtHbqAcHIYnmMO7hk=;
	b=nIxW/spCnbeeFZomk1VbSZ+7RNz1xcQAXEP/mHLdtUi0v0MF9RjFI+5RcN1p2rM86L8s1H
	7qhGyLYbgFxSVL8/Da2PwjrkwFZzdsFoJPj4ITR5Gh5TxpoT/Nfht+57KkuEHwqQP2qtjO
	gP2P4Iim85FWcNYMvEjlAyvK28JJ2pk=
Message-ID: <34d3adca-6b8a-46a0-bd1f-ab0637f00288@suse.com>
Date: Tue, 17 Oct 2023 12:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
 <ef8ca952-fe3a-4180-857b-7f4dd09b8259@suse.com>
 <9de84dd4-a137-4dcc-be57-7be953145f8f@citrix.com>
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
In-Reply-To: <9de84dd4-a137-4dcc-be57-7be953145f8f@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QhI01Ab42W4G6SUz0QebZO77"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 TO_DN_ALL(0.00)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QhI01Ab42W4G6SUz0QebZO77
Content-Type: multipart/mixed; boundary="------------Absri1TPo028au4c0mlytDiv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
Message-ID: <34d3adca-6b8a-46a0-bd1f-ab0637f00288@suse.com>
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
 <ef8ca952-fe3a-4180-857b-7f4dd09b8259@suse.com>
 <9de84dd4-a137-4dcc-be57-7be953145f8f@citrix.com>
In-Reply-To: <9de84dd4-a137-4dcc-be57-7be953145f8f@citrix.com>

--------------Absri1TPo028au4c0mlytDiv
Content-Type: multipart/mixed; boundary="------------TikLrfM5ENn3uEftyK7zdzNI"

--------------TikLrfM5ENn3uEftyK7zdzNI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTAuMjMgMTI6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE3LzEwLzIw
MjMgNjoyNCBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDE2LjEwLjIzIDE4OjI0
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+ICtjb21tYW5kIHRvIGBgeGVuc3RvcmVkYGAu
wqAgVGhpcyBpbnN0cnVjdHMgYGB4ZW5zdG9yZWRgYCB0byBjb25uZWN0IHRvDQo+Pj4gdGhl
DQo+Pj4gK2d1ZXN0J3MgeGVuc3RvcmUgcmluZywgYW5kIGZpcmUgdGhlIGBgQGludHJvZHVj
ZURvbWFpbmBgIHdhdGNoLsKgIFRoZQ0KPj4+IGZpcmluZyBvZg0KPj4+ICt0aGlzIHdhdGNo
IGlzIHRoZSBzaWduYWwgdG8gYWxsIG90aGVyIGNvbXBvbmVudHMgd2hpY2ggY2FyZSB0aGF0
IGENCj4+PiBuZXcgVk0gaGFzDQo+Pj4gK2FwcGVhcmVkIGFuZCBpcyBhYm91dCB0byBzdGFy
dCBydW5uaW5nLg0KPj4NCj4+IEEgbm90ZSBzaG91bGQgYmUgYWRkZWQgdGhhdCB0aGUgY29u
dHJvbCBkb21haW4gaXMgaW50cm9kdWNlZCBpbXBsaWNpdGx5IGJ5DQo+PiB4ZW5zdG9yZWQs
IHNvIG5vIFhTX0lOVFJPRFVDRSBjb21tYW5kIGlzIG5lZWRlZCBhbmQgbm8gQGludHJvZHVj
ZURvbWFpbg0KPj4gd2F0Y2ggaXMgYmVpbmcgc2VudCBmb3IgdGhlIGNvbnRyb2wgZG9tYWlu
Lg0KPiANCj4gSG93IGRvZXMgdGhpcyB3b3JrIGZvciBhIHN0dWIgeGVuc3RvcmVkPyAgSXQg
Y2FuJ3Qga25vdyB0aGF0IGRvbTAgaXMNCj4gYWxpdmUsIGFuZCBpcyB0aGUgY29udHJvbCBk
b21haW4sIGFuZCBtdXN0bid0IGFzc3VtZSB0aGF0IHRoaXMgaXMgdHJ1ZS4NCg0KQSBzdHVi
IHhlbnN0b3JlZCBnZXRzIHRoZSBjb250cm9sIGRvbWFpbidzIGRvbWlkIHZpYSBhIGJvb3Qg
cGFyYW1ldGVyLg0KDQo+IEkgYWRtaXQgdGhhdCBJJ3ZlIGJlZW4gYSBiaXQgdmFndWUgaW4g
dGhlIGFyZWFzIHdoZXJlIEkgdGhpbmsgdGhlcmUgYXJlDQo+IHByZS1leGlzdGluZyBidWdz
LiAgVGhpcyBpcyBvbmUgYXJlYS4NCj4gDQo+IEknbSBwbGFubmluZyBhIHNlcGFyYXRlIGRv
Y3VtZW50IG9uICJob3cgdG8gY29ubmVjdCB0byB4ZW5zdG9yZSIgc2VlaW5nDQo+IGFzIGl0
IGlzIGJ1Z2d5IGluIG11bHRpcGxlIHdheXMgaW4gTGludXggKGNhdXNpbmcgYSBkZWFkbG9j
ayBvbiBib290DQo+IHdpdGggYSBzdHViIHhlbnN0b3JlZCksIGFuZCBtYWRlIHdvcnNlIGJ5
IGRvbTBsZXNzIGNyZWF0aW5nIG1lbW9yeQ0KPiBjb3JydXB0aW9uIGZyb20gYSAzcmQgZW50
aXR5IGludG8gdGhlIHhlbnN0b3JlZDwtPmtlcm5lbCBjb21tcyBjaGFubmVsLg0KPiANCj4g
KEFuZCBhcyBJJ3ZlIHNhaWQgbXVsdGlwbGUgdGltZXMgYWxyZWFkeSwgc2h1ZmZsaW5nIGNv
ZGUgaW4gb25lIG9mIHRoZQ0KPiB0d28geGVuc3RvcmVkJ3MgZG9lc24ndCBmaXggdGhlIHJv
b3Qgb2YgdGhlIGRvbTBsZXNzIGJ1Zy4gIEl0IHNpbXBseQ0KPiBzaHVmZmxlcyBpdCBhcm91
bmQgZm9yIHNvbWVvbmUgZWxzZSB0byB0cmlwIG92ZXIuKQ0KPiANCj4+IEFsbCBjb21wb25l
bnRzIGludGVyZXN0ZWQgaW4gdGhlIEBpbnRyb2R1Y2VEb21haW4gd2F0Y2ggaGF2ZSB0byBm
aW5kIG91dCBmb3INCj4+IHRoZW1zZWx2ZXMgd2hpY2ggbmV3IGRvbWFpbiBoYXMgYXBwZWFy
ZWQsIGFzIHRoZSB3YXRjaCBldmVudCBkb2Vzbid0IGNvbnRhaW4NCj4+IHRoZSBkb21pZCBv
ZiB0aGUgbmV3IGRvbWFpbi4NCj4gDQo+IFllcywgYnV0IHdlJ3JlIGludGVuZGluZyB0byBj
aGFuZ2UgdGhhdCwgYW5kIGl0IGlzIGRpdmVydGluZyBmb2N1cyBmcm9tDQo+IHRoZSBkb21h
aW4ncyBsaWZlY3ljbGUuDQo+IA0KPiBJIHN1cHBvc2UgSSBjb3VsZCBwdXQgaW4gYSBmb290
bm90ZSBkaXNjdXNzaW5nIHRoZSBzaW5nbGUtYml0LW5lc3Mgb2YNCj4gdGhlIHRocmVlIHNp
Z25hbHMuDQoNCkZpbmUgd2l0aCBtZS4gSSBqdXN0IHdhbnRlZCB0byBtZW50aW9uIHRoaXMg
ZGV0YWlsLg0KDQo+IA0KPj4+ICtjZWFzZWQgdG8gZXhpc3QuwqAgSXQgZmlyZXMgdGhlIGBg
QHJlbGVhc2VEb21haW5gYCB3YXRjaCBhIHNlY29uZCB0aW1lIHRvDQo+Pj4gK3NpZ25hbCB0
byBhbnkgY29tcG9uZW50cyB3aGljaCBjYXJlIHRoYXQgdGhlIGRvbWFpbiBoYXMgZ29uZSBh
d2F5Lg0KPj4+ICsNCj4+PiArRS5nLiBUaGUgc2Vjb25kIGBgQHJlbGVhc2VEb21haW5gYCBp
cyBjb21tb25seSB1c2VkIGJ5IHBhcmF2aXJ0dWFsDQo+Pj4gZHJpdmVyDQo+Pj4gK2JhY2tl
bmRzIHRvIHNodXQgdGhlbXNlbHZlcyBkb3duLg0KPj4NCj4+IFRoZXJlIGlzIG5vIGd1YXJh
bnRlZSB0aGF0IEByZWxlYXNlRG9tYWluIHdpbGwgYWx3YXlzIGJlIGZpcmVkIHR3aWNlIGZv
ciBhDQo+PiBkb21haW4gY2Vhc2luZyB0byBleGlzdCwNCj4gDQo+IEFyZSB5b3Ugc3VyZT8N
Cg0KWWVzLiBJZGVudGljYWwgcGVuZGluZyB3YXRjaCBldmVudHMgYXJlIGFsbG93ZWQgdG8g
YmUgbWVyZ2VkIGludG8gb25lLg0KDQo+IEJlY2F1c2UgdGhlIHRvb2xzdGFjayBuZWVkcyB0
byBsaXN0ZW4gdG8gQHJlbGVhc2VEb21haW4gaW4gb3JkZXIgdG8NCj4gc3RhcnQgY2xlYW51
cCwgdGhlcmUgd2lsbCBiZSB0d28gZGlzdGluY3QgQHJlbGVhc2VEb21haW4ncyBmb3IgYW4N
Cj4gaW5kaXZpZHVhbCBkb21haW4uDQo+ID4gQnV0IGFuIGluZGl2aWR1YWwgQHJlbGVhc2VE
b21haW4gY2FuIGJlIHJlbGV2YW50IGZvciBhIHN0YXRlIGNoYW5nZSBpbg0KPiBtb3JlIHRo
YW4gb25lIGRvbWFpbiwgc28gdGhlcmUgYXJlIG5vdCBuZWNlc3NhcnkgMipucl9kb21zIHdv
cnRoIG9mDQo+IEByZWxlYXNlRG9tYWluJ3MgZmlyZWQuDQoNCkNvcnJlY3QuDQoNCj4gDQo+
PiBhbmQgbXVsdGlwbGUgZG9tYWlucyBkaXNhcHBlYXJpbmcgbWlnaHQgcmVzdWx0IGluDQo+
PiBvbmx5IG9uZSBAcmVsZWFzZURvbWFpbiB3YXRjaCBiZWluZyBmaXJlZC4gVGhpcyBtZWFu
cyB0aGF0IGFueSBjb21wb25lbnQNCj4+IHJlY2VpdmluZyB0aGlzIHdhdGNoIGV2ZW50IGhh
dmUgbm90IG9ubHkgdG8gZmluZCBvdXQgdGhlIGRvbWlkKHMpIG9mIHRoZQ0KPj4gZG9tYWlu
cyBjaGFuZ2luZyBzdGF0ZSwgYnV0IHdoZXRoZXIgdGhleSBoYXZlIGJlZW4gc2h1dHRpbmcg
ZG93biBvbmx5LCBvcg0KPj4gYXJlIGNvbXBsZXRlbHkgZ29uZSwgdG9vLg0KPiANCj4gQWxs
IGVudGl0aWVzIGhvbGRpbmcgYSByZWZlcmVuY2Ugb24gdGhlIGRvbWFpbiB3aWxsIGJsb2Nr
IHRoZSBzZWNvbmQNCj4gbm90aWZpY2F0aW9uIHVudGlsIHRoZXkgaGF2ZSBwZXJmb3JtZWQg
dGhlaXIgb3duIHVubWFwIGFjdGlvbi4NCg0KWW91IGFyZSBhd2FyZSB0aGF0IGJhY2tlbmRz
IG5vcm1hbGx5IGRvbid0IHJlZ2lzdGVyIGZvciBAcmVsZWFzZURvbWFpbiwgYnV0DQpzZXQg
YSB3YXRjaCBvbiB0aGVpciBiYWNrZW5kIHNwZWNpZmljIFhlbnN0b3JlIG5vZGUgaW4gb3Jk
ZXIgdG8gcmVhY3Qgb24NCnRoZSB0b29sIHN0YWNrIHJlbW92aW5nIHRoZSBiYWNrZW5kIGRl
dmljZSBub2Rlcz8NCg0KPiBCdXQgZm9yIGVudGl0aWVzIHdoaWNoIGRvbid0IGhvbGQgYSBy
ZWZlcmVuY2Ugb24gdGhlIGRvbWFpbiwgdGhlcmUgaXMgYQ0KPiByYWNlIGNvbmRpdGlvbiB3
aGVyZSBpdCdzIEByZWxlYXNlRG9tYWluIG5vdGlmaWNhdGlvbiBpcyBkZWxpdmVyZWQNCj4g
c3VmZmljaWVudGx5IGxhdGUgdGhhdCB0aGUgZG9taWQgaGFzIGFscmVhZHkgZGlzYXBwZWFy
ZWQuDQoNCkV4YWN0bHkuDQoNCj4gSXQncyBjZXJ0YWlubHkgZ29vZCBjb2RpbmcgcHJhY3Rp
Y2UgdG8gY29wZSB3aXRoIHRoZSBkb21haW4gZGlzYXBwZWFyaW5nDQo+IGVudGlyZWx5IHVu
ZGVyZm9vdCwgYnV0IGVudGl0aWVzIHdpdGhvdXQgaGVsZCByZWZlcmVuY2VzIGRvbid0IHdh
dGNoDQo+IEByZWxlYXNlRG9tYWluIGluIHRoZSBmaXJzdCBwbGFjZSwgc28gSSBkb24ndCB0
aGluayB0aGlzIGNhc2Ugb2NjdXJzIGluDQo+IHByYWN0aWNlLg0KDQpJIGNvdWxkIGVhc2ls
eSBzZWUgdXNlIGNhc2VzIHdoZXJlIHRoaXMgYXNzdW1wdGlvbnMgaXNuJ3QgdHJ1ZSwgbGlr
ZSBhIGRhZW1vbg0Kc3VwZXJ2aXNpbmcgZG9tYWlucyBpbiBvcmRlciB0byByZXNwYXduIHRo
ZW0gaW4gY2FzZSB0aGV5IGhhdmUgZGllZC4NCg0KDQpKdWVyZ2VuDQo=
--------------TikLrfM5ENn3uEftyK7zdzNI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TikLrfM5ENn3uEftyK7zdzNI--

--------------Absri1TPo028au4c0mlytDiv--

--------------QhI01Ab42W4G6SUz0QebZO77
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUuZ1MFAwAAAAAACgkQsN6d1ii/Ey+R
dwf9H+xt5fCtWhQNz/dVGXGdEFmX1xgY00IYFpAIBzN3JdIIHFV2u4E72F4DAMLpoPCm5A11eIp2
yzAeZjwKxNYn6s2TPerPA7sLc7dkJbEyF8WU9icvHPyFE1zpQaYlK1qrBFtQSQP2mF8u2jD4V6wr
XVZoJq4XRtp2S2+rZt/SBUn7mgTtWkFPYoAYLvR8bikMYCsF4zn3wUj+l7z7qpO8MhQjuqCUOmlb
col8AbF045Py2DOL2F9LspCUz4nQ6geA+H9fLtHNGZe5LdPnwR8y1GDtqZ7mnTEv2Jd2E1VauFY6
TnsKl0cyXFPsxTJbrJ3Fg8Nj3FGA6qM1WN2JohmDIg==
=/oYA
-----END PGP SIGNATURE-----

--------------QhI01Ab42W4G6SUz0QebZO77--

