Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366FE2922FE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8616.23100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPfC-0006yQ-Ha; Mon, 19 Oct 2020 07:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8616.23100; Mon, 19 Oct 2020 07:33:02 +0000
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
	id 1kUPfC-0006y1-EB; Mon, 19 Oct 2020 07:33:02 +0000
Received: by outflank-mailman (input) for mailman id 8616;
 Mon, 19 Oct 2020 07:33:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSGA=D2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUPfA-0006xw-Kf
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:33:00 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bea8250-dc53-49df-9d9d-584004cf35b9;
 Mon, 19 Oct 2020 07:32:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q5so11660151wmq.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 00:32:59 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v8sm15657225wmb.20.2020.10.19.00.32.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 00:32:58 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CSGA=D2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUPfA-0006xw-Kf
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:33:00 +0000
X-Inumbo-ID: 5bea8250-dc53-49df-9d9d-584004cf35b9
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5bea8250-dc53-49df-9d9d-584004cf35b9;
	Mon, 19 Oct 2020 07:32:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q5so11660151wmq.0
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 00:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=jZa8/08xg2HhiRyEdtd7JzfFusEcmIi51CFreIpCG4Q=;
        b=oaknzuBuzHg+xmxEA0qkQsjp/Efv6ufRT5UVz5FpHhDcRjL/KWpwbpK+zbzqHLCem+
         SK9S0ZbEW+ZfGD/lqF3oN4xZ+Yd/Ja+mafVKxSjeMDB4sCt4P7st7UE+4ZI0TGT8rpq6
         wEI4MpUsde4SgX3VL7GLiImsD9gmR2LLP7vTRxLICUKIic4NtU/aM0VLBS35UqzGAa7y
         kz8eNgpxbdol3QN+dC+DzkLrzNLNIUngGj40H+n9SBYOSZ1C+cVj+0rkgTPRykDuQdDu
         hr1Dq0adX2Q94ZTexSCLxct0YPxww8Rx5E+0SIHaEzXTw4BuekNRtTQp2foyVXQptVWN
         vkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=jZa8/08xg2HhiRyEdtd7JzfFusEcmIi51CFreIpCG4Q=;
        b=qFennhfQc4vI/4aOI60+6Lub8K2pORi5Ty6w1WkA7wG6eDOP8arPTTYeLSXdITFoM6
         f2AdAa5G23lzA1iKjhk7gTEJbTdHiAJ7SWDmwm88XcDudGm92Vimf3aHJNcC9rGgfPH+
         hjwkzFrhNotsSLwf2EvaIuwMxIylN9ZH/LHx3ZqO69BUBk0Q30UIzX/9TMHZHUOFQy2j
         vP7vBWawGk4kPRBL2QesBoI9YYhUo0GW2t4NEH+RS1dc8QiVBdCm2nIKeBvMuVv8U8B0
         Fw55ccfZ9+4NA6dVBahZwXECdfJo5p1GWLZnicreLre2jAiiaAif+KWcaa8tZ9FD8nft
         T3SQ==
X-Gm-Message-State: AOAM531ZwlEWvS5NdbR22G6Al/AR/gVSIswDlm0gbg+wawIVd2spS4L2
	xrIHdxmiKUkjmlUk+i7HLfU=
X-Google-Smtp-Source: ABdhPJx2BiYyfhVZ1HGWs4WCT5Aj9TYeliEOXidJVSUkUcsFTbrMhQeZhGr4xK2koWgpYBcfHES3Mw==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr15711301wme.157.1603092778890;
        Mon, 19 Oct 2020 00:32:58 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id v8sm15657225wmb.20.2020.10.19.00.32.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 00:32:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20201005094905.2929-1-paul@xen.org> <20201005094905.2929-3-paul@xen.org> <97648df3-dcce-cd19-9074-6ca63d94b518@xen.org> <002a01d6a5e8$c36bb5a0$4a4320e0$@xen.org> <7c4a0cda-5fff-c9ae-2fc1-4256aec5f694@suse.com>
In-Reply-To: <7c4a0cda-5fff-c9ae-2fc1-4256aec5f694@suse.com>
Subject: RE: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
Date: Mon, 19 Oct 2020 08:32:57 +0100
Message-ID: <002d01d6a5ea$112d9aa0$3388cfe0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH+ubxU5MmdI1NaD6dn626TcODZdgGmi3hFAim7XvUAu7WuFwHUyrZTqRtZupA=
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 19 October 2020 08:30
> To: paul@xen.org
> Cc: 'Julien Grall' <julien@xen.org>; xen-devel@lists.xenproject.org; =
'Paul Durrant'
> <pdurrant@amazon.com>; 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>; 'Ian =
Jackson' <iwj@xenproject.org>;
> 'Wei Liu' <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; =
'George Dunlap'
> <george.dunlap@citrix.com>; 'Stefano Stabellini' =
<sstabellini@kernel.org>
> Subject: Re: [PATCH 2/5] iommu / domctl: introduce =
XEN_DOMCTL_iommu_ctl
>=20
> On 19.10.2020 09:23, Paul Durrant wrote:
> >> From: Julien Grall <julien@xen.org>
> >> Sent: 16 October 2020 16:47
> >>
> >> On 05/10/2020 10:49, Paul Durrant wrote:
> >>> diff --git a/xen/include/public/domctl.h =
b/xen/include/public/domctl.h
> >>> index 791f0a2592..75e855625a 100644
> >>> --- a/xen/include/public/domctl.h
> >>> +++ b/xen/include/public/domctl.h
> >>> @@ -1130,6 +1130,18 @@ struct xen_domctl_vuart_op {
> >>>                                    */
> >>>   };
> >>>
> >>> +/*
> >>> + * XEN_DOMCTL_iommu_ctl
> >>> + *
> >>> + * Control of VM IOMMU settings
> >>> + */
> >>> +
> >>> +#define XEN_DOMCTL_IOMMU_INVALID 0
> >>
> >> I can't find any user of XEN_DOMCTL_IOMMU_INVALID. What's the =
purpose
> >> for it?
> >>
> >
> > It's just a placeholder. I think it's generally safer that a zero =
opcode value is invalid.
>=20
> But does this then need a #define? Starting valid command from 1
> ought to be sufficient?
>=20

Seems harmless enough, and it also seemed the best way since to reserve =
0 since this patch doesn't actually introduce any ops. As it has caused =
so much controversy though, I'll remove it.

  Paul

> Jan


