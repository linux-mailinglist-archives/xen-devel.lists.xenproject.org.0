Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F24E664D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 16:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294450.500706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPiI-0000Oo-29; Thu, 24 Mar 2022 15:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294450.500706; Thu, 24 Mar 2022 15:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPiH-0000MD-Uc; Thu, 24 Mar 2022 15:49:25 +0000
Received: by outflank-mailman (input) for mailman id 294450;
 Thu, 24 Mar 2022 15:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oofn=UD=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nXPiG-0000Lr-Bp
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 15:49:24 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f88381c7-ab89-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 16:49:22 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D30A5C0150;
 Thu, 24 Mar 2022 11:49:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 24 Mar 2022 11:49:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 11:49:20 -0400 (EDT)
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
X-Inumbo-ID: f88381c7-ab89-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=k6pocNC7Mal5rgiN3
	mkeBhz3SFpTXA2RjUK8dB1FjHg=; b=hgPaDCUjUGTTlsoK8fq8tJOts6qHjOPSo
	TZF1K2vVsXhROYG5iOlf4vwc7b4dHaSAF/VeezvIAzqZ+6yvWT7ebJJPXS3eaODm
	pFfJqdkWvkVEGFIgVT1wmDAlWieknPdXpgiDe4bvyFgvxcedJGE57h8STwFhQOI2
	oZcZijyQpDKOvC5dxPN3ZzFAS5dtdDhA3Zcsj7UvxpOTRxtFvRzmG7A4Sb+TPjIP
	qXZoomOVG8ljUAstZJpGFGyFcbuPIKc3HHf/l2/AGAIK9sgUtv/lUVOa34F18joc
	eAtT2FL+pKTfX+vAvL+gZgzsqo5e5V/dksJYlo9+N38l4pohg292g==
X-ME-Sender: <xms:AJM8Yncp62RCeV1Sz5mD1qAsSUhZTld7Y1wQ-fwEIMGw5mMCBC4Gbg>
    <xme:AJM8YtOtC_M3_9DFEYlke8RSW1QY8jS00KyNFghR0S0kqLkHIb8c6dZxI4cXEUjlh
    APSqwJ91nzNBK8>
X-ME-Received: <xmr:AJM8YgjtCCoCDK-ickrjxxeA3zdvvHuqYxSHYVLqCIu09rqOexaiRtglUcEuBVfzGZhW5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfhfhffujggtsehgtderredtfeejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudegudfgteefjeefhedtgfegteff
    ledvgedvjeethffhkeefleduteevudfhueenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:AJM8Yo-IBaNyNSK8T5kH3-vDqN-AxaT6gtU2STSY0c-5zAdiwXYJAQ>
    <xmx:AJM8YjtjI4Ro_fuYhdZ70Mdf5oKWcTCr-UTm2VmpXvkZXU7XAjL0eQ>
    <xmx:AJM8YnHegjPwSddQDplrZ7Z2spcWv1l0PZSUq1erpfAJbZzKDhxOmw>
    <xmx:AJM8Yg6oujG2qt5Q5x6m1hIcLh3COQA07IFzVBhVINmMaljvU0yjzQ>
Message-ID: <f101f6f6-d6d3-4877-20a4-ebae0130c756@invisiblethingslab.com>
Date: Thu, 24 Mar 2022 11:49:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
References: <Yjx4kNv7hG4FGGot@itl-email> <Yjx8G5tH4Xf8+oVx@Air-de-Roger>
From: Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: Support status of OpenBSD frontend drivers
In-Reply-To: <Yjx8G5tH4Xf8+oVx@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------clYcnKVzagODISGKeblKL0nR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------clYcnKVzagODISGKeblKL0nR
Content-Type: multipart/mixed; boundary="------------2fS6pBJQ57e1pG6T0FqzsgWk";
 protected-headers="v1"
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Message-ID: <f101f6f6-d6d3-4877-20a4-ebae0130c756@invisiblethingslab.com>
Subject: Re: Support status of OpenBSD frontend drivers
References: <Yjx4kNv7hG4FGGot@itl-email> <Yjx8G5tH4Xf8+oVx@Air-de-Roger>
In-Reply-To: <Yjx8G5tH4Xf8+oVx@Air-de-Roger>

--------------2fS6pBJQ57e1pG6T0FqzsgWk
Content-Type: multipart/mixed; boundary="------------iWRQhEtmGGIXGAk0tgqu8wsB"

--------------iWRQhEtmGGIXGAk0tgqu8wsB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/24/22 10:11, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 24, 2022 at 09:56:29AM -0400, Demi Marie Obenour wrote:
>> As per private discussion with Theo de Raadt, OpenBSD does not conside=
r
>> bugs in its xnf(4) that allow a backend to cause mischief to be securi=
ty
>> issues.  I believe the same applies to its xbf(4).  Should the support=

>> document be updated?
>=20
> I think that's already reflected in the support document:
>=20
> 'Status, OpenBSD: Supported, Security support external'
>=20
> Since the security support is external it's my understanding OpenBSD
> security team gets to decide what's a security issue and what is not.
>=20
> That however creates differences in the level of support offered by
> the different OSes, but I think that's unavoidable. It's also hard to
> track the status here because those are external components in
> separate code bases.
>=20
> Could be added as a mention together with the Windows note about
> frontends trusting backends, but then I would fear this is likely to
> get out of sync if OpenBSD ever changes their frontends to support
> untrusted backends (even if not considered as a security issue).

As a Qubes OS developer, I still think this is useful information and
should be documented.  For instance, if I choose to add proper OpenBSD
guest support to Qubes OS (as opposed to the current =E2=80=9Cyou can run=

anything in an HVM=E2=80=9D situation), I might decide to have OpenBSD
guests use devices emulated by a Linux-based stubdomain, since the
stubdomain=E2=80=99s netfront and blkfront drivers *are* security-support=
ed
against malicious backends.  I might also choose to have a warning in
the GUI when switching the NetVM of an OpenBSD guest to something other
than the empty string (meaning no network access) or the (normally
fairly trusted) sys-firewall or sys-whonix qubes.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
--------------iWRQhEtmGGIXGAk0tgqu8wsB
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE1hcmllIE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVu
b3VyQGdtYWlsLmNvbT7CwXgEEwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQW
AgMBAh4BAheAAAoJELKItV//nCLBhr8QAK/xrb4wyi71xII2hkFBpT59ObLN+32F
QT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS9AwggioUSrcUKldfA/PKKai2
mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kzPMc879NV2nc6+ela
Kl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+VK+xifQq
t8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH9
0kkBTG+aEWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48M
u0C3IG1seeQDjEYPtqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44
IDRt+3ZcDqsPppoKcxSyd1Ny2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7e
SvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJitfRP7YbiRVc2aNqWPCSgtqHAuVraBRb
AFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4xXd3iV/uD8JLGJfYZIR7oGWFL
P4uZ3tkneDfYzTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFA
aW52aXNpYmxldGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGy
iLVf/5wiwQUCX6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwWRhD/0YR+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQr
QCWe38WnOXkBoY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReK
gMP7etRTwn3Szk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2h
PSjT2jUCBWDVrGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIV
FDJTmQzuEqIyJl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1
HL5VQCNQdqEc/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkW
mWun/2uOJMQhra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e
573WN/MpQ5XIFl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7f
EG4bYddCfDsNxaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xX
Tx4ls0xaxDCufudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCG
NKCj622ZSocHAcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM1ARGVtaSBN
YXJpZSBPYmVub3VyIChJVEwgRW1haWwgS2V5KSA8ZGVtaUBpbnZpc2libGV0aGlu
Z3NsYWIuY29tPsLBjgQTAQgAOBYhBHaHTZ8TNroiWQcccbKItV//nCLBBQJgOEV+
AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJELKItV//nCLBKwoP/1WSnFdv
SAD0g7fD0WlF+oi7ISFT7oqJnchFLOwVHK4Jg0e4hGn1ekWsF3Ha5tFLh4V/7UUu
obYJpTfBAA2CckspYBqLtKGjFxcaqjjpO1I2W/jeNELVtSYuCOZICjdNGw2Hl9yH
KRZiBkqc9u8lQcHDZKq4LIpVJj6ZQV/nxttDX90ax2No1nLLQXFbr5wb465LAPpU
lXwunYDij7xJGye+VUASQh9datye6orZYuJvNo8Tr3mAQxxkfR46LzWgxFCPEAZJ
5P56Nc0IMHdJZj0Uc9+1jxERhOGppp5jlLgYGK7faGB/jTV6LaRQ4Ad+xiqokDWp
mUOZsmA+bMbtPfYjDZBz5mlyHcIRKIFpE1l3Y8F7PhJuzzMUKkJi90CYakCV4x/a
Zs4pzk5E96c2VQx01RIEJ7fzHF7lwFdtfTS4YsLtAbQFsKayqwkGcVv2B1AHeqdo
TMX+cgDvjd1ZganGlWA8Sv9RkNSMchn1hMuTwERTyFTr2dKPnQdA1F480+jUap41
ClXgn227WkCIMrNhQGNyJsnwyzi5wS8rBVRQ3BOTMyvGM07j3axUOYaejEpg7wKi
wTPZGLGH1sz5GljD/916v5+v2xLbOo5606j9dWf5/tAhbPuqrQgWv41wuKDi+dDD
EKkODF7DHes8No+QcHTDyETMn1RYm7t0RKR4zsFNBFp+A0oBEAC9ynZI9LU+uJkM
eEJeJyQ/8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd
8xD57ue0eB47bcJvVqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPp
I4gfUbVEIEQuqdqQyO4GAe+MkD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalq
l1/iSyv1WYeC1OAs+2BLOAT2NEggSiVOtxEfgewsQtCWi8H1SoirakIfo45Hz0tk
/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJriwoaRIS8N2C8/nEM53jb1sH
0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcNfRAIUrNlatj9Txwi
vQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6dCxN0GNA
ORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog
2LNtcyCjkTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZA
grrnNz0iZG2DVx46x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJ
ELKItV//nCLBwNIP/AiIHE8boIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwj
jVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGjgn0TPtsGzelyQHipaUzEyrsceUGWYoKX
YyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8frRHnJdBcjf112PzQSdKC6kqU0
Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2E0rW4tBtDAn2HkT9
uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHMOBvy3Ehz
fAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVss
Z/rYZ9+51yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aW
emLLszcYz/u3XnbOvUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPt
hZlDnTnOT+C+OTsh8+m5tos8HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj
6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E+MYSfkEjBz0E8CLOcAw7JIwAaeBT
=3Dx+Ro
-----END PGP PUBLIC KEY BLOCK-----

--------------iWRQhEtmGGIXGAk0tgqu8wsB--

--------------2fS6pBJQ57e1pG6T0FqzsgWk--

--------------clYcnKVzagODISGKeblKL0nR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmI8kv4ACgkQsoi1X/+c
IsFQZA/+LuyCqpYwQ9Q5bpH73LexASerjkX2hoDBBcCAhTO0j76JyXaQ936F20qd
iW6tBKvH0gYwH4U8Yf/DrA+u4VGKGfo1jl68Iu2ri7xXcRzph2ot1h9A7vUkxl4/
07NHlQ2HTw2qZ1D+0nNhotuTh9gZZvkn5hS6tqvGO+trI9nvCvuFfi6WYk1B1Chg
662mkm6sdcCTmVR0uCrcS25aPwMbWeZe0i2w1Kj4jze4zsaCOKnhLSETa0I0xKHo
R47TQy9CCHtxWRbvxPRxJ2Ixa2Iz7oQPI7+pTDuD9T9s4qIEg0DA/UwMM+6tQ4ib
NaQxITw6IT3YPeKPQeoFldyYgxCfyB8Bn9fOhwqEQH7UkfHsk/YfrO1FEGkYhRKR
afWrYN9JZ0ZUaJLL4Q5YrifmkvB8Jr8L23+alLbDJNKHWtcMD+9m5SkJBRmUmuDg
fZk/lDt4FCNoH9aNNU6i4XphevsPK+SPge2uzPDBdxvuHEvpM50WZC83eetAYQ9D
BPcMCK8Uk850AyyB8+9GLS2a10S8IsAR821KjJLEKV6+gSheaA2l93MoYR/4rGL9
8qO21n79Ytj4U8Bp3w8Uj1eSvpGy1VSiCvwMgtCXa/csl77jnz6XdqQTL1EuEpPD
TpgRAaqbLzNiGmIK2LJodavSUDSpvQpjHQIe7LDl8/X2RIiaJzU=
=p+1K
-----END PGP SIGNATURE-----

--------------clYcnKVzagODISGKeblKL0nR--

