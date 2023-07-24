Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C075EC42
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 09:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568429.887726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNpiW-0005Fw-T3; Mon, 24 Jul 2023 07:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568429.887726; Mon, 24 Jul 2023 07:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNpiW-0005Dn-Q5; Mon, 24 Jul 2023 07:10:52 +0000
Received: by outflank-mailman (input) for mailman id 568429;
 Mon, 24 Jul 2023 07:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNpiV-0005Dh-62
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 07:10:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36731c15-29f1-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 09:10:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE43E20530;
 Mon, 24 Jul 2023 07:10:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9AD613476;
 Mon, 24 Jul 2023 07:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ADr0J/YjvmQUWQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 07:10:46 +0000
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
X-Inumbo-ID: 36731c15-29f1-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690182646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wGdw6L5Irrk6yDag1TxdszPFdNtqQWzSzOQrMRNBAII=;
	b=XxcGcqdhLkC56COgT9o59x+tqEcBccxap511qXiZcKReapDeeAuOQ4bQdM334BcUWHNsU/
	F/0etLLgDQVCVDMTz6MJpTbNhT6Gxn7yIR/6mxTDWO55ir+Uxz92Ex1Sz41mQBbeQfssBV
	m1L2HcDTzDYO6zjoQNVuxuH82Jsy9E8=
Message-ID: <2fca0a55-3cbf-1875-62c9-2d27cbdd5f20@suse.com>
Date: Mon, 24 Jul 2023 09:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] tools/xenstore: add const to the return type of
 canonicalize()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230722081646.4136-1-jgross@suse.com>
 <20230722081646.4136-2-jgross@suse.com>
 <adc0b17a-1d59-8c52-8823-64a0d9ec475b@xen.org>
 <e374c950-7dce-2e28-3b4c-946f4a0a2aec@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e374c950-7dce-2e28-3b4c-946f4a0a2aec@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ALdJADnA5JcckD5BJtzooL08"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ALdJADnA5JcckD5BJtzooL08
Content-Type: multipart/mixed; boundary="------------gUdvVkpBSt90FpA0yWG8Zspm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2fca0a55-3cbf-1875-62c9-2d27cbdd5f20@suse.com>
Subject: Re: [PATCH v2 1/2] tools/xenstore: add const to the return type of
 canonicalize()
References: <20230722081646.4136-1-jgross@suse.com>
 <20230722081646.4136-2-jgross@suse.com>
 <adc0b17a-1d59-8c52-8823-64a0d9ec475b@xen.org>
 <e374c950-7dce-2e28-3b4c-946f4a0a2aec@xen.org>
In-Reply-To: <e374c950-7dce-2e28-3b4c-946f4a0a2aec@xen.org>

--------------gUdvVkpBSt90FpA0yWG8Zspm
Content-Type: multipart/mixed; boundary="------------EIDVkL9Fplmbhrcus0FK050z"

--------------EIDVkL9Fplmbhrcus0FK050z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDcuMjMgMTg6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAy
Mi8wNy8yMDIzIDE2OjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBKdWVyZ2VuLA0K
Pj4NCj4+IE9uIDIyLzA3LzIwMjMgMDk6MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4g
LXN0YXRpYyBzdHJ1Y3Qgd2F0Y2ggKmFkZF93YXRjaChzdHJ1Y3QgY29ubmVjdGlvbiAqY29u
biwgY2hhciAqcGF0aCwgY2hhciANCj4+PiAqdG9rZW4sDQo+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHJlbGF0aXZlLCBib29sIG5vX3F1b3RhX2No
ZWNrKQ0KPj4+ICtzdGF0aWMgc3RydWN0IHdhdGNoICphZGRfd2F0Y2goc3RydWN0IGNvbm5l
Y3Rpb24gKmNvbm4sIGNvbnN0IGNoYXIgKnBhdGgsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICp0b2tlbiwgYm9vbCByZWxhdGl2ZSwN
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgbm9fcXVv
dGFfY2hlY2spDQo+Pj4gwqAgew0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IHdhdGNoICp3YXRj
aDsNCj4+PiBAQCAtMjE4LDEyICsyMTksMTQgQEAgaW50IGRvX3dhdGNoKGNvbnN0IHZvaWQg
KmN0eCwgc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIA0KPj4+IHN0cnVjdCBidWZmZXJlZF9k
YXRhICppbikNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgd2F0Y2ggKndhdGNo
Ow0KPj4+IMKgwqDCoMKgwqAgY2hhciAqdmVjWzJdOw0KPj4+ICvCoMKgwqAgY29uc3QgY2hh
ciAqcGF0aDsNCj4+PiDCoMKgwqDCoMKgIGJvb2wgcmVsYXRpdmU7DQo+Pj4gwqDCoMKgwqDC
oCBpZiAoZ2V0X3N0cmluZ3MoaW4sIHZlYywgQVJSQVlfU0laRSh2ZWMpKSAhPSBBUlJBWV9T
SVpFKHZlYykpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFSU5WQUw7DQo+Pj4g
LcKgwqDCoCBlcnJubyA9IGNoZWNrX3dhdGNoX3BhdGgoY29ubiwgY3R4LCAmKHZlY1swXSks
ICZyZWxhdGl2ZSk7DQo+Pj4gK8KgwqDCoCBwYXRoID0gdmVjWzBdOw0KPj4+ICvCoMKgwqAg
ZXJybm8gPSBjaGVja193YXRjaF9wYXRoKGNvbm4sIGN0eCwgJnBhdGgsICZyZWxhdGl2ZSk7
DQo+Pg0KPj4gwqBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGNoZWNrX3dhdGNoX3BhdGgoKSBj
b3VsZCB1cGRhdGUgdmVjWzBdIHdoaWNoIGlzIHRoZW4gDQo+PiB1c2VkIGJlbG93LiBCdXQg
d2l0aCB5b3VyIGNoYW5nZSwgdmVjWzBdIHdvdWxkIG5vdCBiZSB1cGRhdGVkIGFueW1vcmUu
DQo+Pg0KPj4gSSBjYW4gc2VlIHR3byBwb3NzaWJsZSBhcHByb2FjaDoNCj4+IMKgwqDCoCAx
KSBnZXRfc3RyaW5ncygpIGlzIHRha2luZyBhIGNvbnN0IGFzIHdlbGwNCj4gDQo+IEkgaGF2
ZSBhIHBhdGNoIGRvaW5nIHRoaXMuIEkgd2lsbCBzZW5kIGl0IG9uIE1vbmRheS4NCg0KSG1t
LCBsb29raW5nIGF0IHRoaXMgSSB0aGluayB0aGlzIHdpbGwgY29sbGlkZSB3aXRoIG15IHBh
dGNoLg0KDQpXb3VsZCB5b3UgbWluZCBtZSBkb2luZyB0aGUgY29udmVyc2lvbiBvZiBnZXRf
c3RyaW5ncygpIGluIG15IHBhdGNoLCB0b28/DQoNCg0KSnVlcmdlbg0K
--------------EIDVkL9Fplmbhrcus0FK050z
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------EIDVkL9Fplmbhrcus0FK050z--

--------------gUdvVkpBSt90FpA0yWG8Zspm--

--------------ALdJADnA5JcckD5BJtzooL08
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS+I/YFAwAAAAAACgkQsN6d1ii/Ey+i
4Qf5AZhtQG4lY/SvKx1DeFWNRz0LjPXYLNw3cE265hQMjKNbpaPZ75dvbbp6MLK2x4VLyKVnTQdj
JQxEEp1zRQhbUOYGtgBuDlizTa62ZgbtylsgUalI2IcPmgd1oFnrdT++Lqwa0m5So5cLRDrDfBr7
RgnbZcoXSP7mveAenDV9Aa+ZbfZX7i02fdx0weWTQ/5MAFt4Ny5giJqpCputTBcQDtscrNQ9lBpv
z1pAZhhpdk9REnRGxiIszrjRTmJ2/6MwyBf4Es/QLwuAPpai5r+XVtQQS9nRK2DVxvFbixtRtey7
4CpE0zbw+H4ydTPco7Rl9eNECfzwmN0SdGME4/JFjQ==
=ahRt
-----END PGP SIGNATURE-----

--------------ALdJADnA5JcckD5BJtzooL08--

