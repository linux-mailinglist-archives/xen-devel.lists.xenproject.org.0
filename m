Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D22E727B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 18:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60006.105226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuINk-000280-0Z; Tue, 29 Dec 2020 17:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60006.105226; Tue, 29 Dec 2020 17:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuINj-00027b-TG; Tue, 29 Dec 2020 17:01:59 +0000
Received: by outflank-mailman (input) for mailman id 60006;
 Tue, 29 Dec 2020 17:01:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bt9L=GB=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1kuINi-00027V-6Q
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 17:01:58 +0000
Received: from sonic313-9.consmr.mail.ne1.yahoo.com (unknown [66.163.185.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2d6fdb3-46a6-4a0f-8640-3aae9b7d218e;
 Tue, 29 Dec 2020 17:01:57 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ne1.yahoo.com with HTTP; Tue, 29 Dec 2020 17:01:56 +0000
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
X-Inumbo-ID: d2d6fdb3-46a6-4a0f-8640-3aae9b7d218e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1609261316; bh=exRtBokWMsHottEOxPo112Ftw2gynbBwQ5NXt66ZqtA=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=VBA0WnpfeVEPs/hcGsHE7O05F0EURI7kvadhGqpOAiREOqDoAENYvhRCoYMcFriO+00EKf2GjoKd9VLLwnEiAcb8ijcTAvNJaecKK2YPNW3o0gUc8njTUWxPbaqnplqkJM8rLtw6rVcJDB+jElS4k4fvcUZn/Z24mf6t13y4KaVD0AWNgySYSXpWs8LXXrEnOzaqgUBuR/fHEZ+i7EbZzJCiTKccu+R30606ondUr24RooiR7uIBIdq2hkNUFzXzUgugFejIOmPufwp+T49g09lCPzJEEtTMIVyfrL2pHiJ/qqzDEreE1OH5OPmRqwHNbCu60MeZRKmi7xxKCJbg9g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1609261316; bh=qUjWzBk20sRw1S293s1KNycQ2SqIlNSwgIPFvgUEg4E=; h=Date:From:To:Subject:From:Subject; b=ZYQ9LcFAVt8fvvSs3bPLmH+oZUDCFhOIxj1l5YORDRIlZk2wzogv9d/jJUgkdJlC8Q4pb3KkbCWRHUjftlDFaSDMEo/HVOsuKuq34PgYkv5/VbD91EtFxiPo96dZjlX5doTDNAw4mtI5x6HSFgx/wlGz/8z8fFpJ/JMwlWE6SwNcNaXf81vJfzy3wiJtFckWv56X2BX7K5KIdokRZ6HzKpzmLuR+x5vNfNrrg7nAC0Chnsm7iiwDqHjAvZaj/WNVES6v9P+SZRPtMdjXTH57zjFhpmjFyDeJvL8bqq/Ciuy9Fmmf8sAZG26hK7/HIrvMMHp0FGGYUmfgQH546W61ew==
X-YMail-OSG: 5FOX.0YVM1kt8BycoM1j5egYS_x9PhVwnV0rflbv7ti_w4kAf7YcbmFbe08_yQJ
 ltbHdW9DKq5XqJ32HB3_9EqS6t9dvvaPwT3ONgWsLvXpRdZ_eNqwSkkVeuVXkztpFwwdiTEjyeHp
 YhtOmabrnRFsLZbQegwQBeECvElwnUrjfnuofzR0CAXLZM89SSQ0O2d2Rc.HMJB9MpV6tAmNdxmF
 8dEW5iHJim6rIZdbQMZGyD1aAamjKseiWVmwS8QnXkzX9u3QRylfXxPN0EYzEsQuxb6QP6l3Ga8O
 BUSMztkbmCIy2nOxo7ZzOYigeWnZEnTu035ptAvmZ60_r7hT84wfpeR2O_lx9mGVTOCmPDXUPQSi
 RlxgPMRQVtIQyRcBXzr93y.wHjNav_0weNBH.z_JJ1BjLGXjFwq_EThWh60kIX1tFwGkVDuwZg5L
 ROf8mZ3FRi8oFSkkNwcBS8ZL8sOGGkUgujw.I1GM44cjZvKLlYCZegFaCKgI_8_0AASFBrGfZzT5
 Qzoh7TjQaWTV5QBQe8ZYGagNiW0wxVdFWpfchnBxaJZ6nV0wXS_oG.thsImLYISrwibKhtqXq3h1
 xnaTzLo7XIWBe756BbXuEj.lgHc3CoLkS7QBpIaran43NMFgDpAQWVPW7uIX6uSd0krIegWqhOCf
 tSRiIgANsJNG6QMXjwxsQzZddMEzwDjNKOFqkdgTJdjQP5t_qaw_No0zhpQbdEw03Nap_gqYYahc
 QARWdMkspGNQ7p_GVsYdNDb40xQGApdwSHQM.15sPPl2ZNDWAiU1FImA.hzkr2nredacwsKrSmuE
 rN0dptSdLq3fT8DQbU.ydP0zX.D_t2qOSFU4MXQ9FL21wnYGFOC_6G9jDaE9xb66MkE8icXw.UiW
 gbbecwyHNie7a_ji_UadnCBWYar_8bWrzKv3UjveeF_P4sYF1ML4iLODaFlNqGpvr8TAVSNj9pkN
 JEWw4CtMlD_MMKPqtK4wxIy8apmLwo6J8GiWAKQsrEfTVni6tyohxkO71QpgKbHenNK4l_1jmmUJ
 954GeQeqPpCi.xvdBdQ4sXhqY6tkKiHZNU6TSWsoPOUUd0QEh2hjFv7bdr2M3GfKzG9vepRIYtbx
 teAw5RgqAEGxUWpme_KD_18xa0ViDE4UCnWXsVeCbpQuUUR1SA4vt.ewr.ColbVbCDZrGpXp39JA
 s0RIYvmpRnMqeiE94SBvzD2onzI6uBXvMqsGUZeO7_kdgSkH9d8kBwE8DdBTGgLgl5axBVDNj4Qe
 uZ81a2Z289kioc3gMsKuS00HvXzK_KFo1.KL22UMkQpQK.xR0rTUSU9D37_TBntcdr6nEGeXIoJ6
 3Fu9LATxD9xFfDNoJVbcPzPkURcNkL46HPDCYTYwj6U2ohCwg4_eIWUMgB2zZsCclaVyI2iXhqZB
 zIDrRHZSi4AoWf8Cv1jf4NXT0PRQSOTOQG0YLUpqKh2kpmnQipa2UH7EH9QqkUOr3df1_zg6Geeq
 _ghJoQQn9zob95SwBExmO_4yrHxMLoVYRqk9BeHSnwvr44XI99XKtoFgQP8hE8053JN7roQv7mNM
 gdE2JiemIMmA7EPqRUjXONCqGXbpIwLWguWiUcgYjhcfqZOv8S_OdfJDmnRAXElPjndkd.pLQpPd
 hI09zUXR.OKg3MUbHXCLGwpCrSsktBXwp9WxpS6bJ8fd75WUPwpxOe4h1CqFQ_yt9aHyflI0ykuh
 X2okXW57C6SQWoX1tXkf0KuDzu6VST94QM.jLMJLpRnSrS.ufk6y0eElshKOR2h1um3G2V8c4cX8
 YpjBLRpb2wFv62lB0ntfCivvIgr3tfxBW1IVeO.fkKvTLFjXJ8a8cNLxuvTKVkJI6xCKdFM7fB4d
 9KuDaB0ibsdlSjyLjVWEWaS2SBSTssNoYCeQD5dKEBFapBDnaDcG9.98uJIc7RPf_65zdCqc5TR9
 8gm9dDy3lQxvps9xBBBu_sH.RKgnRsH_9XUeGbQ46bobhDY5Ap2UttKQbsVqtfPNUUuxRbBA7w5u
 C3WnZXdIUDFXfoSy.gX8Jd8jEkv8yRryi0pAz8Q6PMro1w7WQWaDvB7BdfdVvuTK2mHUlJ2Kjl0z
 wUoA1naupCokZKOZClqoxKSGbk3eqd0FOYolc3p.I2e8.hDfb8eZ2LAX2aQiLA6o44FsE89ntiZb
 MRJvE.qLZg8ziIsHlMyWpv8Rt8JqoH5nLISH0EuypSpX8tZe1bXLL1pRL.K9VGqGGS_gAjGXZ1z2
 _0EUT89DX7G6kV8qLfKhTNuf6c9xzr24TgMDPNBB79yk__KvmVDsvYjYGioPKGksuXJXARQ8b0gz
 W1u0K98wfgQmfiXXG3K18zaQdrHP9Ky6GpuLgAmINf9Mp_zvRXhbmobVsKgwenTlClFZJgXUbOLY
 KVfcdVJPsKuChsY3kGKtoNOh01deKDRmLapUeUaKJuMdIGEZmDe5yZKfX645dH23Va35X8MJatOL
 l5NmWnemH7Bh4OcibYm2S6dIL.g--
Date: Tue, 29 Dec 2020 17:01:50 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <88957249.5342211.1609261310806@mail.yahoo.com>
In-Reply-To: <20201229081943.ifaiwrqyj5ojwufn@Air-de-Roger>
References: <943136031.5051796.1609179068383.ref@mail.yahoo.com> <943136031.5051796.1609179068383@mail.yahoo.com> <20201229081943.ifaiwrqyj5ojwufn@Air-de-Roger>
Subject: Re: PVH mode PCI passthrough status
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.17278 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0

Hi Roger,

> I think you meant PVH mode in the sentence above instead of PVM?

Sorry, that was a typo. I meant PVH.

> Arm folks are working on using vPCI for domUs, which could easily be picked up by x86 once ready. There's also the option to import xenpt [0] from Paul Durrant and use it with PVH, but it will likely require some work.

Thanks for your response. Do you have any timeline in mind on when support for x86 will be available? A rough estimate would help me with planning something.

Thanks,
Mehrab


