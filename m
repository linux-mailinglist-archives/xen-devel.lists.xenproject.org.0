Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C87486360
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253891.435189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5QX9-0008EM-Uj; Thu, 06 Jan 2022 11:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253891.435189; Thu, 06 Jan 2022 11:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5QX9-0008CL-Rf; Thu, 06 Jan 2022 11:02:15 +0000
Received: by outflank-mailman (input) for mailman id 253891;
 Thu, 06 Jan 2022 11:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qsn0=RW=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1n5QX8-0008CF-DK
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:02:14 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1927279b-6ee0-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 12:02:12 +0100 (CET)
Received: by mail-yb1-xb30.google.com with SMTP id o185so6156167ybo.12
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 03:02:12 -0800 (PST)
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
X-Inumbo-ID: 1927279b-6ee0-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k9A9go9a2p//XCfC1lqlfiFDO5x8dgJoDuJqL8exbII=;
        b=M/ulQOZZLNR9GY/KH7dikHtVb7SZ/t6RJu9ZjcKnq+nvIuWr8fwzPsXSychEiAFj19
         vYS4FdCfecDrZaj5TETERu3LRzEiF+ZQbJcH21RLvETbBfD/An2aXf/h+s2PCr6pte/i
         Z0MsIL7H9dcdfPSTZ89Mv9txJuc8tdMcft8bsxxEtvsA5KGhTuhboKmadoJZ2jKMLaL0
         lJtJEbbHxak3XsuudXkJEM1+gRCMswMTLFG4K1HMOKgP91Ft5TLZIin9UPlDfOA6Kv34
         pQ2NhsTLP4eQUcTAalILVdFTcTu83zs8xrxtqSitP3brslijPHcOHs1n+2jo/xdJM6Dt
         AlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9A9go9a2p//XCfC1lqlfiFDO5x8dgJoDuJqL8exbII=;
        b=cceGhPzCnsxVy8EwYG38/dZ21C62w4rZqAc6dUBnvJksa35D79mh4+0hewN6p4EBPJ
         PCPbq36IPOuhPo40gYO7+Ia8vw2IZRK3yr0xdo1hIbQ3CureGE4JnDJZi2yyI2tmg665
         c2NFSjiw5mKJUytW8nFHfUMe7NvDDUMctqSXZteP+9eKceOXzhPuQ84K7LJaKOLOE+eH
         LeEs47Z25wJeRx45VL4wO/KjSJkTNdyoPx4u9TqanEH7akbJxNLN2joSGxqfdTaBZ/Je
         mq8QRgPeUrL02FRVXx5wgjJi6GIrTIdL8HLdrVIYFNYPV76JRQU/76hMe8DALtaRZKhb
         3Tgg==
X-Gm-Message-State: AOAM531MuRTEWyL1oLUdgwCyrRgc/rT8eIUAa6xLTSHprGTOsPp9QDEP
	JZ/ySqOej9DyZZOE6oY6dkPhrFUvUygP9bP5ZTU=
X-Google-Smtp-Source: ABdhPJyLzm1+tp8oP4Hz+lTjuB+jCGyhVwziiT1mEoNAz6vflZIS6dXTn2WOEzr2rAKNRKPhaP6sqy9pNzDTDb0ALYA=
X-Received: by 2002:a25:414d:: with SMTP id o74mr27466yba.158.1641466931081;
 Thu, 06 Jan 2022 03:02:11 -0800 (PST)
MIME-Version: 1.0
References: <CAN2gxUQmsa=ONQqj0-3PZ2oxp-QVMgsm0BQ+q=-LWwmWTqwMZg@mail.gmail.com>
In-Reply-To: <CAN2gxUQmsa=ONQqj0-3PZ2oxp-QVMgsm0BQ+q=-LWwmWTqwMZg@mail.gmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 6 Jan 2022 11:02:00 +0000
Message-ID: <CAFLBxZazbQUF5bXw=yxM7+48KVVz_rJoi8UWrH83Ln-j40u9PA@mail.gmail.com>
Subject: Re: scheduler credit capture
To: amir masoud noohi <highlimner@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000056753405d4e7cd12"

--00000000000056753405d4e7cd12
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 5, 2022 at 2:45 PM amir masoud noohi <highlimner@gmail.com>
wrote:

> Hi Everyone,
>
> Today I'm looking for capturing vCPU credit for both credit1 and credit2.
> How can I do that?
>

Can you explain what you mean by "capture vCPU credit"?  Do you mean you
want to log or sample changes to it?

 -George

--00000000000056753405d4e7cd12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 5, 2022 at 2:45 PM amir m=
asoud noohi &lt;<a href=3D"mailto:highlimner@gmail.com">highlimner@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div style=3D"font-family:trebuchet ms,sans-serif">Hi Eve=
ryone,</div><div style=3D"font-family:trebuchet ms,sans-serif"><br></div><d=
iv style=3D"font-family:trebuchet ms,sans-serif">Today I&#39;m looking for =
capturing vCPU credit for both credit1 and credit2.=C2=A0</div><div style=
=3D"font-family:trebuchet ms,sans-serif">How can I do that?=C2=A0</div></di=
v></blockquote><div><br></div><div>Can you explain what you mean by &quot;c=
apture vCPU credit&quot;?=C2=A0 Do you mean you want to log or sample chang=
es to it?<br></div><div><br></div><div>=C2=A0-George<br></div></div></div>

--00000000000056753405d4e7cd12--

