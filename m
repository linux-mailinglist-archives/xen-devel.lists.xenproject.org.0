Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F36654BF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 07:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475077.736585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFUnd-0001il-Ps; Wed, 11 Jan 2023 06:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475077.736585; Wed, 11 Jan 2023 06:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFUnd-0001h1-M7; Wed, 11 Jan 2023 06:41:25 +0000
Received: by outflank-mailman (input) for mailman id 475077;
 Wed, 11 Jan 2023 06:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvS=5I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pFUnb-0001gv-SU
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 06:41:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f621b1ea-917a-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 07:41:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D52F767FD;
 Wed, 11 Jan 2023 06:41:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CF0413591;
 Wed, 11 Jan 2023 06:41:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9TdUDRFavmOtEQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 11 Jan 2023 06:41:21 +0000
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
X-Inumbo-ID: f621b1ea-917a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673419281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+vW4S4y4+XfNKdBHLKvlFz/sa6uAIQgJqHzcbiqqzL0=;
	b=iB2JM4997ocQyGAojts/fvPXeOPTAFwDW43/uqWUvk4DGPQLIoVHXMyOMLoqRFjIBp66h/
	93M5g9g8ijuYGoPoALWGDXG/LhyNcuswtPNsSegxfLMmeF9/auv4SuPCz+2I2eAclZWSz1
	kcOGsO1Oh701vpx8iHqQVbvjWeU98eU=
Message-ID: <db863117-a383-4373-d43d-7072bdf57a96@suse.com>
Date: Wed, 11 Jan 2023 07:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/19] tools/xenstore: introduce dummy nodes for
 special watch paths
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-8-jgross@suse.com>
 <ef0ed925-5c07-a5c2-c7e6-f5a8ad21d480@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <ef0ed925-5c07-a5c2-c7e6-f5a8ad21d480@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PKamcPk8MnVCPoaJSA6OwDn2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PKamcPk8MnVCPoaJSA6OwDn2
Content-Type: multipart/mixed; boundary="------------7q8kZOtFBX4uJ9pMUoKvfi7t";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <db863117-a383-4373-d43d-7072bdf57a96@suse.com>
Subject: Re: [PATCH v2 07/19] tools/xenstore: introduce dummy nodes for
 special watch paths
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-8-jgross@suse.com>
 <ef0ed925-5c07-a5c2-c7e6-f5a8ad21d480@xen.org>
In-Reply-To: <ef0ed925-5c07-a5c2-c7e6-f5a8ad21d480@xen.org>

--------------7q8kZOtFBX4uJ9pMUoKvfi7t
Content-Type: multipart/mixed; boundary="------------ITGsB4urG0ZsP17XW4b2tN4Y"

--------------ITGsB4urG0ZsP17XW4b2tN4Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTIuMjIgMjA6MzksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEzLzEyLzIwMjIgMTY6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
bnN0ZWFkIG9mIHNwZWNpYWwgY2FzaW5nIHRoZSBwZXJtaXNzaW9uIGhhbmRsaW5nIGFuZCB3
YXRjaCBldmVudA0KPj4gZmlyaW5nIGZvciB0aGUgc3BlY2lhbCB3YXRjaCBwYXRocyAiQGlu
dHJvZHVjZURvbWFpbiIgYW5kDQo+PiAiQHJlbGVhc2VEb21haW4iLCB1c2Ugc3RhdGljIGR1
bW15IG5vZGVzIGFkZGVkIHRvIHRoZSBkYXRhIGJhc2Ugd2hlbg0KPj4gc3RhcnRpbmcgWGVu
c3RvcmUuDQo+Pg0KPj4gVGhlIG5vZGUgYWNjb3VudGluZyBuZWVkcyB0byByZWZsZWN0IHRo
YXQgY2hhbmdlIGJ5IGFkZGluZyB0aGUgc3BlY2lhbA0KPj4gbm9kZXMgaW4gdGhlIGRvbWFp
bl9lbnRyeV9maXgoKSBjYWxsIGluIHNldHVwX3N0cnVjdHVyZSgpLg0KPj4NCj4+IE5vdGUg
dGhhdCB0aGlzIHJlcXVpcmVzIHRvIHJld29yayB0aGUgY2FsbHMgb2YgZmlyZV93YXRjaGVz
KCkgZm9yIHRoZQ0KPj4gc3BlY2lhbCBldmVudHMgaW4gb3JkZXIgdG8gYXZvaWQgbGVha2lu
ZyBtZW1vcnkuDQo+Pg0KPj4gTW92ZSB0aGUgY2hlY2sgZm9yIGEgdmFsaWQgbm9kZSBuYW1l
IGZyb20gZ2V0X25vZGUoKSB0bw0KPj4gZ2V0X25vZGVfY2Fub25pY2FsaXplZCgpLCBhcyBp
dCBhbGxvd3MgdG8gdXNlIGdldF9ub2RlKCkgZm9yIHRoZQ0KPj4gc3BlY2lhbCBub2Rlcywg
dG9vLg0KPj4NCj4+IEluIG9yZGVyIHRvIGF2b2lkIHJlYWQgYW5kIHdyaXRlIGFjY2Vzc2Vz
IHRvIHRoZSBzcGVjaWFsIG5vZGVzIHVzZSBhDQo+PiBzcGVjaWFsIHZhcmlhbnQgZm9yIG9i
dGFpbmluZyB0aGUgY3VycmVudCBub2RlIGRhdGEgZm9yIHRoZSBwZXJtaXNzaW9uDQo+PiBo
YW5kbGluZy4NCj4+DQo+PiBUaGlzIGFsbG93cyB0byBzaW1wbGlmeSBxdWl0ZSBzb21lIGNv
ZGUuIEluIGZ1dHVyZSBzdWItbm9kZXMgb2YgdGhlDQo+PiBzcGVjaWFsIG5vZGVzIHdpbGwg
YmUgcG9zc2libGUgZHVlIHRvIHRoaXMgY2hhbmdlLCBhbGxvd2luZyBtb3JlIGZpbmUNCj4+
IGdyYWluZWQgcGVybWlzc2lvbiBjb250cm9sIG9mIHNwZWNpYWwgZXZlbnRzIGZvciBzcGVj
aWZpYyBkb21haW5zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVjI6DQo+PiAtIGFkZCBnZXRfc3BlY19ub2Rl
KCkNCj4+IC0gZXhwYW5kIGNvbW1pdCBtZXNzYWdlIChKdWxpZW4gR3JhbGwpDQo+PiAtLS0N
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250cm9sLmMgfMKgwqAgMyAtDQo+
PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jwqDCoMKgIHzCoCA5MiArKysr
KysrKystLS0tLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmPC
oCB8IDE2MiArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX2RvbWFpbi5owqAgfMKgwqAgNiAtLQ0KPj4gwqAgdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX3dhdGNoLmPCoMKgIHzCoCAxNyArLS0NCj4+IMKgIDUgZmlsZXMg
Y2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMjAwIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5jIA0KPj4gYi90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5jDQo+PiBpbmRleCBkMWFhYTAwYmY0
Li40MWU2OTkyNTkxIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2NvbnRyb2wuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvbnRyb2wu
Yw0KPj4gQEAgLTY3Niw5ICs2NzYsNiBAQCBzdGF0aWMgY29uc3QgY2hhciAqbHVfZHVtcF9z
dGF0ZShjb25zdCB2b2lkICpjdHgsIHN0cnVjdCANCj4+IGNvbm5lY3Rpb24gKmNvbm4pDQo+
PiDCoMKgwqDCoMKgIGlmIChyZXQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7
DQo+PiDCoMKgwqDCoMKgIHJldCA9IGR1bXBfc3RhdGVfY29ubmVjdGlvbnMoZnApOw0KPj4g
LcKgwqDCoCBpZiAocmV0KQ0KPj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Ow0KPj4gLcKg
wqDCoCByZXQgPSBkdW1wX3N0YXRlX3NwZWNpYWxfbm9kZXMoZnApOw0KPj4gwqDCoMKgwqDC
oCBpZiAocmV0KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Ow0KPj4gwqDCoMKg
wqDCoCByZXQgPSBkdW1wX3N0YXRlX25vZGVzKGZwLCBjdHgpOw0KPj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfY29yZS5jDQo+PiBpbmRleCAxNjUwODIxOTIyLi5mOTY3MTRlMWI4IDEwMDY0NA0K
Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gKysrIGIvdG9v
bHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gQEAgLTYxNiw3ICs2MTYsOCBAQCBz
dGF0aWMgdm9pZCBnZXRfYWNjX2RhdGEoVERCX0RBVEEgKmtleSwgc3RydWN0IA0KPj4gbm9k
ZV9hY2NvdW50X2RhdGEgKmFjYykNCj4+IMKgIHN0YXRpYyB1bnNpZ25lZCBpbnQgZ2V0X2Fj
Y19kb21pZChzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgVERCX0RBVEEgKmtleSwNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBkb21p
ZCkNCj4+IMKgIHsNCj4+IC3CoMKgwqAgcmV0dXJuICghY29ubiB8fCBrZXktPmRwdHJbMF0g
PT0gJy8nKSA/IGRvbWlkIDogY29ubi0+aWQ7DQo+PiArwqDCoMKgIHJldHVybiAoIWNvbm4g
fHwga2V5LT5kcHRyWzBdID09ICcvJyB8fCBrZXktPmRwdHJbMF0gPT0gJ0AnKQ0KPiANCj4g
VGhlIGNvbW1lbnQgb24gdG9wIG9mIGdldF9hY2NfZG9taWQoKSBuZWVkcyB0byBiZSB1cGRh
dGVkLg0KDQpPaCwgeWVzLg0KDQo+IA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgID8gZG9t
aWQgOiBjb25uLT5pZDsNCj4+IMKgIH0NCj4gDQo+IFsuLi5dDQo+IA0KPj4gK3N0YXRpYyB2
b2lkIGZpcmVfc3BlY2lhbF93YXRjaGVzKGNvbnN0IGNoYXIgKm5hbWUpDQo+PiArew0KPj4g
K8KgwqDCoCB2b2lkICpjdHggPSB0YWxsb2NfbmV3KE5VTEwpOw0KPj4gK8KgwqDCoCBzdHJ1
Y3Qgbm9kZSAqbm9kZTsNCj4+ICsNCj4+ICvCoMKgwqAgaWYgKCFjdHgpDQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuOw0KPj4gKw0KPj4gK8KgwqDCoCBub2RlID0gcmVhZF9ub2RlKE5V
TEwsIGN0eCwgbmFtZSk7DQo+PiArDQo+PiArwqDCoMKgIGlmIChub2RlKQ0KPj4gK8KgwqDC
oMKgwqDCoMKgIGZpcmVfd2F0Y2hlcyhOVUxMLCBjdHgsIG5hbWUsIG5vZGUsIHRydWUsIE5V
TEwpOw0KPiANCj4gTklUOiBJIHdvdWxkIGNvbnNpZGVyIHRvIGxvZyBhbiBlcnJvciAobWF5
YmUgb25seSBvbmNlKSBpZiAnbm9kZScgaXMgTlVMTC4gVGhlIA0KPiBwdXJwb3NlIGlzIHRv
IGhlbHAgZGVidWdnaW5nIFhlbnN0b3JlZC4NCg0KSSB0aGluayB3ZSBjYW4gbG9nIGl0IGFs
d2F5cywgYXMgdGhpcyBpcyByZWFsbHkgYSBiYWQgcHJvYmxlbS4NCg0KDQpKdWVyZ2VuDQo=

--------------ITGsB4urG0ZsP17XW4b2tN4Y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ITGsB4urG0ZsP17XW4b2tN4Y--

--------------7q8kZOtFBX4uJ9pMUoKvfi7t--

--------------PKamcPk8MnVCPoaJSA6OwDn2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO+WhAFAwAAAAAACgkQsN6d1ii/Ey/H
HAgAhOvLTDg5w53w2vG33Eum8ZngSadlt2L2Rjfn1Ylv7h9REeNHJQO39LYrXz6y8PcQ2pGcFVlY
h8giNYfid8dn2fxCtrNFX5yRcstPKc/vIxkB/v2KPBIGecuzk6/ZJlY+k6o/coQIl8H30M3+JZV8
0/TL7lcjGHyhH7LDWdU3q5MDXMaEWNrmAmv1uXzAlgSpto24bv/C0gnmHRT3ODUjGFO5flM9v0PF
eJ6R29srn8o+yZyRAmSFV373SnPNEe9iXAdbXvtG457XFDFYZRt/FaBDUrxTpJD7BATf+An0jaJt
UlQvAIHDNP8YS9SuN0ZO5Sc2lBO39Q+jHDfG/7Qtrg==
=idBP
-----END PGP SIGNATURE-----

--------------PKamcPk8MnVCPoaJSA6OwDn2--

