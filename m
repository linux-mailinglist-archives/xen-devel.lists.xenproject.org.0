Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6C372B1F
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122410.230909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvBC-0004H8-VJ; Tue, 04 May 2021 13:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122410.230909; Tue, 04 May 2021 13:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvBC-0004GX-Rn; Tue, 04 May 2021 13:33:38 +0000
Received: by outflank-mailman (input) for mailman id 122410;
 Tue, 04 May 2021 13:33:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1ldvBB-0004G9-EV
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:33:37 +0000
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37a5966d-879d-4acb-b38b-1f8b8a61e75a;
 Tue, 04 May 2021 13:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 0822B1E8;
 Tue,  4 May 2021 15:33:35 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMAOUrG6GVvo; Tue,  4 May 2021 15:33:34 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id F20F5194;
 Tue,  4 May 2021 15:33:33 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldvB6-00FpmX-So; Tue, 04 May 2021 15:33:32 +0200
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
X-Inumbo-ID: 37a5966d-879d-4acb-b38b-1f8b8a61e75a
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 15:33:32 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 9/9] vtpmmgr: Support GetRandom passthrough on TPM 2.0
Message-ID: <20210504133332.pt56xjrxvbnz2htd@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-10-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124842.220445-10-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 0822B1E8
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 08:48:42 -0400, a ecrit:
> GetRandom passthrough currently fails when using vtpmmgr with a hardware
> TPM 2.0.
> vtpmmgr (8): INFO[VTPM]: Passthrough: TPM_GetRandom
> vtpm (12): vtpm_cmd.c:120: Error: TPM_GetRandom() failed with error code (30)
> 
> When running on TPM 2.0 hardware, vtpmmgr needs to convert the TPM 1.2
> TPM_ORD_GetRandom into a TPM2 TPM_CC_GetRandom command.  Besides the
> differing ordinal, the TPM 1.2 uses 32bit sizes for the request and
> response (vs. 16bit for TPM2).
> 
> Place the random output directly into the tpmcmd->resp and build the
> packet around it.  This avoids bouncing through an extra buffer, but the
> header has to be written after grabbing the random bytes so we have the
> number of bytes to include in the size.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  stubdom/vtpmmgr/marshal.h          | 10 +++++++
>  stubdom/vtpmmgr/vtpm_cmd_handler.c | 48 ++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/stubdom/vtpmmgr/marshal.h b/stubdom/vtpmmgr/marshal.h
> index dce19c6439..20da22af09 100644
> --- a/stubdom/vtpmmgr/marshal.h
> +++ b/stubdom/vtpmmgr/marshal.h
> @@ -890,6 +890,15 @@ inline int sizeof_TPM_AUTH_SESSION(const TPM_AUTH_SESSION* auth) {
>  	return rv;
>  }
>  
> +static
> +inline int sizeof_TPM_RQU_HEADER(BYTE* ptr) {
> +	int rv = 0;
> +	rv += sizeof_UINT16(ptr);
> +	rv += sizeof_UINT32(ptr);
> +	rv += sizeof_UINT32(ptr);
> +	return rv;
> +}
> +
>  static
>  inline BYTE* pack_TPM_RQU_HEADER(BYTE* ptr,
>  		TPM_TAG tag,
> @@ -923,5 +932,6 @@ inline int unpack3_TPM_RQU_HEADER(BYTE* ptr, UINT32* pos, UINT32 max,
>  #define pack_TPM_RSP_HEADER(p, t, s, r) pack_TPM_RQU_HEADER(p, t, s, r)
>  #define unpack_TPM_RSP_HEADER(p, t, s, r) unpack_TPM_RQU_HEADER(p, t, s, r)
>  #define unpack3_TPM_RSP_HEADER(p, l, m, t, s, r) unpack3_TPM_RQU_HEADER(p, l, m, t, s, r)
> +#define sizeof_TPM_RSP_HEADER(p) sizeof_TPM_RQU_HEADER(p)
>  
>  #endif
> diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> index 2ac14fae77..7ca1d9df94 100644
> --- a/stubdom/vtpmmgr/vtpm_cmd_handler.c
> +++ b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> @@ -47,6 +47,7 @@
>  #include "vtpm_disk.h"
>  #include "vtpmmgr.h"
>  #include "tpm.h"
> +#include "tpm2.h"
>  #include "tpmrsa.h"
>  #include "tcg.h"
>  #include "mgmt_authority.h"
> @@ -772,6 +773,52 @@ static int vtpmmgr_permcheck(struct tpm_opaque *opq)
>  	return 1;
>  }
>  
> +TPM_RESULT vtpmmgr_handle_getrandom(struct tpm_opaque *opaque,
> +				    tpmcmd_t* tpmcmd)
> +{
> +	TPM_RESULT status = TPM_SUCCESS;
> +	TPM_TAG tag;
> +	UINT32 size;
> +	UINT32 rand_offset;
> +	UINT32 rand_size;
> +	TPM_COMMAND_CODE ord;
> +	BYTE *p;
> +
> +	p = unpack_TPM_RQU_HEADER(tpmcmd->req, &tag, &size, &ord);
> +
> +	if (!hw_is_tpm2()) {
> +		size = TCPA_MAX_BUFFER_LENGTH;
> +		TPMTRYRETURN(TPM_TransmitData(tpmcmd->req, tpmcmd->req_len,
> +					      tpmcmd->resp, &size));
> +		tpmcmd->resp_len = size;
> +
> +		return TPM_SUCCESS;
> +	}


We need to check for the size of the request before unpacking (which
doesn't check for it), don't we?

> +	/* TPM_GetRandom req: <header><uint32 num bytes> */
> +	unpack_UINT32(p, &rand_size);
> +
> +	/* Call TPM2_GetRandom but return a TPM_GetRandom response. */
> +	/* TPM_GetRandom resp: <header><uint32 num bytes><num random bytes> */
> +        rand_offset = sizeof_TPM_RSP_HEADER(tpmcmd->resp) +
> +		      sizeof_UINT32(tpmcmd->resp);

There is a spurious indentation here, at first sight I even thought it
was part of the comment.


We also need to check that rand_size is not too large?
- that the returned data won't overflow tpmcmd->resp + rand_offset
- that it fits in a UINT16

Also, TPM2_GetRandom casts bytesRequested into UINT16*, that's bogus, it
should use a local UINT16 variable and assign *bytesRequested.

> +	TPMTRYRETURN(TPM2_GetRandom(&rand_size, tpmcmd->resp + rand_offset));
> +
> +	p = pack_TPM_RSP_HEADER(tpmcmd->resp, TPM_TAG_RSP_COMMAND,
> +				rand_offset + rand_size, status);
> +	p = pack_UINT32(p, rand_size);
> +	tpmcmd->resp_len = rand_offset + rand_size;
> +
> +	return status;
> +
> +abort_egress:
> +	tpmcmd->resp_len = VTPM_COMMAND_HEADER_SIZE;
> +	pack_TPM_RSP_HEADER(tpmcmd->resp, tag + 3, tpmcmd->resp_len, status);
> +
> +	return status;
> +}
> +
>  TPM_RESULT vtpmmgr_handle_cmd(
>  		struct tpm_opaque *opaque,
>  		tpmcmd_t* tpmcmd)
> @@ -842,6 +889,7 @@ TPM_RESULT vtpmmgr_handle_cmd(
>  		switch(ord) {
>  		case TPM_ORD_GetRandom:
>  			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_GetRandom\n");
> +			return vtpmmgr_handle_getrandom(opaque, tpmcmd);
>  			break;

Drop the break, then. I would say also move (or drop) the log, like the
other cases.

>  		case TPM_ORD_PcrRead:
>  			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_PcrRead\n");
> -- 
> 2.30.2
> 

