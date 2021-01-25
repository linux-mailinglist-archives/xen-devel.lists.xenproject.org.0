Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F292730270F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 16:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74168.133282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l443B-0005Ag-Bo; Mon, 25 Jan 2021 15:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74168.133282; Mon, 25 Jan 2021 15:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l443B-0005AH-7z; Mon, 25 Jan 2021 15:45:09 +0000
Received: by outflank-mailman (input) for mailman id 74168;
 Mon, 25 Jan 2021 15:45:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pamT=G4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l4439-0005AA-HR
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 15:45:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07df2e41-ac5c-46fd-b27b-a0ed81c650b8;
 Mon, 25 Jan 2021 15:45:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB88EACFB;
 Mon, 25 Jan 2021 15:45:05 +0000 (UTC)
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
X-Inumbo-ID: 07df2e41-ac5c-46fd-b27b-a0ed81c650b8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611589505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5URBD/jApFV4aZ5/xqUPXtUjrrLc/eKS60Y12XaiJHE=;
	b=IB0tIAbggpVPMvWVBrGfB83TlIS64oi5aacSP6nLP4f3/+2MqPappurgUyDFHlPwNE3LQZ
	/8wRQDI+Q4xGaARDMVtxk4Ldrq5n9b02wX50AcvCYduayXulYCCHnGVKgef1cPR79+Xaej
	aeOHOnK+EY6v1CEwVbArcaAFY6oQVJ0=
Message-ID: <3e7a9989b35ac05c668f6dd7310faad682989b33.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Anders =?ISO-8859-1?Q?T=F6rnqvist?= <anders.tornqvist@codiax.se>, 
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Mon, 25 Jan 2021 16:45:04 +0100
In-Reply-To: <8eef0e27-63bc-5202-9857-8143c94acd04@codiax.se>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
	 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
	 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
	 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
	 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
	 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
	 <8eef0e27-63bc-5202-9857-8143c94acd04@codiax.se>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IcQhpVIwUukEZ59pUPNq"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-IcQhpVIwUukEZ59pUPNq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTAxLTIyIGF0IDE4OjQ0ICswMTAwLCBBbmRlcnMgVMO2cm5xdmlzdCB3cm90
ZToKPiBMaXN0aW5nIHZjcHVzIGxvb2tzIGxpa2UgdGhpcyB3aGVuIHRoZSBkb21haW4gaXMgcnVu
bmluZzoKPiAKPiB4bCB2Y3B1LWxpc3QKPiBOYW1lwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSUTCoCBWQ1BVwqDCoCBDUFUgU3Rh
dGXCoMKgIFRpbWUocykgCj4gQWZmaW5pdHkgKEhhcmQgLyBTb2Z0KQo+IERvbWFpbi0wwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMMKgwqDC
oMKgIDDCoMKgwqAgMMKgwqAgci0twqDCoMKgwqAgMTAxLjcgMCAvCj4gYWxsCj4gRG9tYWluLTDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
wqDCoMKgwqAgMcKgwqDCoCAxwqDCoCByLS3CoMKgwqDCoCAxMDEuMCAxIC8KPiBhbGwKPiBEb21h
aW4tMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDDCoMKgwqDCoCAywqDCoMKgIDLCoMKgIHItLcKgwqDCoMKgIDEwMS4wIDIgLwo+IGFsbAo+
IERvbWFpbi0wwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMMKgwqDCoMKgIDPCoMKgwqAgM8KgwqAgci0twqDCoMKgwqAgMTAwLjkgMyAvCj4g
YWxsCj4gRG9tYWluLTDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAwwqDCoMKgwqAgNMKgwqDCoCA0wqDCoCByLS3CoMKgwqDCoCAxMDAuOSA0
IC8KPiBhbGwKPiBteWRvbXXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCDCoCDCoCAxwqDCoMKgwqAgMMKgwqDCoCA1wqDCoCByLS3CoMKgwqDCoMKgIDg5
LjUgNSAvCj4gYWxsCj4gCj4gdkNQVSBuciAwIGlzIGFsc28gZm9yIGRvbTAuIElzIHRoYXQgbm9y
bWFsPwo+IApZZWFoLCB0aGF0J3MgdGhlIHZDUFUgSURzIG51bWJlcmluZy4gRWFjaCBWTS9ndWVz
dCAoaW5jbHVkaW5nIGRvbTApIGhhcwppdHMgdkNQVXMgYW5kIHRoZXkgaGF2ZSBJRCBzdGFydGlu
ZyBmcm9tIDAuCgpXaGF0IGNvdW50cyBoZXJlLCB0byBtYWtlIHN1cmUgdGhhdCB0aGUgTlVMTCBz
Y2hlZHVsZXIgImNvbmZpZ3VyYXRpb24iCmlzIGNvcnJlY3QsIGlzIHRoYXQgZWFjaCBWQ1BVIGlz
IGFzc29jaWF0ZWQgdG8gb25lIGFuZCBvbmx5IG9uZSBQQ1BVLgoKUmVnYXJkcwotLSAKRGFyaW8g
RmFnZ2lvbGksIFBoLkQKaHR0cDovL2Fib3V0Lm1lL2RhcmlvLmZhZ2dpb2xpClZpcnR1YWxpemF0
aW9uIFNvZnR3YXJlIEVuZ2luZWVyClNVU0UgTGFicywgU1VTRSBodHRwczovL3d3dy5zdXNlLmNv
bS8KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo8PFRoaXMgaGFwcGVucyBiZWNhdXNlIF9JXyBjaG9vc2UgaXQgdG8gaGFw
cGVuIT4+IChSYWlzdGxpbiBNYWplcmUpCg==


--=-IcQhpVIwUukEZ59pUPNq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAO54AACgkQFkJ4iaW4
c+7HUg/+KV8ZDjd/iqsgOJIpMjZznnI4rDTIlKw9oq7kEv70AQIWwnO1Nqu3YvO3
P5P2tXvWQvtngwV9+6TUjfnD/3K+FYylaVieVYzKvLgGkSIiKGHcxoJ1X54z1xNb
D42vTguVCVvruVvu29BcIaTb96A8wcAj0mAXJRAXjSwn48nHcFGMGeMrSldIKCfC
WL7ELqrxZMQdkdaRzFQSFdHL/Y65j6gWZX6J18Rbbcdl7IDjXIyB44srcbuEFL1b
qmYg0YAqWYLwgtE0pUKZjirQhuRToZUYXP8hewK9Xr4lxP5ppYPelzEcbjl3ZkBn
QyJru83l9Lo11opCVFQAmdPRH8jJD4xZ8vtU/JGYRJt/87XK44SPC8icE9BTlH3W
erc9MGOR7TAA7JUUiPjTEJzNOw7iB9uwIZBmE0HsXd1eUDW/xVnHigrnorOyYUXI
MwaCNAQnSX/1uzgpOh1YtFzfNGGy63rTkkZKlW/eTztOosx+yg6bqvQj3DSLUlSU
XexnJgZ8nHG9GL6xN+62XhwDJSHVCNW6TP6bVwNpUjAyugfvuqHYX5CVjPUb7J4b
YEOusEC+wfYd8DY7dJu1pOezy0k1SEFPTJQmkmo0o5zw87y4U+BH9CkrcbUSFSCG
u8/95prJMl48ooT6SpOOiXzpDKgWmXth4UpGK7Gxw4DSqC7Zqkg=
=6rW3
-----END PGP SIGNATURE-----

--=-IcQhpVIwUukEZ59pUPNq--


