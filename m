Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4E6C8B2C
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 06:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514548.796910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfwls-0008GX-Qa; Sat, 25 Mar 2023 05:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514548.796910; Sat, 25 Mar 2023 05:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfwls-0008DH-Ly; Sat, 25 Mar 2023 05:48:56 +0000
Received: by outflank-mailman (input) for mailman id 514548;
 Sat, 25 Mar 2023 05:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pUjb=7R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfwlq-00088z-GS
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 05:48:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b92c93bb-cad0-11ed-85db-49a42c6b2330;
 Sat, 25 Mar 2023 06:48:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FC6A1FDFB;
 Sat, 25 Mar 2023 05:48:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F3FE133E5;
 Sat, 25 Mar 2023 05:48:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FKiXGUSLHmRwWQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 25 Mar 2023 05:48:52 +0000
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
X-Inumbo-ID: b92c93bb-cad0-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679723332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rh3OnUnruqhVNyJ0+NS16iveJwjiA3QaPE6WClVe5hU=;
	b=cZPyKTLM6cglLCCkZoAdBw83Fah4ravUSLvIakEA6bWWDlzzg6exFkzUVUQL3gqywNO7Jx
	S3NeFwxvBzH2jABUi9m1FxXIZECDVmWY15pqgiWZD/xH2gYehHOspBd3rvjj7JsGaQ0Vqj
	E1FJw7TyaDFgwDZeUS41K03V82t2Q/g=
Message-ID: <d289030a-6e98-816d-e6ae-cd4b84c7001e@suse.com>
Date: Sat, 25 Mar 2023 06:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [adhoc test] 179924: trouble: blocked/broken/fail/pass
Content-Language: en-US
To: aperard@xenbits.xen.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
References: <E1pfmrI-0002EP-DR@osstest.test-lab.xenproject.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <E1pfmrI-0002EP-DR@osstest.test-lab.xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UUNg6SJBQ8SpA9FLnnsLOYV6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UUNg6SJBQ8SpA9FLnnsLOYV6
Content-Type: multipart/mixed; boundary="------------FGa8T9vbPwNno9Z7u1ny1Fps";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: aperard@xenbits.xen.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
Message-ID: <d289030a-6e98-816d-e6ae-cd4b84c7001e@suse.com>
Subject: Re: [adhoc test] 179924: trouble: blocked/broken/fail/pass
References: <E1pfmrI-0002EP-DR@osstest.test-lab.xenproject.org>
In-Reply-To: <E1pfmrI-0002EP-DR@osstest.test-lab.xenproject.org>

--------------FGa8T9vbPwNno9Z7u1ny1Fps
Content-Type: multipart/mixed; boundary="------------7pHDsrw2SAj0GZrLS43nlQ5i"

--------------7pHDsrw2SAj0GZrLS43nlQ5i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjMgMjA6MTMsIGFwZXJhcmRAeGVuYml0cy54ZW4ub3JnIHdyb3RlOg0KPiBb
YWRob2MgcGxheV0gPG9zc3Rlc3QgbWFzdGVyIC9kZXYvcHRzLzE2Pg0KPiBoYXJuZXNzIGVk
MWQ4ZGU0OiBQRFUvSVBNSTogQmUgbGVzcyBhZ2dyZXNzaXZlIHdpdGggSVBNSSBjb21tYW5k
cw0KPiAxNzk5MjQ6IHRyb3VibGU6IGJsb2NrZWQvYnJva2VuL2ZhaWwvcGFzcw0KPiANCj4g
ZmxpZ2h0IDE3OTkyNCBsaW51eC1saW51cyBwbGF5IFtwbGF5XQ0KPiBodHRwOi8vbG9ncy50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTc5OTI0Lw0KDQpTZWVtcyB0
aGUgbWFpbiBwcm9ibGVtIGlzIGdvbmUgbm93Lg0KDQpUaGUgcGF0Y2ggaGFzIGFub3RoZXIg
aXNzdWUsIGJ1dCB0aGlzIGNhbiBiZSBmaXhlZCBlYXNpbHkgKHRoZSBwZXINCnNrYiBjb3B5
X2NvdW50IG5lZWRzIG5vdCB0byBiZSBpbmNyZW1lbnRlZCB3aGVuIHRoZSBjb3B5IGlzIGJl
aW5nDQpzcGxpdCwgYXMgb3RoZXJ3aXNlIHRoZSBwZW5kaW5nX2lkeCBhcnJheSBtaWdodCBi
ZSBvdmVycnVuKS4NCg0KQW50aG9ueSwgdGhhbmtzIGZvciBzZXR0aW5nIHVwIHRoZSB0ZXN0
IHJ1bnMhDQoNCg0KSnVlcmdlbg0KDQo=
--------------7pHDsrw2SAj0GZrLS43nlQ5i
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------7pHDsrw2SAj0GZrLS43nlQ5i--

--------------FGa8T9vbPwNno9Z7u1ny1Fps--

--------------UUNg6SJBQ8SpA9FLnnsLOYV6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQei0QFAwAAAAAACgkQsN6d1ii/Ey+9
VQf9HIUpu3GywHv8XxVm77P9ykivCwfEW2+SuZWWiBBLWydeSGS3rs9GVMQYpLCcE0mFAwcAbTQ+
aS4EZp8DBUqtrHc0hLWsv3ibLZNT25FDjHho3e1aGKolZ75o/9i/xjQ5hQ5RYX08Ao+7e0Z4T7vO
ry93nl4zwMbbrpmJGchJXB0Cpei+un3+NPYbgBDtc0r+Sklo3IamoSrmWCfrfCeAJlBrJUwZh2BD
SJEi9UN4M2bnhjuqdMm3FoMyq82vZ/EaBPqkBqYIKsuGT/36u3enzUBpRTpXbnpqfM2972Foflrk
1YL+JH6e917u7N1fnsI3694J7EOo+7fzH6IlJeoolg==
=hTsp
-----END PGP SIGNATURE-----

--------------UUNg6SJBQ8SpA9FLnnsLOYV6--

