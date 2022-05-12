Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445052559E
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 21:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327941.550827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npEKK-0007tZ-ED; Thu, 12 May 2022 19:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327941.550827; Thu, 12 May 2022 19:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npEKK-0007qT-B9; Thu, 12 May 2022 19:18:20 +0000
Received: by outflank-mailman (input) for mailman id 327941;
 Thu, 12 May 2022 19:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dtm=VU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1npEKJ-0007qN-0c
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 19:18:19 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 475d87a3-d228-11ec-a406-831a346695d4;
 Thu, 12 May 2022 21:18:18 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id g16so7733639lja.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 May 2022 12:18:18 -0700 (PDT)
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
X-Inumbo-ID: 475d87a3-d228-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=riqmD/kfk3ZGrDs8qmxhxE5Xqu6b7BXfSjbZUAFzPAo=;
        b=VLQIynJDxh/UuJkN0mk1Ik7JttoYDQOPA6Nw/QLts0X7A8GPmJz1NlYftPx8SaKmlU
         uTFxe3Y8bQPVxIaPu5XXkg3DEcI2t/lvpueqRWDQpEuwaWM08MKk8GKDOzZEsu7bnxNZ
         BV2BR8f5nfpOzEf2bKzdUhEezwiHdcYqv31KiYe5ICboAVYYKBj1+712S7HDdycQDkhi
         S+rvfqhKslQAC8vhUsLNVJJ0ufmMqvwqcTrPExf5cuUk7RDFLF8Pu99Uf2Byze0V0c3k
         6Jtf2AUBq2UDOMHuq2KkWgI75C63uDVVFyz0LMhd884zDnANh2MT3O9VjwJDfzsBwyBG
         U5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=riqmD/kfk3ZGrDs8qmxhxE5Xqu6b7BXfSjbZUAFzPAo=;
        b=zC4/LnuM4sTHV8vr8yT3y8+rgJChCZ/UXRPVj3+1W5T0awH8j/Ls9OwWWU5Bk5c+Ew
         rBPmpUmqigba5tYFAm6yvit/DE75EQ4iZIB+2h0qHxxsEZVoKIGb3Xi/hrqjmCnPX9lQ
         W/OCK0CyqqaVXbt+GItuiihFYs9qeMCGcJK+y95WsUlguiOSg+zOlSg9ewWAtrjGxkeP
         JiU3IhJljOx6SHIfKEEsK5jMLIz2Sc8pVfokF7z5kGLCsMUfD7zpwaK0ULcxImJQym8H
         JQHIlJyX4Gkq7/Xx7vUBpCRndxSRLjesr/eVrhEJI5NzzsZsz5vRksbP6k5VXNhN87+R
         MDxg==
X-Gm-Message-State: AOAM531TLMq7y4iOpUhRBPMv/99FXi7MGiEVUY/GiBcJE6sen6zzr/TS
	QqcEzNWOMsE6t5RSxy0UCpKSTeCK21cmu5o/MoI=
X-Google-Smtp-Source: ABdhPJxp93y5ap4XVRNsM/p/G2SfMmPRd3Y7VkOcfi8WtT2RX91XvuOyRZ82+ycXNaC3x1AcGfBKiKOMOTfaQqjI7ys=
X-Received: by 2002:a05:651c:1548:b0:24f:4dec:7676 with SMTP id
 y8-20020a05651c154800b0024f4dec7676mr877628ljp.459.1652383097582; Thu, 12 May
 2022 12:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <YnwNjgtWtKaVLIuu@mail-itl> <CAKf6xpt8TeRYkbG3p=trqWjsw86sahYV_NKVPxergjsu7orocQ@mail.gmail.com>
 <Yn0SzjiwMU32Xc0z@Air-de-Roger>
In-Reply-To: <Yn0SzjiwMU32Xc0z@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 12 May 2022 15:18:05 -0400
Message-ID: <CAKf6xpt+7-YgmW4eiQRcZHk6GZz0dT+8=nb_hp_S_DYDg5MSmg@mail.gmail.com>
Subject: Re: xen-blkfront crash on xl block-detach of not fully attached device
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 9:59 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
> Care to send a patch? :)

I will, but because of $reasons, it won't be out until next week.

Regards,
Jason

