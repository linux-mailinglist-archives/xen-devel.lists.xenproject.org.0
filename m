Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C753C3AD8
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jul 2021 08:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154176.284908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2Si7-0004z1-CI; Sun, 11 Jul 2021 06:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154176.284908; Sun, 11 Jul 2021 06:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2Si7-0004wP-7v; Sun, 11 Jul 2021 06:13:03 +0000
Received: by outflank-mailman (input) for mailman id 154176;
 Sun, 11 Jul 2021 06:13:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnat=MD=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1m2Si5-0004wI-Kv
 for xen-devel@lists.xenproject.org; Sun, 11 Jul 2021 06:13:02 +0000
Received: from sonic304-56.consmr.mail.bf2.yahoo.com (unknown [74.6.128.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b40ba66-e20f-11eb-86a8-12813bfff9fa;
 Sun, 11 Jul 2021 06:13:00 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.bf2.yahoo.com with HTTP; Sun, 11 Jul 2021 06:13:00 +0000
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
X-Inumbo-ID: 0b40ba66-e20f-11eb-86a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1625983980; bh=Ebu+7k3DOYvgHrN5J0mdaoSnTJwRXFP5Yza6Nr1wo3Y=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=BJy3zgqoOtYcfdVCwrRF0Lri0J6SBLxgRdfM/2Cm2GAaKQIroHAeH9N67dvZG/4XT3gs/keAT3N0VAeaas0Bt6JIRkNI7V/SSuVgnd67OTRCXB50ffYv9jo7BL4g97bsHu/+LjiAonsrUocw9cJDHbpwQEtTewpq9xHUqqpF4M6n+/f8X6BfCHYjPyzmbZhw4lYXhlICmfVsCinfp5iV1cyMidh2P+5p892HsAbW51UDdCPFgRlYm0OOuDBkXrS9JvcX4p9chXY7qAW24ChW1GT5kkc4AwPmjjkj2N9nFXTbJRiZxC2IjBL4rVe8edRgAxRgDYZG4JNZ3zGPjLh+5w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1625983980; bh=EkOTeg9AtopRfvrXIlB6/JRvjb4YAKkldL9WVps2yiw=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=fVV4V9ID/yNaODb1/o9AHRa6PhgcaOEgbs1d0qPYzQ8Jl7jRCZMMNAy3TX0i+y8Uw3jw3wOC9VlLxw2txDB24hZAbQ4ounBca/kYPKp3LnfYuvjybXrIsfh9VNI+JMvJAKmBh7FI76VWxVO8KVCOVmNigeGAu5eRd1Va7PM+mDo0bjoe0ha6q+dLuEXgkM5L/p3dCyOF1isSLbNY8WkzrOTFOxUD5BUnrxuU8/KFHKKCxt15Y0WQu6JguPqUWSdFEH5LHWbEcYVc3eN2gKI9gWokaz/hP90sxfzEopSghI7OH+A1I2+6rohTVWMwHVkPH8sFHE0ZGlmtCvc44gE1rw==
X-YMail-OSG: dZc48S4VM1nYFb.1L1YL9vXl90M5Ho5Kv4lTfesHJsQndeLdELOAZmBG9uPTC3G
 17lmKm0AYP4_i.Acf8e0mjx.S58GYLukAH5ReMfvQErKvK85dqICFYbsJAdGwyE20Rz7xmTp9iTT
 LjLgJiLWMhxHGAejl37pnGl9.RqeoPMuoAwKD3HoT1JFm_wvHar9m.KpO9JvjKD4eY1UMLkWQavk
 2B73r.hWMcq9IOgFndKEsQMn20D2A8_xJIN3_DGb_bTdgFio0jaJRRhk5lfiLuzK7V3nC7vPDrMT
 KjxpHuDlO6wOJx3iaMJg_m2vI2VNE1ZBqTG4Sxr86SYe1WBTlfoo3dfem8TLSmRTzwfcgVzxK6AJ
 E7bWZhnJy8YF34QP8uo2FLv4QlB80IyDga1nGX47C6O9wGRLWT9N2wI4zM.Ip35dBBHSdgsyoXoa
 k0z2r00BaOV2wPlAz8T_VfhynD3JiyQoY6jEeYf7W_GJycRfWnuu3F32sqrbzROvAjT7Nk15UbLG
 JPFMr04o2psn1IyjTs2tmnb_2tjhM490uZNMY08cdGnSY0hSqxuiVkjI_sAGmyxghd.v1oyiYQXG
 ZK9pFz0JQepSexOMbOXKiAAnPkj5O2ocpK5MM.l_DH75GCw4UobkFbvAaCWqY4yFIl1ydFXvWE3u
 UlA0GNa5dCl9kuSTparpLCbHXDYutFT6eL12a7TRR2u5OTzdsusc6b49zsPJfFlsvkuyKjjQdI5U
 2ylc1oo9nuO.vNOCyvD7Vwg.hk02P_xW_pQaStijPPlRPjXO_AE2uvFZHNQxZRltt7Os39LdfZqC
 35GjkJfQCew_ywPLRswEuM6VD0uptjMZ7B3tAE.zlZ4j2pf5tNwLdSPOgvYTffgwAdZtp1ROPoWr
 SwBEvyYdssWrsvCCUw8XKOFzC82w3xwIaJq2sKBai1XTpi_J8jI0vqUhKs99xJTqTAlTJf8Pki6n
 xcGLeWbHXe5g3r1l7NYXAyWK4Eu_y6MVRz59Tz32XFid7.B4fDybb9iFbOL2nkmCFlb1ymMK5WyP
 McW00vJql_u4bsofgks9agGa_6KBg_TK9JVl7VhtDDb.0Sx8tV5tUWpTHPhmJ.cmMLdEm.bA8773
 qmcL_Nf_CO0FJOwdn2SI1zz78ZJjCLHNWtFedH_2pF_T50tYAeuE0jkYfO2GpRj9jKfHgHcmA9Aa
 hphcTmU5R6aptprcGCjNzFHzykZZ.gMQjvNf5u2tRagCm3o_.w1P9lcjHqrrjebi9DbU9uR5kuU6
 qxJQJiou83WbTE_eMkx39IVHp10zDsOhLIcu0zl4YcBgufzIR2ksixVyaskVsfd2Kgk9YokOD3vW
 Zeh4LBqZskvk14MEVkhkbFKdxMtgAXElXZegKOsYTcl_kU4K_hYVy.arw5alCHevsYPjJnXjP71u
 wAVfdIQMCQQK25j5VbrTKnk6mSyBxNQ0m7A836LhzFh8U_4xMdzuq83Kkw45yTdlFjkBcsC6S2ZD
 TS7IfHuZ1DSdH4OhT9ONdGOdnC12nrvRBN4lw_bvrmvCRv.PPhJoiy03wCB7REWDBoMwNvnL6kMr
 NPLU3EvGOvxRZTKLGllCjftz5XtGlsVqsY69vFLdZfQrzWKmWuWXPgbA9AxWyFd7z0vLiv3K3QGu
 wAA2USebx3Pd302wQv_2dFF9kV1CA7NUy9MHXA96NWapez2iOZOhkr4l562x5lTLPTDhR4ry0Bum
 716vIq7lP.FP2GhS.2v.21gdNKdThlgUk1DBlBWQL5ElHc82MmQiomGseIViwcwM0hmnwhj2zm4L
 _6.2yWhKZkML3t3h56PhvMWdTGvFXHDahgAcYbnHjqCbyHP2JEGthULeSUeRVjrBvJh6FyeaesQ0
 q77xiok4JfowcOe5yV4Z2WVN90p3sT2padqAUlLzGcHi.TpiElX7tkuTb2lN7j8AcznRQ2Y3M145
 2GkFOz98uHrTDyUafDx.egqpZhtQUjqOCsTqLJjFgBf1Eocrb9MTcZuWOBJq.qTLx2Hoa1Db.sQq
 uXxOPYInhel2rzXR00XwBKvbsLXRe2OXMD9Cdw._IrOKp8gX8qsPSrjJKX9cGbB9J.CPNwihz9Co
 uWirZE6ZCc7yIfAS.gly7Mjvpv40dmSiwcRTby0hAEvcLUaxTuQj91a9_Yu_eHiMGjF71KbYl2bw
 wfw6mpgkZjl8ksiP.zOOFj.xRXwYHYbnmP7HiiWG0OEQw_lPnzOTwwDq2d7ezqSfadVTfV1e_ORn
 MOTF4K_93wqnM96H3v96lmMBHc_cLSb25aPrFIhmjb.2WEw5fhiIVuJqEBIy26IHvzlZXFpSNPPb
 AwQm97WrurszhTwTzJ_ibzFTJqwPHolUkOUd_p.CHiOVc8E.UVMKn5vkol3s3QcTBQVUay9qWcF6
 U.gJMonWEUFq2RuXCCHw5Z7t0mhCXU1ON
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Sun, 11 Jul 2021 06:12:56 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <965827691.2911401.1625983976625@mail.yahoo.com>
Subject: Why not a Xen forum on LF website?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <965827691.2911401.1625983976625.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18469 YMailNorrin

Hello,
Why Linux Foundation has a KVM forum, but not a Xen forum?


Thanks.

