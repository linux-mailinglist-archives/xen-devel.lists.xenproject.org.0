Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD5710D0C
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539585.840621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Am1-0007Te-Ib; Thu, 25 May 2023 13:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539585.840621; Thu, 25 May 2023 13:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Am1-0007R9-EZ; Thu, 25 May 2023 13:12:57 +0000
Received: by outflank-mailman (input) for mailman id 539585;
 Thu, 25 May 2023 13:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iF6a=BO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q2Am0-0007R3-EE
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:12:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db35442c-fafd-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 15:12:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A707021CF6;
 Thu, 25 May 2023 13:12:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80B9F13356;
 Thu, 25 May 2023 13:12:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HiGiHdReb2TuRwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 May 2023 13:12:52 +0000
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
X-Inumbo-ID: db35442c-fafd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685020372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m6DN/3xx1Z2aQkGZaGSC8H8tDPMmppvZicifQJ2ZcP0=;
	b=Y2OJwmGgwsa/wSVCwNRKNp0KsfJ6rDEUe7/cyOX06KvkJCs0ANJ+IYp547Pr86Cd4dBhGj
	lkObV1Z1X3btWpTTF37FzA4h41glq4gjlnvYPCKHk3KxDbseAmez4GQ7xPUwxUknLCmNEP
	KTQQQzjgdIZVQzy9+SZZvvbODsh5U1s=
Message-ID: <33653405-8ffc-1a25-56eb-b86a05be2fd9@suse.com>
Date: Thu, 25 May 2023 15:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/3] docs: fix complex-and-wrong xenstore-path wording
Content-Language: en-US
To: Yann Dirson <yann.dirson@vates.fr>, xen-devel@lists.xenproject.org
Cc: xihuan.yang@citrix.com, min.li1@citrix.com
References: <20230510142011.1120417-1-yann.dirson@vates.fr>
 <20230510142011.1120417-2-yann.dirson@vates.fr>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230510142011.1120417-2-yann.dirson@vates.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8etra55gbla2Q3KY6lLtI0XU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8etra55gbla2Q3KY6lLtI0XU
Content-Type: multipart/mixed; boundary="------------0V0ATrsKxJ6h9vhFfR0xjohd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Yann Dirson <yann.dirson@vates.fr>, xen-devel@lists.xenproject.org
Cc: xihuan.yang@citrix.com, min.li1@citrix.com
Message-ID: <33653405-8ffc-1a25-56eb-b86a05be2fd9@suse.com>
Subject: Re: [PATCH 1/3] docs: fix complex-and-wrong xenstore-path wording
References: <20230510142011.1120417-1-yann.dirson@vates.fr>
 <20230510142011.1120417-2-yann.dirson@vates.fr>
In-Reply-To: <20230510142011.1120417-2-yann.dirson@vates.fr>

--------------0V0ATrsKxJ6h9vhFfR0xjohd
Content-Type: multipart/mixed; boundary="------------AWakUPhxGVZTsu5h0Z0y8FAb"

--------------AWakUPhxGVZTsu5h0Z0y8FAb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDUuMjMgMTY6MjAsIFlhbm4gRGlyc29uIHdyb3RlOg0KPiAiMCBvciAxIC4uLiB0
byBpbmRpY2F0ZSB3aGV0aGVyIGl0IGlzIGNhcGFibGUgb3IgaW5jYXBhYmxlLCByZXNwZWN0
aXZlbHkiDQo+IGlzIGx1Y2tpbHkganVzdCBzd2FwcGVkIHdvcmRzLiAgTWFraW5nIHRoaXMg
c2hvcnRlciB3aWxsDQo+IG1ha2UgdGhlIHJlYWRpbmcgZWFzaWVyLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogWWFubiBEaXJzb24gPHlhbm4uZGlyc29uQHZhdGVzLmZyPg0KDQpSZXZpZXdl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K

--------------AWakUPhxGVZTsu5h0Z0y8FAb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------AWakUPhxGVZTsu5h0Z0y8FAb--

--------------0V0ATrsKxJ6h9vhFfR0xjohd--

--------------8etra55gbla2Q3KY6lLtI0XU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRvXtQFAwAAAAAACgkQsN6d1ii/Ey+K
NwgAkHq1hlziw/EC/Z4cyE/CcaCuqwFlpdbXbvzDDkMhAtu4xPhc9fHZ1kAZJ2PdbDLjlxNGP3nl
pqN4frXtZuDNM4GLhWRSWLQVAw5AohCKVAU2BLFvBhHIUbxNgs92D9Cfx2r1BwmgE+CPeqfTZEdb
a7NWqUtg/VmIbhY02RbZzWO7j1XklOj+gR/R5XxcEEK8tg9bkE1NN+LVyVTKD4M/xfy5beIxX9zG
OaUEjmLBZsmYfBcgq+UEAXgNQh8PXK0cZQFxvX/1DVZf12fDTPbpWOux5adjrBprMDoMNgdJ0zmZ
TjaQVv52sxQpEuUQsdJCvCa63KGhZUI3Uf8ARou8mg==
=oytU
-----END PGP SIGNATURE-----

--------------8etra55gbla2Q3KY6lLtI0XU--

