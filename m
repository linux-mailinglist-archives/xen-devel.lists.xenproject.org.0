Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2D7CB6E6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 01:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617945.961087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsWnB-0004fB-4M; Mon, 16 Oct 2023 23:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617945.961087; Mon, 16 Oct 2023 23:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsWnB-0004d6-1p; Mon, 16 Oct 2023 23:14:33 +0000
Received: by outflank-mailman (input) for mailman id 617945;
 Mon, 16 Oct 2023 23:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uuB=F6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsWn9-0004d0-QR
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 23:14:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1c15347-6c79-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 01:14:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AAB1661043;
 Mon, 16 Oct 2023 23:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5F8C433C7;
 Mon, 16 Oct 2023 23:14:27 +0000 (UTC)
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
X-Inumbo-ID: c1c15347-6c79-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697498068;
	bh=6IGtM0EZqDQT9GRTPqAUlHC8FjNRqNvHP/nOPQFsQH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qXnUnidEyHVTdNQi93B4PBJpz/gQDbRid0Xhk1n9+0mJ3ybAFj5ZeBKJXeOZEOjqC
	 kppMI5ygrA6++qlbIPEevMKEeVmX4Cu83Jkut1vchE9/ONDHKgzlwYNCl4c1vqxecr
	 S3m5jafzS40+7TgMZYlHT3E8IQkYndE+haDCwnspOcksqQmrKQPMGntZb4GFR/yhM4
	 HasEEveDsKasgzH8EF4+B7a4hp/JrRc1IoXYuDht3iQ6D6TlzJOfdkTujNEQX5aTmJ
	 o2C1kvZ3qRTu3UGN6/dScVWK19u9b46u4w69qJqMh2kuKB4WR+TGlJBsl+94/uOT4u
	 uehLzUA+uCxEQ==
Date: Mon, 16 Oct 2023 16:14:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@cloud.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, jgross@suse.com, 
    julien@xen.org, wl@xen.org, Henry.Wang@arm.com
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
In-Reply-To: <20231013230624.1007969-1-sstabellini@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2310161614080.965337@ubuntu-linux-20-04-desktop>
References: <20231013230624.1007969-1-sstabellini@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Henry for release ack


On Fri, 13 Oct 2023, Stefano Stabellini wrote:
> From: George Dunlap <george.dunlap@cloud.com>
> 
> Commit fc2b57c9a ("xenstored: send an evtchn notification on
> introduce_domain") introduced the sending of an event channel to the
> guest when first introduced, so that dom0less domains waiting for the
> connection would know that xenstore was ready to use.
> 
> Unfortunately, it was introduced in introduce_domain(), which 1) is
> called by other functions, where such functionality is unneeded, and
> 2) after the main XS_INTRODUCE call, calls domain_conn_reset().  This
> introduces a race condition, whereby if xenstored is delayed, a domain
> can wake up, send messages to the buffer, only to have them deleted by
> xenstore before finishing its processing of the XS_INTRODUCE message.
> 
> Move the connect-and-notfy call into do_introduce() instead, after the
> domain_conn_rest(); predicated on the state being in the
> XENSTORE_RECONNECT state.
> 
> (We don't need to check for "restoring", since that value is always
> passed as "false" from do_domain_introduce()).
> 
> Also take the opportunity to add a missing wmb barrier after resetting
> the indexes of the ring in domain_conn_reset.
> 
> This change will also remove an extra event channel notification for
> dom0 (because the notification is now done by do_introduce which is not
> called for dom0.) The extra dom0 event channel notification was only
> introduced by fc2b57c9a and was never present before. It is not needed
> because dom0 is the one to tell xenstored the connection parameters, so
> dom0 has to know that the ring page is setup correctly by the time
> xenstored starts looking at it. It is dom0 that performs the ring page
> init.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> CC: jgross@suse.com
> CC: julien@xen.org
> CC: wl@xen.org
> ---
>  tools/xenstored/domain.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index a6cd199fdc..f6ef37856c 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -923,6 +923,7 @@ static void domain_conn_reset(struct domain *domain)
>  
>  	domain->interface->req_cons = domain->interface->req_prod = 0;
>  	domain->interface->rsp_cons = domain->interface->rsp_prod = 0;
> +	xen_wmb();
>  }
>  
>  /*
> @@ -988,12 +989,6 @@ static struct domain *introduce_domain(const void *ctx,
>  		/* Now domain belongs to its connection. */
>  		talloc_steal(domain->conn, domain);
>  
> -		if (!restore) {
> -			/* Notify the domain that xenstore is available */
> -			interface->connection = XENSTORE_CONNECTED;
> -			xenevtchn_notify(xce_handle, domain->port);
> -		}
> -
>  		if (!is_master_domain && !restore)
>  			fire_special_watches("@introduceDomain");
>  	} else {
> @@ -1033,6 +1028,13 @@ int do_introduce(const void *ctx, struct connection *conn,
>  
>  	domain_conn_reset(domain);
>  
> +	if (domain->interface != NULL &&
> +		domain->interface->connection == XENSTORE_RECONNECT) {
> +		/* Notify the domain that xenstore is available */
> +		domain->interface->connection = XENSTORE_CONNECTED;
> +		xenevtchn_notify(xce_handle, domain->port);
> +	}
> +
>  	send_ack(conn, XS_INTRODUCE);
>  
>  	return 0;
> -- 
> 2.25.1
> 

