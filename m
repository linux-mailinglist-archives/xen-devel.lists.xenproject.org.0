Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141D35342C
	for <lists+xen-devel@lfdr.de>; Sat,  3 Apr 2021 15:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105081.201213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSgSV-0007M4-Q2; Sat, 03 Apr 2021 13:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105081.201213; Sat, 03 Apr 2021 13:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSgSV-0007Kn-L7; Sat, 03 Apr 2021 13:37:03 +0000
Received: by outflank-mailman (input) for mailman id 105081;
 Sat, 03 Apr 2021 13:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6QKX=JA=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1lSgST-0007Ki-Mm
 for xen-devel@lists.xenproject.org; Sat, 03 Apr 2021 13:37:01 +0000
Received: from sonic309-13.consmr.mail.bf2.yahoo.com (unknown [74.6.129.123])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45434e47-8e29-4436-ae62-84019e2fa3ee;
 Sat, 03 Apr 2021 13:37:00 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.bf2.yahoo.com with HTTP; Sat, 3 Apr 2021 13:37:00 +0000
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
X-Inumbo-ID: 45434e47-8e29-4436-ae62-84019e2fa3ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1617457020; bh=frNwGYHqCnadvbec+VrFdhIQ0kNGbh7FuDVaI9wxMLg=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=I2JxQ7lq2ocdLqgw9b/8iR/HU7KoGc5t6uEXT5vXVji2fX44nzl4eAHyvO05LcydQiWYaWM3z6acWTU3htkPzP2/YO+X37cQZFyGRvtJBPTQ9LS+Y/VPDOZC65clDb1eV68Wyho/YZ4Qm5HXIcvey6nir9ToSWCiGFCTMpKMycwn0hbq/qgnVeKuYGWmZau78BawFMQYl+m+RmH1cG1ciq2YFRdNBQ5iYmp7oj0swsXIaZf9tJeoRMbJ3dVmZblH7CQZL2SDHqilKX40Hy0pvEF0ZIWNxNa+hoEpDtduNE8zkV3XzAQfmG/oMZ4lznV4DK+wzlkHcmwFLm8BTGhFFA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1617457020; bh=bslqVk2NQewVuNnogv67oKmfj6UO44c/KMqMs0U3zgx=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=TjwqL39BvawqmoE9nsBa6erTqSkLBv+AeDm8zILVKzQZ4pIFYawCzDEwZIoARsYSmIhBu70321rd1bsrM0bhVXwAzb0ncEdxpv3Gkd8gUMQQxeU8CZ5j2YHsCwwCxdXayXAZTCuplSgUApxYI3OUy7zHgikAow3h+9Fk6ZnYfRZ/jxuV8+UwzjU9f0vS65Tcq0PprbYi5eDtoCrLbaFdlEDUfzRzoEFoIFvOipZ6+wZ70oEK2b3E904q6vhGUsfSS7rdN3e7uVvYTSW1FFhnyZTtCu+DJ1Pus7WLjLehjwZwwULWo7Mm5fKKW2X9Nx5FrQ/8oatcP+dr0FgLmh5kQQ==
X-YMail-OSG: JdcGbCQVM1nFhTFHDSoKvNF3R5muJ7c6dgN.bI7Si5qCasxJhk5NS1b0vm_GJQq
 5SiFC7Ky.oIuXm7qpcAnflkKVBaYHaKICHwwAiNWh01kpEKf_yZeFXafmdT6Wz4Bl3m44M8PzYMq
 IyArndK1YSv_Sv_ZnH_.qfPCgdSVk0LQpLFggBDmF6zJz0GWNNlEk5o0lVCRu81G.idVn4BYayd8
 Uhwl4PTDEcXeQj.fETcdH0jP9nRBHs_61CvbKWRBF.aqvTBCg9q27hbu7Xi9FlqMlC9WSzuVpNUu
 Rf6hig9.A3E.V3fHMSG7xcY07WdcO7pc8Hld8Ys7E.KYDg_YBOVQesUz_rl1J3Dl_s8RqKn57J6U
 GCze1y1ooEkG48TwaYzQF.M..UsEv6r5NmZz1y51Llbz7OEcyVdd7dfC6QuOwxLnvs10eihkXNBm
 KONOk4bxE8nVYpraa_FrkoK_l7cpIXi0nZZ9V1qTFf.f0WqI6vaoSiGfzlTi7bcTldTBi3_CHg4Q
 EJrk6wz10geloYl_f2XXZzLarQXIamRhFNLoB2cXP1bqp35FUHPwLbi3sTZ5am2IuSG59a2Q6GHB
 fg492iUf6OxRU8FDqkNZUBVZJXElq9arDq2DYHKJMyO1507U.5tPgc6F0eGMxm3z5dfL1qByvBca
 8eTjoopxCfi0lagWTd_T.044ZJurwSKzbFYSQEzGNL6quS.ciIsbMCI7oVL2EJbk797W.pMiZRSR
 jg5H.VNh2vyLdbHzyhT6IZW.7Chx67F00RCKWwqIocdJRuqwAwnZ9baZcvb0n2b09ZXiLMNuSaEO
 CGcMB7EYAqgOEoAvSzwbyLZ6iOtfvhen_wJ3xB2iqOgLp7YQRe.1j4_uRioHXC_YZnlBGKcMViKE
 EYEN71qTPK1OPQOCmdBWxVC8cbF5sB4zm1xEg_.SnCCFo8B_0Zi5hiGixL0r.G8QnacJR3E5CppO
 IGqSyKalEMimqWQXvOdEpyUe9eo1RoW.7NNXYIxsG1m2sjxMawF9A_uC7HyCVZyUyAbUJyifs.VA
 UDWym9Aj7ayJ9XPDnjmdBKB8lRcycCdyzaDZ8nmifwz77Dz97L_xswLNWmCRSU0FmcUZnL4TZo.Z
 9FY67sWhKoVC9jawX_ULPfulBpSq9N2Spu5kWUWl5_p9HNZq1q6ikBCapZV.Gm89_7F_UJkrlVGu
 FPO7aDA1pUYk_oR1Kt.z6clmYeveWdpOtA2C51R9UZB3KG6h4qeMOr.Z.xFXsMGpQOXeSeQgJdO4
 BacA7kG7IlzWwnl7y3rf6OSOPlIjiV70kxw13PmvIcGYVorwFcpawUOMSDO7kv53DvEYHsVfrPNQ
 7fcAouWXmF10k5toxTK_ojLpvxT6sxKczZCHN.QePAYQjQZCs1jcOO9nLQaWW80ek0WCAL70LGl3
 G9H1pQvsx_Miqkt6Zg_imGPpGHUHcHsPOsu9oY44W6ImOuNVjcku3h4Xy5t4ctbg1FNu1KWWVY4t
 nRK2Fw1WXU.sff_694.cWbwrNBRCpbbCNxeIdFBFZzcSMDkvnTSADhbE46BZwYF7mhsWTEy3v3y7
 CC1Cv6vA3cEpZS3MhSapnA8hF5924CpsjvWWg6gjyehw3rjJbpeLQuK3yRplDo51ie5tRmc1__V2
 54ELkx3GwG5oKzgrQJnNaupioU98raH7RzCoYZWzoSD6raw5SJyslEpOPsxc2w4QCghWlBNgYO_2
 X_96wNci4KYE13yRtBpKEJTQ6Hv0k3WBAdWgsMuNN07A6fJX.yKkNhEAfD1X5j8oFB_Gk.V7ykbj
 _mpoQtc9ln_T3U8NELxfl9Hc1y5EQTDOBjBItucD_DF7QEWetE6Bjx8agKrPdt_WPX23gGpRrb.Q
 n6V8d0KeQKIzDpisfmCu0jMWBi5k5_6IOgZJFOcWs3TUQpk65MTWkEZ04p3OSNE58kn78hgIqn8_
 3O8RzQt2w20JFp3hTO.SzgAnmAAwh60wvFTaYkoLBc3Uvt9MPpbf6DnG8PEOhFMFqGEVgrvLWbRQ
 6S9ea0R6pObzJGK5gQmvdvFFwg0dEjtdqRtLzbqJ59pW.iRDiu4mim8_5g4p4FrTwBFYmZGnQgw4
 WCzL9JIXgiifIMnfLqHCVJGddJOw5QX8hVc4g7n7aWRHfloLTVJ613MXmWWMb64ODQJ5nz2NB8Nc
 bN2qZe.CMKmTTNvXslZocLi85uX2aZFZDIe1c20ukYH__gYXhws7EB2O0FDpqmui5lnhk1bW1uc9
 0QzTsMc4WfvmfnUUwaqB1PXWCRHL.dYpudAS3ivKKW3KZXynhpKuO_1U1TFbCDVd0QYR.HBilg2x
 KAL.cPRl6RV8FbajEygjDL7nSQRQB1Q4ivRzAOsWnemvbUZVDHu0qnLEPloyKABmmSoIENyvwZjJ
 dpyU2Ga6p.2LR3BMU01PQA7PkP28t1l8Vr5g-
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Sat, 3 Apr 2021 13:36:59 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <2007893190.1974412.1617457019974@mail.yahoo.com>
Subject: Xen for AlmaLinux and Rocky Linux.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <2007893190.1974412.1617457019974.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17936 YMailNorrin Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36

Hello,
As CentOS there will be no soon, the Xen Project team has any plan to build=
 Xen Hypervisor for=C2=A0AlmaLinux and Rocky Linux?

Thanks.

