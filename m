Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40055741256
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 15:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556472.869039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVBw-0000J5-Az; Wed, 28 Jun 2023 13:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556472.869039; Wed, 28 Jun 2023 13:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVBw-0000H3-8E; Wed, 28 Jun 2023 13:26:40 +0000
Received: by outflank-mailman (input) for mailman id 556472;
 Wed, 28 Jun 2023 13:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEVBv-0000Gx-7p
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 13:26:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65ea9a3e-15b7-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 15:26:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E5912189A;
 Wed, 28 Jun 2023 13:26:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07BFB138E8;
 Wed, 28 Jun 2023 13:26:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5H2QOwc1nGRJfQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 28 Jun 2023 13:26:31 +0000
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
X-Inumbo-ID: 65ea9a3e-15b7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687958792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YyHCjzXuvPQIeBDCs1BxS68n7glhXsM6xqPhDWv+ZxQ=;
	b=Azyx6XA84zc77D+GGqT5U5lFyHekPFZxU+KrMDYhwiubNetMa1UGmMXfv85ilVQ85YIFzd
	GZ86xOZW1ysBJdpTIlynKmBD8IhL44bTHKrskYBhbYQgZMTUgEh4U2HnM/6S0Nw+jTMbXG
	laW4TqxhDaHic3RANPBZaTWfxgDqcuc=
Message-ID: <58622fcf-0939-95c5-7318-60c93307f991@suse.com>
Date: Wed, 28 Jun 2023 15:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: XenSummit: Empty per-arch files
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nRMx0BW9HlmifNF96on0apbh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nRMx0BW9HlmifNF96on0apbh
Content-Type: multipart/mixed; boundary="------------XPd1t1yE7xlNTQDsN4r4WuFo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
Message-ID: <58622fcf-0939-95c5-7318-60c93307f991@suse.com>
Subject: Re: XenSummit: Empty per-arch files
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
In-Reply-To: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>

--------------XPd1t1yE7xlNTQDsN4r4WuFo
Content-Type: multipart/mixed; boundary="------------bEMcJF9U9ZnK2iguif3dCN58"

--------------bEMcJF9U9ZnK2iguif3dCN58
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDYuMjMgMTM6MzIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IEhlbGxvLA0KPiAN
Cj4gVGhpcyB3YXNuJ3QgYSBmb3JtYWwgZGlzY3Vzc2lvbiBwb2ludCBhdCBYZW5TdW1taXQs
IGJ1dCBPbGVrc2lpIHBvaW50ZWQNCj4gb3V0IHRoYXQgaXQgd2FzIHN0aWxsIGEgcHJvYmxl
bSwgaGVuY2UgdGhpcyB0aHJlYWQuDQo+IA0KPiBBcyB3ZSB0YWtlIG9uIG1vcmUgYXJjaGl0
ZWN0dXJlcywgaXQgYmVjb21lcyBtb3JlIGFuZCBtb3JlIGltcG9ydGFudCBmb3INCj4gdGhp
bmdzIHRvIGJlIGhhbmRsZWQgaW4gYSBtb3N0bHktY29tbW9uIHdheS7CoCBXaXRoIHRoYXQg
Y29tZXMgcXVpdGUgYQ0KPiBsb3Qgb2YgPHhlbi9mb28uaD4gaW5jbHVkaW5nIDxhc20vZm9v
Lmg+LCBhbmQgdGhlIGFyY2ggb25lIGJlaW5nIGEgc3R1Yg0KPiBpbiBzaW1wbGUgY2FzZXMu
DQo+IA0KPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGdldCByaWQgb2YgdGhlIHN0dWIgZmlsZXM7
IHRoZXkncmUgaXJyaXRhdGluZyB0bw0KPiBkZWFsIHdpdGgsIGJvdGggd2hlbiByZWZhY3Rv
cmluZyBhbmQgc2ltcGx5IGZvciB0aGUgZmlsZSBibG9hdCB0aGV5IGNyZWF0ZS4NCj4gDQo+
IFRoZXJlIGFyZSB0d28gb3B0aW9ucyB3aGljaCBjb21lIHRvIG1pbmQuDQo+IA0KPiAxKSBV
c2UgX19oYXNfaW5jbHVkZSgpLsKgIFRoaXMgd291bGQgYmUgaWRlYWwsIGJ1dCB3b3VsZCBy
ZXF1aXJlIHVzDQo+IGJ1bXBpbmcgdGhlIG1pbmltdW0gR0NDIHZlcnNpb24gdG8gNC45LjIg
YXMgYSBwcmVyZXF1aXNpdGUuwqAgSSdtIG5vdA0KPiBhd2FyZSBvZiBhbnkgd2F5IHRvIGVt
dWxhdGUgdGhlIG5lY2Vzc2FyeSBiZWhhdmlvdXIgb24gb2xkZXIgdG9vbGNoYWlucy4NCj4g
DQo+IDIpIEhhdmUgYSBzdHViICJhcmNoaXRlY3R1cmUiIHdoaWNoIGlzIGFsd2F5cyBsYXN0
IG9uIHRoZSBpbmNsdWRlIHBhdGguDQo+IFRoaXMgd291bGQgcmVkdWNlIHRoZSBudW1iZXIg
b2Ygc3R1YiBmaWxlcyBmcm9tIG9uZSBzZXQgcGVyIGFyY2gsIHRvDQo+IG9ubHkgb25lIHNl
dC4NCj4gDQo+IEFueXRoaW5nIGVsc2UgdGhhdCBJJ3ZlIG1pc3NlZD8NCg0KV2hhdCBhYm91
dCBhIG1ha2UgcnVsZSBjcmVhdGluZyBhbiBlbXB0eSBpbmNsdWRlIGZpbGUgaWYgaXQgaXMg
bWlzc2luZz8NCg0KDQpKdWVyZ2VuDQoNCg==
--------------bEMcJF9U9ZnK2iguif3dCN58
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------bEMcJF9U9ZnK2iguif3dCN58--

--------------XPd1t1yE7xlNTQDsN4r4WuFo--

--------------nRMx0BW9HlmifNF96on0apbh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmScNQcFAwAAAAAACgkQsN6d1ii/Ey9F
Kgf6As+CFitJBM06BxDZAVDTcGUqopkZ0gmfVMs2Yi/FTK/caImJ38QkIfGMelzE5efqR/kr3jlU
jHqXILUvzLpbDjDdS64iKsZknRRsQ/pPd8G3Ru6BGb56Y+mSI5EyNKGPKv77LKeWbE8aQiSTwSKt
1c+UBEaKoxS/EWoGWu+IEGb+7xAAY3dLUALp1jSVFWvhI/5Irh2ydp7DNTBXEIWXkcGqNxR2tfSX
Y1EEozlcfcNmE+eucXlOOsjYeL7fbmvyFWxXacOYzA2syqBpjmrxK7CLgt4/43+zFcsxHz7UDsx3
AaEjH36wPa62XVaWHny+mx4zE1eRtKSdC+XV2W0cpw==
=qWJO
-----END PGP SIGNATURE-----

--------------nRMx0BW9HlmifNF96on0apbh--

