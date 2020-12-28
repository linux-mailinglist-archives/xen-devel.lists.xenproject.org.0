Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE672E69F5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 19:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59560.104557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwza-0003iS-W5; Mon, 28 Dec 2020 18:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59560.104557; Mon, 28 Dec 2020 18:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwza-0003i3-Su; Mon, 28 Dec 2020 18:11:38 +0000
Received: by outflank-mailman (input) for mailman id 59560;
 Mon, 28 Dec 2020 18:11:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po3/=GA=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1ktwzZ-0003hw-Rk
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 18:11:37 +0000
Received: from sonic315-20.consmr.mail.ne1.yahoo.com (unknown [66.163.190.146])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec7ab366-7289-4d03-b204-dda487f7f00f;
 Mon, 28 Dec 2020 18:11:37 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Mon, 28 Dec 2020 18:11:36 +0000
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
X-Inumbo-ID: ec7ab366-7289-4d03-b204-dda487f7f00f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1609179096; bh=WP98efsM6H8bg7zFkKRHilzfsV0c9NVgFjLAel6r56A=; h=Date:From:To:Subject:References:From:Subject; b=FyFPpKutEzf6F8qAEZ+ULyvC2azcLPvhUZX3nCSNVyuehuQ3Zk1BLFUp05rCA4zZWrro8be3wBEa5OH1EgqvecoNik1l985kRaO14uIP+/A1wsTcfgvrjIj6u9lmx/B0KFTOEF0Xb7DOSCekmy4eAxicojdNuv8fVCBTAsjsair28KFtDB+HAGRwkLw6+VOthDWk4arh3oOeN+2JOEsAM+3H3KpFPYSe2FA16fGWaVu1YURbkYFt8Bbgf/T2grJwzwGwykO15EHqADsbuJNf0eOZ2gap0uoIzH7yS8JMf1XYOFUVUatNcsk0y+I6/dwcDtTAXZPk+FDbDE0OjfcPYw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1609179096; bh=K8lIQrUBVwP9f85FbQQJNWle0cvPmBQBjueJVoES0iG=; h=Date:From:To:Subject:From:Subject; b=qisNkQtdz440F+g0xYvOsydPyBZhlZclqvttIfxhfdUS38rwkPBBebqb2t5eGT2XHAcbcjP8aH7ihKXuQ0GC/oeQ0ONvYi8mJnGKwvvSDAesXx7QSsACYvOXydsBpLurWDzoATvAr+swmr/VABGXxPaSh0gL7b1mKOBIN2bt8AVPcXtTUxWaCOkgxkYO/F92AyPKS07rh9ifq0fHU7S1SQUEqrVbPfoXBVmPW5JHY+yfUL5vSR6EKQctm78m6BxK6KT5FnaI8lk1yH29Uygrwek3gZuPTcxU4iH1zjlc6PFiD6nuR+hN3VNcFKUAz8kr39Qc9FAgyb6x1+mWxR2tNA==
X-YMail-OSG: oWcB6zIVM1naWPxnX0lXmfzZ7ygwvXFiB7nCQQ4NIU09R_0VKkM7S.3zibP4uHH
 E4oDcjd58GiE2FrgAGCzS_e3UAmaftrCKZ0GfuGP5hAPXpv32ypNqF1Uxw4o7AFXifhSUdT5zZxk
 3bRCEf0AfGzrdkgbgLns56W4GPm0gvpMtNRqHwMG7QutOlL.6Emn.4BHwufb_f6JmEYxJ6QoAeCG
 JlaQSl2DS9FWjFdA5g9y12JTpGy.GU2kZG93uxoPFfxJTJJKmMJEhwiWbbjdCnZANfPdJIyhzswj
 K4oyT7JoXvRbiFsi04kgoBwyiDRbMcDlF8sCgQ5sNe79IHPrSe7t9YKwFnwtA4z6nMKDUPDR35jz
 WRFKPADLpCAqS_jSSDm.OBlE_nKNliQA3iGajDsbv5U02gkdOV4LU.brm1DHtTt2hNZSvnmFvt4s
 fR_LfMtm.DouMB9fo0F_xg8.UqOplFf8ZYWsdBsFEqMpbOTj4Hk7g_dkmG6zeP__j_8PmbboOWtN
 Oml9KrPO4j1ztY0A4DZvMMgPBZxFWMXka6LrwZMMc11TcYEIarvkrtUqkX2F3PiCfZgFamEPL710
 RZETsH0p_dJ8Nw0CNVf_MzZb3Dnd7RokwAMXQNQMcGSEyZRyjhYpdO6JVvz3sgkiyJAlSlzSXz07
 T8B4pI0TswgBlmHALaf61PfFm7Uao6ZgQkEsyqvaGMAUgDzDVKFDp2bw4F5GJKublyz31s1GpZs9
 pvCL93F5n3LOCpoBZ17Bs_Jt5MIy3EKC4UTiWkZKtAqjdEX.SOEfLa3vt8I7OeEkWZaTCazOSw37
 GTGiL2NHLcyTYT43QeEIQgfyUPy9GaejPKKvzpSKOaj_CEXOIRX3uraARwgA6vt8xG7XAIyqh2U3
 E7oBLLIeG7acpaGaiyr9Kslm0wuxKhBFkTwGW0K_8zQ7eGDMJY8NBr51Ekvn7rnxBk_yc0fDgv.0
 bTIAbVXqUX70.oUYTsd6MWqkFVp6_aRxioA6bpMSWvUpqdcZ2tF8sOja_4_bhSvjXBOLD.OVYN.K
 Sn_kuX9Gzrbeqs3jIMUr2H0GF86MBVXptLEydu_R_FOIqLoRdpG8zAJpioWMuFZmCoXoGzMmFzbq
 .T8RwiXzMENHhY.KAQUWDMUrqV11FXp1Ig16.cxUY5Y42nUKcimXTNdVr4ZUrPHO6Zn30dTJW1It
 N3mFs9clNCZWmnNWS2t8slnUellXnJD2BPbzy_PsoP_cIXx8Y6e6GvGi34HLsb5CFQTQqJ.YQ0OW
 800ABVH6sLKTG9w9RRGSwMaDpKphn4qqtl0afNxcaYwsRP59gn1HkJeS.PCiI8Hwm509FI.tatzi
 By3inpthiz3Br910uBy7tAaxszEoCQVKhefl_zDgMXjEain2SUwsIB71Fl11TaLBO2B_sa2RKJdl
 nqFi7oybv4Ex0su5OK_s8ynuOENOpZvCQkjmRR1oP82uJjHUD18iWXOUQ7fxrot2CN66KXWPx8z7
 b67xxpsbacU10J.OdiAFbT2Uhq.dVQ.KDhEBvmfcWttDoYs5.uosTBgjrsobMSbIMYNq4Z_rtfuY
 hFHpIw3YAXlQpPaq6erQtvJhewXPtYHCLfVlrZF3LT7BGdr7rkWDFmh2Wov1YVMIZmvqZDC2Uwpv
 dI4jSK88pN3SBF6kR2wTxqPJXLo0iPkBDKiN2IfE7SaT5j53.Y8Rw32s8lqFcobfjoHr2dYvq26g
 NOgoyWS85WG4gna0XQhxY7XAIEItjlpETupR1UvdGyxUYJ1cSXkLndkCUsYooqiCswNpYPAq.gV4
 BcaRRkrfpVXmNC8POIS1XTtZJOPhVLnjoVaq1rN5Q5LxzdNzaBrJ.8jrKBZRQqTJe.I6JRaq3cKb
 86xfKi6kEBaIhpAnnvlTAssaI3wtyYuoikouS8gZJCrHb55CXFfs2bhN1WkEfUzQf6eYw0y6Gq4y
 geAZPkF9ml7So05Wf8VZsbjx5860.P8ziH5l4VF.3XHMNYXVIRj6e2N83YCBN3yKfr6yYALF1pOq
 jvZ.ldqA_shjdxzK2AK3EBNRUGx8S6FbfwJxqehgwRQdYrJ2.13Zhcjo4O8ccir4TcuNG12UAlrV
 haIRFGISX1BdiBWhvH24z.ouesdDqb9za2_6Vv6F_ctG8XuJcrTPM1RwAFiB1ENrWrjOyook3D38
 pX.VZ0O2K7lI9x0AD47vLY4Me_09q_d7Wlh1EnFUekGIzjEp5izEtmfW2WNLxkVIxlZOYPGOWhys
 ttTnckSJakY151C9qq0GRthf1ZXymoNBpEGY554fAUNVqI4kTVSqS_liCdri_OVle0tY2P6Np4en
 EDZQmIpdNX8uVpw2Zq23795NH1u0yUOHLdc9xu4OjYeN9C_J61APJecU1kGYwyMHkXZkuGgO0OjW
 JWdY3MnK.
Date: Mon, 28 Dec 2020 18:11:08 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <943136031.5051796.1609179068383@mail.yahoo.com>
Subject: PVH mode PCI passthrough status
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <943136031.5051796.1609179068383.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17278 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0

Hi,

As of Xen 4.10, PCI passthrough support was not available in PVH mode. I was wondering if the PCI passthrough support was added in a later version.

It would be great to know the latest status of the PCI passthrough support for the Xen PVM mode. Please let me know if you have any updates on this.

 Thanks,
Mehrab

