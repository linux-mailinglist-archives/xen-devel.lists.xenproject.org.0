Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915754DBF86
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 07:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291389.494524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUjcL-0003Z4-VT; Thu, 17 Mar 2022 06:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291389.494524; Thu, 17 Mar 2022 06:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUjcL-0003Wj-RL; Thu, 17 Mar 2022 06:28:13 +0000
Received: by outflank-mailman (input) for mailman id 291389;
 Thu, 17 Mar 2022 06:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUjcJ-0003Wd-I8
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 06:28:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a11b4ad-a5bb-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 07:28:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 774F71F390;
 Thu, 17 Mar 2022 06:28:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D78A13B5B;
 Thu, 17 Mar 2022 06:28:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a5e4CfnUMmJfTgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 17 Mar 2022 06:28:09 +0000
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
X-Inumbo-ID: 6a11b4ad-a5bb-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647498489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l46J9Xru5lxaBROA1BJkncApOixQ/U5xA4PiRKXbwqA=;
	b=ifDsjhPkSoDVYG+oR3YuYc5ctVypNDST7mfHwzNMJTaPPXk8Fg2mYzX8bgGZo8JFqtc7GM
	Fea807mFt2RSyGmV7LjOyuLOUNlqfjIEK5cgOi+Wv6JFPH46WQReGYf20v+QEhfImGIaRV
	SpcN0GgYyi6QmhRpglwwhzQ/Qtx5Oz8=
Message-ID: <cb193980-c3e2-23ae-df4d-d0fb2e8da65c@suse.com>
Date: Thu, 17 Mar 2022 07:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Raphael Ning <raphning@gmail.com>, xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
In-Reply-To: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CoXc84h21r0Z99y06de166ht"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CoXc84h21r0Z99y06de166ht
Content-Type: multipart/mixed; boundary="------------HxTdQASlXDUdDkKrMidFsQxr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Raphael Ning <raphning@gmail.com>, xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
Message-ID: <cb193980-c3e2-23ae-df4d-d0fb2e8da65c@suse.com>
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
In-Reply-To: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>

--------------HxTdQASlXDUdDkKrMidFsQxr
Content-Type: multipart/mixed; boundary="------------o7BfRg4EenAv8SGBMEsAqiph"

--------------o7BfRg4EenAv8SGBMEsAqiph
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjIgMTk6MzgsIFJhcGhhZWwgTmluZyB3cm90ZToNCj4gRnJvbTogUmFwaGFl
bCBOaW5nIDxyYXBobmluZ0BhbWF6b24uY29tPg0KPiANCj4gQ3VycmVudGx5LCBldnRjaG5f
Zmlmb19zZXRfcGVuZGluZygpIHdpbGwgbWFyayB0aGUgZXZlbnQgYXMgUEVORElORyBldmVu
DQo+IGlmIGl0IGZhaWxzIHRvIGxvY2sgdGhlIEZJRk8gZXZlbnQgcXVldWUocyksIG9yIGlm
IHRoZSBndWVzdCBoYXMgbm90DQo+IGluaXRpYWxpemVkIHRoZSBGSUZPIGNvbnRyb2wgYmxv
Y2sgZm9yIHRoZSB0YXJnZXQgdkNQVS4gQSB3ZWxsLWJlaGF2ZWQNCj4gZ3Vlc3Qgc2hvdWxk
IG5ldmVyIHRyaWdnZXIgZWl0aGVyIG9mIHRoZXNlIGNhc2VzLg0KDQpJcyB0aGlzIHRydWUg
ZXZlbiBmb3IgdGhlIHJlc3VtZSBjYXNlIGUuZy4gYWZ0ZXIgYSBtaWdyYXRpb24/DQoNClRo
ZSBndWVzdHMgc3RhcnRzIG9uIHRoZSBuZXcgaG9zdCB3aXRoIG5vIEZJRk8gY29udHJvbCBi
bG9jayBmb3IgYW55DQp2Y3B1IHJlZ2lzdGVyZWQsIHNvIGNvdWxkbid0IGFuIGV2ZW50IGdl
dCBsb3N0IHdpdGggeW91ciBwYXRjaCBpbiBjYXNlDQppdCB3YXMgc2VudCBiZWZvcmUgdGhl
IHRhcmdldCB2Y3B1J3MgY29udHJvbCBibG9jayBnZXRzIHJlZ2lzdGVyZWQ/DQoNCg0KSnVl
cmdlbg0K
--------------o7BfRg4EenAv8SGBMEsAqiph
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------o7BfRg4EenAv8SGBMEsAqiph--

--------------HxTdQASlXDUdDkKrMidFsQxr--

--------------CoXc84h21r0Z99y06de166ht
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIy1PgFAwAAAAAACgkQsN6d1ii/Ey8p
Cwf+IEQU0tD8lPbUz0Tmx9C1frorTTFv5FasQTMEaz2ZB0PO26lhss8ymsTN2V/Am9y87jzaeYq2
sGVpNaT7NEvGWzTRNr/+rNmREpOyCg9hleqpWghJyIlF7Locmte/sEnY6wWDMRqkQDWpSHe0dVeK
rUk6AShTSCc+B58Ft5REm9VO7kqFkva86RzD0cQgkH+Avm/BdRiIfVzvI7T6Tx6c3r/ejOaUQFeA
PPhrCiAp67gqURIgoDrAyn//0rbBZgFJa1+uWdlleRhx3MIcidGfG4TTvR8d5N2Oc/5Qj8yI6FJo
w4P2Eq/3zlmTxvArroYAS5EkDy5zPb4gOlduLFCAHg==
=/86i
-----END PGP SIGNATURE-----

--------------CoXc84h21r0Z99y06de166ht--

