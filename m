Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB8370DCA
	for <lists+xen-devel@lfdr.de>; Sun,  2 May 2021 18:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121290.229010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldEYw-0005v5-1e; Sun, 02 May 2021 16:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121290.229010; Sun, 02 May 2021 16:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldEYv-0005uZ-UT; Sun, 02 May 2021 16:03:17 +0000
Received: by outflank-mailman (input) for mailman id 121290;
 Sun, 02 May 2021 16:03:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Sey=J5=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1ldEYu-0005sz-AV
 for xen-devel@lists.xenproject.org; Sun, 02 May 2021 16:03:16 +0000
Received: from sonic312-21.consmr.mail.bf2.yahoo.com (unknown [74.6.128.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a55ea75c-e6ad-4d08-a4b8-33dae3d94ff5;
 Sun, 02 May 2021 16:03:10 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.bf2.yahoo.com with HTTP; Sun, 2 May 2021 16:03:10 +0000
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
X-Inumbo-ID: a55ea75c-e6ad-4d08-a4b8-33dae3d94ff5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619971390; bh=3C3MM45M/hjdAiAC849f2IgcIvq1FeC1uzvfLOkpDMM=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=SHyS5M66kGyU9ZIV7LgptIH4bZGcI+aNH59JQpfjQM5r3mbcfbqNIuHyAGzs17ndx5EK1QTmvo5G17/dFrt8y8kANs8zBI9Ahy/l8Ksv7WRkxKph3nyqK4JUNp9HuUbuVCtQFiBK3UtQqLwnQWEuLVgd0wzX3scASKyeOqBOWPZFdbjNHaldE1ZM0/pAOIXB3PTMpDsB+gO3DJLvk+gHlYAll/vusd1+yWs0D1Br8bRunN4rQcOhveKH+9yKpayBIvvHeuAboH7QNRmOuoQI1ojSU1iV1kRl2AmGdBH9+JUjA3gBi1eGHIdhKmVd2JhQuVByG0JabkCvOVUfjv4Ukg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619971390; bh=nzTeyeE7eFIS6zjwhUMRqJpebnhGGeYNAcU0zVkRdJY=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=FYL5T1f0HeheXSKv0ZUpsfijsCxHYmoVURxD3P3MQe6qjICCyxE7RqFVwWBl4wgxP3TM4ZS9YMKjhHGH2v3XDcmABKt1t/og8lVfJe1NKX8MZJO9SMnxJvDSBReNd3ClgVFECijDNgZdfDNnPQVhZr0gH2aw1FsYjvvTNUDrX/bU/IPs40fZItZu/tv66J67bI0hrXvljxWZhxadFMzVpo3gDaUaAFuQ5bwuouR6GPa5CVTJNFPZG5F3kMN9/hc3m2UbmMHMkcb44JqmpwIcIdxWWqIzOO0wo1vG4qx4B6OV/l40yuUEYb/99UUvECQvhrkdZ90MxlpWktXuRuK2iQ==
X-YMail-OSG: Y38cLKsVM1n3J9yA_qNi.BwFv_u3CjprynGWdWwdz_NXX_KNFxDo38lw2moaISN
 cf2MdkpB2zLXCXCRpbWa2TInjhvYynrCRZPn02nXJi5G4NSg7RV0zR_NvogNkdeLxoognARpqzsA
 DFiQBknwhEB7lcQVjT_1QHUScZlg_sD7h1ApWbjmLvppobnEg0PwAZkDzt2kIrj60CrCC_qE5RXo
 5LRb9tCbpZsG8WYXGgEN.9m5FEn9P4BG6DdzKNz6RKRLBa3b3oiY8qccWnVa9biuQrY4BaNlhB8y
 kB5UAy21zfkZoTgPP0Ypw1FvYqzAQBfjFm52njilAW8WjNmB6r7PsVGNLzzSU0jt5urTin_9gysc
 _.95ycY42NNmF6uDU.EEwuTtq10knCgbhjsFQiCULKY.5bQtEDWr5hbLfuuHqORf8eDOJGZowodb
 5Dht70w3NZsr9JRSw088PB1GkkSHSLg4V43YrJSNkrmXPIfqX0uVkauRBAkhYAcMJK6w3yIkawqR
 FoS9KO.6df1N0TrNVCJIPRB0IUQSoC.T2rn5BwfLQB47Q9_8SJdZfEABZwcvWq37ENmydN1NyIqc
 f.3H5qKoSZbxUmHOOgL4o_H3j.3w4W0g9QcnglzOzquirBIgN91x_q2PisHhmMCyQStqW35_hVuk
 Y5xBy_kMv9kzqi.7xSVvA6MkJge1HnHRTq8vWNAUdrHWz2buU7uYkiTf1oY9eT9ABIflfWrKZwhA
 ROVrPkfO4ZcPgL3ph90SOgmese.jHUrkxNyYlITuMHUDoWYoPayX66VZVhZ0Gjq7YV_qgB6Iqc4H
 zo6Gtee4ztGYbsEDOqvUaNtCD8FuPmydlSFp3Mmjdm5FhPReoaQsA.KsvNq_PUCif6RlKmpSU_4N
 lySxSPQjymA2xO.c4BpCBop.0.JrQFZeMUFnFJWiYc1ardsHztLRc0caosc5FosuXsnnqKvCjFeD
 D.tOiKoiMxT1rLzagtnPCH24xM3ONXhXP_LgzkhTVABJXCccA2L8qRHvgThyZxLGPVhXCTM8alxh
 wusFyZDjJ8u..AlHB.my3ueLeAzrh9EzS1e1XUgbbkwcJdEGDL.lAJp67LIBfrRPnk_.oOOEk1ZS
 q89HXpYOE0c2en3zo8KKfejID1VqqunSk53.3_raEg.PWzEEix2wC.br8tPaGIZnAqxGxRqX22XG
 VfaikL2pyz_4VRStOMGwdZwHuNTKLSzmsrCw4FxEpTOBDVjuNDHmdCxnW72fM2f2ecOSDgQSlwN6
 xqmdXFeIoSH9i7dUDolZLCelAVEuaXVy5PNeYBYtXwVmq08RlYkg19OowchMA1ZWA5_7_5nh6TOJ
 abhkPnsrh8n7XDFps7ZBJUCN6pmOFc5CuPK.nwd6Hu9T4Guib00LJEoG9_89LSkAtuG8jSWr_hJP
 zxWLIPd3TQQ4_yB7AAupQU..0RtutdKntYm8LfAvGfz0RzCnFqsFS.Fw2ml9PAG.nvHX8bb1SQpK
 fnpXtMDGdZDk_lvJJIY8StHIvsHRkqxucR8fGxExZ.KvTweXOfT71dQk_Nj3Jq76WDLxEM77RVTW
 .BlUFRk_PnFUd2LBDl9Dg71dG4.ajs.ZsHD9Wi5kEw1.FVSI21NbPshMYk7cSbkf4Gy5rUKUh2WU
 9d6OgFkjC0dymkb0.SelyIeBCwWVfveYGHPe._NGLOjvh1slDZ6OdVxCO8Rz.8niGh0JEnoLwMLS
 MStRiLctq7fbkU9UlSrvoHB4rKJPfC0X.h_eVSzdycuKMeQ9OY6gn_e_mp2jRkpahKJM_nlTUuJy
 vOSUAFXYXxI1BB8B2po4T8.jI1ta0kIHMWX0_VvxHVD9CsgySX2Ko9F55THd5dWAw3rc_GsNOQzP
 0e9FxKB8H.9hNijb3upz6zMjxSirkc4rMG9V0zGoPhHtMwWODMU5v5XbjjYoP8sq5_aalv_wwN_Y
 vBI2h.Q3TbloghTSJN22cxRzCLISnjfjO1LJOC4crPGtUK8AWlUqmzhvGGGZsEe9W2jXocmzypfP
 I8v7XbXCMDJv1MDrTSxa38VKw0MuCkfl6gZT.uliGk1r.938slxxRF3h2J8KvvgVp3bJGdNxPETR
 l30cV2EdFP5ijfIglIbja7_wjZK_scBAgEmlt.9AKbKWK6869itY_Ua8OxbeIFugHOBxL8aq9Ust
 _Hqog_XCukEAyFRiXTLwRJvoLfVXviGH2BjdnS0xDuhv_rDpv3Q2v9ofCo398rjnahFvEdupx07n
 LmHIrSLLidE1IO87PbUYqMSdXe_xihVSCMNuHRFMejyzGx_yC__0G4YAE51y7N8etTGOnueYUNXd
 Ys_l_CR8b0nI726YFK6RO874k26w93hfd..RNlz4gm8yLuZQ3RphF8oyvRO66IUK1Xbr305eJ8bH
 wh7nQ7R6TfU7Yjx2zu6asS3gRXP5Cl2X19MGri1QuewsEiRBcIO.r2IOP_ksnvvf23wJwzppAS59
 qFbBvYYyl9w6XX31fMus1rjPjB51puHdNK90tHGPMTUBxq1OhHwPsn7jS85wh9LP2YoMCx_Hr1qQ
 _Us95VW0Cs95B5CJCE3Z1t.DWcYaRnyBF4ZS70.Y-
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Sun, 2 May 2021 16:03:06 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: TMC <tmciolek@gmail.com>, Pierre-Philipp Braun <pbraun@nethence.com>
Cc: Xen-users <xen-users@lists.xenproject.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1494482817.1685841.1619971386483@mail.yahoo.com>
In-Reply-To: <88f93c4d-5e77-20db-e907-65d2e0fc7d25@nethence.com>
References: <314217522.1538685.1619859473008.ref@mail.yahoo.com> <314217522.1538685.1619859473008@mail.yahoo.com> <CAA3FNtPpz=4dwymk3+YeB+ZCOYYo9TirFqdjrf+qgSL39mBWYw@mail.gmail.com> <795375038.1654154.1619945620880@mail.yahoo.com> <88f93c4d-5e77-20db-e907-65d2e0fc7d25@nethence.com>
Subject: Re: Xen and Microservices.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.18138 YMailNorrin Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36

Thanks.
Thus, Unikernel is something like Microservice? Any success?






On Sunday, May 2, 2021, 04:15:01 PM GMT+4:30, Pierre-Philipp Braun <pbraun@=
nethence.com> wrote:=20





On 02/05/2021 11:53, Jason Long wrote:

> Thank you.
> How about Unikernel?


Unikernel is - in short - an attempt to even more isolate an application=20
and its libraries (and bind them together in a single binary).=C2=A0 Howeve=
r=20
it's pretty hard to setup and prepare, and therefore didn't gain massive=20
adoption.

I don't know if a XEN Unikernel such as MirageOS or Rump would construct=20
it can provide even better performance than OS-level virtualization, but=20
I suppose it was part of the goal.

--=20
Pierre-Philipp Braun
SMTP Health Campaign: enforce STARTTLS and verify MX certificates
<https://nethence.com/smtp/
>


