Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A8308750
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77823.141217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PzX-0005yK-Cu; Fri, 29 Jan 2021 09:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77823.141217; Fri, 29 Jan 2021 09:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PzX-0005xv-9X; Fri, 29 Jan 2021 09:22:59 +0000
Received: by outflank-mailman (input) for mailman id 77823;
 Fri, 29 Jan 2021 09:22:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fPE=HA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l5PzV-0005xq-Ot
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:22:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f0d2fb6-4e66-4454-90a1-e6f8d66209c1;
 Fri, 29 Jan 2021 09:22:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DEF6CAE91;
 Fri, 29 Jan 2021 09:22:55 +0000 (UTC)
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
X-Inumbo-ID: 8f0d2fb6-4e66-4454-90a1-e6f8d66209c1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611912176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGgPYztO+0rylfHk6IPKOzxMniNBIGgnLby6eA0LL/Y=;
	b=Q02PpM6DY8NDdFwyVlAummpLzisrG9sLqNeVBbrL+xSoGl3tLvI/nUlrYUrIij+XkHR/fV
	BSKtRhxTxDSgSkGnPvtTKD5kJG01J5C3MORw45EmOjsaae4Mit+IxlofWzN4M4BiOEy8h9
	mC5SioAiL+k6FHfWYZdbUpkrnFTDWa8=
Message-ID: <6e22c129c22cdd07a989b5fecf000510b75a5250.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>, Ian
 Jackson <iwj@xenproject.org>,  xen-devel@lists.xenproject.org
Date: Fri, 29 Jan 2021 10:22:54 +0100
In-Reply-To: <78cb6825-c5db-4613-3fd6-e7fc98441b41@suse.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
	 <24576.27654.137226.608671@mariner.uk.xensource.com>
	 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
	 <8c4b30f5f16824124e50922c871d440bf39991ba.camel@suse.com>
	 <78cb6825-c5db-4613-3fd6-e7fc98441b41@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tjUDujZuQh4293BmnCnK"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-tjUDujZuQh4293BmnCnK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-29 at 09:38 +0100, Jan Beulich wrote:
> On 28.01.2021 19:26, Dario Faggioli wrote:
> >=20
> > Did I forget any?
>=20
> Going just from my mailbox, where I didn't keep all of the still
> unaddressed reports, but some (another one I have there is among
> the ones you've mentioned above):
>=20
> https://lists.xen.org/archives/html/xen-devel/2020-03/msg01251.html
>
Yes, thanks! Now that you mention it, I do remember this one. It
definitely does look like scheduling related (not scheduling algorithm
probably, but "scheduling as a whole").

Well, I now have boxes that supports suspend that I can use, so I will
try *again* to reproduce it locally.

> https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html
>=20
Yes. So, my working theory is that this is the same issue as:

https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.html

I.e., the one that I listed as 1) in my "recap" (actually, I though I
mentioned it there somewhere, but now that I check, I actually didn't,
so thanks for this too).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-tjUDujZuQh4293BmnCnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAT0+4ACgkQFkJ4iaW4
c+642BAApNvusfOjEpVLBK6GODNnSTnuPI/2sVOX74swhlQUlaJc0DPbcFwbSS2X
jGPrwNh8vjWUNBzaOZhFAc5Jrl6zJmbHT4JBHcwIGomPFAIkV2I0fr+r//VkSEZL
qpnQSdHdKuKrtUSlFwyiiZ24d7Za7fCuJXb0AflqFds5EDTWW7BDeTFF7K//qgoY
lamrClxlCbwANHBxjybymTuAKrGJgCc5V+/a+vu81eIcW5PT9RrH2GRRoJWj5onV
T71+mqHTa+fd9slrCYIFNyk2U9a2sxxsHIR/EzkwY+1cS8HKOllTDM+ibYS4Rp5r
EfFsv5imK+xnc08IiIXGy1K1Fi8ALfrlh0OFV5GRwxIWQ4aVw2vReSuRiZpgeWZD
JuF8ItEs5/lpW9ppZuAGG+3vIVs2+Fs18vFvQcf6gFp7Q6A9fhSnuaOpK5h81v2J
wlA9EFuHfN+4BxT8nkVcZ5VX9GqC+Kic2XEfOtTbcOFBiQ0ZGFyH+6GdORh0f7u1
Z5nkwn47/3hlXeFc2dUFDBhoILkiFZV8EyrWM7oFZcV0a5Z8y2JGm8ItweuCWjmz
rjASRsnnli1Akj7zC03RqMSPAEzxg6cnNdRINHH+ar+Cu/3qWs86oEN7S1SuizhY
yCFHkqnJw4E+oKmTd1aKkRvyA4ksOj1CnT7olDILXcU2ebN2F6U=
=0M4j
-----END PGP SIGNATURE-----

--=-tjUDujZuQh4293BmnCnK--


