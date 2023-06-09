Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7CB729C6A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 16:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546070.852673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7cnK-0002gN-3R; Fri, 09 Jun 2023 14:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546070.852673; Fri, 09 Jun 2023 14:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7cnK-0002dk-07; Fri, 09 Jun 2023 14:08:50 +0000
Received: by outflank-mailman (input) for mailman id 546070;
 Fri, 09 Jun 2023 14:08:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4wW=B5=gmail.com=morel.dav@srs-se1.protection.inumbo.net>)
 id 1q7cma-0002cq-QN
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 14:08:04 +0000
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c0c451a-06cf-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 16:08:02 +0200 (CEST)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-30e56fc9fd2so1794761f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jun 2023 07:08:02 -0700 (PDT)
Received: from raton (lfbn-idf1-1-119-188.w82-124.abo.wanadoo.fr.
 [82.124.204.188]) by smtp.gmail.com with ESMTPSA id
 e8-20020adff348000000b00304adbeeabbsm4601028wrp.99.2023.06.09.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 07:08:00 -0700 (PDT)
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
X-Inumbo-ID: 0c0c451a-06cf-11ee-b232-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319682; x=1688911682;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg7DsMTfj/KJ76M+QDc4B4gyYVLz441GJruIrtS336U=;
        b=DnsGq0ke/vVeQytporu+zdcioRvuuJ8oKr3XK3K6KNkj7bVSDISU0XKj7hnxg5m1ek
         xxpvj8Nvb/8vb8JTMIzaZIUNsaTHn4zH+3LDWCSgcpOwHjDOMjbWhm4y1oVhn/OC2PK4
         6V3bVGJotOtUbA2MgodMagr4kLHV/ffVyLkxh7/Yd3sQcyPJPu2W3bfsxe6+QB+PVZNq
         1ELq42c3grhLMO7klDpSN7FHJs5a7H1srVqD/GPUGSu0eygpocoIS9KKBIaP61mEEEWI
         yNIWy6MCLkbJo/gEdDte1GlER6FrDWcAWCT4gN/zvOfyBvcFfkn4J4Clj53XydByu1P9
         b1/w==
X-Gm-Message-State: AC+VfDwZaiNF6DWHTDVuJr+ctjeSwSNPDeS4gIFHio6cMP4QFVN9JL1O
	B4x/xt2KC1IV+seCv8fByeqv69WjvMzSBjZr
X-Google-Smtp-Source: ACHHUZ6m2VKFj3K/UNqUvgayeRcba/umAu/0L+r6NNLaCJqBEDVURTzj5E/ZPtquT1gDPVOPsKex1Q==
X-Received: by 2002:a05:6000:1cf:b0:30a:e619:3a71 with SMTP id t15-20020a05600001cf00b0030ae6193a71mr1173497wrx.23.1686319681374;
        Fri, 09 Jun 2023 07:08:01 -0700 (PDT)
Date: Fri, 9 Jun 2023 16:07:54 +0200
From: David Morel <david.morel@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: samuel.verschelde@vates.fr
Subject: RHEL 8.8 and derivatives: suspend and live migration issue
Message-ID: <ZIMyOmactutaE8h7@raton>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

This mail is meant to be more of a summary plus a heads up, I don't think
there is any action needed on it.

A user reported [1] a crash when live migrating a VM running Rocky Linux
8.8. After investigation it appears to be happening:
- for RHEL derivatives when migrating from 8.7 to 8.8.
- on suspend/resume
- on live migration

With a callstack we provided, Roger Pau Monné quickly identified the
issue as being the addition of:
- x86/idt: Remove address operator on function machine_check() [2]
While missing:
- x86/xen: Split HVM vector callback setup and interrupt gate allocation [3]

Version-wise:
- 4.18.0-466.el8 will start having the issue as it integrate [2].
- 4.18.0-477 are versions used in 8.8 releases, these versions will
  therefore have the issue.
- 4.18.0-488 that can be found in CentOS 8 Stream integrates [3] and
  works fine.

According to the RPM changelog I think the bugzilla entry at RH should
be the number 2187810 [4], but that is not publicly available.

The -488 versions are not yet available for the derivative
distributions. We do not think there is much to do, raising this to
Rocky Linux or Alma directly likely won't change their kernel upgrade
plan.


[1] https://xcp-ng.org/forum/topic/7420/live-migrate-of-rocky-linux-8-8-vm-crashes-reboots-vm
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/xen/events/events_base.c?id=fbaed278a3cc72a46aadae667b8c6754b78640a6
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/xen/events/events_base.c?id=a0bb51f2638e0810c347024679239fd10a8f7990
[4] https://bugzilla.redhat.com/show_bug.cgi?id=2187810

-- 
David Morel

