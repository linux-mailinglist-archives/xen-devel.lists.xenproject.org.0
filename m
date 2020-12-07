Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5262D0938
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 03:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45858.81355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km6Wi-00006h-7S; Mon, 07 Dec 2020 02:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45858.81355; Mon, 07 Dec 2020 02:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km6Wh-00006P-Uk; Mon, 07 Dec 2020 02:45:23 +0000
Received: by outflank-mailman (input) for mailman id 45858;
 Mon, 07 Dec 2020 02:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQzx=FL=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1km6Wf-00006K-UX
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 02:45:22 +0000
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bb06536-42c9-4db5-a85f-dd97a89bae40;
 Mon, 07 Dec 2020 02:45:17 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cq72d3llFz9sVx; Mon,  7 Dec 2020 13:45:13 +1100 (AEDT)
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
X-Inumbo-ID: 3bb06536-42c9-4db5-a85f-dd97a89bae40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1607309113;
	bh=TC0GOGaKbPAwP2EkbRQ9BPtcqZhEMWFvPmP9ecxIISo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUcv192BLmiuo8zL9otdtQLt0UfmEo9EO574qHkkb6rjQT6zTr7LJVVf2p3ucpts5
	 7cCe77CeGg6dbknawRx9okhPJam/pPRWj1UOXXKDU9Ofz0d7yY7SUKIGVn6xqTuM1f
	 BBPukzLSjLblB+Cwg8oG8n6FG6BUR8UK014fAN+4=
Date: Mon, 7 Dec 2020 12:38:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
Subject: Re: [PATCH 6/8] gitlab-ci: Add KVM PPC cross-build jobs
Message-ID: <20201207013838.GA2555@yekko.fritz.box>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-7-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20201206185508.3545711-7-philmd@redhat.com>


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 06, 2020 at 07:55:06PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Cross-build PPC target with KVM and TCG accelerators enabled.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> later this job build KVM-only.
> ---
>  .gitlab-ci.d/crossbuilds-kvm-ppc.yml | 5 +++++
>  .gitlab-ci.yml                       | 1 +
>  MAINTAINERS                          | 1 +
>  3 files changed, 7 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> diff --git a/.gitlab-ci.d/crossbuilds-kvm-ppc.yml b/.gitlab-ci.d/crossbui=
lds-kvm-ppc.yml
> new file mode 100644
> index 00000000000..9df8bcf5a73
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
> @@ -0,0 +1,5 @@
> +cross-ppc64el-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-ppc64el-cross
> +    TARGETS: ppc64-softmmu
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a69619d7319..024624908e8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -15,6 +15,7 @@ include:
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
> =20
>  .native_build_job_template: &native_build_job_definition
>    stage: build
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d41401f6683..c7766782174 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -397,6 +397,7 @@ PPC KVM CPUs
>  M: David Gibson <david@gibson.dropbear.id.au>
>  S: Maintained
>  F: target/ppc/kvm.c
> +F: .gitlab-ci.d/crossbuilds-kvm-ppc.yml
> =20
>  S390 KVM CPUs
>  M: Halil Pasic <pasic@linux.ibm.com>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Nh5wACgkQbDjKyiDZ
s5LYEhAA36/x+ZVjKjbCR9cpbx/bxHW9hRFzSUsSkrFIx/72fqe7yXS0+kSyiZXE
yZw9xCYqyHNWkGbRdPbWWeICzn7uKP4JrKOGXhIWYmuAdCmRoodf95DLaEEsgyW1
kJswja2Od7ZqPytGo3Ybe540knkUj6a/Hae5nskOMw6f3RfjC1sLeCLz5Dfzup3F
0tbSKBXobELtf0AP7PIut9DQZKdorQXf4OO0gJDOkCqHUsvkuL0HqJ7mARHu0ca2
oFCZaO5Ko8frdptD5ik/n77Nqi+MqJrp81LvkiJrLRCSZPoex8RUWcAg/gDcQfoL
3nd92ZnOyWmuo72Pz0LK3jQCaIyvxVzikuWqpdeYK1/fQ3wx3em2S1vaksXmSbRJ
RXgIE/zSbZhbKSqpeQyowhJ1N0MxgrTiAwXJMapfwoA0z7rOvMFNAhhX2RLEIPYC
G/9c/KHEtBod2tp0GSUtMkIM2k/Dq9jobShxZubJOV3Z2bMsuILrPBccYIaEjjzT
eA8OCWafnik+e2Rqi9SOrTbVqgsVqOmhw1Muu5zrgRLBahI9FQx9XKC2Wji6mbTB
3/+qZ67nkzA29J4wfMi+WDpGUztqt6Ee65opWx8tTmOUMB2ReWYovhh34IbtsL4s
5RwEYP5Fm5CbUoZ0m/O2dsUXPt66NDALXeP51FDZuup1HQXp5y4=
=Obzg
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

