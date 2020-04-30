Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60271BF3B6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 11:05:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU57M-0007PB-Sg; Thu, 30 Apr 2020 09:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PrLm=6O=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1jU57L-0007P6-AK
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 09:04:27 +0000
X-Inumbo-ID: 972f255e-8ac1-11ea-9a10-12813bfff9fa
Received: from sonic314-15.consmr.mail.bf2.yahoo.com (unknown [74.6.132.125])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 972f255e-8ac1-11ea-9a10-12813bfff9fa;
 Thu, 30 Apr 2020 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1588237465; bh=/7sBjh3keCAW2bgBGj6YqVJynaVkYahyXKffvsIGTdY=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=P67kmvrEp07HQU/UB27Pb4QcFYzN67LLLQr9UiOpgltvWOIrG0/5XtSRrp2MIG62B+6JXM1XxSKXJ94khCHLACihYLzkOmqurvK55XKh2HLFGSZ1En5PnkrqKJHdCK+lo3EVifCAkQCiAGxrC/pmdPgiwGAyVoGuy6i0QeoqiubXPekN+9g1OiGrDOyV4aa+hD89IyP8FcJrs3MiFY36apO/wIzSBksr2xpkdaXAVxfqwWHHT2a8zkJdq1QDnuv3vN5AzI85F7Kr8N29I1Dv55CtfX6mVyNbH1RfY0j+2zWdbmzgWvhzP3i/q9vYt45MT0CbFIGMPl2J4llCdcwT+A==
X-YMail-OSG: 9.LgjRgVM1nyBhfI9MwQvmuZZM6VIRaipz3qshivA59IohJ1dcy0snAX1GUGg8P
 7TiymCgXsPTPvHe1TdRu0W6kmyALoqZlG2OqDvHHI3LrSl1sZaEhWTOde29BLkGIy5LZrXpG1iQe
 aT3LzziN6jCl0U8sGz24hbcj8uIPlAM0d_CRC0bgmaOReuiTd4b1u_TAz_vZxiXhSSsKMJsnYnTO
 a7lWsdY4UaJZfARMbfhLdh3GhGJ_Ae8qNJndy0Eci4uPf.YRWqyD9c6NV6TThsqDxeElBTPKUlL6
 aL.ogvAoNBv_lHq_rY0XpMwSHh5jST0KmwSce_9GgLkj10w6HLUc10oh5IGg0nS5.qxDWXnt7mzo
 KIEGGABTTAUJI.EakiKuftIlWxS3aJyNKT2.KyuNbbCHOsiOw._hFlBNa9OnrK24Up_Iq.JdP.Xu
 37ECQ.psy94GEc90TDu_bPUIXAkPz.0oY4dA5s3P.UJpTs3Q_cck3umjX7dubrwMLXwhFqzG.o0_
 YlpXoufau1KJwA7Y_VQdLcB92iudjX39Y6AIx5Tvx87nh2Tu8BLUW1QwoMWbacoNSJ0Oopo7BYxs
 ilxHcby9jDS8YmSr_7cvBQmhb45uRJf0l8BPGZSCR1Ntj.dvXF38EeP8ChPCl62laTBl5932XPfx
 06sy8P9AGnCJ6FeJcYTjh49voYDF8QpNYWFn2NmlurDCP4PrNAFk9ANpc5KbHvNtrNE0XyphY9wK
 meFMTz2QAogTOwnSLRT4xcvnud2X8uir6ce_ZrGaIsrmAuUSPnAr8dnQ7QQ.BVTmwAT0A5.VaScu
 lgusg4Zp2UN5RH3bj7FTZsKsBO89alO_6afImxLdzbagN904.Oi6G9h4ik6V8nqQxlXuIPaE24u_
 Ul3Xa8WcHD.nR1zvPk9f3mCkKdc54MTSgOvbLz82vGCLj81O.4D.0p6tLuXXds.FGsGrVDe1oRg8
 ek0LEl9ycTT5YKmF6P9c.MqjeM0_PJqiUB3ZPYuHtzaknfi_MBmc2bvLFDg5C8HiZknpCuTIRw1O
 1HTtwn9h6YTSCOOd.BG_47ZDnQ7tqSBuXdphKudzoWaemp2lZQMAZqmsVohvBWROb_WgTCiF6pED
 KSPYxkTdA_JtpIWhd8bgmvbHXxIjuxAbVSYlexoiV4orRMe5w26L8gRj.iknULw6jSIZ6dXJuMxS
 hXlfOMdzVRhWAwAWwjNh4tyzhkJ2EghgwxJ8LkTE9Vucj8I3poyhu3jWE10OpKS3mdWNuFWThMuz
 hYL5nJZUT2Q.VqUlLqAM9ZCcLdzHHTXbKnuUA42WdRnz2Nuj.98OqwqtUSJfwHq2F1g8UI11jvqn
 FnNc9WoTvdYyjLRs2mMNH2gmPsWrm58IDKc74SX3ujA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.bf2.yahoo.com with HTTP; Thu, 30 Apr 2020 09:04:25 +0000
Date: Thu, 30 Apr 2020 09:04:22 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <573229028.266395.1588237462419@mail.yahoo.com>
Subject: Is it an April Fools' Day Joke?
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_266394_787268304.1588237462418"
References: <573229028.266395.1588237462419.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15756 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.6.2; Android/7.1.1; NMF26F; bbc100;
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

------=_Part_266394_787268304.1588237462418
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,According to "https://xenproject.org/2017/04/01/xen-hypervisor-to-be-rewritten/" article, is just a joke or real?
Thanks.
------=_Part_266394_787268304.1588237462418
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,<div id="yMail_cursorElementTracker_1588237394745">According to "https://xenproject.org/2017/04/01/xen-hypervisor-to-be-rewritten/" article, is just a joke or real?</div><div id="yMail_cursorElementTracker_1588237423684"><br></div><div id="yMail_cursorElementTracker_1588237423923">Thanks.</div>
------=_Part_266394_787268304.1588237462418--

