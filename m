Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122D2E8810
	for <lists+xen-devel@lfdr.de>; Sat,  2 Jan 2021 18:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60841.106699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvkIl-0001wg-Bp; Sat, 02 Jan 2021 17:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60841.106699; Sat, 02 Jan 2021 17:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvkIl-0001wH-8d; Sat, 02 Jan 2021 17:02:51 +0000
Received: by outflank-mailman (input) for mailman id 60841;
 Sat, 02 Jan 2021 17:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/2Y1=GF=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1kvkIj-0001wC-At
 for xen-devel@lists.xen.org; Sat, 02 Jan 2021 17:02:49 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 784a5a3c-8a3a-4005-859d-3438f35e780b;
 Sat, 02 Jan 2021 17:02:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 190so13328460wmz.0
 for <xen-devel@lists.xen.org>; Sat, 02 Jan 2021 09:02:48 -0800 (PST)
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
X-Inumbo-ID: 784a5a3c-8a3a-4005-859d-3438f35e780b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=97OZfiLpa7hHrcgi70K3WiB0fU679GYPjKNnrfgcEh8=;
        b=hkXsjuzPmHv4/UShDPsIYtkaDLDUO1BJK+PymGsykbw8jrsqcYqQwozdb/3UuTyTbn
         IrR1rA54TXL3uCabMC4hsyolnTRa3IY30OWcclwGpYs5wmWwX8ekxYIDaGyYqqJMexx3
         s0iNxcF4TSvNMtfDCozD0rb354ETKPwlEmCEt9p7cs0oR3iuBA63sNZZHsaEsHSgT2vo
         OoOjzg6JFIR3t51fHqHjuOhbMx3ZepMnxvHGSBhPhf6eJkbej6Qzdhq2S+SqXtlh9QFz
         iQhnoWAwBctaWMhx5SKGb4uJ0fGvA/+rLfA2RKehHZKa1/Z0AaZeD2Arc79wrFbLIZFH
         PfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=97OZfiLpa7hHrcgi70K3WiB0fU679GYPjKNnrfgcEh8=;
        b=gMOs91fAqOApl8AUVCBRblAMRD0afliL69IoQFpVRdYemPT+neB9mvXdpf48qHWEcX
         FuT7LJQn0YeTYjGM7QRnFqHFAkORQp/5/iSGrrV7YCi6WcSe9v8fDf+ziNkv0nultOZ4
         wLgddrJs15gi3CE6fD9+VGJjUwEvnz8w6eY5/eDKoGsG+aR2hE4rDPWarD8jeLk8XECg
         OneJfeXRV5LtKSZLmcvykyei1fuYj69MSZaxtvI0gGa0LRfAx1v1xW1sgjpdN5VXvkwN
         aIkxz8R6iT1Giz73oW+ywNRH2gB/7qgGcdKPsnSTNgslux9gXt6czfzDEXBtoTU5XwGg
         12zQ==
X-Gm-Message-State: AOAM532Oj6nGzPdO4cdzrpPzERhBxg/v4yLmvX9cTGAOoFfUFR+Z3baJ
	ysXlA4O4takNUCwoCvWUI3tmYq82brfR6NufYImO1dGtXEtLoA==
X-Google-Smtp-Source: ABdhPJxRocsNUDhSk8uaxc3QQRxSp00BSHCX1Wk5k7ULQKEyFYI5bh9ukaDCljhEpHK22mz+NQ8D5p9y7havQX3zwuk=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr20120902wmi.143.1609606966991;
 Sat, 02 Jan 2021 09:02:46 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Sat, 2 Jan 2021 17:02:11 +0000
Message-ID: <CAAQRGoBko2ksX7s_DvbwK5L82-tLz0YXsV0vqfToZHeODJBtbQ@mail.gmail.com>
Subject: Identify an specific DomU inpecting all pages in memory
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000007ee11305b7edd382"

--0000000000007ee11305b7edd382
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm building some attack loads targeting  Xen to my PhD and need to
identify the pages for a specific guest.
Assuming that I'm able to traverse the pages in memory, how do I identify a
guest (by ID or Name)?

The dom0 is easy since I can inspect the start_info looking for
SIF_INITDOMAIN but I have no idea to identify a specific domU.

Thanks!


Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *

--0000000000007ee11305b7edd382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,=C2=A0</div><div><br></div><div>I&#39;m building s=
ome attack loads targeting=C2=A0 Xen to my PhD and need to identify the pag=
es for a specific guest.=C2=A0</div><div>Assuming that I&#39;m able to trav=
erse the pages in memory, how do I identify a guest (by ID or Name)?=C2=A0<=
/div><div><br></div><div>The dom0 is easy since I can inspect the start_inf=
o looking for=C2=A0<tt class=3D"gmail-docutils gmail-literal" style=3D"font=
-size:13px;color:rgb(51,51,51);text-align:justify">SIF_INITDOMAIN</tt><span=
 style=3D"font-size:13px;color:rgb(51,51,51);font-family:&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif;text-align:justify">=C2=A0but I have no=
 idea to identify a specific domU.</span></div><div><span style=3D"font-siz=
e:13px;color:rgb(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica=
,Arial,sans-serif;text-align:justify"><br></span></div><div><span style=3D"=
font-size:13px;color:rgb(51,51,51);font-family:&quot;Helvetica Neue&quot;,H=
elvetica,Arial,sans-serif;text-align:justify">Thanks!</span></div><div><br>=
</div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><div><br></div><div>Atenciosamente,</div><b>=
Charles Ferreira Gon=C3=A7alves </b><br><font color=3D"#666666"><br></font>=
<font color=3D"#666666" size=3D"1"><br></font></div></div></div></div>

--0000000000007ee11305b7edd382--

