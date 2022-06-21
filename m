Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D500C553478
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 16:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353294.580223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3erS-0007DX-HZ; Tue, 21 Jun 2022 14:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353294.580223; Tue, 21 Jun 2022 14:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3erS-0007B7-ER; Tue, 21 Jun 2022 14:28:10 +0000
Received: by outflank-mailman (input) for mailman id 353294;
 Tue, 21 Jun 2022 14:28:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTzQ=W4=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1o3erQ-0007B1-Qa
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 14:28:08 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9b05cd-f16e-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 16:28:07 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id a13so12818316lfr.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jun 2022 07:28:07 -0700 (PDT)
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
X-Inumbo-ID: 5e9b05cd-f16e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PCxBILTJ6Zk898i/dve3lPvaQBDYqprK1gvRHYGVzwU=;
        b=iiP+5n1f05rH8piEJi+CE0TSr6c4cwnWwQse1HLsRXdejg8u5MeL3LFySKinCsFj07
         xiLQxtBVkebtNwAIY3KBtbIXJsD9gdPLt4Zn33sTQkIDDtsBad1nr6ruZ7qgrz2V5O80
         c7RXBQewM9mx+akwGxUkjGe3Md7mLKGF+6ek7T3o5x43TrO1hrnyYNBi8hYous96QCx6
         R/cM+CRBrP22Y+cxJPYFke7aY96abSfdLxAD5w8XouToGRCh4GWNQlVB5RVUWdMSTh7c
         9S9GkHmwSxRFqlxwYnWF5gbuSiZX+qr16/UNlLdb6fzBSjgUmlGYU/3mEsBb6m9J5Ei4
         55/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCxBILTJ6Zk898i/dve3lPvaQBDYqprK1gvRHYGVzwU=;
        b=UAFvicmRjj38pRwpVdvkdD1MQLspbAoxSOiPn8Fd/zn6tMV7dT4Q975aaRjX2mTSi7
         tLtuecERAlqUJMgIJ6UWRsg1r3FQ5wE9CQ9pTvpKE3o1cwFQ8wGtHFTREmDgJlvxuSBH
         ZTKYu7mZZz2+bhjaUpf0TuUnUJxzSbFUg3xXADOGhtgZgF1HjWRymet9IVHe5ual0xC1
         I4wzfH75/LIyZ+cLD6FHKBocAKlRWJW/Zkl2SyjEycOpM2kzZy2Wyjw2+bJCyIGSpdQr
         KkqzdN4DjzCyUMUSCWt/agMOI4FmvSkc+Zm+AVqDpUL/GxeXh1nyW/A5iWXSjhNb/T0Q
         AKtg==
X-Gm-Message-State: AJIora//1AzUIpqwmWv98I4gSBDEAJR7jonU6FJx65hJqv7MCaXwehnn
	EfqtdgqrU1sOloSifaUbFbiCpnsmVuzpTTSoPb8=
X-Google-Smtp-Source: AGRyM1tU3cBRt/2PW4G1D3qp9GYb+SczjsmtJ9Fm4pT6vj2XGhL9y29toCAjdZazO5Vob9Dr9j4HwVhsBmizVs7FCg0=
X-Received: by 2002:a05:6512:401d:b0:47f:654d:e48d with SMTP id
 br29-20020a056512401d00b0047f654de48dmr9001183lfb.359.1655821687295; Tue, 21
 Jun 2022 07:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220620070245.77979-1-michal.orzel@arm.com> <20220620070245.77979-7-michal.orzel@arm.com>
In-Reply-To: <20220620070245.77979-7-michal.orzel@arm.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 21 Jun 2022 10:27:55 -0400
Message-ID: <CAKf6xpvQhq4LRPqnxLnEgedLhz3Zrfdp2daVBTpEm40SWRnz-w@mail.gmail.com>
Subject: Re: [PATCH 6/9] xsm/flask: Use explicitly specified types
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 3:03 AM Michal Orzel <michal.orzel@arm.com> wrote:
>
> According to MISRA C 2012 Rule 8.1, types shall be explicitly
> specified. Fix all the findings reported by cppcheck with misra addon
> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
>
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

