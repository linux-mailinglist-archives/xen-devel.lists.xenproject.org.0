Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683F2CED11
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44537.79813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9IJ-0003Bh-4b; Fri, 04 Dec 2020 11:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44537.79813; Fri, 04 Dec 2020 11:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9IJ-0003BF-0l; Fri, 04 Dec 2020 11:30:35 +0000
Received: by outflank-mailman (input) for mailman id 44537;
 Fri, 04 Dec 2020 11:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9IH-00039u-Sj
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:30:33 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b36151b5-6781-440b-847a-84e55dd49fbc;
 Fri, 04 Dec 2020 11:30:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k14so4998849wrn.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:30:30 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u66sm2934724wmg.2.2020.12.04.03.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:30:29 -0800 (PST)
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
X-Inumbo-ID: b36151b5-6781-440b-847a-84e55dd49fbc
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PXJbjXPUsLZaYt42bpyelUKSIbJgB8MCV61pbqdpLc0=;
        b=gorn7Z3uCWeDU1RMzjERXtlV8lLNDUJEsRr4ClFAqyqfjBu4dHNgti1iDfRJPwbXhj
         E2SUjQU05NI22ZAGst8Fk885QJQRwXSY04IuqLGRad25M70T2uxibX9Hb9G+n3FdEplz
         LscbLsxnF2dGWYr1q4xNLw/SGZKOEPPEHADaXtxmH0mUMqId6V4RHXxDSd/HcnkwCV9x
         6Mu3zof/AitL3FJF1btieZaImUhm38yye+DhYx81U8SjTOnEjStQEcPdpymMOgiNWoOC
         7S36Pzgs+XZrieqKobRqe7oKWAL3DB+uJMDRQSNxcVETcd88lQyuOSlVpMM3dorRCJ6e
         YyPg==
X-Gm-Message-State: AOAM5331d559XmS2c8E+bMHUlNh17kmEkJFXL2gGZdztIyLkxHHVMgzf
	Aj88VoyTXxwSbgttT84JAvE=
X-Google-Smtp-Source: ABdhPJyp9t9NHyfnFD8PIVs56Ay7wcjFOw7F18JEFfHoG20/IYHbUpS1kmg0J5x9GwJm3oZzmbpcQg==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr4478624wrp.209.1607081430045;
        Fri, 04 Dec 2020 03:30:30 -0800 (PST)
Date: Fri, 4 Dec 2020 11:30:28 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 15/23] docs/man: improve documentation of
 PCI_SPEC_STRING...
Message-ID: <20201204113028.h4s4hhgyis6u4tyn@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-16-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-16-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:26PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and prepare for adding support for non-positional parsing of 'bdf' and
> 'vslot' in a subsequent patch.
> 
> Also document 'BDF' as a first-class parameter type and fix the documentation
> to state that the default value of 'rdm_policy' is actually 'strict', not
> 'relaxed', as can be seen in libxl__device_pci_setdefault().
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

