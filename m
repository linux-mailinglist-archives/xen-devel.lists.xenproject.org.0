Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579BE591F23
	for <lists+xen-devel@lfdr.de>; Sun, 14 Aug 2022 10:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386645.622611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oN98R-0002Wt-Sb; Sun, 14 Aug 2022 08:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386645.622611; Sun, 14 Aug 2022 08:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oN98R-0002Ui-Pi; Sun, 14 Aug 2022 08:38:15 +0000
Received: by outflank-mailman (input) for mailman id 386645;
 Sun, 14 Aug 2022 08:38:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AepH=YS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oN98P-0000pr-OY
 for xen-devel@lists.xenproject.org; Sun, 14 Aug 2022 08:38:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f058a3b-1bac-11ed-924f-1f966e50362f;
 Sun, 14 Aug 2022 10:38:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBAC53482E;
 Sun, 14 Aug 2022 08:38:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5833713AAE;
 Sun, 14 Aug 2022 08:38:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WwaTE3S0+GIvNwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 14 Aug 2022 08:38:12 +0000
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
X-Inumbo-ID: 6f058a3b-1bac-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660466292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8fM5+MPNUeGLIT6O7/15uwJLNwTIn6SPpYZGmI3ecg=;
	b=K0rw2WyRrTu1kWAiNMSWSLT/wyrMs1ts0fkWBhv9Al0Np2jUlOyLXugcyswBzjCBEi/KTG
	lFjMLApmx71OcnFaFIYA/XNaZDARW0T65XXeXIrOUB3koJm1cIcYVX3+LspsdaPhOzKlih
	6rKS3MeO39Adk1wG99SPH8VRM5obX3k=
Message-ID: <755f368b-5336-7030-af24-e043bfa30b4d@suse.com>
Date: Sun, 14 Aug 2022 10:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] xen: remove XEN_SCRUB_PAGES in xen.config
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
 <20220810050712.9539-3-lukas.bulwahn@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220810050712.9539-3-lukas.bulwahn@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------43uZYYecjvDtuGdHMMiYvkgl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------43uZYYecjvDtuGdHMMiYvkgl
Content-Type: multipart/mixed; boundary="------------BS0EuEoijxJ8LBVmfywnV6u1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <755f368b-5336-7030-af24-e043bfa30b4d@suse.com>
Subject: Re: [PATCH 2/4] xen: remove XEN_SCRUB_PAGES in xen.config
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
 <20220810050712.9539-3-lukas.bulwahn@gmail.com>
In-Reply-To: <20220810050712.9539-3-lukas.bulwahn@gmail.com>

--------------BS0EuEoijxJ8LBVmfywnV6u1
Content-Type: multipart/mixed; boundary="------------Dn80PfvD4wm5ghDchxBMthVr"

--------------Dn80PfvD4wm5ghDchxBMthVr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDguMjIgMDc6MDcsIEx1a2FzIEJ1bHdhaG4gd3JvdGU6DQo+IENvbW1pdCAxOTdl
Y2IzODAyYzAgKCJ4ZW4vYmFsbG9vbjogYWRkIHJ1bnRpbWUgY29udHJvbCBmb3Igc2NydWJi
aW5nDQo+IGJhbGxvb25lZCBvdXQgcGFnZXMiKSBjaGFuZ2VkIGNvbmZpZyBYRU5fU0NSVUJf
UEFHRVMgdG8gY29uZmlnDQo+IFhFTl9TQ1JVQl9QQUdFU19ERUZBVUxULiBBcyB4ZW4uY29u
ZmlnIHNldHMgJ1hFTl9CQUxMT09OPXknIGFuZA0KPiBYRU5fU0NSVUJfUEFHRVNfREVGQVVM
VCBkZWZhdWx0cyB0byB5ZXMsIHRoZXJlIGlzIG5vIGZ1cnRoZXIgbmVlZCB0byBzZXQNCj4g
dGhpcyBjb25maWcgaW4gdGhlIHhlbi5jb25maWcgZmlsZS4NCj4gDQo+IFJlbW92ZSBzZXR0
aW5nIFhFTl9TQ1JVQl9QQUdFUyBpbiB4ZW4uY29uZmlnLCB3aGljaCBpcyB3aXRob3V0DQo+
IGVmZmVjdCBzaW5jZSB0aGUgY29tbWl0IGFib3ZlIGFueXdheS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPg0KDQpQdXNo
ZWQgdG8geGVuL3RpcC5naXQgZm9yLWxpbnVzLTYuMA0KDQoNCkp1ZXJnZW4NCg==
--------------Dn80PfvD4wm5ghDchxBMthVr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Dn80PfvD4wm5ghDchxBMthVr--

--------------BS0EuEoijxJ8LBVmfywnV6u1--

--------------43uZYYecjvDtuGdHMMiYvkgl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL4tHMFAwAAAAAACgkQsN6d1ii/Ey//
Igf/clu5UPmsjzgzDpUxYL4RzDpZwCPGZwEtEPNoo6+XdnHVXClGDirCFpIaatk361rGv7UK9Xdc
gVxd2gJ+n1Q/T0rhwARGFBAwveiu5YXly9oKGkzc/456CyWuVahO0z1yGhVsoEYxH51vOz3o4hAd
oIkOqNKuCo3zcGpceEwszIkaz3xehYjUNto1+g7E+EOEv3BJHYXk2wV+P9+TOJKHLTqQdx49cm+I
jj9+W2S32MwqjSem4uAqZ/jblUkSxGH0hzDwPk33u8bv3KNndM2MNUD7/hkxlSzuxU+P2bBzSGMk
LYmz2AhS46yvrjmM+1+LF2asRxJlC24ndo4gnVcMvQ==
=9Fkt
-----END PGP SIGNATURE-----

--------------43uZYYecjvDtuGdHMMiYvkgl--

