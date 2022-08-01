Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EEC5865C0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 09:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378517.611734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQ0Q-00054T-CO; Mon, 01 Aug 2022 07:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378517.611734; Mon, 01 Aug 2022 07:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQ0Q-00051C-9J; Mon, 01 Aug 2022 07:38:26 +0000
Received: by outflank-mailman (input) for mailman id 378517;
 Mon, 01 Aug 2022 07:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oIQ0P-000514-14
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 07:38:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebfab619-116c-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 09:38:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 47C893E705;
 Mon,  1 Aug 2022 07:38:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18AC913AAE;
 Mon,  1 Aug 2022 07:38:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RQsVBNqC52KtEgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Aug 2022 07:38:02 +0000
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
X-Inumbo-ID: ebfab619-116c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659339482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t2/ekMSs8k41dBABbc50VLWhMOw7LL97lhRAf3vKM7E=;
	b=B3oKSNTyPL7oSO7q45aiZJDNElUBd+mLA/NdgsI66MsNzB2xQyuiYOA7VcoFa+U1j4qBb0
	OdA3gbf1Q2oMPMDW2IIKSNKFvbKc+i2Pf8kthx+kEut0tq5e/fK4fwtHh/P9AOLmUUbMzo
	vOKEpz55+8r3Jr5Zcc1EaeGDZNVocaY=
Message-ID: <ac3b6d9a-ab63-6d09-e9f1-2f6391c4aa0c@suse.com>
Date: Mon, 1 Aug 2022 09:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, "Gao, Ruifeng" <ruifeng.gao@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <BL1PR11MB546193E001A425E0B9B7848EEC979@BL1PR11MB5461.namprd11.prod.outlook.com>
 <bfba43a2-951c-4770-7bb9-3559f1bc69d2@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: cpupool / credit2 misuse of xfree() (was: Re: [BUG] Xen causes a
 host hang by using xen-hptool cpu-offline)
In-Reply-To: <bfba43a2-951c-4770-7bb9-3559f1bc69d2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iA0dvaKh0TlioHNv4HHfA2tb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iA0dvaKh0TlioHNv4HHfA2tb
Content-Type: multipart/mixed; boundary="------------ZFzom53UcrUlKxlTV9Zl1c0a";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, "Gao, Ruifeng" <ruifeng.gao@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>
Message-ID: <ac3b6d9a-ab63-6d09-e9f1-2f6391c4aa0c@suse.com>
Subject: Re: cpupool / credit2 misuse of xfree() (was: Re: [BUG] Xen causes a
 host hang by using xen-hptool cpu-offline)
References: <BL1PR11MB546193E001A425E0B9B7848EEC979@BL1PR11MB5461.namprd11.prod.outlook.com>
 <bfba43a2-951c-4770-7bb9-3559f1bc69d2@suse.com>
In-Reply-To: <bfba43a2-951c-4770-7bb9-3559f1bc69d2@suse.com>

--------------ZFzom53UcrUlKxlTV9Zl1c0a
Content-Type: multipart/mixed; boundary="------------00TD5xQ0A335J7EjIdUbL2E2"

--------------00TD5xQ0A335J7EjIdUbL2E2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDcuMjIgMDg6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wNy4yMDIy
IDAzOjE5LCBHYW8sIFJ1aWZlbmcgd3JvdGU6DQo+PiBQcm9ibGVtIERlc2NyaXB0aW9uOg0K
Pj4gVHJ5aW5nIHRvIGV4ZWN1dGUgIi91c3IvbG9jYWwvc2Jpbi94ZW4taHB0b29sIGNwdS1v
ZmZsaW5lIDxjcHVpZD4iLCB0aGUgaG9zdCB3aWxsIGhhbmcgaW1tZWRpYXRlbHkuDQo+Pg0K
Pj4gVmVyc2lvbi1SZWxlYXNlIGFuZCBTeXN0ZW0gRGV0YWlsczoNCj4+IFBsYXRmb3JtOiBJ
Y2UgTGFrZSBTZXJ2ZXINCj4+IEhvc3QgT1M6IFJlZCBIYXQgRW50ZXJwcmlzZSBMaW51eCA4
LjMgKE9vdHBhKQ0KPj4gS2VybmVsOiA1LjE5LjAtcmM2DQo+PiBIVzogSW50ZWwoUikgWGVv
bihSKSBHb2xkIDYzMzZZIENQVSBAIDIuNDBHSHoNCj4+IFhlbiBWZXJzaW9uOiA0LjE3LXVu
c3RhYmxlKGFiMjk3N2IwMjctZGlydHkpDQo+Pg0KPj4gUmVwcm9kdWNlIFN0ZXBzOg0KPj4g
MS4gQm9vdCBmcm9tIFhlbiBhbmQgY2hlY2sgdGhlIGluZm9ybWF0aW9uOg0KPj4gW3Jvb3RA
aWN4LTJzMSB+XSMgeGwgaW5mbw0KPj4gaG9zdCAgICAgICAgICAgICAgICAgICA6IGljeC0y
czENCj4+IHJlbGVhc2UgICAgICAgICAgICAgICAgOiA1LjE5LjAtcmM2DQo+PiB4ZW5fdmVy
c2lvbiAgICAgICAgICAgIDogNC4xNy11bnN0YWJsZQ0KPj4geGVuX2NhcHMgICAgICAgICAg
ICAgICA6IHhlbi0zLjAteDg2XzY0IGh2bS0zLjAteDg2XzMyIGh2bS0zLjAteDg2XzMycCBo
dm0tMy4wLXg4Nl82NA0KPj4gcGxhdGZvcm1fcGFyYW1zICAgICAgICA6IHZpcnRfc3RhcnQ9
MHhmZmZmODAwMDAwMDAwMDAwDQo+PiB4ZW5fY2hhbmdlc2V0ICAgICAgICAgIDogVGh1IEp1
bCAxNCAxOTo0NTozNiAyMDIyICswMTAwIGdpdDphYjI5NzdiMDI3LWRpcnR5DQo+PiAyLiBF
eGVjdXRlIHRoZSBjcHUtb2ZmbGluZSBjb21tYW5kLCBoZXJlIGNwdWlkIGlzIDQ4IGFzIGFu
IGV4YW1wbGU6DQo+PiBbcm9vdEBpY3gtMnMxIH5dIyAvdXNyL2xvY2FsL3NiaW4veGVuLWhw
dG9vbCBjcHUtb2ZmbGluZSA0OA0KPj4NCj4+IEFjdHVhbCBSZXN1bHRzOg0KPj4gVGhlIGhv
c3Qgd2lsbCBoYW5nIGltbWVkaWF0ZWx5Lg0KPiANCj4gV2VsbCwgaXQgY3Jhc2hlcyAod2hp
Y2ggaXMgYW4gaW1wb3J0YW50IGRpZmZlcmVuY2UpLiBBbHNvIHlvdSd2ZSBoaWRkZW4NCj4g
dGhlIGltcG9ydGFudCBkZXRhaWxzIChhbGxvd2luZyB0byBlYXNpbHkgaWRlbnRpZnkgd2hh
dCBhcmVhIHRoZSBpc3N1ZQ0KPiBpcyBpbikgcXVpdGUgd2VsbCBpbiB0aGUgYXR0YWNobWVu
dC4NCj4gDQo+IErDvHJnZW4gKGFuZCBwb3NzaWJseSBHZW9yZ2UgLyBEYXJpbyksDQo+IA0K
PiB0aGlzDQo+IA0KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToNCj4gKFhFTikgICAgWzxmZmZm
ODJkMDQwMjNiZTc2Pl0gUiB4ZnJlZSsweDE1MC8weDFmNw0KPiAoWEVOKSAgICBbPGZmZmY4
MmQwNDAyNDg3OTU+XSBGIGNvbW1vbi9zY2hlZC9jcmVkaXQyLmMjY3NjaGVkMl9mcmVlX3Vk
YXRhKzB4Yy8weGUNCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjU5MTY5Pl0gRiBzY2hlZHVs
ZV9jcHVfcm0rMHgzOGQvMHg0YjMNCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjQzMGNhPl0g
RiBjb21tb24vc2NoZWQvY3B1cG9vbC5jI2NwdXBvb2xfdW5hc3NpZ25fY3B1X2ZpbmlzaCsw
eDE3ZS8weDIyYw0KPiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMWQ0MDI+XSBGIGNvbW1vbi9z
Y2hlZC9jcHVwb29sLmMjY3B1X2NhbGxiYWNrKzB4M2ZiLzB4NGRjDQo+IChYRU4pICAgIFs8
ZmZmZjgyZDA0MDIyOWZjMz5dIEYgbm90aWZpZXJfY2FsbF9jaGFpbisweDZiLzB4OTYNCj4g
KFhFTikgICAgWzxmZmZmODJkMDQwMjA0ZGY3Pl0gRiBjb21tb24vY3B1LmMjY3B1X25vdGlm
aWVyX2NhbGxfY2hhaW4rMHgxYi8weDMzDQo+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIwNGUz
Mz5dIEYgY29tbW9uL2NwdS5jI190YWtlX2NwdV9kb3duKzB4MjQvMHgyYg0KPiAoWEVOKSAg
ICBbPGZmZmY4MmQwNDAyMDRlNDM+XSBGIGNvbW1vbi9jcHUuYyN0YWtlX2NwdV9kb3duKzB4
OS8weDEwDQo+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIzMTUxNz5dIEYgY29tbW9uL3N0b3Bf
bWFjaGluZS5jI3N0b3BtYWNoaW5lX2FjdGlvbisweDg2LzB4OTYNCj4gKFhFTikgICAgWzxm
ZmZmODJkMDQwMjMxY2M1Pl0gRiBjb21tb24vdGFza2xldC5jI2RvX3Rhc2tsZXRfd29yaysw
eDcyLzB4YTUNCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjMxZjQyPl0gRiBkb190YXNrbGV0
KzB4NTgvMHg4YQ0KPiAoWEVOKSAgICBbPGZmZmY4MmQwNDAzMjBiNjA+XSBGIGFyY2gveDg2
L2RvbWFpbi5jI2lkbGVfbG9vcCsweDhkLzB4ZWUNCj4gKFhFTikNCj4gKFhFTikNCj4gKFhF
TikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiAoWEVOKSBQ
YW5pYyBvbiBDUFUgNDg6DQo+IChYRU4pIEFzc2VydGlvbiAnIWluX2lycSgpICYmIChsb2Nh
bF9pcnFfaXNfZW5hYmxlZCgpIHx8IG51bV9vbmxpbmVfY3B1cygpIDw9IDEpJyBmYWlsZWQg
YXQgY29tbW9uL3htYWxsb2NfdGxzZi5jOjcwNA0KPiAoWEVOKSAqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqDQo+IA0KPiBpcyBwb2ludGluZyBhdCB0aGUgcHJv
YmxlbSBxdWl0ZSBjbGVhcmx5LiBDb25jZXB0dWFsbHkgSSB0aGluayBpdA0KPiBoYXMgYWx3
YXlzIGJlZW4gd3JvbmcgdG8gY2FsbCB4ZnJlZSgpIGZyb20gc3RvcC1tYWNoaW5lIGNvbnRl
eHQuIEl0DQo+IGp1c3Qgc28gaGFwcGVuZWQgdGhhdCB3ZSBnb3QgYXdheSB3aXRoIHRoYXQg
c28gZmFyLCBiZWNhdXNlIHRoZSBDUFUNCj4gYmVpbmcgYnJvdWdodCBkb3duIHdhcyB0aGUg
b25seSBvbmUgdXNpbmcgcmVzcGVjdGl2ZSBmdW5jdGlvbnMgKGFuZA0KPiBoZW5jZSB0aGVy
ZSB3YXMgbm8gb3RoZXIgcmlzayBvZiBsb2NraW5nIGlzc3VlcykuDQo+IA0KPiBRdWVzdGlv
biBpcyB3aGV0aGVyIHdlIHdhbnQgdG8gY29udGludWUgYnVpbGRpbmcgdXBvbiB0aGlzIChh
bmQNCj4gaGVuY2UgdGhlIGludm9sdmVkIGFzc2VydGlvbiB3b3VsZCBuZWVkIHRvICJsZWFy
biIgdG8gaWdub3JlDQo+IHN0b3AtbWFjaGluZSBjb250ZXh0KSBvciB3aGV0aGVyIGluc3Rl
YWQgdGhlIGZyZWVpbmcgb2YgdGhlIG1lbW9yeQ0KPiBoZXJlIGNhbiBiZSBkZWZlcnJlZCwg
ZS5nLiB0byBiZSB0YWtlbiBjYXJlIG9mIGJ5IHRoZSBDUFUgZHJpdmluZw0KPiB0aGUgb2Zm
bGluaW5nIHByb2Nlc3MuDQoNClRoaXMgaXMgZXZlbiBtb3JlIGNvbXBsaWNhdGVkLg0KDQpJ
IHRoaW5rIEFTU0VSVF9BTExPQ19DT05URVhUKCkgd2lsbCB0cmlnZ2VyIG1vcmUgb2Z0ZW4s
IGVzcGVjaWFsbHkNCndpdGggY29yZSBzY2hlZHVsaW5nIGVuYWJsZWQuIEluIGZhY3QgSSB0
aGluayB0aGlzIGlzIHRoZSByZWFzb24gd2h5DQpJJ3ZlIHNlZW4gdmVyeSByYXJlIHN0cmFu
Z2UgZmFpbHVyZXMgd2l0aCBjb3JlIHNjaGVkdWxpbmcgd2hlbiB0cnlpbmcNCmNwdSBob3Rw
bHVnIG9wZXJhdGlvbnMsIGFzIHRoZXJlIGFyZSBldmVuIHhtYWxsb2MoKSBjYWxscyBpbiBz
dG9wDQptYWNoaW5lIGNvbnRleHQuDQoNCkknbSBzZWVpbmcgdGhlIGZvbGxvd2luZyBwb3Nz
aWJpbGl0aWVzOg0KDQoxKSBQcmUtYWxsb2NhdGluZyB0aGUgbmVlZGVkIGRhdGEgYW5kIGRl
ZmVycmluZyBmcmVlaW5nIG9mIG5vIGxvbmdlcg0KICAgIG5lZWRlZCBkYXRhIHdoZW4gdGFr
aW5nIGEgY3B1IGRvd24uIEFwYXJ0IGZvcm0gc29tZSByZWZhY3RvcmluZw0KICAgIGluIGNv
bW1vbi9zY2hlZC9jcHVwb29sLmMgYW5kIGNvbW1vbi9zY2hlZC9jb3JlLmMgdGhpcyBzaG91
bGQgYmUNCiAgICBkb2FibGUuDQoNCjIpIEluIGNhc2Ugc3RvcF9tYWNoaW5lKCkgaXMgY2Fs
bGVkIGZvciBhY3Rpb24gb24gb25seSBvbmUgY3B1IGFsbG93DQogICAgbWVtb3J5IGFsbG9j
YXRpb25zIGFuZCBmcmVlaW5nIHdpdGggaW50ZXJydXB0cyBvZmYgYW5kIGZsdXNoIHRoZQ0K
ICAgIFRMQnMgbG9jYWxseSB3aGVuIGVuYWJsaW5nIGludGVycnVwdHMgYWdhaW4uIFRoaXMg
d291bGQgcmVxdWlyZQ0KICAgIHJhdGhlciBsaW1pdGVkIGNoYW5nZXMsIGJ1dCB3b3VsZG4n
dCBiZSBhcyBjbGVhbiBhcyB0aGUgb3RoZXINCiAgICBhcHByb2FjaC4NCg0KQW55IHByZWZl
cmVuY2VzPyBJJ2QgYmUgZmluZSB3aXRoIGJvdGggdmFyaWFudHMgYW5kIGNvdWxkIHdyaXRl
IHRoZQ0KcGF0Y2hlcy4NCg0KDQpKdWVyZ2VuDQo=
--------------00TD5xQ0A335J7EjIdUbL2E2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------00TD5xQ0A335J7EjIdUbL2E2--

--------------ZFzom53UcrUlKxlTV9Zl1c0a--

--------------iA0dvaKh0TlioHNv4HHfA2tb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLngtkFAwAAAAAACgkQsN6d1ii/Ey+F
BggAisCVV8t76LoDdl1wbCCNkztwYDzVE9JQCZhoUnntrOvioPkgFRfLOPi7ZNfRm9/8n7e24qBW
jXCdLweV+P+yhd3ViU5bYRXzjHUEV5XjH/KmF4GKCTOCb9KVgwgWkXn752M53vEQveDCZ0nG+3eJ
FyrtSQKhjDaJRMe2BfQwL3v4Q4LD/n9rJ1O5i9ExUoR3Qhn6TGXe1gIkQjYSOi8NvSNzHk/movy2
NJte0HES0FpFOpr/Y5xAshnCyVL4OUCUhUhT2NV+W54568xW7ZdZJnP+CfwnNQAnp1FXBi2hCmJt
xss/wGr66FRZ0hKTxk0/FAceiaUgcGAmdr0G2WBRMg==
=iJQA
-----END PGP SIGNATURE-----

--------------iA0dvaKh0TlioHNv4HHfA2tb--

