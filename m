Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376807C88C2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616699.958944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKBS-0002a1-BZ; Fri, 13 Oct 2023 15:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616699.958944; Fri, 13 Oct 2023 15:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKBS-0002Xb-8N; Fri, 13 Oct 2023 15:34:38 +0000
Received: by outflank-mailman (input) for mailman id 616699;
 Fri, 13 Oct 2023 15:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrKBR-0002XV-DO
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:34:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03976358-69de-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 17:34:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5076621A0B;
 Fri, 13 Oct 2023 15:34:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F248A138EF;
 Fri, 13 Oct 2023 15:34:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pm63OYpjKWWYUQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 15:34:34 +0000
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
X-Inumbo-ID: 03976358-69de-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697211275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F6Md9QExDZqcGxp8dHgqXa6IRcNmr2XByAD1FiMZlNk=;
	b=UlBv5NgSQePTXzJFBhx58WfyXGbwqUYkeDwyQ2OxnSMVxqPcuf4FJuLtjCNkYEZk5Je3UB
	SsMAZRLh21wKq8UbdKJz+9WAdD9FRsLBLv+TB98U6peKfP+EWuB94CysqX6C72oEmTeat/
	kUjbw0601wlE0WwfCDiTcOzj6b5ZDXc=
Message-ID: <e3ff056d-9fa9-4ad9-b8b1-0b33e444c6f7@suse.com>
Date: Fri, 13 Oct 2023 17:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
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
 <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
 <CA+zSX=bLbYhL7KRKpqfwoO=CRtEkT1bKMLo0Fu5nna0w_==NRA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=bLbYhL7KRKpqfwoO=CRtEkT1bKMLo0Fu5nna0w_==NRA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WXY1NZn9Kua920w2mQhPr4I0"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.87
X-Spamd-Result: default: False [-6.87 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.88)[85.77%];
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
--------------WXY1NZn9Kua920w2mQhPr4I0
Content-Type: multipart/mixed; boundary="------------PnoUSbBXxcZloqNbafYyLs08";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
Message-ID: <e3ff056d-9fa9-4ad9-b8b1-0b33e444c6f7@suse.com>
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
 <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
 <CA+zSX=bLbYhL7KRKpqfwoO=CRtEkT1bKMLo0Fu5nna0w_==NRA@mail.gmail.com>
In-Reply-To: <CA+zSX=bLbYhL7KRKpqfwoO=CRtEkT1bKMLo0Fu5nna0w_==NRA@mail.gmail.com>

--------------PnoUSbBXxcZloqNbafYyLs08
Content-Type: multipart/mixed; boundary="------------Hg6NdtPtWjhpy2T7c2nM1kkK"

--------------Hg6NdtPtWjhpy2T7c2nM1kkK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjMgMTc6MTYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIEZyaSwgT2N0
IDEzLCAyMDIzIGF0IDQ6MDTigK9QTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4+Pj4gVGVjaG5pY2FsbHksIGRvbTAgaGFzIGV4YWN0bHkgdGhlIHNhbWUg
cHJvYmxlbSBhcyBkb20wbGVzcyBkb21haW5zIGl0IGJvb3RzDQo+Pj4+PiBiZWZvcmUgWGVu
c3RvcmVkIGlzIHJ1bm5pbmcgYW5kIHRoZXJlZm9yZSBpdCBtYXkgbmVlZCB0byBrbm93IHdo
ZW4gaXQgaXMNCj4+Pj4+IHJlYWR5IHRvIHJlY2VpdmUgY29tbWFuZHMuDQo+Pj4+DQo+Pj4+
IFVtbSwgbm8sIG5vdCByZWFsbHkuDQo+Pj4+DQo+Pj4+IFRoZSBtYWluIGRpZmZlcmVuY2Ug
YmV0d2VlbiBkb20wIGFuZCBhIGRvbTBsZXNzIGRvbVUgaXMsIHRoYXQgeGVuc3RvcmVkDQo+
Pj4+IGludHJvZHVjZXMgZG9tMCBieSBpdHNlbGYgdmlhIGEgY2FsbCBvZiBkb20wX2luaXQo
KSwgd2hpbGUgdGhlIGRvbTBsZXNzDQo+Pj4+IGRvbVVzIGdldCBpbnRyb2R1Y2VkIGJ5IFhl
biB0b29scyBpbiBjYXNlIGEgZG9tMCBpcyBjb21pbmcgdXAgbGF0ZXIuIEFuZA0KPj4+PiB0
aGF0IFhTX0lOVFJPRFVDRSB3aWxsIGNsb2JiZXIgYW55IHJpbmcgcGFnZSBjb250ZW50cywg
d2hpbGUgYSBjYWxsIG9mDQo+Pj4+IGRvbTBfaW5pdCgpIHdvbid0IGRvIHRoYXQuDQo+Pj4+
DQo+Pj4+IERvbTAgKGVzcGVjaWFsbHkgdGhlIGtlcm5lbCkgaXMgZmluZSB0byBzdGFydCBm
aWxsaW5nIHRoZSByaW5nIHBhZ2Ugd2l0aA0KPj4+PiByZXF1ZXN0cyBldmVuIGJlZm9yZSB4
ZW5zdG9yZWQgaXMgcnVubmluZy4gSXQganVzdCBzaG91bGRuJ3QgZXhwZWN0IHRvDQo+Pj4+
IHJlY2VpdmUgYW55IHJlc3BvbnNlcyByaWdodCBhd2F5Lg0KPj4+IEkgYW0gbm90IHN1cmUg
d2hhdCB5b3UgbWVhbiBieSBmaW5lLiBZb3Ugd2lsbCBzZWUgaGFuZyBub3RpZmljYXRpb25z
IGlmDQo+Pj4gWGVuc3RvcmVkIGlzIG5vdCBzdGFydGVkIGluIHRpbWUuIElzbid0IHdoeSB3
ZSBkZWNpZGVkIHRvIGdvIHdpdGggYSBkaWZmZXJlbnQNCj4+PiB3YXkgZm9yIGRvbTBsZXNz
Pw0KPj4NCj4+IFRoZSBtYWluIGRpZmZlcmVuY2UgaXMgdGhhdCBkb20wIHRlbGxzIHhlbnN0
b3JlZCB0aGUgY29ubmVjdGlvbiBwYXJhbWV0ZXJzIGZvcg0KPj4gaXRzZWxmLCBzbyBkb20w
IF9rbm93c18gdGhhdCB0aGUgcmluZyBwYWdlIGlzIHNldHVwIGNvcnJlY3RseSB3aGVuIHhl
bnN0b3JlZA0KPj4gc3RhcnRzIGxvb2tpbmcgYXQgaXQgKGl0IGlzIGRvbTAgd2hpY2ggbmVl
ZHMgdG8gZG8gdGhlIHJpbmcgcGFnZSBpbml0KS4NCj4+DQo+PiBBIGRvbTBsZXNzIGRvbVUg
ZG9lc24ndCBoYXZlIHRoYXQgbmVnb3RpYXRpb24gd2l0aCB4ZW5zdG9yZWQsIGFzIHhlbnN0
b3JlZCBqdXN0DQo+PiB1c2VzIHRoZSBwcmUtZGVmaW5lZCBncmFudCBmb3IgbG9va2luZyBh
dCB0aGUgcmluZyBwYWdlLiBGb3IgdGhlIGRvbVUgdGhlcmUgaXMNCj4+IG5vIHdheSB0byB0
ZWxsIHRoYXQgeGVuc3RvcmVkIGhhcyBpbml0aWFsaXplZCB0aGUgcmluZyBwYWdlIChpdCBp
cyBub3QgdGhlIGRvbVUNCj4+IHRvIGRvIHRoZSBpbml0aWFsaXphdGlvbiwgYXMgdGhlIFhT
X0lOVFJPRFVDRSBtaWdodCBiZSBzZW50IGJlZm9yZSB0aGUgZG9tVQ0KPj4gZXZlbiBzdGFy
dHMgcnVubmluZyksIG90aGVyIHRoYW4gdGhlICJjb25uZWN0ZWQiIGluZGljYXRvciBpbiB0
aGUgcGFnZSBpdHNlbGYuDQo+IA0KPiBBbnkgdGhvdWdodHMgb24gbXkgcGF0Y2g/ICBGcm9t
IHlvdXIgZGVzY3JpcHRpb24sIGl0IHNvdW5kcyBsaWtlIG1heWJlDQo+IGl0IHNob3VsZCBi
ZSBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLCBhbHRob3VnaCBpdCdzIGN1cnJlbnRseSBtaXNz
aW5nDQo+IG1lbW9yeSBiYXJyaWVycy4NCg0KWWVzLCBJIHRoaW5rIHRoZSBwYXRjaCBpcyBi
YXNpY2FsbHkgb2theSAoYXBhcnQgZnJvbSB0aGUgYmFycmllcnMpLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------Hg6NdtPtWjhpy2T7c2nM1kkK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Hg6NdtPtWjhpy2T7c2nM1kkK--

--------------PnoUSbBXxcZloqNbafYyLs08--

--------------WXY1NZn9Kua920w2mQhPr4I0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUpY4oFAwAAAAAACgkQsN6d1ii/Ey/H
+wf/Z3M+24vzwapCbmX0iEpD2O6XqYL0CL0B8Kp1GLziy8mQg7+kiSqz9j6eNzyWc9vIqEh/leiC
MuwYGfyzpR97c2edgntpdQbP4UlqBZ0C74mrWQd5QBDB3uwK3U9PMGdwnytm8kIs0D2TO2HpeO9e
0BG3e3E/wHkYjNdP6JU5QO3XhSjYjBONj/dOYDo+nUCaK4Mqzk5nCVJ/2qai1j3k3Bxurm8XMyk0
HeJl8D/jerDVmfeK98o9jY6bxzSuhDC95kqYfIfA6Idhes3t9HY0uhsWk4MnmRL1NsCA/4uafnLD
hDqT18UIL+RztK2wQ9grrTL5ay2h4EGlR0rbPNxxnw==
=1O3b
-----END PGP SIGNATURE-----

--------------WXY1NZn9Kua920w2mQhPr4I0--

