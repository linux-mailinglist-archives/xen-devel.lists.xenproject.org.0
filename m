Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5676FD13
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577009.903781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqvn-0002Gs-4E; Fri, 04 Aug 2023 09:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577009.903781; Fri, 04 Aug 2023 09:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqvn-0002Eg-1d; Fri, 04 Aug 2023 09:17:11 +0000
Received: by outflank-mailman (input) for mailman id 577009;
 Fri, 04 Aug 2023 09:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRqvl-0002Ea-8c
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:17:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af6d25a1-32a7-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 11:17:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D406C1F8AC;
 Fri,  4 Aug 2023 09:17:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC26113904;
 Fri,  4 Aug 2023 09:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AgVSKBLCzGTSEQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 09:17:06 +0000
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
X-Inumbo-ID: af6d25a1-32a7-11ee-b26b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691140626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wuhFyyBsmhqFJy/tFrhyQ9oLDM6hdh5JtrRuEZ1uje0=;
	b=mEYLpPJ2ahCtlDBYyAFozRQj0oed6CNe1Z3143kmq9YXEsDtDLysKfvvy5R4UFSXn6S9p4
	QdEYRWawcGsXGLJhPEaLedE+p/dYGzLJxnnDD/mR4BeUFDga24G5hSbJMpUzOCrcs/cA1p
	z1cQkxYOzqRHfFsCXXIJ6yPL2mMA7Rc=
Message-ID: <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
Date: Fri, 4 Aug 2023 11:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
 <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
In-Reply-To: <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mnyo4W0MMQmYmayX1fHAIwPt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mnyo4W0MMQmYmayX1fHAIwPt
Content-Type: multipart/mixed; boundary="------------PzyW7ymNkITIEblOCoSW18N2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
 <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
In-Reply-To: <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>

--------------PzyW7ymNkITIEblOCoSW18N2
Content-Type: multipart/mixed; boundary="------------E5aInlkZvtzM3zKWrZJCmhhX"

--------------E5aInlkZvtzM3zKWrZJCmhhX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjMgMjM6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyNC8wNy8yMDIzIDEyOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF93YXRjaC5jIGIvdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX3dhdGNoLmMNCj4+IGluZGV4IDg2Y2Y4MzIyYjQuLjI2NjJhM2ZhNDkgMTAw
NjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfd2F0Y2guYw0KPj4gKysr
IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3dhdGNoLmMNCj4+IEBAIC0xNjYsMTkgKzE2
NiwxMiBAQCBzdGF0aWMgaW50IGRlc3Ryb3lfd2F0Y2godm9pZCAqX3dhdGNoKQ0KPj4gwqAg
c3RhdGljIGludCBjaGVja193YXRjaF9wYXRoKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBj
b25zdCB2b2lkICpjdHgsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnN0IGNoYXIgKipwYXRoLCBib29sICpyZWxhdGl2ZSkNCj4+IMKgIHsNCj4+IC3CoMKg
wqAgLyogQ2hlY2sgaWYgdmFsaWQgZXZlbnQuICovDQo+PiAtwqDCoMKgIGlmIChzdHJzdGFy
dHMoKnBhdGgsICJAIikpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCAqcmVsYXRpdmUgPSBmYWxz
ZTsNCj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoc3RybGVuKCpwYXRoKSA+IFhFTlNUT1JFX1JF
TF9QQVRIX01BWCkNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gaW52YWw7DQo+
IA0KPiBJIGNhbid0IGZpbmQgYW4gZXhhY3QgbWF0Y2hpbmcgY2hlY2sgaW4gaXNfdmFsaWRf
bm9kZW5hbWUoKS4gVGhlIGNhbGwgYWxzbyBzZWVtcyANCj4gdG8gcHV0IG1vcmUgcmVzdHJp
Y3Rpb24gb24gJ0AnIG5vZGUuIENhbiB5b3UgY2xhcmlmeT8NCg0KVGhlIGNhbGwgb2YgZG9t
YWluX21heF9jaGsoKSBpbiBpc192YWxpZF9ub2RlbmFtZSgpIHdpbGwgY2hlY2sgdGhlIGxl
bmd0aA0Kb2YgdGhlIG5vZGUgbmFtZSAoYXQgbGVhc3QgZm9yIHVucHJpdmlsZWdlZCBjYWxs
ZXJzLCB3aGljaCBpcyB0aGUgaW1wb3J0YW50DQpjYXNlKS4NCg0KVGhlIGFkZGl0aW9uYWwg
cmVzdHJpY3Rpb25zIGZvciBzcGVjaWFsIG5vZGVzIGFyZToNCg0KLSB0aGV5IGNhbid0IGVu
ZCB3aXRoICIvIg0KLSB0aGV5IGNhbid0IGNvbnRhaW4gIi8vIg0KLSB0aGV5IGNhbid0IGNv
bnRhaW4gY2hhcmFjdGVycyBvdGhlciB0aGFuIHRoZSBvbmVzIGFsbG93ZWQgZm9yIG5vcm1h
bCBub2Rlcw0KDQpOb25lIG9mIHRob3NlIHJlc3RyaWN0aW9ucyBhcmUgcHJvYmxlbWF0aWMu
IEkgY2FuIGFkZCBzb21ldGhpbmcgdG8gdGhlDQpjb21taXQgbWVzc2FnZSBpZiB5b3Ugd2Fu
dC4NCg0KDQpKdWVyZ2VuDQo=
--------------E5aInlkZvtzM3zKWrZJCmhhX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------E5aInlkZvtzM3zKWrZJCmhhX--

--------------PzyW7ymNkITIEblOCoSW18N2--

--------------mnyo4W0MMQmYmayX1fHAIwPt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTMwhIFAwAAAAAACgkQsN6d1ii/Ey/9
cAf+KxAjqy/7vQNR7PeYHTD6iUxLkyuEZyIHLg8Jd7bVyzd9pU0zpDhDt/40l4sF1NyjEpEoHLKl
qIHtSkFdi+roRi80050AlhnBY0/cdu2cLFNc0iemoq1Hl724NMPpVjUvMW3+GN02Fn8Rd+oEGyuq
aOnBroycbchsTR9fZxMJ3/TH7wWiZzkcP0/C3+226PzFj2wusJ8nTiw4IHx2kZQBuplfhXwYH9sz
ayQ8fi5SjRjEco1hZubR0YOcL5tDAOoTkvRufqNrhj3kyt4kEvIBIzO3N0MORGSzbuG9VcBvpp6Q
OnZSoAD0DRElNC4DcyY8bdzkuEEIk57FocpuqW+tBw==
=CoUR
-----END PGP SIGNATURE-----

--------------mnyo4W0MMQmYmayX1fHAIwPt--

