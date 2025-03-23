Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69FA6CFD4
	for <lists+xen-devel@lfdr.de>; Sun, 23 Mar 2025 15:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925037.1327927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twMmP-0005m8-Mq; Sun, 23 Mar 2025 14:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925037.1327927; Sun, 23 Mar 2025 14:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twMmP-0005jf-Jg; Sun, 23 Mar 2025 14:58:25 +0000
Received: by outflank-mailman (input) for mailman id 925037;
 Sun, 23 Mar 2025 14:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaZ1=WK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1twMmO-0005jR-4b
 for xen-devel@lists.xenproject.org; Sun, 23 Mar 2025 14:58:24 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40dd8031-07f7-11f0-9ffa-bf95429c2676;
 Sun, 23 Mar 2025 15:58:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 55FFDA47B9;
 Sun, 23 Mar 2025 15:58:17 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gc5BGBd5RWQq; Sun, 23 Mar 2025 15:58:17 +0100 (CET)
Received: from begin (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1A7A3A20EC;
 Sun, 23 Mar 2025 15:58:17 +0100 (CET)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1twMmG-0000000Gng4-2HjL; Sun, 23 Mar 2025 15:58:16 +0100
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
X-Inumbo-ID: 40dd8031-07f7-11f0-9ffa-bf95429c2676
Date: Sun, 23 Mar 2025 15:58:16 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
Message-ID: <Z-AhiCM8j--cbLBV@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com>
 <Z99PXOXocyuZtf_X@begin>
 <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
Organization: I am not organized

Jürgen Groß, le dim. 23 mars 2025 15:57:16 +0100, a ecrit:
> On 23.03.25 01:01, Samuel Thibault wrote:
> > Juergen Gross, le ven. 21 mars 2025 10:31:44 +0100, a ecrit:
> > > Add a file operations fstat hook to the 9pfs frontend.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> > > ---
> > > V2:
> > > - or file access mode into st_mode (Jason Andryuk)
> > > ---
> > >   9pfront.c | 29 +++++++++++++++++++++++++++++
> > >   1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/9pfront.c b/9pfront.c
> > > index 1741d600..7257a07e 100644
> > > --- a/9pfront.c
> > > +++ b/9pfront.c
> > > @@ -85,6 +85,8 @@ struct file_9pfs {
> > >   #define P9_QID_SIZE    13
> > > +#define QID_TYPE_DIR   0x80     /* Applies to qid[0]. */
> > > +
> > >   struct p9_header {
> > >       uint32_t size;
> > >       uint8_t cmd;
> > > @@ -950,6 +952,32 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
> > >       return ret;
> > >   }
> > > +static int fstat_9pfs(struct file *file, struct stat *buf)
> > > +{
> > > +    struct file_9pfs *f9pfs = file->filedata;
> > > +    struct p9_stat stat;
> > > +    int ret;
> > > +
> > > +    ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
> > > +    if ( ret )
> > > +    {
> > > +        errno = EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    buf->st_mode = (stat.qid[0] == QID_TYPE_DIR) ? S_IFDIR : S_IFREG;
> > > +    buf->st_mode |= stat.mode & 0777;
> > > +    buf->st_atime = stat.atime;
> > > +    buf->st_mtime = stat.mtime;
> > 
> > Should we perhaps also fill st_ctime? Leaving it at 0 could surprise
> > other software layers.
> 
> I can set it to the same value as st_mtime.

That'd be preferrable, yes.

With that,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!
Samuel

