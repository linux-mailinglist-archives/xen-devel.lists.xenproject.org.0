Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5777057FA
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535677.833621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0iq-0007an-5O; Tue, 16 May 2023 19:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535677.833621; Tue, 16 May 2023 19:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0iq-0007Yo-1U; Tue, 16 May 2023 19:52:36 +0000
Received: by outflank-mailman (input) for mailman id 535677;
 Tue, 16 May 2023 19:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkax=BF=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pz0ip-0007Yi-1r
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:52:35 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 322b42ad-f423-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:52:32 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4GJqRYhk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 May 2023 21:52:27 +0200 (CEST)
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
X-Inumbo-ID: 322b42ad-f423-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1684266747; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pn33qygtTjnTEZquBGtiwjIp123CnWh5/RtXZ8i11EgFae4xnIoVmNPm5o/Dv0SYR6
    MWQcS66dx4zhA0cOay3LCiVlMYPgeA5cdYj5slw0qpCFnwe5d+WJhIzujGLb3nn6me1x
    poPPYSsmtHTGuVefW7j2I0Evj/SqKM2gGg9XD0DhpteVTz+DePpI42suPmvLF9r8YxMD
    JxsbjhPKtGimAgQtL0KFskvCRMcyBv9BnHlMUWrxuHgdwYGg28bugntC5cwgS3PKigvQ
    q2vVGr/6Ydw1qwyRu7kDmsB3kMvyQ+KCJxWTQOr6KC1bXdECWcRJ897I53ZgbCGFitUY
    IXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684266747;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=BDMMOZsldew5E9T5aGGViOq4aXtP5rfj0eDk121sUHo=;
    b=V26oMDKTx+Ey+q4epnIkaz5JpP0V3iFNciVaMZ/XuGpTEpF4EjcXFAb8ZVaVoXHzo3
    1LuMoYfl4WPUN3n+TTx54xOlI0zNzF99STP/HcxlIHsaDKBkQwgN8armZRcymVRSjy+h
    5X27jlEgWB2+ZUL+/qnPICdOaWiRrwjoDc66iAryzoOqylSnDw4PlgT9UBHWwuQ0k9td
    GEPYbyGIgPr7ywOag2014WdU7kjeK0yKPMkmArDXofttC54SdXTycuQurBniU07QFnpV
    YXjuhrG+bhHpJPplvzyc69oSKOmp2pNOr1p52RWk1kLXswcPILuyrExAZB5QrrRVjsOv
    +uVg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684266747;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=BDMMOZsldew5E9T5aGGViOq4aXtP5rfj0eDk121sUHo=;
    b=SCGOvYfLyiElJ3IuuJoFxBTasZ6RGcEOTQ10mAmCQUXz2kn617BK/V6W5l7Cf5EWMf
    vcumd0gw4iyxqwAMpiD3rmbcij7I0aqsgmxZpVjfWCioMPi6MN9XVjw4Tzz6PSSzOAq4
    3z8vmF+6VDEqgIyP2qQrhv45xgGdvzEnb6zZgdaV0khYzknWM1sKYsC0nQ29ej31udCv
    sR9n2L3TM1yvD0+EUqBQNzP8/Bk6MSOvLs/deY3hoZIPHp47P0BuLlAdu2BjzgFWwRTz
    snaCsXYGvoOVc+ud7lFvUH5FiFfJtkLU1BjJJ8farUhkcb9A0MwBOfjXR1V5Pa1B0b98
    k+eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684266747;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=BDMMOZsldew5E9T5aGGViOq4aXtP5rfj0eDk121sUHo=;
    b=KDK8l/H/GUYo83TnygN3pqIqRwZLqEOfv8ak8d0nk6bkLSkHg/ljmvbhvOYJP5Gl1d
    g/0fhVNJr4IJmVnR7VCw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX/0jCNVp4ivfSTHw=="
Date: Tue, 16 May 2023 19:52:04 +0000
From: Olaf Hering <olaf@aepfle.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: provide example for downloading an
 existing container
Message-ID: <20230516195204.66590536@sender>
In-Reply-To: <alpine.DEB.2.22.394.2305161145540.62578@ubuntu-linux-20-04-desktop>
References: <20230502201444.6532-1-olaf@aepfle.de>
	<alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop>
	<20230516105155.0c59143a@sender>
	<alpine.DEB.2.22.394.2305161145540.62578@ubuntu-linux-20-04-desktop>
X-Mailer: Claws Mail 2023.04.19 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CAWtVK+TT+/BwI/I/9/MjiR";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--Sig_/CAWtVK+TT+/BwI/I/9/MjiR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 16 May 2023 11:46:00 -0700 (PDT)
schrieb Stefano Stabellini <sstabellini@kernel.org>:

> I think you have a point that automation/build/README.md should also
> describe how to do what gitlab-ci does but locally (i.e. call
> automation/scripts/build). It should not only describe
> automation/scripts/containerize.

Meanwhile I have figured this out, additional variables must be set. I
already sent a patch for the example. That way I was able to
understand and reproduce the error seen in the CI build.

> https://gitlab.com/xen-project/xen/-/jobs/4284741849

It turned out this bug in qemu is triggered by debug=3Dy vs. debug=3Dn in
the build environment. I have not checked which commit exactly fixed it
in upstream qemu.git, it should probably be backported. Or qemu should
be moved forward to v8.x at some point. I think I have not seen this
specific failure in my own qemu.git builds.

The reason is: --enable-debug will disable _FORTIFY_SOURCE, so the build
succeeds. Without that flag, configure will enable _FORTIFY_SOURCE.

> Sure I see your point. On the other hand Tumbleweed jobs are the ones
> and only with "allow_failure". So among all the possible choices as
> example, do we really need to pick the one and only that has been
> failing for months? :-)

Yeah, this is exactly the point, to give copy&paste commands so that
contributors can investigate such failures locally.

I did not follow the state of the openSUSE builds in the past months. I
think Tumbleweed did succeed a few weeks ago because the last snapshot
was meanwhile one year old, and all gcc12 bugs are already fixed by now.


Olaf

--Sig_/CAWtVK+TT+/BwI/I/9/MjiR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCZGPe5AAKCRBdQqD6ppg2
fqfKAKCS/24du88I45VdwyhioKbsC+Y9JwCgwlmR6dtkco+OMVCIjhVRPxwzjvk=
=u4bK
-----END PGP SIGNATURE-----

--Sig_/CAWtVK+TT+/BwI/I/9/MjiR--

