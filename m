Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1631DF05
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 19:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86411.162235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCRQt-0005da-9y; Wed, 17 Feb 2021 18:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86411.162235; Wed, 17 Feb 2021 18:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCRQt-0005dB-6l; Wed, 17 Feb 2021 18:20:15 +0000
Received: by outflank-mailman (input) for mailman id 86411;
 Wed, 17 Feb 2021 18:20:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VV3x=HT=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1lCRQr-0005d6-Av
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 18:20:13 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 924806b7-d942-45d4-8821-89b50adfa9ee;
 Wed, 17 Feb 2021 18:20:11 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id 9866FC36AAE;
 Wed, 17 Feb 2021 19:20:09 +0100 (CET)
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
X-Inumbo-ID: 924806b7-d942-45d4-8821-89b50adfa9ee
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: pkg-xen-devel@lists.alioth.debian.org
Subject: Re: [BUG] Linux pvh vm not getting destroyed on shutdown
Date: Wed, 17 Feb 2021 19:19:58 +0100
Message-ID: <2712384.y2I76aXMJt@localhost>
In-Reply-To: <2195346.r5JaYcbZso@localhost>
References: <2195346.r5JaYcbZso@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2401644.GujMsZU7iO"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2401644.GujMsZU7iO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Samstag, 13. Februar 2021 16:36:24 CET Maximilian Engelhardt wrote:
> Here are some things I noticed while trying to debug this issue:
> 
> * It happens on a Debian buster dom0 as well as on a bullseye dom0
> 
> * It seems to only affect pvh vms.
> 
> * shutdown from the pvgrub menu ("c" -> "halt") does work
> 
> * the vm seems to shut down normal, the last lines in the console are:
[...]
> 
> * issuing a reboot instead of a shutdown does work fine.
> 
> * The issue started with Debian kernel 5.8.3+1~exp1 running in the vm,
> Debian kernel 5.7.17-1 does not show the issue.
> 
> * setting vcpus equal to maxvcpus does *not* show the hang.

One thing I just realized I totally forgot to mention in my initial report is 
that this issue is present for us also on a modern kernel. We tested with 
Debian kernel 5.10.13-1.
--nextPart2401644.GujMsZU7iO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmAtXk4ACgkQgepkfSQr
0hVZnBAAlR1926bhLwZ9/eKezs1tlhnBdCJpxZhabVDyFKshycl+43skylXlftXh
5fmyqrKNUnXXXDUOAUl44+5ezvDVISC2DEb1OTfgXY1JJFz61wku10yCIoe2xU0u
NnW8YbhuLIkW+6RDXxVWe7IP7mCnT1W2MEfAqGC/Ed8P4ETo05VK/nnTAB4Cotjr
4Hq/Ho9xgQEyVhJzlVIX0je8QcCn/PikpQ0u+1fRmLeIg6hWur5qf+54Mbga4+iK
v22dAfKq2ml8FF69UfkjVkQdjJai3L49QERQtXjrQpv4SrvLX9mCC1TcxynfM8E2
hb8plgRKV4C5pBCK0fB0pybsiXQUuUPi/eZDkO+oQkwz2uOEqC+GXIMOv/UicacB
u/2w7mBsKvKZwBilgDAFxTqLYjdedmJ7wTAlplN6HoyH666xhf8pCw3OXagwtCjC
rfahDuSMnWgG+tZ4VL4CGSJHGRrTHoa3XcUqFWdGahOKZfsZWTjWlr8NlB4+VfjN
nvbpRkDnhYrcfoeyBTsRsxEfhzB0rlyCPPl8ZlzUflGfgiA2XL3E+gnyKYihRNcz
bjKqPhNaoXtmyp7QBTDkVaXSCm1xQknXaTEwyR1xDlP5q4IjVmWK03+pX8Iq0Twa
EwYoZQRgefvbZz2pdLzY756TTeykdtkbUbIeD9NoQDCS5ulUykY=
=Xcx9
-----END PGP SIGNATURE-----

--nextPart2401644.GujMsZU7iO--




