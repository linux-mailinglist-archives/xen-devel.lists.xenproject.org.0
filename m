Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B0A6D846
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925306.1328183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twf4w-0000ll-H1; Mon, 24 Mar 2025 10:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925306.1328183; Mon, 24 Mar 2025 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twf4w-0000iu-Dz; Mon, 24 Mar 2025 10:30:46 +0000
Received: by outflank-mailman (input) for mailman id 925306;
 Mon, 24 Mar 2025 10:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XGTf=WL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1twf4v-0000cl-Bf
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:30:45 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 072795e4-089b-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 11:30:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 00E54A0215;
 Mon, 24 Mar 2025 11:30:38 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coyK-WkaRptV; Mon, 24 Mar 2025 11:30:37 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B94B3A01A9;
 Mon, 24 Mar 2025 11:30:37 +0100 (CET)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1twf4n-0000000A8Du-29Je; Mon, 24 Mar 2025 11:30:37 +0100
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
X-Inumbo-ID: 072795e4-089b-11f0-9ffa-bf95429c2676
Date: Mon, 24 Mar 2025 11:30:37 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
Message-ID: <Z-E0TUu_LWkXt-wI@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com>
 <Z99PXOXocyuZtf_X@begin>
 <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
 <abce7ac0-21bd-409c-bc4c-f08d04a5a5d1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abce7ac0-21bd-409c-bc4c-f08d04a5a5d1@suse.com>
Organization: I am not organized

Jan Beulich, le lun. 24 mars 2025 11:21:48 +0100, a ecrit:
> On 23.03.2025 15:57, Jürgen Groß wrote:
> > On 23.03.25 01:01, Samuel Thibault wrote:
> >> Juergen Gross, le ven. 21 mars 2025 10:31:44 +0100, a ecrit:
> >>> Add a file operations fstat hook to the 9pfs frontend.
> >>>
> >>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> >>> ---
> >>> V2:
> >>> - or file access mode into st_mode (Jason Andryuk)
> >>> ---
> >>>   9pfront.c | 29 +++++++++++++++++++++++++++++
> >>>   1 file changed, 29 insertions(+)
> >>>
> >>> diff --git a/9pfront.c b/9pfront.c
> >>> index 1741d600..7257a07e 100644
> >>> --- a/9pfront.c
> >>> +++ b/9pfront.c
> >>> @@ -85,6 +85,8 @@ struct file_9pfs {
> >>>   
> >>>   #define P9_QID_SIZE    13
> >>>   
> >>> +#define QID_TYPE_DIR   0x80     /* Applies to qid[0]. */
> >>> +
> >>>   struct p9_header {
> >>>       uint32_t size;
> >>>       uint8_t cmd;
> >>> @@ -950,6 +952,32 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
> >>>       return ret;
> >>>   }
> >>>   
> >>> +static int fstat_9pfs(struct file *file, struct stat *buf)
> >>> +{
> >>> +    struct file_9pfs *f9pfs = file->filedata;
> >>> +    struct p9_stat stat;
> >>> +    int ret;
> >>> +
> >>> +    ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
> >>> +    if ( ret )
> >>> +    {
> >>> +        errno = EIO;
> >>> +        return -1;
> >>> +    }
> >>> +
> >>> +    buf->st_mode = (stat.qid[0] == QID_TYPE_DIR) ? S_IFDIR : S_IFREG;
> >>> +    buf->st_mode |= stat.mode & 0777;
> >>> +    buf->st_atime = stat.atime;
> >>> +    buf->st_mtime = stat.mtime;
> >>
> >> Should we perhaps also fill st_ctime? Leaving it at 0 could surprise
> >> other software layers.
> > 
> > I can set it to the same value as st_mtime.
> 
> Maybe the smaller of atime and mtime?

That'd be better, yes.

Samuel

