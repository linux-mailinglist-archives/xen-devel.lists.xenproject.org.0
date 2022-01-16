Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D842B48FEDB
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:41:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257941.443600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CKs-0006vP-NI; Sun, 16 Jan 2022 20:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257941.443600; Sun, 16 Jan 2022 20:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CKs-0006tA-KI; Sun, 16 Jan 2022 20:41:10 +0000
Received: by outflank-mailman (input) for mailman id 257941;
 Sun, 16 Jan 2022 20:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CKr-00061S-N5
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:41:09 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1a934a7-770c-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:41:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 87D6235D;
 Sun, 16 Jan 2022 21:41:07 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcgPmvj1aVF3; Sun, 16 Jan 2022 21:41:06 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id CEAEC9E;
 Sun, 16 Jan 2022 21:41:06 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CKn-005uTn-2A;
 Sun, 16 Jan 2022 21:41:05 +0100
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
X-Inumbo-ID: a1a934a7-770c-11ec-a115-11989b9578b4
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:41:05 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 0/5] mini-os: remove struct file dependency on
 config
Message-ID: <20220116204105.lf3uzw2u4hu3l2sx@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116064527.23519-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116064527.23519-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 87D6235D
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le dim. 16 janv. 2022 07:45:22 +0100, a ecrit:
> Today the layout of struct file is depending on the Mini-OS
> configuration. This is especially bad as the layout is exported to
> external users like the Xen libraries built for Mini-OS, and those
> are being built only once for multiple stubdom configurations.
> 
> Today there is no direct problem resulting from this, as the main
> difference between struct file layouts is a large union containing all
> the device specific data for the different file types. The largest
> union member is not configuration dependant, so the build is currently
> not broken.
> 
> In order to avoid any future problems this patch series is eliminating
> the configuration dependency by replacing most of the device specific
> union members by a single pointer.
> 
> The two union members used by Xen libraries can't be replaced yet, as
> those need to be switched to use the generic pointer first.
> 
> In order to hide the Mini-OS internal implementation of the files
> array, patches 1, 2, and  4 are introducing a common framework to
> access a struct file via its file descriptor, and to allocate new file
> types dynamically instead of having them all pre-defined. The file type
> specific operations are supplied via a function vector in order to
> remove the dependency of lib/sys.c on all the various file types.
> 
> Patch 5 is preparing a possible future support of libxenstore instead
> of using the Mini-OS internal variant located in lib/xs.c.

Thanks!

Samuel

