Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C43518053
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319321.539522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nloMG-00005N-IB; Tue, 03 May 2022 08:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319321.539522; Tue, 03 May 2022 08:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nloMG-0008V9-FB; Tue, 03 May 2022 08:58:12 +0000
Received: by outflank-mailman (input) for mailman id 319321;
 Tue, 03 May 2022 08:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nloMF-0008V3-5D
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:58:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27df72fa-cabf-11ec-a406-831a346695d4;
 Tue, 03 May 2022 10:58:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 94CEF1F38D;
 Tue,  3 May 2022 08:58:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E61C13ABE;
 Tue,  3 May 2022 08:58:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p4aYEaHucGJaSAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 03 May 2022 08:58:09 +0000
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
X-Inumbo-ID: 27df72fa-cabf-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651568289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pms4NLoa+VhejEh/GWnjQtvYkBrQbHtl9W5yYSnPyuY=;
	b=cRytpMS1X0tknz8abz6OUs0MR5humzk29gZ/aSJGjlWCO19juK6EQ/u66rChjCc5nYKTzm
	jV5s8+2ptetqS1erxOCkBPKSJZoBLkoSjlNt3bHSfDiAWa1ULHfUUSGqI0O/ErwlNXovvT
	vSkOi5oaDkPnHLHr18tcnK0TsABy4UA=
Message-ID: <aa1e861a-af06-8ef1-cb50-ab25af038c57@suse.com>
Date: Tue, 3 May 2022 10:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-6-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 6/7] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <20220429205732.2030094-6-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GXrf8Z20VOIZcmHuPYY0goEK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GXrf8Z20VOIZcmHuPYY0goEK
Content-Type: multipart/mixed; boundary="------------GFpv0qZhMjXTwAqdB1FbVqyq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <aa1e861a-af06-8ef1-cb50-ab25af038c57@suse.com>
Subject: Re: [PATCH v5 6/7] tools: add example application to initialize
 dom0less PV drivers
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-6-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-6-sstabellini@kernel.org>

--------------GFpv0qZhMjXTwAqdB1FbVqyq
Content-Type: multipart/mixed; boundary="------------ZLe02UiBoIzOFzyhsiph6hYs"

--------------ZLe02UiBoIzOFzyhsiph6hYs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDQuMjIgMjI6NTcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJvbTog
THVjYSBNaWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5jb20+DQo+IA0KPiBBZGQgYW4gZXhhbXBs
ZSBhcHBsaWNhdGlvbiB0aGF0IGNhbiBiZSBydW4gaW4gZG9tMCB0byBjb21wbGV0ZSB0aGUN
Cj4gZG9tMGxlc3MgZG9tYWlucyBpbml0aWFsaXphdGlvbiBzbyB0aGF0IHRoZXkgY2FuIGdl
dCBhY2Nlc3MgdG8geGVuc3RvcmUNCj4gYW5kIHVzZSBQViBkcml2ZXJzLg0KPiANCj4gVGhl
IGFwcGxpY2F0aW9uIHNldHMgWFNfQ09OTkVDVElPTl9TVEFURV9SRUNPTk5FQ1RJTkcgb24g
dGhlIHhlbnN0b3JlDQo+IHBhZ2UgYmVmb3JlIGNhbGxpbmcgeHNfaW50cm9kdWNlX2RvbWFp
biB0byBzaWduYWwgdGhhdCB0aGUgY29ubmVjdGlvbiBpcw0KPiBub3QgcmVhZHkgeWV0IHRv
IGJlIHVzZWQuIFhTX0NPTk5FQ1RJT05fU1RBVEVfUkVDT05ORUNUSU5HIGlzIHJlc2V0IHNv
b24NCj4gYWZ0ZXIgYnkgeGVuc3RvcmVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBN
aWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+DQo+IENDOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPg0KPiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+DQo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
IC0tLQ0KPiBDaGFuZ2VzIGluIHY1Og0KPiAtIHNldCBYU19DT05ORUNUSU9OX1NUQVRFX1JF
Q09OTkVDVElORyBiZWZvcmUgeHNfaW50cm9kdWNlX2RvbWFpbg0KPiANCj4gQ2hhbmdlcyBp
biB2NDoNCj4gLSBvbmx5IGFsbG9jIHhzIHBhZ2UgKG5vIG90aGVyIG1hZ2ljIHBhZ2VzKQ0K
PiAtIGFkZCB4ZW5zdG9yZSBwZXJtaXNzaW9ucw0KPiAtIGNoZWNrIGFsbCByZXR1cm4gdmFs
dWVzDQo+IC0gcmVuYW1lIHJlc3RvcmVfeGVuc3RvcmUgdG8gY3JlYXRlX3hlbnN0b3JlDQo+
IC0gc2V0IHRhcmdldF9tZW1rYg0KPiAtIHNldCBzdGFydF90aW1lIHByb3Blcmx5DQo+IC0g
Y2xvc2UgeHMgdHJhbnNhY3Rpb24gb24gZXJyb3INCj4gLSBjYWxsIHhjX2RvbV9nbnR0YWJf
c2VlZCBpbnN0ZWFkIG9mIHhjX2RvbV9nbnR0YWJfaW5pdA0KPiAtIHhzX29wZW4gaW5zdGVh
ZCBvZiB4c19kYWVtb25fb3Blbg0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBoYW5kbGUg
eGVuc3RvcmUgZXJyb3JzDQo+IC0gYWRkIGFuIGluLWNvZGUgY29tbWVudCBhYm91dCB4ZW5z
dG9yZSBlbnRyaWVzDQo+IC0gbGVzcyB2ZXJib3NlIG91dHB1dA0KPiAtIGNsZWFuLXVwIGVy
cm9yIHBhdGggaW4gbWFpbg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBkbyBub3Qgc2V0
IEhWTV9QQVJBTV9TVE9SRV9FVlRDSE4gdHdpY2UNCj4gLSByZW5hbWUgcmVzdG9yZV94ZW5z
dG9yZSB0byBjcmVhdGVfeGVuc3RvcmUNCj4gLSBpbmNyZWFzZSBtYXhtZW0NCj4gDQo+IGNv
bm5lY3Rpb24gcmVjb25uZWN0aW5nDQo+IC0tLQ0KPiAgIHRvb2xzL2hlbHBlcnMvTWFrZWZp
bGUgICAgICAgIHwgIDEzICsrDQo+ICAgdG9vbHMvaGVscGVycy9pbml0LWRvbTBsZXNzLmMg
fCAzNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMzU0IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9v
bHMvaGVscGVycy9pbml0LWRvbTBsZXNzLmMNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9o
ZWxwZXJzL01ha2VmaWxlIGIvdG9vbHMvaGVscGVycy9NYWtlZmlsZQ0KPiBpbmRleCA3ZjZj
NDIyNDQwLi44ZDc4YWIxZTkwIDEwMDY0NA0KPiAtLS0gYS90b29scy9oZWxwZXJzL01ha2Vm
aWxlDQo+ICsrKyBiL3Rvb2xzL2hlbHBlcnMvTWFrZWZpbGUNCj4gQEAgLTEwLDYgKzEwLDkg
QEAgaWZlcSAoJChDT05GSUdfTGludXgpLHkpDQo+ICAgaWZlcSAoJChDT05GSUdfWDg2KSx5
KQ0KPiAgIFBST0dTICs9IGluaXQteGVuc3RvcmUtZG9tYWluDQo+ICAgZW5kaWYNCj4gK2lm
ZXEgKCQoQ09ORklHX0FSTSkseSkNCj4gK1BST0dTICs9IGluaXQtZG9tMGxlc3MNCj4gK2Vu
ZGlmDQo+ICAgZW5kaWYNCj4gICANCj4gICBYRU5fSU5JVF9ET00wX09CSlMgPSB4ZW4taW5p
dC1kb20wLm8gaW5pdC1kb20tanNvbi5vDQo+IEBAIC0yNiw2ICsyOSwxMyBAQCAkKElOSVRf
WEVOU1RPUkVfRE9NQUlOX09CSlMpOiBDRkxBR1MgKz0gJChDRkxBR1NfbGlieGVuc3RvcmUp
DQo+ICAgJChJTklUX1hFTlNUT1JFX0RPTUFJTl9PQkpTKTogQ0ZMQUdTICs9ICQoQ0ZMQUdT
X2xpYnhlbmxpZ2h0KQ0KPiAgICQoSU5JVF9YRU5TVE9SRV9ET01BSU5fT0JKUyk6IENGTEFH
UyArPSAtaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9jb25maWcuaA0KPiAgIA0KPiArSU5J
VF9ET00wTEVTU19PQkpTID0gaW5pdC1kb20wbGVzcy5vIGluaXQtZG9tLWpzb24ubw0KPiAr
JChJTklUX0RPTTBMRVNTX09CSlMpOiBDRkxBR1MgKz0gJChDRkxBR1NfbGlieGVudG9vbGxv
ZykNCj4gKyQoSU5JVF9ET00wTEVTU19PQkpTKTogQ0ZMQUdTICs9ICQoQ0ZMQUdTX2xpYnhl
bnN0b3JlKQ0KPiArJChJTklUX0RPTTBMRVNTX09CSlMpOiBDRkxBR1MgKz0gJChDRkxBR1Nf
bGlieGVubGlnaHQpDQo+ICskKElOSVRfRE9NMExFU1NfT0JKUyk6IENGTEFHUyArPSAkKENG
TEFHU19saWJ4ZW5jdHJsKQ0KPiArJChJTklUX0RPTTBMRVNTX09CSlMpOiBDRkxBR1MgKz0g
JChDRkxBR1NfbGlieGVuZXZ0Y2huKQ0KPiArDQo+ICAgLlBIT05ZOiBhbGwNCj4gICBhbGw6
ICQoUFJPR1MpDQo+ICAgDQo+IEBAIC0zNSw2ICs0NSw5IEBAIHhlbi1pbml0LWRvbTA6ICQo
WEVOX0lOSVRfRE9NMF9PQkpTKQ0KPiAgIGluaXQteGVuc3RvcmUtZG9tYWluOiAkKElOSVRf
WEVOU1RPUkVfRE9NQUlOX09CSlMpDQo+ICAgCSQoQ0MpICQoTERGTEFHUykgLW8gJEAgJChJ
TklUX1hFTlNUT1JFX0RPTUFJTl9PQkpTKSAkKExETElCU19saWJ4ZW50b29sbG9nKSAkKExE
TElCU19saWJ4ZW5zdG9yZSkgJChMRExJQlNfbGlieGVuY3RybCkgJChMRExJQlNfbGlieGVu
Z3Vlc3QpICQoTERMSUJTX2xpYnhlbmxpZ2h0KSAkKEFQUEVORF9MREZMQUdTKQ0KPiAgIA0K
PiAraW5pdC1kb20wbGVzczogJChJTklUX0RPTTBMRVNTX09CSlMpDQo+ICsJJChDQykgJChM
REZMQUdTKSAtbyAkQCAkKElOSVRfRE9NMExFU1NfT0JKUykgJChMRExJQlNfbGlieGVuY3Ry
bCkgJChMRExJQlNfbGlieGVuZXZ0Y2huKSAkKExETElCU19saWJ4ZW50b29sbG9nKSAkKExE
TElCU19saWJ4ZW5zdG9yZSkgJChMRExJQlNfbGlieGVubGlnaHQpICQoTERMSUJTX2xpYnhl
bmd1ZXN0KSAkKExETElCU19saWJ4ZW5mb3JlaWdubWVtb3J5KSAkKEFQUEVORF9MREZMQUdT
KQ0KPiArDQo+ICAgLlBIT05ZOiBpbnN0YWxsDQo+ICAgaW5zdGFsbDogYWxsDQo+ICAgCSQo
SU5TVEFMTF9ESVIpICQoREVTVERJUikkKExJQkVYRUNfQklOKQ0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvaGVscGVycy9pbml0LWRvbTBsZXNzLmMgYi90b29scy9oZWxwZXJzL2luaXQtZG9t
MGxlc3MuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5h
OTkzOThlOTI4DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdG9vbHMvaGVscGVycy9pbml0
LWRvbTBsZXNzLmMNCj4gQEAgLTAsMCArMSwzNDEgQEANCj4gKyNpbmNsdWRlIDxzdGRib29s
Lmg+DQo+ICsjaW5jbHVkZSA8c3lzbG9nLmg+DQo+ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4g
KyNpbmNsdWRlIDxlcnIuaD4NCj4gKyNpbmNsdWRlIDxzdGRsaWIuaD4NCj4gKyNpbmNsdWRl
IDxzeXMvdGltZS5oPg0KPiArI2luY2x1ZGUgPHhlbnN0b3JlLmg+DQo+ICsjaW5jbHVkZSA8
eGVuY3RybC5oPg0KPiArI2luY2x1ZGUgPHhlbmd1ZXN0Lmg+DQo+ICsjaW5jbHVkZSA8bGli
eGwuaD4NCj4gKyNpbmNsdWRlIDx4ZW5ldnRjaG4uaD4NCj4gKyNpbmNsdWRlIDx4ZW5mb3Jl
aWdubWVtb3J5Lmg+DQo+ICsNCj4gKyNpbmNsdWRlICJpbml0LWRvbS1qc29uLmgiDQo+ICsN
Cj4gKyNkZWZpbmUgWFNfQ09OTkVDVElPTl9TVEFURV9PRkZTRVQgICAgICAgKDIwNjgvNCkN
Cj4gKyNkZWZpbmUgWFNfQ09OTkVDVElPTl9TVEFURV9SRUNPTk5FQ1RJTkcgMHgxDQoNCldo
eSBkb24ndCB5b3UgdXNlIHRoZSB4c193aXJlLmggaGVhZGVyIGluc3RlYWQ/DQoNCg0KSnVl
cmdlbg0K
--------------ZLe02UiBoIzOFzyhsiph6hYs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZLe02UiBoIzOFzyhsiph6hYs--

--------------GFpv0qZhMjXTwAqdB1FbVqyq--

--------------GXrf8Z20VOIZcmHuPYY0goEK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJw7qAFAwAAAAAACgkQsN6d1ii/Ey9X
cAf9EQkk3pdYoMMuQ3eLToN3hOvBbnoL15xXGvvdF2teCwzPowZd8YpixgOT3iHBrfi4ttih/3SW
g+GTWiG1W7JuCmnNXVJGkQCrt+DjfX+WE1+C0g4jbI+6UbL3vD7CsyybwFf+Y3+qHgghucVI3VGf
win5dF1g+3IiF3mjA2ctmyj4TXkavUTsIi4xv4KgoL7c0KgiILbh7Y3fDaPhYt27ZkZneS635K43
/bKlrBXFCeXNIRB2TjwQXATnDgyCMBpNzOOr4sZCEVI6q0N3ydqAnyRtzRz9B90ME2K5EPaZ+riw
M568Gq9uYdW34S0DefzcTX/HhQy20vTy0qpt8IoWsg==
=xefG
-----END PGP SIGNATURE-----

--------------GXrf8Z20VOIZcmHuPYY0goEK--

