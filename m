Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D3523ED24
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 14:11:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k41Ct-0002sM-EZ; Fri, 07 Aug 2020 12:10:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XF5/=BR=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1k41Cr-0002sH-QL
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 12:10:42 +0000
X-Inumbo-ID: dddb61da-bedb-4c0c-89da-96ea24444195
Received: from sonic301-2.consmr.mail.bf2.yahoo.com (unknown [74.6.129.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dddb61da-bedb-4c0c-89da-96ea24444195;
 Fri, 07 Aug 2020 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1596802240; bh=W37xUrb1O1ev2yKI+LITNo03bA7zyIc0nYk01MXwqSo=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=Cb1Ca/7T2LdbrbvFoR0+wThMhhGjKtzcXeAJ3qwTJPRfr3791URoX1wt6BDYXGP6iRMmxwXTAcsR0Qe+yfuiJlk1ZFS4gb2r14wcRqfIYHVJiPCxKPvgTNQt2w/aumFQJGBWPf2nodH5U5WofZYVMxcVHnNJ27UU7qjDfuQVm0htF3Fop/0biJSkTkH726aB/uTI0YCYRMqG8rxucbEvgdtxP2e1o+iNveWNNo5DxeUXOZbvDe0lJzu4TTEAEIQYXcrKRb2hMmk/PjdMxTlMPCU0+84BViOhAN8XRhBi/IYWqruNvhoPxEClH2bcVo74+khCiIywNp63sBgFC6LU2w==
X-YMail-OSG: 6FrrMgwVM1ly0MQ2Wyk81S9Emo5QWKtzuTfGFh4HxNy6Ask0FEkIr3SOV5EUyiN
 Ogl.Llk7tzgWO1DxXTXLTzW0EDAKojGvFKEkvrqUeYhRLfPlloSoFor_Iq12giJyN9QDZJWkU5xl
 9EhipZH8KSe8DsK6giBf8eAQSQH5KZJeXXcGyks17H7Yy6v1frOQtDWJ_Au7UDKEE8XzWcUyNL89
 nfQSaReEuOWYCmMxT3zpI70IkgIc.xfYcC7Bh2zpn5ptL8vOgAV9NMvaZm7hSI90WSRIIYha9bUe
 1lrHxSUrgXX6bPZltolcAeby5eg855vNIrqmovRESAutaSGg1XnOAGfzkDCwJoB7JofXsva0G7Sn
 jau3EuWjffOImWCoiRy0_lbI48vnYKmvdLTYCPhSPiE63rWx5Pk503YSNMZAX8x0iQ2VddZr5XV0
 80atlc1VQAGBsCvF0aMQF_w6ZuAlHwlZBrrLvDBb2KEdC1hgvNA9qoShw2QXL0lI.H2hvtmoreDc
 pOPe0JLQ5jOevDa0yzevT31IBqKf5TniaMOIbOfBgNifMxoj8PNrdtvJMMnVtZAhVDrPSEP58KFE
 wjUi0shtESolYVjbbfnN7UmwAjWS6T9Rz74JaBn4sgW.QAxiJ4EanlyicVmiIwiTuqCS7IeQ2z0u
 _mfnANL6toRMxqGbpIdeW78UUNizkXx5nsvfZ4FI2KN1IKbUhLCtJwb0SsjG.6L7SLsKqzuobcoZ
 i.nzxj_HUDKiUhi1foXxD8WOju2bAsXEoAWOgETRYYsQM0SGUtgRHMJ4sYcxoShFsywHMGggC2IH
 sveW5obOK73_vQaRfEvslUliDLZQ3MgHS.oCBF2oydchsx9mJPedj9PAv_sIjJomz67md5gRisBF
 DlhPfN7RfyvlpiLoqjscTJHcI53Xlpx3WPkq.E24I1Q4ETzBdFLvcXS.QVbzay7mxESGGj0g1oeZ
 PLcnmu.P0H4i4pLMCB.J.owTyt86k4qJGDHCiJIDkE7VI6xOqn45vdeahde14PxNYyPABLmq.q4z
 QiQV9NEDLEv7WEBJvFOM1Bq_2D55jGL1a7UC02zi0gN3lENC0F7eUC7yOWCiXpa2ReDLSLGTKFmM
 kqqgWKG4DvJe3njy4F00Gk3zT1H66623uT9B9kRk29Se.1MyFJtVhfhYlE5k_iCPSGFKXXsGkKWZ
 EUzz3dy4JbgQA3zLeigOxQI1nMoWsm5QR7NTdLWoyuw0NXi_nZYl5YTjKQx88Dwd3xGHtDRhBzbl
 jtlYUCzzqvua0jGp4udYo6KvmPJyz8v4ByWU.CvBtFkUBknhINkFT9bR39s1IhbTMnItshzPqLea
 7BSNn7SjLNufXOalxZhCTvLrb5RrH0wxVF2aDFSH2LDONe_21k_rFK51TiB6VnjJ2MMv2cCiNPoL
 24wO99OVaBC7brpSCvcZ2TgLqXfBxpiVE3w--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.bf2.yahoo.com with HTTP; Fri, 7 Aug 2020 12:10:40 +0000
Date: Fri, 7 Aug 2020 12:10:39 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1571516620.940720.1596802239062@mail.yahoo.com>
Subject: Spectre and Meltdown attack.
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_940719_687164724.1596802239061"
References: <1571516620.940720.1596802239062.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16436 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.8.5; Android/7.1.1; NMF26F; bbc100;
 BlackBerry; BBC100-1; 5.16; 1184x720; )
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: "hack3rcon@yahoo.com" <hack3rcon@yahoo.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

------=_Part_940719_687164724.1596802239061
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,
Is Spectre and Meltdown solved in Xen hypervisor completely?How many versions of it existed?

Tnx.
------=_Part_940719_687164724.1596802239061
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<div id="yMail_cursorElementTracker_1596802193816">Hello,<br></div><div id="yMail_cursorElementTracker_1596802151055">Is Spectre and Meltdown solved in Xen hypervisor completely?</div><div id="yMail_cursorElementTracker_1596802195886">How many versions of it existed?<br id="yMail_cursorElementTracker_1596802149372"><br><div id="ymail_android_signature">Tnx.</div></div>
------=_Part_940719_687164724.1596802239061--

