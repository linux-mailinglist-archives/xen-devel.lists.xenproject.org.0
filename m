Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE76F4FB2
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 07:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528952.822760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu4w0-0002A9-LX; Wed, 03 May 2023 05:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528952.822760; Wed, 03 May 2023 05:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu4w0-00027i-IE; Wed, 03 May 2023 05:21:48 +0000
Received: by outflank-mailman (input) for mailman id 528952;
 Wed, 03 May 2023 05:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pu4vz-00027c-Um
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 05:21:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6622d888-e972-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 07:21:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 899501FF78;
 Wed,  3 May 2023 05:21:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5BB821331F;
 Wed,  3 May 2023 05:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SlEwFGrvUWTOEAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 05:21:46 +0000
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
X-Inumbo-ID: 6622d888-e972-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683091306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yOi3yGLq7RX6Qag50H/c43X0b6cIunKT3mfc8j3/LUQ=;
	b=oT2zFUg2A/o39AZK0LgXBeVQCIx0cBXMRXnKCMGji2a3eIA4++vaWe9sH4oUms6W7+DTa0
	D2ENxwGNML8qF5U5XRkjCbbw9o1/cIZaT1uT4CQdRK/D199vYQoK1izTNacyNlUVmLcyrn
	jc7gD6XqD6uLf+yO+qdglV985puhnek=
Message-ID: <80246bbf-85eb-0829-8f86-d5a2ea3941fe@suse.com>
Date: Wed, 3 May 2023 07:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-8-jgross@suse.com>
 <25027287-441a-304c-f035-0d3da3572d3a@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 07/13] tools/xenstore: use accounting data array for
 per-domain values
In-Reply-To: <25027287-441a-304c-f035-0d3da3572d3a@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FcxXT8qekjRmiPntJ9Rci2Tl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FcxXT8qekjRmiPntJ9Rci2Tl
Content-Type: multipart/mixed; boundary="------------Rm8WJ3mb8Jcsj3d8pClM9LxW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <80246bbf-85eb-0829-8f86-d5a2ea3941fe@suse.com>
Subject: Re: [PATCH v4 07/13] tools/xenstore: use accounting data array for
 per-domain values
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-8-jgross@suse.com>
 <25027287-441a-304c-f035-0d3da3572d3a@xen.org>
In-Reply-To: <25027287-441a-304c-f035-0d3da3572d3a@xen.org>

--------------Rm8WJ3mb8Jcsj3d8pClM9LxW
Content-Type: multipart/mixed; boundary="------------KEYllicDOrIfjMYCxqnnIMog"

--------------KEYllicDOrIfjMYCxqnnIMog
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjMgMjE6MDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA1LzA0LzIwMjMgMDg6MDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5oIA0KPj4gYi90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmgNCj4+IGluZGV4IDVjZmQ3MzBjZjYu
LjBkNjFiZjQzNDQgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
ZG9tYWluLmgNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaA0K
Pj4gQEAgLTI4LDcgKzI4LDEwIEBAIGVudW0gYWNjaXRlbSB7DQo+PiDCoMKgwqDCoMKgIEFD
Q19OT0RFUywNCj4+IMKgwqDCoMKgwqAgQUNDX1JFUV9OLMKgwqDCoMKgwqDCoMKgIC8qIE51
bWJlciBvZiBlbGVtZW50cyBwZXIgcmVxdWVzdC4gKi8NCj4+IMKgwqDCoMKgwqAgQUNDX1RS
X04gPSBBQ0NfUkVRX04swqDCoMKgIC8qIE51bWJlciBvZiBlbGVtZW50cyBwZXIgdHJhbnNh
Y3Rpb24uICovDQo+PiAtwqDCoMKgIEFDQ19OID0gQUNDX1RSX04swqDCoMKgIC8qIE51bWJl
ciBvZiBlbGVtZW50cyBwZXIgZG9tYWluLiAqLw0KPj4gK8KgwqDCoCBBQ0NfV0FUQ0ggPSBB
Q0NfVFJfTiwNCj4+ICvCoMKgwqAgQUNDX09VVFNULA0KPj4gK8KgwqDCoCBBQ0NfTUVNLA0K
Pj4gK8KgwqDCoCBBQ0NfTizCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIE51bWJlciBvZiBl
bGVtZW50cyBwZXIgZG9tYWluLiAqLw0KPj4gwqAgfTsNCj4+IMKgIHZvaWQgaGFuZGxlX2V2
ZW50KHZvaWQpOw0KPj4gQEAgLTEwNyw5ICsxMTAsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
ZG9tYWluX21lbW9yeV9hZGRfbm9jaGsoc3RydWN0IA0KPj4gY29ubmVjdGlvbiAqY29ubiwN
Cj4+IMKgIHZvaWQgZG9tYWluX3dhdGNoX2luYyhzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubik7
DQo+PiDCoCB2b2lkIGRvbWFpbl93YXRjaF9kZWMoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4p
Ow0KPj4gwqAgaW50IGRvbWFpbl93YXRjaChzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubik7DQo+
PiAtdm9pZCBkb21haW5fb3V0c3RhbmRpbmdfaW5jKHN0cnVjdCBjb25uZWN0aW9uICpjb25u
KTsNCj4+IC12b2lkIGRvbWFpbl9vdXRzdGFuZGluZ19kZWMoc3RydWN0IGNvbm5lY3Rpb24g
KmNvbm4pOw0KPj4gLXZvaWQgZG9tYWluX291dHN0YW5kaW5nX2RvbWlkX2RlYyh1bnNpZ25l
ZCBpbnQgZG9taWQpOw0KPj4gK3ZvaWQgZG9tYWluX291dHN0YW5kaW5nX2luYyhzdHJ1Y3Qg
Y29ubmVjdGlvbiAqY29ubiwgdW5zaWduZWQgaW50IGRvbWlkKTsNCj4gDQo+IEFGQUlDVCwg
YWxsIHRoZSBjYWxsZXIgb2YgZG9tYWluX291dHN0YW5kaW5nX2luYygpIHdpbGwgcGFzcyAn
Y29ubi0+aWQnLiBTbyBpdCANCj4gaXMgbm90IGVudGlyZWx5IGNsZWFyIHdoYXQncyB0aGUg
YmVuZWZpdHMgdG8gYWRkIHRoZSBleHRyYSBwYXJhbWV0ZXIuDQoNCmRvbWFpbl9hY2NfYWRk
KCkgd2lsbCBuZWVkIGNvbm4uIEkgYWdyZWUgdGhhdCBJIHNob3VsZCBkcm9wIHRoZSBkb21p
ZA0KcGFyYW1ldGVyLg0KDQoNCkp1ZXJnZW4NCg0K
--------------KEYllicDOrIfjMYCxqnnIMog
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KEYllicDOrIfjMYCxqnnIMog--

--------------Rm8WJ3mb8Jcsj3d8pClM9LxW--

--------------FcxXT8qekjRmiPntJ9Rci2Tl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRR72kFAwAAAAAACgkQsN6d1ii/Ey9F
dQf9Ek9e2fCCniFtImYz1SfFBlRInCabKSX7y3w2m1F3CqKVf4GKv4m845vV21Hph22VUPJ7ogNq
kRNov81HNSQ3LQuPBg7wP4mGiCR6cONf88EGj7eMJump/AQD9utV+OXy0xvXiSFnBbdvx0E/5lD6
PHPORQjM0HyJocEZaGYxt5a71CgWIAJE/4LH45QSd2sDxoT+XQ0I5q63syBQu9B6m334g5ycjdld
4Q6sEUXRo8Sb5O7Z+844OT6MqptO1KXgxdLq4coC/ghBlaQunVCYSJtyVUVGI/qYbjEsH+axnBPv
fCImRNdaYZPPpEooPBduu8yFOmAfLMLUtYyFifpFXQ==
=SbpM
-----END PGP SIGNATURE-----

--------------FcxXT8qekjRmiPntJ9Rci2Tl--

