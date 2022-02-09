Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910AC4AF39B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 15:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269216.463241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHna7-0006qv-L7; Wed, 09 Feb 2022 14:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269216.463241; Wed, 09 Feb 2022 14:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHna7-0006oV-HI; Wed, 09 Feb 2022 14:04:27 +0000
Received: by outflank-mailman (input) for mailman id 269216;
 Wed, 09 Feb 2022 14:04:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sex7=SY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHna6-0006bN-6Y
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 14:04:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3043c36a-89b1-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 15:04:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49597210F8;
 Wed,  9 Feb 2022 14:04:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E51E13D45;
 Wed,  9 Feb 2022 14:04:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IaZZBenJA2L8WwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 09 Feb 2022 14:04:25 +0000
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
X-Inumbo-ID: 3043c36a-89b1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644415465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j1bKE5dMkAJMBwnrWS3L5NoHlJMXSAuoiOf9LQQXicA=;
	b=EydqzokNzevOVkl/1kf+RvZUJhY3PvtT/hh89bedEbRep+ZfdxvUMjjCCqce0DziS4qyOX
	trnlg6Ix1tZZuL0mijd8akBcPd51Neur70iRT8HSkl5CLifycz+6l1qxy59XWR1KE3Zmrc
	wWlNnXIgEIhPImohm7p8Ru4qkbB1Dy8=
Message-ID: <676bf729-897f-4bba-a339-4981149d32f1@suse.com>
Date: Wed, 9 Feb 2022 15:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Content-Language: en-US
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JT3PkbcluT08qvNSXm0sUr2Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JT3PkbcluT08qvNSXm0sUr2Q
Content-Type: multipart/mixed; boundary="------------rPxkqgwVVE25pb3siSSUq0pP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>
Message-ID: <676bf729-897f-4bba-a339-4981149d32f1@suse.com>
Subject: Re: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>

--------------rPxkqgwVVE25pb3siSSUq0pP
Content-Type: multipart/mixed; boundary="------------bzaSrICMokbEUZkCM8XKk3Cm"

--------------bzaSrICMokbEUZkCM8XKk3Cm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDIuMjIgMTk6MDAsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBsaWJ4ZW5o
eXBmcyB3aWxsIHJldHVybiBibG9iIHByb3BlcnRpZXMgYXMgaXMuIFRoaXMgb3V0cHV0IGNh
biBiZSB1c2VkDQo+IHRvIHJldHJpZXZlIGluZm9ybWF0aW9uIGZyb20gdGhlIGh5cGZzLiBD
YWxsZXIgaXMgcmVzcG9uc2libGUgZm9yDQo+IHBhcnNpbmcgcHJvcGVydHkgdmFsdWUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9tb2lzaWVp
ZXZAZXBhbS5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------bzaSrICMokbEUZkCM8XKk3Cm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------bzaSrICMokbEUZkCM8XKk3Cm--

--------------rPxkqgwVVE25pb3siSSUq0pP--

--------------JT3PkbcluT08qvNSXm0sUr2Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIDyegFAwAAAAAACgkQsN6d1ii/Ey9x
fgf+IITqSowb+5YzF9DA3f5Tv5hZ1kbFHLVcF/6BzzI7z/QvMbhEnu5zsgZe4BoQrv5QacfJdMzB
U9jo4VHNV19nX8XCosx4J3CTXJFVnEFJkPknK54eAcPzJyY5X+C1Npa+rvBM2aVT73WU0YH9wXus
DmCrSyG3EZsbT4Z/VzudSMQCY9Bb21gDonMT9HlYLll+sJE+AYT+A1zTnP5yNuo/iHS5HUHNnRfr
3DJr0QE3iLqwQz9BLZhE+OMdLpeweB5ItFL5JjTOGMwpPigd1/mvAchKpsYFGlflirfjTeBKdFgy
9kO6Vi2boOtkIO9Eo1mtIELP3GKCA40U3px2FvHqwA==
=UM5v
-----END PGP SIGNATURE-----

--------------JT3PkbcluT08qvNSXm0sUr2Q--

