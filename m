Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74C25EAE3
	for <lists+xen-devel@lfdr.de>; Sat,  5 Sep 2020 23:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEfKN-0000wi-Oa; Sat, 05 Sep 2020 21:02:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Oyd=CO=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1kEfKM-0000wd-F5
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 21:02:26 +0000
X-Inumbo-ID: d483f6c7-0d6c-4a1c-93c2-8dff07812f9e
Received: from sonic302-3.consmr.mail.bf2.yahoo.com (unknown [74.6.135.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d483f6c7-0d6c-4a1c-93c2-8dff07812f9e;
 Sat, 05 Sep 2020 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1599339744; bh=U8n8sACFN37uSjgGFbYYSLt2CYFq+5FASN1S8Rl75LE=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=c9cv6k/E5ssMEjcG8iN9x2XOD60GHwTdND2/z+T/kWpCBoq1d5VxMkopafURnnHD2WhCk9oL3fFfP67TThGAc1IclHaHIYyOTaomqGEUuKEnOCbPkEFgxCr2hPUTlxT55ElISKpyO+BZcwJJxU+Erbe09Fc854YObM270Zn3G139behTfpYX1vwlqqtsJULnXFEUgOZvLabBUZi4JRYux5BkxTRedlRxBEVJWhpE/EnEw0zWZ2opEpFhApSTcA3GwD64iIbA7fyFwVTSvNC6iTgH+3w68MhQKpLl6vCtraWvhc2XndI0Lv+y/xBYyz6TVVV2qnevvLtdqNrDun2sCA==
X-YMail-OSG: _JtgBvMVM1lSRnLt.gUT7Xq3HznvdS9HINH4fA_FeNPTz_o1zWKZbEt4Bw2E6FQ
 tgv.W1QJfIyCwD2CUwA1bQr4RvmRfLzz1KGu8nbxX9iIzXNb.TwOGPBXKS94sE4m4A4yy9Tj5OM1
 kSH_r_nD3ENkPkpxBUid8ApCd0hsrtsWc8QPNlnpao1rlkV_s5NXtBOYZGGtTb7D9EVx2q8J9vsu
 RvR9RZDtre2Bz988h99xknM6ZM7Ipf8_CfFN1syCu_FJKJnjAnC1AnnHdrPwbAet7J93T5KwpiS0
 WLrPOaW9MawLO2W6WU6Kxhb7tMAVUk9jUik.rfq1bAIT3OgT96UE0FmaiWe8_GSYtHcKF70N14MR
 ZcKiwMEBWLee5UluypDk_6iQIAo2BQJDH6k7awCNVbam7Vdp5eO3nsChUJ00iG3hRiUSHV0bx8AQ
 FrnLZKUDbs8IZQkJvy7Cy8WyUXD4JfmjUqolE2PlJtkj2ey2wQUJBk5ntJSvTRe9mRWPg2qDrD12
 AljNZQCPYIk7ebdcIMM3.gfwdcQNFpev9YD6pco74WXKbGiELYRPv77d9wHrybXmJOLkD.ht7KsG
 niykb6wG8A8UP5357kk2CvCw2cmLawYCAWnSmQxWd5dO.0heoS6_IK8LyMiIsVQamDggTf9E6CSH
 Ks7GZRXWW.zgvX0OHEfmNLOEEI7ynj1QTjq6XzU30ilYXpFciJIc_2kb52hU5F49gNsRx4Yjx8k3
 YRuofxURfat6nlLlaYyWL4L4GYC_yUNLQoAs9uRw.MyvtLNKwSX.bY1rVZ2ZpYtG9KZpuIDbveQQ
 y6IM7aM9nLXgvVxnsdUuWcpXfBh5Ey0niwcEKp8EIMDcrF1UTyfbg6dYcQsAuM5mWTu8mz6kBOA9
 QljXM6sap5mcvYYTgY3n8fphdAH7ntk_hbdizKbrSpfsqJO.yrx.iIXD_g_gGlEFwuK8lAdGxdwU
 kOB8CvcZlKUTAA3QtYN_zdFuh0fGpfo5v0MSrIxEcUN8XNp9KcmopVMXB9M3KBZ9f5yQX_B3mISI
 Jbr2Id.j0shPBiAZ.EfmUFoKe9B.0MGEeVj422SmAWR0ysAcFqq4z2tkfBVYk8QuawlmUNoi0uzT
 15.FYBRySkkgIKEzifpESTB_X.LrJn4So8lPwgqhQ4yBmBTj7.HSROB.390BE9XskcxPrZFzQYIY
 5Zn5Y3kDC1xM7v2YxuSI5IRQgg8.XuLq7VHVeiIICu62sYfUVCVicmWezH0SSSSr5Cp8vu5lRRGE
 5K3287FLUjXUEwikdAehyg9vprApaV0za0RJ87bZpjzsPd5Qb5xdVEjg1ARztR6870O6_hP_1F8B
 uzazrrvZATJBFtlSTLIMc.1V.erDjMTSWmSrL0KJgqD5f.AjZ1YzT_bseg4HUxFXD5R58XqYBAf7
 iHErvr3djLQzTluNqSo8kt1lCaYq1YyAygIZVzIHtEyDhsyZ4nOhMwcg2N1X1yk.x8qMj.6OAktL
 2UjDs9q.fwyCUAppN91wnXTXFjxw4Mmpy2ka1_lBzJriEBxZpiSwSDqBJBAvb7NxVhmNq_YcTPA-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.bf2.yahoo.com with HTTP; Sat, 5 Sep 2020 21:02:24 +0000
Date: Sat, 5 Sep 2020 21:02:16 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Ian Jackson <iwj@xenproject.org>,  <xen-devel@lists.xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, Costin Lupu <costin.lupu@cs.pub.ro>, 
 Wei Liu <wl@xen.org>
Message-ID: <2069094130.2730817.1599339736305@mail.yahoo.com>
In-Reply-To: <20200905181222.6g3vrkwadua2pmo2@function>
References: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
 <20200904160034.11456-1-iwj@xenproject.org>
 <806680552.2537432.1599256902267@mail.yahoo.com>
 <20200905181222.6g3vrkwadua2pmo2@function>
Subject: Re: [PATCH] minios: Revert recent change and revert to working minios
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_2730816_1548121324.1599339736304"
X-Mailer: WebService/1.1.16565 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.10.5; Android/7.1.1; NMF26F; bbc100;
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
Reply-To: Jason Long <hack3rcon@yahoo.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

------=_Part_2730816_1548121324.1599339736304
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

What is the difference with Unikraft?

Sent from Yahoo Mail on Android 
 
  On Sat, Sep 5, 2020 at 10:43 PM, Samuel Thibault<samuel.thibault@ens-lyon.org> wrote:   Hello,

Jason Long, le ven. 04 sept. 2020 22:01:42 +0000, a ecrit:
> Can anyone tell me about the goal and features of Mini-OS?

https://wiki.xen.org/wiki/Mini-OS

Samuel

  

------=_Part_2730816_1548121324.1599339736304
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

What is the difference with Unikraft?<br id=3D"yMail_cursorElementTracker_1=
599339703316"><br><div id=3D"ymail_android_signature"><a id=3D"ymail_androi=
d_signature_link" href=3D"https://go.onelink.me/107872968?pid=3DInProduct&a=
mp;c=3DGlobal_Internal_YGrowth_AndroidEmailSig__AndroidUsers&amp;af_wl=3Dym=
&amp;af_sub1=3DInternal&amp;af_sub2=3DGlobal_YGrowth&amp;af_sub3=3DEmailSig=
nature">Sent from Yahoo Mail on Android</a></div> <br> <blockquote style=3D=
"margin: 0 0 20px 0;"> <div style=3D"font-family:Roboto, sans-serif; color:=
#6D00F6;"> <div>On Sat, Sep 5, 2020 at 10:43 PM, Samuel Thibault</div><div>=
&lt;samuel.thibault@ens-lyon.org&gt; wrote:</div> </div> <div style=3D"padd=
ing: 10px 0 0 20px; margin: 10px 0 0 0; border-left: 1px solid #6D00F6;"> H=
ello,<br clear=3D"none"><br clear=3D"none">Jason Long, le ven. 04 sept. 202=
0 22:01:42 +0000, a ecrit:<br clear=3D"none">&gt; Can anyone tell me about =
the goal and features of Mini-OS?<br clear=3D"none"><br clear=3D"none"><a s=
hape=3D"rect" href=3D"https://wiki.xen.org/wiki/Mini-OS" target=3D"_blank">=
https://wiki.xen.org/wiki/Mini-OS</a><div class=3D"yqt8791032102" id=3D"yqt=
fd48463"><br clear=3D"none"><br clear=3D"none">Samuel<br clear=3D"none"><br=
 clear=3D"none"></div> </div> </blockquote>
------=_Part_2730816_1548121324.1599339736304--

