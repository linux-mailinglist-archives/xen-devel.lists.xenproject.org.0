Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36549690D9B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492660.762306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Cf-0005nI-9w; Thu, 09 Feb 2023 15:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492660.762306; Thu, 09 Feb 2023 15:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Cf-0005kj-6F; Thu, 09 Feb 2023 15:51:17 +0000
Received: by outflank-mailman (input) for mailman id 492660;
 Thu, 09 Feb 2023 15:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iTR=6F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQ9Cc-0005kH-SN
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:51:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9333d317-a891-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:51:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D877C20450;
 Thu,  9 Feb 2023 15:51:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FCC31339E;
 Thu,  9 Feb 2023 15:51:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G5q7IW4W5WPaRAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Feb 2023 15:51:10 +0000
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
X-Inumbo-ID: 9333d317-a891-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675957870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=49U/iiVX7PU9aoLxVLWAYTP6lS61c51jmxydm29uHtc=;
	b=bxpfDs8Fan+FwI3Qxv5RkD2ZK0WTQl7B+8LMv68tdxRAVVEarvcAeSee2cBtjZ+Vb2zm4S
	vnMnjjvAVC9diSzZe5EdwJVsam8ZpRA6izlY4Av3DfkDSM6VFWxL4JXPyoZNmTupHkpqPw
	1/uqX2aaD3+QhwlT23xSnKWIH/JDT4I=
Message-ID: <a0aca369-4f24-9237-cfe9-5a696116dbc2@suse.com>
Date: Thu, 9 Feb 2023 16:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
Content-Language: en-US
To: Edwin Torok <edwin.torok@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>
References: <20230209144148.4132-1-jgross@suse.com>
 <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
 <A8BEBA1E-A9B3-49D2-8EB7-5F17BA84D1D6@cloud.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <A8BEBA1E-A9B3-49D2-8EB7-5F17BA84D1D6@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9qqJbNJh8l4PnAyA0OIR80Vm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9qqJbNJh8l4PnAyA0OIR80Vm
Content-Type: multipart/mixed; boundary="------------i0UYneXcMppfZVX06uWtRjDq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Edwin Torok <edwin.torok@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>
Message-ID: <a0aca369-4f24-9237-cfe9-5a696116dbc2@suse.com>
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
References: <20230209144148.4132-1-jgross@suse.com>
 <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
 <A8BEBA1E-A9B3-49D2-8EB7-5F17BA84D1D6@cloud.com>
In-Reply-To: <A8BEBA1E-A9B3-49D2-8EB7-5F17BA84D1D6@cloud.com>

--------------i0UYneXcMppfZVX06uWtRjDq
Content-Type: multipart/mixed; boundary="------------hcwcFmc84N72XMQbRi5L07yj"

--------------hcwcFmc84N72XMQbRi5L07yj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDIuMjMgMTY6MjksIEVkd2luIFRvcm9rIHdyb3RlOg0KPiANCj4gDQo+PiBPbiA5
IEZlYiAyMDIzLCBhdCAxNToxNSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gMDkvMDIvMjAyMyAyOjQxIHBtLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOg0KPj4+IEluIGRvY3MvbWlzYy94ZW5zdG9yZS50eHQgdGhlIGRlc2Ny
aXB0aW9uIG9mIHRoZSBYZW5zdG9yZSBub2RlIGFjY2Vzcw0KPj4+IHBlcm1pc3Npb25zIGlz
IG1pc3Npbmcgb25lIGltcG9ydGFudCBhc3BlY3QsIHdoaWNoIGNhbiBiZSBmb3VuZCBvbmx5
DQo+Pj4gaW4gdGhlIGNvZGUgb3IgaW4gdGhlIHdpa2kgWzFdOg0KPj4+DQo+Pj4gVGhlIGZp
cnN0IHBlcm1pc3Npb24gZW50cnkgaXMgZGVmaW5pbmcgdGhlIG93bmVyIG9mIHRoZSBub2Rl
IHZpYSB0aGUNCj4+PiBkb21pZCwgYW5kIHRoZSBhY2Nlc3MgcmlnaHRzIGZvciBhbGwgZG9t
YWlucyBOT1QgaGF2aW5nIGEgZGVkaWNhdGVkDQo+Pj4gcGVybWlzc2lvbiBlbnRyeS4NCj4+
Pg0KPj4+IE1ha2UgdGhhdCBhc3BlY3QgY2xlYXIgaW4gdGhlIG9mZmljaWFsIGRvY3VtZW50
YXRpb24uDQo+Pj4NCj4+PiBbMV06IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtp
L1hlbkJ1cyNQZXJtaXNzaW9ucw0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4NCj4+IEkgZmVlbCBhcyBpZiBFZHZpbiBkZXNl
cnZlcyBzb21lIGtpbmQgb2YgY3JlZGl0IGhlcmUsIHNlZWluZyBhcyBpdCB3YXMNCj4+IGhp
cyBvYnNlcnZhdGlvbi4uLg0KPj4NCj4+IEFsc28sIENDIHRvIGRvdWJsZSBjaGVjayB0aGUg
d29yZGluZy4NCj4+DQo+PiB+QW5kcmV3DQo+Pg0KPj4+IC0tLQ0KPj4+IGRvY3MvbWlzYy94
ZW5zdG9yZS50eHQgfCAxNyArKysrKysrKysrLS0tLS0tLQ0KPj4+IDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdp
dCBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQgYi9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+
Pj4gaW5kZXggODg4N2U3ZGY4OC4uZDgwN2VmMDcwOSAxMDA2NDQNCj4+PiAtLS0gYS9kb2Nz
L21pc2MveGVuc3RvcmUudHh0DQo+Pj4gKysrIGIvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0K
Pj4+IEBAIC00NSwxMyArNDUsMTYgQEAgdGhlbSB0byB3aXRoaW4gMjA0OCBieXRlcy4gIChT
ZWUgWEVOU1RPUkVfKl9QQVRIX01BWCBpbiB4c193aXJlLmguKQ0KPj4+DQo+Pj4gRWFjaCBu
b2RlIGhhcyBvbmUgb3IgbXVsdGlwbGUgcGVybWlzc2lvbiBlbnRyaWVzLiAgUGVybWlzc2lv
bnMgYXJlDQo+Pj4gZ3JhbnRlZCBieSBkb21haW4taWQsIHRoZSBmaXJzdCBwZXJtaXNzaW9u
IGVudHJ5IG9mIGVhY2ggbm9kZSBzcGVjaWZpZXMNCj4+PiAtdGhlIG93bmVyIG9mIHRoZSBu
b2RlLiAgUGVybWlzc2lvbnMgb2YgYSBub2RlIGNhbiBiZSBjaGFuZ2VkIGJ5IHRoZQ0KPj4+
IC1vd25lciBvZiB0aGUgbm9kZSwgdGhlIG93bmVyIGNhbiBvbmx5IGJlIG1vZGlmaWVkIGJ5
IHRoZSBjb250cm9sDQo+Pj4gLWRvbWFpbiAodXN1YWxseSBkb21haW4gaWQgMCkuICBUaGUg
b3duZXIgYWx3YXlzIGhhcyB0aGUgcmlnaHQgdG8gcmVhZA0KPj4+IC1hbmQgd3JpdGUgdGhl
IG5vZGUsIHdoaWxlIG90aGVyIHBlcm1pc3Npb25zIGNhbiBiZSBzZXR1cCB0byBhbGxvdw0K
Pj4+IC1yZWFkIGFuZC9vciB3cml0ZSBhY2Nlc3MuICBXaGVuIGEgZG9tYWluIGlzIGJlaW5n
IHJlbW92ZWQgZnJvbSBYZW5zdG9yZQ0KPj4+IC1ub2RlcyBvd25lZCBieSB0aGF0IGRvbWFp
biB3aWxsIGJlIHJlbW92ZWQgdG9nZXRoZXIgd2l0aCBhbGwgb2YgdGhvc2UNCj4+PiAtbm9k
ZXMnIGNoaWxkcmVuLg0KPj4+ICt0aGUgb3duZXIgb2YgdGhlIG5vZGUsIHdobyBhbHdheXMg
aGFzIGZ1bGwgYWNjZXNzIHRvIHRoZSBub2RlIChyZWFkIGFuZA0KPj4+ICt3cml0ZSBwZXJt
aXNzaW9uKS4NCj4gDQo+Pj4gICBUaGUgYWNjZXNzIHJpZ2h0cyBvZiB0aGUgZmlyc3QgZW50
cnkgc3BlY2lmeSB0aGUNCj4+PiArYWxsb3dlZCBhY2Nlc3MgZm9yIGFsbCBkb21haW5zIG5v
dCBoYXZpbmcgYSBkZWRpY2F0ZWQgcGVybWlzc2lvbiBlbnRyeQ0KPj4+ICsodGhlIGRlZmF1
bHQgaXMgIm4iLCByZW1vdmluZyBhY2Nlc3MgZm9yIGFsbCBkb21haW5zIG5vdCBleHBsaWNp
dGx5DQo+Pj4gK2FkZGVkIHZpYSBhZGRpdGlvbmFsIHBlcm1pc3Npb24gZW50cmllcykuICBQ
ZXJtaXNzaW9ucyBvZiBhIG5vZGUgY2FuIGJlDQo+Pj4gK2NoYW5nZWQgYnkgdGhlIG93bmVy
IG9mIHRoZSBub2RlLCB0aGUgb3duZXIgY2FuIG9ubHkgYmUgbW9kaWZpZWQgYnkgdGhlDQo+
Pj4gK2NvbnRyb2wgZG9tYWluICh1c3VhbGx5IGRvbWFpbiBpZCAwKS4NCj4gDQo+IFRoaXMg
bG9va3MgZ29vZCBpbiBnZW5lcmFsLCBvbmUgc21hbGwgbml0cGljaywgbWF5YmUgd2UgbmVl
ZCBzb21ldGhpbmcgbGlrZSB0aGlzIHRvbzoNCj4gIiwgb3IgZG9tYWlucyBlcXVpdmFsZW50
IHRvIHRoZSBvd25lciBvciBjb250cm9sIGRvbWFpbiAoZG9tYWluIGVxdWl2YWxlbmNlIGNh
biBiZSBlc3RhYmxpc2hlZCB3aXRoIHRoZSBwcml2aWxlZ2VkIFNFVF9UQVJHRVQgb3BlcmF0
aW9uKSINCg0KVGhpcyBpcyBhbHJlYWR5IHBhcnQgb2YgdGhlIFNFVF9UQVJHRVQgZGVzY3Jp
cHRpb24uIFNvIEkgZG9uJ3QgdGhpbmsgd2UNCm5lZWQgdG8gYWRkIGl0IGhlcmUsIHRvby4N
Cg0KDQpKdWVyZ2VuDQo=
--------------hcwcFmc84N72XMQbRi5L07yj
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------hcwcFmc84N72XMQbRi5L07yj--

--------------i0UYneXcMppfZVX06uWtRjDq--

--------------9qqJbNJh8l4PnAyA0OIR80Vm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPlFm4FAwAAAAAACgkQsN6d1ii/Ey+m
QAf/bj6vNccMlTvInb3jfCrGaMK37l83R0qRkU/LSRw3mhnF1T+vDNVVhd3JKg6kEyonAXUGvFYX
Vn76ln/vyNwK3RzN/y92nHH27Qe54pASno3bguUoPE5661/z5jNQOzo0mGgjyFXLAUkPesGBK8Rr
N7sy07eLJ19rum/icIsy3yloNRVLFAalIceu5355t92LYsWFszLta5xBaFR4jKw0xkikkJqY7iu6
sGYevT2OGSc5MSpUA8Q+/Jy1XmsESfUXOQBB0uTtQYONFVs6JLbG+oHk+ulRD6I2R+QBoNbPFm5g
SyAZYJ6EzruepuPdO0VYlPiMjl8lGWk4SlJv35Iy6Q==
=Pzsx
-----END PGP SIGNATURE-----

--------------9qqJbNJh8l4PnAyA0OIR80Vm--

