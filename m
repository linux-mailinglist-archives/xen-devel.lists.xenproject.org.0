Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E94928E6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258593.445521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pto-0003mM-CA; Tue, 18 Jan 2022 14:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258593.445521; Tue, 18 Jan 2022 14:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pto-0003jL-8j; Tue, 18 Jan 2022 14:55:52 +0000
Received: by outflank-mailman (input) for mailman id 258593;
 Tue, 18 Jan 2022 14:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tdM9=SC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n9ptm-0003h3-Cx
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:55:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8e798f4-786e-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:55:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E6D7212BB;
 Tue, 18 Jan 2022 14:55:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56DDB13AC3;
 Tue, 18 Jan 2022 14:55:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z6oQFPTU5mFdTwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 18 Jan 2022 14:55:48 +0000
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
X-Inumbo-ID: b8e798f4-786e-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642517748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=or2PiCDNGQe2X0Sg/R4r64z6A8ES3IgWNQu0DofNAtw=;
	b=F54U1AfYIQGIcDEAinzuzRZhuyZtKs5HsN7+0pcYhiasIKsUOAoTH3H9oikyQ2NhJzmt/Y
	fpWtXyMEb8eWRRIb1jYqpzAXZwNOdPb2xeAYtCsxIlHL/3i/Ck4krKGxf79rAxcU7JmUhi
	rQ10N9meXKBJtpyE+pHiI0xEbWDamDc=
Message-ID: <6b951401-a62a-5397-9b00-7daae27d2ed5@suse.com>
Date: Tue, 18 Jan 2022 15:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [MINIOS PATCH v3 06/12] use alloc_file_type() and
 get_file_from_fd() in blkfront
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-7-jgross@suse.com>
 <5dda5d9b-3488-04d2-0692-9ee12ae26ec7@srcf.net>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <5dda5d9b-3488-04d2-0692-9ee12ae26ec7@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NR3lvnkhe8nAeosTfSbHapfW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NR3lvnkhe8nAeosTfSbHapfW
Content-Type: multipart/mixed; boundary="------------ZS2T2Ptfx9VRRLCWQ6tB8HK2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <6b951401-a62a-5397-9b00-7daae27d2ed5@suse.com>
Subject: Re: [MINIOS PATCH v3 06/12] use alloc_file_type() and
 get_file_from_fd() in blkfront
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-7-jgross@suse.com>
 <5dda5d9b-3488-04d2-0692-9ee12ae26ec7@srcf.net>
In-Reply-To: <5dda5d9b-3488-04d2-0692-9ee12ae26ec7@srcf.net>

--------------ZS2T2Ptfx9VRRLCWQ6tB8HK2
Content-Type: multipart/mixed; boundary="------------20AIdZ8ov2ThYDD9BQREECju"

--------------20AIdZ8ov2ThYDD9BQREECju
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDEuMjIgMTU6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE2LzAxLzIw
MjIgMDg6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvYmxrZnJv
bnQuYyBiL2Jsa2Zyb250LmMNCj4+IGluZGV4IGUzZjQyYmVmLi5lZDkwMjcwMiAxMDA2NDQN
Cj4+IC0tLSBhL2Jsa2Zyb250LmMNCj4+ICsrKyBiL2Jsa2Zyb250LmMNCj4+IEBAIC00ODMs
OSArNDgzLDEzIEBAIGludCBibGtmcm9udF9haW9fcG9sbChzdHJ1Y3QgYmxrZnJvbnRfZGV2
ICpkZXYpDQo+PiAgIA0KPj4gICBtb3JldG9kbzoNCj4+ICAgI2lmZGVmIEhBVkVfTElCQw0K
Pj4gLSAgICBpZiAoZGV2LT5mZCAhPSAtMSkgew0KPj4gLSAgICAgICAgZmlsZXNbZGV2LT5m
ZF0ucmVhZCA9IGZhbHNlOw0KPj4gLSAgICAgICAgbWIoKTsgLyogTWFrZSBzdXJlIHRvIGxl
dCB0aGUgaGFuZGxlciBzZXQgcmVhZCB0byAxIGJlZm9yZSB3ZSBzdGFydCBsb29raW5nIGF0
IHRoZSByaW5nICovDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCBmaWxlICpmaWxl
ID0gZ2V0X2ZpbGVfZnJvbV9mZChkZXYtPmZkKTsNCj4+ICsNCj4+ICsgICAgICAgIGlmICgg
ZmlsZSApIHsNCj4gDQo+IFN0eWxlLCBhcyB0aGlzIGlzIGlzIGJlaW5nIGluZGVudGVkLg0K
DQpPaCwgbWlzc2VkIHRoYXQgb25lLiA6LSgNCg0KPiANCj4+ICsgICAgICAgICAgICBmaWxl
LT5yZWFkID0gZmFsc2U7DQo+PiArICAgICAgICAgICAgbWIoKTsgLyogTWFrZSBzdXJlIHRv
IGxldCB0aGUgaGFuZGxlciBzZXQgcmVhZCB0byAxIGJlZm9yZSB3ZSBzdGFydCBsb29raW5n
IGF0IHRoZSByaW5nICovDQo+IA0KPiBNaW5pT1MgaXMgaW4gZGVzcGVyYXRlIG5lZWQgb2Yg
YmVpbmcgZHJhZ2dlZCBvdmVyIHRvIExLTU0sIGFuZCB0byBzdG9wDQo+IHVzaW5nIGluYXBw
cm9wcmlhdGUgZmVuY2VzLsKgIFRoaW5ncyB3aWxsIGdvIG11Y2ggZmFzdGVyIHdoZW4gdGhl
c2UgaGF2ZQ0KPiBhbGwgYmVlbiBjb3JyZWN0ZWQgdG8gc21wIGJhcnJpZXJzLg0KDQpJbmRl
ZWQuDQoNCg0KSnVlcmdlbg0K
--------------20AIdZ8ov2ThYDD9BQREECju
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------20AIdZ8ov2ThYDD9BQREECju--

--------------ZS2T2Ptfx9VRRLCWQ6tB8HK2--

--------------NR3lvnkhe8nAeosTfSbHapfW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHm1PMFAwAAAAAACgkQsN6d1ii/Ey/V
/wf/cX5zQ6inizr/t9ikrUnteHhjP577v/c345akQAWXI3FceoicY69N6WOR4/Q24ZnlYsH2knBD
l7pPXIj4ifg5B2hnSyO8XFHQU8PRpLsZGSW/yc4+XZiRlb5OKlwY6Oqh/ythLFshhSfUf9fTkGfM
JFJulO1KNWMIM9s3X5faJXv5fkspxSaYmfEmdWogLtukb/Kfs8os8/yAjZVxTIyYc91uXCc6Ldu+
i/fx5XvoykPo+wwiM1LU4TVQjAIA6/Bt6Lja8z2Cd0VLvJw8Cc80rcdTBIUS88i5ii73Jmoiuzau
sxm6zvZbQGkiXmdtw27o3p8VLILR0VMc3buHs/s5Wg==
=0gQK
-----END PGP SIGNATURE-----

--------------NR3lvnkhe8nAeosTfSbHapfW--

