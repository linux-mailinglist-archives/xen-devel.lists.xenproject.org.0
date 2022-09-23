Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85B5E7731
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 11:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410685.653799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obf2D-0005HF-AS; Fri, 23 Sep 2022 09:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410685.653799; Fri, 23 Sep 2022 09:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obf2D-0005F3-6U; Fri, 23 Sep 2022 09:31:49 +0000
Received: by outflank-mailman (input) for mailman id 410685;
 Fri, 23 Sep 2022 09:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVNC=Z2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1obf2C-0005Ex-0X
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 09:31:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ae3e87b-3b22-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 11:31:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DE2421A8D;
 Fri, 23 Sep 2022 09:31:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7CE913A00;
 Fri, 23 Sep 2022 09:31:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pyweMwF9LWNzJgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 23 Sep 2022 09:31:45 +0000
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
X-Inumbo-ID: 8ae3e87b-3b22-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663925506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O8FY9JqAfn68IbNwMJt/N2gsC3g3p4YRW9JkJYPZXLU=;
	b=V/ReSIcyTicu7Ci4E5f0XUDUd+PLIpXSXTWrYmd3yTfrNevvoXDZzP4Z/RJbNJVQTFXXRQ
	bID/Syja8xMjxpcwdK9Zi0zqyl/dYRcYnid49rvKxWmMEIAq6aamH8DW/nroHimDPmAWIJ
	T+/yeJYlMRPDy4nq0RmLrpZTilIi73A=
Message-ID: <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
Date: Fri, 23 Sep 2022 11:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Design session "grant v3"
In-Reply-To: <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7LmrTJdUnPE94qJcLK9cj0y0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7LmrTJdUnPE94qJcLK9cj0y0
Content-Type: multipart/mixed; boundary="------------0lzFpw34me55u2J4Qms0uoJI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
Subject: Re: Design session "grant v3"
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
In-Reply-To: <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>

--------------0lzFpw34me55u2J4Qms0uoJI
Content-Type: multipart/mixed; boundary="------------ufNZuJ0QPnEutYhAwmBg0O6M"

--------------ufNZuJ0QPnEutYhAwmBg0O6M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDkuMjIgMjA6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wOS4yMDIy
IDE1OjQyLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+PiBKw7xyZ2Vu
OiB0b2RheSB0d28gZ3JhbnRzIGZvcm1hdHMsIHYxIHN1cHBvcnRzIG9ubHkgdXAgdG8gMTZU
QiBhZGRyZXNzZXMNCj4+ICAgICAgICAgIHYyIHNvbHZlcyAxNlRCIGlzc3VlLCBpbnRyb2R1
Y2VzIHNldmVyYWwgbW9yZSBmZWF0dXJlc15XYnVncw0KPj4gICAgICAgICAgdjIgaXMgMTYg
Ynl0ZXMgcGVyIGVudHJ5LCB2MSBpcyA4IGJ5dGVzIHBlciBlbnRyeSwgdjIgbW9yZSBjb21w
bGljYXRlZCBpbnRlcmZhY2UgdG8gdGhlIGh5cGVydmlzb3INCj4+ICAgICAgICAgIHZpcnRp
byBjb3VsZCB1c2UgcGVyLWRldmljZSBncmFudCB0YWJsZSwgY3VycmVudGx5IHZpcnRpbyBp
b21tdSBkZXZpY2UsIHNsb3cgaW50ZXJmYWNlDQo+PiAgICAgICAgICB2MyBjb3VsZCBiZSBh
IGdyYW50cyB0cmVlIChsaWtlIGlvbW11IHBhZ2UgdGFibGVzKSwgbm90IGZsYXQgYXJyYXks
IHNlcGFyYXRlIHRyZWVzIGZvciBlYWNoIGdyYW50ZWUNCj4+ICAgICAgICAgIGNvdWxkIHN1
cHBvcnQgc2hhcmluZyBsYXJnZSBwYWdlcyB0b28NCj4+ICAgICAgICAgIGVhc2llciB0byBo
YXZlIG1vcmUgZ3JhbnRzLCBjb250aW51b3VzIGdyYW50IG51bWJlcnMgZXRjDQo+PiAgICAg
ICAgICB0d28gb3B0aW9ucyB0byBkaXN0aW5ndXNoIHRyZWVzIChmcm9tIEhWIFBvVik6DQo+
PiAgICAgICAgICAtIHNoYXJpbmcgZ3Vlc3QgZW5zdXJlIGRpc3RpbmN0IGdyYW50IGlkcyBi
ZXR3ZWVuIChtdWx0aXBsZSkgdHJlZXMNCj4+ICAgICAgICAgIC0gaHYgdGVsbHMgZ3Vlc3Qg
aW5kZXggdW5kZXIgdHJlZSBnb3QgcmVnaXN0ZXJlZA0KPj4gICAgICAgICAgdjMgY2FuIGJl
IGFkZGl0aW9uIHRvIHYxL3YyLCBvbGQgdXNlZCBmb3Igc2ltcGxlciBjYXNlcyB3aGVyZSB0
cmVlIGlzIGFuIG92ZXJraWxsDQo+PiAgICAgICAgICBoeXBlcnZpc29yIG5lZWRzIGV4dHJh
IG1lbW9yeSB0byBrZWVwIHJlZmNvdW50cyAtIHJlc291cmNlIGFsbG9jYXRpb24gZGlzY3Vz
c2lvbg0KPiANCj4gSG93IHdvdWxkIHJlZmNvdW50cyBiZSBkaWZmZXJlbnQgZnJvbSB0b2Rh
eT8gUGVyaGFwcyBJIGRvbid0IGhhdmUgYSBjbGVhcg0KPiBlbm91Z2ggcGljdHVyZSB5ZXQg
aG93IHlvdSBlbnZpc2lvbiB0aGUgdHJlZS1saWtlIHN0cnVjdHVyZShzKSB0byBiZSB1c2Vk
Lg0KDQpXaGF0IHdhcyBtZWFudCBoZXJlIGFyZSB0aGUgYWRkaXRpb25hbCByZXNvdXJjZXMg
dGhlIGh5cGVydmlzb3Igd2lsbCBuZWVkIGZvcg0KaGlnaGVyIGdyYW50IGNvdW50cyBvZiBh
IGd1ZXN0LiBXaXRoIHRoZSB0cmVlIGFwcHJvYWNoIHRoZSBudW1iZXIgb2YgZ3JhbnQNCmZy
YW1lcyB3aWxsIGJlIGJhc2ljYWxseSBjb250cm9sbGVkIGJ5IHRoZSBndWVzdCBhbmQgaW1w
b3NpbmcgYSBsaW1pdCBsaWtlDQp0b2RheSB3b3VsZG4ndCB3b3JrIHZlcnkgd2VsbCAoZXNw
ZWNpYWxseSB3aXRoIHRoZSBjdXJyZW50IGRlZmF1bHQgb2Ygb25seQ0KNjQgZ3JhbnQgZnJh
bWVzKS4NCg0KPiANCj4+ICAgICAgICAgIGh2IGNvdWxkIGhhdmUgVExCIHRvIHNwZWVkdXAg
bWFwcGluZw0KPj4gICAgICAgICAgaXNzdWUgd2l0aCB2MS92MiAtIGdyYW50ZXIgY2Fubm90
IHJldm9rZSBwYWdlcyBmcm9tIHVuY29vcGVyYXRpbmcgYmFja2VuZA0KPj4gICAgICAgICAg
dHJlZSBjb3VsZCBoYXZlIHNwZWNpYWwgcGFnZSBmb3IgcmV2b2tpbmcgZ3JhbnRzIChyZWRp
cmVjdCB0byB0aGF0IHBhZ2UpDQo+PiAgICAgICAgICBzcGVjaWFsIGRvbWlkcywgbG9jYWwg
dG8gdGhlIGd1ZXN0LCB0b29sc3RhY2sgcmVzdGFyaW5nIGJhY2tlbmQgY291bGQgcmVxdWVz
dCB0byBrZWVwIHRoZSBzYW1lIHZpcnR1YWwgZG9taWQNCj4+IE1hcmVrOiAgdGhhdCByZXF1
aXJlcyBzdGF0ZWxlc3MgKG9yIHJlY292ZXJhYmxlKSBwcm90b2NvbCwgcmV1c2luZyBkb21p
ZCBjdXJyZW50bHkgY2F1c2VzIGlzc3Vlcw0KPj4gQW5kcmVpOiBob3cgcmV2b2tpbmcgY291
bGQgd29yaw0KPj4gSsO8cmdlbjogdGhlcmUgbmVlZHMgdG8gYmUgaHlwZXJjYWxsLCByZXBs
YWNpbmcgYW5kIGludmFsaWRhdGluZyBtYXBwaW5nIChzY2FuIHBhZ2UgdGFibGVzPyksIHBv
c3NpYmx5IGFkanVzdGluZyBJT01NVSBldGM7IG1heSBmYWlsLCBwcm9ibGVtYXRpYyBmb3Ig
UFYNCj4gDQo+IFdoeSB3b3VsZCB0aGlzIGJlIHByb2JsZW1hdGljIGZvciBQViBvbmx5PyBJ
biBwcmluY2lwbGUgYW55DQo+IG51bWJlciBvZiBtYXBwaW5ncyBvZiBhIGdyYW50IGFyZSBw
b3NzaWJsZSBhbHNvIGZvciBQVkgvSFZNLiBTbw0KPiBhbGwgb2YgdGhlbSB3b3VsZCBuZWVk
IGZpbmRpbmcgYW5kIHJlcGxhY2luZy4gQmVjYXVzZSBvZiB0aGUNCj4gbXVsdGlwbGUgbWFw
cGluZ3MsIHRoZSBNMlAgaXMgb2Ygbm8gdXNlIGhlcmUuDQoNCkl0IGlzIGFuIGFkZGl0aW9u
YWwgbGF5ZXIgaW4gdGhlIFBWIGNhc2U6IGV2ZW4gd2hlbiBtYXBwaW5nIGEgZm9yZWlnbg0K
cGFnZSB0byBvbmx5IGEgc2luZ2xlIGxvY2FsIFBGTiB0aGVyZSBjb3VsZCBiZSBtdWx0aXBs
ZSBQVEVzIHJlZmVyZW5jaW5nDQppdC4NCg0KSSBkaWRuJ3QgdGhpbmsgb2YgdGhlIHByb2Js
ZW0gZG9pbmcgbXVsdGlwbGUgbWFwcGluZ3Mgb2YgdGhlIHNhbWUgZ3JhbnQuDQpJIHdpbGwg
bG9vayBpbnRvIHRoYXQuDQoNCj4gV2hpbGUgdGhpbmtpbmcgYWJvdXQgdGhpcyBJIHN0YXJ0
ZWQgd29uZGVyaW5nIGluIGhvdyBmYXIgdGhpbmdzDQo+IGFyZSBhY3R1YWxseSB3b3JraW5n
IGNvcnJlY3RseSByaWdodCBub3cgZm9yIGJhY2tlbmRzIGluIFBWSC9IVk06DQo+IEFueSBt
YXBwaW5nIG9mIGEgZ3JhbnQgaXMgaGFuZGVkIHRvIHAybV9hZGRfcGFnZSgpLCB3aGljaCBp
bnNpc3RzDQo+IG9uIHRoZXJlIGJlaW5nIGV4YWN0bHkgb25lIG1hcHBpbmcgb2YgYW55IHBh
cnRpY3VsYXIgTUZOLCB1bmxlc3MNCj4gdGhlIHBhZ2UgaXMgYSBmb3JlaWduIG9uZS4gQnV0
IGhvdyBkb2VzIHRoYXQgYWxsb3cgYSBkb21haW4gdG8NCj4gbWFwIGl0cyBvd24gZ3JhbnRz
LCBlLmcuIHdoZW4gYmxvY2stYXR0YWNoaW5nIGEgZGV2aWNlIGxvY2FsbHkgaW4NCj4gRG9t
MD8gQWZhaWN0IHRoZSBncmFudC1tYXAgd291bGQgc3VjY2VlZCwgYnV0IHRoZSBwYWdlIHdv
dWxkIGJlDQo+IHVubWFwcGVkIGZyb20gaXRzIG9yaWdpbmFsIEdGTi4NCj4gDQo+PiBZYW5u
OiAgIGNhbiBiYWNrZW5kIHJlZnVzZSByZXZva2luZz8NCj4+IErDvHJnZW46IGl0IHNob3Vs
ZG4ndCBiZSB0aGlzIHdheSwgYnV0IHJldm9rZSBjb3VsZCBiZSBjb250cm9sbGVkIGJ5IGZl
YXR1cmUgZmxhZzsgcmV2b2tlIGNvdWxkIHBhc3Mgc2NyYXRjaCBwYWdlIHBlciByZXZva2Ug
Y2FsbCAobW9yZSBmbGV4aWJsZSBjb250cm9sKQ0KPiANCj4gQSBzaW5nbGUgc2NyYXRjaCBw
YWdlIGNvbWVzIHdpdGggdGhlIHJpc2sgb2YgZGF0YSBjb3JydXB0aW9uLCBhcyBhbGwNCj4g
SS9PIHdvdWxkIGJlIGRpcmVjdGVkIHRoZXJlLiBBIHNpbmsgcGFnZSAoZm9yIG1lbW9yeSB3
cml0ZXMpIHdvdWxkDQo+IGxpa2VseSBiZSBva2F5LCBidXQgZGV2aWNlIHdyaXRlcyAobWVt
b3J5IHJlYWRzKSBjYW4ndCBiZSBkb25lIGZyb20NCj4gYSBzdXJyb2dhdGUgcGFnZS4NCg0K
SSBkb24ndCBzZWUgdGhhdCBwcm9ibGVtLg0KDQpJbiBjYXNlIHRoZSBncmFudCBpcyByZXZv
a2VkIGR1ZSB0byBhIG1hbGljaW91cy9idWdneSBiYWNrZW5kLCB5b3UgY2FuJ3QNCnRydXN0
IHRoZSBJL08gZGF0YSBhbnl3YXkuDQoNCkFuZCBpbiBjYXNlIHRoZSBmcm9udGVuZCBpcyBy
ZXZva2luZyB0aGUgZ3JhbnQgYmVjYXVzZSB0aGUgZnJvbnRlbmQgaXMNCm1hbGljaW91cywg
dGhpcyBpc24ndCBhbiBpc3N1ZSBlaXRoZXIuDQoNCj4gDQo+PiBNYXJlazogIHdoYXQgYWJv
dXQgdW5tYXAgbm90aWZpY2F0aW9uPw0KPj4gSsO8cmdlbjogcmV2b2tlIGNvdWxkIGV2ZW4g
YmUgYXN5bmM7IHJpbmcgcGFnZSBmb3IgdW5tYXAgbm90aWZpY2F0aW9ucw0KPj4NCj4+IE1h
cmVrOiAgZG93bmdyYWRpbmcgbWFwcGluZ3MgKHJ3IC0+IHJvKQ0KPj4gSsO8cmdlbjogbXVz
dCBiZSBjYXJlZnVsLCB0byBub3QgYWxsb3cgY3Jhc2hpbmcgYmFja2VuZA0KPj4NCj4+IErD
vHJnZW46IHdlIHNob3VsZCBjb25zaWRlciBpbnRlcmZhY2UgdG8gbWFwcGluZyBsYXJnZSBw
YWdlcyAoIm1hcCB0aGlzIGFyZWEgYXMgYSBsYXJnZSBwYWdlIGlmIGJhY2tlbmQgc2hhcmVk
IGl0IGFzIGxhcmdlIHBhZ2UiKQ0KPiANCj4gcy9iYWNrZW5kL2Zyb250ZW5kLyBJIGd1ZXNz
Pw0KDQpZZXMuDQoNCkJ1dCBsYXJnZSBwYWdlcyBoYXZlIGFub3RoZXIgZG93bnNpZGU6IFRo
ZSBiYWNrZW5kIG5lZWRzIHRvIGtub3cgaXQgaXMgYSBsYXJnZQ0KcGFnZSwgb3RoZXJ3aXNl
IGl0IG1pZ2h0IGdldCBjb25mdXNlZC4gU28gd2hpbGUgdGhpcyBzb3VuZHMgbGlrZSBhIG5p
Y2UgaWRlYSwgaXQNCmlzIGN1bWJlcnNvbWUgaW4gcHJhY3RpY2UuIEJ1dCBtYXliZSBzb21l
b25lIGlzIGNvbWluZyB1cCB3aXRoIGEgbmljZSBpZGVhIGhvdw0KdG8gc29sdmUgdGhhdC4N
Cg0KPiANCj4+IEVkd2luOiAgd2hhdCBoYXBwZW5zIHdoZW4gc2hhdHRlcmluZyB0aGF0IGxh
cmdlIHBhZ2U/DQo+PiBKw7xyZ2VuOiBvbiBsaXZlIG1pZ3JhdGlvbiBwYWdlcyBhcmUgcmVi
dWlsdCBhbnl3YXksIGNhbiByZWNvbnN0cnVjdCBsYXJnZSBwYWdlcw0KPiANCj4gSWYgb25s
eSB3ZSBkaWQgYWxyZWFkeSByZWJ1aWxkIGxhcmdlIHBhZ2VzIC4uLg0KDQpJbmRlZWQuIEJ1
dCBPVE9IIHNoYXR0ZXJpbmcgc2hvdWxkbid0IGJlIGEgcHJvYmxlbSBhdCBsZWFzdCBmb3Ig
UFZIL0hWTSBndWVzdHMsDQphcyB3ZSBhcmUgc3BlYWtpbmcgb2YgZ2ZucyBoZXJlLiBBbmQg
UFYgZ3Vlc3RzIGRvbid0IGhhdmUgbGFyZ2UgcGFnZXMgYW55d2F5Lg0KDQoNCkp1ZXJnZW4N
Cg==
--------------ufNZuJ0QPnEutYhAwmBg0O6M
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ufNZuJ0QPnEutYhAwmBg0O6M--

--------------0lzFpw34me55u2J4Qms0uoJI--

--------------7LmrTJdUnPE94qJcLK9cj0y0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMtfQEFAwAAAAAACgkQsN6d1ii/Ey8g
bQf/a5Rq/T/B/EBb1lrfWqRsXx2/Zxfjvl1togUAJRki9H426iuS0BPUZBY0r8RdfIOYDyTQ3uuZ
CuoIXnnY7tVnzFlIpeRvaT68lnWrMZ+7SZR2Oil17eDyHmTF4va1idZLo/ScMZaQ/V/M+JaqiTIk
PDlwLjMu2kUjg+47UHuqA+YA3FCmD0YdGN/ruff09pM7pzaLaUhw2zeyV8sNh8kI+43uWnbcjS0k
4lLMMylHbzydPlEghEtaWXx/lgNe0HmTEDS6vXxALmTcvM3Tg7slzZMRuCyuv77LykDvNuEZ1odj
ClibRN7J2WlfuDftPfiHZA0iW8S1+l5P1tRvmar7EA==
=nDqZ
-----END PGP SIGNATURE-----

--------------7LmrTJdUnPE94qJcLK9cj0y0--

