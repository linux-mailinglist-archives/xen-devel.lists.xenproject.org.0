Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FF2D0F87
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46336.82231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEqP-000895-1P; Mon, 07 Dec 2020 11:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46336.82231; Mon, 07 Dec 2020 11:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEqO-00088f-Ti; Mon, 07 Dec 2020 11:38:16 +0000
Received: by outflank-mailman (input) for mailman id 46336;
 Mon, 07 Dec 2020 11:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kmEqN-00088a-5J
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:38:15 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cbe50e0a-31fb-4b73-96c4-b1d970159f10;
 Mon, 07 Dec 2020 11:38:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-sho2lGVVNdOBmTUquj-bNA-1; Mon, 07 Dec 2020 06:38:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D013B180A08A;
 Mon,  7 Dec 2020 11:38:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 195BC60BD8;
 Mon,  7 Dec 2020 11:38:00 +0000 (UTC)
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
X-Inumbo-ID: cbe50e0a-31fb-4b73-96c4-b1d970159f10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607341094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=muAFbZHcdnlA540NVtllekXZu37z+fEhka8P0LY3Jqw=;
	b=Levx0tKtdR2is0Sa1SwqQws+LdMGx3xmYaaLxkpgpHCdjSQ7g1jWGNKP0bycmf3WG4ptPk
	teTjg2w6RpVeJJg+5VHCfyFBkpiyfU6UcAkTXbbr4Ucv5sqJWB+dKyZp2x1JH7+QZHOPMj
	R2PoiMB8sE+VaA+SNLuuJALGpflKRKk=
X-MC-Unique: sho2lGVVNdOBmTUquj-bNA-1
Subject: Re: [PATCH v2 3/5] gitlab-ci: Introduce 'cross_accel_build_job'
 template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-s390x@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20201207112353.3814480-1-philmd@redhat.com>
 <20201207112353.3814480-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <93d186c0-feea-8e47-2a03-5276fb898bff@redhat.com>
Date: Mon, 7 Dec 2020 12:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201207112353.3814480-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11

On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
> Introduce a job template to cross-build accelerator specific
> jobs (enable a specific accelerator, disabling the others).
> 
> The specific accelerator is selected by the $ACCEL environment
> variable (default to KVM).
> 
> Extra options such disabling other accelerators are passed
> via the $ACCEL_CONFIGURE_OPTS environment variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 099949aaef3..d8685ade376 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -13,6 +13,23 @@
>            xtensa-softmmu"
>      - make -j$(expr $(nproc) + 1) all check-build
>  
> +# Job to cross-build specific accelerators.
> +#
> +# Set the $ACCEL variable to select the specific accelerator (default to
> +# KVM), and set extra options (such disabling other accelerators) via the
> +# $ACCEL_CONFIGURE_OPTS variable.
> +.cross_accel_build_job:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  timeout: 30m
> +  script:
> +    - mkdir build
> +    - cd build
> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
> +    - make -j$(expr $(nproc) + 1) all check-build
> +
>  .cross_user_build_job:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest

I wonder whether we could also simply use the .cross_user_build_job - e.g.
by adding a $EXTRA_CONFIGURE_OPTS variable in the "../configure ..." line so
that the accel-jobs could use that for their --enable... and --disable...
settings?

Anyway, I've got no strong opinion on that one, and I'm also fine if we add
this new template, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


