Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0791DF83D
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2020 18:31:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcX1t-0007Sw-9i; Sat, 23 May 2020 16:29:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9iM=7F=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jcX1s-0007Sp-1I
 for xen-devel@lists.xenproject.org; Sat, 23 May 2020 16:29:44 +0000
X-Inumbo-ID: 9b341980-9d12-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b341980-9d12-11ea-ae69-bc764e2007e4;
 Sat, 23 May 2020 16:29:43 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w15so8231878lfe.11
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2020 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4UfA6yGjbjJo0RoiZsoNurp5VKfjqBLnL5LS80IK8w=;
 b=B84jTBIXtn1mi6hYEl67fMjv7637uBLxPb2bLpJMR76guWz0ZbRyZiJOakEUKPfaSi
 5Jj6gVJ8UIGPdMeJ5kwrBDPZ9jat/efaDkjEzZlNp9l8pMYhAbN7lQab7Aeqk0rFVSZt
 Cm6guUIUKseEVzqF7LX8OH5KdV18AOkSArMJJiS1PJqBG6CMG8zFQ7uyeB8ZBVbZ21Pz
 2K3yXhGk+xVH68pg4RsFSmm3Gj5q5nO9jxZjYTIg22Q4vSbVsyNTLL1Lz8OAHLZviSme
 KepSsqZnNkIkVGQvrOPEw0DHIAIU8WPfuU7yAv+eyaI0ecFBhm/iCeMnDmdy/IZkQpgu
 Qidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4UfA6yGjbjJo0RoiZsoNurp5VKfjqBLnL5LS80IK8w=;
 b=pFva1vpBkO0xLy2kFSNBqvRq9Uveknc10kD2ykNQHUEBaq665/hgl0e0CvBJJVNiWd
 g6GxP2PH8vqf3s8rerSLpJx4D46DUwpSCE7gad80qnqGF7S/h4iL72vKs0GcEezyNlaN
 63Zg6NcJHMmQJwK1i5PobcJMbe91uAE/mu5kOAIMCbmiSHsA/feoqtBdBvox0oGubndk
 DAlCc4Srrt/u9Tbo0RA4ogUTejsV2tsDmzShcIPSp+sM5l50Kw95pf2+mWtjeB3KsfKa
 vK1B6xgVq6jNJyni0gm3xlgLcoeE5ydZ2M6O5enwCaFCQtLIztuWuYURz5qf9OePPvCh
 Touw==
X-Gm-Message-State: AOAM5329tIyRMK9LUCsHl0fB1qCTaFlGeZnoCvoK2qk51Fc9bJ8268BF
 UYHyJHYGifcmcpwnvWukvOYcOcTZURTU3Soh8/A=
X-Google-Smtp-Source: ABdhPJz5yJkwNNWXIkmUF+JCqXHgnr3WEv3U6EEQz95DGysLbWk7fJXgR8X2OAiPfoMporz/0y78ClIoxlhn3f4TfcY=
X-Received: by 2002:a19:150:: with SMTP id 77mr10245454lfb.71.1590251382248;
 Sat, 23 May 2020 09:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-2-george.dunlap@citrix.com>
In-Reply-To: <20200522161240.3748320-2-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 23 May 2020 12:29:31 -0400
Message-ID: <CAEBZRSe6qoZB1om8wMEeOy_4TA0W=MQ3cr8QMAr2HqLDmXAQig@mail.gmail.com>
Subject: Re: [PATCH 1/5] golang: Add a minimum go version to go.mod
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
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> `go build` wants to add the current go version to go.mod as the
> minimum every time we run `make` in the directory.  Add 1.11 (the
> earliest Go version that supports modules) there to make it happy.
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>

