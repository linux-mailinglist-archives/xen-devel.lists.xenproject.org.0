Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1884B2718
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 14:30:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270508.464820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIVyo-0005MY-3J; Fri, 11 Feb 2022 13:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270508.464820; Fri, 11 Feb 2022 13:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIVyn-0005Kj-WA; Fri, 11 Feb 2022 13:28:53 +0000
Received: by outflank-mailman (input) for mailman id 270508;
 Fri, 11 Feb 2022 13:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiEx=S2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nIVym-0005Kd-3P
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 13:28:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c66c3f2-8b3e-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 14:28:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE59921138;
 Fri, 11 Feb 2022 13:28:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A676913C29;
 Fri, 11 Feb 2022 13:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RgpAJ5FkBmKXDwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Feb 2022 13:28:49 +0000
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
X-Inumbo-ID: 8c66c3f2-8b3e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644586129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hNFq6vRhRpF6zkQHoyRWrc1mAdIaUde+DZLA4+kxNJg=;
	b=lnIpUUGIB6hV68imzazz6jkJsB6XqtrYE8Nxq5IQ/LdVneGqZsfqTZmoSN/1rXt5FFXrDo
	jK64JXeE+5biqnTAWMJSDRYVJ9PN5xrgkjSkzm+IKRLbbVNnLXGQVIfpH4zu3Lcr4MUCoY
	SU7+KDj8itG4cVY7vXOaQGsRYw1zpVw=
Message-ID: <342456bd-9138-fd6c-3c5c-2384bbf5d98b@suse.com>
Date: Fri, 11 Feb 2022 14:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC v2 1/8] xen/hypfs: support fo nested dynamic hypfs nodes
Content-Language: en-US
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <8ab7e9ffd5f041c2631f754c7c596874cf6a99c1.1644341635.git.oleksii_moisieiev@epam.com>
 <74e4635d-10ad-86c4-71b1-6e46bc76a89a@suse.com>
 <20220211081613.GA2274024@EPUAKYIW015D>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220211081613.GA2274024@EPUAKYIW015D>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0mMCKmwjSgsalR0qPwrO1Et4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0mMCKmwjSgsalR0qPwrO1Et4
Content-Type: multipart/mixed; boundary="------------WyFgZlxqbrrgS0VOeL2DGMXM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <342456bd-9138-fd6c-3c5c-2384bbf5d98b@suse.com>
Subject: Re: [RFC v2 1/8] xen/hypfs: support fo nested dynamic hypfs nodes
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <8ab7e9ffd5f041c2631f754c7c596874cf6a99c1.1644341635.git.oleksii_moisieiev@epam.com>
 <74e4635d-10ad-86c4-71b1-6e46bc76a89a@suse.com>
 <20220211081613.GA2274024@EPUAKYIW015D>
In-Reply-To: <20220211081613.GA2274024@EPUAKYIW015D>

--------------WyFgZlxqbrrgS0VOeL2DGMXM
Content-Type: multipart/mixed; boundary="------------Nhkl2v46yIaYBTycFiWOldcO"

--------------Nhkl2v46yIaYBTycFiWOldcO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDIuMjIgMDk6MTYsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBIaSBKdWVy
Z2VuLA0KPiANCj4gT24gVGh1LCBGZWIgMTAsIDIwMjIgYXQgMDg6MzQ6MDhBTSArMDEwMCwg
SnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDA4LjAyLjIyIDE5OjAwLCBPbGVrc2lpIE1v
aXNpZWlldiB3cm90ZToNCj4+DQo+IA0KPj4+IEFkZCBuZXcgYXBpOg0KPj4+IC0gaHlwZnNf
cmVhZF9keW5kaXJfZW50cnkNCj4+PiAtIGh5cGZzX2dlbl9keW5kaXJfZW50cnkNCj4+PiB3
aGljaCBhcmUgdGhlIGV4dGVuc2lvbiBvZiB0aGUgZHluYW1pYyBoeXBmcyBub2RlcyBzdXBw
b3J0LCBwcmVzZW50ZWQgaW4NCj4+PiAwYjNiNTNiZThjZjIyNmQ5NDdhNzljMjUzNWE5ZWZi
YjJkZDdiYzM4Lg0KPj4+IFRoaXMgYWxsb3dzIG5lc3RlZCBkeW5hbWljIG5vZGVzIHRvIGJl
IGFkZGVkLiBBbHNvIGlucHV0IHBhcmFtZXRlciBpcw0KPj4+IGh5cGZzX2VudHJ5LCBzbyBw
cm9wZXJ0aWVzIGNhbiBhbHNvIGJlIGdlbmVyYXRlZCBkeW5hbWljYWxseS4NCj4+Pg0KPj4+
IEdlbmVyYXRpbmcgbWl4ZWQgbGlzdCBvZiBkaXJzIGFuZCBwcm9wZXJ0aWVzIGlzIGFsc28g
c3VwcG9ydGVkLg0KPj4+IFNhbWUgYXMgdG8gdGhlIGR5bmFtaWMgaHlwZnMgbm9kZXMsIHRo
aXMgaXMgYW5jaG9yZWQgaW4gcGVyY3B1IHBvaW50ZXIsDQo+Pj4gd2hpY2ggY2FuIGJlIHJl
dHJpZXdlZCBvbiBhbnkgbGV2ZWwgb2YgdGhlIGR5bmFtaWMgZW50cmllcy4NCj4+PiBUaGlz
IGhhbmRsZSBzaG91bGQgYmUgYWxsb2NhdGVkIG9uIGVudGVyKCkgY2FsbGJhY2sgYW5kIHJl
bGVhc2VkIG9uDQo+Pj4gZXhpdCgpIGNhbGxiYWNrLiBXaGVuIHVzaW5nIG5lc3RlZCBkeW5h
bWljIGRpcnMgYW5kIHByb3BlcnRpZXMgaGFuZGxlDQo+Pj4gc2hvdWxkIGJlIGFsbG9jYXRl
ZCBvbiB0aGUgZmlyc3QgZW50ZXIoKSBjYWxsIGFuZCByZWxlYXNlZCBvbiB0aGUgbGFzdA0K
Pj4+IGV4aXQoKSBjYWxsLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NpaSBNb2lz
aWVpZXYgPG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KDQouLi4NCg0KPj4+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vaHlwZnMuaCBiL3hlbi9pbmNsdWRlL3hlbi9oeXBm
cy5oDQo+Pj4gaW5kZXggZTlkNGMyNTU1Yi4uNWQyNzI4Yjk2MyAxMDA2NDQNCj4+PiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vaHlwZnMuaA0KPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9o
eXBmcy5oDQo+Pj4gQEAgLTc5LDggKzc5LDggQEAgc3RydWN0IGh5cGZzX2VudHJ5X2RpciB7
DQo+Pj4gICAgc3RydWN0IGh5cGZzX2R5bmRpcl9pZCB7DQo+Pg0KPj4gUGxlYXNlIHJlbmFt
ZSB0byBzdHJ1Y3QgaHlwZnNfZHluZGlyLg0KPiANCj4gT2ssIHRoYW5rcy4NCj4gDQo+Pg0K
Pj4+ICAgICAgICBzdHJ1Y3QgaHlwZnNfZW50cnlfZGlyIGRpcjsgICAgICAgICAgICAgLyog
TW9kaWZpZWQgY29weSBvZiB0ZW1wbGF0ZS4gKi8NCj4+PiAgICAgICAgc3RydWN0IGh5cGZz
X2Z1bmNzIGZ1bmNzOyAgICAgICAgICAgICAgIC8qIER5bmFtaWMgZnVuY3Rpb25zLiAqLw0K
Pj4+IC0gICAgY29uc3Qgc3RydWN0IGh5cGZzX2VudHJ5X2RpciAqdGVtcGxhdGU7IC8qIFRl
bXBsYXRlIHVzZWQuICovDQo+Pj4gLSNkZWZpbmUgSFlQRlNfRFlORElSX0lEX05BTUVMRU4g
MTINCj4+PiArICAgIGNvbnN0IHN0cnVjdCBoeXBmc19lbnRyeSAqdGVtcGxhdGU7IC8qIFRl
bXBsYXRlIHVzZWQuICovDQo+Pj4gKyNkZWZpbmUgSFlQRlNfRFlORElSX0lEX05BTUVMRU4g
MzINCj4+PiAgICAgICAgY2hhciBuYW1lW0hZUEZTX0RZTkRJUl9JRF9OQU1FTEVOXTsgICAg
IC8qIE5hbWUgb2YgaHlwZnMgZW50cnkuICovDQo+Pj4gICAgICAgIHVuc2lnbmVkIGludCBp
ZDsgICAgICAgICAgICAgICAgICAgICAgICAvKiBOdW1lcmljYWwgaWQuICovDQo+Pg0KPj4g
V2hhdCBhYm91dCB0aGUgZm9sbG93aW5nIGNoYW5nZSBpbnN0ZWFkOg0KPj4NCj4+IC0gICAg
Y29uc3Qgc3RydWN0IGh5cGZzX2VudHJ5X2RpciAqdGVtcGxhdGU7IC8qIFRlbXBsYXRlIHVz
ZWQuICovDQo+PiAtI2RlZmluZSBIWVBGU19EWU5ESVJfSURfTkFNRUxFTiAxMg0KPj4gLSAg
ICBjaGFyIG5hbWVbSFlQRlNfRFlORElSX0lEX05BTUVMRU5dOyAgICAgLyogTmFtZSBvZiBo
eXBmcyBlbnRyeS4gKi8NCj4+IC0NCj4+IC0gICAgdW5zaWduZWQgaW50IGlkOyAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIE51bWVyaWNhbCBpZC4gKi8NCj4+IC0gICAgdm9pZCAqZGF0
YTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIERhdGEgYXNzb2NpYXRlZCB3aXRo
IGlkLiAqLw0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgaHlwZnNfZW50cnkgKnRlbXBsYXRlOyAg
LyogVGVtcGxhdGUgdXNlZC4gKi8NCj4+ICsgICAgdW5pb24gew0KPj4gKyNkZWZpbmUgSFlQ
RlNfRFlORElSX05BTUVMRU4gICAgMzINCj4+ICsgICAgICAgIGNoYXIgbmFtZVtIWVBGU19E
WU5ESVJfTkFNRUxFTl07IC8qIE5hbWUgb2YgaHlwZnMgZW50cnkuICovDQo+PiArICAgICAg
ICBzdHJ1Y3Qgew0KPj4gKyNkZWZpbmUgSFlQRlNfRFlORElSX0lEX05BTUVMRU4gMTINCj4+
ICsgICAgICAgICAgICBjaGFyIG5hbWVbSFlQRlNfRFlORElSX0lEX05BTUVMRU5dOyAvKiBO
YW1lIG9mIGlkIGVudHJ5LiAqLw0KPj4gKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBpZDsg
ICAgICAgICAgICAgICAgICAgIC8qIE51bWVyaWNhbCBpZC4gKi8NCj4+ICsgICAgICAgIH0g
aWQ7DQo+PiArICAgIH07DQo+PiArICAgIHZvaWQqZGF0YTsgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIERhdGEgYXNzb2NpYXRlZCB3aXRoIGVudHJ5LiAqLw0KPj4NCj4gDQo+IEkn
bSBub3Qgc3VyZSBJIHNlZSB0aGUgYmVuZWZpdCBmcm9tIHRoaXMgdW5pb24uIFRoZSBvbmx5
IG9uZSBJIHNlZSBpcw0KPiB0aGF0IHN0cnVjdCBoeXBkc19keW5kaXIgd2lsbCBiZSBzbWFs
bGVyIGJ5IHNpemVvZih1bnNpZ25lZCBpbnQpLg0KPiBDb3VsZCB5b3UgZXhwbGFpbiBwbGVh
c2U/DQoNCk15IG1haW4gY29uY2VybiBpcyB0aGF0IGl0IGlzIG5vdCBvYnZpb3VzIHRvIGEg
dXNlciB0aGF0IHRoZQ0KbnVtZXJpY2FsIGlkIGlzIG5lZWRlZCBvbmx5IGZvciBhIHNwZWNp
YWwgY2FzZS4gUHV0dGluZyBpdCBpbnRvDQp0aGUgdW5pb24gbWFrZXMgdGhpcyBtdWNoIG1v
cmUgY2xlYXIuDQoNCj4gDQo+IEFsc28gd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhlIGZv
bGxvd2luZyBjaGFuZ2U6DQo+IC0gICAgY2hhciBuYW1lW0hZUEZTX0RZTkRJUl9JRF9OQU1F
TEVOXTsgICAgIC8qIE5hbWUgb2YgaHlwZnMgZW50cnkuICovDQo+IC0NCj4gLSAgICB1bnNp
Z25lZCBpbnQgaWQ7ICAgICAgICAgICAgICAgICAgICAgICAgLyogTnVtZXJpY2FsIGlkLiAq
Lw0KPiAtICAgIHZvaWQgKmRhdGE7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBE
YXRhIGFzc29jaWF0ZWQgd2l0aCBpZC4gKi8NCj4gKyAgICBjaGFyIG5hbWVbSFlQRlNfRFlO
RElSX0lEX05BTUVMRU5dOyAgICAgLyogTmFtZSBvZiBoeXBmcyBlbnRyeS4gKi8NCj4gKw0K
PiArICAgIHVuc2lnbmVkIGludCBpZDsgICAgICAgICAgICAgICAgICAgICAgICAvKiBOdW1l
cmljYWwgaWQuICovDQo+ICsgICAgdW5pb24gew0KPiArICAgICAgIGNvbnN0IHZvaWQgKmNv
bnRlbnQ7DQo+ICsgICAgICAgdm9pZCAqZGF0YTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIERhdGEgYXNzb2NpYXRlZCB3aXRoIGlkLiAqLw0KPiArICAgIH0NCj4gVGhpcyBj
aGFuZ2UgaXMgc2ltaWxhciB0byB0aGUgaHlwZnNfZW50cnlfbGVhZi4gSW4gdGhpcyBjYXNl
IHdlIGNhbg0KPiBzdG9yZSBjb25zdCBwb2ludGVyIGZvciByZWFkLW9ubHkgZW50cmllcyBh
bmQgdXNlIGRhdGEgd2hlbiB3cml0ZSBhY2Nlc3MNCj4gaXMgbmVlZGVkPw0KDQpTdXJlLCBp
ZiB5b3UgbmVlZCB0aGF0Lg0KDQo+IA0KPiBQUzogSSB3aWxsIGFkZHJlc3MgYWxsIHlvdXIg
Y29tbWVudHMgaW4gdjMuDQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------Nhkl2v46yIaYBTycFiWOldcO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Nhkl2v46yIaYBTycFiWOldcO--

--------------WyFgZlxqbrrgS0VOeL2DGMXM--

--------------0mMCKmwjSgsalR0qPwrO1Et4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIGZJEFAwAAAAAACgkQsN6d1ii/Ey8P
GQf/YKOwH6a1yORXioBDg9Mk2TKzmaNUsZBX/m2346CvU6beJRnNWSn9PIKN0it2BepaqMEArs/M
43e+v3D2OSTIgjMjLSaQge/epwGkM4WPOfaYv1j4zPwL2yQQtg12NqBNh9/dwV/Q3CyJ1GbQhLMq
QPLrZMIkKon3Wp4q4PL2mcUGwWAT+POLIVeKKg3wdpbaLtCfLWrwrRE5evvQ44rSumbfpxFncIrj
uJvnFCWo6jHw0LE+XsdJkfzPhISLFurKS6qIATml38VE8nV7r8WDAj5TsNcmt9jaKDPlYgK9jdaW
fpIgSYJbFHebwxdvP0jxtoGlx16mjCoINRaNwE3lhw==
=iDRQ
-----END PGP SIGNATURE-----

--------------0mMCKmwjSgsalR0qPwrO1Et4--

