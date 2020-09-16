Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3BA26C4F1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 18:13:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIa2f-0004PE-5a; Wed, 16 Sep 2020 16:12:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+xeX=CZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kIa2d-0004P9-4o
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 16:12:20 +0000
X-Inumbo-ID: d159e602-d6ef-447c-8dba-1f358885694e
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d159e602-d6ef-447c-8dba-1f358885694e;
 Wed, 16 Sep 2020 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600272736;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=QkiNsc9pEc0deTS8SS0W0CUcGOXUP8vtxYdliVl6iuo=;
 b=GGvHI81/VHc7meU2na6xEAU2/DupehE1hbMPWyOd0KIDDrkYaLH1lC1uVeU3nRpuD6
 Ue5u5KTW+uFA5nPlHUrJePmML0J/Uckh6dxhdC2yLCNHCdL4vnFf+4MOdu7Sqj1T+e+b
 By12a33w4SXEjL+zaztNy9pjuRzLNb+KNArO8HYixoInKQ8CJzCxRIUCPdCkl/lIsofk
 xbn/CmK7Shl5cTgA9sLixa5/0a07NIpn+C6j/BwkQkEyjIxG6QvFrufc4dD6yC5AUWPm
 1Hf139cLsrnijr/JiBqdm5IcWtd3dfcMGdq2fbpkgVgIoxd4iDIsiGXSf/LtOb5WlGrz
 ZHhQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G5Jjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id 60ad29w8GGCApYb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Sep 2020 18:12:10 +0200 (CEST)
Date: Wed, 16 Sep 2020 18:12:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: David I <dav.sec.lists@gmail.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: Compiling Xen from source
Message-ID: <20200916161206.GA20338@aepfle.de>
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
 <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
 <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
 <CA+js8L=dCJkE6y=GO2WNc0ufLaOXkx1BsMg3soCw+=wyDduPMQ@mail.gmail.com>
 <CA+js8LnzTkPtQXhQ-N85rM4Qd3HC2SpRQ5ZoSzh4CVx92tNYNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <CA+js8LnzTkPtQXhQ-N85rM4Qd3HC2SpRQ5ZoSzh4CVx92tNYNQ@mail.gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 16, David I wrote:

> So, how did the debian package was compiled ? is this the same source code with
> different options ?

Xen 4.11 is from 2018. Use also a compiler from that year.
Using this years compiler will lead to errors...


Olaf

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl9iOVEACgkQ86SN7mm1
DoAgOA//XRAsvFW7XXv/60TwXktYsS4DUII4pZnJXVBT7/L1zK0QBhKxzYLTQ9I4
8KgkHUUqopUV1BrVj96P0RMSBLCbSp4JiF/1ve2k0A85qZ0lzhH58+67pLeD3mcI
HcL7iqr8vkcjY0NnPcIoVuCOCm4YyOxXAJkfI+4dVM7K9MUjUXt+WZG7c8K2XwTT
OurLvAAXeBxrXivK9xjRdY4KFnxXp60obx6mQJB/Rg9da9i8aE6SV7ILNBGpBun7
+qa6Vb30U8mReF+sfAxfYq0ZVTePeSyLO8MTHsaGET4Ro42hJzj3w4Uo9tv31CDX
xRe51pDXNopkwiFMWdDk/Z8fpI+x6cp5MgWNg9oRY6k9SvPgOQyU6u/1MWkzfAqs
oMDNKAD9WCl30xF4eV8Q+ZaFYtZ7OqyqtZusLwS7V/hznCAeEmVPD8lSCcvYbWoL
O0l6I9rqUbU72V3rXBOEUabzEj7o4pL+pkCSVDgMzQj0EXGEDIUaNpSzKRc5oLGK
eNk+VP+/Ija6W8AVH3Hp/zF9+VGTnLpBgqHajtKTlFtjxifADY2BvENr0OdOOGmS
vaprWQV5B6zNNAvt2uBeGxGHQ+Xj600d8IcHKgbH6wYynf2OcA7SzhAhhED3Gdr6
U6KoQERfktp0L4O8z2CqfMBCWSzkXqO/ddiEcmD/Bp15qbDj4mg=
=3HGo
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

