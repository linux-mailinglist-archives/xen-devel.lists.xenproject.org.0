Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D31511286
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 09:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314477.532546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njc8H-0004cq-7e; Wed, 27 Apr 2022 07:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314477.532546; Wed, 27 Apr 2022 07:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njc8H-0004av-40; Wed, 27 Apr 2022 07:30:41 +0000
Received: by outflank-mailman (input) for mailman id 314477;
 Wed, 27 Apr 2022 07:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njc8F-0004ap-MC
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 07:30:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeef3593-c5fb-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 09:30:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95551210E1;
 Wed, 27 Apr 2022 07:30:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 761D513A39;
 Wed, 27 Apr 2022 07:30:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /wk1Gx3xaGIGKgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 27 Apr 2022 07:30:37 +0000
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
X-Inumbo-ID: eeef3593-c5fb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651044637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EuzQ5ZDycxlMgDon7eKwQVHn36wPidVeXg9XkRZSS3I=;
	b=ZJ1EqV913xnNeZDmuCCOryX/PFes2jRREr5tCytJN0fmgeZA9N3F7wduY84Qz/4n17M51X
	8POghiRot5NVuC2zpoG66I+Iyc2D+CAgf6uteJ06YVSu7wi2/Ak3sJRTWd7qHNQC0atLoz
	RqyAxCRJho0U5OMm2imeUHEysrm16Gw=
Message-ID: <13c29d5b-a9e4-9690-7988-767caf0c44b5@suse.com>
Date: Wed, 27 Apr 2022 09:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [cxenstored] Potential bug in special watch event firing
Content-Language: en-US
To: Raphael Ning <raphning@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>
References: <eb024e77-17f4-cc89-f621-a9d5b879c184@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <eb024e77-17f4-cc89-f621-a9d5b879c184@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------genfbMfkTj1RyuLeYexr6ky0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------genfbMfkTj1RyuLeYexr6ky0
Content-Type: multipart/mixed; boundary="------------5pry8zVJ7wY5YDtz129AgZBi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Raphael Ning <raphning@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>
Message-ID: <13c29d5b-a9e4-9690-7988-767caf0c44b5@suse.com>
Subject: Re: [cxenstored] Potential bug in special watch event firing
References: <eb024e77-17f4-cc89-f621-a9d5b879c184@gmail.com>
In-Reply-To: <eb024e77-17f4-cc89-f621-a9d5b879c184@gmail.com>

--------------5pry8zVJ7wY5YDtz129AgZBi
Content-Type: multipart/mixed; boundary="------------70Bv9OJ3HHY4Wj2AfYKHb03C"

--------------70Bv9OJ3HHY4Wj2AfYKHb03C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUmFwaGFlbCwNCg0KT24gMjYuMDQuMjIgMTk6MDIsIFJhcGhhZWwgTmluZyB3cm90ZToN
Cj4gV2hpbGUgcmVhZGluZyBDIHhlbnN0b3JlZCBjb2RlLCBJIG5vdGljZWQgdGhhdCBpdCBt
YXkgc2VuZCBzcGVjaWFsIGV2ZW50cyBsaWtlIEByZWxlYXNlRG9tYWluIHRvIChwcml2aWxl
Z2VkKSBjbGllbnRzIHRoYXQgb25seSB3YXRjaCB0aGUgcm9vdCBub2RlICgvKS4gVGhhdCdz
IHByb2JhYmx5IG5vdCB0aGUgaW50ZW5kZWQgYmVoYXZpb3VyLg0KPiANCj4gRm9yIGV4YW1w
bGUsIHdoZW4gZmlyaW5nIEByZWxlYXNlRG9tYWluLCBmaXJlX3dhdGNoZXMoKSBpcyBjYWxs
ZWQgd2l0aCBleGFjdCA9PSBmYWxzZToNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS94ZW4t
cHJvamVjdC94ZW4vYmxvYi8yNDE5YTE1OWZiOTQzYzI0YTZmMjQzOTYwNGI5ZmRiMTQ3OGZj
ZDA4L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyNMMjM0DQo+IA0KPiBBcyBh
IHJlc3VsdCwgaXQgd2lsbCBjaGVjayB3aGV0aGVyIEByZWxlYXNlRG9tYWluIGlzIGEgY2hp
bGQgb2YgdGhlIHBhdGggYmVpbmcgd2F0Y2hlZDoNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS94ZW4tcHJvamVjdC94ZW4vYmxvYi8yNDE5YTE1OWZiOTQzYzI0YTZmMjQzOTYwNGI5ZmRi
MTQ3OGZjZDA4L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF93YXRjaC5jI0wxOTUNCj4gDQo+
IEFuZCB3aGVuIHRoZSBwYXJlbnQgcGF0aCBpcyAvLCBpc19jaGlsZCgpIHVuY29uZGl0aW9u
YWxseSByZXR1cm5zIHRydWU6DQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20veGVuLXByb2pl
Y3QveGVuL2Jsb2IvMjQxOWExNTlmYjk0M2MyNGE2ZjI0Mzk2MDRiOWZkYjE0NzhmY2QwOC90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfd2F0Y2guYyNMNjYNCj4gDQo+IFRoZSB4ZW5zdG9y
ZSBkb2N1bWVudGF0aW9uIGlzIG5vdCBjbGVhciBhYm91dCB3aGV0aGVyIEA8d3NwZWNpYWw+
IHNob3VsZCBiZSBjb25zaWRlcmVkIGNoaWxkcmVuIG9mIC8uIEJ1dCBJIGZpbmQgaXQgY291
bnRlcmludHVpdGl2ZSB0aGF0IGNsaWVudHMgbWF5IGJlIG5vdGlmaWVkIGFib3V0IGEgc3Bl
Y2lhbCBldmVudCB3aXRob3V0IGV4cGxpY2l0bHkgc3Vic2NyaWJpbmcgdG8gaXQuIElzIGl0
IGEgYnVnPw0KDQpJIGFncmVlIHRoaXMgaXMgYSBidWcuDQoNCg0KSnVlcmdlbg0K
--------------70Bv9OJ3HHY4Wj2AfYKHb03C
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------70Bv9OJ3HHY4Wj2AfYKHb03C--

--------------5pry8zVJ7wY5YDtz129AgZBi--

--------------genfbMfkTj1RyuLeYexr6ky0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJo8R0FAwAAAAAACgkQsN6d1ii/Ey8g
Dwf/fj9XtEQOCB2wm1CuUeMGANTGdY/sSRALpAdn/1R6MWz8ecg2HFdWNpqhwJKaseC6hAq6hUve
wdMXOEmFmKH9XXVWwZ3E+HGnaw18j2e3IBeWNmuaDeLmAN1F1pNknnVRuRvCeeFL7cRaTU+fP7p3
Bkftw98DLG6LHidkPT2ZL0q4gc1si50f23bY9LjICu2x26meuIc4023RSyJTMBiGrSL7D+TsjLQK
BUHg5rSptXCp81jGlYFPP1C2k8ebgWF5o68ZCbsiAwJm/0n2DpGSN8jkGCcZA4KFU0OLbbOjHc+/
56uxQ+bWObeg5FQigqHD82l3EtHxUSgbFE5So/FV6Q==
=8QC0
-----END PGP SIGNATURE-----

--------------genfbMfkTj1RyuLeYexr6ky0--

