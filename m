Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC34EEBC5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297319.506431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEnj-0003hb-6F; Fri, 01 Apr 2022 10:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297319.506431; Fri, 01 Apr 2022 10:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEnj-0003eh-3E; Fri, 01 Apr 2022 10:46:43 +0000
Received: by outflank-mailman (input) for mailman id 297319;
 Fri, 01 Apr 2022 10:46:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1naEnh-0003eb-6W
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:46:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02a7e451-b1a9-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 12:46:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 268F61FD00;
 Fri,  1 Apr 2022 10:46:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6883132C1;
 Fri,  1 Apr 2022 10:46:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 44w8Mw7YRmIaBAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Apr 2022 10:46:38 +0000
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
X-Inumbo-ID: 02a7e451-b1a9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648809999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26NEk7VUw7+DjntA35ch5bBv1llhNsW1xqQQFxBntHE=;
	b=fRU+bptA5bc5ckMjZcQERmL0k9HJEUzAy4AcBfKqU7RnkBLH3vCVxv8Xnv4wBpOHoGf10C
	v8hXNSb9Zxokd4bPFdDF9HWuHZTblFAwI1HcPq+awirlIZGg2117aCZ0BKMJRbAvTpyLuU
	gsOmtsYEVL0Xb6GwfmuHTrVqb5zwB9A=
Message-ID: <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
Date: Fri, 1 Apr 2022 12:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ldw0HiRYns5gC0Tccu07ONYW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ldw0HiRYns5gC0Tccu07ONYW
Content-Type: multipart/mixed; boundary="------------GNxH0YUAEABkxBSGYVkx0oX0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
In-Reply-To: <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>

--------------GNxH0YUAEABkxBSGYVkx0oX0
Content-Type: multipart/mixed; boundary="------------EUHIbn803tWTjlfPTHDzJLNa"

--------------EUHIbn803tWTjlfPTHDzJLNa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDQuMjIgMTI6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBJ
IGhhdmUgcG9zdGVkIHNvbWUgY29tbWVudHMgaW4gdjMgYWZ0ZXIgeW91IHNlbnQgdGhpcyB2
ZXJzaW9uLiBQbGVhc2UgaGF2ZSBhIGxvb2suDQo+IA0KPiBPbiAwMS8wNC8yMDIyIDAxOjM4
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiArc3RhdGljIGludCBpbml0X2RvbWFp
bihzdHJ1Y3QgeHNfaGFuZGxlICp4c2gsIGxpYnhsX2RvbWluZm8gKmluZm8pDQo+PiArew0K
Pj4gK8KgwqDCoCBzdHJ1Y3QgeGNfaW50ZXJmYWNlX2NvcmUgKnhjaDsNCj4+ICvCoMKgwqAg
bGlieGxfdXVpZCB1dWlkOw0KPj4gK8KgwqDCoCB1aW50NjRfdCB4ZW5zdG9yZV9ldnRjaG4s
IHhlbnN0b3JlX3BmbjsNCj4+ICvCoMKgwqAgaW50IHJjOw0KPj4gKw0KPj4gK8KgwqDCoCBw
cmludGYoIkluaXQgZG9tMGxlc3MgZG9tYWluOiAldVxuIiwgaW5mby0+ZG9taWQpOw0KPj4g
K8KgwqDCoCB4Y2ggPSB4Y19pbnRlcmZhY2Vfb3BlbigwLCAwLCAwKTsNCj4+ICsNCj4+ICvC
oMKgwqAgcmMgPSB4Y19odm1fcGFyYW1fZ2V0KHhjaCwgaW5mby0+ZG9taWQsIEhWTV9QQVJB
TV9TVE9SRV9FVlRDSE4sDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJnhlbnN0b3JlX2V2dGNobik7DQo+PiArwqDCoMKgIGlmIChy
YyAhPSAwKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJGYWlsZWQgdG8gZ2V0IEhW
TV9QQVJBTV9TVE9SRV9FVlRDSE5cbiIpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAx
Ow0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKgIC8qIEFsbG9jIHhlbnN0b3JlIHBh
Z2UgKi8NCj4+ICvCoMKgwqAgaWYgKGFsbG9jX3hzX3BhZ2UoeGNoLCBpbmZvLCAmeGVuc3Rv
cmVfcGZuKSAhPSAwKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJFcnJvciBvbiBh
bGxvYyBtYWdpYyBwYWdlc1xuIik7DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7DQo+
PiArwqDCoMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAgcmMgPSB4Y19kb21fZ250dGFiX3NlZWQo
eGNoLCBpbmZvLT5kb21pZCwgdHJ1ZSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHhlbl9wZm5fdCktMSwgeGVuc3RvcmVf
cGZuLCAwLCAwKTsNCj4+ICvCoMKgwqAgaWYgKHJjKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGVy
cigxLCAieGNfZG9tX2dudHRhYl9zZWVkIik7DQo+PiArDQo+PiArwqDCoMKgIGxpYnhsX3V1
aWRfZ2VuZXJhdGUoJnV1aWQpOw0KPj4gK8KgwqDCoCB4Y19kb21haW5fc2V0aGFuZGxlKHhj
aCwgaW5mby0+ZG9taWQsIGxpYnhsX3V1aWRfYnl0ZWFycmF5KCZ1dWlkKSk7DQo+PiArDQo+
PiArwqDCoMKgIHJjID0gZ2VuX3N0dWJfanNvbl9jb25maWcoaW5mby0+ZG9taWQsICZ1dWlk
KTsNCj4+ICvCoMKgwqAgaWYgKHJjKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGVycigxLCAiZ2Vu
X3N0dWJfanNvbl9jb25maWciKTsNCj4+ICsNCj4+ICvCoMKgwqAgLyogTm93IGV2ZXJ5dGhp
bmcgaXMgcmVhZHk6IHNldCBIVk1fUEFSQU1fU1RPUkVfUEZOICovDQo+PiArwqDCoMKgIHJj
ID0geGNfaHZtX3BhcmFtX3NldCh4Y2gsIGluZm8tPmRvbWlkLCBIVk1fUEFSQU1fU1RPUkVf
UEZOLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHhlbnN0b3JlX3Bmbik7DQo+IA0KPiBPbiBwYXRjaCAjMSwgeW91IHRvbGQgbWUg
eW91IGRpZG4ndCB3YW50IHRvIGFsbG9jYXRlIHRoZSBwYWdlIGluIFhlbiBiZWNhdXNlIGl0
IA0KPiB3b3VsZG4ndCBiZSBpbml0aWFsaXplZCBieSBYZW5zdG9yZWQuIEJ1dCB0aGlzIGlz
IHdoYXQgd2UgYXJlIGRvaW5nIGhlcmUuDQoNClhlbnN0b3JlIChhdCBsZWFzdCB0aGUgQyB2
YXJpYW50KSBpcyBvbmx5IHVzaW5nIHRoZSBmaXhlZCBncmFudCByZWYNCkdOVFRBQl9SRVNF
UlZFRF9YRU5TVE9SRSwgc28gaXQgZG9lc24ndCBuZWVkIHRoZSBwYWdlIHRvIGJlIGFkdmVy
dGlzZWQNCnRvIHRoZSBndWVzdC4gQW5kIHRoZSBtYXBwaW5nIGlzIGRvbmUgb25seSB3aGVu
IHRoZSBkb21haW4gaXMgYmVpbmcNCmludHJvZHVjZWQgdG8gWGVuc3RvcmUuDQoNCj4gDQo+
IFRoaXMgd291bGQgYmUgYSBwcm9ibGVtIGlmIExpbnV4IGlzIHN0aWxsIGJvb3RpbmcgYW5k
IGhhc24ndCB5ZXQgY2FsbCANCj4geGVuYnVzX3Byb2JlX2luaXRjYWxsKCkuDQo+IA0KPiBJ
IHVuZGVyc3RhbmQgd2UgbmVlZCB0byBoYXZlIHRoZSBwYWdlIHNldHVwIGJlZm9yZSByYWlz
aW5nIHRoZSBldmVudCBjaGFubmVsLiBJIA0KPiBkb24ndCB0aGluayB3ZSBjYW4gYWxsb3cg
WGVuc3RvcmVkIHRvIHNldCB0aGUgSFZNX1BBUkFNIChpdCBtYXkgcnVuIGluIGEgZG9tYWlu
IA0KPiB3aXRoIGxlc3MgcHJpdmlsZWdlKS4gU28gSSB0aGluayB3ZSBtYXkgbmVlZCB0byBj
cmVhdGUgYSBzZXBhcmF0ZSBjb21tYW5kIHRvIA0KPiBraWNrIHRoZSBjbGllbnQgKG5vdCBn
cmVhdCkuDQo+IA0KPiBKdWVyZ2VuLCBhbnkgdGhvdWdodHM/DQoNCkkgdGhpbmsgaXQgc2hv
dWxkIHdvcmsgbGlrZSB0aGF0Og0KDQotIHNldHVwIHRoZSBncmFudCB2aWEgeGNfZG9tX2du
dHRhYl9zZWVkKCkNCi0gaW50cm9kdWNlIHRoZSBkb21haW4gdG8gWGVuc3RvcmUNCi0gY2Fs
bCB4Y19odm1fcGFyYW1fc2V0KCkNCg0KV2hlbiB0aGUgZ3Vlc3QgaXMgcmVjZWl2aW5nIHRo
ZSBldmVudCwgaXQgc2hvdWxkIHdhaXQgZm9yIHRoZSB4ZW5zdG9yZQ0KcGFnZSB0byBhcHBl
YXIuDQoNCg0KSnVlcmdlbg0K
--------------EUHIbn803tWTjlfPTHDzJLNa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------EUHIbn803tWTjlfPTHDzJLNa--

--------------GNxH0YUAEABkxBSGYVkx0oX0--

--------------Ldw0HiRYns5gC0Tccu07ONYW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJG2A4FAwAAAAAACgkQsN6d1ii/Ey8t
gQf+N5Dki9x35s/aK9ZyTrPc86Efw6QxNDvQleG1/J+hDEbMYEKuCyQo5fnqYouP0Z2kMQ8j1xJv
L66kno1jqf75XM2aFeTo7bl2mGxVuQC9yt+Qq9WGWX1lVKB8srHhNZHSDzf8fjheFW5/cLzQv4Ju
iXLshRnGKYMUm3mqeaDIr8Xd5XUfSPyw7rd/8nRfo3A0p/bgDoHDzdakRYPDouf9IAJjsOGFfUgk
+NtqMLWIIgZ2j6Ft55RCKQWdvtcvDzj0sFtXj7wK5tLzUolRojyEiqfCGuao1aV1Ui6BsIAwL3/T
/wu5YJA+fMFU7+qDMzT2av5gsopIMUW88726zr/n9Q==
=AiMh
-----END PGP SIGNATURE-----

--------------Ldw0HiRYns5gC0Tccu07ONYW--

