Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616339C74CF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 15:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835788.1251645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEi6-0003y5-7o; Wed, 13 Nov 2024 14:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835788.1251645; Wed, 13 Nov 2024 14:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEi6-0003vp-4l; Wed, 13 Nov 2024 14:51:10 +0000
Received: by outflank-mailman (input) for mailman id 835788;
 Wed, 13 Nov 2024 14:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lrmv=SI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBEi4-0003vj-60
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 14:51:08 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b42af7ef-a1ce-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 15:51:03 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb559b0b00so58287141fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 06:51:03 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff4d2d3788sm2734311fa.81.2024.11.13.06.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 06:51:01 -0800 (PST)
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
X-Inumbo-ID: b42af7ef-a1ce-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI0MmFmN2VmLWExY2UtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTA5NDYzLjYzMzAwMSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731509462; x=1732114262; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hxnNMdCCzmIkJZzArvasiBQS8HZj6aDo8doSkAViJ6A=;
        b=OjySWGrHEYawA13ZrpTUeN45sofFuR5v4TH7O3iESmSE5jI8Yyou1BKMis/ppSYNxd
         5//Zy6/Gd2So3Dr0+2wRDkqQAdD4qEkcuHMDPvKnm6sB1DEv318qj/bDr6kpA5mEStlO
         7bq35e/TjzLX87bziwSJe5grKTPYght+z78Uo8fenIvr3g/62pv+Wmw+CIAbR7iPHUz7
         VebfJ6s/c+c8KnPlQ2oXuj6dth8F7Ijc4ZLlFM9WtLzmLupQsgru3ltn2+dtCReQU+Kt
         kuJpjRTU/Tu0ffQBIt+J9FDGqHxFYB7s0J+CYDmxSgHAhmODG7feifT8zNnoWdCknQi5
         D+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731509462; x=1732114262;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxnNMdCCzmIkJZzArvasiBQS8HZj6aDo8doSkAViJ6A=;
        b=Rz7UDPubHNeeE+xRxaYrScsYCGMkSaeSZJSqzHte27um10CYl1/UCiasK4vZ/nH2vU
         otJzS6za7i5eEz2cR2MIQlY0fyEA+lXBQcSm8n1nkFqqyDJlVrV8rrBNSCTRhgCiXPf0
         WmKeC4bJp96e3zLd9AYdkZ+0VaKZYt5/OJRseg77oN39NPDtSWCSDDWEO5Nsa4OyRpg7
         T86FTHMHl08S2d9gzyH65z6A5vhP8JbrVK1F9M39c9XrNF7DeXCo+AlG4G+HhAz3Bqtf
         PKawPzFA/S0+Ftp4uwDWzNe8jIbinXM1oEKYTm0T88s5+LA7yAeEPWFv8c63zCRFZUC/
         dMpg==
X-Gm-Message-State: AOJu0YyAti1PXC75VpU1j8ulKS9xl3nHtxFoaUOIfC3SHNPsXGA8tloM
	ogoUp5C2e7kh5/k5vCSAB0MzDA0RD6e3uRCUFgHyWhEVKLDbdEaN3FtnKA==
X-Google-Smtp-Source: AGHT+IFjDx9C3aIUhKhMoOoiYzRbnjL1q3PIsyM62hd2xp3CfBKSCY+JpUa7PJ/oCLhTT+Z257bUoQ==
X-Received: by 2002:a05:651c:991:b0:2fa:c4d4:ec44 with SMTP id 38308e7fff4ca-2ff202230e0mr115138251fa.28.1731509462036;
        Wed, 13 Nov 2024 06:51:02 -0800 (PST)
Message-ID: <15719907f015f7315131dc8725dcda18dbc2dfa6.camel@gmail.com>
Subject: Re: Xen 4.20 Development Update [August-October]
From: oleksii.kurochko@gmail.com
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Wed, 13 Nov 2024 15:51:01 +0100
In-Reply-To: <51B2EC23-B47D-4782-ADD8-C2201B380C12@arm.com>
References: 
	<CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
	 <51B2EC23-B47D-4782-ADD8-C2201B380C12@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

Hi Bertrand,

On Wed, 2024-11-13 at 13:02 +0000, Bertrand Marquis wrote:
> Hi Oleksii,
>=20
> > On 12 Nov 2024, at 16:16, Oleksii Kurochko
> > <oleksii.kurochko@gmail.com> wrote:
> >=20
> > Hello everyone,
> >=20
> > This email only tracks big items for xen.git tree. Please reply for
> > items you
> > would like to see in 4.20 so that people have an idea what is going
> > on and
> > prioritise accordingly.
> >=20
> > You're welcome to provide description and use cases of the feature
> > you're
> > working on.
> >=20
> > =3D Timeline =3D
> >=20
> > ---> We are here
> > * Last posting date: Nov 29, 2024
> > * Feature freeze date: Dec 20, 2024
> > * Hard code freeze: Jan 17, 2025
> > * RC1: TBD
> > * Release: Feb 21, 2025
> > ( current release schedule:
> > https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes=C2=A0)
> >=20
> > All patches that wish to go into 4.20 must be posted no later than
> > the last posting
> > date. All patches posted after that date will be automatically
> > queued
> > into next release.
> >=20
> > RCs will be arranged immediately after freeze.
> >=20
> > =3D Projects =3D
> >=20
> > =3D=3D Hypervisor =3D=3D=20
> >=20
> > *=C2=A0 Remove the directmap (v4)
> > =C2=A0 -=C2=A0 Elias El Yandouzi
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1dfc@=
citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8
> >=20
> > *=C2=A0 remove libxenctrl usage from xenstored (v1)
> > =C2=A0 -=C2=A0 Juergen Gross
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241023131005.32144-1-jgross@suse.co=
m/T/#md016c48a0889740d1822aa68f7f33d4ad48f4805
> >=20
> > *=C2=A0 automation: Refresh the remaining Debian containers (v2)
> > =C2=A0 -=C2=A0 Javi Merino
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@clou=
d.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
> >=20
> > *=C2=A0 Move gic_preinit() to common code (v2)
> > =C2=A0 -=C2=A0 Oleksii Kurochko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/2fe01b5a-aebb-4141-9cdd-887b5984d6b8@=
suse.com/T/#m8144a030ef64a479068482c864c9258a5cb43a87
> >=20
> > *=C2=A0 stubdom: reduce xenstore library dependencies (v1)
> > =C2=A0 -=C2=A0 Juergen Gross
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.co=
m/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83
> >=20
> > *=C2=A0 xen: address violations of MISRA C Rule 13.6 (v2)
> > =C2=A0 -=C2=A0 Federico Serafini
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.serafin=
i@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29
> >=20
> > =3D=3D=3D x86 =3D=3D=3D=20
> >=20
> > *=C2=A0 Expose consistent topology to guests (v7)
> > =C2=A0 -=C2=A0 Alejandro Vallejo
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vall=
ejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b
> >=20
> > *=C2=A0 Boot modules for Hyperlaunch (v8)
> > =C2=A0 -=C2=A0 Daniel P. Smith
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241102172551.17233-1-dpsmith@apertu=
ssolutions.com/T/#m94a2f6b9d410c6d624aaebd7c2bf85584c74383e
> >=20
> > *=C2=A0 x86/mm: miscellaneous fixes (v2)
> > =C2=A0 -=C2=A0 Roger Pau Monne
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m2df34239=
b793501c6246c85c4b00e52f9c439ac0
> >=20
> > *=C2=A0 x86/ucode: Simplify/fix loading paths further (v1)
> > =C2=A0 -=C2=A0 Andrew Cooper=20
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241107122117.4073266-1-andrew.coope=
r3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625d1
> >=20
> > *=C2=A0 Address Space Isolation FPU preparations (v2)
> > =C2=A0 -=C2=A0 Alejandro Vallejo
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vall=
ejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d
> >=20
> > *=C2=A0 Fix module-handling use-after-free's (v2)
> > =C2=A0 -=C2=A0 Andrew Cooper=20
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.coope=
r3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
> >=20
> > *=C2=A0 Reuse 32 bit C code more safely (v4)
> > =C2=A0 -=C2=A0 Frediano Ziglio
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.zig=
lio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7
> >=20
> > *=C2=A0 x86/alternatives: Adjust all insn-relative fields (v2)
> > =C2=A0 -=C2=A0 Andrew Cooper=20
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.coope=
r3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
> >=20
> > *=C2=A0 x86: address violations of MISRA C Rule 16.3 (v1)
> > =C2=A0 -=C2=A0 Federico Serafini
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1725958416.git.federico.serafin=
i@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be01ab6
> >=20
> > *=C2=A0 Support device passthrough when dom0 is PVH on Xen (v16)
> > =C2=A0 -=C2=A0 Jiqian Chen
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@=
amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
> >=20
> > *=C2=A0 x86emul: misc additions (v5)
> > =C2=A0 -=C2=A0 Jan Beulich
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/0b9a0ae8-a39c-49d8-b4e7-f2a463128058@=
suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe780e
> >=20
> > *=C2=A0 x86/HVM: drop stdvga caching mode (v2)
> > =C2=A0 -=C2=A0 Jan Beulich
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@=
suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117
> >=20
> > *=C2=A0 x86/HVM: emulation (MMIO) improvements (v1)
> > =C2=A0 -=C2=A0 Jan Beulich
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/31906cba-8646-4cf9-ab31-1d23654df8d1@=
suse.com/T/#mdae2f21b929170d60a8640e82857700c940e65c7
> >=20
> > =3D=3D=3D ARM =3D=3D=3D=20
> >=20
> > *=C2=A0 Enable early bootup of AArch64 MPU systems (v5)
> > =C2=A0 -=C2=A0 Ayan Kumar Halder
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241107150330.181143-1-ayan.kumar.ha=
lder@amd.com/T/#m9cfd8bed109cc703b6ae8b8b6faaa116c08598ee
> >=20
> > *=C2=A0 Add support for S32CC platforms and LINFlexD UART (v2)
> > =C2=A0 -=C2=A0 Andrei Cherechesu=20
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240930114715.642978-1-andrei.cherec=
hesu@oss.nxp.com/T/#m8452ac342fdcf989fc1e498c097812b50157f2cc
> >=20
> > *=C2=A0 Arm cache coloring (v9)
> > =C2=A0 -=C2=A0 Carlo Nonato
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241025095014.42376-1-carlo.nonato@m=
inervasys.tech/T/#md18fb02842c4ad2cd61b456be89020affcc452a3
> >=20
> > *=C2=A0 ffa: Improvements and fixes (v2)
> > =C2=A0 -=C2=A0 Bertrand Marquis
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1729066788.git.bertrand.marquis=
@arm.com/T/#mb0c8aab97d46f9c9e933b3b9b0eef7e717e1f2e5
>=20
> I would like to have this for next release and i plan to post the v3
> next week.
Certainly, it would be great to include this in the release, and we
still have some time to get it merged before the end of the feature
freeze. Ideally, though, it would be best to have it merged before the
last posting date. Do you think that=E2=80=99s achievable?

~ Oleksii
> >=20
> > *=C2=A0 Add Virtio-PCI for dom0less on ARM (v1)
> > =C2=A0 -=C2=A0 Edgar E. Iglesias
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesi=
as@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b
> >=20
> > =3D=3D=3D RISCV =3D=3D=3D=20
> >=20
> > *=C2=A0 Setup memory management (v5)
> > =C2=A0 -=C2=A0 Oleksii Kurochko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kurochko=
@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28
> >=20
> > =3D=3D=3D PPC =3D=3D=3D=20
> >=20
> > *=C2=A0 Early Boot Allocation on Power (v5)
> > =C2=A0 -=C2=A0 Shawn Anastasio
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@rapto=
rengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
> >=20
> > =3D=3D Completed =3D=3D=20
> >=20
> > =3D=3D=3D Hypervisor =3D=3D=3D=20
> >=20
> > *=C2=A0 libxl: Implement QEMU command line probe (v1)
> > =C2=A0 -=C2=A0 Anthony PERARD
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.perard=
@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb
> >=20
> > *=C2=A0 xen/bitops: hweight() cleanup/improvements (v3)
> > =C2=A0 -=C2=A0 Andrew Cooper=20
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.coope=
r3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4
> >=20
> > *=C2=A0 Move percpu code to common (v2)
> > =C2=A0 -=C2=A0 Oleksii Kurochko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kurochko=
@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f
> >=20
> > *=C2=A0 xen/livepatch: improvements to loading (v3)
> > =C2=A0 -=C2=A0 Roger Pau Monne
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau@citr=
ix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7
> >=20
> > *=C2=A0 Move {acpi_}device_init() and device_get_class() to common code
> > (v5)
> > =C2=A0 -=C2=A0 Oleksii Kurochko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5ceca0c=
15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829
> >=20
> > *=C2=A0 blkif: reconcile protocol specification with in-use
> > implementations (v1)
> > =C2=A0 -=C2=A0 Roger Pau Monne
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau@citr=
ix.com/
> >=20
> > =3D=3D=3D x86 =3D=3D=3D=20
> >=20
> > *=C2=A0 Drop Xeon Phi support (v1)
> > =C2=A0 -=C2=A0 Jan Beulich
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53ffd0@=
suse.com/
> >=20
> > *=C2=A0 Utilize ucode_force and remove opt_ucode_allow_same (v7)
> > =C2=A0 -=C2=A0 Fouad Hilly
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hilly@c=
loud.com/
> >=20
> > *=C2=A0 Switch flat driver to use phys dst for ext ints (v2)
> > =C2=A0 -=C2=A0 Matthew Barnes
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d26b=
b5f.1728311378.git.matthew.barnes@cloud.com/
> >=20
> > *=C2=A0 x86/shutdown: change default reboot method preference (v1)
> > =C2=A0 -=C2=A0 Roger Pau Monne
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau@citr=
ix.com/
> >=20
> > =3D=3D=3D ARM =3D=3D=3D=20
> >=20
> > *=C2=A0 iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support (v1)
> > =C2=A0 -=C2=A0 Grygorii Strashko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd549@=
xen.org/T/#t
> >=20
> > *=C2=A0 xen/arm: dt overlay fixes (v2)
> > =C2=A0 -=C2=A0 Michal Orzel
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orzel@=
amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078
> >=20
> > =3D=3D=3D RISC-V =3D=3D=3D=20
> >=20
> > *=C2=A0 initialize bootinfo from dtb (v2)
> > =C2=A0 -=C2=A0 Oleksii Kurochko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kurochko=
@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316
> >=20
> > *=C2=A0 Register Xen's load address as a boot module (v3)
> > =C2=A0 -=C2=A0 Oleksii Kurochko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kurochko=
@gmail.com/T/#t
> >=20
> > *=C2=A0 device tree mapping (v9)
> > =C2=A0 -=C2=A0 Oleksii Kurochko
> > =C2=A0 -=C2=A0
> > https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kurochko=
@gmail.com/T/#t
>=20


