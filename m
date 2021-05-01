Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3637067F
	for <lists+xen-devel@lfdr.de>; Sat,  1 May 2021 10:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120882.228584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lclRm-0004L4-6L; Sat, 01 May 2021 08:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120882.228584; Sat, 01 May 2021 08:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lclRm-0004Kf-3F; Sat, 01 May 2021 08:57:58 +0000
Received: by outflank-mailman (input) for mailman id 120882;
 Sat, 01 May 2021 08:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4H9e=J4=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1lclRk-0004Ka-Je
 for xen-devel@lists.xenproject.org; Sat, 01 May 2021 08:57:56 +0000
Received: from sonic310-13.consmr.mail.bf2.yahoo.com (unknown [74.6.135.123])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebff1520-ce0c-4805-954e-ff38479c27ea;
 Sat, 01 May 2021 08:57:55 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.bf2.yahoo.com with HTTP; Sat, 1 May 2021 08:57:55 +0000
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
X-Inumbo-ID: ebff1520-ce0c-4805-954e-ff38479c27ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619859475; bh=hB8/+OYW3GYzeXUAIIfvp3g6P8jXaVyUB1WVuSQVAg8=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=odV5r0Vc8/aYAdzYF1K0r33VRcbSW+VpE1WuuQ0Wn1WUD3p5FWqAQQvUqJFFuKh/cjAoar+Uh562CyxsaEsasyyZrLWKHFliqUxPCoqBW2ffdyvTuqKFSZOZhox9CAUgQrxiQmL+wOdzC/VKzR54nr33kgRRmsXMQ1hRHaS7qStQohcY+b2H1/NC7fVhasNMLIJaoSUZehczT3pwA7oXov4llNyjlQTR2IVyLLNYqUEmfk+H7jAokRCrx/6zQ3Pa6piB0pQtS4mTEWFzmo1Xw/GO7QWNz6ed5VadKJfPqEJ11mQAtGNL2GI34lH3RBy+PKNRu9+H+5XPgT+BYnAfgQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619859475; bh=ycSGad6+UX6o5FMG535XVOdcTVf9iraRX2+6dPzXWUi=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=dSK7NlF0RTqtrYePXU5KxG4XfSGhWbwbAl2JBeVn1lTN0IVu/xwMJLA+JleVf34GuhriZqls3/QMWTEkATWfbVJw1gjbsJO6C0dfPYdidy4PwY2yqAk8zt6yl6G9NupyAe0gcVJbHyKrZa1J0pV/xNwQhjct9bAPLjfXiwpH9AhnbaZz3h0u8cBEzp7IV1gK6j03AdwvgZEkBUp15HHbodykSv0oIISMEsw+19+aSwiRK+fbc4xfsz8fdmZAAqKjcqUH5CLrI8CULwXMe9AKDr2srjQnrBiSOGO/99u8XMKt5WFHRtXBMA7Ie4Ec0TnqxLUACuDWngJ8sb95ewnJ6A==
X-YMail-OSG: cCnpzQ4VM1kksk21JPlE0m9gWFAeOwRodL3Vetlj6rBeFl.hK93BmOnkHc5Ej7B
 g8y7ylXS8PpfUf4DhZHf3VApN0ZMOSA_xQhUr1rKOCIXkFFgyF9k02IaBPbRLwSFsg2w8qnN5kb.
 _Uby9haBd4lWBmUvD6i8rtX_DocZnd2gGBYwUxVX8hv2tf1glaVRhN84Gpwn.jVMBP6cspkiHg8t
 qPfYDFDqdZdbwRbuG3B0IyHe_jAW1XuFRxPx6hc4vntQ6KTYVkqx8hHiO6iy5J3SDzxOnfzLhfCT
 kDVnYpCknXOsJXdbAaMZ0rDJO0sRVC5uSpGejLJ1F1nMk9NAHbVx.mPv6he8Tzdnf5x3V1CcLWEV
 fGFChzFAVQiiv7RyZ03RLkYXHCgSWglFVFLBw9QdJfZwMSOfLcBXzCY9XQm0ZZBdW7YTaGNqAQax
 bSEeK4vcjduG9greZyDM5UBMyrTtKz3VyTzeeevgCizzD2jO8I10NT11S39pgA09Kar1SWPGMN2f
 wP_T45Ibn8wdTOBt.d_w0ME0J7kywiBMVfIQn8nMMJlCAjiyqHyB2XwmSbsWhENxa.wMF8pbuwO5
 cO7BiW2fXelct8OBdi3j0XHz3L9WMhDL8ZapR8i7KONtepuy4JwEMuqldjZHftuP1U0q6buxSX7l
 kKsWhlmmPS8VY6yZEIb9RjCotrtrqhlEwhYb2LBoDgodxslD02MwZvt9CMJG7e6ghhNROLKOC.Rz
 pcSAoD5yCmFvXRI7bNntbVkwpY6PqdsnB.QeiWLrDrVTeoFaCcqI1MDbclEqkckS4q1IvBpsrm.c
 2kiuCPP9myRvYQA5xTbTmOaT.Nm6HZDpxPThuiS0xH2boYYi8j27E5_8gYh94dmuLRD3OYx6KP_4
 WWsvCmF57wZ3d5GRkTsClQoafV8bzBobqn_Sq3eE_izIg6nrGMNO6DlNvS2pSSR28nGjgzMYQ3Oc
 kV8F.Jt1Oh5TR6d0DQWU9yLN5ety3NhwdsU09eFhfkN5rphlMsRFeNs0fHSYZC5D91ZpPSF30bSs
 UZuNRDBP5DmS2B_Y3wBiX5oh0Oo8EOd.I3BgDYXLBo6F_Wq8fjMjAjQhaXV1dL1Ldpbgw5e.Tt0H
 XGxmv33JSWmEzoEdoNWshXIvAlNXUR65j7m4F49OdEk_k3AfHSZaEaK9ezQMiyt_n03nJL3mm1kh
 jCb_wyGm5omNZeHutQxGb52BQo2VK0co8SLa_zN9llLWzsMD4VBQPlXeKwbtxY2_3Zr7HRvvxegj
 rC7XFY74CcQkDWTibRerSontl870oJadbez3oGzoq8YFIQlQOdM8GN0Q1SLJTLZUK1cPF9EpDw1F
 KTcwNYlHzcGVpIoRZw48wXJ4f5t60wK72LFN3OEzq.3.sC4Pgs.fj_D1pqW1rtu2XJmyEMSZZydw
 pBp9iu03kCMF3yuaD8y4MHEdXsH3HexV79F0Z9vPCmGW1fKHQCHBTqs6qaJJYxOAYeLM3OC_rXT8
 JGIBmjd.Zr0U3IWCVD0dRkCmOxGK2jpmFY86fEWGgHvM.xLTXohV2TngarISaVOqJh0OPkT2Y5Mo
 .WcR_m3_VDGM5bddNV_w3T13kRxaqYY0i.NYkopNfkJAuxYGKs3TDvVP93VhNrlwoJoBW3Lx.VBK
 ZXI_wevpI625iy31CzUzmDh0wit50G7mJxgqCF2ftWDEoDL8de7LfkyZiPrt7KPIe.zeElPzM950
 H7vuQFU6YUK5CkApD.YjKIVOHZA.wKMSun8p_isbzKv7k2MFvpUOcSlLJWgAdBQT_rhdBpDpdgdb
 vNWzK.RWszqrPAgWpHmhWaTaOEKiu6bFDGvUg7I0.7UktLzKXnJzVvE8ceODiXoD4J4xG1pGt1MW
 LZF0p_fI04filj0.WzhXzzhQPSzAuSi.R_G6Y7zNTf5OumMZrTROhvpuSb9KE9z7NDDbBXKEN.b4
 zbUGUDvJAqhP1U1gQopE3T6SbOXCdWlN5KwaMxtCdIAhmASL_mu_zqfaONGl8n7A.dTh4arI2Amq
 Y5MnT0jJUUDjjG4jWR32rltnOpryVpAQHr1PEkj.SOQQ5tjD5ZaOdeEPeh4ZSASjk.JaBqOL4B3b
 xXyst.S9Uwp2k3QoTBwoF3oWUut7Ans9cjf4tteJykNQnv8Jhp2aU6Ggkn28OcIiRFKGDEsSeCdy
 T3ywiw_lYu9ASd1RdiZCTXMyomvWVor.bu4wnOjplXyLQ0J4JOINj3rAUZcXr.ADigZkFp.2i4wD
 NxKWu8cKRJTVjlqiRP2aUd8s05K5t7yvC2N0uxcTLWwhnJ5VtEdmj7y1OTO._nqAn3AhZw0owXKO
 jhTRDyY9S7sFtnO8f90dUv3C4z2j6iblaVV9MSvrkDkuFGK4BoBB4Lr9EsoNDhSo0oyh76zxgJrK
 W1tzvmO.DCj3r3x8ELYek5.Y4JeNYqiY.WZldVCQEsHx11Ikp9ZMQ6NNnGcld
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Sat, 1 May 2021 08:57:53 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-users <xen-users@lists.xenproject.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <314217522.1538685.1619859473008@mail.yahoo.com>
Subject: Xen and Microservices.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <314217522.1538685.1619859473008.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18138 YMailNorrin Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36

Hello,
Why microservices use containers like Docker and not Hypervisors like Xen?

Thanks.

