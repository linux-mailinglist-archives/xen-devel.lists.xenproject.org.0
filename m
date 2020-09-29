Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D207527D3FE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 18:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310.861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNIvo-0001YR-3A; Tue, 29 Sep 2020 16:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310.861; Tue, 29 Sep 2020 16:56:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNIvn-0001Y2-Vm; Tue, 29 Sep 2020 16:56:47 +0000
Received: by outflank-mailman (input) for mailman id 310;
 Tue, 29 Sep 2020 16:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNIvm-0001Xw-6y
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 16:56:46 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5fc9d71-bbd8-432c-aee2-4aea6bafbc83;
 Tue, 29 Sep 2020 16:56:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l15so7048424wmh.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 09:56:45 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id h1sm6814405wrx.33.2020.09.29.09.56.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 09:56:43 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNIvm-0001Xw-6y
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 16:56:46 +0000
X-Inumbo-ID: d5fc9d71-bbd8-432c-aee2-4aea6bafbc83
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5fc9d71-bbd8-432c-aee2-4aea6bafbc83;
	Tue, 29 Sep 2020 16:56:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l15so7048424wmh.1
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=Cm2kWyK0ClUe2Oj+pUvI6Z+fYgMNGqB800e7/pc7QYY=;
        b=RkDNNn/hb1+nUav4G+IwAhaCx9DEu6Ku8lFcmKf3MDiz1pmVHBqWfn4CcsKFJrAWxp
         RRhJG1THQkoMWZuvhvR/ENH44Vm9sqfbylPRojEC6aEy5IxKijFoshNIxYMrSIKpWolb
         upyw4aMW8UcsoB9bp0tdhVgukmc5xCq3yYnJD9K9F0Ue8hAdCnkZ5+8wJ43mleKehCPU
         rxlwxrjHpmHFmJYB3o/Kc0imX3jCw2SBUK4jbOkHBN47b/kD5RL557Jo6RoUTIwanSQY
         jaP8E/tHwjcEM2C7oQl+XMqY2rgCuaf9vwRgM1KtkghFpQFrytgXl89qES2ll1lCyTk6
         areQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=Cm2kWyK0ClUe2Oj+pUvI6Z+fYgMNGqB800e7/pc7QYY=;
        b=NheXzXw2ay0i1/rXccb3jiWDXbmDFAhBbEnnzbOtX7zPQQI8DkAYFQvi5ylkgOfuQ7
         Jzjl7bD1uGn7eg8+dGUbPVBktpBIWJImbdC+0f2+oEFWHB8oaBiX3LfOLS9PXzL82WVy
         1Hx+/GX/EMX2pPehtydXPqxhU1WrFmfHqPjS6RUXSsh+drHCVmQ63jv9JhAQRCjLe+6q
         8FYV6q2CZFqX/c5mG5lowTUKdClxnFwQuCFfdkDzeNY42mbpjGvR2Uxdb1+IY8LePOeq
         c32S012dnIaGj7rHDkRKw+RylV/Y8irbYhHFPMl45E/m/n9GoyS05yMf3Gu8Io2ZOZYf
         7OXA==
X-Gm-Message-State: AOAM531i/PqCwU92+Bt8vHNeDRsgEIPgg8UL0+qH/zRy4zbnzOdFAmPA
	9aOMw4o8AQ2hL7K33zerFN4=
X-Google-Smtp-Source: ABdhPJx6Ns/29DjJ/HPzESi6beU/hQnv/BKDlqoJHKb8XuHA88x3fHC7uN6dgD9rvnjOPMV0Iq0sYA==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr4287663wme.157.1601398604498;
        Tue, 29 Sep 2020 09:56:44 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
        by smtp.gmail.com with ESMTPSA id h1sm6814405wrx.33.2020.09.29.09.56.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 09:56:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <eeb0f674-1eb5-85a2-70b2-42041588e3d9@suse.com>
In-Reply-To: <eeb0f674-1eb5-85a2-70b2-42041588e3d9@suse.com>
Subject: RE: [PATCH 08/12] evtchn: ECS_CLOSED => ECS_FREE
Date: Tue, 29 Sep 2020 17:56:42 +0100
Message-ID: <002701d69681$828af260$87a0d720$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgE371Y+qT4EGGA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 12:00
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 08/12] evtchn: ECS_CLOSED => ECS_FREE
> 
> There's no ECS_CLOSED; correct a comment naming it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Paul Durrant <paul@xen.org>

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -673,7 +673,7 @@ int evtchn_close(struct domain *d1, int
>               * We can only get here if the port was closed and re-bound after
>               * unlocking d1 but before locking d2 above. We could retry but
>               * it is easier to return the same error as if we had seen the
> -             * port in ECS_CLOSED. It must have passed through that state for
> +             * port in ECS_FREE. It must have passed through that state for
>               * us to end up here, so it's a valid error to return.
>               */
>              rc = -EINVAL;
> 



