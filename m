Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01959F727
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 12:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392353.630651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnKl-0000YY-J9; Wed, 24 Aug 2022 10:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392353.630651; Wed, 24 Aug 2022 10:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnKl-0000UV-Dn; Wed, 24 Aug 2022 10:10:03 +0000
Received: by outflank-mailman (input) for mailman id 392353;
 Wed, 24 Aug 2022 10:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQnKj-0000IN-Mh
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 10:10:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9bfc386-2394-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 12:10:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EE56820328;
 Wed, 24 Aug 2022 10:09:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91F6A13AC0;
 Wed, 24 Aug 2022 10:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M2ozIvf4BWPTEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 10:09:59 +0000
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
X-Inumbo-ID: e9bfc386-2394-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661335799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KWLZXSqqbETXnhg1B0DoveM8twDVIrd5rew0SzXELtU=;
	b=Y1ApWFRXF7taW4hY9R5F50XR+2AGVJ6L3IxHCi32e5QTGWlPgywOpRdv5AiLd16LKlv1EE
	JQs/XSa2FVDZrNBHMAc7oLqamMRGJtanH/cWBj7Gbzo4uYc68WGzGUNpT1TYyNSPdYXbTl
	LTz4t88H1ZttuekG4/RITcIWAPsaR2g=
Message-ID: <a04eebde-1ad4-b6d2-9867-caea88de0484@suse.com>
Date: Wed, 24 Aug 2022 12:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, alex.bennee@linaro.org,
 xen-devel@lists.xen.org, Stratos-dev@op-lists.linaro.org,
 mathieu.poirier@linaro.com, christopher.w.clark@gmail.com,
 boris.ostrovsky@oracle.com, gregkh@linuxfoundation.org,
 vincent.guittot@linaro.org, olekstysh@gmail.com
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
In-Reply-To: <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yy6Rhlniyo7y0Od0wRsDT5mX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yy6Rhlniyo7y0Od0wRsDT5mX
Content-Type: multipart/mixed; boundary="------------cw0MrRYPza64sGLm7G6rrgrT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, alex.bennee@linaro.org,
 xen-devel@lists.xen.org, Stratos-dev@op-lists.linaro.org,
 mathieu.poirier@linaro.com, christopher.w.clark@gmail.com,
 boris.ostrovsky@oracle.com, gregkh@linuxfoundation.org,
 vincent.guittot@linaro.org, olekstysh@gmail.com
Message-ID: <a04eebde-1ad4-b6d2-9867-caea88de0484@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
In-Reply-To: <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>

--------------cw0MrRYPza64sGLm7G6rrgrT
Content-Type: multipart/mixed; boundary="------------0LD1sJ7zy340KEYFXzD0fSSi"

--------------0LD1sJ7zy340KEYFXzD0fSSi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTE6MTksIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gT24gMjQtMDMtMjIs
IDA2OjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gRm9yIGEgcmF0aGVyIGxvbmcgdGlt
ZSB3ZSB3ZXJlIHVzaW5nICJub3JtYWwiIHVzZXIgcGFnZXMgZm9yIHRoaXMgcHVycG9zZSwN
Cj4+IHdoaWNoIHdlcmUganVzdCBsb2NrZWQgaW50byBtZW1vcnkgZm9yIGRvaW5nIHRoZSBo
eXBlcmNhbGwuDQo+Pg0KPj4gVW5mb3J0dW5hdGVseSB0aGVyZSBoYXZlIGJlZW4gdmVyeSBy
YXJlIHByb2JsZW1zIHdpdGggdGhhdCBhcHByb2FjaCwgYXMNCj4+IHRoZSBMaW51eCBrZXJu
ZWwgY2FuIHNldCBhIHVzZXIgcGFnZSByZWxhdGVkIFBURSB0byBpbnZhbGlkIGZvciBzaG9y
dA0KPj4gcGVyaW9kcyBvZiB0aW1lLCB3aGljaCBsZWQgdG8gRUZBVUxUIGluIHRoZSBoeXBl
cnZpc29yIHdoZW4gdHJ5aW5nIHRvDQo+PiBhY2Nlc3MgdGhlIGh5cGVyY2FsbCBkYXRhLg0K
Pj4NCj4+IEluIExpbnV4IHRoaXMgY2FuIGF2b2lkZWQgb25seSBieSB1c2luZyBrZXJuZWwg
bWVtb3J5LCB3aGljaCBpcyB0aGUNCj4+IHJlYXNvbiB3aHkgdGhlIGh5cGVyY2FsbCBidWZm
ZXJzIGFyZSBhbGxvY2F0ZWQgYW5kIG1tYXAoKS1lZCB0aHJvdWdoIHRoZQ0KPj4gcHJpdmNt
ZCBkcml2ZXIuDQo+IA0KPiBIaSBKdWVyZ2VuLA0KPiANCj4gSSB1bmRlcnN0YW5kIHdoeSB3
ZSBtb3ZlZCBmcm9tIHVzZXIgcGFnZXMgdG8ga2VybmVsIHBhZ2VzLCBidXQgSSBkb24ndA0K
PiBmdWxseSB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRvIG1ha2UgdHdvIHNlcGFyYXRlIGNh
bGxzIHRvIG1hcCB0aGUNCj4gZ3Vlc3QgbWVtb3J5LCBpLmUuIG1tYXAoKSBmb2xsb3dlZCBi
eSBpb2N0bChJT0NUTF9QUklWQ01EX01NQVBCQVRDSCkuDQo+IA0KPiBXaHkgYXJlbid0IHdl
IGRvaW5nIGFsbCBvZiBpdCBmcm9tIG1tYXAoKSBpdHNlbGYgPyBJIGhhY2tlZCBpdCB1cCB0
bw0KPiBjaGVjayBvbiBpdCBhbmQgaXQgd29ya3MgZmluZSBpZiB3ZSBkbyBpdCBhbGwgZnJv
bSBtbWFwKCkgaXRzZWxmLg0KDQpIeXBlcmNhbGwgYnVmZmVycyBhcmUgbmVlZGVkIGZvciBt
b3JlIHRoYW4ganVzdCB0aGUgIk1NQVBCQVRDSCIgaHlwZXJjYWxsLg0KT3IgYXJlIHlvdSBz
dWdnZXN0aW5nIG9uZSBkZXZpY2UgcGVyIHBvc3NpYmxlIGh5cGVyY2FsbD8NCg0KPiBBcmVu
J3Qgd2UgYWJ1c2luZyB0aGUgTGludXggdXNlcnNwYWNlIEFCSSBoZXJlID8gQXMgc3RhbmRh
cmQgdXNlcnNwYWNlDQo+IGNvZGUgd291bGQgZXhwZWN0IGp1c3QgbW1hcCgpIHRvIGJlIGVu
b3VnaCB0byBtYXAgdGhlIG1lbW9yeS4gWWVzLCB0aGUNCj4gY3VycmVudCB1c2VyLCBYZW4g
aXRzZWxmLCBpcyBhZGFwdGVkIHRvIG1ha2UgdHdvIGNhbGxzLCBidXQgaXQgYnJlYWtzDQo+
IGFzIHNvb24gYXMgd2Ugd2FudCB0byB1c2Ugc29tZXRoaW5nIHRoYXQgcmVsaWVzIG9uIExp
bnV4IHVzZXJzcGFjZQ0KPiBBQkkuDQoNCkkgdGhpbmsgeW91IGFyZSBzdGlsbCBtaXhpbmcg
dXAgdGhlIGh5cGVyY2FsbCBidWZmZXJzIHdpdGggdGhlIG1lbW9yeQ0KeW91IHdhbnQgdG8g
bWFwIHZpYSB0aGUgaHlwZXJjYWxsLiBBdCBsZWFzdCB0aGUgcmVmZXJlbmNlIHRvIGtlcm5l
bA0KbWVtb3J5IGFib3ZlIGlzIHN1Z2dlc3RpbmcgdGhhdC4NCg0KDQpKdWVyZ2VuDQo=
--------------0LD1sJ7zy340KEYFXzD0fSSi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0LD1sJ7zy340KEYFXzD0fSSi--

--------------cw0MrRYPza64sGLm7G6rrgrT--

--------------yy6Rhlniyo7y0Od0wRsDT5mX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMF+PcFAwAAAAAACgkQsN6d1ii/Ey+Q
Zwf9HkW0ou58HYKFDnENyhTgUwFqJNYFtPfH33igECvD6qz26+NzZKuoDFS3GyDuIWEWwAANrOdd
6TAGuMu9s1plgngxKu9wncY1fmlMFfpLg9sqjWcML9dpt5ldk/zKU1Ge9YlqqKiVl8vnNocsMsdv
z8pnR1Vwcj/W0Nmqt8VPEo6ND+AR47+evehJseLX4MvWUQGG2TxbLFYw5HaTC+Lf1EssJpGl5Rsx
RZFUu49hp3WFlS+Y1sv9zkCuCwdXSqGa0wQuiXu//Wzp/naO1PCQVcaXOM3AFiIbzRbfv+NUDrn1
JkSXPySOqpUyxnojJRhWraHUnh1u/PIi8D2Jh5tVDw==
=jgBh
-----END PGP SIGNATURE-----

--------------yy6Rhlniyo7y0Od0wRsDT5mX--

