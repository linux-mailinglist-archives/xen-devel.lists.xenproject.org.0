Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB14B9DD9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274644.470194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeVl-0004oh-5d; Thu, 17 Feb 2022 10:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274644.470194; Thu, 17 Feb 2022 10:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeVl-0004mH-1E; Thu, 17 Feb 2022 10:59:45 +0000
Received: by outflank-mailman (input) for mailman id 274644;
 Thu, 17 Feb 2022 10:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9h7v=TA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKeVj-0004lL-Kn
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:59:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ac42a0-8fe0-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 11:59:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BD4C1F37D;
 Thu, 17 Feb 2022 10:59:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BA0913DD8;
 Thu, 17 Feb 2022 10:59:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bk3+AJ4qDmIlTwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 17 Feb 2022 10:59:42 +0000
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
X-Inumbo-ID: b5ac42a0-8fe0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645095582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AZV3S2C9Olws3SAVZKEWCpXK/WAFTRAOKoTzYU0jXLg=;
	b=daZDJ/sF/DaHriFdy6MgdU4mD76n5aGwHsV72TKh+xU0wEESruJOp9KihUFee0jc6caZN3
	NID3RPHtlUaNCL5v/KB8qHYoGeG7/rqSLKwxzo27zrj7kjisDhDCGi0oOHMYt2PAKDJm5y
	jeLnVn5LUquK+1iYcqBTI3qL57xoKvs=
Message-ID: <d03ca9b8-9b47-eae7-dbdf-e6f3eb131ebe@suse.com>
Date: Thu, 17 Feb 2022 11:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] tools/xenstore: add error indicator to ring page
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220210111620.5256-1-jgross@suse.com>
 <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>
 <8891ed69-2ad2-2842-e34e-8252860b71d9@suse.com>
 <Yg4p9eq4A7b+FimR@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Yg4p9eq4A7b+FimR@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hbj147hcyzmyU0jgILszg2x0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hbj147hcyzmyU0jgILszg2x0
Content-Type: multipart/mixed; boundary="------------yQHfNujSpnkp8SESQXV3HC6u";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <d03ca9b8-9b47-eae7-dbdf-e6f3eb131ebe@suse.com>
Subject: Re: [PATCH] tools/xenstore: add error indicator to ring page
References: <20220210111620.5256-1-jgross@suse.com>
 <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>
 <8891ed69-2ad2-2842-e34e-8252860b71d9@suse.com>
 <Yg4p9eq4A7b+FimR@perard.uk.xensource.com>
In-Reply-To: <Yg4p9eq4A7b+FimR@perard.uk.xensource.com>

--------------yQHfNujSpnkp8SESQXV3HC6u
Content-Type: multipart/mixed; boundary="------------Oe0ldEXZrcJvsjTFafS7jIjo"

--------------Oe0ldEXZrcJvsjTFafS7jIjo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDIuMjIgMTE6NTYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIEZl
YiAxNSwgMjAyMiBhdCAwNDo0NToyOFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMTUuMDIuMjIgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IE9uIFRo
dSwgRmViIDEwLCAyMDIyIGF0IDEyOjE2OjIwUE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+ICtUaGUgIkNvbm5lY3Rpb24gZXJyb3IgaW5kaWNhdG9yIiBpcyB1c2VkIHRv
IGxldCB0aGUgc2VydmVyIGluZGljYXRlIGl0IGhhcw0KPj4+PiArZGV0ZWN0ZWQgc29tZSBl
cnJvciB0aGF0IGxlZCB0byBkZWFjdGl2YXRpb24gb2YgdGhlIGNvbm5lY3Rpb24gYnkgdGhl
IHNlcnZlci4NCj4+Pj4gK0lmIHRoZSBmZWF0dXJlIGhhcyBiZWVuIGFkdmVydGlzZWQgdGhl
biB0aGUgIkNvbm5lY3Rpb24gZXJyb3IgaW5kaWNhdG9yIiBtYXkNCj4+Pj4gK3Rha2UgdGhl
IGZvbGxvd2luZyB2YWx1ZXM6DQo+Pj4+ICsNCj4+Pj4gK1ZhbHVlICAgRGVzY3JpcHRpb24N
Cj4+Pj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+ICswICAgICAgIE5vIGVycm9yLCBjb25uZWN0aW9u
IGlzIHZhbGlkDQo+Pj4+ICsxICAgICAgIENvbW11bmljYXRpb24gcHJvYmxlbXMgKGV2ZW50
IGNoYW5uZWwgbm90IGZ1bmN0aW9uYWwpDQo+Pj4+ICsyICAgICAgIEluY29uc2lzdGVudCBw
cm9kdWNlciBvciBjb25zdW1lciBvZmZzZXQNCj4+Pj4gKzMgICAgICAgUHJvdG9jb2wgdmlv
bGF0aW9uIChjbGllbnQgZGF0YSBwYWNrYWdlIHRvbyBsb25nKQ0KPj4+DQo+Pj4gSXMgdGhp
cyBtZWFudCB0byBiZSB0aGUgb25seSBwb3NzaWJsZSBlcnJvciB2YWx1ZT8gSWYgaW4gdGhl
IGZ1dHVyZSB3ZQ0KPj4+IHdhbnQgdG8gYWRkIG1vcmUgcG9zc2libGUgZXJyb3IsIGRvZXMg
aXQgZ29pbmcgdG8gbmVlZCBhIG5ldyBmZWF0dXJlDQo+Pj4gYml0IGFuZCBtYXliZSBhIG5l
dyBlcnJvciBmaWVsZD8NCj4+DQo+PiBObywgYXMgdGhlIGd1ZXN0IGlzIG5vdCBvcHRpbmcg
aW50byB0aGlzIGZlYXR1cmUsIGJ1dCBqdXN0IGdldHMgaXQNCj4+IHByZXNlbnRlZCwgdGhl
cmUgaXMgbm8gbmVlZCB0byBoYXZlIGFub3RoZXIgYml0IGZvciBuZXcgZXJyb3IgdmFsdWVz
Lg0KPiANCj4gVGhpcyBwcm9iYWJseSBuZWVkcyB0byBiZSBzcGVsbGVkIG91dCBpbiB0aGUg
ZG9jdW1lbnRzIHRoYXQuDQo+IA0KPj4gTm90ZSB0aGF0IHRoaXMgaXMgYSBwdXJlbHkgaW5m
b3JtYXRpb25hbCBpbnRlcmZhY2UuIFRoZSBlcnJvciB2YWx1ZQ0KPj4gKG90aGVyIHRoYW4g
MCkgaXMgb25seSBmb3IgZGlhZ25vc3RpYyBwdXJwb3NlcywgdGhlcmUgaXMgbm8gd2F5IGEN
Cj4+IGd1ZXN0IGNvdWxkIHJlYWN0IGluIGEgc2FuZSB3YXkgdG8gYSBzcGVjaWZpYyBlcnJv
ciBjYXNlLg0KPiANCj4gVGhpcyBjb3VsZCBhbHNvIGJlIHNwZWxsZWQgb3V0IGluIHRoZSBk
b2N1bWVudCwgaW4gdGhlIG5ldyBzZWN0aW9uICJUaGUNCj4gY29ubmVjdGlvbiBlcnJvciBm
ZWF0dXJlIiwgdGhhdCBhIHZhbHVlIG90aGVyIHRoYW4gMCBpcyBhIGNvbm5lY3Rpb24NCj4g
ZXJyb3IgZXZlbiBpZiB0aGUgZXJyb3IgbnVtYmVyIGlzbid0IGtub3duIHRvIHRoZSBjbGll
bnQuDQoNCk9rYXksIHdpbGwgYWRkIHNvbWV0aGluZyB0byB0aGUgZG9jIChmb3IgYm90aCBp
c3N1ZXMpLg0KDQoNCkp1ZXJnZW4NCg==
--------------Oe0ldEXZrcJvsjTFafS7jIjo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Oe0ldEXZrcJvsjTFafS7jIjo--

--------------yQHfNujSpnkp8SESQXV3HC6u--

--------------hbj147hcyzmyU0jgILszg2x0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIOKp0FAwAAAAAACgkQsN6d1ii/Ey+1
Ygf/RxCmxS7MHMbd84KonTNKvxhgyTrmNauQnhJ8aWqMxGsiRVn8gOd2A3Jvx6VX+SdFmg21UQhR
1/Hi+U+ozBs9oQ0VPl5cipBxpM9xf2Gy5xHcQWxRL7XQQ5X4QUf6/muiORhj1dEI/EdM9UHWK4WP
w3fiUijnA1K3naUsb00/ASBMK5hgrC7Zla5FuuDIIc3GA966UG4qoYvtYO9TnveUh7ydr/SSQcdl
M4sAo+7Q9MpEJzUSguX10ExXKddIpYB4t+Z0uaDls0eSC1UJvN41NBr4oPIKIcwzd8yFiQHnA8zy
1ee/d/B3Mr6c+PQVRO/AZ1LgTN/PQyhpGs2XpN/ZIQ==
=sYcV
-----END PGP SIGNATURE-----

--------------hbj147hcyzmyU0jgILszg2x0--

