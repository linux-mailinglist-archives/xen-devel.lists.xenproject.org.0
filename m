Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA21DF83F
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2020 18:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcX54-0008MN-P7; Sat, 23 May 2020 16:33:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9iM=7F=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jcX53-0008MH-5y
 for xen-devel@lists.xenproject.org; Sat, 23 May 2020 16:33:01 +0000
X-Inumbo-ID: 10d4e714-9d13-11ea-b9cf-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10d4e714-9d13-11ea-b9cf-bc764e2007e4;
 Sat, 23 May 2020 16:33:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b6so16339140ljj.1
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2020 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqhY+ZxbtADDYEqvt/Yw7Q+gVgjIuXnGiqU33hyjXJY=;
 b=AEmCgZxwQiOVVppAGQVY05jnejhSrey8pQ30yEfoVNh1fKU2bmjfr+Ql5d4doDEzB3
 sMpnKhiBMfWEV4EFdeT7dVqA2jlptqoibj3I7sbHF+0HqaYWOa1FCdLHrk2BGIkX+/pI
 Lv4EvxwvAA0/1GGCoK9Srmg3D17GKIPwsLdv5AZLZPmIhjdxRh2qPZfyCEBb4mdSiwIe
 1EmxJ3UHybEln9bwHKDIDaQYdR9ZZrGmuEo4QcuAcqyLQLjrvIbKyGCxToo2ndEL67P6
 dKcYeufTjNZgqeJICmCJ73OJOpKxb5lcJ6hfy0j0uCMB1ikQoDBCaMJN+tP0bc1iOhIK
 RFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqhY+ZxbtADDYEqvt/Yw7Q+gVgjIuXnGiqU33hyjXJY=;
 b=Jnm+7O8I76aH1hEcPueEBso8T9duA4hjJfRPYmXju6d23Z4dEUE853dM+kXBszg9Ai
 DYRqO6LVcUuwPBo9QEPddg8nqLYjxVJoLA14i3ednvod5bYLAujfUKgP2rVYDx/2I4ov
 cX9EvgmtAmvAaGP8Ur3j+WimgysDjxq4vbip9w97NJl91O5FwlObYu7gXpZjBHePuMye
 BQisZ0Tz2gAmeDVcJobRc8ktsynO8HXa61G33t08jDvfPXGaoHRi4WoRVJJY8hqHuzgK
 DSEphut9/7vty8eNs78Qj0cGubDujiz0SnNqNb8pD47E/rkz+UsUTMOtltX6xSh6PnTn
 gkEg==
X-Gm-Message-State: AOAM533JfoMSxrwU9+MCutyLVYo42XVHXMW2S7IXduXX1fc/yMG56jKc
 7NuraICu+VApj5aCPlNDRrk9ZBV1WxKocxeBukw=
X-Google-Smtp-Source: ABdhPJwDRIon/jS0FLkKJumGGLKDVPgCdISoAaXFR+SvrXX7dy77CM6RHvi78rMdsOoNCMYpqZVq3S7JD5oPJ0y5bFA=
X-Received: by 2002:a2e:96cd:: with SMTP id d13mr9390790ljj.219.1590251579687; 
 Sat, 23 May 2020 09:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-3-george.dunlap@citrix.com>
In-Reply-To: <20200522161240.3748320-3-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 23 May 2020 12:32:48 -0400
Message-ID: <CAEBZRSdiCBWf-axqqYy156b8=2191kRgFuFKWTXRm_YBzZH+WA@mail.gmail.com>
Subject: Re: [PATCH 2/5] golang: Add a variable for the libxl source directory
To: George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> ...rather than duplicating the path in several places.
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>

