Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB672D0A4F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 06:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45897.81426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km9HU-00013E-QV; Mon, 07 Dec 2020 05:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45897.81426; Mon, 07 Dec 2020 05:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km9HU-00012p-N2; Mon, 07 Dec 2020 05:41:52 +0000
Received: by outflank-mailman (input) for mailman id 45897;
 Mon, 07 Dec 2020 05:41:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1km9HU-00012k-5l
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 05:41:52 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 693cf133-8d0f-46d4-9780-9e7090ec4ca5;
 Mon, 07 Dec 2020 05:41:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-EzR6j0tzNtSU__GG2EUBMw-1; Mon, 07 Dec 2020 00:41:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4CB1005513;
 Mon,  7 Dec 2020 05:41:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 409601A262;
 Mon,  7 Dec 2020 05:41:32 +0000 (UTC)
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
X-Inumbo-ID: 693cf133-8d0f-46d4-9780-9e7090ec4ca5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607319711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLuvXS3NI6D8cDyFAW5Sct9681MJ4TRf7wvMzpU1WWE=;
	b=KUTPZe0k7q1cCJJETbf2zJqjPp0nXzm+KcrXR1rYKsmFbQ9eSqclqliSlJpCdEaA+VNbJu
	6QSqjH2jkADchLC+3nqTwy7AQiKQeJphvkyBB+YblFcozhCM/cvhKHxuHEVlj+IZ52YCmw
	zKKSYboTvilOvH8fAIOWiaizBJuJq8E=
X-MC-Unique: EzR6j0tzNtSU__GG2EUBMw-1
Subject: Re: [PATCH 4/8] gitlab-ci: Add KVM ARM cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2a75c6ea-013d-896e-8478-2312957d3ed2@redhat.com>
Date: Mon, 7 Dec 2020 06:41:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> Cross-build ARM aarch64 target with KVM and TCG accelerators enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> later this job will build KVM-only.
> ---
>  .gitlab-ci.d/crossbuilds-kvm-arm.yml | 5 +++++
>  .gitlab-ci.yml                       | 1 +
>  MAINTAINERS                          | 1 +
>  3 files changed, 7 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml
> 
> diff --git a/.gitlab-ci.d/crossbuilds-kvm-arm.yml b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
> new file mode 100644
> index 00000000000..c74c6fdc9fb
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
> @@ -0,0 +1,5 @@
> +cross-arm64-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    TARGETS: aarch64-softmmu

Now that's a little bit surprising, I had expected that the KVM code is
already compiled by the "cross-arm64-system" job ... but looking at the
output of a corresponding pipeline, it says "KVM support: NO", see e.g.:

https://gitlab.com/qemu-project/qemu/-/jobs/883985039#L298

What's going wrong there? ... ah, well, it's because of the
"--target-list-exclude=aarch64-softmmu" in the template :-(
That was stupid. So instead of adding a new job, could you please simply
replace the aarch64-softmmu there by arm-softmmu?

 Thanks,
  Thomas


