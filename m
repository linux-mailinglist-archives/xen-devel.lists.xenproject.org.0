Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518E7704ED
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 17:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577225.904216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwsP-0004XH-Q8; Fri, 04 Aug 2023 15:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577225.904216; Fri, 04 Aug 2023 15:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwsP-0004Uc-LL; Fri, 04 Aug 2023 15:38:05 +0000
Received: by outflank-mailman (input) for mailman id 577225;
 Fri, 04 Aug 2023 15:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRwsO-0004UW-98
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 15:38:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5ac15be-32dc-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 17:38:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0235D4EE0737;
 Fri,  4 Aug 2023 17:38:01 +0200 (CEST)
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
X-Inumbo-ID: e5ac15be-32dc-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Fri, 04 Aug 2023 17:38:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 6/6] x86: refactor macros in 'xen-mca.h' to address
 MISRA C:2012 Rule 5.3
In-Reply-To: <9d89a58ef016d96da7c3f329fb367f99d169cae6.1691162261.git.nicola.vetrini@bugseng.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <9d89a58ef016d96da7c3f329fb367f99d169cae6.1691162261.git.nicola.vetrini@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a3459c0d04b900f9164bd849cf264134@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


> -            _mic = x86_mcinfo_next(_mic);                       \
> +            mic_ = x86_mcinfo_next(mic_);                         \
>          }                                                       \
> -        (_ret) = found ? _mic : NULL;                           \
> +        (ret) = found_ ? mic_ : NULL;                            \
>      } while (0)
> 
> 
> --
> 2.34.1

Stray blanks here, sorry.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

