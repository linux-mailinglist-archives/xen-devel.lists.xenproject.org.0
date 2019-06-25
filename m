Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D25586E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 22:10:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfrix-00059R-4b; Tue, 25 Jun 2019 20:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQuY=UY=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1hfriw-00059M-4A
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 20:07:26 +0000
X-Inumbo-ID: d7a9dc4a-9784-11e9-815c-33911ade8eed
Received: from sonic310-14.consmr.mail.bf2.yahoo.com (unknown [74.6.135.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7a9dc4a-9784-11e9-815c-33911ade8eed;
 Tue, 25 Jun 2019 20:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1561493241; bh=XnyMPF//1qwgka7BtEVeOIQCpae0/xIDwef/OKmFh5I=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=NdjuiJetJAy0kPnEREQVgGjC/6T4KdN/yNjw/ZrKZDbhponzo5DH0/YDqNURadqeQOj1ebaLjMuYl4kVQFBdfE0yKk7Z1F4ow69HQRycSsb3XoUDRHM6LMHXOzjoFWycpW8NzcGp5Hfe24RNnV7HJuoI6HqpLd1hzfP2Hr1pVfRAhg5QKuvEjD4aLx2GjF+LQPvGFyjygqB0bwyI/NDr9JvMCDhb0O9WiGcojQYGK4lFeJ4Uf85YosRVEjtrQS2LgyOhDi36XNVx5bF1A5zggSIIdaxurlVVq2pH9mPeDroxBdV5T4M5LR6KtMD2QDwJ5b7ef8S65Gh3DPM/ubqmmQ==
X-YMail-OSG: AXdbtuQVM1krXejKf4TkQJ1h9BCxmOlC27A9egdGOemw4CWhr39t6ivHz4PsfJ1
 m4EakirjfmMI0UGo8oM7XhyfiOUCOtN8E0PADoPwDo42FtPUdnwys0Ai0GLMmZ9L_20OvLUCR.Sm
 f7SLFZe5aTRJfUAAH8_WS.XAomfS2DLjizX_hkiwwJWWWHnru9ElvIjAYeAXchcuiExDfW2DiLvB
 NsF85Tsebyv7hLIchsao8uDG3sfD1wgOowLLISe8Vqhh4ApW6GZBoERdr5AdO4GndYQRSY3jMiRE
 fF81FpfC2ASyOu0C2g0xhPDMXNe5yuQlA3_0.84ZobJOQLqA0_3qzONQyWVW13obkcqewV51kVLE
 j9yaax5ugzuEQ808aAtyjbLT3OvF1.80QlwlaeAoJrONy3sAtGxgzkaTS2KISE_27kxQUP6M8oeX
 lJ7Q2_EK4.arEsessKYkH9QAKx_UtAHNdSabftffkOtq3tadbg8rEoJvFrgy7nmQMqWbCkD5pB7b
 IBY0Rw64PNC7MscdXnTnLf2RRc1GuAvy_A2SLUXacSygQLh7wEXYi1lNuGr7__tNdcCYuTE_PB7l
 RLQ69xsydIu9jWWv7NNyvr.7qojmQLzVAUhEtapPF735XT0W9SYlzxv7TV36x0hNw.U5ToujjELX
 nlF_2nwimSg.JaYkB1qBWoTCWwb4sAuY0JjboEExDrkqECYgLxQW.n0Rd_1wTGceGwTGkmwijzad
 ou6z7my5HidQpi3DDRNspAS1_1cHJAbrxN49Egxtf7AGvEiUacUh8k5C4S0u7MyAeXGonC89xmQS
 .flyDB7Oypg_svE1gLoidxwWT8brf4HQ7VV9qd4wh6o4AI0b9H8kpZoBsLxgMCRVrMWDIlUez7ed
 f.YsyDgnxqckvOZMJtsl_OMBHEPV0QY6i63DghjkBONi8XktJB32pBkBmqyXNHtwI4l2He2SM8on
 2Wk2SQwbyedC9lCn5ceyQMinhHNzt7whaOKF0qsPhswKQE_46L0Luz06.3J9WytiiisZDKlrYGvA
 A82ghZENy7jhg126UF3Bvbg_X9Io7J0joSbi.ntCQtTIhD.A3d5xJYIyQpGkPkbNEPhWCkcYfNUk
 yh9h0gcnvi2yyqMbBPjyjuIVVPj37_HN_2hZhqcXEKNrECmUJd.Boh3lijv49KtYDrhGNCNuJK6W
 o3bwYiN_gWtk7x7X1kljyOZNAjqnclSPIhZL6BrBSqQHOSdr1XaGjaRlizK7pV9NVU3cFDy4qdn7
 e6D3QQSbdcKoQTBhXXk4NnNpZoBzP.mym9gs-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.bf2.yahoo.com with HTTP; Tue, 25 Jun 2019 20:07:21 +0000
Date: Tue, 25 Jun 2019 20:07:19 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1411577944.1171584.1561493239215@mail.yahoo.com>
MIME-Version: 1.0
References: <1411577944.1171584.1561493239215.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13837 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/5.40.1; Android/7.1.1; NMF26F; bbc100;
 BlackBerry; BBC100-1; 5.16; 1184x720; )
Subject: [Xen-devel] Xen and embedded.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: "hack3rcon@yahoo.com" <hack3rcon@yahoo.com>
Content-Type: multipart/mixed; boundary="===============3467997409448716737=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3467997409448716737==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1171583_943945067.1561493239214"
Content-Length: 1115

------=_Part_1171583_943945067.1561493239214
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello.Is it true that in the next years the Xen hpervisor just run on automitive and embedded devices and not servers?
Tnx.

Sent from Yahoo Mail on Android
------=_Part_1171583_943945067.1561493239214
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello.<div id="yMail_cursorElementTracker_1561493129931">Is it true that in the next years the Xen hpervisor just run on automitive and embedded devices and not servers?</div><div id="yMail_cursorElementTracker_1561493207393"><br></div><div id="yMail_cursorElementTracker_1561493207663">Tnx.<br><div id="yMail_cursorElementTracker_1561493127450"><br><div id="ymail_android_signature"><a id="ymail_android_signature_link" href="https://go.onelink.me/107872968?pid=InProduct&amp;c=Global_Internal_YGrowth_AndroidEmailSig__AndroidUsers&amp;af_wl=ym&amp;af_sub1=Internal&amp;af_sub2=Global_YGrowth&amp;af_sub3=EmailSignature">Sent from Yahoo Mail on Android</a></div></div></div>
------=_Part_1171583_943945067.1561493239214--


--===============3467997409448716737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3467997409448716737==--

