Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B067D439
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 19:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485189.752224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL70y-0001SJ-Sb; Thu, 26 Jan 2023 18:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485189.752224; Thu, 26 Jan 2023 18:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL70y-0001Qc-Pb; Thu, 26 Jan 2023 18:30:24 +0000
Received: by outflank-mailman (input) for mailman id 485189;
 Thu, 26 Jan 2023 18:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/FI=5X=yahoo.com=hack3rcon@srs-se1.protection.inumbo.net>)
 id 1pL70x-0001QU-4I
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 18:30:23 +0000
Received: from sonic306-2.consmr.mail.bf2.yahoo.com
 (sonic306-2.consmr.mail.bf2.yahoo.com [74.6.132.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c38155a-9da7-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 19:30:20 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.bf2.yahoo.com with HTTP; Thu, 26 Jan 2023 18:30:18 +0000
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
X-Inumbo-ID: 7c38155a-9da7-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674757818; bh=xGcwb2Lir9gHeBMb8n1Gla1tLvlag64G3DJCpjlw9w0=; h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To; b=bDDVHk9XfOmYrva6H68sniGnBua3IoY3V6oN/HMadHDFn66Pq94tu25e7aMquqekqBW4+H55VmWFPNjqcEcHkzt53S7AfVKgqStzwD5LU1LwBu4AuOljK7P7dlJRgb2y6mfKIU791ZO30UUVZbYzRLGkLyDO7W9yB0zEnzHCO12196P7sjIw97l8NdEOGIB9aDOZ6WKC/XRTzAO3b3z/BZ3/6eyAVsECpGckkpWa4oLsEzVJ4JiEFJPHeZtvxVT5xB8p0jpeczYKLmkGK3dDEUhmFHrJEEBULtJCWnUuMS1NHyVlfLYoNI1w/XW0SDBxQ+np9lxDy5qP4flz5RPMAA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674757818; bh=sNeXBtdZp2cbMl7i8rfeKa+JLG2d67gzMFaCZF5pBdg=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=twJND2pGV1fo1WTO9gQKtSNKDP/9TghVpM7UGaTCPsTTif9OSYaRlhrM4BLRF5KpJpeFlTEC/EcDQe5N6s2qiI+PBl3EcapShPWO5XH12J8CEUlYXIgid27horq3w992qAp+l7hAeTW2OcoEPgYlBPAfzCTj0eQq34yachzMTGkrhrq1rWe0+tatJ0aTjz0uAZLbwz0R4eqqUKvT3M9bq10mFPVSCIpUHe2Knm5FXFYzNy9vrW1RyZr8wsiAl8j2YKg0xKg+BROC7tOn09Gsn1eHw86DKcyBAj5sG2/FpyJYjbFMrBvvBHdsykrWWVW52oNBtrX+c23H3OOhfxQ4IA==
X-YMail-OSG: 2zuozUkVM1kVEl9tFD7uBA7wo7Hu1XXSt3lG433MVo95xQ6moEivLXfUVVC2BYu
 zLpsGtxPsou.ilHSSTkGd69Cv3Fl_mMqugsuIARViFj5W3OJbMapJGBTSdUukUxR3Elak2Cl7Pf1
 bZjTN2TBaNzyXzj4ed6UFrO89b5hdUmPg7EP4rEUY2ap02Wr9iOiLT2388w_T81j9u9l2tMpz0VA
 Rh_IDdqFE0jbqMhp_yL7a6mftJX2ysP_f5dFSKL95LRuZOqzhgglSr7ZrGa2VuhQB.aqcF0I4jZN
 giaDrYGyDkCv7.gNBK1Jmxkh_L7xe_ON726Vz8TNL50.ZfkEihWOZwRhEcdUaIspHb0b_VC.R1kG
 MrRJP8Qpn6_iph8vvY_zBn0Da9aJjDbfw3kNyFqWDZZcBkiWEQEvRoShdQTnLmzaxJcHjXmiJpFp
 VpyzN6PfCddFD0guhKPjbZVIMKjFQTsf5kIB3gF6HKf.z63xQZJFWZDgaY8YCZu_rjG9_nxviXle
 bZw7fozKsU9KR1WWV8uh1COWYsPIlRoTZqgGYvRcdvcazsftxBfTqhkrI13B60g_1HBRZVo0L7pL
 lY49y268TJzkQCc4InBN5UyczgpebrmSw_BqoJi3qJ71KUkSybTHAa9haycNjHwZS9.cE5pV6Ugy
 hBy8kxPJ4dcBW_Qu8N.aME5sVG5rvyMmXAIpArzltEX2IJ9XzuXt3jEKQOoWkLD8rjJx6hUhpx4a
 FzYtE5cWiMG_5i4ybJoItGo3SoJKUzIn24uq9Af.d9JFaG9bwTOrn4H0BWc7DjJxZBqkcbHtyvzT
 1yJSI1xMLi2IXx7vu60470RpcAZfKdToo485vc7JvGJwsXKfhQ6jk9j5UW3CyuMszFyY1kDRsHEs
 fP8zXxDoCC.IYJ0MusApdHkgt_OirkfIvWX81qqjPxD8q0pf5Gy_ZfNR6qyZhMwzxSgTvYVLzkrH
 iSu05U86yN3kGsGmMVzD2WYN7TbdAk8TvmFjUPTwYD20RuVnptxavyYU7GQTxIPlLGjQakLUCh65
 a7LGQIrYwCxAn1ooIh1ynIJqkGcWEdRVkM5YdTWgHHMYQ9RvTTlt2Ga._d2Sn2E9Z.RkLT1Ce3uI
 MgRpvh72c1j2P3HvUXFuDGLvKrF.kukPYQIyMdVm4KtfK9sMAu0Ey_iQ_XAbvQNqIKXSANoYF5x_
 wsAciIFUpi7s1Eglxibl1IjburrFgVbTJ9Wd3ORI3B_oZCambzbQMmo6DVFkGTr40hcd_iVcLLls
 ELdBJcjq9bMT2Dt2zp9_FslrifNv6Yo6yASfAEki29yLmEyHuWwj7oQtOJCPOdT2AMTAsG9S1Uff
 yU4r1G28OvKZWK.onB9NdVMJ3M1qmxWokaRt_V5KRNrbrO96ysdumFYDUaH1N_UQffY1ivFVe1BN
 IQ69ZmuVn.VTVGbtg3AiQZf86gRZXF1iGoRMJLUNEg0GaTlykpXwZvuimVNDHIwPC_k2LGLF3Xz6
 .9tggycE4Cqy6fIDnAlICdqwOAUfojurIc7KcN.v2ujzUPOYbHOTESykr2y7C9evBZBHlyqBOWgC
 S5VWugYNcXDwf7NK1a33FSAaZTQYIp_oI9WdgHY6TS8sREnJ398RQ.BPasSi9.0LF05T26g0TFt1
 uiBzZBLA8f4jdukCHAbrGpx8Wv.aAxyZqXcqTPwT27vARgJgUA34uXE_nAn_WHgNLaBolYEHVmrQ
 oyVvLyusCXydvca7Z0Ek66mZJq3.mHlSGsM6jNZZcrlQDTCi7Nz6rQBo3H_TJ.X7tjxpJaDYQuV9
 nqp0oFccDmlYPJE8AyPjT3WSgcZVQHWgdgY0yfbsVXUc_So_ACPZjGqbpHuSMnHM7nGzKWnaA0s2
 jURLrWcmEaxgeQyh4wxIKbJOL0fHamEp0j9cTrfqoAtUiEKW5jX5MSpsqRQkrcbfLUZTQFOGEKaL
 Asz.UvrTZRxHqhIFbUGP5YtB.dciabm5I2a7yb6n1_kd0PYF4darkIAdvWP9uzPFqouPT8leebuh
 LgwNqWgLqZqiGKq0RzLJZ6YPHnt4QN8NG_ciP_e6YThPkzIB7sihFj9n58gho3n3RkiV2vAzcp7j
 PatRy6QZaxgYPkVcAA.Z8GIE0xF6lhaLufGavUprQQu6vs61yVPv_CCB2z9IP4ggYBI2fF.PxbLU
 7Paaf9awF_smgRC1iBTDcZ56KqZKRxjZCwbXpD9qJuIgmTOvfCodTku2sbw6K89RgaOS29BtYFM9
 PVwWFO.g5g7BE5AM9aXKKxOZa0SDnAvb_pPNZWXtd28KWfhXpLSVjGtGbar3MFFjtKMP5fD_dhiZ
 PeYUKo2heZwRcuuyCGrr0HjmkpCMMMUAjyYoBDwGp
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Thu, 26 Jan 2023 18:30:11 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
Reply-To: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <907082531.1459240.1674757811189@mail.yahoo.com>
Subject: The re-architecture of Xen
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1459239_246279745.1674757811189"
References: <907082531.1459240.1674757811189.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21096 YahooMailAndroidMobile

------=_Part_1459239_246279745.1674757811189
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,Doesn't KVM need re-architecture? For example, Dom0 consumes memory and if its number is large, it causes waste of memory in the system.
Tnx.
------=_Part_1459239_246279745.1674757811189
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<div id="ymail_android_signature">Hello,</div><div id="ymail_android_signature">Doesn't KVM need re-architecture?  For example, Dom0 consumes memory and if its number is large, it causes waste of memory in the system.</div><div id="ymail_android_signature"><br></div><div id="ymail_android_signature">Tnx.</div>
------=_Part_1459239_246279745.1674757811189--

