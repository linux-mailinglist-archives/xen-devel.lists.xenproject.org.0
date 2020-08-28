Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C805255E63
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 18:01:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgoF-0005eP-Gi; Fri, 28 Aug 2020 16:00:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqI4=CG=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBgoD-0005eI-84
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 16:00:57 +0000
X-Inumbo-ID: ef555a53-caff-453f-b1ec-f91fa9f5c34c
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef555a53-caff-453f-b1ec-f91fa9f5c34c;
 Fri, 28 Aug 2020 16:00:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t2so1419814wma.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2020 09:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z1gkGOI6lnGub5Cy2GSB1u8VLk0Mo10wQmHS6u5LF+s=;
 b=Ys3jbXlzCnVVDSYgJRLD9TrbcTYY04BfmPRSfnF1nQBmlBdPdJBBJG5qjeGRcnI3Ut
 j2NLD+P1GT3GztaSfxeVoHMG/lLfFZEHI1Z7t2ZFAjm5lRD6nlBmsvI5Sgi7HpAifQst
 t7RYL3uErgTMvedkZNC60EDa6JKoWAOY79tJ+6KfBNrx1AlWmtdztKXKW7NV8v6zqmYq
 GEoXgw2TFeKXf4X+JegsaB8W8qEPr65Qxg7yy6rX9okTjpJcrMbcc4Fsoq0+chI72NgL
 akQCBZMI4ICiDQksGEn9pQ6veNl93P3ZNHVLOnYCtIFTKZfcvabvs2sj0LjoT7xEXRzO
 +hWw==
X-Gm-Message-State: AOAM53157v1nG/b2JScMpwaQg14X4PSBBQSX+ZA+YuaF/EabDSYChftd
 Vj34vHGK70U6kWQ15m5oQ94=
X-Google-Smtp-Source: ABdhPJyqXR+lR+BisdsqoYssfMEJXld2J5NOWDwPVm0QdxeMdiuwuj+UOBsjmjabgrg+/d6Ahnor6A==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr2421733wmb.6.1598630455404;
 Fri, 28 Aug 2020 09:00:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n7sm2704522wrs.2.2020.08.28.09.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 09:00:54 -0700 (PDT)
Date: Fri, 28 Aug 2020 16:00:53 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 30/31] tools/libs: add option for library names not
 starting with libxen
Message-ID: <20200828160053.b7misof3qmmkskur@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-31-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828150747.25305-31-jgross@suse.com>
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

On Fri, Aug 28, 2020 at 05:07:46PM +0200, Juergen Gross wrote:
> libxlutil doesn't follow the standard name pattern of all other Xen
> libraries, so add another make variable which can be used to allow
> other names.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Is this still needed?

Wei.

