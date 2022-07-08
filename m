Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1365A56B3D7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363286.593780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9inB-0000Iq-5a; Fri, 08 Jul 2022 07:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363286.593780; Fri, 08 Jul 2022 07:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9inB-0000Gh-1n; Fri, 08 Jul 2022 07:52:49 +0000
Received: by outflank-mailman (input) for mailman id 363286;
 Fri, 08 Jul 2022 07:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t/Gy=XN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o9in9-0000GV-I8
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:52:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f47f4d8f-fe92-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 09:52:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE0C721F5B;
 Fri,  8 Jul 2022 07:52:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7161213A80;
 Fri,  8 Jul 2022 07:52:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ax5RGk3ix2LlHQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 08 Jul 2022 07:52:45 +0000
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
X-Inumbo-ID: f47f4d8f-fe92-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657266765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t4D9RfTAQWC+qfyzoegfYjecdgOP1F1e53TNcrggaQ0=;
	b=sGB6+2n+TfYuS0IWWg6dRINUd1OVvDX+s/WXrWmvrrwb9xBE86UtOo8dF24h9e/xbylghc
	NBH7++l8mH7tF6unkIDydVmWYtoBI6/1Jw4D6GizU3KeN7b4N2GlwgMQgiKEs1ECxtXX5Q
	ds2He09bf5J7TLyinxWnN058ZwyI4Ko=
Message-ID: <8de438f0-992f-0528-c083-50b28fc9cc8d@suse.com>
Date: Fri, 8 Jul 2022 09:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Xen 4.17: Proposed release schedule
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>
References: <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2EEk60gvzM6RZwm0DQIoXtUb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2EEk60gvzM6RZwm0DQIoXtUb
Content-Type: multipart/mixed; boundary="------------3vBh3taEIDchCDwcl8Z0GTg4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>
Message-ID: <8de438f0-992f-0528-c083-50b28fc9cc8d@suse.com>
Subject: Re: Xen 4.17: Proposed release schedule
References: <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>

--------------3vBh3taEIDchCDwcl8Z0GTg4
Content-Type: multipart/mixed; boundary="------------cAyvVxGvtPm9Lp0e3EZJocgq"

--------------cAyvVxGvtPm9Lp0e3EZJocgq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDcuMjIgMDk6MzUsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+IEhpLA0KPiANCj4gQXMg
ZGlzY3Vzc2VkIGluIHRoZSBjb21tdW5pdHkgY2FsbCBvbiBKdWx5IDcsIHRoZSByZWxlYXNl
IHNjaGVkdWxlIGZvciBYZW4gNC4xNw0KPiBpcyBwcm9wb3NlZCBiZWxvdy4gUGxlYXNlIHNl
bmQgY29tbWVudHMgQVNBUCBhbmQgaW4gYW55IGNhc2UgYnkgdGhlIGVuZCBvZg0KPiBGcmlk
YXkgdGhlIDE1dGggb2YgSnVseS4gSSBob3BlIHdlIGNhbiBmaW5hbGlzZSB0aGUgc2NoZWR1
bGUgdGhlbi4NCj4gDQo+IE9yaWdpbmFsIGRhdGUgZm9sbG93aW5nIHRoZSA4IG1vbnRoIHJl
bGVhc2UgY3ljbGUgKEF1Z3VzdCAyMDIyKSBpcyBsaWtlbHkgdG8gbWlzcw0KPiBjb25zaWRl
cmluZyB0aGUgc3VtbWVyIHNlYXNvbiBpbiBFdXJvcGUgYW5kIHRoZSBmYWN0IHRoYXQgd2Ug
d291bGQgaGF2ZSBoYWQgdG8NCj4gZmVhdHVyZSBmcmVlemUgaW4gSnVseSwgYnV0IHRoaXMg
aXMgbGlrZWx5IHRvIGJlIG5vdCBmZWFzaWJsZSBhbnltb3JlLg0KPiANCj4gQmFzZWQgb24g
dGhlIFhlbiA0LjE2IHJlbGVhc2UgdGltZWxpbmUsIGZvciBYZW4gNC4xNyByZWxlYXNlOg0K
PiANCj4gUHJvcG9zZWQgb3B0aW9uIDE6IFdlZCBTZXAgMjgsIDIwMjINCj4gKCs5IG1vbnRo
cyBmcm9tIFhlbiA0LjE2IHJlbGVhc2UsIGFmdGVyIFhlbiBTdW1taXQpDQo+IA0KPiAtIExh
c3QgcG9zdGluZyBkYXRlICAgICAgICAgIEZyaSBKdWwgMjksIDIwMjIgKCszIHdlZWtzIGZy
b20gbm93KQ0KPiANCj4gUGF0Y2hlcyBhZGRpbmcgbmV3IGZlYXR1cmVzIHNob3VsZCBiZSBw
b3N0ZWQgdG8gdGhlIG1haWxpbmcgbGlzdA0KPiBieSB0aGlzIGRhdGUsIGFsdGhvdWdoIHBl
cmhhcHMgbm90IGluIHRoZWlyIGZpbmFsIHZlcnNpb24uDQo+IA0KPiAtIEZlYXR1cmUgZnJl
ZXplICAgICAgICAgICAgIEZyaSBBdWcgMTksIDIwMjIgKCszIHdlZWtzIGZyb20gTGFzdCBw
b3N0aW5nIGRhdGUpDQo+IA0KPiBQYXRjaGVzIGFkZGluZyBuZXcgZmVhdHVyZXMgc2hvdWxk
IGJlIGNvbW1pdHRlZCBieSB0aGlzIGRhdGUuDQo+IFN0cmFpZ2h0Zm9yd2FyZCBidWdmaXhl
cyBtYXkgY29udGludWUgdG8gYmUgYWNjZXB0ZWQgYnkgbWFpbnRhaW5lcnMuDQo+IA0KPiAt
IENvZGUgZnJlZXplICAgICAgICAgICAgICAgIEZyaSBTZXAgOSwgMjAyMiAoKzMgd2Vla3Mg
ZnJvbSBGZWF0dXJlIGZyZWV6ZSkNCj4gDQo+IEJ1Z2ZpeGVzIG9ubHkuDQo+IA0KPiAtIEhh
cmQgY29kZSBmcmVlemUgICAgICAgICAgIEZyaSBTZXAgMTYsIDIwMjIgKCsxIHdlZWsgZnJv
bSBDb2RlIGZyZWV6ZSkNCj4gDQo+IEJyYW5jaCBvZmYgc3RhZ2luZy00LjE3LiBCdWdmaXhl
cyBmb3Igc2VyaW91cyBidWdzIChpbmNsdWRpbmcgcmVncmVzc2lvbnMpLA0KPiBhbmQgbG93
LXJpc2sgZml4ZXMgb25seS4NCj4gDQo+IC0gRmluYWwgY29tbWl0cyAgICAgICAgICAgICAg
RnJpIFNlcCAyMywgMjAyMiAoKzEgd2VlayBmcm9tIEhhcmQgY29kZSBmcmVlemUpDQo+IA0K
PiBEb2NzL3ByZXAgb25seQ0KPiANCj4gLSBSZWxlYXNlICAgICAgICAgICAgICAgICAgICBX
ZWQgU2VwIDI4LCAyMDIyDQo+IA0KPiANCj4gUHJvcG9zZWQgb3B0aW9uIDI6IFdlZCBOb3Yg
MiwgMjAyMg0KPiAoKzEgeWVhciBmcm9tIFhlbiA0LjE2IHJlbGVhc2UpDQoNCisxIGZvciB0
aGlzIG9wdGlvbi4NCg0KPiANCj4gLSBMYXN0IHBvc3RpbmcgZGF0ZSAgICAgICAgICBGcmkg
QXVnIDEyLCAyMDIyICgrNSB3ZWVrcyBmcm9tIG5vdykNCj4gDQo+IC0gRmVhdHVyZSBmcmVl
emUgICAgICAgICAgICAgRnJpIFNlcCAyLCAyMDIyICgrMyB3ZWVrcyBmcm9tIExhc3QgcG9z
dGluZyBkYXRlKQ0KPiANCj4gLSBDb2RlIGZyZWV6ZSAgICAgICAgICAgICAgICBGcmkgU2Vw
IDIzLCAyMDIyICgrMyB3ZWVrcyBmcm9tIEZlYXR1cmUgZnJlZXplKQ0KPiANCj4gLSBIYXJk
IGNvZGUgZnJlZXplICAgICAgICAgICBGcmkgT2N0IDE0LCAyMDIyICgrMyB3ZWVrcyBmcm9t
IENvZGUgZnJlZXplKQ0KPiANCj4gLSBGaW5hbCBjb21taXRzICAgICAgICAgICAgICBGcmkg
T2N0IDI4LCAyMDIyICgrMiB3ZWVrcyBmcm9tIEhhcmQgY29kZSBmcmVlemUpDQo+IA0KPiAt
IFJlbGVhc2UgICAgICAgICAgICAgICAgICAgIFdlZCBOb3YgMiwgMjAyMg0KDQoNCkp1ZXJn
ZW4NCg==
--------------cAyvVxGvtPm9Lp0e3EZJocgq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------cAyvVxGvtPm9Lp0e3EZJocgq--

--------------3vBh3taEIDchCDwcl8Z0GTg4--

--------------2EEk60gvzM6RZwm0DQIoXtUb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLH4k0FAwAAAAAACgkQsN6d1ii/Ey+j
OAf+LvLY/yhU0JSd6VkF6TEAwy09x/2wYYfVsPoAxRdJIJOd1b++/whdOYBjkSj3mHvqTl9M5JHh
1s/uo8lf+h+za1apHxmCX1wthqMM70l7Kx1nJpGVw0Ef/kM4itIPMQb/p/qdqqLsefY4DrnTZxAO
5/kFrUqO+RjWWRlLxhsC2HnZ6i4q/qyaIv37u32o7x5EytIN2851cbsbOf/AXhBqxMLF+peDD0Sf
6alZKe0xic0ZQCW394qmdoC4xXw3Zxrw5+CjjnENKjJRmqQnk4ccClJKLwJg0DTMGVcN4RDivGIL
+348a3NwEIpReUo3JZbShDtIWTVYIyIcU8WmArrZlQ==
=jS8y
-----END PGP SIGNATURE-----

--------------2EEk60gvzM6RZwm0DQIoXtUb--

