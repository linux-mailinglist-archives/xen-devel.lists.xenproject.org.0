Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6159B21F
	for <lists+xen-devel@lfdr.de>; Sun, 21 Aug 2022 07:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390928.628567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPdcm-0001Zw-O2; Sun, 21 Aug 2022 05:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390928.628567; Sun, 21 Aug 2022 05:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPdcm-0001Xb-Kl; Sun, 21 Aug 2022 05:35:52 +0000
Received: by outflank-mailman (input) for mailman id 390928;
 Sun, 21 Aug 2022 05:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Cr7=YZ=yahoo.com=hack3rcon@srs-se1.protection.inumbo.net>)
 id 1oPdcl-0001XS-93
 for xen-devel@lists.xenproject.org; Sun, 21 Aug 2022 05:35:51 +0000
Received: from sonic305-1.consmr.mail.bf2.yahoo.com
 (sonic305-1.consmr.mail.bf2.yahoo.com [74.6.133.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bf4dae7-2113-11ed-9250-1f966e50362f;
 Sun, 21 Aug 2022 07:35:49 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.bf2.yahoo.com with HTTP; Sun, 21 Aug 2022 05:35:47 +0000
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
X-Inumbo-ID: 1bf4dae7-2113-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1661060147; bh=rjs5ScbnXtXKjq1fkxfFc67hvfT2QxbO+/jQqXPheyU=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=QTIksUxwNVmwzpUMjTpWdkAaiKMRCUF+wklePz+DA5nR1wsjzbZhzsitM4uij2Ea+IHJVMgv8Yhe7/3J9VfokirkPJXSil1FpOkwhA4DxAlr9//tz46HYiqWzq9FR/UK2NwRriGcOq2nQguxPzrxOlLT9k1rGFuc9yUE/dbkWMBhbxjCyLNzpz8gx7lKJSg6DT6n42Vyb+0BOgatlryypQ4JL+kgqaGPDuVeQmvHsRxBhYfHncirb6E8Vq6lXYYKtFOQAP0a19+lCjpKoKV2N+qbSbNTZfS60YVBwUXNseGllVX7+QzvLpJU6Y3nX0F6NJ9qO/IkcQK5K9wIdQvZEQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1661060147; bh=dqhIcaAm701SoXbIs4JB9VDs6KagFzT5bhCga1/4r59=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=DbbNDSByfV/WU07pqGGSPYa/iHxm6BXR6wUXApNqlBbLGuMJq3isfuQy5RQ9mo+wj3DHXAkUyVhNB2IDnOpOHEWIqW6AdJJecwQFSjx5yFHjqeaOldxsNyHDZwdvVfyVB6sqNjtLrJBxX2CIyp1NfRPqpqCvVDruOZGt+LDfcBbrdqkdtwifoENfhhB518Gy/2rTW8WV4GAK/nbzcObkWracJOFLvyPqa/9D/X3r0vp7ET4P+eqbkgSmVhoxoJUsW2i1xiDNOBK598O2hJNfU1XNzVRwQB7GYLlQ9e/A8m4J3qPPMVrI8UxnCIr0MwsaZeMemdQf/86KTlheGK7acA==
X-YMail-OSG: f.w1pwkVM1l65x0jNy_78vtlARSnKaXLXOBu5RFLc5JiUdOIiLZHSgqaL3WDdm8
 2P99ceocflIIkHNXgR5jsN6sdURwWrrLypfR6Z3h1iGXmSnNkYudtOQPjoKEftF0YmEyLWeJ2cyI
 Z_mmXpi_RgrhuNpbTRadVnUXMBsoVAla8j2D4sEm9ecGdyqYZ624qbOydJYxWYAopy505eBji23Z
 CB_zWa6TP6WyD6fAQCGbNXAEs2SiXA7rsR_MkEiDFz6LBdfIran2YCtUih9mLmqpirQWAGHkJA5a
 iGDr48oNkUbbhXTMIYxtdBr1VLa8d5v2s0KFrzO.VGk4uRfMQx2nbs2Qo7XLMM6pgZygSvcHCSdh
 Wl0aftiGechA5WSOXdE7UZYvNJIbKzUvrT8_X_ml3RlW2AVxlHMKBNoBxNsiW7KdCUHDAuPm6qkQ
 gN1Mv4McUXkVxzRCAKGpIBie7r50sn9euFq0tLW7oquAlbqNXu9fqpbkzDjLRCE.qPOdlXSlbwZl
 sqfbM5GgO2HdRaU8VagFJDv7A4l.yjviO6gf01uRcOlMK.RWTy5aqTU4NpeV5mngg0iLJwJXGwwQ
 mO5SzTAGIH3t025_kPrUCYit1OWZBsUobGhEXliAjoQNYu_5jy4gBTU9aOa6L9JMII3sTUKTtQX5
 slwoTRv_eCccSCVcGLOY7AVpOnWDTgWCB5iXl5eEOKP1LPI21owFjndg.QqEN1IjgjOwNIKxIYgX
 .eGrVzvHPpll_myAXhPVGqefpzyn8c5ccM5ErRzQD0lNmuLzyYC2bhUoGeABDucwfoxxsjBKIabd
 nhdICz8yDPbh4_4h5mRbCtbWVNOOOTF5aIGZvP3KCA4lJkmLbVgCJlT8sLkJzn58rMqqrMh5TOc4
 NDWBI4qCAXN5IsPVhMePDaEBu_W600lZ0k8jgZG.qpn9yhpDiAPl4blsebswvzB8Oh8lcovjyLcE
 uLiB9WFbLYiJdeWA2TKXkfKAAfoqrxNjyy5dre2S70I4nnmdIG9i0lZ4UaGDRju6hUqPkJties5A
 _vvDBgppIYq2iJpKvOYV3cG2MrRHXujwp8C5TylhgDs_sScxXJAszMCFKc6aONarWk5WvhUx3hsQ
 L.XLE26AuQNLDuCZ1qVoL.2JP9yoPmYr8pKiI4hwsfvci2FDbt8xbm2aWENdGbwkGQtbTlMSxKEM
 B6LhCPgx6P82Z9LtOIsI.PREY_daw0176IZl6Tl31HYlSKIFzAiN6nvTeKfyDaqU70gGv9wfuX.I
 9Z9exJyVvNkRyXH9cPa6e9L3SVXEqmqARv3rrL5amyMs29pim56GD6a1KJlPMYjPWxMeVY5oHnJF
 k1FvTpyQ21sbrPSz__VnlRELmYzzRKeIymjm7rOeIvoWp7Hxut9yDOC.Q1ZYVgNhPzq0eAx_3CsR
 ymyPqTkklM58ttZdhYNIyiKVnRK_UFnq1ADEwlF1wgj3g0LrKtVLzCOf_.LLOIa26BLKlO4MlTjd
 w82kqj4ZsoIMGUSEWGy5nJXXJ0sEQIPSBHWQ5x_Ceyo7XS7iDWjg9ip..sirZlm2MVyehLNiNjiq
 MQQYrcTthRHi0niDrGT6roMg69GV8n40e_gXesrW.21zVlI_r0elSZiWE6k5wAKCZmUguTzbKW6e
 CwhvIGT_PFHoa4tYE4dYFV3oJKZWlob0s5Oyunw4GDs6AMtPn6gnwlvSLygF01pgQrXClAAt2ALS
 hoVjVYGlMqI_KW.Wj1TEKoqP6BJKyIJiDToz8jE9H6SnxM_YkNRFNgXdiDF9PE2s8l6wQzStu1m_
 c87eW_ij0ySvjqUSs.kMUDNK.D5fk.dffoKewjMDyN4L1qABlsH3EYcKljgXSlMa9lAoJoKFO.sK
 doxbJ1Z8AehTDrPgRoCDIbjs0IxSxCGNg9yviRt69wruyHgcJRD2l4T.4wg_XdLkHT1pwYACLO4W
 dknSvn0OuGv04sSYgXxoJaFoiOrLSuJEeFuhbDSJSa9FT3Lb7gBuIcD45jzbG.ODVS97cyUmGvwb
 fQoFD8UPltl_c3y.D_kzsNKtJ4L8HZDmxGL2ixCmhsPRZDOOjrjhsY3K68ThtfVg_r08HKRhS2zl
 TvyCiFtmeg_8xWjKlVWigUpuUUOI8oTnPN077ca9rtUUwOojocB.mx5hGXO_x6WDdz_sfd3SmaZM
 9LrI4FlNM9aVnQEMBCseKRr0PdWcxQzJ4J88lSSb4Zf8Xhg2kaxg-
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Sun, 21 Aug 2022 05:35:42 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1677353127.432967.1661060142000@mail.yahoo.com>
Subject: How to isolate vital part of a host with the Xen Hypervisor?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1677353127.432967.1661060142000.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20560 YMailNorrin

Hello,
Is it possible to install the Xen Hypervisor for just isolate my host OS and disable its Virtualization features (Install guest OS)?


Thank you.

