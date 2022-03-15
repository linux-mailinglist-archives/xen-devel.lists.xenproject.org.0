Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F044D9749
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 10:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290691.493086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU3E8-0002cK-Eg; Tue, 15 Mar 2022 09:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290691.493086; Tue, 15 Mar 2022 09:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU3E8-0002Zk-Ba; Tue, 15 Mar 2022 09:12:24 +0000
Received: by outflank-mailman (input) for mailman id 290691;
 Tue, 15 Mar 2022 09:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDYY=T2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nU3E6-0002Ze-L2
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 09:12:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdaebd66-a43f-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 10:12:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6618421901;
 Tue, 15 Mar 2022 09:12:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1037013B4E;
 Tue, 15 Mar 2022 09:12:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wCqkAmhYMGKoeAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 15 Mar 2022 09:12:08 +0000
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
X-Inumbo-ID: fdaebd66-a43f-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647335528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcbkZVqaOrCkFX57kjDdpHCszAiSvLyzmm9ad99vOOs=;
	b=haUHfMnTLlQMLvhaSpZbj7ma3s/Oj+TAUd08AH9jC13ymqFOIa5cHQNCxg48TZ6l353njY
	cXxyccLiEjbJ8KomPEkwHouvN9U8TDi8c7cklyy9JoVYiGrdpfEWowoPrl3IET4oqOD14+
	YmN2t/0jBNkLn/zFIpQlqR7DDiAFyi0=
Message-ID: <d2b97836-4a63-e81d-1b84-c7779bb95b76@suse.com>
Date: Tue, 15 Mar 2022 10:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2203101957370.3497@ubuntu-linux-20-04-desktop>
 <A34CF75A-8139-4A4A-A1AE-3BA74E70DE55@arm.com>
 <alpine.DEB.2.22.394.2203111600330.3497@ubuntu-linux-20-04-desktop>
 <aee7dedf-3f70-da48-8be5-3d7cc9ec392c@suse.com>
 <927CBDC0-4141-4964-84E3-8AF1ED491527@arm.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <927CBDC0-4141-4964-84E3-8AF1ED491527@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SASOe40gDflniFGIPMpnSPS0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SASOe40gDflniFGIPMpnSPS0
Content-Type: multipart/mixed; boundary="------------ZH53dJm4qcVDFEB6cZZT32OV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <d2b97836-4a63-e81d-1b84-c7779bb95b76@suse.com>
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2203101957370.3497@ubuntu-linux-20-04-desktop>
 <A34CF75A-8139-4A4A-A1AE-3BA74E70DE55@arm.com>
 <alpine.DEB.2.22.394.2203111600330.3497@ubuntu-linux-20-04-desktop>
 <aee7dedf-3f70-da48-8be5-3d7cc9ec392c@suse.com>
 <927CBDC0-4141-4964-84E3-8AF1ED491527@arm.com>
In-Reply-To: <927CBDC0-4141-4964-84E3-8AF1ED491527@arm.com>

--------------ZH53dJm4qcVDFEB6cZZT32OV
Content-Type: multipart/mixed; boundary="------------N18Dp0koENvntFmM0ZlwYzc5"

--------------N18Dp0koENvntFmM0ZlwYzc5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDMuMjIgMDk6NDAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPj4gSG1tLCB0
aGlzIHdpbGwgZmFpbCB0aGUgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZjcHVwb29sX2xvY2sp
KSBpbg0KPj4gX19jcHVwb29sX2ZpbmRfYnlfaWQoKS4NCj4+DQo+PiBJIHRoaW5rIHlvdSBu
ZWVkIHRvIHVzZSBjcHVwb29sX2dldF9ieV9pZCgpIGFuZCBjcHVwb29sX3B1dCgpIGJ5IG1h
a2luZyB0aGVtDQo+PiBnbG9iYWxseSB2aXNpYmxlIChtb3ZlIHRoZWlyIHByb3RvdHlwZXMg
dG8gc2NoZWQuaCkuDQo+IA0KPiBIaSBKdWVyZ2VuLA0KPiANCj4gWWVzIEkgd2FzIHRoaW5r
aW5nIG1vcmUgdG8gYSBfX2luaXQgd3JhcHBlciB0aGF0IHRha2VzIHRoZSBsb2NrIGFuZCBj
YWxscyBfX2NwdXBvb2xfZmluZF9ieV9pZCwNCj4gdGhpcyB0byBhdm9pZCBleHBvcnRpbmcg
Y3B1cG9vbF9wdXQgb3V0c2lkZSBzaW5jZSB3ZSB3b3VsZCBiZSB0aGUgb25seSB1c2VyLg0K
PiBCdXQgSSB3b3VsZCBsaWtlIHlvdXIgb3BpbmlvbiBvbiB0aGF0Lg0KDQpJJ2QgYmUgZmlu
ZSB3aXRoIHRoYXQuDQoNCg0KSnVlcmdlbg0K
--------------N18Dp0koENvntFmM0ZlwYzc5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------N18Dp0koENvntFmM0ZlwYzc5--

--------------ZH53dJm4qcVDFEB6cZZT32OV--

--------------SASOe40gDflniFGIPMpnSPS0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIwWGcFAwAAAAAACgkQsN6d1ii/Ey/A
Mgf/Tnrk8KR3JbY/WmiFQFPVRlEgr8+rHqfGH9RaV+EO60ODsWEAhiUYhMvAqd3q8fvvVMeV/Yyz
sslNKa3S7F7468suH1UE983k7UrFz5IQaxtupi8OOVuPOyJOXbPTpGALHYfTZidr0v12BI4XZdVx
39ofv3pEfJxOMgCf5QtxR6bxo+0a59F1yn+HsNvNetyr/GIWDZ055Ya5bw4RO22rSGeGI3GhAe6r
XSPjsAJn1gdKjGQ0tsySjs/QhnIt84ZPsu+eF1jKNg02LL+Glz/azEhNCZTjTC4cVi8jQwuhC6Qx
zNAfD6kCGqNL+tiNAb7IOUo/lubjUqK/lajQ5vLhMw==
=INxy
-----END PGP SIGNATURE-----

--------------SASOe40gDflniFGIPMpnSPS0--

