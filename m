Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9E62CA6EA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 16:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42177.75842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7V0-00011i-Jj; Tue, 01 Dec 2020 15:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42177.75842; Tue, 01 Dec 2020 15:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7V0-00011J-Gd; Tue, 01 Dec 2020 15:23:26 +0000
Received: by outflank-mailman (input) for mailman id 42177;
 Tue, 01 Dec 2020 15:23:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hnjp=FF=cknow.org=didi.debian@srs-us1.protection.inumbo.net>)
 id 1kk7Uy-00011C-SX
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 15:23:24 +0000
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86b74837-e761-409c-b030-f221c89ab567;
 Tue, 01 Dec 2020 15:23:22 +0000 (UTC)
Received: from bagend.localnet (92-110-45-68.cable.dynamic.v4.ziggo.nl
 [92.110.45.68]) (Authenticated sender: didi.debian@cknow.org)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 83C201BF213;
 Tue,  1 Dec 2020 15:23:18 +0000 (UTC)
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
X-Inumbo-ID: 86b74837-e761-409c-b030-f221c89ab567
X-Originating-IP: 92.110.45.68
From: Diederik de Haas <didi.debian@cknow.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.14] Fix spelling errors.
Date: Tue, 01 Dec 2020 16:23:17 +0100
Message-ID: <7175790.EvYhyI6sBW@bagend>
Organization: Connecting Knowledge
In-Reply-To: <44d06209-65de-f959-fb93-90a924cbf055@suse.com>
References: <5f4935dbc0257e19b87b9461ea62e25328a6091e.1606833490.git.didi.debian@cknow.org> <44d06209-65de-f959-fb93-90a924cbf055@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3565244.kQq0lBPeGt"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3565244.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.14] Fix spelling errors.
Date: Tue, 01 Dec 2020 16:23:17 +0100
Message-ID: <7175790.EvYhyI6sBW@bagend>
Organization: Connecting Knowledge
In-Reply-To: <44d06209-65de-f959-fb93-90a924cbf055@suse.com>
References: <5f4935dbc0257e19b87b9461ea62e25328a6091e.1606833490.git.didi.debian@cknow.org> <44d06209-65de-f959-fb93-90a924cbf055@suse.com>

On dinsdag 1 december 2020 16:10:13 CET Jan Beulich wrote:
> I'm afraid this isn't the kind of change we'd be backporting, 

Ok, I didn't know that. 

> unless you have a very good justification for a respective request. 

I was fixing issues found by Debian's lintian tool and 4.14  is currently in 
testing. I highly doubt that counts as a (good) justification ;)
I'll (try to) find another way.

> Also, process-wise, there wouldn't normally be patches sent to the
> list for the stable trees.

Ok, sorry for the noise and thanks for the information.

Cheers,
  Diederik
--nextPart3565244.kQq0lBPeGt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEf+PJh5LtCd6LDwjYE45BkVx+/tYFAl/GX+UACgkQE45BkVx+
/tY1qA//a1FLmWQpVrJKMcEweFcINA2B7SuwSRfLDZdw3FzHyQEblJJXaVgRf1c/
EoQyMhyOojjuku1IPeSk9anS8avLhUePhIDIK+8cY2emYWoso8DPyN2z36RAUky6
7Th2XSXuhhsT4r33oMccV5CoHj482wOEeBImBp2OlM8LAW5gRrDXSBfsepfQ2JQs
t62ftG/KuvvIpNFIMPpNy72G2Vcb0B7pFZB+6cUrrrymzkiuKxH7FgkKRsNWwpvt
D14WjagmG5ouWyWyGAe8FX/UXP76vjA91Nh9tPcd4mCYuGtWhbXefUbMlQDE/VPk
yHB0ND9WmtSej8/9ijxwec8kbLdAjI2agQcxUNA9bcYxu5jcfyPHtS9V+jsWhoz+
PMlxJOLwzdNSSdatW+q7G5TMfB57ASdD52auAWFjiEJPxjyzz+BmiaKGe1lHIYT1
MVCGGhzLaHdHWhICN/g8F6sTwIq/9GRhLVmKidwbpCEL2+tIrnff+1iLdmMmYrjc
/KW3i0kD+ZPOBGkGjNetSNREPf9dSygwCKIMMUsZwCl0V5OczkqCeGNR5muNzqhL
1GiziWJh/JA+9eNUeRlpEa2MF58dzuqcw/JwEeD1PFs8gzneA9au4kYRT69Zrh5h
I7SsSsmQpgmevK9uxnXOZWO+K+465e021wdot3IrxnHqB65CKa0=
=ykDn
-----END PGP SIGNATURE-----

--nextPart3565244.kQq0lBPeGt--




