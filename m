Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94FC50DA5A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 09:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312393.529608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitNU-0000ku-Df; Mon, 25 Apr 2022 07:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312393.529608; Mon, 25 Apr 2022 07:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitNU-0000ix-Ag; Mon, 25 Apr 2022 07:43:24 +0000
Received: by outflank-mailman (input) for mailman id 312393;
 Mon, 25 Apr 2022 07:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y4oX=VD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nitNS-0000ir-K3
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 07:43:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60290383-c46b-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 09:43:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 47482210EE;
 Mon, 25 Apr 2022 07:43:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1C4613AE1;
 Mon, 25 Apr 2022 07:43:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7LO/NRZRZmLQZwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 25 Apr 2022 07:43:18 +0000
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
X-Inumbo-ID: 60290383-c46b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650872599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZemnL4BqPVn0sRoQ92YEUPsRWL1/aLlQAV5NeHgO9XM=;
	b=HNBD2gmxQiinaiXLTAVtbJmBjIuCoIaIPpsMRjRkRjEnuTns06PKg/H193fzMvrIgzeM9N
	YXoK1S3EyJLEClLew+o8XXwCkQFPsdl4tKdMYRVaoeUkL2+kiZuj//0pbLYFeeANX8jLAu
	PVZ1BXwac1NlmER/hxNbtoVLDH5igC4=
Message-ID: <6864c64b-246d-7ca4-371a-61d4953a781d@suse.com>
Date: Mon, 25 Apr 2022 09:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
In-Reply-To: <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0y3uPQdTz0ZSHZtGEQPoNPYz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0y3uPQdTz0ZSHZtGEQPoNPYz
Content-Type: multipart/mixed; boundary="------------rXqCqEUO8Lt6tagxLtf6Vqn8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <6864c64b-246d-7ca4-371a-61d4953a781d@suse.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1649442065-8332-2-git-send-email-olekstysh@gmail.com>

--------------rXqCqEUO8Lt6tagxLtf6Vqn8
Content-Type: multipart/mixed; boundary="------------gQZC9zbwTZhcj0YQy1fTYREg"

--------------gQZC9zbwTZhcj0YQy1fTYREg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDQuMjIgMjA6MjEsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiBGcm9t
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
DQo+IA0KPiBUaGlzIHBhdGNoIGFkZHMgYmFzaWMgc3VwcG9ydCBmb3IgY29uZmlndXJpbmcg
YW5kIGFzc2lzdGluZyB2aXJ0aW8tbW1pbw0KPiBiYXNlZCB2aXJ0aW8tZGlzayBiYWNrZW5k
IChlbXVhbGF0b3IpIHdoaWNoIGlzIGludGVuZGVkIHRvIHJ1biBvdXQgb2YNCj4gUWVtdSBh
bmQgY291bGQgYmUgcnVuIGluIGFueSBkb21haW4uDQo+IEFsdGhvdWdoIHRoZSBWaXJ0aW8g
YmxvY2sgZGV2aWNlIGlzIHF1aXRlIGRpZmZlcmVudCBmcm9tIHRyYWRpdGlvbmFsDQo+IFhl
biBQViBibG9jayBkZXZpY2UgKHZiZCkgZnJvbSB0aGUgdG9vbHN0YWNrJ3MgcG9pbnQgb2Yg
dmlldzoNCj4gICAtIGFzIHRoZSBmcm9udGVuZCBpcyB2aXJ0aW8tYmxrIHdoaWNoIGlzIG5v
dCBhIFhlbmJ1cyBkcml2ZXIsIG5vdGhpbmcNCj4gICAgIHdyaXR0ZW4gdG8gWGVuc3RvcmUg
YXJlIGZldGNoZWQgYnkgdGhlIGZyb250ZW5kICh0aGUgdmRldiBpcyBub3QNCj4gICAgIHBh
c3NlZCB0byB0aGUgZnJvbnRlbmQpDQoNCkkgdGhvdWdodCBhYm91dCB0aGUgZnV0dXJlIHN1
cHBvcnQgb24geDg2Lg0KDQpUaGVyZSB3ZSBkb24ndCBoYXZlIGEgZGV2aWNlIHRyZWUgKGFu
ZCBJIGRvbid0IHdhbnQgdG8gaW50cm9kdWNlIGl0KSwNCnNvIHRoZSBvbmx5IHdheXMgdG8g
c3BlY2lmeSB0aGUgYmFja2VuZCBkb21haW4gaWQgd291bGQgYmUgdG86DQoNCi0gYWRkIHNv
bWUgaW5mb3JtYXRpb24gdG8gQUNQSSB0YWJsZXMNCi0gdXNlIGJvb3QgcGFyYW1ldGVycw0K
LSB1c2UgWGVuc3RvcmUNCg0KVGhpbmtpbmcgZnVydGhlciBvZiBob3RwbHVnZ2luZyB2aXJ0
aW8gZGV2aWNlcywgWGVuc3RvcmUgc2VlbXMgdG8gYmUgdGhlDQpvbmx5IHJlYWwgc3VpdGFi
bGUgYWx0ZXJuYXRpdmUuIFVzaW5nIHZpcnRpbyBtZWNoYW5pc21zIGRvZXNuJ3Qgc2VlbQ0K
YXBwcm9wcmlhdGUsIGFzIHN1Y2ggaW5mb3JtYXRpb24gc2hvdWxkIGJlIHJldHJpZXZlZCBp
biAicGxhdGZvcm0NCnNwZWNpZmljIiB3YXlzIChzZWUgZS5nLiBzcGVjaWZ5aW5nIGFuICJl
bmRwb2ludCIgaW4gdGhlIHZpcnRpbyBJT01NVQ0KZGV2aWNlIFsxXSwgWzJdKS4gSSB0aGlu
ayB0aGUgWGVuc3RvcmUgaW5mb3JtYXRpb24gZm9yIHRoYXQgcHVycG9zZQ0KY291bGQgYmUg
cmF0aGVyIG1pbmltYWwgYW5kIGl0IHNob3VsZCBiZSBkZXZpY2UtdHlwZSBhZ25vc3RpYy4g
SGF2aW5nDQpqdXN0IGEgZGlyZWN0b3J5IHdpdGggZW5kcG9pbnRzIGFuZCBhc3NvY2lhdGVk
IGJhY2tlbmQgZG9taWRzIHdvdWxkDQpwcm9iYWJseSBiZSBlbm91Z2ggKG5vdCBuZWVkZWQg
aW4gdGhpcyBzZXJpZXMsIG9mIGNvdXJzZSkuDQoNClRoaXMgZG9lc24ndCBwcmVjbHVkZSB0
aGUgZGV2aWNlIHRyZWUgdmFyaWFudCB5b3UgYXJlIHVzaW5nLCBhcyB0aGlzDQp3b3VsZCBi
ZSByZXF1aXJlZCBmb3IgZG9tMGxlc3Mgc3lzdGVtcyBhbnl3YXkuDQoNCk9UT0ggSSdkIGxp
a2UgeW91IHRvIG1vZGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gbWFrZSBpdCBtb3JlIGNs
ZWFyDQp0aGF0IGluIGZ1dHVyZSBmcm9udGVuZCBkYXRhIG1pZ2h0IGJlIHdyaXR0ZW4gdG8g
WGVuc3RvcmUgaW4gb3JkZXIgdG8NCnN1cHBvcnQgb3RoZXIgdXNlIGNhc2VzLg0KDQo+ICAg
LSB0aGUgcmluZy1yZWYvZXZlbnQtY2hhbm5lbCBhcmUgbm90IHVzZWQgZm9yIHRoZSBiYWNr
ZW5kPC0+ZnJvbnRlbmQNCj4gICAgIGNvbW11bmljYXRpb24sIHRoZSBwcm9wb3NlZCBJUEMg
Zm9yIFZpcnRpbyBpcyBJT1JFUS9ETQ0KPiBpdCBpcyBzdGlsbCBhICJibG9jayBkZXZpY2Ui
IGFuZCBvdWdodCB0byBiZSBpbnRlZ3JhdGVkIGluIGV4aXN0aW5nDQo+ICJkaXNrIiBoYW5k
bGluZy4gU28sIHJlLXVzZSAoYW5kIGFkYXB0KSAiZGlzayIgcGFyc2luZy9jb25maWd1cmF0
aW9uDQo+IGxvZ2ljIHRvIGRlYWwgd2l0aCBWaXJ0aW8gZGV2aWNlcyBhcyB3ZWxsLg0KPiAN
Cj4gRm9yIHRoZSBpbW1lZGlhdGUgcHVycG9zZSBhbmQgYW4gYWJpbGl0eSB0byBleHRlbmQg
dGhhdCBzdXBwb3J0IGZvcg0KPiBvdGhlciB1c2UtY2FzZXMgaW4gZnV0dXJlIChRZW11LCB2
aXJ0aW8tcGNpLCBldGMpIHBlcmZvcm0gdGhlIGZvbGxvd2luZw0KPiBhY3Rpb25zOg0KPiAt
IEFkZCBuZXcgZGlzayBiYWNrZW5kIHR5cGUgKExJQlhMX0RJU0tfQkFDS0VORF9PVEhFUikg
YW5kIHJlZmxlY3QNCj4gICAgdGhhdCBpbiB0aGUgY29uZmlndXJhdGlvbg0KPiAtIEludHJv
ZHVjZSBuZXcgZGlzayBwcm90b2NvbCBmaWVsZCB0byBsaWJ4bF9kZXZpY2VfZGlzayBzdHJ1
Y3QNCj4gICAgKHdpdGggTElCWExfRElTS19QUk9UT0NPTF9YRU4gYW5kIExJQlhMX0RJU0tf
UFJPVE9DT0xfVklSVElPX01NSU8NCj4gICAgdHlwZXMpIGFuZCByZWZsZWN0IHRoYXQgaW4g
dGhlIGNvbmZpZ3VyYXRpb24gKG5ldyAicHJvdG9jb2wiIG9wdGlvbg0KPiAgICB3aXRoICJ4
ZW4iIHByb3RvY29sIGJlaW5nIGRlZmF1bHQgdmFsdWUpDQoNCkFuZCB3aXRoIHRoZSBob3Rw
bHVnIG9wdGlvbiBpbiBtaW5kIEkgc3RhcnQgdG8gZmVlbCB1bnVlYXN5IHdpdGggbmFtaW5n
DQp0aGUgbmV3IFhlbnN0b3JlIG5vZGUgInByb3RvY29sIiwgYXMgdGhlIGZyb250ZW5kIGRp
c2sgbm9kZXMgZm9yICJub3JtYWwiDQpkaXNrcyBhbHJlYWR5IGhhdmUgYSAicHJvdG9jb2wi
IGVudHJ5IHNwZWNpZnlpbmcgNjQtIG9yIDMyLWJpdCBwcm90b2NvbC4NCg0KTWF5YmUgd2Ug
c2hvdWxkIHJlYWxseSBuYW1lIGl0ICJ0cmFuc3BvcnQiIGluc3RlYWQ/DQoNCj4gLSBBZGQg
bmV3IGRldmljZSBraW5kIChMSUJYTF9fREVWSUNFX0tJTkRfVklSVElPX0RJU0spIGFzIGN1
cnJlbnQNCj4gICAgb25lIChMSUJYTF9fREVWSUNFX0tJTkRfVkJEKSBkb2Vzbid0IGZpdCBp
bnRvIFZpcnRpbyBkaXNrIG1vZGVsDQo+IA0KPiBBbiBleGFtcGxlIG9mIGRvbWFpbiBjb25m
aWd1cmF0aW9uIGZvciBWaXJ0aW8gZGlzazoNCj4gZGlzayA9IFsgJ3BoeTovZGV2L21tY2Js
azBwMywgeHZkYTEsIGJhY2tlbmR0eXBlPW90aGVyLCBwcm90b2NvbD12aXJ0aW8tbW1pbydd
DQoNCldpdGggUm9nZXIncyBmZWVkYmFjayB0aGlzIHdvdWxkIHRoZW4gYmUgInRyYW5zcG9y
dD12aXJ0aW8iLCB0aGUgIm1taW8iDQpwYXJ0IHNob3VsZCB0aGVuIGJlIHNvbWV0aGluZyBs
aWtlICJhZGFwdGVyPW1taW8iIChpbiBjb250cmFzdCB0bw0KImFkYXB0ZXI9cGNpIiksIGFu
ZCAiYWRhcHRlciIgb25seSBuZWVkZWQgaW4gY2FzZSBvZiBhIGRldmljZSB0cmVlIGFuZA0K
UENJIGJlaW5nIGF2YWlsYWJsZS4NCg0KPiANCj4gTm90aGluZyBoYXMgY2hhbmdlZCBmb3Ig
ZGVmYXVsdCBYZW4gZGlzayBjb25maWd1cmF0aW9uLg0KPiANCj4gUGxlYXNlIG5vdGUsIHRo
aXMgcGF0Y2ggaXMgbm90IGVub3VnaCBmb3IgdmlydGlvLWRpc2sgdG8gd29yaw0KPiBvbiBY
ZW4gKEFybSksIGFzIGZvciBldmVyeSBWaXJ0aW8gZGV2aWNlIChpbmNsdWRpbmcgZGlzaykg
d2UgbmVlZA0KPiB0byBhbGxvY2F0ZSBWaXJ0aW8gTU1JTyBwYXJhbXMgKElSUSBhbmQgbWVt
b3J5IHJlZ2lvbikgYW5kIHBhc3MNCj4gdGhlbSB0byB0aGUgYmFja2VuZCwgYWxzbyB1cGRh
dGUgR3Vlc3QgZGV2aWNlLXRyZWUuIFRoZSBzdWJzZXF1ZW50DQo+IHBhdGNoIHdpbGwgYWRk
IHRoZXNlIG1pc3NpbmcgYml0cy4gRm9yIHRoZSBjdXJyZW50IHBhdGNoLA0KPiB0aGUgZGVm
YXVsdCAiaXJxIiBhbmQgImJhc2UiIGFyZSBqdXN0IHdyaXR0ZW4gdG8gdGhlIFhlbnN0b3Jl
Lg0KPiBUaGlzIGlzIG5vdCBhbiBpZGVhbCBzcGxpdHRpbmcsIGJ1dCB0aGlzIHdheSB3ZSBh
dm9pZCBicmVha2luZw0KPiB0aGUgYmlzZWN0YWJpbGl0eS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4NCg0KSSdtIGZpbmUgd2l0aCB0aGUgb3ZlcmFsbCBhcHByb2FjaCBhbmQgY291bGRuJ3Qg
c3BvdCBhbnkgcmVhbCBpc3N1ZXMNCmluIHRoZSBjb2RlLg0KDQoNCkp1ZXJnZW4NCg0KWzFd
OiBodHRwczovL2dpdGh1Yi5jb20vb2FzaXMtdGNzL3ZpcnRpby1zcGVjL2Jsb2IvbWFzdGVy
L3ZpcnRpby1pb21tdS50ZXgNClsyXTogaHR0cHM6Ly9tZWRpdW0uY29tL0BtaWNoYWVsMjAx
MnpoYW9fNjcwODUvdmlydGlvLWlvbW11LTc4OTM2OTA0OTQ0Mw0K
--------------gQZC9zbwTZhcj0YQy1fTYREg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gQZC9zbwTZhcj0YQy1fTYREg--

--------------rXqCqEUO8Lt6tagxLtf6Vqn8--

--------------0y3uPQdTz0ZSHZtGEQPoNPYz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJmURYFAwAAAAAACgkQsN6d1ii/Ey+5
1gf/fMbnID1TWVRdnvJZdLCnVYqsNDXbaSn/S3gtuEgSLe2gnCsS+MIIKhJzTNAQgPEN2efne+oX
vPKsQIFRxs1JaDvC91IEE9B1Mj3fNE9SqP036GxazeRKwkOaTqSsSFR3/XzkTgQjRvMPq3frEp7A
TU8pOzlga+PrRJ3NmsxyFbfNeU2bK1JDhAzgkJDspUPWK+23/7r0t7MvQWy4nCgEgf2iliEwMath
MAh23eGQyT2tX5EHxv3TeWu4Dze1Q4EnAGmJ9MHjmtivH0APxJvXcG0P7sxVRjrOfS3xrnCMrWaL
zVnTFM33btGKcmWJ8brln5cWs96Vc9wY8mOkx8aFyw==
=csVy
-----END PGP SIGNATURE-----

--------------0y3uPQdTz0ZSHZtGEQPoNPYz--

