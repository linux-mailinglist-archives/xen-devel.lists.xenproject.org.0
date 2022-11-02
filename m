Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8493616507
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 15:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435957.689933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqEe4-0002zV-Cc; Wed, 02 Nov 2022 14:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435957.689933; Wed, 02 Nov 2022 14:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqEe3-0002xl-Vx; Wed, 02 Nov 2022 14:23:07 +0000
Received: by outflank-mailman (input) for mailman id 435957;
 Wed, 02 Nov 2022 14:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O20d=3C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqEe2-0002xK-TN
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 14:23:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddda2bcd-5ab9-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 15:23:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C4992275B;
 Wed,  2 Nov 2022 14:23:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8FE313AE0;
 Wed,  2 Nov 2022 14:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wed8N0h9YmMmWAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Nov 2022 14:23:04 +0000
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
X-Inumbo-ID: ddda2bcd-5ab9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667398985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LJAo3gqPTp8Orsxtic1quHFTdRiwvXrv/5/2uhasay8=;
	b=bW6SuY+uF78250akBRtgJBMhltenqJJ9LlwitamPeP7sC54AcVuR07noGVXfB/AuWv021g
	WLr+HxSwTOAdah5IDQopAOytpqZ67DxBWaSzNryOgTo45eT7evZjTAH8A+bMkt8tbKV2U9
	HSW/PybvQR38+eQ22o/tFpucY2DmIzA=
Message-ID: <d0087734-6bd3-00fa-8479-0480d2650ffc@suse.com>
Date: Wed, 2 Nov 2022 15:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
References: <20221028111231.31355-1-jgross@suse.com>
 <b1ae29cc-71c8-63c3-467c-59450a6e3c32@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.17 v2] xen/sched: migrate timers to correct cpus
 after suspend
In-Reply-To: <b1ae29cc-71c8-63c3-467c-59450a6e3c32@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qGAe3Qu00wlImgkbLbEnQwXD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qGAe3Qu00wlImgkbLbEnQwXD
Content-Type: multipart/mixed; boundary="------------phEBqqbFRTkO94t0cIMRLoRT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Message-ID: <d0087734-6bd3-00fa-8479-0480d2650ffc@suse.com>
Subject: Re: [PATCH-for-4.17 v2] xen/sched: migrate timers to correct cpus
 after suspend
References: <20221028111231.31355-1-jgross@suse.com>
 <b1ae29cc-71c8-63c3-467c-59450a6e3c32@suse.com>
In-Reply-To: <b1ae29cc-71c8-63c3-467c-59450a6e3c32@suse.com>

--------------phEBqqbFRTkO94t0cIMRLoRT
Content-Type: multipart/mixed; boundary="------------1zpEi0ObdjF8TLIYNnSQpALV"

--------------1zpEi0ObdjF8TLIYNnSQpALV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMTEuMjIgMTU6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4xMC4yMDIy
IDEzOjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgYWxsIHRpbWVycyBhcmUg
bWlncmF0ZWQgdG8gY3B1IDAgd2hlbiB0aGUgc3lzdGVtIGlzIGJlaW5nDQo+PiBzdXNwZW5k
ZWQuIFRoZXkgYXJlIG5vdCBtaWdyYXRlZCBiYWNrIGFmdGVyIHJlc3VtaW5nIHRoZSBzeXN0
ZW0gYWdhaW4uDQo+Pg0KPj4gVGhpcyByZXN1bHRzIChhdCBsZWFzdCkgdG8gcHJvYmxlbXMg
d2l0aCB0aGUgY3JlZGl0IHNjaGVkdWxlciwgYXMgdGhlDQo+PiB0aW1lciBpc24ndCBoYW5k
bGVkIG9uIHRoZSBjcHUgaXQgd2FzIGV4cGVjdGVkIHRvIG9jY3VyLg0KPiANCj4gV2hpbGUg
eW91IHNheSAiYXQgbGVhc3QiLCB0aGlzIGRvZXNuJ3QgcmVhbGx5IG1ha2UgY2xlYXIgaW4g
aG93IGZhciBhbGwNCj4gZm91ciB0aW1lcnMgZm9yIHdoaWNoIHlvdSBjaGFuZ2UgdGhlaXIg
aGFuZGxpbmcgYXJlIGFjdHVhbGx5IHByb2JsZW1hdGljLA0KPiBvciB3aGV0aGVyIGZvciBz
b21lIHlvdSBtYWtlIHRoZSBhZGp1c3RtZW50ICJqdXN0IGluIGNhc2UiLiBMb29raW5nIGF0
DQo+IGNvcmUuYydzIHNfdGltZXIgSSdtIGluY2xpbmVkIHRvIHNheSB0aGF0IHdpdGggc190
aW1lcl9mbigpIHJhaXNpbmcgdGhlDQo+IHNjaGVkdWxlIHNvZnRpcnEgdGhpbmdzIGNhbid0
IGdvIHdlbGwgd2hlbiB0aGlzIGRvZXNuJ3QgaGFwcGVuIG9uIHRoZQ0KPiBjb3JyZWN0IENQ
VS4gSnVzdCB0aGF0IGl0IHdvbid0IGJlIGFuIG9idmlvdXMgcHJvYmxlbSBsaWtlIHRoZSBj
cmFzaCBpbg0KPiBjcmVkaXQxIHdoaWNoIGhhZCBwcm9tcHRlZCB0aGUgY3JlYXRpb24gb2Yg
dGhpcyBwYXRjaC4NCj4gDQo+PiBBZGQgbWlncmF0aW5nIHRoZSBzY2hlZHVsaW5nIHJlbGF0
ZWQgdGltZXJzIG9mIGEgc3BlY2lmaWMgY3B1IGZyb20gY3B1DQo+PiAwIGJhY2sgdG8gaXRz
IG9yaWdpbmFsIGNwdSB3aGVuIHRoYXQgY3B1IGhhcyBnb25lIHVwIHdoZW4gcmVzdW1pbmcg
dGhlDQo+PiBzeXN0ZW0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KPiANCj4gSXMgdGhlcmUgYW55IEZpeGVzOiB0YWcgcG9zc2li
bGU/IElmIG5vdCwgY291bGQgeW91IGFkZCBhIHJlc3BlY3RpdmUNCj4gbm90ZSBpbiB0aGUg
cG9zdC1jb21taXQtbWVzc2FnZSBhcmVhLCB0byBpbmNyZWFzZSB0aGUgY2hhbmNlIG9mDQo+
IHJlY2FsbGluZyB0aGF0IHRoaXMgd2lsbCB3YW50IHF1ZXVpbmcgZm9yIGJhY2twb3J0PyAo
T3IgbWF5YmUgdGhlIGxhY2sNCj4gb2YgYSByZWFzb25hYmxlIEZpeGVzOiB0YWcgY291bGQg
YWN0dWFsbHkganVzdGlmeSB0aGUgdXNlIG9mIHRoZQ0KPiBCYWNrcG9ydDogb25lLikNCg0K
SSdtIG5vdCBzdXJlIHdoZXRoZXIgaXQgaXMgcmVhbGx5IGNvcnJlY3QsIGJ1dCBJIGFzc3Vt
ZSB0aGUgbW9zdCBwcm9iYWJsZQ0KY2FuZGlkYXRlIGZvciBhIEZpeGVzOiB0YWcgd291bGQg
YmUgY29tbWl0IDA3NjNjZDI2ODc4OS4NCg0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vc2No
ZWQvY29yZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4gQEAgLTEy
ODQsNiArMTI4NCwzMiBAQCBzdGF0aWMgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcl9jaGVj
ayh1bnNpZ25lZCBpbnQgY3B1KQ0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAg
DQo+PiArLyoNCj4+ICsgKiBDYWxsZWQgYWZ0ZXIgYSBjcHUgaGFzIGNvbWUgdXAgYWdhaW4g
aW4gYSBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4NCj4+ICsgKiBOb3RlIHRoYXQgb24gYSBzeXN0
ZW0gd2l0aCBzbXQ9MCB0aGlzIHdpbGwgYmUgY2FsbGVkIGZvciB0aGUgc2libGluZyBjcHVz
LA0KPj4gKyAqIHRvbywgc28gdGhlIGNhc2UgZm9yIG5vIHNjaGVkdWxpbmcgcmVzb3VyY2Ug
YmVpbmcgYXZhaWxhYmxlIG11c3QgYmUNCj4+ICsgKiBjb25zaWRlcmVkLg0KPiANCj4gSSB0
aGluayB0aGlzIHBhcnQgb2YgdGhlIGNvbW1lbnQgd291bGQgYmV0dGVyIGxpdmUgLi4uDQo+
IA0KPj4gKyAqIE1pZ3JhdGUgYWxsIHRpbWVycyBmb3IgdGhpcyBjcHUgKHRoZXkgaGF2ZSBi
ZWVuIG1pZ3JhdGVkIHRvIGNwdSAwIHdoZW4gdGhlDQo+PiArICogY3B1IHdhcyBnb2luZyBk
b3duKS4NCj4+ICsgKiBOb3RlIHRoYXQgb25seSB0aW1lcnMgcmVsYXRlZCB0byBhIHBoeXNp
Y2FsIGNwdSBhcmUgbWlncmF0ZWQsIG5vdCB0aGUgb25lcw0KPj4gKyAqIHJlbGF0ZWQgdG8g
YSB2Y3B1IG9yIGRvbWFpbi4NCj4+ICsgKi8NCj4+ICt2b2lkIHNjaGVkX21pZ3JhdGVfdGlt
ZXJzKHVuc2lnbmVkIGludCBjcHUpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3Qgc2NoZWRfcmVz
b3VyY2UgKnNyOw0KPj4gKw0KPj4gKyAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1
bG9jayk7DQo+PiArDQo+PiArICAgIHNyID0gZ2V0X3NjaGVkX3JlcyhjcHUpOw0KPiANCj4g
Li4uIGluYmV0d2VlbiBoZXJlLCBpbmNyZWFzaW5nIHRoZSBjaGFuY2UgdGhhdCB0aGVyZSB3
b24ndCBiZSBzb21lb25lDQo+IHRyeWluZyB0byByZW1vdmUgdGhlIGV4dHJhIGNoZWNrIC4u
Lg0KDQpPa2F5Lg0KDQo+IA0KPj4gKyAgICBpZiAoIHNyICYmIHNyLT5tYXN0ZXJfY3B1ID09
IGNwdSApDQo+IA0KPiAuLi4gZnJvbSBoZXJlLg0KPiANCj4gSSBmdXJ0aGVyIHRoaW5rIHRo
YXQgZXhwbGljaXRseSBtZW50aW9uaW5nICJzbXQ9MCIgaXNuJ3QgdmVyeSBoZWxwZnVsLg0K
PiBBaXVpIGEgc3lzdGVtIHdpdGggc29tZSBDUFVzIG90aGVyd2lzZSBzb2Z0LW9mZmxpbmVk
IHdvdWxkIHN1ZmZlciB0aGUNCj4gc2FtZSBwcm9ibGVtLiBBbmQgSSBmdXJ0aGVyIGFzc3Vt
ZSBubyBwcm9ibGVtIHdvdWxkIG9jY3VyIGV2ZW4gd2l0aA0KPiAic210PTAiIG9uIEFNRCBo
YXJkd2FyZSBvciBBcm0gKHdoZXJlIHdlIGRvbid0IHBhcmsgQ1BVcykuIEF0IHRoZSB2ZXJ5
DQo+IGxlYXN0IEknZCB0aGVyZWZvcmUgbGlrZSB0byBhc2sgZm9yICJlLmcuIiB0byBiZSBp
bnNlcnRlZDsgYmV0dGVyDQo+IHdvdWxkIGJlIGEgbW9yZSBnZW5lcmljIHN0YXRlbWVudCBs
aWtlICJ3aXRoIHNvbWUgQ1BVcyBwYXJrZWQiLg0KDQpJJ2xsIGdvIHdpdGggdGhlIGxhdHRl
ci4NCg0KDQpKdWVyZ2VuDQo=
--------------1zpEi0ObdjF8TLIYNnSQpALV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1zpEi0ObdjF8TLIYNnSQpALV--

--------------phEBqqbFRTkO94t0cIMRLoRT--

--------------qGAe3Qu00wlImgkbLbEnQwXD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNifUgFAwAAAAAACgkQsN6d1ii/Ey+n
Twf8CTjZU7GA4g4HXYuM/4IRp0q17HgdwcCXkTSxtCbplsLh+hJYNLOQC0k592CCNrwWV8Ll0bhP
77qXjBNPOqI2Duk5IMFAGxNVeYprnOJJ0ggcF3g8n8KzgHQgJfcudBJ3vWRraO+xqCSMzOeu/xeN
FFJbWvOjOKn9Tc/cBJlqSyMWTj7JhOT+r4eHgRAlXa9tcJOS4QDSkbAyTdVW/N0TvUsovpoYd8ix
ay28m3XjodZMoPvLRr0AO8mcRLqrWztgk9TnOAIfcvJLsUyzeZ/A0+OxUYAdUY2K0f04ExU6Olzj
/P3KEmUxFvA7uCrA/qJhaxV6Bdq11IgtUsZQ0COFZQ==
=1oY8
-----END PGP SIGNATURE-----

--------------qGAe3Qu00wlImgkbLbEnQwXD--

