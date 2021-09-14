Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244C40AEFF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 15:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186625.335368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8aD-0000rR-8z; Tue, 14 Sep 2021 13:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186625.335368; Tue, 14 Sep 2021 13:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8aD-0000nq-5I; Tue, 14 Sep 2021 13:34:45 +0000
Received: by outflank-mailman (input) for mailman id 186625;
 Tue, 14 Sep 2021 13:30:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCGQ=OE=fedoraproject.org=pjp@srs-us1.protection.inumbo.net>)
 id 1mQ8WI-0000TI-6n
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 13:30:42 +0000
Received: from sonic314-19.consmr.mail.sg3.yahoo.com (unknown [106.10.240.143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e780da9-ceb6-4470-862f-3368c9ce0b0f;
 Tue, 14 Sep 2021 13:30:39 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.sg3.yahoo.com with HTTP; Tue, 14 Sep 2021 13:30:37 +0000
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
X-Inumbo-ID: 9e780da9-ceb6-4470-862f-3368c9ce0b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1631626237; bh=0Nh/Y6xPV4CIgLPlomK2v31ad896Cuh8tuUla8gXYJA=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=WBgabCv7VqlSscHaoyJAnNULqsBKn/hLYKbCkeq7f7M0Ro2NVT6j6bU3WY3ygqB06Ve9Uku7tsiXpbWAc3xY1d1qcY4yF3kPIInABh2G8+pHJU9yBkjVr2MbYqTczkDsen2ScfTnBZrdRS37XgINASlCWjFsUdG407WF5yndA0DAP2gBnyBs2+fBSt4AYj53F6rHNTOUmPb+ZskDBfRrGHM4ma6r3sgeP/GUie+zxHhEbVmSp+vqklCUlz8q0o8VcjwXi34O+RYPRzjfuW+HfxY+dDNMKOgrlqveZe+W5Q/LYe28YuojVOlQZ7kZx3ZJbS+mBoLclo0V1D9WKmnCdw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1631626237; bh=SporCpWUHBPKtAiDhTZuOydwhJPEm0S5V10VKjyr79z=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Lz/5jw/cd45EIRsRswLO/KZqCbn/IuavDVPIIGcItSAkXBxdu8Pn3DaohlECSAsZzOo+d1YH5NWdOe5c9Hnz35ZIFEaBWbbZGp1mvOV7Vz8u0zm0AXtNfit8pUH6z5eHhVF14C7FHz9RS2+Oq8eJmhORGEywo/GTCBqd9q9trl20pEp4iU/ZmEFDeVomG5yaGA0CqdzSrzztVCHaDs96dTgzEZDHDfzN5gnuq+YojIBMsT1IJ799Hqk2m3aog+5uRKT8W89pyQWMgKLuPSMdqkXPFotIv4deWoKbVfI5UxDlnyj3QAVVyzB3HYt2bbkkTlZ84o3E4LM9DM7UK4kQRw==
X-YMail-OSG: mLlyaboVM1mrhSXnTyTjnjQoxs4Qgg55vR6LHFZ5jDzt0tKCU1qo9a7OSSpJT11
 E1sWGG.iFXwp3Hqx86Tctpm0zpMK_I6APui2eXcNQ91gzCiye0xw85TVtAMqGADTDAxsivZqS6aR
 TCZftZs2SYB7M5zXd8YBj.7gh.kuiSPD.mVgB4.zODc7fSswwsEVTuqwyEMkG.bnKFkdzhzvSeZG
 HjGbmupCeAHoDCe4ByHQkE1jrn8xoaHVGOiivWp_7y.tHPkE56rpc8_y9spE10XrbMyF8WhrjpXO
 JaIfcZzgUyFlort1Lla_canu2n1Sgw5xT6MgWWwa_ZWb6J0NWM3oX.GJllIyxW9Mw4zo8_3GZV0S
 AUQ_i8tGaJXN6gnm6Qo4pP0ZWBXt9dbDvI0M7u5gQWRQ4XKSqu7TKPNPuL8l71ZFGhvb2flpWSTx
 pUuZ5r1oJtfH979NOMGk9FCSkjPi8NaHiTqGaF6uaIGN7ob4f8gm9maBTOi95VpFZGjaxzWmtxdJ
 McfGhFH5.yGbNtcDueQ8FVZfnmzgKyq2Vn549KZNzBS7YQNajAsiFj6acA1qDMSHDhpsf7MpbGIJ
 h.tNENxZtUIvpSyL6nAVu6AZZRPUQ5ull64ZJx.xPHBSFcCUoY_OxCfYNC85vWMgjGTBUJo.SKpF
 v7ZM70Z6O73AcoTH6jmqKQlbJa5SWPpeBjsS8whGyPJwssm0Tkn9hcs_sOhzHZYPPm_Sft0SgLpi
 0Bhl.csJDwu9uO6NbyGOM3TicHmEvrIjeg3ASEjGJFpEfv2M2wakU87Wan0XNJSsppNh4FirhvEO
 hUKxR4Bu2eveVBRI3a4qXF2QysBAWThaKdTLUkvaR4wtnoI9MUSU.EfUV2DFFK4USeOjrJYqJJz_
 MnvVTxPaU.qWlk0XHJrVa6pjEJCCP.gHpWerZUGGZfD5z_oRjg_vOgw7PeLDPm.8YElY_fysH5Lq
 NzYpA4ZW0FIYu1q617oWatc_cBhyZo4wJAR.YrcvlQfK00HT21ZSk.Kh1Y6tqa_w2TL4JVUkXweQ
 rPAbxIgS3QrhnoOdvYTswx.JmlibaMMPsBoXLYfA.wKr7JTdBXVQVA2Ep03Wq2OmxOT6aiW71WVm
 G72HL_3xIiNSRLhI7Z0jLvn0.eSuJrpcFC_NoJ8BExTHg4tOwn2E64CdW9EhFLg6M6mmUPPkzV2E
 yOsp8gJ.4wMXxC.dSTa8m4NzLgknCMSrtn0T4bTb897riI.mUX7ZdKzn.LrRTGGR0G2CYdTvnFxt
 3yAZsT0ObwJhhWfA_6guW28QLQ00CmSrj8mOtewkXTHHjmEfUeFUGsfzN2DsA91biSLUNMrr2Vwb
 kJkBctRUhkdUQzl1h31i3.Q1zIMdK8R4IdJICpxZpTsAEZBP6PEzYCTGO7RleDo7uUfYwLGYZdBD
 Ue2tTnmH2kA2pdPwx6LlEqpthATG2FMZFSB.Y5tI_yNQ8FxL4tYrvcyglMmSJSyVERx8znF58tUb
 510s67KW3yODK4aZKMqtrl4fpo.MxQQKiTrR_KW5W4gjuS2bM.W5w0u5BTxHanyCkZAU6DkKtyks
 QjF7y6X4YtD_uDBHD1mM3f.N9kZUInSlPlFnVZKSowSQtFpLkklzf4SthWjDXtTkOpY9OyIX_Rui
 5XrNHhuNTQlHWTuit2H7ZbJwQxC_2PeLFFbVhEmuSPMczjHZjkiPuy2NKlJ7oun6oWS7cXxOcB8Z
 OzHQF5GdRSLSsinzsZi3Oel2Ox7xYnJN1goI82Bz_jKoeBMjTD1yFgU1RyRbkn.zEd2ezm8zv5Bk
 fMhk6OyFyqWMmcN51m5tKHdrAn56UiOnpYoM2garlCkv9NSNhMgw_Lh58gkHk4WMBvupBmGItvP0
 BJLXmnwbcjHe5TqovDVP_eFzDCG31EvpKUBywg1WoMAOuJEO_JBjcuhsjj0DaHwsTLM4a39Fb8gg
 2q.5PEDUsDU_anowV42IQ6KhqtZ0N8VNbqw7xqwWFF01tcxN5Psy356obfXp7ghIl2KQpPZWf8MV
 KJBWSHE_n2Eqop.HfxCzzj7NSwVPag6bWcLMcuSyR3j8AjTEte2iseamCZCKnG41DSveXpC7XkSH
 kITanbdJBIITXhVNWLKTERKJS9WSPAjHtytE2kfQCIULoRWaY79KV0EQ7F2Mo0jC9tRifR3RJgi6
 b3qZwHAUKaDG1ryKDlPlMQmLG4GBPwBnpBrIItklixg0lFr1WjhtU5UInVL2piBEr2aB_k8xYlEQ
 mSWnZK11AOB9bkXojOwxF3AyVOaoRl60DWzmAQLNewn6STqDFa.PsugMJXuQyKRwyMKHGuTngFFG
 H9pOC5eGHZN0fBedKgh37FQoLRWya4OQPBTw7t2L4qk7lTzBi4lAYJomQGW1tZ0blrftW1D8trEM
 14Fo-
X-Sonic-MF: <pjp@fedoraproject.org>
Date: Tue, 14 Sep 2021 13:30:27 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.co.in>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	Thomas Huth <thuth@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, 
	Eric Blake <eblake@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <798304472.4432617.1631626227208@mail.yahoo.com>
In-Reply-To: <YTnhy/Wo5M1qVs1k@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com> <YTnhy/Wo5M1qVs1k@redhat.com>
Subject: Re: [RFC PATCH 00/10] security: Introduce
 qemu_security_policy_taint() API
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.18924 YMailNorrin

Hello Philippe, all

>On Thursday, 9 September, 2021, 03:58:40 pm IST, Daniel P. Berrang=C3=A9 <=
berrange@redhat.com> wrote:
>On Thu, Sep 09, 2021 at 01:20:14AM +0200, Philippe Mathieu-Daud=C3=A9 wrot=
e:
>> This series is experimental! The goal is to better limit the
>> boundary of what code is considerated security critical, and
>> what is less critical (but still important!).
>>
>> This approach was quickly discussed few months ago with Markus
>> then Daniel. Instead of classifying the code on a file path
>> basis (see [1]), we insert (runtime) hints into the code
>> (which survive code movement). Offending unsafe code can
>> taint the global security policy. By default this policy
>> is 'none': the current behavior. It can be changed on the
>> command line to 'warn' to display warnings, and to 'strict'
>> to prohibit QEMU running with a tainted policy.
>

* Thanks so much for restarting this thread. I've been at it intermittently=
 last few
=C2=A0 months, thinking about how could we annotate the source/module objec=
ts.

=C2=A0 =C2=A0-> [*] https://lists.gnu.org/archive/html/qemu-devel/2020-07/m=
sg04642.html

* Last time we discussed about having both compile and run time options for=
 users
=C2=A0 to be able to select the qualified objects/backends/devices as desir=
ed.

* To confirm: How/Where is the security policy defined? Is it device/module=
 specific OR QEMU project wide?

> IOW, the reporting via QAPI introspetion is much more important
> for libvirt and mgmt apps, than any custom cli arg / printfs
> at the QEMU level.
>

* True, while it makes sense to have a solution that is conversant with
=C2=A0 the management/libvirt layers, It'll be great if we could address qe=
mu/cli
=C2=A0 other use cases too.

>it feels like we need
>=C2=A0 'secure': 'bool'

* Though we started the (above [*]) discussion with '--security' option in =
mind,
=C2=A0 I wonder if 'secure' annotation is much specific. And if we could wi=
den its scope.
--- x ---


Source annotations: I've been thinking over following approaches
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1) Segregate the QEMU sources under

=C2=A0 =C2=A0 =C2=A0 ../staging/ =C2=A0 =C2=A0 =C2=A0<=3D devel/experimenta=
l, not for production usage
=C2=A0 =C2=A0 =C2=A0 ../src/ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=3D good fo=
r production usage, hence security relevant
=C2=A0 =C2=A0 =C2=A0 ../deprecated/ =C2=A0 <=3D Bad for production usage, n=
ot security relevant=C2=A0

=C2=A0 =C2=A0- This is similar to Linux staging drivers' tree.
=C2=A0 =C2=A0- Staging drivers are not considered for production usage and =
hence CVE allocation.
=C2=A0 =C2=A0- At build time by default we only build sources under ../src/=
 tree.
=C2=A0 =C2=A0- But we can still have options to build /staging/ and /deprec=
ated/ trees. =C2=A0
=C2=A0 =C2=A0- It's readily understandable to end users.

2) pkgconfig(1) way:
=C2=A0 =C2=A0- If we could define per device/backend a configuration (.pc) =
file which is then used
=C2=A0 =C2=A0 =C2=A0at build/run time to decide which sources are suitable =
for the build or usage.

=C2=A0 =C2=A0- I'm trying to experiment with this.

3) We annotate QEMU devices/backends/modules with macros which define its s=
tatus.
=C2=A0 =C2=A0It can then be used at build/run times to decide if it's suita=
ble for usage.
=C2=A0 =C2=A0For ex:

=C2=A0 =C2=A0 $ cat annotsrc.h

=C2=A0 =C2=A0 #include <inttypes.h>

=C2=A0 =C2=A0 enum SRCSTATUS {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVEL =3D 0,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PRODUCTION,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPRECATED
=C2=A0 =C2=A0 };

=C2=A0 =C2=A0 uint8_t get_src_status(void);
=C2=A0 =C2=A0 =3D=3D=3D

=C2=A0 =C2=A0 $ cat libx.c

=C2=A0 =C2=A0 #include <annotsrc.h>

=C2=A0 =C2=A0 #define SRC_STATUS DEPRECATED

=C2=A0 =C2=A0 uint8_t
=C2=A0 =C2=A0 get_src_status(void)
=C2=A0 =C2=A0 {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return SRC_STATUS;
=C2=A0 =C2=A0 }
=C2=A0 =C2=A0 =3D=3D=3D

=C2=A0 =C2=A0 $ cat testlibx.c

=C2=A0 =C2=A0 #include <stdio.h>
=C2=A0 =C2=A0 #include <annotsrc.h>

=C2=A0 =C2=A0 int
=C2=A0 =C2=A0 main (int argc, char *argv[])
=C2=A0 =C2=A0 {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf("LibX status: %d\n", get_src_status());
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
=C2=A0 =C2=A0 }
--- x ---



* Approach 3) above is similar to the _security_policy_taint() API,
=C2=A0 but works at the source/object file level, rather than specific 'str=
uct type' field.
=C2=A0=C2=A0

* Does adding a field to struct type (ex. DeviceClass) scale to all objects=
/modules/backends etc?
=C2=A0 Does it have any limitations to include/cover other sources/objects?


* I'd really appreciate any feedback/inputs/suggestions you may have.


Thank you.
---
=C2=A0 -P J P
http://feedmug.com

