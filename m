Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F028E383
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6786.17868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSiyd-0008GU-RP; Wed, 14 Oct 2020 15:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6786.17868; Wed, 14 Oct 2020 15:46:07 +0000
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
	id 1kSiyd-0008G7-Nx; Wed, 14 Oct 2020 15:46:07 +0000
Received: by outflank-mailman (input) for mailman id 6786;
 Wed, 14 Oct 2020 15:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kSiyc-0008G2-J4
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:46:06 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8240dc1-69b7-4f76-adff-22e625938daf;
 Wed, 14 Oct 2020 15:46:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k18so17013wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:46:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o4sm5517460wrv.8.2020.10.14.08.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:46:02 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kSiyc-0008G2-J4
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:46:06 +0000
X-Inumbo-ID: e8240dc1-69b7-4f76-adff-22e625938daf
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e8240dc1-69b7-4f76-adff-22e625938daf;
	Wed, 14 Oct 2020 15:46:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k18so17013wmj.5
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fV+rCsJEKGlxea0oGVCwSXDELAtnoYO/dV9yfkNmUpI=;
        b=NhURuvAkviOsaI1RSDbafQgojvXM8dtnfk2HkRKG1QTM/S9g8EBYzM/9Epm5k/Yvb8
         H/le49v2GC16JbMf2PLXz2+WNxD5nWh+EyNqWp1B/gfvtFtaz5R4XixGR04zVcxAN/yQ
         /GGTunfmyTTg9vT6yRDrqL0rfxjdcN5bp0pPREfpoOhe83rgWgnRo8/nyauQY8Igyoh2
         kw9k7/EiZWGCyUCKVWuwIhUvpdRd5dVa7gbTucDBaNnyZesIpu84QFRup0eqSyAoKpTj
         O023XaTKniNcYgFV5jrafH/P73k+l8fqC/Z9WeErwNNHLye91B8tOam+4Bfh/iQ8na3O
         HZ5g==
X-Gm-Message-State: AOAM5303gyuEeaz6BX+bXwsgabidsybo1f7FhmNnxq4w4SrHCPYZ8Vbc
	ocQSa7UgCiVxhrQBNR6RqBw=
X-Google-Smtp-Source: ABdhPJy1SYlfg/nlPOv3UVdOUuCg2RjyLzZrcCZqAighnCDAZBHdIbEBaT5pvh7M7mQbMoueVSIO4g==
X-Received: by 2002:a1c:7514:: with SMTP id o20mr82905wmc.76.1602690362858;
        Wed, 14 Oct 2020 08:46:02 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o4sm5517460wrv.8.2020.10.14.08.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:46:02 -0700 (PDT)
Date: Wed, 14 Oct 2020 15:46:00 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools/libs: remove obsolete xc_map_foreign_bulk from
 error string
Message-ID: <20201014154600.cr52u65mahxh5tv3@liuwe-devbox-debian-v2>
References: <20201014094422.19347-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014094422.19347-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Wed, Oct 14, 2020 at 11:44:22AM +0200, Olaf Hering wrote:
> xc_map_foreign_bulk is an obsolete API, which is only used by
> qemu-xen-traditional.
> 
> Adjust the error string to refer to the current API.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

