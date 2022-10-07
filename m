Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107415F73E6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 07:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417390.662079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogflk-0000AK-JW; Fri, 07 Oct 2022 05:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417390.662079; Fri, 07 Oct 2022 05:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogflk-00007r-Gc; Fri, 07 Oct 2022 05:19:32 +0000
Received: by outflank-mailman (input) for mailman id 417390;
 Fri, 07 Oct 2022 05:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogfli-00007d-8X
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 05:19:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e3cf07e-45ff-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 07:19:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22AF22199F;
 Fri,  7 Oct 2022 05:19:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8B9613345;
 Fri,  7 Oct 2022 05:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P19aM+C2P2OBLQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Oct 2022 05:19:28 +0000
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
X-Inumbo-ID: 9e3cf07e-45ff-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665119969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ejzy7TEHov+nIAMCI1XFyhDUZZW5+GOk87DJxP7CNaY=;
	b=Aqgt+IPCyj21zORa/HFyxvmEVfh8M63qWr5hDdHZfA9YZu5GgNckohRuFvk33/c/WC6KGg
	tdQSJXFMzL1Ux+lGa1/R9oyXpFsZZCOjccMDXR0wbL9Jj8IB883apnFhWfDo0NwyUPL4qP
	kitcvUTKNNWkAfX6ypDh6OjSZAJ6pwo=
Message-ID: <47853f65-0fce-6ee1-f6ab-115ab48df7a3@suse.com>
Date: Fri, 7 Oct 2022 07:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/2] Misc fixes for Xen grant DMA-mapping layer
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20221005174823.1800761-1-olekstysh@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221005174823.1800761-1-olekstysh@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SOsSx1a3rFmS0YD7wzBcZ2on"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SOsSx1a3rFmS0YD7wzBcZ2on
Content-Type: multipart/mixed; boundary="------------qtAE5mJL6H3HlkunW5gNx0pW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <47853f65-0fce-6ee1-f6ab-115ab48df7a3@suse.com>
Subject: Re: [PATCH 0/2] Misc fixes for Xen grant DMA-mapping layer
References: <20221005174823.1800761-1-olekstysh@gmail.com>
In-Reply-To: <20221005174823.1800761-1-olekstysh@gmail.com>

--------------qtAE5mJL6H3HlkunW5gNx0pW
Content-Type: multipart/mixed; boundary="------------ifS0aZNKw8d0gSh2PMBv6ACs"

--------------ifS0aZNKw8d0gSh2PMBv6ACs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjIgMTk6NDgsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiBGcm9t
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
DQo+IA0KPiBIZWxsbyBhbGwuDQo+IA0KPiBUaGVzZSBhcmUgc2V2ZXJhbCBmaXhlcyBJIGNv
bGxlY3RlZCB3aGVuIHBsYXlpbmcgd2l0aCB2aXJ0aW8tbmV0IGRldmljZQ0KPiB1c2luZyBY
ZW4gZ3JhbnQgbWFwcGluZ3MuDQo+IA0KPiBUZXN0ZWQgd2l0aCBib3RoIHZpcnRpby1ibGsg
YW5kIHZpcnRpby1uZXQgZGV2aWNlcy4NCj4gDQo+IE9sZWtzYW5kciBUeXNoY2hlbmtvICgy
KToNCj4gICAgeGVuL3ZpcnRpbzogRml4IG5fcGFnZXMgY2FsY3VsYXRpb24gaW4geGVuX2dy
YW50X2RtYV9tYXAodW5tYXApX3BhZ2UoKQ0KPiAgICB4ZW4vdmlydGlvOiBGaXggcG90ZW50
aWFsIGRlYWRsb2NrIHdoZW4gYWNjZXNzaW5nDQo+ICAgICAgeGVuX2dyYW50X2RtYV9kZXZp
Y2VzDQo+IA0KPiAgIGRyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYyB8IDI5ICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KDQpTZXJpZXMgcHVzaGVkIHRvIHhlbi90aXAu
Z2l0IGZvci1saW51cy02LjENCg0KDQpKdWVyZ2VuDQo=
--------------ifS0aZNKw8d0gSh2PMBv6ACs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ifS0aZNKw8d0gSh2PMBv6ACs--

--------------qtAE5mJL6H3HlkunW5gNx0pW--

--------------SOsSx1a3rFmS0YD7wzBcZ2on
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM/tuAFAwAAAAAACgkQsN6d1ii/Ey8G
bgf/du6WhlvN6TM8LUThjNHkx1yKlPgAth564txOMqLFAd+WVYglM6Gmgq+lqLsqlsU8jlyjv+Po
lKgmgYLQSXiiFAjxl1ktGP0jgNszMoCoaY2x7rNMwiC861uZ9T/WSxGfsW9Cfi4Z2tb6Phn5aK3o
Smi+6sW/QKNq82DLHDxlubXBZokB8ZtM8Z3t3Tgag6Mrw/3/Ok5slFDJmA+B0kKQ8xCHdRjSKQFN
yNGEErZyuJljV0g+wPLcTV0m9HVE4Swp3xz14PtS+xVyaOG34B3CpC4DsrbQLXLD6XxzIqMpeLR2
Po1PTRmD6c6/L1lE05O8yPhifFaVDLsVgebxuaXnqw==
=Pjss
-----END PGP SIGNATURE-----

--------------SOsSx1a3rFmS0YD7wzBcZ2on--

