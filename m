Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D00D7E70B3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 18:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629758.982175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r197k-0007TR-Ml; Thu, 09 Nov 2023 17:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629758.982175; Thu, 09 Nov 2023 17:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r197k-0007Qv-KA; Thu, 09 Nov 2023 17:47:24 +0000
Received: by outflank-mailman (input) for mailman id 629758;
 Thu, 09 Nov 2023 17:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytJ3=GW=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1r197i-0007Qp-J4
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 17:47:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0788d3fd-7f28-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 18:47:20 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-EZ6tHlzwPby_7c0cJBLdmg-1; Thu,
 09 Nov 2023 12:47:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C40D3C02B66;
 Thu,  9 Nov 2023 17:47:15 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B0140C6EBB;
 Thu,  9 Nov 2023 17:47:13 +0000 (UTC)
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
X-Inumbo-ID: 0788d3fd-7f28-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699552039;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/aKnz+cLm76rsGM493XBc81wW5GTMNFhQApD2Wg+qg=;
	b=NDGadp/drPVqHyrOdpQCE3AI9YI415LDywW+XHexzCW670FI21JdIUP1PpxIxxyo12LBEh
	zuPOjg1WxWqd3eo6xIJmVixKv7r50QHSjlZiiPeHOryVo65vbpUj2Sdwz7RyVKpvNQb/3T
	4mP8Ur3y35rfUODNbLGhzi5dzfs4Pvw=
X-MC-Unique: EZ6tHlzwPby_7c0cJBLdmg-1
Date: Thu, 9 Nov 2023 17:47:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org
Subject: Re: [PATCH] include/hw/xen: Use more inclusive language in comment
Message-ID: <ZU0bH6smC7hF3kk5@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20231109174034.375392-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231109174034.375392-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

On Thu, Nov 09, 2023 at 06:40:34PM +0100, Thomas Huth wrote:
> Let's improve the wording here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/xen/interface/hvm/params.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


