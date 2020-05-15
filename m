Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0AF1D553E
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 17:56:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZcgr-00049Z-UB; Fri, 15 May 2020 15:56:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eCno=65=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jZcgq-00049U-D6
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 15:56:00 +0000
X-Inumbo-ID: 91e325b4-96c4-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91e325b4-96c4-11ea-9887-bc764e2007e4;
 Fri, 15 May 2020 15:55:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 61E23ABC2;
 Fri, 15 May 2020 15:56:01 +0000 (UTC)
Message-ID: <aa35e39df4e8b10650678f8fa385f80364208270.camel@suse.com>
Subject: Re: [PATCH v3 2/3] xen/sched: don't call sync_vcpu_execstate() in
 sched_unit_migrate_finish()
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 15 May 2020 17:55:57 +0200
In-Reply-To: <20200514153614.2240-3-jgross@suse.com>
References: <20200514153614.2240-1-jgross@suse.com>
 <20200514153614.2240-3-jgross@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-UqaGQ5PM4VTxPNQ6DIZQ"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
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
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-UqaGQ5PM4VTxPNQ6DIZQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-05-14 at 17:36 +0200, Juergen Gross wrote:
> With support of core scheduling sched_unit_migrate_finish() gained a
> call of sync_vcpu_execstate() as it was believed to be called as a
> result of vcpu migration in any case.
>=20
> In case of migrating a vcpu away from a physical cpu for a short
> period
> of time ionly without ever being scheduled on the selected new cpu
> this
> might not be true, so drop the call and let the lazy state syncing do
> its job.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-UqaGQ5PM4VTxPNQ6DIZQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6+u40ACgkQFkJ4iaW4
c+7BwRAA2rZs7YlhgJhoP8L0xeiN/Wsq4EkIhQJbZHRVOE/fgs4lgFCQSmOQF0EO
aoMOPp3sM2GCchEWfaEHF7T8Rl5d51J29iJVZFhCQlqPHuAody+NviqQhaXrnKyN
a3Fr9silEajjkqqdHyXM2acZn2Gh6MnQzIEfcEem7i6CWylzr0UmFWranvc1he7s
TJQ8lgv04mWvHZjwKuDaFXGhcPJ5IY4xqVqQbrwvrgkYdihxAAf9rASNpps+QcA/
7m1wNm5AuNukQ2TLir28MvmTJN/TcuudoCHJnZPVl2hX8H2FE5GumyCzdOzBN+7d
gfDwcDNcwau2hOvPpspmlBYdimb1XwhLa2yEl0T6jr66MXxYRaSItV7Or5hcww8y
WOXMr2CZHke3R64h9u0GExEeKe1bP3yQmQkAI1q+6oDSeSTh7KCPF86rBXSjfEqy
aZHqoKgWrWcc7wBkwi2hc/ABHLfP4Pb9WE7L5im7ave9KyIiVzDqJp9rxTfndeQi
fAVdFd5vVVl28MPCTQNh8eyugZugCFt+lK6D0+NYkg3uAg0paHTyUH2M0s09i1ij
Brdt95jfuWtShZRc/Z5qznTLskcpnmXM8LcvTJFXGinn4eSdjcF1FIPOKtg4fb1o
M+7Qwt/fpvu2fGJDVQq2uSa+9TygmXdO8Ad3iHqKEewHfHHVmcQ=
=RjuR
-----END PGP SIGNATURE-----

--=-UqaGQ5PM4VTxPNQ6DIZQ--


