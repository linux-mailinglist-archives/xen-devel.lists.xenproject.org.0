Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2245392808
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 08:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132830.247702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lm9px-0005VS-Mb; Thu, 27 May 2021 06:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132830.247702; Thu, 27 May 2021 06:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lm9px-0005S9-JP; Thu, 27 May 2021 06:49:45 +0000
Received: by outflank-mailman (input) for mailman id 132830;
 Thu, 27 May 2021 06:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6svk=KW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lm9pv-0005S3-TG
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 06:49:43 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c56180c-6d3c-4cdc-b64e-332c96a5d916;
 Thu, 27 May 2021 06:49:42 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 817651FD2E;
 Thu, 27 May 2021 06:49:41 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 2BD3411A98;
 Thu, 27 May 2021 06:49:41 +0000 (UTC)
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
X-Inumbo-ID: 2c56180c-6d3c-4cdc-b64e-332c96a5d916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622098181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnnDfhpNM1bhZGYvaec0cOaHN0XeXmaI2oMqG3Z58sw=;
	b=BurW7Ax2LDSdGBZIVsDwwSCu0yXTMB1b4IrMKfKIYBOWs+VM14FAEyd8BnvpB84C4tfT/p
	XHB/53kfGlXpMm/Tldudm5LFiKbvJhHrpDQeyL1wumUg2We3KPBcWvN1pMTIrKZhHcyhj3
	h12hCKPutFTEVk+GCewLw8bcqW93zag=
Message-ID: <b1f53cd19ed65eec756d20fdec45c2c5cf79d0d8.camel@suse.com>
Subject: Re: [PATCH v2] firmware/shim: UNSUPPORTED=n
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
	Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Date: Thu, 27 May 2021 08:49:40 +0200
In-Reply-To: <72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
	 <72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-p3zACkEDhn8ruykc7ySY"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-p3zACkEDhn8ruykc7ySY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-05-26 at 09:37 +0200, Jan Beulich wrote:
> We shouldn't default to include any unsupported code in the shim. Mark
> the setting as off, replacing the ARGO specification. This points out
> anomalies with the scheduler configuration: Unsupported schedulers
> better don't default to Y in release builds (like is already the case
> for ARINC653). Without at least the SCHED_NULL adjustments, the shim
> would suddenly build with RTDS as its default scheduler.
>=20
> As a result, the SCHED_NULL setting can also be dropped from defconfig.
>=20
> Clearly with the shim defaulting to it, SCHED_NULL must be supported at
> least there.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

> ---
> v2: Also drop SCHED_NULL setting from defconfig. Make SCHED_NULL the
> =C2=A0=C2=A0=C2=A0 default when PV_SHIM_EXCLUSIVE.
> ---
> I'm certainly open to consider alterations on the sched/Kconfig
> adjustments, but _something_ needs to be done there. In particular I
> was puzzled to find the NULL scheduler marked unsupported. Clearly with
> the shim defaulting to it, it must be supported at least there.
>=20
I think null both should and can be supported. There's an outstanding
bug [1], which we may want to finally fix before declaring it as such.
More important IMO, we should add an OSSTest test for it.

The latter may be tricky, as the hypervisor configuration of such test
needs to be host specific. In fact, we need to know how many CPUs we
have on the host, and configure Xen to give only a subset of them to
dom0 (or offline a few, after boot), as well as avoid running on 1 (and
problably also 2) CPUs hosts... or we won't be able to start guests
and/or do local migration jobs.

I can try to put something together, but I don't currently have an
OSSTest development environment up and running any longer, so it may
take a couple of iterations...

[1]
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.html

> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -16,7 +16,7 @@ config SCHED_CREDIT2
> =C2=A0
> =C2=A0config SCHED_RTDS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "RTDS scheduler supp=
ort (UNSUPPORTED)" if UNSUPPORTED
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default y
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default DEBUG
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0---help---
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The RTDS scheduler=
 is a soft and firm real-time scheduler for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multicore, targete=
d for embedded, automotive, graphics and
> gaming
>
This is fine for me, for now.

That being said, if remember correctly, it should have all the features
that we said we wanted to it to have for declaring supported... Is
anyone of the embedded/safety/automotive/edge users and downstreams
interested interested on helping making RTDS first class citizen? And,
if yes, what's the path toward that?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-p3zACkEDhn8ruykc7ySY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCvQQQACgkQFkJ4iaW4
c+5UeBAAxlkUHK0z0T95InbKBme00f7wm2alfj+/IL9g/kmSGG8GsacQm/fwMBGW
a38i9AATsA1nEW2VZXXAFKEF0PMug2s5q4M8Y2AsRcU7t4UW3grvhXfU6ipBA5bN
0fgPpWGTFLRrr5NXEryHCUp2hQwCBezkX0u6LUWmbUfahcCx9JN+TZVc/eojBFPm
xXmN5NG4U5cNmnXO99XnVGsePYnUuU0AuLfVxAPT9uJh5OOOF4XtAQBXS1CbFCQ1
Oij23qXzVrPQAQG1KKHxenH68SZFnxz/cXzb8OUqC1GU49yufLL0NLkTC6hApUE9
NF1lMydzR8WLHu0XAZULf95Pk0ToPgb+X/BcIpiYMHeEYPpZxlsD8bLAr0A9yVKK
ziGIYREXhTcrJvUQNQZPIcauJ3ZMH1r3tGS0N+aQhU1nezRI0zmL9/rIcgvW86aH
/+TY+INBM32A+6mySOfBkeiPjpXnw7jbDz2Oj/attzlHs18bhqVAHFTNkzhzaqgC
VDG5653h6GCCKC+RTxIZyWHKUab3l3pwORxydIbiccJgdNavj2ZhMLo8nv/5YVqy
3T4zuMlDNY5TKVUXZudfpbn93gqPrAv1dvMjNyh5zCUyUx3BdmN1SV1SfSP6i+kB
VNHgGXzOo3VbyHUqH4atY5QKeoxzbCS+5pmtA3zZhebv8thPZLo=
=SFvu
-----END PGP SIGNATURE-----

--=-p3zACkEDhn8ruykc7ySY--


