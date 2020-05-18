Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889471D753B
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 12:31:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jad3F-0000G6-M4; Mon, 18 May 2020 10:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFi1=7A=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jad3E-0000G1-9z
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 10:31:16 +0000
X-Inumbo-ID: b3c9b686-98f2-11ea-ae69-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3c9b686-98f2-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 10:31:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s8so11189309wrt.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 03:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qypNNsoA5wBKPhj7Sf33bS3ovebO9BMY32ZKbRxVRBY=;
 b=Xr6oFU7PwOBkYl1VPkWniVywwc8MFtuzJOabpO3EzcsvCnU1WjzjKR5QMAyJJJVbEQ
 QZFLsM+RxNjxiaV4isF8aTP2GME9zMCGvn/NeLZrH72FaQpmkDmSN4dZLfuYuyZeeZRA
 yvvzw8N/shkS6k8fRRx1sshuzqABrdkpEsLmpP49FI+/f6xgAWutGG+P+AqK3bjod174
 38mWVn89bwAJ8BzCoBg4MxWjQE7qslaGWOuycr9jCeOnzDeWuUzHfjvdUyuJTipVGNLK
 ts56Q2nO38X5CWliCvxkqsCzeUWrTaZ2ZVRO07MPsEoSlPIQ/W1y8+vNypKGUgICggex
 tP8A==
X-Gm-Message-State: AOAM531gnCPhKJKZJfgPLX0Bq/0rqvzwNv7z1TPt5xfVZNby2Iebfzat
 8k3x9P8Jrhg5ordRxeB22ZM=
X-Google-Smtp-Source: ABdhPJxcbk7mn21pDORZuLxyNWw2IKhPO6lSmS9k23Qcp+QsHkMLHjf2zKm7zOLTu0psCCUUN5/t7w==
X-Received: by 2002:a5d:4cc1:: with SMTP id c1mr18409241wrt.32.1589797875067; 
 Mon, 18 May 2020 03:31:15 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p10sm17171731wra.78.2020.05.18.03.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 03:31:14 -0700 (PDT)
Date: Mon, 18 May 2020 10:31:13 +0000
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH mini-os] console: add newline at EOF
Message-ID: <20200518103113.v4vik5mcwzuaofxn@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <9d2e445b-0b0f-4e4d-08a8-0f22013f111b@suse.com>
 <20200518075300.t3tvfo7ucbwujmif@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518075300.t3tvfo7ucbwujmif@function>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 09:53:00AM +0200, Samuel Thibault wrote:
> Jan Beulich, le lun. 18 mai 2020 09:09:14 +0200, a ecrit:
> > Some gcc versions get pretty unhappy without.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> That was an easy one :)
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Applied.

