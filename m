Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE537DFF78
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 08:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627094.978015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyowd-0007NQ-0V; Fri, 03 Nov 2023 07:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627094.978015; Fri, 03 Nov 2023 07:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyowc-0007Ll-TL; Fri, 03 Nov 2023 07:50:18 +0000
Received: by outflank-mailman (input) for mailman id 627094;
 Fri, 03 Nov 2023 07:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jk6d=GQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyowb-0007Lf-B9
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 07:50:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa9d041-7a1d-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 08:50:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E5731F388;
 Fri,  3 Nov 2023 07:50:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60F9613907;
 Fri,  3 Nov 2023 07:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u/AyFjWmRGUIRQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 03 Nov 2023 07:50:13 +0000
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
X-Inumbo-ID: 9fa9d041-7a1d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698997813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sEnKtdlVKut0UFbLrE04zgnIG+8FcO5vo5TJW/mLbYc=;
	b=B1Vv6d+UsmxjZiwwp1arZujUnn5XghiuYOfvTsXG7Wg3IMqyz4iKDHCqiadj7fgEqWf3CH
	O2TR9hqJut4Ji9/9mQq4vm0Au7BZIcudPpLLuQkgkd7u9dJjtUpxjoCk/WJNoqGhT7vyhu
	l66OBGEzz4RHuAYek8O5KlP/rL3MBfM=
Message-ID: <8f87741f-1625-40f7-a050-d459a9528d29@suse.com>
Date: Fri, 3 Nov 2023 08:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/29] tools/xenlogd: add transport layer
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-5-jgross@suse.com>
 <CAKf6xptuzB_tkYaksQfLb2kWtX03cjoQ2iGon1typjbkLT2AXQ@mail.gmail.com>
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
In-Reply-To: <CAKf6xptuzB_tkYaksQfLb2kWtX03cjoQ2iGon1typjbkLT2AXQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d3eCWCM1LSbV7np8kAenTGcP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d3eCWCM1LSbV7np8kAenTGcP
Content-Type: multipart/mixed; boundary="------------B0565T6iRGVLHdA2F1ncPfFU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <8f87741f-1625-40f7-a050-d459a9528d29@suse.com>
Subject: Re: [PATCH 04/29] tools/xenlogd: add transport layer
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-5-jgross@suse.com>
 <CAKf6xptuzB_tkYaksQfLb2kWtX03cjoQ2iGon1typjbkLT2AXQ@mail.gmail.com>
In-Reply-To: <CAKf6xptuzB_tkYaksQfLb2kWtX03cjoQ2iGon1typjbkLT2AXQ@mail.gmail.com>

--------------B0565T6iRGVLHdA2F1ncPfFU
Content-Type: multipart/mixed; boundary="------------rZXjmHOXIwUnSG0CU08MRles"

--------------rZXjmHOXIwUnSG0CU08MRles
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMTEuMjMgMTk6MzAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNTozNOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSB0cmFuc3BvcnQgbGF5ZXIgb2YgOXBmcy4gVGhpcyBp
cyBiYXNpY2FsbHkgdGhlIGluZnJhc3RydWN0dXJlDQo+PiB0byByZWNlaXZlIHJlcXVlc3Rz
IGZyb20gdGhlIGZyb250ZW5kIGFuZCB0byBzZW5kIHRoZSByZWxhdGVkIGFuc3dlcnMNCj4+
IHZpYSB0aGUgcmluZ3MuDQo+Pg0KPj4gSW4gb3JkZXIgdG8gYXZvaWQgdW5hbGlnbmVkIGFj
Y2Vzc2VzIGUuZy4gb24gQXJtLCBhZGQgdGhlIGRlZmluaXRpb24gb2YNCj4+IF9fcGFja2Vk
IHRvIHRoZSBjb21tb24tbWFjcm9zLmggaGVhZGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPiANCj4+IGRpZmYg
LS1naXQgYS90b29scy94ZW5sb2dkL2lvLmMgYi90b29scy94ZW5sb2dkL2lvLmMNCj4+IGlu
ZGV4IGVmMDk1NGQ2OWQuLjU5MGQwNmU5MDYgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5s
b2dkL2lvLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbmxvZ2QvaW8uYw0KPiANCj4+ICtzdGF0aWMg
dW5zaWduZWQgaW50IGdldF9yZXF1ZXN0X2J5dGVzKGRldmljZSAqZGV2aWNlLCB1bnNpZ25l
ZCBpbnQgb2ZmLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IGxlbikNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBzaXplOw0K
Pj4gKyAgICB1bnNpZ25lZCBpbnQgb3V0X2RhdGEgPSByaW5nX291dF9kYXRhKGRldmljZSk7
DQo+PiArICAgIFJJTkdfSURYIHByb2QsIGNvbnM7DQo+PiArDQo+PiArICAgIHNpemUgPSBt
aW4obGVuIC0gb2ZmLCBvdXRfZGF0YSk7DQo+PiArICAgIHByb2QgPSB4ZW5fOXBmc19tYXNr
KGRldmljZS0+aW50Zi0+b3V0X3Byb2QsIGRldmljZS0+cmluZ19zaXplKTsNCj4+ICsgICAg
Y29ucyA9IHhlbl85cGZzX21hc2soZGV2aWNlLT5jb25zX3B2dF9vdXQsIGRldmljZS0+cmlu
Z19zaXplKTsNCj4+ICsgICAgeGVuXzlwZnNfcmVhZF9wYWNrZXQoZGV2aWNlLT5idWZmZXIg
KyBvZmYsIGRldmljZS0+ZGF0YS5vdXQsIHNpemUsDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgIHByb2QsICZjb25zLCBkZXZpY2UtPnJpbmdfc2l6ZSk7DQo+PiArDQo+PiArICAg
IHhlbl9ybWIoKTsgICAgICAgICAgIC8qIFJlYWQgZGF0YSBvdXQgYmVmb3JlIHNldHRpbmcg
dmlzaWJsZSBjb25zdW1lci4gKi8NCj4+ICsgICAgZGV2aWNlLT5jb25zX3B2dF9vdXQgKz0g
c2l6ZTsNCj4+ICsgICAgZGV2aWNlLT5pbnRmLT5vdXRfY29ucyA9IGRldmljZS0+Y29uc19w
dnRfb3V0Ow0KPj4gKw0KPj4gKyAgICAvKiBTaWduYWwgdGhhdCBtb3JlIHNwYWNlIGlzIGF2
YWlsYWJsZSBub3cuICovDQo+PiArICAgIHhlbmV2dGNobl9ub3RpZnkoeGUsIGRldmljZS0+
ZXZ0Y2huKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIHNpemU7DQo+PiArfQ0KPj4gKw0KPj4g
K3N0YXRpYyB1bnNpZ25lZCBpbnQgcHV0X3JlcXVlc3RfYnl0ZXMoZGV2aWNlICpkZXZpY2Us
IHVuc2lnbmVkIGludCBvZmYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgbGVuKQ0KPiANCj4gU2hvdWxkIHRoaXMgYmUgbmFtZWQg
cHV0X3Jlc3BvbnNlX2J5dGVzPw0KDQpZZXMuDQoNCj4gDQo+PiArew0KPj4gKyAgICB1bnNp
Z25lZCBpbnQgc2l6ZTsNCj4+ICsgICAgdW5zaWduZWQgaW50IGluX2RhdGEgPSByaW5nX2lu
X2ZyZWUoZGV2aWNlKTsNCj4+ICsgICAgUklOR19JRFggcHJvZCwgY29uczsNCj4+ICsNCj4+
ICsgICAgc2l6ZSA9IG1pbihsZW4gLSBvZmYsIGluX2RhdGEpOw0KPiANCj4gSUlVQywgbGVu
IGlzIHRoZSB0b3RhbCBsZW5ndGggb2YgdGhlIG91dGdvaW5nIGRhdGEuICBNYXliZSB0b3Rh
bF9sZW4NCj4gd291bGQgYmUgYSBiZXR0ZXIgbmFtZT8gIEkgYXQgbGVhc3QgcmVhZCBsZW4g
YXMganVzdCBhIGxlbmd0aCBmb3IgYQ0KPiBwYXJ0aWN1bGFyIGNhbGwuICBTYW1lIGNvbW1l
bnQgYXBwbGllcyB0byBnZXRfcmVxdWVzdF9ieXRlcygpIGlmIHlvdQ0KPiB3YW50IHRvIGZv
bGxvdyBpdC4NCg0KRmluZSB3aXRoIG1lLg0KDQo+IA0KPj4gKyAgICBwcm9kID0geGVuXzlw
ZnNfbWFzayhkZXZpY2UtPnByb2RfcHZ0X2luLCBkZXZpY2UtPnJpbmdfc2l6ZSk7DQo+PiAr
ICAgIGNvbnMgPSB4ZW5fOXBmc19tYXNrKGRldmljZS0+aW50Zi0+aW5fY29ucywgZGV2aWNl
LT5yaW5nX3NpemUpOw0KPj4gKyAgICB4ZW5fOXBmc193cml0ZV9wYWNrZXQoZGV2aWNlLT5k
YXRhLmluLCBkZXZpY2UtPmJ1ZmZlciArIG9mZiwgc2l6ZSwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICZwcm9kLCBjb25zLCBkZXZpY2UtPnJpbmdfc2l6ZSk7DQo+PiArDQo+
PiArICAgIHhlbl93bWIoKTsgICAgICAgICAgIC8qIFdyaXRlIGRhdGEgb3V0IGJlZm9yZSBz
ZXR0aW5nIHZpc2libGUgcHJvZHVjZXIuICovDQo+PiArICAgIGRldmljZS0+cHJvZF9wdnRf
aW4gKz0gc2l6ZTsNCj4+ICsgICAgZGV2aWNlLT5pbnRmLT5pbl9wcm9kID0gZGV2aWNlLT5w
cm9kX3B2dF9pbjsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIHNpemU7DQo+PiArfQ0KPj4gKw0K
Pj4gICBzdGF0aWMgYm9vbCBpb193b3JrX3BlbmRpbmcoZGV2aWNlICpkZXZpY2UpDQo+PiAg
IHsNCj4+ICAgICAgIGlmICggZGV2aWNlLT5zdG9wX3RocmVhZCApDQo+PiAgICAgICAgICAg
cmV0dXJuIHRydWU7DQo+PiAtICAgIHJldHVybiBmYWxzZTsNCj4+ICsgICAgaWYgKCBkZXZp
Y2UtPmVycm9yICkNCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICsgICAgcmV0dXJu
IGRldmljZS0+aGFuZGxlX3Jlc3BvbnNlID8gcmluZ19pbl9mcmVlKGRldmljZSkNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogcmluZ19vdXRfZGF0YShkZXZp
Y2UpOw0KPj4gICB9DQo+Pg0KPj4gICB2b2lkICppb190aHJlYWQodm9pZCAqYXJnKQ0KPj4g
ICB7DQo+PiAgICAgICBkZXZpY2UgKmRldmljZSA9IGFyZzsNCj4+ICsgICAgdW5zaWduZWQg
aW50IGNvdW50ID0gMDsNCj4+ICsgICAgc3RydWN0IHA5X2hlYWRlciBoZHI7DQo+PiArICAg
IGJvb2wgaW5faGRyID0gdHJ1ZTsNCj4+ICsNCj4+ICsgICAgZGV2aWNlLT5tYXhfc2l6ZSA9
IGRldmljZS0+cmluZ19zaXplOw0KPj4gKyAgICBkZXZpY2UtPmJ1ZmZlciA9IG1hbGxvYyhk
ZXZpY2UtPm1heF9zaXplKTsNCj4+ICsgICAgaWYgKCAhZGV2aWNlLT5idWZmZXIgKQ0KPj4g
KyAgICB7DQo+PiArICAgICAgICBzeXNsb2coTE9HX0NSSVQsICJtZW1vcnkgYWxsb2NhdGlv
biBmYWlsdXJlISIpOw0KPj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiArICAgIH0NCj4+
DQo+PiAgICAgICB3aGlsZSAoICFkZXZpY2UtPnN0b3BfdGhyZWFkICkNCj4+ICAgICAgIHsN
Cj4+IEBAIC0zNiw5ICsxMjcsNTYgQEAgdm9pZCAqaW9fdGhyZWFkKHZvaWQgKmFyZykNCj4+
ICAgICAgICAgICB9DQo+PiAgICAgICAgICAgcHRocmVhZF9tdXRleF91bmxvY2soJmRldmlj
ZS0+bXV0ZXgpOw0KPj4NCj4+IC0gICAgICAgIC8qIFRPRE86IEkvTyBoYW5kbGluZy4gKi8N
Cj4+ICsgICAgICAgIGlmICggZGV2aWNlLT5zdG9wX3RocmVhZCB8fCBkZXZpY2UtPmVycm9y
ICkNCj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsNCj4+ICsgICAgICAgIGlmICgg
IWRldmljZS0+aGFuZGxlX3Jlc3BvbnNlICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAg
ICAgICBpZiAoIGluX2hkciApDQo+PiArICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAg
ICAgICBjb3VudCArPSBnZXRfcmVxdWVzdF9ieXRlcyhkZXZpY2UsIGNvdW50LCBzaXplb2Yo
aGRyKSk7DQo+PiArICAgICAgICAgICAgICAgIGlmICggY291bnQgIT0gc2l6ZW9mKGhkcikg
KQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+PiArICAgICAgICAgICAg
ICAgIGhkciA9ICooc3RydWN0IHA5X2hlYWRlciAqKWRldmljZS0+YnVmZmVyOw0KPj4gKyAg
ICAgICAgICAgICAgICBpZiAoIGhkci5zaXplID4gZGV2aWNlLT5tYXhfc2l6ZSB8fCBoZHIu
c2l6ZSA8IHNpemVvZihoZHIpICkNCj4+ICsgICAgICAgICAgICAgICAgew0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgc3lzbG9nKExPR19FUlIsICIldS4ldSBzcGVjaWZpZWQgaWxsZWdh
bCByZXF1ZXN0IGxlbmd0aCAldSIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGV2aWNlLT5kb21pZCwgZGV2aWNlLT5kZXZpZCwgaGRyLnNpemUpOw0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgZGV2aWNlLT5lcnJvciA9IHRydWU7DQo+IA0KPiBXaGVuIGRldmljZS0+
ZXJyb3IgaXMgc2V0LCBpb190aHJlYWQgc3RvcHMgcHJvY2Vzc2luZyByZXF1ZXN0cywgYnV0
IGRvDQo+IHdlIHdhbnQgdG8gYWxzbyB0ZWFyIGRvd24gdGhpcyBiYWNrZW5kPyAgVGhlIGV2
ZW50IGNoYW5uZWwgYXQgbGVhc3QgaXMNCj4gbGVmdCBpbiBwbGFjZSBhbmQgdW5tYXNrZWQu
DQoNCkkgdGhpbmsgdGVhcmluZyBkb3duIHRoZSBiYWNrZW5kIHNob3VsZG4ndCBiZSBkb25l
LCBidXQgeW91IGFyZSByaWdodCB0aGF0DQp0aGUgZXZlbnQgY2hhbm5lbCBzaG91bGQgYmUg
a2VwdCBtYXNrZWQuDQoNCj4gDQo+PiArICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsN
Cj4+ICsgICAgICAgICAgICAgICAgfQ0KPj4gKyAgICAgICAgICAgICAgICBpbl9oZHIgPSBm
YWxzZTsNCj4+ICsgICAgICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICAgICAgY291bnQg
Kz0gZ2V0X3JlcXVlc3RfYnl0ZXMoZGV2aWNlLCBjb3VudCwgaGRyLnNpemUpOw0KPj4gKyAg
ICAgICAgICAgIGlmICggY291bnQgPCBoZHIuc2l6ZSApDQo+PiArICAgICAgICAgICAgICAg
IGNvbnRpbnVlOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIC8qIFRPRE86IGhhbmRsZSByZXF1
ZXN0LiAqLw0KPj4gKw0KPj4gKyAgICAgICAgICAgIGRldmljZS0+aGFuZGxlX3Jlc3BvbnNl
ID0gdHJ1ZTsNCj4+ICsgICAgICAgICAgICBoZHIuc2l6ZSA9ICgoc3RydWN0IHA5X2hlYWRl
ciAqKWRldmljZS0+YnVmZmVyKS0+c2l6ZTsNCj4gDQo+IGhkci5zaXplIGlzIHNldCBkdXJp
bmcgdGhlIHN0cnVjdCBjb3B5IGFib3ZlLCBzbyB0aGlzIGlzbid0IG5lZWRlZD8NCg0KSXQg
d2lsbCBiZSBuZWVkZWQgbGF0ZXIgd2hlbiB0aGUgIlRPRE8iIGlzIGZpbGxlZCBpbiwgYXMg
aXQgd2lsbCB0aGVuIGJlIHRoZQ0KcmVzcG9uc2Ugc2l6ZS4NCg0KDQpKdWVyZ2VuDQo=
--------------rZXjmHOXIwUnSG0CU08MRles
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------rZXjmHOXIwUnSG0CU08MRles--

--------------B0565T6iRGVLHdA2F1ncPfFU--

--------------d3eCWCM1LSbV7np8kAenTGcP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVEpjUFAwAAAAAACgkQsN6d1ii/Ey8I
0wf+Ov2p8XawFKkYZU1xOsPqiHOo5HXCi6EQevN6N8OzBUwdWh4k8erDMVKMhpgOzraPNOouLRf+
kcL/vfNbjrzN0g4b3vbcoDad40FjG4Z9Q7QOVQ+6EnY7UMiaGvnSvggDbZLcFNv4m1Qq5cOoyCDj
zVfvH6jxIbuUnolWD4XtZOjKCeD/nXafGgf6mzJk4Fn0e+/rWtyay1e+/w0PVV/ic/CnL3Qbhvm6
doVxu+jNxFEnez/vw9Ifvjp6zVA+Kjw7MKHmcJqseCPkHNts7UDs1h3bRMn25PrAEute1TjsJm1j
JVNoyxeHGHomzM4Z8pEXYfqN9Youwwy8vVMT610adg==
=ceLo
-----END PGP SIGNATURE-----

--------------d3eCWCM1LSbV7np8kAenTGcP--

