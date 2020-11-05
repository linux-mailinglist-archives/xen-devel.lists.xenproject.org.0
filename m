Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01722A7F63
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 14:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19796.45172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaeug-00071t-ID; Thu, 05 Nov 2020 13:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19796.45172; Thu, 05 Nov 2020 13:02:50 +0000
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
	id 1kaeug-00071Y-Eq; Thu, 05 Nov 2020 13:02:50 +0000
Received: by outflank-mailman (input) for mailman id 19796;
 Thu, 05 Nov 2020 13:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nmck=EL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kaeue-00071T-VK
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 13:02:48 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eccbb7e-be2b-4b6f-8f21-79a82d86c2e0;
 Thu, 05 Nov 2020 13:02:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so1658481wrp.10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 05:02:45 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r3sm2379129wrm.51.2020.11.05.05.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 05:02:44 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Nmck=EL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kaeue-00071T-VK
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 13:02:48 +0000
X-Inumbo-ID: 5eccbb7e-be2b-4b6f-8f21-79a82d86c2e0
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5eccbb7e-be2b-4b6f-8f21-79a82d86c2e0;
	Thu, 05 Nov 2020 13:02:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so1658481wrp.10
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 05:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T8s84WHZg6qe2FOtBV1gA8ngLlQvSa45H08E1gw4jjM=;
        b=F4rwTzYzKF/osyfQ2PQbpFmM6/IVtnKVdzZ8bPHu9yonMKDwKHT1GdbzbUhW1YRDiC
         M1tgakwQhoUwzsx2mSSx9pPCuI76TxYF2ag9cDk7tFNdxCxajRkxt9h8o/JPlTD9Q5s7
         Mw+YmbDU3+GP3Y6bxS2SeBCikQFSCvf/Aw7B/QtsqpdRbftnTRYxr37AEc4aEra2n6l/
         l2SbD/LmQuf7kebmpQkREYFCQbDjtHX6ZUaNgpHVvimB55cV0qt0rHOFBPjNmzVQZu7Y
         NqUZ058mxfWVPWwkyoXInMP+oGmUir7nbZ/QoJGc6tsaRcDi/iiuZixSgOhTtPIgNqZB
         flLg==
X-Gm-Message-State: AOAM531wokYhA9TP0XSKVjy0KcDEg3B9R6Ift9LE86uWm3Z8UiHq331S
	RZg1YvgzZuCiiJElMIhfZm8=
X-Google-Smtp-Source: ABdhPJz6bjocfIpNYXUJM/ZHuszdISGCmatqMCEfgS4fmW/nTwAyc5Ra6rFhikIFpuowEUI0dRdR1A==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr2795110wrp.312.1604581364973;
        Thu, 05 Nov 2020 05:02:44 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id r3sm2379129wrm.51.2020.11.05.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 05:02:44 -0800 (PST)
Date: Thu, 5 Nov 2020 13:02:42 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Olaf Hering <olaf@aepfle.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH] libxl: fix libacpi dependency
Message-ID: <20201105130242.e7hwl7v6ktlkbbkn@liuwe-devbox-debian-v2>
References: <bd68e8f4-ce57-7798-f6d2-53e85319b8d4@suse.com>
 <f2172d3f-38fc-7f9f-9b31-2c07a1686cff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2172d3f-38fc-7f9f-9b31-2c07a1686cff@suse.com>
User-Agent: NeoMutt/20180716

On Thu, Nov 05, 2020 at 12:56:46PM +0100, Jan Beulich wrote:
> On 27.10.2020 12:40, Jan Beulich wrote:
> > $(DSDT_FILES-y) depends on the recursive make to have run in libacpi/
> > such that the file(s) itself/themselves were generated before
> > compilation gets attempted. The same, however, is also necessary for
> > generated headers, before source files including them would get
> > attempted to be compiled.
> > 
> > The dependency specified in libacpi's Makefile, otoh, is entirely
> > pointless nowadays - no compilation happens there anymore (except for
> > tools involved in building the generated files). Together with it, the
> > rule generating acpi.a also can go away.
> > 
> > Reported-by: Olaf Hering <olaf@aepfle.de>
> > Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'd appreciate a libxl side ack (or otherwise) here.

Acked-by: Wei Liu <wl@xen.org>

Feel free to commit this yourself.

