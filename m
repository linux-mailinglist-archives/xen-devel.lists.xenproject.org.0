Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D82D84E8
	for <lists+xen-devel@lfdr.de>; Sat, 12 Dec 2020 06:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50783.89948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knxhf-0003Lo-SY; Sat, 12 Dec 2020 05:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50783.89948; Sat, 12 Dec 2020 05:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knxhf-0003LP-P6; Sat, 12 Dec 2020 05:44:23 +0000
Received: by outflank-mailman (input) for mailman id 50783;
 Fri, 11 Dec 2020 17:03:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6lN=FP=redhat.com=wainersm@srs-us1.protection.inumbo.net>)
 id 1knlpf-0000wk-Iu
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 17:03:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a81dd4fe-f9fd-4ad7-ad25-1476d485ed22;
 Fri, 11 Dec 2020 17:03:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-j0uHi-AaORKFbfD_QMHVaQ-1; Fri, 11 Dec 2020 12:03:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDC751087D78;
 Fri, 11 Dec 2020 17:03:40 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E77FB5D9E8;
 Fri, 11 Dec 2020 17:03:31 +0000 (UTC)
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
X-Inumbo-ID: a81dd4fe-f9fd-4ad7-ad25-1476d485ed22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607706228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Leog1T7cuecv5R6fqJMs7ncd85agCnp/s8z42hrWKr0=;
	b=eVAKegW8IydJQr3d398gO9kE7OusJBSimgGMoJwdpli45Dxuy/vQVDtyn3H6UtPL9EiJij
	UHx1e4lUSwLpPdej8E9PlP9N1yrDrAzJx1VXGb6mdJODEmv6wTXqqX21199/xA7DVbpN/9
	wGWrJTYXccckuvAEn70DkeMSFareqlU=
X-MC-Unique: j0uHi-AaORKFbfD_QMHVaQ-1
Subject: Re: [PATCH v3 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM
 X86 job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>
References: <20201207131503.3858889-1-philmd@redhat.com>
 <20201207131503.3858889-2-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <41db8ee1-23bf-bbde-f99a-5a314fac215d@redhat.com>
Date: Fri, 11 Dec 2020 14:03:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207131503.3858889-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

Hi,

On 12/7/20 10:14 AM, Philippe Mathieu-Daudé wrote:
> Document what this job cover (build X86 targets with
> KVM being the single accelerator available).
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d0173e82b16..ee31b1020fe 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -220,6 +220,11 @@ build-disabled:
>         s390x-softmmu i386-linux-user
>       MAKE_CHECK_ARGS: check-qtest SPEED=slow
>   
> +# This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
> +# the configure script. The container doesn't contain Xen headers so
> +# Xen accelerator is not detected / selected. As result it build the
> +# i386-softmmu and x86_64-softmmu with KVM being the single accelerator
> +# available.
>   build-tcg-disabled:
>     <<: *native_build_job_definition
>     variables:


