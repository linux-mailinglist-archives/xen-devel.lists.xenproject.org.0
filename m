Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D490645B3B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 14:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456367.714150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2uko-00064S-Ce; Wed, 07 Dec 2022 13:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456367.714150; Wed, 07 Dec 2022 13:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2uko-00061k-9p; Wed, 07 Dec 2022 13:46:30 +0000
Received: by outflank-mailman (input) for mailman id 456367;
 Wed, 07 Dec 2022 13:46:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=efXR=4F=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1p2ukm-00061e-OD
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 13:46:28 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ba25d46-7635-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 14:46:26 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id gh17so14102748ejb.6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Dec 2022 05:46:26 -0800 (PST)
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
X-Inumbo-ID: 8ba25d46-7635-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg6rscjarIENb4Y9pQnBfqSpVruaA4pKa5wywW78TI4=;
        b=MwsUVjDJmC4I5yYHV3kpu4xgCzlCzOFBqxQqhUcHYF0flutztZmp2Ao8JSgL6XZz2c
         mHIBqvcy7GSh1vrlCBtisgJtOnExtYO/3eAPdgXMUzK8b7VzgL/jacOOE4kUWRxvTdXQ
         KQffjyuNqWFBQcbiUoYJe7PHxELJ1BrgznpaWEFdsrJKWtmtv6SqeiehdqBFWcLtwLJt
         Ug9di9bdrmQ6Tv/yi/3AuaNGYaIlXL6Sfij3RMjYRRfjK0Qkc133Y++DVroVKFXEEuol
         MNa9UocHoAbWsSL9ajSwdoJpPuj57h8iMv9ouOaRWJbpJep4uGMK+nKoT2Diefjig+WU
         pOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qg6rscjarIENb4Y9pQnBfqSpVruaA4pKa5wywW78TI4=;
        b=TZ1zPKEmCVpcJjMTAMhMQUksB9TjmyxOJ7dp5sKS/+wbdgn3sPFsFU3eVLOluJFZso
         tAtIW9CbutEqiZv6gBM8Lrzybbfjp1/W5NV+0K/1j3w6pmt1Ug6ZFuUOOgnmC+VUj88r
         fgtgnVPC1S9aG3oWI7VYiRygqb7Ao0OFhBnki+wXku2JAEcWsPYjRoQxM+5OiiokcEel
         MOxUC9A56MKYmF0hwMHy6fovyZAjW/SYy3zS7ZG4CfSmGvY3lg4SCxFcbzvBmOY+suWo
         yYlttpbeu3yhgb0WIWoYkLHLZ3w1zHmmsYSl+vkwoziul+RRmEDH1vGXznSQtJLWHWa9
         1P5g==
X-Gm-Message-State: ANoB5plm0hQjNgJ5HQC+ZkkfDgNlPwXjawQYe13EHDvdVzh15QjoAi05
	hRBKYrX/63Di5o1z4VUZbaJlVz3obADKaxH0DkE=
X-Google-Smtp-Source: AA0mqf5t0KjwzPyZvRZG7MLQbFpXbjxFzDGeMwNmpXfyClD31KDpdah+3VFvdek87O6hyLYA7X3zt1TVPTTh+UVTHDI=
X-Received: by 2002:a17:906:ad86:b0:7c0:7e90:ec98 with SMTP id
 la6-20020a170906ad8600b007c07e90ec98mr7717890ejb.537.1670420786209; Wed, 07
 Dec 2022 05:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20221207072349.28608-1-jgross@suse.com>
In-Reply-To: <20221207072349.28608-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Dec 2022 08:46:14 -0500
Message-ID: <CAKf6xpu5tCeV4P5TUjDiHfupctwYHsnLUGT+TB5Wxgs9riRQ6A@mail.gmail.com>
Subject: Re: [PATCH] xen/netback: fix build warning
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 7, 2022 at 2:24 AM Juergen Gross <jgross@suse.com> wrote:
>
> Commit ad7f402ae4f4 ("xen/netback: Ensure protocol headers don't fall in
> the non-linear area") introduced a (valid) build warning.
>
> Fix it.
>
> Fixes: ad7f402ae4f4 ("xen/netback: Ensure protocol headers don't fall in the non-linear area")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>

I applied ad7f402ae4f4 to 5.15.y and 5.4.y and it broke networking
with my driver domains.  The frontend failed to DHCP an address and it
didn't look like any packets were getting through.  This patch fixed
networking with 5.15.y and 5.4.y.

I think the commit message is worth expanding that this is more than
just a build warning.

Thanks,
Jason

