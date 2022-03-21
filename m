Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645A4E2F24
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 18:37:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293164.497915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWLxc-0007Jk-N2; Mon, 21 Mar 2022 17:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293164.497915; Mon, 21 Mar 2022 17:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWLxc-0007HD-Jp; Mon, 21 Mar 2022 17:36:52 +0000
Received: by outflank-mailman (input) for mailman id 293164;
 Mon, 21 Mar 2022 17:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/75o=UA=yahoo.com=akm2tosher@srs-se1.protection.inumbo.net>)
 id 1nWLxa-0007H7-TB
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 17:36:51 +0000
Received: from sonic301-32.consmr.mail.ne1.yahoo.com
 (sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c4e8147-a93d-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 18:36:49 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Mon, 21 Mar 2022 17:36:47 +0000
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
X-Inumbo-ID: 7c4e8147-a93d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647884207; bh=73uONmc275LnbOxDWXF2nCK5O5LnqwfdnFK4OpdeDMs=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=AlEKvvY2L5hXssxAeSZfmAits6hGy5Ie9c+/sZSdYnU4unHRxUWpJr5/6hMN4GeokRQ96JctpkiXFQOTurFScLpvUg08eWXqoyXdI7ar10n/SpMSYsbvzgTYLGP4/hmhViWx/VaHnAygLaSO2/H4jTJ3rNo+yXyVRCrjNrgWlPmBFaN4y72RGdoW6Y8kmMdCTPtZXB9CwDDkNlEBlT3HsXH243j++PEQHwGh0K8H3C6aq6gISMAjPL0jXjBgGRXWOIxhvTdiAE/nVYtdYsbDfFOKB7YV8VScZhxyyy1ggznZ+F5xNofr9EkGhpj/kb/GKmoiMRDm580H4JViShWW7g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647884207; bh=EVO8nECGOFHv+r6tNZxiFwDmyWBX+Ac0KYgjosvOHJH=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=tyP2Y76xqbKzesOoyQV/7La/TZ7lCrhpcIAeQugjwHjiD01CM9XnWbBpWbvPq+QfCuD5c6DFKGZ67BMz1AvEueG+r7l6djEGc1alkcxFgZB0uAxj1NZ3pMma9TpNDCR1FrKdr11GNvWQxzjJGo/FngqMsqwLOYpp3p95WqfUZ+OQ5TxXCsbmPzmALl02rjhKhZfIPalG3Exdz4JWbwFWGzRWe+y/+60O5r8YlbojmPALyrN3v1g+ZV7rK3+CLQbpdgzpH1JdaD8Uh83f3+/rA3l0qkVjXn45wiLJ9Q3am2rUNf+nuDq75NrIa8fntdzoJUmbAtnnwYnetd1H8zsrcA==
X-YMail-OSG: 6cYRSgwVM1kISSiTrmvM9vmWXtrjwk4kc1H7DHwI9drI6feGO8D623jpq3OgZVO
 6lh6sZfwd7q0kamJQ7k_LrF7VW_NkKW9VUXk7HdUmaCvDFQxXSOtuYbJoB25JbDunL9dAUJTv74A
 OdHjgRbrWBQ.ifKkhSnUq0O9Pbu_yiHZr6bwkdycm_80web3vY_ev1Oi4VJm1OFssNDT015xekCz
 Qyhx_x1GgQi2hFcAg7YCCAsjOmZLllYM.QiyyeMxU8zzQ5XC59GjDO.HmvDa4r52aVGMbebHXZTL
 0mXU9CF.aLXtZtITrxokPSKzUz9zwovm4rFTebsMsUu_pY_I5C__dPmGt7iNBpMd3zLCqgB_nf3l
 53SuhAL064pnxUdXabXv1BzOelVq1FdjX63HdgR7CVw9DrXYnsZhL28RFCpXtchpUYnbaW_EjBT2
 fYdT2HXO1b1zEZh.2t6Q4TH0Us.lXxRzfLKD_Ii.QflnsGhoYeUrPtLlTcDM3WIrkBv5XKxmTRdA
 H60KKW1VGDi6PRW0wWpc6rZeE7w1N5E2FFxXWwvJ9JTxI.bzPb_PrGS1Qq3JIqQA.sGyAagMaAhA
 oQuSr84cTsnYvf8Sz3YECV2cgNDQ.PcH6gfrr25MvpdvuNBjxZbMuyE_hTpH8qydYNpzpmSoRtIB
 xZxPbtaynMYIVndC1H6IosjArwIfBptx2kZMknVf0du00clSJ67Yld2KOMHKf5qRHWU2Yza4HTUO
 EhOx1gvITivCf3sI.hCiEK5Lk4knw1fRo16m1qTYMQsxybbw6wXYzox9_KAWNvvOHIxMefE3on.C
 ws9F6mRa_ba1PeNMVvF7O3v73p2Bhac8OIJX2aMh7L.JBLshjvQ.7MfVGwfi81NXoPpdLcww8NuO
 V_yRrbgYwvIYKBe5zXzldSWJQd4F4DN1kdigJ0QS62ebglC4YkslqoapBpp7MknOnwb6igUPPYmR
 K1tPfBwLgGlIXEq7Qf3qUNoTRIiDxglTz68iEEsHpw4PvKXDSJDAiCt8R4ismpgrEDXYAqtwsx_d
 aHcqWNpbVXgZpqJDMUrcPk7f9BjBQBhxIw1xhfww6rdmGAXLpQT6We2htMnpFq6qyK_BQJl88wcB
 zaaoL7gw787bwpnKUJTYGmU5HvtyBmwx26jV0py34s5P6Wn15qSK0PCulPK_UQDsFf8AhLzkYg8w
 Y1us94mpPCkPSqEvM4ZsuGKvBCiAULpVltXNgZdirVYN_M4atvLyP0wz1oRzQe4FQaB97e_mbqcP
 Gck.RWcaIkioZz6MqXLarE5Le2GQNeVwBqF0fOYSfLFI42MFPRO8EKWbYCkcBn0Pj.1Ar2IH7BXf
 1_XLSIRon4q.SIf8gZ64Z8qA7M8.fzR_iC7PAays8msQTeQtBtkukgQEn4zEMDOHwQv7vnZkCP5s
 BPEmchKd_0Npi2LG3G5mxyjbXBzqxWe.3HmvuhBrVGuRU6lIkynUhR1M.Zd_.otbSyebIvX6btf6
 ZqlL.lBLLIoYYSypYZ680sKlLED2jO1qPnx.Bd2rDs5PJ8_Hv5oZNTLgC2FrCU39rCmDEEivIeJl
 T8gX.xNnJjZcKRVs9pkNX8.PC6fnslOBScv5m1SUued7pMExPLI6wjzU5f_LDzNrM9kpxPHJkCQK
 ZY_5lLbebjTSh5hy0orzLrs8EhvfnWAu5ht0FzcOyBfEFVPIDyuE6C6tJYd_NMvrY0TgF4EEtrnp
 YbP3FaXuZQIgYi8ODHt6i1UGWQ_gwC7TY2zAa.NCn43pKxU0p5lStqc90pnRgYy_jAqBC5p2igRC
 rIMpkJjwZ1QBgb_kSSYhDU20f6jbmsZWYgjHreTrYEjFvb81dore6QhEOH6gdBHmcmrAjs_v7Exg
 ehzubWl7o48I24ZVLAGKB6hBBAADZkelogU4qY.jxqSPEKEkpTCo8e_HOvjeiy.L74XP.9Wqd50P
 O2sh6w90J9b6ZNoYCyOUUSamYHp4jCYF8ZPytrUXTsunIyM8ZIDq3KlsiGtKSW40AsrPshfW47M6
 l.zgFr9XPAL_8fv1YnWyTAzZLwU6CRzR9SLLONq.8Qdotanm8ILlHBrK9FspgCogdWLK1V7rTMpA
 8xyQrtv5oZUcSTxOq1PtQPBw9m8vVDBOqx_jfI0VoiBx9kTqAPzpo_H33rlxvUwK2SiKwXkRegN4
 6NOxJkWjtd0TtWruB4lPhdf8Ua1ugmmRydfhOWfY77YNa1FLC249225NlWPnT5lHCBqdTXRhERzq
 d9fjUd8z1iquRsVxMicpk6Yb_3dR0U2VpUPHTkJSKSZ8bkN2BPDtrQLM20r3Q8zyhSC3_
X-Sonic-MF: <akm2tosher@yahoo.com>
Date: Mon, 21 Mar 2022 17:36:43 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <791301742.1443931.1647884203750@mail.yahoo.com>
Subject: Requesting Xen community's feedback on unikernelized driver domains
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <791301742.1443931.1647884203750.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19894 YMailNorrin

Hello,

This email is to request Xen community's feedback on our work on implementi=
ng Xen=E2=80=99s driver domains using the unikernel virtual machine model (=
as opposed to using general-purpose OSs like Linux) to reduce the attack su=
rface, among other benefits. The effort, called Kite, has implemented drive=
r domains for network and storage PV drivers using NetBSD=E2=80=99s rumprun=
 unikernel.

Details of the work are available in a paper that will soon appear at the 2=
022 ACM European Conference on Computer Systems (EuroSys=E2=80=9922), avail=
able here:=C2=A0https://www.ssrg.ece.vt.edu/papers/eurosys22.pdf.

Kite=E2=80=99s source code is available at:=C2=A0https://github.com/ssrg-vt=
/kite/.

We would love to hear the community=E2=80=99s thoughts and feedback.

Thank you, and looking forward,

Mehrab


P.S. This email is cross-posted in xen-users mailing list (https://lists.xe=
nproject.org/archives/html/xen-users/2022-03/msg00013.html).

