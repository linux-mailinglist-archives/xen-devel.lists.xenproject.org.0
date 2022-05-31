Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF5C5392EA
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 16:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339665.564548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2Sd-00080k-65; Tue, 31 May 2022 14:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339665.564548; Tue, 31 May 2022 14:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2Sd-0007xJ-0B; Tue, 31 May 2022 14:03:03 +0000
Received: by outflank-mailman (input) for mailman id 339665;
 Tue, 31 May 2022 14:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qz3z=WH=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nw2Sb-0007xD-1n
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 14:03:01 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60c44cff-e0ea-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 16:03:00 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id w130so17581515oig.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 07:02:59 -0700 (PDT)
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
X-Inumbo-ID: 60c44cff-e0ea-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zSsDGmPBqc1850fXMxxYy77h0suShb99cQI9DzpTn+8=;
        b=BoZZawlLXMLqxyuY4/8YSEJfQBy4GSO9j2NFQonAgKUx38zInyQBAAsu028kkBeY4/
         EWrEgj8JKcK3gjTpbBLO/hDZQuvf7NK4Ucvonfgxmfrc0nR3aV5IxARtRkSChcAOyUGH
         fZUp7hpCN97Nr0N5G72fbztZXEgroQZUf4y8zJ0ICznxwwcjxXWlLZ6hOeJ8KhA7kxHY
         3PyzHAHqugoTIIUILcHqNnutUpPTIzpUW8Wwg62JXjUGpjx6Qe1go6gq+bKI2BO7J093
         hYisqTqf7Sg3k48IprW9DX6V14+GdfrBorB4cJR70cn56+b1Xq/a19wePRHt7r45h5sg
         oQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zSsDGmPBqc1850fXMxxYy77h0suShb99cQI9DzpTn+8=;
        b=nYAgAqZM+HrgKLPoAx6+hZUkTdECmxO3CLlNx7iW6Aprv+Fly2tscvVNjzhl0FE0ZO
         H7M/Uq/mSOqRTov9hOmaG582BM2KvymO8tPdVX9Zkc8RWCDEE+BcK0xmOHeX5G4jfqOh
         9B3v2RE0knyLcLnPEqFlYZ+sSW6IU9y/ox+O0NxTDDoy6WkMRMhmthgQYm9chXKEGvlB
         x7XdFmURrUMqz8qsMFfuH2zEpZkxiAGO1p5bA3rq3C8Pz2dmVOKB0AUAsfSG1TM0yDJf
         Cot0SpKN1ybUuxJmJqqjZIDp9OvmWYo9hWEu3jhJ6GZW/iEq7o61qmQSCt8UTJrY9BuH
         e4Qw==
X-Gm-Message-State: AOAM532JVELWIonJe1viLKz5BW10p1t6ODuLD9oqadSs9zjuQuC310qJ
	3iR4WitTCzSaPN8xVUKbpycOHi2bhRy0W4Fc0dY=
X-Google-Smtp-Source: ABdhPJxcOP3uljOuiNuxyefdakdbso4LHWx6ApDiZfsH6aS7Gpmq9fd+9szeUlsBhjgyyYZWQ9Ed1xBYttWfHDhQ2Mc=
X-Received: by 2002:a05:6808:180d:b0:32b:d6a5:524d with SMTP id
 bh13-20020a056808180d00b0032bd6a5524dmr9510814oib.9.1654005778677; Tue, 31
 May 2022 07:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>
 <YpYbaOuFTsD1khDw@perard.uk.xensource.com>
In-Reply-To: <YpYbaOuFTsD1khDw@perard.uk.xensource.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 31 May 2022 10:02:23 -0400
Message-ID: <CABfawhkXVEXFE_GV7sS_uFU-d8BPsLfOUemGL-xJ-H1v56C1zg@mail.gmail.com>
Subject: Re: [PATCH v2] tools/libs/ctrl: rename and export do_memory_op as xc_memory_op
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 9:43 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Thu, May 19, 2022 at 01:16:35PM -0400, Tamas K Lengyel wrote:
> > Make the do_memory_op function accessible to tools linking with libxc.
> > Similar functions are already available for both domctl and sysctl. As part
> > of this patch we also change the input 'cmd' to be unsigned int to accurately
> > reflect what the hypervisor expects.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Is exposing do_memory_op necessary? This kind of looks like a revert of
> 35e135f116 ("libxc: make xc_memory_op library private"). Anyway, if
> there isn't a better alternative: Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks! For compatibility reasons it's easier for tools supporting
multiple versions of Xen to have direct access to xc_memory_op instead
of having to look up different versions of libxc functions and cast
them via dlsym based on the Xen version detected. It also makes it
possible to access memory_op hypercalls for which there are no libxc
wrappers.

Tamas

