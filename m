Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25092D13EC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 15:45:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46663.82738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmHk9-0006Ct-K9; Mon, 07 Dec 2020 14:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46663.82738; Mon, 07 Dec 2020 14:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmHk9-0006CU-GY; Mon, 07 Dec 2020 14:44:01 +0000
Received: by outflank-mailman (input) for mailman id 46663;
 Mon, 07 Dec 2020 14:43:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kmHk7-0006CP-NL
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 14:43:59 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6714aaeb-98e6-478d-9651-a3b06d8ca960;
 Mon, 07 Dec 2020 14:43:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-SPQGlG4kPs6bEH4OCatr7A-1; Mon, 07 Dec 2020 09:43:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB25107ACE6;
 Mon,  7 Dec 2020 14:43:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0439760C0F;
 Mon,  7 Dec 2020 14:43:45 +0000 (UTC)
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
X-Inumbo-ID: 6714aaeb-98e6-478d-9651-a3b06d8ca960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607352238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yYikCPcIPVfkQPyOTA1er7+ojxS2PgeXAGCbiR51IuI=;
	b=bGKLa0MHvrZRLICou5EsDR8Q3ushej4hUwOpVkHDdpmIs5cDDMJG3N7qvvxYAFib0ya6Bo
	Rqh1cs4xu78ty3o1kuR/hsF3TGSpS11JVMrxcLVJxXE+ONfxQrnbahAphLWDJXkSL8OETA
	QAZpx9a1LoIT2SjF6RBJx9Jm6dgl3XE=
X-MC-Unique: SPQGlG4kPs6bEH4OCatr7A-1
Subject: Re: [PATCH v3 5/5] gitlab-ci: Add Xen cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20201207131503.3858889-1-philmd@redhat.com>
 <20201207131503.3858889-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f69be51c-1a16-8c5a-f46c-d621d905c9ca@redhat.com>
Date: Mon, 7 Dec 2020 15:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201207131503.3858889-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12

On 07/12/2020 14.15, Philippe Mathieu-Daudé wrote:
> Cross-build ARM and X86 targets with only Xen accelerator enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 51896bbc9fb..bd6473a75a7 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -134,3 +134,17 @@ cross-win64-system:
>    extends: .cross_system_build_job
>    variables:
>      IMAGE: fedora-win64-cross
> +
> +cross-amd64-xen-only:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-amd64-cross
> +    ACCEL: xen
> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +
> +cross-arm64-xen-only:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    ACCEL: xen
> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm

Reviewed-by: Thomas Huth <thuth@redhat.com>



