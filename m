Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F197DFF7A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 08:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627096.978024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyoyq-0007vm-D7; Fri, 03 Nov 2023 07:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627096.978024; Fri, 03 Nov 2023 07:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyoyq-0007tu-8S; Fri, 03 Nov 2023 07:52:36 +0000
Received: by outflank-mailman (input) for mailman id 627096;
 Fri, 03 Nov 2023 07:52:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jk6d=GQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyoyo-0007tj-Oh
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 07:52:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f25260da-7a1d-11ee-98d7-6d05b1d4d9a1;
 Fri, 03 Nov 2023 08:52:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 30812218FA;
 Fri,  3 Nov 2023 07:52:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE83513907;
 Fri,  3 Nov 2023 07:52:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w6m9OMCmRGX/RQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 03 Nov 2023 07:52:32 +0000
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
X-Inumbo-ID: f25260da-7a1d-11ee-98d7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698997953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Is9Wloka0aROgEcg397sjWHHtg2LegcDAi31PeDy3nA=;
	b=ajFLwJEKI5njEzk9xd7ZrK/UpfGIST+2b+NEo8fMGZQhyINILYO6kBDiMR9tWqivic5CdJ
	qXPMD7/gzcdozO41riRaAKULnIFsA4xwpg/VzibxZ1ql5Sho2NAIVevCyCXt0MXidDsovf
	ywaizw28Z+PFlqe+eov3nrTvvEpco7A=
Message-ID: <9e9cd8d0-ce1f-4799-90c9-905f60c1e547@suse.com>
Date: Fri, 3 Nov 2023 08:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/29] tools/xenlogd: add 9pfs response generation support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-6-jgross@suse.com>
 <CAKf6xpvfVfDWmQnGxtDyxQ_6d0zWmb6FeXJKJfw+jk5-UcqO9A@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAKf6xpvfVfDWmQnGxtDyxQ_6d0zWmb6FeXJKJfw+jk5-UcqO9A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g7SNRB2NKHKRTVtnWj18EujN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g7SNRB2NKHKRTVtnWj18EujN
Content-Type: multipart/mixed; boundary="------------sBepSIE3Xv1N00vVxqg3tF3t";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9e9cd8d0-ce1f-4799-90c9-905f60c1e547@suse.com>
Subject: Re: [PATCH 05/29] tools/xenlogd: add 9pfs response generation support
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-6-jgross@suse.com>
 <CAKf6xpvfVfDWmQnGxtDyxQ_6d0zWmb6FeXJKJfw+jk5-UcqO9A@mail.gmail.com>
In-Reply-To: <CAKf6xpvfVfDWmQnGxtDyxQ_6d0zWmb6FeXJKJfw+jk5-UcqO9A@mail.gmail.com>

--------------sBepSIE3Xv1N00vVxqg3tF3t
Content-Type: multipart/mixed; boundary="------------vzHLfOqOC2noWP1HluZQmPlB"

--------------vzHLfOqOC2noWP1HluZQmPlB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMTEuMjMgMTk6NDgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNjo1NuKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHN1cHBvcnQgZm9yIGdlbmVyYXRpb24gYSA5cGZzIHByb3Rv
Y29sIHJlc3BvbnNlIHZpYSBhIGZvcm1hdCBiYXNlZA0KPj4gYXBwcm9hY2guDQo+Pg0KPj4g
U3RyaW5ncyBhcmUgc3RvcmVkIGluIGEgcGVyIGRldmljZSBzdHJpbmcgYnVmZmVyIGFuZCB0
aGV5IGFyZQ0KPj4gcmVmZXJlbmNlZCB2aWEgdGhlaXIgb2Zmc2V0IGluIHRoaXMgYnVmZmVy
LiBUaGlzIGFsbG93cyB0byBhdm9pZA0KPj4gaGF2aW5nIHRvIGR5bmFtaWNhbGx5IGFsbG9j
YXRlIG1lbW9yeSBmb3IgZWFjaCBzaW5nbGUgc3RyaW5nLg0KPj4NCj4+IEFzIGEgZmlyc3Qg
dXNlciBvZiB0aGUgcmVzcG9uc2UgaGFuZGxpbmcgYWRkIGEgZ2VuZXJpYyBwOV9lcnJvcigp
DQo+PiBmdW5jdGlvbiB3aGljaCB3aWxsIGJlIHVzZWQgdG8gcmV0dXJuIGFueSBlcnJvciB0
byB0aGUgY2xpZW50Lg0KPj4NCj4+IEFkZCBhbGwgZm9ybWF0IHBhcnNpbmcgdmFyaWFudHMg
aW4gb3JkZXIgdG8gYXZvaWQgYWRkaXRpb25hbCBjb2RlIGNodXJuDQo+PiBsYXRlciB3aGVu
IGFkZGluZyB0aGUgdXNlcnMgb2YgdGhvc2UgdmFyaWFudHMuIFByZXBhcmUgYSBzcGVjaWFs
IGNhc2UNCj4+IGZvciB0aGUgInJlYWQiIGNhc2UgYWxyZWFkeSAoZm9ybWF0IGNoYXJhY3Rl
ciAnRCcpOiBpbiBvcmRlciB0byBhdm9pZA0KPj4gYWRkaW5nIGFub3RoZXIgYnVmZmVyIGZv
ciByZWFkIGRhdGEgc3VwcG9ydCBkb2luZyB0aGUgcmVhZCBJL08gZGlyZWN0bHkNCj4+IGlu
dG8gdGhlIHJlc3BvbnNlIGJ1ZmZlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4gDQo+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMveGVubG9nZC9pby5jIGIvdG9vbHMveGVubG9nZC9pby5jDQo+PiBpbmRleCA1OTBk
MDZlOTA2Li41YTA2ZjcyMzM4IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVubG9nZC9pby5j
DQo+PiArKysgYi90b29scy94ZW5sb2dkL2lvLmMNCj4gDQo+PiBAQCAtMTAxLDYgKzExMiwx
NzIgQEAgc3RhdGljIGJvb2wgaW9fd29ya19wZW5kaW5nKGRldmljZSAqZGV2aWNlKQ0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogcmluZ19vdXRfZGF0YShk
ZXZpY2UpOw0KPj4gICB9DQo+Pg0KPj4gK3N0YXRpYyB2b2lkIGZtdF9lcnIoY29uc3QgY2hh
ciAqZm10KQ0KPj4gK3sNCj4+ICsgICAgc3lzbG9nKExPR19DUklULCAiaWxsZWdhbCBmb3Jt
YXQgJXMgcGFzc2VkIHRvIGZpbGxfYnVmZmVyKCkiLCBmbXQpOw0KPj4gKyAgICBleGl0KDEp
Ow0KPj4gK30NCj4+ICsNCj4+ICsvKg0KPj4gKyAqIEZpbGwgYnVmZmVyIHdpdGggcmVzcG9u
c2UgZGF0YS4NCj4+ICsgKiBmbXQgaXMgYSBzZXF1ZW5jZSBvZiBmb3JtYXQgY2hhcmFjdGVy
cy4gU3VwcG9ydGVkIGNoYXJhY3RlcnMgYXJlOg0KPj4gKyAqIGE6IGFuIGFycmF5ICgyIGJ5
dGVzIG51bWJlciBvZiBlbGVtZW50cyArIHRoZSBmb2xsb3dpbmcgZm9ybWF0IGFzIGVsZW1l
bnRzKQ0KPj4gKyAqICAgIFRoZSBudW1iZXIgb2YgZWxlbWVudHMgaXMgcGFzc2VkIGluIHRo
ZSBmaXJzdCB1bnNpZ25lZCBpbnQgcGFyYW1ldGVyLCB0aGUNCj4+ICsgKiAgICBuZXh0IHBh
cmFtZXRlciBpcyBhIHBvaW50ZXIgdG8gYW4gYXJyYXkgb2YgZWxlbWVudHMgYXMgZGVub3Rl
ZCBieSB0aGUgbmV4dA0KPj4gKyAqICAgIGZvcm1hdCBjaGFyYWN0ZXIuDQo+PiArICogYjog
MiBieXRlIHVuc2lnbmVkIGludGVnZXINCj4+ICsgKiAgICBUaGUgcGFyYW1ldGVyIGlzIGEg
cG9pbnRlciB0byBhIHVpbnQxNl90IHZhbHVlDQo+PiArICogRDogRGF0YSBibG9iICg0IGJ5
dGUgbGVuZ3RoICsgPGxlbmd0aD4gYnl0ZXMpDQo+PiArICogICAgMiBwYXJhbWV0ZXJzIGFy
ZSBjb25zdW1lZCwgZmlyc3QgYW4gdW5zaWduZWQgaW50IGZvciB0aGUgbGVuZ3RoLCB0aGVu
IGENCj4+ICsgKiAgICBwb2ludGVyIHRvIHRoZSBmaXJzdCB1aW50OF90IHZhbHVlLg0KPj4g
KyAqICAgIE5vIGFycmF5IHN1cHBvcnQuDQo+PiArICogTDogOCBieXRlIHVuc2lnbmVkIGlu
dGVnZXINCj4+ICsgKiAgICBUaGUgcGFyYW1ldGVyIGlzIGEgcG9pbnRlciB0byBhIHVpbnQ2
NF90IHZhbHVlDQo+PiArICogUTogUWlkIChzdHJ1Y3QgcDlfcWlkKQ0KPj4gKyAqIFM6IFN0
cmluZyAoMiBieXRlIGxlbmd0aCArIDxsZW5ndGg+IGNoYXJhY3RlcnMpDQo+PiArICogICAg
VGhlIGxlbmd0aCBpcyBvYnRhaW5lZCB2aWEgc3RybGVuKCkgb2YgdGhlIHBhcmFtZXRlciwg
YmVpbmcgYSBwb2ludGVyDQo+PiArICogICAgdG8gdGhlIGZpcnN0IGNoYXJhY3RlciBvZiB0
aGUgc3RyaW5nDQo+PiArICogVTogNCBieXRlIHVuc2lnbmVkIGludGVnZXINCj4+ICsgKiAg
ICBUaGUgcGFyYW1ldGVyIGlzIGEgcG9pbnRlciB0byBhIHVpbnQzMl90IHZhbHVlDQo+PiAr
ICovDQo+PiArc3RhdGljIHZvaWQgZmlsbF9idWZmZXIoZGV2aWNlICpkZXZpY2UsIHVpbnQ4
X3QgY21kLCB1aW50MTZfdCB0YWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqZm10LCAuLi4pDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgcDlfaGVhZGVyICpo
ZHIgPSBkZXZpY2UtPmJ1ZmZlcjsNCj4+ICsgICAgdm9pZCAqZGF0YSA9IGhkciArIDE7DQo+
PiArICAgIGNvbnN0IGNoYXIgKmY7DQo+PiArICAgIGNvbnN0IHZvaWQgKnBhcjsNCj4+ICsg
ICAgY29uc3QgY2hhciAqc3RyX3ZhbDsNCj4+ICsgICAgY29uc3Qgc3RydWN0IHA5X3FpZCAq
cWlkOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgbGVuOw0KPj4gKyAgICB2YV9saXN0IGFwOw0K
Pj4gKyAgICB1bnNpZ25lZCBpbnQgYXJyYXlfc3ogPSAwOw0KPj4gKyAgICB1bnNpZ25lZCBp
bnQgZWxlbV9zeiA9IDA7DQo+PiArDQo+PiArICAgIGhkci0+Y21kID0gY21kOw0KPj4gKyAg
ICBoZHItPnRhZyA9IHRhZzsNCj4+ICsNCj4+ICsgICAgdmFfc3RhcnQoYXAsIGZtdCk7DQo+
PiArDQo+PiArICAgIGZvciAoIGYgPSBmbXQ7ICpmOyBmKysgKQ0KPj4gKyAgICB7DQo+PiAr
ICAgICAgICBpZiAoICFhcnJheV9zeiApDQo+PiArICAgICAgICAgICAgcGFyID0gdmFfYXJn
KGFwLCBjb25zdCB2b2lkICopOw0KPj4gKyAgICAgICAgZWxzZQ0KPj4gKyAgICAgICAgew0K
Pj4gKyAgICAgICAgICAgIHBhciArPSBlbGVtX3N6Ow0KPj4gKyAgICAgICAgICAgIGFycmF5
X3N6LS07DQo+PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICBzd2l0Y2ggKCAqZiAp
DQo+PiArICAgICAgICB7DQo+PiArICAgICAgICBjYXNlICdhJzoNCj4+ICsgICAgICAgICAg
ICBmKys7DQo+PiArICAgICAgICAgICAgaWYgKCAhKmYgfHwgYXJyYXlfc3ogKQ0KPj4gKyAg
ICAgICAgICAgICAgICBmbXRfZXJyKGZtdCk7DQo+PiArICAgICAgICAgICAgYXJyYXlfc3og
PSAqKGNvbnN0IHVuc2lnbmVkIGludCAqKXBhcjsNCj4+ICsgICAgICAgICAgICAqKF9fcGFj
a2VkIHVpbnQxNl90ICopZGF0YSA9IGFycmF5X3N6Ow0KPiANCj4gSXMgaXQgd29ydGggY2hl
Y2tpbmcgdGhhdCBhcnJheV9zeiBkb2Vzbid0IGV4Y2VlZCAweGZmZmY/DQoNCkkgY2FuIGFk
ZCB0aGF0Lg0KDQo+IA0KPj4gKyAgICAgICAgICAgIGRhdGEgKz0gc2l6ZW9mKHVpbnQxNl90
KTsNCj4+ICsgICAgICAgICAgICBwYXIgPSB2YV9hcmcoYXAsIGNvbnN0IHZvaWQgKik7DQo+
PiArICAgICAgICAgICAgZWxlbV9zeiA9IDA7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+
PiArDQo+PiArICAgICAgICBjYXNlICd1JzoNCj4+ICsgICAgICAgICAgICAqKF9fcGFja2Vk
IHVpbnQxNl90ICopZGF0YSA9ICooY29uc3QgdWludDE2X3QgKilwYXI7DQo+PiArICAgICAg
ICAgICAgZWxlbV9zeiA9IHNpemVvZih1aW50MTZfdCk7DQo+PiArICAgICAgICAgICAgZGF0
YSArPSBzaXplb2YodWludDE2X3QpOw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKw0K
Pj4gKyAgICAgICAgY2FzZSAnRCc6DQo+PiArICAgICAgICAgICAgaWYgKCBhcnJheV9zeiAp
DQo+PiArICAgICAgICAgICAgICAgIGZtdF9lcnIoZm10KTsNCj4+ICsgICAgICAgICAgICBs
ZW4gPSAqKGNvbnN0IHVuc2lnbmVkIGludCAqKXBhcjsNCj4+ICsgICAgICAgICAgICAqKF9f
cGFja2VkIHVpbnQzMl90ICopZGF0YSA9IGxlbjsNCj4+ICsgICAgICAgICAgICBkYXRhICs9
IHNpemVvZih1aW50MzJfdCk7DQo+PiArICAgICAgICAgICAgcGFyID0gdmFfYXJnKGFwLCBj
b25zdCB2b2lkICopOw0KPj4gKyAgICAgICAgICAgIGlmICggZGF0YSAhPSBwYXIgKQ0KPj4g
KyAgICAgICAgICAgICAgICBtZW1jcHkoZGF0YSwgcGFyLCBsZW4pOw0KPj4gKyAgICAgICAg
ICAgIGRhdGEgKz0gbGVuOw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAg
ICAgICAgY2FzZSAnTCc6DQo+PiArICAgICAgICAgICAgKihfX3BhY2tlZCB1aW50NjRfdCAq
KWRhdGEgPSAqKGNvbnN0IHVpbnQ2NF90ICopcGFyOw0KPj4gKyAgICAgICAgICAgIGVsZW1f
c3ogPSBzaXplb2YodWludDY0X3QpOw0KPj4gKyAgICAgICAgICAgIGRhdGEgKz0gc2l6ZW9m
KHVpbnQ2NF90KTsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAg
IGNhc2UgJ1EnOg0KPj4gKyAgICAgICAgICAgIHFpZCA9IHBhcjsNCj4+ICsgICAgICAgICAg
ICBlbGVtX3N6ID0gc2l6ZW9mKCpxaWQpOw0KPj4gKyAgICAgICAgICAgICoodWludDhfdCAq
KWRhdGEgPSBxaWQtPnR5cGU7DQo+PiArICAgICAgICAgICAgZGF0YSArPSBzaXplb2YodWlu
dDhfdCk7DQo+PiArICAgICAgICAgICAgKihfX3BhY2tlZCB1aW50MzJfdCAqKWRhdGEgPSBx
aWQtPnZlcnNpb247DQo+PiArICAgICAgICAgICAgZGF0YSArPSBzaXplb2YodWludDMyX3Qp
Ow0KPj4gKyAgICAgICAgICAgICooX19wYWNrZWQgdWludDY0X3QgKilkYXRhID0gcWlkLT5w
YXRoOw0KPj4gKyAgICAgICAgICAgIGRhdGEgKz0gc2l6ZW9mKHVpbnQ2NF90KTsNCj4+ICsg
ICAgICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAgIGNhc2UgJ1MnOg0KPj4gKyAg
ICAgICAgICAgIHN0cl92YWwgPSBwYXI7DQo+PiArICAgICAgICAgICAgZWxlbV9zeiA9IHNp
emVvZihzdHJfdmFsKTsNCj4+ICsgICAgICAgICAgICBsZW4gPSBzdHJsZW4oc3RyX3ZhbCk7
DQo+IA0KPiBTaG91bGQgbGVuIGJlIGNoZWNrZWQgdG8gZW5zdXJlIGl0IGRvZXNuJ3QgZXhj
ZWVkIDB4ZmZmZj8NCg0KSSdsbCBhZGQgdGhhdCBjaGVjay4NCg0KDQpKdWVyZ2VuDQoNCg==

--------------vzHLfOqOC2noWP1HluZQmPlB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vzHLfOqOC2noWP1HluZQmPlB--

--------------sBepSIE3Xv1N00vVxqg3tF3t--

--------------g7SNRB2NKHKRTVtnWj18EujN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVEpsAFAwAAAAAACgkQsN6d1ii/Ey8v
FggAneanKF75TwPmh4CVvx36288v1sNCVJiTqDZZA+l55vj0OJHcdgTKvaYj+f9lGuhLmTimmWD4
+KkmwCPwXBtMSC2ZCRKkUkX11kQ6MSbKFlXxt2Omm/oYbywl2Zurt67TeoMZflxxr/4mqqygFgZK
+yOL24RcNs6NRDUx6lyeG3LruFOd8+hgkbPKSsN45KftXHEcIxRFMaI7rz6r6z4LXlynVC6so/YP
rYt6YnjlA09Qj/DQz1TuuZBuYa30Zkk1RsCu0Kfpoq5SBt7RmFPxgmKD3KMIE9LFtEoN1unFkId9
+MM35br0V0DsOX5FRVSTweFJ2C1muFVknVWnpVX/gw==
=sZGF
-----END PGP SIGNATURE-----

--------------g7SNRB2NKHKRTVtnWj18EujN--

