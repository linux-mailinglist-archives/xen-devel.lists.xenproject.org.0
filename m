Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E44AAE31
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 07:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266217.459910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGadA-0001Ek-CT; Sun, 06 Feb 2022 06:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266217.459910; Sun, 06 Feb 2022 06:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGadA-0001Bl-9R; Sun, 06 Feb 2022 06:02:36 +0000
Received: by outflank-mailman (input) for mailman id 266217;
 Sun, 06 Feb 2022 06:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thp5=SV=yahoo.com=akm2tosher@srs-se1.protection.inumbo.net>)
 id 1nGad7-0001Bb-Sf
 for xen-devel@lists.xenproject.org; Sun, 06 Feb 2022 06:02:34 +0000
Received: from sonic313-37.consmr.mail.ne1.yahoo.com
 (sonic313-37.consmr.mail.ne1.yahoo.com [66.163.185.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5deab646-8712-11ec-8f75-fffcc8bd4f1a;
 Sun, 06 Feb 2022 07:02:31 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sun, 6 Feb 2022 06:02:28 +0000
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
X-Inumbo-ID: 5deab646-8712-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644127348; bh=64dZg5Kq7nmVHL0EFHFGeSk3OvC+bM/+NWLW4wquqS0=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=LAJwLxAlePaKGTbFsyfyGOvdM4Z2zbPH42HyiXzSYjDdYJOyM090gSWgdkVxVHKXPqQ7gW62Rzloz6GUy4HeFXM0CXH1b4pLrNT8SLJ3cvbc/FfDKTArr7Qeqj1SJhD0BwZ0Q05zHj0dRmUa02n1vTVIkkJsnpaYhl0pNDYQ1LfjpJTyI7n1D6UTgV5D+6szWgyqqncQHTn71YRBsyKkPMg7c2s0thjPHAEcZvoN8Cgh8IXzTzmvsQUqMf5pmFxHvsom15G6BvLEPLIzebmhByjfUXhgkm8707jkrjXcvQ6R/VyP2yRrMwdqQWPmiiwyFy9aTtdsT5OiSij0dxxqsg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644127348; bh=KRDHbZZKXr6AZdtF09mjGXD9OTRpvv1aESFUXWSu3RG=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=LLGfamuv2qYQj11G129Y3c9fvGu35x4usPqEGCl3p8iiwhvGPqtwUml6W3I44rf/4nFG2QKeVxLwR5XIF+XS+Rl8huRmyRE9b0obauGJGjzpsGTCjX1xUPFhWT8V9r/c3nzSEonl0tLo5Isq7Azg1JW4CGHXaQdjUcTmS7Dw/CTPmAaXXxiQUSN5wg+4kBAgz+2waYC6JYDEEX14ArSmeG6MoRGFHXNfHFpjSuFF7PRxQbZZFoeeIoOCKRq23csz/2hKBd6aGtDKhby/OBXUSVivsS/eqtJLLv2vl3OluPd43nRKQm6Mbvwp/iy+35PKcY7OZb8Y5f3ReF4/atu92A==
X-YMail-OSG: l4eypU0VM1k9T2AzUAQWUD6GfOQ1bvHBrXUdnZaLbTToDAwl6617YKtrVLDs3EG
 HX.f.R7IXHs_LGWnteSkMB5EynMAzqDFUxJOzRHLGYw0r6hK9GvWcDJp2qiGKT_DkYqXQQv_XTwH
 Igi4uHeuQ2TGTMTwuO6pz7v4AFLDy9d6ZUX0HtrQjZ1HKvaK22os98roLATK6YW2XCsRw4kpg8dJ
 bwKCG_tn4qOb3NnoUCknwKQe_Wv48Lt6Cc0nBmMZpH7AKQuid2Ei55ofnEM_1p1i2lBbWQln7Afm
 mtcXLI_jr3CHPEkP24gBCMVWqMtaZFcp4SZVn8dGcYGmr4cSr2EOBdNmF7gVCoNBoAHSsVXpuY0h
 LTBaBZbUBnVpTSPfAyTdvZm4PKxYmKcZdFSL_2cg0PgG1PNFPzrH_kkgrFHvBf757Seph1lJQ5ZX
 toyDUnU4K99Xmj0kc8EfA8LigurBTF8TYAPFjN1Eki5FEBAYLyYeVjXKRdvyDuqxURt5XdR9dXF7
 H4VjcSfdAgEqSsKkNToIl1A8rKaDE8E_xdH.KZ.kMsNvqAHPH53xSpoUQ7fXGB_FxRoGvbgrNhap
 k5QQW08W3nQitpTWW_3rj1jF8czUaOmaSYTO7Iuc1qD7w4zRZCGIqY6dsFPnovQdYtfpg4.Xnzm9
 Kk2A4LL.H7DjMlVanvwtr9KEREmWmWHheO_IkT1GA14CFCI1nPPGRQdH8XtSeigNc4c8ryTKnrlw
 _8G6Ce2TF7mqi6UU7rieqZBlc44MoijAmhAjT2TP65LOMlMqBrbvjtcR440yCoXwuvosxH866BVk
 eudzTqSIreucHTrp8F_wL0oGO3LPbVDmoBwaljoJjQjJrIosQvoO2DPVEilsPri6yKWhjgww7Avc
 E3vp.nVGj0Pz38rubmKRsfyU0xuCIbHZ56fQpw.DQzYBJAiZjzXGzKvbbEWrTnz_3.ihZvevm3ga
 nmFbk4PzvJNsJ1sa9hNpdQYTdawp3AYv3c4D7adA0CBgnMeM5vXUed0KBctds20Z1TSR5rIlixly
 koJwVMTi216HTFAl6.Mh.fEGHXjo_VtRHmCZGNnUqQeh1FdsLftWNaOEtnQsX6i_NHfB5H5_payX
 gqCPGJ9Vfr7Nqeb6dHolVLU3PVTldK2ffpegh_ZJR1ECD9yiA89Vd.hVFY02hvVhZGzK.I4HDZFD
 c0XEjlw1RlznxeeX28r2oBo6VVtPp7PyxE6pbBs54qUIdgFF1jA2BUBzu8YunisFLmWuEDWJTOuD
 2r5yQ2G.P2rCmSNREeNGMpNRB_llW2sKcw6iRqJY4AiWevW7a27.il0E.six56xzfFvR9VUkcfcH
 32eLr2ek2OtXbbiMWC7jkAl2Vx4fcRjs_h3Fls3GJtVrbxzdLAqVM9ob4xH7tIn5zb1sM9sVAe.U
 z_Lm.iNsUU3GJKUSUAVPKZDhAffxa_gwng7_UR9Mts_FpX28MRybg8BbF4hFRGrC5KKAFlljNAr6
 jGl4ODGTbDEx9nyEDxlh7mcZtBdl9ZWKRIDro4XpAyDjHtgfZrQwQKT_KAB7k.hTIY0LGmOCXdbJ
 sZ_Cg3oGd2Ek98fQ3zRfYL.16yFI0mC7HJp1.yqzIFEfYI8.4sDgFBy65.dL3J6Nb3T4uWhKWhbB
 QQ0MK3UMPOlZVVxDVkwMyWXGLBrkePTDg22mHHT4_svTsIKcIJMbKj89e7Qd0MMGHlO6cd1ZlGUe
 Yv5JWprphpC8WNTk1EFt.9CF58b7C8EuZgz3ajsXZsRlLKpz5vHlEbs.8WdgJBFr2vAqMusFmW3E
 4wRLpjhpClS_5KpDI5PK_FUmW8jeLzP9rgy8QskThQ7X5RyoQ8MCllpsonL_D.gctdT2odP8BJqw
 u7kZNm8Zsrr2CLLYOP7PR5cWMbe4QCJOj3ce7XnsJIELPz.su3YTD_dfSdNBJhpArLb2HPUFYZOe
 zvroUqMPJ6ziYCoKagTCx7JMhW4kSqdP1C4VY8ao9XgK4nZC5osQlBjawQWjTkipuyc9fBZIQ1aZ
 oDNA6rjNnMnrCARfzJcN5DJ0ySCFh4f0AGBe7oqLhmaoTcP9a7JmGgGGr7oXPp9wJnQ_mGt5RZy5
 yftDTolNSNq24z5H8HnBPBy7246dgLzuukLqoRyBBTKa0OzWuHoAzWChsU..S1Ted_ox6Lw6lBWr
 dQH.RihlTOHV39Bv3Fj8wJ182Q86mPn5j9o84mtG_6rsVHRnuy61mIyse45oNR8JMIkTu5I4ikEF
 _1fDS8ZaX1eDlHtDpSq1f6E_AHRJDdpYaviKOSg--
X-Sonic-MF: <akm2tosher@yahoo.com>
Date: Sun, 6 Feb 2022 05:59:57 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>, 
	"xadimgnik@gmail.com" <xadimgnik@gmail.com>, 
	"oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>
Message-ID: <709142925.628001.1644127197288@mail.yahoo.com>
Subject: PCI passthrough support for PVH mode
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <709142925.628001.1644127197288.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19711 YMailNorrin

Hi,

Back in the year 2020, I was inquiring into the status of PCI passthrough support for PVH guests. At that time, Arm people were working on using vPCI for guest VMs. The expectation was to port that implementation to x86 once ready.

I was wondering if there is any update on this. Does Xen support PCI passthrough for PVH mode yet? Please let me know.

Thanks,
Mehrab

