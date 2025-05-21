Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00311ABFED3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 23:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992593.1376272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqpB-0007x5-Mo; Wed, 21 May 2025 21:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992593.1376272; Wed, 21 May 2025 21:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqpB-0007uu-KD; Wed, 21 May 2025 21:18:05 +0000
Received: by outflank-mailman (input) for mailman id 992593;
 Wed, 21 May 2025 21:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHqp9-0007uo-7x
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 21:18:04 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12f9be76-3689-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 23:18:00 +0200 (CEST)
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
X-Inumbo-ID: 12f9be76-3689-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=4yrzmnskpfgtvhlus3yx2ch2xa.protonmail; t=1747862279; x=1748121479;
	bh=U7qB+1IJjVuCW7oZXlL4+b6qlPeT+pYJk0YLTyjZ9z0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=XEMiqO1xoN8xLoUVyoPNxM6ntWtvaJjqE9LIgqnWDcVxN6u1+IYE2UIQ5IIBiJ4c/
	 JiJ29j9ta/bbrktcvhsD+2QjFDF7h9nQx+OV/7xQa4HfTg2+t98kPr0rzVvyOakE61
	 C7WCmwFYF8gx/uJfQGAflpQ6aTnhV2+FnClOX5p8ZNqxC++9jzgIvRPkHfxTZtafUX
	 nOnAomSblJk9N7yLu9xm0oZ5LvvVYC7mJVNv5N10SiS/vK/UiQbs7zW9OvK6ncfif7
	 EPUglGQnj6o/U+n8CqJlty2Y6tb49pg/p39YxFoCK6gtYvtM808PT+Ly3BQBDN5zvz
	 SZw6ly++opP7A==
Date: Wed, 21 May 2025 21:17:53 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, michal.orzel@amd.com, persaur@gmail.com, dmukhin@ford.com
Subject: [XTF PATCH v2 0/2] xtf: integrate argo test
Message-ID: <20250521211742.2997890-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 583ebcbd4b2e4937a661644facfb7591f58a5820
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series integrates an XTF argo test available at [1].

Patch 1 is the original test.
Patch 2 adds fixups to run the test under QEMU environment in gitlab CI.

[1] https://github.com/dozylynx/meta-argo/blob/master/recipes-extended/xen/=
xtf/0001-Add-Argo-test.patch
[2] Link to v1: https://lore.kernel.org/xen-devel/20250416050443.919751-1-d=
mukhin@ford.com/
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/10=
110489477

Christopher Clark (1):
  tests/argo: Add argo test suite

Denis Mukhin (1):
  tests/argo: use event channel to get own domain ID

 common/lib.c                |  34 +++-
 docs/all-tests.dox          |   2 +
 include/xen/argo.h          | 259 ++++++++++++++++++++++++++
 include/xen/event_channel.h |  34 ++++
 include/xtf/hypercall.h     |   1 +
 include/xtf/numbers.h       |   5 +
 tests/argo/Makefile         |   9 +
 tests/argo/main.c           | 353 ++++++++++++++++++++++++++++++++++++
 8 files changed, 696 insertions(+), 1 deletion(-)
 create mode 100644 include/xen/argo.h
 create mode 100644 tests/argo/Makefile
 create mode 100644 tests/argo/main.c

--=20
2.34.1



