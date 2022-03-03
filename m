Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E84CB8AE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 09:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282831.481650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPgie-0003EA-RA; Thu, 03 Mar 2022 08:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282831.481650; Thu, 03 Mar 2022 08:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPgie-0003CC-O4; Thu, 03 Mar 2022 08:21:52 +0000
Received: by outflank-mailman (input) for mailman id 282831;
 Thu, 03 Mar 2022 08:21:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhVD=TO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nPgid-0003C6-A7
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 08:21:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7378fee-9aca-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 09:21:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B7161F37E;
 Thu,  3 Mar 2022 08:21:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75778139BD;
 Thu,  3 Mar 2022 08:21:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zfpIG516IGKrSQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Mar 2022 08:21:49 +0000
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
X-Inumbo-ID: f7378fee-9aca-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646295709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIP6gJlg5ZyEg4u9q3agdpQs7E30pfnlSGNfIv2rcps=;
	b=klgStRnCiB0yWvobB4qKluHLJvsLiD7l/azIpGUnOxeoSS0P3D2zC7yrkz9iM3Kj8bPHnU
	ogVmmU7Mq46m4cpXEoKl7xYapMtteEYT80QkdXInBRwP3BEufb/J1kIhyW4Kl72b3A7ApH
	IjZDBoP/BjttqcDArbyzx0j65R+PiXg=
Message-ID: <d5770e63-7d63-427d-1ca6-02982b5fa00e@suse.com>
Date: Thu, 3 Mar 2022 09:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 16/29] libs,tools/include: Clean "clean" targets
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <20220225151321.44126-17-anthony.perard@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220225151321.44126-17-anthony.perard@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rwO6BFSiuJQIG4ABLwRmB1d2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rwO6BFSiuJQIG4ABLwRmB1d2
Content-Type: multipart/mixed; boundary="------------xIiKVEYHTXj6U6EO0s5ykKSv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Message-ID: <d5770e63-7d63-427d-1ca6-02982b5fa00e@suse.com>
Subject: Re: [XEN PATCH v2 16/29] libs,tools/include: Clean "clean" targets
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <20220225151321.44126-17-anthony.perard@citrix.com>
In-Reply-To: <20220225151321.44126-17-anthony.perard@citrix.com>

--------------xIiKVEYHTXj6U6EO0s5ykKSv
Content-Type: multipart/mixed; boundary="------------1TCurnouaVHkOGlhtr0SCBU2"

--------------1TCurnouaVHkOGlhtr0SCBU2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDIuMjIgMTY6MTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBUaGVyZSBpcyBu
byBuZWVkIGZvciBhbiBleHRyYSAiY2xlYW5sb2NhbCIgdGFyZ2V0LCB3ZSBjYW4gdXNlDQo+
IGRvdWJsZS1jb2xvbiBydWxlcyBpbnN0ZWFkLg0KPiANCj4gR2VuZXJhdGVkIGhlYWRlcnMg
YXJlIG5vdyBpbiB0b29scy9pbmNsdWRlLywgc28gcmVtb3ZlIHRob3NlIGZpbGUNCj4gdGhl
cmUuDQo+IA0KPiBSZW1vdmUgLWYgZmxhZyBhcyBpdCdzIGFscmVhZHkgaW4gJChSTSkuDQo+
IA0KPiBsaWJzLm1rOg0KPiAgICAtIGRvbid0IHRyeSB0byByZW1vdmUgIioucnBtIiBhbnlt
b3JlLg0KPiANCj4gbGlicy9saWdodDoNCj4gICAgLSAiX3BhdGhzLioudG1wIiBpc24ndCBj
cmVhdGVkIGFueW1vcmUuDQo+ICAgIC0gY2xlYW4gImxpYnhlbmxpZ2h0X3Rlc3Quc28iIGFu
ZCAibGlieGxfdGVzdF8qLm9waWMiLg0KPiANCj4gbGlicy9zdGF0Og0KPiAgICAtIGRvbid0
IHJlbW92ZSAkKERFUFNfUk0pIGZyb20gaGVyZSBhcyBpdCBpcyBhbHJlYWR5IGRvbmUgaW4N
Cj4gICAgICAibGlicy5tayIuDQo+IA0KPiBsaWJzL3V0aWw6DQo+ICAgIC0gZml4IGNsZWFu
IG9mIHZlcnNpb24tc2NyaXB0IGZpbGUuDQo+IA0KPiBpbmNsdWRlL3hlbi1mb3JlaWduOg0K
PiAgICAtIHJlbW92ZSBfX3B5Y2FjaGVfXw0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiANCj4gTm90
ZXM6DQo+ICAgICAgdjI6DQo+ICAgICAgLSBzdG9wIHJlbW92aW5nICQoREVQU19STSkgZnJv
bSBsaWJzL3N0YXQvTWFrZWZpbGUuDQo+IA0KPiAgIHRvb2xzL2luY2x1ZGUvTWFrZWZpbGUg
ICAgICAgICAgICAgfCAgMSArDQo+ICAgdG9vbHMvaW5jbHVkZS94ZW4tZm9yZWlnbi9NYWtl
ZmlsZSB8ICAxICsNCj4gICB0b29scy9saWJzL2N0cmwvTWFrZWZpbGUgICAgICAgICAgIHwg
IDUgKy0tLS0NCj4gICB0b29scy9saWJzL2d1ZXN0L01ha2VmaWxlICAgICAgICAgIHwgIDMg
Ky0tDQo+ICAgdG9vbHMvbGlicy9saWdodC9NYWtlZmlsZSAgICAgICAgICB8IDE5ICsrKysr
KysrLS0tLS0tLS0tLS0NCj4gICB0b29scy9saWJzL3N0YXQvTWFrZWZpbGUgICAgICAgICAg
IHwgIDggKystLS0tLS0NCj4gICB0b29scy9saWJzL3V0aWwvTWFrZWZpbGUgICAgICAgICAg
IHwgIDcgKystLS0tLQ0KPiAgIHRvb2xzL2xpYnMvdmNoYW4vTWFrZWZpbGUgICAgICAgICAg
fCAgNSArLS0tLQ0KPiAgIHRvb2xzL2xpYnMvbGlicy5tayAgICAgICAgICAgICAgICAgfCAg
NCArKy0tDQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzNCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL01ha2VmaWxlIGIv
dG9vbHMvaW5jbHVkZS9NYWtlZmlsZQ0KPiBpbmRleCBkOTY1OTg3ZjU1Li4zYTAzYTBiMGZh
IDEwMDY0NA0KPiAtLS0gYS90b29scy9pbmNsdWRlL01ha2VmaWxlDQo+ICsrKyBiL3Rvb2xz
L2luY2x1ZGUvTWFrZWZpbGUNCj4gQEAgLTgyLDYgKzgyLDcgQEAgdW5pbnN0YWxsOg0KPiAg
IGNsZWFuOg0KPiAgIAlybSAtcmYgeGVuIHhlbi14c20gYWNwaQ0KPiAgIAkkKE1BS0UpIC1D
IHhlbi1mb3JlaWduIGNsZWFuDQo+ICsJcm0gLWYgXyouaA0KDQpVc2UgJChSTSkgaW5zdGVh
ZD8gT1RPSCB0aGlzIGNvdWxkIGJlIGRvbmUgaW4gYSBwYXRjaCBvZiBpdHMgb3duDQpzd2l0
Y2hpbmcgYWxsIHJtIC1mIGluc3RhbmNlcyB0byAkKFJNKS4gRWl0aGVyIHdheSBpcyBmaW5l
IHdpdGggbWUsIHNvOg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------1TCurnouaVHkOGlhtr0SCBU2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1TCurnouaVHkOGlhtr0SCBU2--

--------------xIiKVEYHTXj6U6EO0s5ykKSv--

--------------rwO6BFSiuJQIG4ABLwRmB1d2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIgepwFAwAAAAAACgkQsN6d1ii/Ey/c
2AgAhM/hXJsBbHHSwWcgyP5DFkV0BO5x1z9PVSDwI/4oleE+N+mQ//f3/01ftQRDcVXjklTGv+rr
DoERetWKsZrLMiA1uLhXRKsaq5BjnYgF6TxagW/FI+f/6jIOyoDjaQEJNr9HN/1WfTrw7c6+7gpV
0jYolDMEuCElbJueVrquJcPNhIANH5wxUb/NLH7rbaFtXiUIJmLDuyGE0H6anzQwtzIuq9Lki3Z5
mAq6X/fTWbpSJXci4/iWxdtJDfV+UMK2LF15A3Tp5v2+JbIbgc+Yiy53fogySVxjb0ZD/6xqR+yD
5eh2dd1z14MKp+y7G4Zbi511VVtIgNloKJExi6+bNw==
=rPlR
-----END PGP SIGNATURE-----

--------------rwO6BFSiuJQIG4ABLwRmB1d2--

