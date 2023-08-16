Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4577E4E5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 17:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584798.915630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWIIC-00033r-Qf; Wed, 16 Aug 2023 15:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584798.915630; Wed, 16 Aug 2023 15:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWIIC-00031c-NE; Wed, 16 Aug 2023 15:18:40 +0000
Received: by outflank-mailman (input) for mailman id 584798;
 Wed, 16 Aug 2023 15:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hDLr=EB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWIIB-00031W-1Z
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 15:18:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c41078b-3c48-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 17:18:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D05D84EE0737;
 Wed, 16 Aug 2023 17:18:36 +0200 (CEST)
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
X-Inumbo-ID: 2c41078b-3c48-11ee-8779-cb3800f73035
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 17:18:36 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Remove unused function 'do_trap_fiq'
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <21c76788cbf4b79d4b77721cbdb956ca@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

the function mentioned in the subject, defined in 'xen/arch/arm/traps.c' 
seems to have no
caller (either from C code or from asm code), so I think it can be 
safely removed, unless
there's a reason for it to remain in Xen.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

