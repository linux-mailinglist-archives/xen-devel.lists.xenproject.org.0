Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C784AA84A
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 12:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265998.459637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGJ04-0002qv-1N; Sat, 05 Feb 2022 11:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265998.459637; Sat, 05 Feb 2022 11:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGJ03-0002nl-UH; Sat, 05 Feb 2022 11:13:03 +0000
Received: by outflank-mailman (input) for mailman id 265998;
 Sat, 05 Feb 2022 11:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yEFf=SU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nGJ03-0002nf-D2
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 11:13:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 952d7519-8674-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 12:13:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 894831F37D;
 Sat,  5 Feb 2022 11:13:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38C0D13B24;
 Sat,  5 Feb 2022 11:13:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WSepC71b/mGPGwAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 05 Feb 2022 11:13:01 +0000
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
X-Inumbo-ID: 952d7519-8674-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644059581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X1PvuDAEPQTFy4s9r+sr8P1ck2l4wpoBR6MmCqPrevQ=;
	b=Ic+DT1l8uDYuirElOMjYKSeCjgCtpoDZ8bp6gHBlhkHFvyrzApc6VdHXw537lAnd3f79db
	PM6uFPyrPdE0rl1ek/X4H6AEfieD91kFIToAonYmTuLu1hE0Fex7VkGxTr2eMXSiDwRwuQ
	roaUnkw9Wf/4rXV4xRBK+mnHuI/p/7g=
Message-ID: <ce764d2a-7368-6fbc-b44b-5c56f876d4d4@suse.com>
Date: Sat, 5 Feb 2022 12:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2] docs: document patch rules
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220203125438.21807-1-jgross@suse.com>
 <e91bde3e-dc45-c731-7df6-e0e45039d1b2@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e91bde3e-dc45-c731-7df6-e0e45039d1b2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NTAG9sN85UgH2H1dL8dul0zz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NTAG9sN85UgH2H1dL8dul0zz
Content-Type: multipart/mixed; boundary="------------AJL3ZBFSt8tesuqg0Bgx80kv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <ce764d2a-7368-6fbc-b44b-5c56f876d4d4@suse.com>
Subject: Re: [PATCH v2] docs: document patch rules
References: <20220203125438.21807-1-jgross@suse.com>
 <e91bde3e-dc45-c731-7df6-e0e45039d1b2@xen.org>
In-Reply-To: <e91bde3e-dc45-c731-7df6-e0e45039d1b2@xen.org>

--------------AJL3ZBFSt8tesuqg0Bgx80kv
Content-Type: multipart/mixed; boundary="------------Zuk8IKGv90zOO45QW1lE95de"

--------------Zuk8IKGv90zOO45QW1lE95de
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDIuMjIgMjA6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAwMy8wMi8yMDIyIDEyOjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gKyMjIFRoZSBj
b21taXQgbWVzc2FnZQ0KPj4gKw0KPj4gK1RoZSBjb21taXQgbWVzc2FnZSBpcyBmcmVlIHRl
eHQgZGVzY3JpYmluZyAqd2h5KiB0aGUgcGF0Y2ggaXMgZG9uZSBhbmQNCj4+ICsqaG93KiB0
aGUgZ29hbCBvZiB0aGUgcGF0Y2ggaXMgYWNoaWV2ZWQuIEEgZ29vZCBjb21taXQgbWVzc2Fn
ZSB3aWxsIA0KPj4gZGVzY3JpYmUNCj4+ICt0aGUgY3VycmVudCBzaXR1YXRpb24sIHRoZSBk
ZXNpcmVkIGdvYWwsIGFuZCB0aGUgd2F5IHRoaXMgZ29hbCBpcyBiZWluZw0KPj4gK2FjaGll
dmVkLiBQYXJ0cyBvZiB0aGF0IGNhbiBiZSBvbWl0dGVkIGluIG9idmlvdXMgY2FzZXMuDQo+
PiArDQo+PiArSW4gY2FzZSBhZGRpdGlvbmFsIGNoYW5nZXMgYXJlIGRvbmUgaW4gdGhlIHBh
dGNoIChsaWtlIGUuZy4gDQo+PiBjbGVhbnVwcyksIHRob3NlDQo+PiArc2hvdWxkIGJlIG1l
bnRpb25lZC4NCj4+ICsNCj4+ICtXaGVuIHJlZmVyZW5jaW5nIG90aGVyIHBhdGNoZXMgKGUu
Zy4gYHNpbWlsYXIgdG8gcGF0Y2ggeHkgLi4uYCkgdGhvc2UNCj4+ICtwYXRjaGVzIHNob3Vs
ZCBiZSByZWZlcmVuY2VkIHZpYSB0aGVpciBjb21taXQgaWQgKGF0IGxlYXN0IDEyIGRpZ2l0
cykNCj4+ICthbmQgdGhlIHBhdGNoIHN1YmplY3QsIGlmIHRoZSB2ZXJ5IHNhbWUgcGF0Y2gg
aXNuJ3QgcmVmZXJlbmNlZCBieSB0aGUNCj4+ICtgRml4ZXM6YCB0YWcsIHRvbzoNCj4+ICsN
Cj4+ICvCoMKgwqAgU2ltaWxhciB0byBjb21taXQgNjdkMDFjZGI1NTE4ICgieDg2OiBpbmZy
YXN0cnVjdHVyZSB0byBhbGxvdyANCj4+IGNvbnZlcnRpbmcNCj4+ICvCoMKgwqAgY2VydGFp
biBpbmRpcmVjdCBjYWxscyB0byBkaXJlY3Qgb25lcyIpIGFkZCAuLi4NCj4+ICsNCj4+ICtU
aGUgZm9sbG93aW5nIGBgZ2l0IGNvbmZpZ2BgIHNldHRpbmdzIGNhbiBiZSB1c2VkIHRvIGFk
ZCBhIHByZXR0eSANCj4+IGZvcm1hdCBmb3INCj4+ICtvdXRwdXR0aW5nIHRoZSBhYm92ZSBz
dHlsZSBpbiB0aGUgYGBnaXQgbG9nYGAgb3IgYGBnaXQgc2hvd2BgIGNvbW1hbmRzOg0KPj4g
Kw0KPj4gK8KgwqDCoMKgwqDCoMKgIFtjb3JlXQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhYmJyZXYgPSAxMg0KPj4gK8KgwqDCoMKgwqDCoMKgIFtwcmV0dHldDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpeGVzID0gRml4ZXM6ICVoIChc
IiVzXCIpDQo+PiArDQo+PiArTGluZXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBu
b3QgZXhjZWVkIDc1IGNoYXJhY3RlcnMsIGV4Y2VwdCB3aGVuDQo+IA0KPiBJIHdhcyB1bmRl
ciB0aGUgaW1wcmVzc2lvbiB0aGF0IGNvbW1pdCBtZXNzYWdlIHNob3VsZCBiZSB3cmFwIHRv
IDcyIA0KPiBjaGFyYWN0ZXJzLiBUaGlzIGlzIGJlY2F1c2UgdG9vbHMgbGlrZSAiZ2l0IGxv
ZyIgd291bGQgaW5kZW50IHRoZSBjb21taXQgDQo+IG1lc3NhZ2UgYnkgOCBjaGFyYWN0ZXJz
Lg0KDQpJIHRvb2sgdGhhdCB2YWx1ZSBmcm9tIHRoZSBkb2NzL3Byb2Nlc3MvdGFncy5wYW5k
b2MgZmlsZS4NCg0KQlRXLCBnaXQgbG9nIGlzIGluZGVudGluZyB0aGUgY29tbWl0IG1lc3Nh
Z2UgYnkgNCBjaGFyYWN0ZXJzIG9uIG15DQpzeXN0ZW0uDQoNCj4gDQo+PiArY29weWluZyBl
cnJvciBvdXRwdXQgZGlyZWN0bHkgaW50byB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+PiArDQo+
PiArIyMgVGFncw0KPj4gKw0KPj4gK1RhZ3MgYXJlIGVudHJpZXMgaW4gdGhlIGZvcm0NCj4+
ICsNCj4+ICvCoMKgwqAgVGFnOiBzb21ldGhpbmcNCj4+ICsNCj4+ICtJbiBnZW5lcmFsIHRh
Z3MgYXJlIGFkZGVkIGluIGNocm9ub2xvZ2ljYWwgb3JkZXIuIFNvIGEgYFJldmlld2VkLWJ5
OmAgDQo+PiB0YWcNCj4+ICtzaG91bGQgYmUgYWRkZWQgKiphZnRlcioqIHRoZSBgU2lnbmVk
LW9mZi1ieTpgIHRhZywgYXMgdGhlIHJldmlldyANCj4+IGhhcHBlbmVkDQo+PiArYWZ0ZXIg
dGhlIHBhdGNoIHdhcyB3cml0dGVuLg0KPj4gKw0KPj4gK0RvIG5vdCBzcGxpdCBhIHRhZyBh
Y3Jvc3MgbXVsdGlwbGUgbGluZXMsIHRhZ3MgYXJlIGV4ZW1wdCBmcm9tIHRoZQ0KPj4gKyJ3
cmFwIGF0IDc1IGNvbHVtbnMiIHJ1bGUgaW4gb3JkZXIgdG8gc2ltcGxpZnkgcGFyc2luZyBz
Y3JpcHRzLg0KPiANCj4gVGhpcyB3b3VsZCBuZWVkIHRvIGJlIGFkanVzdGVkIGRlcGVuZGlu
ZyBvbiB0aGUgYW5zd2VyIGFib3ZlLg0KPiANCj4+ICsNCj4+ICsjIyMgT3JpZ2luOg0KPj4g
Kw0KPj4gK1hlbiBoYXMgaW5oZXJpdGVkIHNvbWUgc291cmNlIGZpbGVzIGZyb20gb3RoZXIg
b3BlbiBzb3VyY2UgcHJvamVjdHMuIA0KPj4gSW4gY2FzZQ0KPj4gK2EgcGF0Y2ggbW9kaWZ5
aW5nIHN1Y2ggYW4gaW5oZXJpdGVkIGZpbGUgaXMgdGFrZW4gZnJvbSB0aGF0IHByb2plY3Qg
DQo+PiAobWF5YmUgaW4NCj4+ICttb2RpZmllZCBmb3JtKSwgdGhlIGBPcmlnaW46YCB0YWcg
c3BlY2lmaWVzIHRoZSBzb3VyY2Ugb2YgdGhlIHBhdGNoOg0KPj4gKw0KPj4gK8KgwqDCoCBP
cmlnaW46IDxyZXBvc2l0b3J5LVVSTD4gPGNvbW1pdC1pZD4NCj4gDQo+IE5JVDogTGlrZXMg
eW91IGRpZCBmb3IgRml4ZXMgdGFncywgY2FuIHlvdSBtYWtlIGNsZWFyIHRoYXQgdGhlIGNv
bW1pdCBpZCANCj4gc2hvdWxkIGJlIHRoZSBmaXJzdCAxMiBjaGFyYWN0ZXJzPyBTbyB0aGUg
bGluZS4uLg0KDQpPa2F5Lg0KDQoNCkp1ZXJnZW4NCg==
--------------Zuk8IKGv90zOO45QW1lE95de
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Zuk8IKGv90zOO45QW1lE95de--

--------------AJL3ZBFSt8tesuqg0Bgx80kv--

--------------NTAG9sN85UgH2H1dL8dul0zz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmH+W7wFAwAAAAAACgkQsN6d1ii/Ey8Y
Hgf/UQmJHc3llqFxNkNAAsNO0xFsgOqovEjaW5yg0BgxqH2l4abC4LUIefmpGZ85n9AcxGa1kpWO
098u+kdDZVEqOR0PTO2RqSLnWzZ3LB5bZm/1iP4ct0t4MwmWZH2QNvLoRWTfJuse45UyvNo20Of3
xt0JCmghChN4/7KvkMP92MAHXCYNkouGBTKRjNaPvZWsEjdrm+OLXiQyFkGGMTtEbmLInqgyNhfU
HQOqnClGdpuvOGAUJYn6Zoscadbeku9xUY3DLRRQXgf6bAouHRAU5bmYjKYrmKqoHIZi4q10oxE7
EYYBKE9E7AEPAL7/1Qizkp6cLjcZEwoBmoM72aM3Qg==
=KgzN
-----END PGP SIGNATURE-----

--------------NTAG9sN85UgH2H1dL8dul0zz--

