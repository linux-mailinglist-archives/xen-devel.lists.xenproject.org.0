Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB63EEABF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 12:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167709.306157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFw8h-0003R6-N4; Tue, 17 Aug 2021 10:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167709.306157; Tue, 17 Aug 2021 10:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFw8h-0003O3-JW; Tue, 17 Aug 2021 10:16:11 +0000
Received: by outflank-mailman (input) for mailman id 167709;
 Tue, 17 Aug 2021 10:16:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O7ht=NI=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mFw8g-0003Nf-3m
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 10:16:10 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 222d78c1-ff44-11eb-a49a-12813bfff9fa;
 Tue, 17 Aug 2021 10:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id C30FE140;
 Tue, 17 Aug 2021 12:16:06 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDfEdwOskQdw; Tue, 17 Aug 2021 12:16:02 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 054BDB8;
 Tue, 17 Aug 2021 12:16:02 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1mFw8X-002Xl7-Au; Tue, 17 Aug 2021 12:16:01 +0200
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
X-Inumbo-ID: 222d78c1-ff44-11eb-a49a-12813bfff9fa
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 17 Aug 2021 12:16:01 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/2] mini-os: move test functions under CONFIG_TEST
Message-ID: <20210817101601.k6mrqh5zje5shgak@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20210817095459.27671-1-jgross@suse.com>
 <20210817095459.27671-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210817095459.27671-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: C30FE140
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Juergen Gross, le mar. 17 août 2021 11:54:59 +0200, a ecrit:
> There is no need to have the xenbus test support functions always
> included in Mini-OS. Move them inside #ifdef CONFIG_TEST.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  xenbus/xenbus.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> index fdb0934..11427ba 100644
> --- a/xenbus/xenbus.c
> +++ b/xenbus/xenbus.c
> @@ -573,21 +573,6 @@ static char *errmsg(struct xsd_sockmsg *rep)
>      return res;
>  }
>  
> -/* Send a debug message to xenbus.  Can block. */
> -static void xenbus_debug_msg(const char *msg)
> -{
> -    int len = strlen(msg);
> -    struct write_req req[] = {
> -        { "print", sizeof("print") },
> -        { msg, len },
> -        { "", 1 }};
> -    struct xsd_sockmsg *reply;
> -
> -    reply = xenbus_msg_reply(XS_DEBUG, 0, req, ARRAY_SIZE(req));
> -    printk("Got a reply, type %d, id %d, len %d.\n",
> -            reply->type, reply->req_id, reply->len);
> -}
> -
>  /* List the contents of a directory.  Returns a malloc()ed array of
>     pointers to malloc()ed strings.  The array is NULL terminated.  May
>     block. */
> @@ -882,6 +867,22 @@ domid_t xenbus_get_self_id(void)
>      return ret;
>  }
>  
> +#ifdef CONFIG_TEST
> +/* Send a debug message to xenbus.  Can block. */
> +static void xenbus_debug_msg(const char *msg)
> +{
> +    int len = strlen(msg);
> +    struct write_req req[] = {
> +        { "print", sizeof("print") },
> +        { msg, len },
> +        { "", 1 }};
> +    struct xsd_sockmsg *reply;
> +
> +    reply = xenbus_msg_reply(XS_DEBUG, 0, req, ARRAY_SIZE(req));
> +    printk("Got a reply, type %d, id %d, len %d.\n",
> +            reply->type, reply->req_id, reply->len);
> +}
> +
>  static void do_ls_test(const char *pre)
>  {
>      char **dirs, *msg;
> @@ -968,6 +969,7 @@ void test_xenbus(void)
>      do_read_test("device/vif/0/flibble");
>      printk("(Should have said ENOENT)\n");
>  }
> +#endif /* CONFIG_TEST */
>  
>  /*
>   * Local variables:
> -- 
> 2.26.2
> 

