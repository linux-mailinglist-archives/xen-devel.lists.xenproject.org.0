Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F035F9E5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 19:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110699.211304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWjMH-0001v0-7L; Wed, 14 Apr 2021 17:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110699.211304; Wed, 14 Apr 2021 17:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWjMH-0001ua-37; Wed, 14 Apr 2021 17:31:21 +0000
Received: by outflank-mailman (input) for mailman id 110699;
 Wed, 14 Apr 2021 17:31:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2F6e=JL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lWjME-0001uC-Vp
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 17:31:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faa5a814-f0ef-4a05-9c69-cadf835c9aad;
 Wed, 14 Apr 2021 17:31:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31858B007;
 Wed, 14 Apr 2021 17:31:17 +0000 (UTC)
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
X-Inumbo-ID: faa5a814-f0ef-4a05-9c69-cadf835c9aad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618421477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8AdUsV5+m18DdyjTG3g+kQeVCexQmrWCAmXwuTMijAQ=;
	b=Vd3sU9pDC4cBGP/+vh7Wp180dWo7vPTf7Hzq2wy0nr2Kwtd+J6Ijr3QAj+Dfb3Fx0vq6t+
	hcrZ6aCUMUNHy9HIWIPL5KoTcPw1utDQik1PPxFV2u2DTv1UywyXZga+OC31Xls6v79b4w
	wEIG1yOwTCpuCAICsr99LnDMfTXPtAw=
Message-ID: <eefc512b8c1ac26c4eaae81e79ee0243901a3de2.camel@suse.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
 =?UTF-8?Q?=E2=80=8B?=
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Giuseppe Eletto
	 <giuseppe.eletto@edu.unito.it>, linux-trace-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Cc: Enrico Bini <enrico.bini@unito.it>
Date: Wed, 14 Apr 2021 19:31:15 +0200
In-Reply-To: <f33b39a5-9bbd-934f-a9cd-c536a0ba7416@citrix.com>
References: 
	<CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	 <f33b39a5-9bbd-934f-a9cd-c536a0ba7416@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qc+CrObLu0osWbgfz4gY"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0


--=-qc+CrObLu0osWbgfz4gY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-04-13 at 16:33 +0100, Andrew Cooper wrote:
> On 13/04/2021 15:28, Giuseppe Eletto wrote:
> >=20
> > You will need the development version of KernelShark, available
> > here:
> > https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
> >=20
> > A screenshot of the plugin in action is available here:
> > https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/=
.github/img/ks-xentrace.png
> >=20
> > I'm happy to receive whatever feedback you may have about it,
> > and to answer any question.
>=20
> Very nice.
>=20
> A couple of questions.=C2=A0 Which Xen libraries do you currently use map
> the
> frames?
>
Err... If I understood the question none, as the plugin loads and
parses a file, as it is produced by `xentrace`. :-)

But maybe I didn't understand the question?


> For the screenshot, there are a lot of examples where you have a
> dom:vcpu pair, and a number rendered in hex.=C2=A0 Throughout the
> hypervisor,
> we're standardising on d$v$ as a format, and e.g. d[IDLE]v$ for some
> of
> the magic domid's (0x7ff0 ... 0x7fff).
>=20
Yes, the content of the "info" column is currently a bit "raw". I
believe it should be made more similar to what `xenalyze --dump-all`
looks like, rather than to what xentrace_format` does (just to make and
example that people that have used these two tools can understand).

This is just due to the fact that we wanted to let the Xen and
KernelShark communities know about this work as soon as Giuseppe got it
working properly and reliably, to gather any kind of feedback, decide
where this should live, in the long run, (in Xen? In KS? In its own
project?), etc. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-qc+CrObLu0osWbgfz4gY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmB3JuMACgkQFkJ4iaW4
c+5XohAAkqpWChAgyY1C4y+vXJwHP5m+MjpnA8Cf9bLtSdZW+Brpu1SNA1/Ru51J
FVzt28RrvInag6xEMdVBNv3CmEQKAsq21D0C293ldO7Xc/qcKwo+lxRHR1pUOpkc
+2PSO/mDl/z8pAgVfThyzD1r0cg9G4m2F/L0Yr+98Demc2d5q4Tdwsw89O86eohl
f9hdPgr3M/IavYZRCBvWW2muBVsE9QDTUCeoTpfJw/RslsUXlremEo7EqttYNJnv
/oKUX49DfTZTVZoA0scDnEzDgjfQHTkmmstNWKHT401niFfa9WYcUmaKLnVGnPJv
IGuXlY38RSEPO6WathL7yleQ0qJ2C7WzzdGKNrw21k+8JnHyTepMk5L3B1BI2Oj3
uaSLdfBmqSaC7QY3ym7VA0mEnSkG7o4tgst9DK/C4CSaktI/kZuQmYKu9jBerJlk
Iqr0IIboPuGgvyuGwPPfBdDQMFlH4efyr2l6s3veMQMhvgwmMTFNVXTXti+c/yNC
pMeNT/TejIL3yyuXihC8dsSUwd29V4MIIRl33mTkyCnMhhqC8eQnPCMAAKVm9Sfh
UMH5w4qyMV306+MHyOWYC1UZzPBTu6GLNvfGMjQOphaTAiRk3thRsfMvgorgNLXC
NzXPBq5e39GaHtCwMdo8yrc7Fp70YpxIjBTdF65CSo+5pM0k8wk=
=3hdl
-----END PGP SIGNATURE-----

--=-qc+CrObLu0osWbgfz4gY--


