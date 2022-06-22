Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7245550D7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 18:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354187.581240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42rs-000107-Uu; Wed, 22 Jun 2022 16:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354187.581240; Wed, 22 Jun 2022 16:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42rs-0000xl-Ro; Wed, 22 Jun 2022 16:06:12 +0000
Received: by outflank-mailman (input) for mailman id 354187;
 Wed, 22 Jun 2022 16:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o42rq-0000wG-UU
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 16:06:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 376f9331-f245-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 18:06:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A7AC21AD1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 16:06:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 67A54134A9
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 16:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GmYCGOs9s2IMCQAAMHmgww
 (envelope-from <jgross@suse.com>)
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 16:06:03 +0000
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
X-Inumbo-ID: 376f9331-f245-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655913963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VXTOCtPUj5Vxvf3dGmXU7hcSkOfx3s8UuTvMiX0clR4=;
	b=IlOSTyxJZeRiGshFH/YrRmyJqWbC2Q37oxPcJGI5+IHy0qqkTAV88IMnebsv9eC01rFG6f
	djraa9AQARQPwJiRKDu2wXCqiVX5DYUiV+67hbmwQfs5Kd8ic+OJUTZrGYbjr7sBUdpHHM
	GWSLynK9sBPtCV6L/asf7zxe8PMKjqM=
Message-ID: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
Date: Wed, 22 Jun 2022 18:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Juergen Gross <jgross@suse.com>
Subject: Problem loading linux 5.19 as PV dom0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bSX0hyZEUvPsxqcqd6yQo2HF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bSX0hyZEUvPsxqcqd6yQo2HF
Content-Type: multipart/mixed; boundary="------------DM5VH0sM33To1uGUngcOySm0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
Subject: Problem loading linux 5.19 as PV dom0

--------------DM5VH0sM33To1uGUngcOySm0
Content-Type: multipart/mixed; boundary="------------hoDaLF9BU1jqQsrbGKsJvIHD"

--------------hoDaLF9BU1jqQsrbGKsJvIHD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QSBMaW51eCBrZXJuZWwgNS4xOSBjYW4gb25seSBiZSBsb2FkZWQgYXMgZG9tMCwgaWYgaXQg
aGFzIGJlZW4NCmJ1aWx0IHdpdGggQ09ORklHX0FNRF9NRU1fRU5DUllQVCBlbmFibGVkLiBU
aGlzIGlzIGR1ZSB0byB0aGUNCmZhY3QgdGhhdCBvdGhlcndpc2UgdGhlIChyZWxldmFudCkg
bGFzdCBzZWN0aW9uIG9mIHRoZSBidWlsdA0Ka2VybmVsIGhhcyB0aGUgTk9MT0FEIGZsYWcg
c2V0IChpdCBpcyBzdGlsbCBtYXJrZWQgd2l0aA0KU0hGX0FMTE9DKS4NCg0KSSB0aGluayBh
dCBsZWFzdCB0aGUgaHlwZXJ2aXNvciBuZWVkcyB0byBiZSBjaGFuZ2VkIHRvIHN1cHBvcnQN
CnRoaXMgbGF5b3V0LiBPdGhlcndpc2UgaXQgd2lsbCBwdXQgdGhlIGluaXRpYWwgcGFnZSB0
YWJsZXMgZm9yDQpkb20wIGF0IHRoZSBzYW1lIHBvc2l0aW9uIGFzIHRoaXMgbGFzdCBzZWN0
aW9uLCBsZWFkaW5nIHRvDQplYXJseSBjcmFzaGVzLg0KDQpBIHdvcmthcm91bmQgaW4gdGhl
IGtlcm5lbCB3b3VsZCBiZSB0byBhbHdheXMgYWRkIGEgc21hbGwNCnNlY3Rpb24gYXQgdGhl
IGVuZCB3aGljaCBuZWVkcyB0byBiZSBsb2FkZWQgKGxpa2UgaXMgZG9uZQ0Kd2l0aCBDT05G
SUdfQU1EX01FTV9FTkNSWVBUIHNldCksIGJ1dCBJIGRvbid0IHRoaW5rIHdlIGNhbg0KcHV0
IHRoaXMgYnVyZGVuIG9uIGFsbCBndWVzdHMgYmVpbmcgY2FwYWJsZSB0byBydW4gaW4gUFYN
Cm1vZGUuDQoNCkkgaGF2ZW4ndCB0ZXN0ZWQgeWV0LCB3aGV0aGVyIHVucHJpdmlsZWdlZCBQ
ViBndWVzdHMgYXJlDQphZmZlY3RlZCwgdG9vLg0KDQoNCkp1ZXJnZW4NCg==
--------------hoDaLF9BU1jqQsrbGKsJvIHD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------hoDaLF9BU1jqQsrbGKsJvIHD--

--------------DM5VH0sM33To1uGUngcOySm0--

--------------bSX0hyZEUvPsxqcqd6yQo2HF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKzPeoFAwAAAAAACgkQsN6d1ii/Ey9P
Ewf/RmRogEs423+ApvlZhD6tt14aKwlarLN+TFt5JlTxmUNHQSzxY3GuXI28WlLsHco/7zylTVOe
tMmhn7N142rOk43PkdLH5hGZVLCodGz+c6AZ+2U+QxcMdSFvi0O+GlTAXVTkDiJuxtQu/BqfO65x
KL+FrnYU0789j76uxdynpRtH6fJdAlLRIZQ4peGgHgsg7ia6s1Rj7k3C0oC2C2bvIUClgu/I5n0p
KYXuriRtqEwCKQVeVPaDT7ad6Qk5jAWacUGZZKkE1ou9+XJHrg7kade7Hu5pSsj6EILo7LyxpyvN
kHIc+dr7/ZbD2Z9sQX2Y8xJmFZPNxSLPYZl/tnLn1A==
=GDFh
-----END PGP SIGNATURE-----

--------------bSX0hyZEUvPsxqcqd6yQo2HF--

