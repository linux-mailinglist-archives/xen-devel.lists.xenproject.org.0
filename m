Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310930B2F4
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 23:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80172.146438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6i2t-00046Q-Ns; Mon, 01 Feb 2021 22:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80172.146438; Mon, 01 Feb 2021 22:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6i2t-000461-KV; Mon, 01 Feb 2021 22:51:47 +0000
Received: by outflank-mailman (input) for mailman id 80172;
 Mon, 01 Feb 2021 22:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6i2r-00045w-IF
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 22:51:45 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fc6b0f7-00ef-43df-9b8d-6503dff700c5;
 Mon, 01 Feb 2021 22:51:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id 7so18415796wrz.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 14:51:44 -0800 (PST)
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
X-Inumbo-ID: 9fc6b0f7-00ef-43df-9b8d-6503dff700c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=rVWTHFV6fVqerpbgleY7SQtHq8jFutPTm1kiRRj1tMU=;
        b=k5vJ+WZtEycb8R2w3NCmfiW4IMfxEUZJimMcHvQrwXrQ+Zkwf8GTPOU9itxyHYAw1F
         CUo0JIQ5ZFJcx6M4XY5jGT4J1fIIOCgASwS+vvhcW2BGS0MqgC1YA0sviqoVsLXj12LO
         qfLgV6B/7iUrcufW3P1o5KlVgFRbep1STOD5Gn9h48aFxmbQBa6AE9MwlaE26UMYdhLP
         N/bguqzukRvJROVCTLQF+sP/Q86UC3Vi3ygxgK6coPUGg+ylhUHmJLBZy/iujMMO17OF
         NMI8NZ7ovQbLD4uZZ0z//4TMEW0PECL38fTLqO0eX7Kq5AyXbHzGyrC3JF+kXTYRJViF
         1DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rVWTHFV6fVqerpbgleY7SQtHq8jFutPTm1kiRRj1tMU=;
        b=nJCBt6ZMAz8t9+jCq0+Xb2yfZOZUhJYvGIUb5j6J3FmWEZ9mnQ8l64aRcgg0DkqfeG
         m4g1eQaQ5ct/TYPKE8y1vvAL0vOtHUcM/J50ezA7btya34AsjPOKvMOLwc4Suscib3Hc
         /0aS3Hlx73uy3iiaZ8omdUPwNfvO6HccbbkReAsEfth9aOxnfW1Bf5iIYSuCJhP+GFM5
         7WNIT94MgUobRdYbAkapO4ob1nCCdKjDZy3a+SOXEk7EkFkCjGUOv6So3Z0U5owClvl0
         QF5PB7dCRvI2SrMJ8NUknZfVEVGvQ/FDBUWQ7csrJO9R8kt6GKLpiPSjyKukbzUdS5r3
         2keQ==
X-Gm-Message-State: AOAM533ksrZIp0Pa3wqndEnw11HlAW9gWjAlT4fPB/8vcupiUJ8cynWg
	uubQVQf1Zt2bMjaWsmfHsLl6Pjp7MMfFNaE83UZvUK/CkmaRHA==
X-Google-Smtp-Source: ABdhPJzcQkjP1Nbg4+BBiz4SLCmYhPzJqk0UsX4I7wYHszX2MF2BR49WEsj5f5YIQ8QryzsxMvUF/8d4LesjESQYpok=
X-Received: by 2002:adf:ffce:: with SMTP id x14mr21135503wrs.390.1612219903395;
 Mon, 01 Feb 2021 14:51:43 -0800 (PST)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 1 Feb 2021 17:51:05 -0500
Message-ID: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com>
Subject: staging: unable to restore HVM with Viridian param set
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,
trying to restore a Windows VM saved on Xen 4.14 with Xen staging results in:

# xl restore -p /shared/cfg/windows10.save
Loading new save file /shared/cfg/windows10.save (new xl fmt info 0x3/0x0/1475)
 Savefile contains xl domain config in JSON format
Parsing config from <saved>
xc: info: Found x86 HVM domain from Xen 4.14
xc: info: Restoring domain
xc: error: set HVM param 9 = 0x0000000000000065 (17 = File exists):
Internal error
xc: error: Restore failed (17 = File exists): Internal error
libxl: error: libxl_stream_read.c:850:libxl__xc_domain_restore_done:
restoring domain: File exists
libxl: error: libxl_create.c:1581:domcreate_rebuild_done: Domain
8:cannot (re-)build domain: -3
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
8:Non-existant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
8:Unable to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
8:Destruction of domain failed

Running on staging 419cd07895891c6642f29085aee07be72413f08c

Tamas

