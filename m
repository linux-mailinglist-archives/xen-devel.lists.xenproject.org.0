Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACC4AF262
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269116.463109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmjf-0003aP-FK; Wed, 09 Feb 2022 13:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269116.463109; Wed, 09 Feb 2022 13:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmjf-0003Ya-BP; Wed, 09 Feb 2022 13:10:15 +0000
Received: by outflank-mailman (input) for mailman id 269116;
 Wed, 09 Feb 2022 13:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50R8=SY=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nHmjd-0003YU-87
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:10:13 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c76d170-89a9-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:10:11 +0100 (CET)
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
X-Inumbo-ID: 9c76d170-89a9-11ec-8f75-fffcc8bd4f1a
From: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
To: xen-devel@lists.xenproject.org
Cc: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
Subject: [PATCH 0/2] x86: Use Multiboot framebuffer
Date: Wed,  9 Feb 2022 14:09:05 +0100
Message-Id: <20220209130907.252-1-dinhngoc.tu@irit.fr>
Content-Transfer-Encoding: 8bit

Xen does not currently use the Multiboot framebuffer. This means there
is no graphics when booting Xen with Kexec.

This patchset parses and uses the Multiboot framebuffer information
during boot.

Tu Dinh Ngoc (2):
  x86: Parse Multiboot2 framebuffer information
  x86: Set up framebuffer given by Multiboot2

 xen/arch/x86/boot/reloc.c    | 22 ++++++++++++++++++
 xen/arch/x86/setup.c         | 45 +++++++++++++++++++++++++++++++++---
 xen/include/xen/multiboot.h  | 17 ++++++++++++++
 xen/include/xen/multiboot2.h | 33 ++++++++++++++++++++++++++
 4 files changed, 114 insertions(+), 3 deletions(-)

-- 
2.25.1


