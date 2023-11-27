Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DA7FAB08
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642583.1002176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hvL-0003rk-DX; Mon, 27 Nov 2023 20:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642583.1002176; Mon, 27 Nov 2023 20:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hvL-0003ot-AI; Mon, 27 Nov 2023 20:09:43 +0000
Received: by outflank-mailman (input) for mailman id 642583;
 Mon, 27 Nov 2023 20:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hvJ-0003IH-Hf
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:09:41 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e402fc08-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:09:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 940832010A;
 Mon, 27 Nov 2023 21:09:37 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hxlmaxEIvo1; Mon, 27 Nov 2023 21:09:37 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 7EE4220109;
 Mon, 27 Nov 2023 21:09:37 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hvF-00000005cx2-0yro; Mon, 27 Nov 2023 21:09:37 +0100
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
X-Inumbo-ID: e402fc08-8d60-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:09:37 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 00/32] Mini-OS: hide mini-os internal symbols
Message-ID: <20231127200937.33qm6fos43qcvuo7@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Juergen Gross, le lun. 27 nov. 2023 11:24:51 +0100, a ecrit:
>   Mini-OS: add EXPORT_SYMBOL() instances to ioremap.c
>   Mini-OS: add EXPORT_SYMBOL() instances to lwip-*.c
>   Mini-OS: add EXPORT_SYMBOL() instances to netfront.c
>   Mini-OS: add EXPORT_SYMBOL() instances to tpm_tis.c

I didn't receive the mails for those, but I went to the list archive,
and here it is for them:

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

