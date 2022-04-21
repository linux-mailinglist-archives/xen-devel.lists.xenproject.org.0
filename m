Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47E509ADA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 10:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309925.526445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhSMV-0003Pc-EK; Thu, 21 Apr 2022 08:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309925.526445; Thu, 21 Apr 2022 08:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhSMV-0003NN-Ag; Thu, 21 Apr 2022 08:40:27 +0000
Received: by outflank-mailman (input) for mailman id 309925;
 Thu, 21 Apr 2022 08:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sn/J=U7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhSMU-0003NH-5w
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 08:40:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 798034b4-c14e-11ec-8fc1-03012f2f19d4;
 Thu, 21 Apr 2022 10:38:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C50B421115;
 Thu, 21 Apr 2022 08:40:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D3C913446;
 Thu, 21 Apr 2022 08:40:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lHDMIHcYYWIsLwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 21 Apr 2022 08:40:23 +0000
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
X-Inumbo-ID: 798034b4-c14e-11ec-8fc1-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650530423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qI8TPu71J+We/zCvxxP4jxhJX/Df5nYpF5m9OjwsUpE=;
	b=nC4t79M+Meslic6x1AnQgarI4lTLcBDsDh4aC3zJm0VPX49PIlLRjtZupBHBWN2qlzyJVu
	BZKR1SzWWHm/CZ9sElRDqfXMS3mz+TBudPI3jxi7rMEcM4VjZQrlF0UwEajq4yCCPaNJ2T
	9AP4ZNo/9HfqUItkFmm/M+4YlFxsNgM=
Message-ID: <bf19c5f8-badd-5afb-fcaa-a16483783a27@suse.com>
Date: Thu, 21 Apr 2022 10:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20220420092503.11123-1-jgross@suse.com>
 <20220420092503.11123-3-jgross@suse.com>
 <e4bce8f1-c6f5-cb99-8a1e-97b09ea1f840@oracle.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/4] xen/scsiback: use new command result macros
In-Reply-To: <e4bce8f1-c6f5-cb99-8a1e-97b09ea1f840@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MXBgLgi61U0vYgbXaSFEBPbU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MXBgLgi61U0vYgbXaSFEBPbU
Content-Type: multipart/mixed; boundary="------------BAmmp0nFgIuRzrKlabLeMkus";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <bf19c5f8-badd-5afb-fcaa-a16483783a27@suse.com>
Subject: Re: [PATCH 2/4] xen/scsiback: use new command result macros
References: <20220420092503.11123-1-jgross@suse.com>
 <20220420092503.11123-3-jgross@suse.com>
 <e4bce8f1-c6f5-cb99-8a1e-97b09ea1f840@oracle.com>
In-Reply-To: <e4bce8f1-c6f5-cb99-8a1e-97b09ea1f840@oracle.com>

--------------BAmmp0nFgIuRzrKlabLeMkus
Content-Type: multipart/mixed; boundary="------------m02jPnaQ9qMxTiQzXNCK6VDd"

--------------m02jPnaQ9qMxTiQzXNCK6VDd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDQuMjIgMTg6MTIsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToNCj4gDQo+IE9uIDQv
MjAvMjIgNToyNSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEBAIC01NjksNyArNjQ1
LDcgQEAgc3RhdGljIHZvaWQgc2NzaWJhY2tfZGV2aWNlX2FjdGlvbihzdHJ1Y3QgdnNjc2li
a19wZW5kIA0KPj4gKnBlbmRpbmdfcmVxLA0KPj4gwqDCoMKgwqDCoCB3YWl0X2Zvcl9jb21w
bGV0aW9uKCZwZW5kaW5nX3JlcS0+dG1yX2RvbmUpOw0KPj4gwqDCoMKgwqDCoCBlcnIgPSAo
c2VfY21kLT5zZV90bXJfcmVxLT5yZXNwb25zZSA9PSBUTVJfRlVOQ1RJT05fQ09NUExFVEUp
ID8NCj4+IC3CoMKgwqDCoMKgwqDCoCBTVUNDRVNTIDogRkFJTEVEOw0KPj4gK8KgwqDCoMKg
wqDCoMKgIFhFTl9WU0NTSUlGX1JTTFRfUkVTRVRfU1VDQ0VTUyA6IFhFTl9WU0NTSUlGX1JT
TFRfUkVTRVRfRkFJTEVEOw0KPj4gwqDCoMKgwqDCoCBzY3NpYmFja19kb19yZXNwX3dpdGhf
c2Vuc2UoTlVMTCwgZXJyLCAwLCBwZW5kaW5nX3JlcSk7DQo+PiDCoMKgwqDCoMKgIHRyYW5z
cG9ydF9nZW5lcmljX2ZyZWVfY21kKCZwZW5kaW5nX3JlcS0+c2VfY21kLCAwKTsNCj4gDQo+
IA0KPiBZb3UgYWxzbyB3YW50IHRvIGluaXRpYWxpemUgZXJyIHRvIFhFTl9WU0NTSUlGX1JT
TFRfUkVTRVRfRkFJTEVELg0KDQpJIGRpZCB0aGF0Lg0KDQo+IEFuZCBhbHNvIGxvb2tpbmcg
YXQgaW52b2NhdGlvbnMgb2Ygc2NzaWJhY2tfZG9fcmVzcF93aXRoX3NlbnNlKCkgSSB0aGlu
ayB0aG9zZSANCj4gbWF5IG5lZWQgdG8gYmUgYWRqdXN0ZWQgYXMgd2VsbC4NCg0KTm8sIHRo
ZSBpbnZvY2F0aW9ucyBhcmUgZmluZSwgYnV0IHNjc2liYWNrX3Jlc3VsdCgpIG5lZWRzIHRv
IHBhc3MgdGhyb3VnaA0KdGhlIGxvd2VzdCAxNiBiaXRzIGluc3RlYWQgb2Ygb25seSB0aGUg
bG93ZXN0IDggYml0cyBvZiB0aGUgcmVzdWx0IHZhbHVlLg0KDQoNCkp1ZXJnZW4NCg0K
--------------m02jPnaQ9qMxTiQzXNCK6VDd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------m02jPnaQ9qMxTiQzXNCK6VDd--

--------------BAmmp0nFgIuRzrKlabLeMkus--

--------------MXBgLgi61U0vYgbXaSFEBPbU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJhGHcFAwAAAAAACgkQsN6d1ii/Ey8i
8wf9FaiocRtl87gx2tr6V8vjqwVSfCryLsAbcuwExxjIuksH/A5BXtik3XEUysPhCWCTcq+Qol8y
054HCFU/WYurTIbvOg7zHrXFtdDugZNGhoXCByznAtF1PfsXA9rOi3xzNZUrIw3eRm5h3W/bBaea
jRUPtJgopqOrYey/GznfbhOQw/1KBXtLyDjsgTXCNzEEILFQjEjrnEhNDdIlROVIIab4CYdV7ZIM
nF6AM85sQVleCs/nANxkj6CyHOLU6/knhQMJUfI9eAO2MOLDRmMJaFgSGZoKjSTQbpPNxnR6HWMF
SkAOi8uI0+vOSDAt/Y4HzEVrZaO8b4EGGhFaHZnFOw==
=AMDp
-----END PGP SIGNATURE-----

--------------MXBgLgi61U0vYgbXaSFEBPbU--

