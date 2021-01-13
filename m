Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E52F52B9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66712.118604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlF5-00044v-On; Wed, 13 Jan 2021 18:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66712.118604; Wed, 13 Jan 2021 18:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlF5-00044W-LL; Wed, 13 Jan 2021 18:51:39 +0000
Received: by outflank-mailman (input) for mailman id 66712;
 Wed, 13 Jan 2021 18:51:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgOw=GQ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kzlF4-00044R-D6
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:51:38 +0000
Received: from MTA-06-3.privateemail.com (unknown [198.54.127.59])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 256003a0-0dba-4161-bdff-af24c5c9c6d9;
 Wed, 13 Jan 2021 18:51:37 +0000 (UTC)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 1516F60078
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 13:51:37 -0500 (EST)
Received: from mail-wr1-f54.google.com (unknown [10.20.151.214])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id D440E60071
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 18:51:36 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d26so3224635wrb.12
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 10:51:36 -0800 (PST)
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
X-Inumbo-ID: 256003a0-0dba-4161-bdff-af24c5c9c6d9
X-Gm-Message-State: AOAM533IdtsErHKRx45FlHww9H9AZUqdCH2nTQnqZVF5WQYKYEs2XNET
	+qvgscaJQ+XmrhWx4dPf/wUMXgyW3jW6Gl7qETA=
X-Google-Smtp-Source: ABdhPJw3DOasavN+Nw4Ar2KwGjMjOqZ6QQ6ZiFl/ZgnpbLspcSp4SQZzxjVa38KB220hf5sbCsBpDkZ9rus6GJ/AYro=
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr3907427wrx.259.1610563891465;
 Wed, 13 Jan 2021 10:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20210113123455.23209-1-andrew.cooper3@citrix.com> <20210113123455.23209-3-andrew.cooper3@citrix.com>
In-Reply-To: <20210113123455.23209-3-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 13 Jan 2021 13:50:55 -0500
X-Gmail-Original-Message-ID: <CABfawhmiD-UXRBvPd-6=OayvkMf0G6pZZFawasuWiv7DNN937A@mail.gmail.com>
Message-ID: <CABfawhmiD-UXRBvPd-6=OayvkMf0G6pZZFawasuWiv7DNN937A@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools: Move xen-access from tests/ to misc/
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <amc96@cam.ac.uk>, 
	Ian Jackson <iwj@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Jan 13, 2021 at 7:35 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> xen-access is a tool for a human to use, rather than a test.  Move it
> into misc/ as a more appropriate location to live.
>
> Move the -DXC_WANT_COMPAT_DEVICEMODEL_API from CFLAGS into xen-access.c itself
> to avoid adding Makefile complexity.

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

