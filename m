Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8602C1F12
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 08:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35416.66940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khT12-0005r1-Od; Tue, 24 Nov 2020 07:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35416.66940; Tue, 24 Nov 2020 07:45:32 +0000
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
	id 1khT12-0005qc-LK; Tue, 24 Nov 2020 07:45:32 +0000
Received: by outflank-mailman (input) for mailman id 35416;
 Tue, 24 Nov 2020 07:45:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Zhb=E6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1khT10-0005qR-S5
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:45:30 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc78b056-3f7a-4371-913d-8bec1fbed5cc;
 Tue, 24 Nov 2020 07:45:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id a65so1842420wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 23:45:29 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id q25sm4278793wmq.37.2020.11.23.23.45.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 23:45:28 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5Zhb=E6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1khT10-0005qR-S5
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:45:30 +0000
X-Inumbo-ID: fc78b056-3f7a-4371-913d-8bec1fbed5cc
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fc78b056-3f7a-4371-913d-8bec1fbed5cc;
	Tue, 24 Nov 2020 07:45:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id a65so1842420wme.1
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 23:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=S9s4cpok78Ha4Q/+X64sGyNmgKnYE8ebzWe66uKslek=;
        b=lsHLrqTLpzQUm22lnr14pSoee2cbMWvu9ct1llEHdkBuvKg98RYSGxkEgjgR3IwBW1
         FUhw7S6gdbG/V10Zs1OVOXP8n/PfW7jSbNRpMA/HXoQNxu5wHG0gHOp+ym/DQkY09s//
         5iGBi2acVfygnQ5b3BZ9/BB2ttJBdStdvl4DXjfoSCRBUCnzGklyB1Xb9NieIg92PPIc
         4oryVPB4vlsuA0YzTu8rIvA/oGXi4YVKDsE9gV9MqaFeHcXbOESuf3ChMnCOEqug7lbY
         QRCztlBgjmjpbut7Rx2/ADululxI9uoPsH6yGpgfYiekPVEJc7h3y+xNc9/3W9qW10YI
         PS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=S9s4cpok78Ha4Q/+X64sGyNmgKnYE8ebzWe66uKslek=;
        b=X4P9YNOewgZ/VE+0hVSmA2cbFNtrgVquaanA6Pfsuh5ptfVTY/8iVJhi4s/qrbr4wH
         kdLiFlDYBHJcdmM8qhr2zckgmoZTnFqjEJwdO3iIy9sv6MXDF5jUo5PjnEaQjKGmo7se
         UBRZ3b4gLJGUGe5qkfp+i1R7oWIoVOcJRY+8ydhrpzT6f+7dulfZRrvu11+mXTKB3jCU
         Ve2yt1N0VPDSpAOdfOxDqPvfViCV/kcASLA89ZII0i8yGhrCIS/SAgPCivZVNDKEwNi6
         LE7cLNQoYSQeccbZrA9MRsqbfJR5y6eCebnPUff470n6agv6hl15jhy6M63g6TIG/1+Q
         jJhg==
X-Gm-Message-State: AOAM533nvbNl/VUifvkPNPkAZ/K9mhKBNoEW+YP4bAFmUtySo9iExIAv
	ek9mzhZysUG0VENl3NtRBCY=
X-Google-Smtp-Source: ABdhPJx8zhzev/pyr2YTP9QJadVGoQ9ZMhpvMn+KcUqH7WWcc93DsWPrPNEHKqukNrDS9H6kAT3GjQ==
X-Received: by 2002:a7b:c843:: with SMTP id c3mr2918205wml.100.1606203929123;
        Mon, 23 Nov 2020 23:45:29 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com. [86.183.162.145])
        by smtp.gmail.com with ESMTPSA id q25sm4278793wmq.37.2020.11.23.23.45.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 23:45:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>,
	"'Christian Lindig'" <christian.lindig@citrix.com>,
	"'David Scott'" <dave@recoil.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Nick Rosbrook'" <rosbrookn@ainfosec.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20201123174503.6800-1-paul@xen.org> <822734cf-a048-2f53-940a-9f5ccf9df40f@citrix.com>
In-Reply-To: <822734cf-a048-2f53-940a-9f5ccf9df40f@citrix.com>
Subject: RE: [PATCH v3 00/23] xl / libxl: named PCI pass-through devices
Date: Tue, 24 Nov 2020 07:45:27 -0000
Message-ID: <001601d6c235$c7396150$55ac23f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG+euZNgx6mUfoFllRdYIBemuWGRgEeRX7Zqf6COOA=
Content-Language: en-gb

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 23 November 2020 22:18
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Anthony PERARD <anthony.perard@citrix.com>; Christian Lindig
> <christian.lindig@citrix.com>; David Scott <dave@recoil.org>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Nick Rosbrook <rosbrookn@ainfosec.com>;
> Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v3 00/23] xl / libxl: named PCI pass-through devices
> 
> On 23/11/2020 17:44, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Paul Durrant (23):
> >   xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> >   libxl: make libxl__device_list() work correctly for
> >     LIBXL__DEVICE_KIND_PCI...
> >   libxl: Make sure devices added by pci-attach are reflected in the
> >     config
> >   libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
> >   libxl: s/detatched/detached in libxl_pci.c
> >   libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
> >   libxl: stop using aodev->device_config in libxl__device_pci_add()...
> >   libxl: generalise 'driver_path' xenstore access functions in
> >     libxl_pci.c
> >   libxl: remove unnecessary check from libxl__device_pci_add()
> >   libxl: remove get_all_assigned_devices() from libxl_pci.c
> >   libxl: make sure callers of libxl_device_pci_list() free the list
> >     after use
> >   libxl: add libxl_device_pci_assignable_list_free()...
> >   libxl: use COMPARE_PCI() macro is_pci_in_array()...
> >   docs/man: extract documentation of PCI_SPEC_STRING from the xl.cfg
> >     manpage...
> >   docs/man: improve documentation of PCI_SPEC_STRING...
> >   docs/man: fix xl(1) documentation for 'pci' operations
> >   libxl: introduce 'libxl_pci_bdf' in the idl...
> >   libxlu: introduce xlu_pci_parse_spec_string()
> >   libxl: modify
> >     libxl_device_pci_assignable_add/remove/list/list_free()...
> >   docs/man: modify xl(1) in preparation for naming of assignable devices
> >   xl / libxl: support naming of assignable devices
> >   docs/man: modify xl-pci-configuration(5) to add 'name' field to
> >     PCI_SPEC_STRING
> >   xl / libxl: support 'xl pci-attach/detach' by name
> 
> We're trying to get the CI loop up and running.  Its not emailing
> xen-devel yet, but has found a real error somewhere in this series.
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/220153571
> 

Found it, thanks...

libxl_pci.c: In function 'libxl_device_pci_assignable_name2bdf':
libxl_pci.c:970:5: error: 'pcibdf' may be used uninitialized in this function [-Werror=maybe-uninitialized]
     return pcibdf;
     ^

Odd that my local build (debian 9.13) didn't pick it up. Will send a v4 shortly.

  Paul

> ~Andrew


