Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A0262BCD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 11:27:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwO8-0005UT-QZ; Wed, 09 Sep 2020 09:27:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akhq=CS=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kFwO8-0005UO-2X
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:27:36 +0000
X-Inumbo-ID: 0aed89db-fa47-479c-8e6b-8a73da7554d6
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0aed89db-fa47-479c-8e6b-8a73da7554d6;
 Wed, 09 Sep 2020 09:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8BB41C283;
 Wed,  9 Sep 2020 11:27:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZP0_A-VLnCKj; Wed,  9 Sep 2020 11:27:32 +0200 (CEST)
Received: from function (lfbn-bor-1-269-41.w109-215.abo.wanadoo.fr
 [109.215.109.41])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id CF347C0EE;
 Wed,  9 Sep 2020 11:27:32 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kFwO3-001izO-TD; Wed, 09 Sep 2020 11:27:31 +0200
Date: Wed, 9 Sep 2020 11:27:31 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2] stubdom: remove tpm_version from vtpmmgr
Message-ID: <20200909092731.gdem7lqj7zkd6qw2@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
References: <20200909085829.29393-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909085829.29393-1-olaf@aepfle.de>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Olaf Hering, le mer. 09 sept. 2020 10:58:28 +0200, a ecrit:
> Giving an enum a name turns it into a variable, which is bad when it is
> done in a header file that is consumbed by multiple files.
> 
> ld: /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpm_cmd_handler.o):(.bss+0x0): multiple definition of `tpm_version'; /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpmmgr.o):(.bss+0x0): first defined here
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/vtpmmgr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubdom/vtpmmgr/vtpmmgr.h b/stubdom/vtpmmgr/vtpmmgr.h
> index 2e6f8de9e4..f40ca9fd67 100644
> --- a/stubdom/vtpmmgr/vtpmmgr.h
> +++ b/stubdom/vtpmmgr/vtpmmgr.h
> @@ -53,7 +53,7 @@
>  enum {
>      TPM1_HARDWARE = 1,
>      TPM2_HARDWARE,
> -} tpm_version;
> +};
>  
>  struct tpm_hardware_version {
>      int hw_version;
> 

