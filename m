Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564392D0A53
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 06:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45903.81438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km9Lp-0001Ey-CK; Mon, 07 Dec 2020 05:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45903.81438; Mon, 07 Dec 2020 05:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km9Lp-0001EZ-8z; Mon, 07 Dec 2020 05:46:21 +0000
Received: by outflank-mailman (input) for mailman id 45903;
 Mon, 07 Dec 2020 05:46:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1km9Lo-0001EU-9o
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 05:46:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 05bddbd3-396a-410d-90cc-96f85654a630;
 Mon, 07 Dec 2020 05:46:19 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-CIJUMShgMsKSfWVbZ8cxNA-1; Mon, 07 Dec 2020 00:46:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD5B3107ACE3;
 Mon,  7 Dec 2020 05:46:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E008F5C1A1;
 Mon,  7 Dec 2020 05:46:02 +0000 (UTC)
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
X-Inumbo-ID: 05bddbd3-396a-410d-90cc-96f85654a630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607319979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dr7XA22zRIJfNYRDzJpq4GgkVnG3M7LcnQEFlOGUwVY=;
	b=SyBm6JkV0rUBmePa1Z+PUBGBlVjSBY/n5PZIBcXMRGKv8aInNoZc0SIqsGZbhjbZkzj3fX
	I0A65U3CpLzeJnSSsqEkAFtIU+a0zsMXDTPb3LwQ2gk0mxrcB4cdZ7zyVj3PKK63XUWMAC
	cnxk6QbU6Cm8tWU13bY6NIdTxPgXrlU=
X-MC-Unique: CIJUMShgMsKSfWVbZ8cxNA-1
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
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
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
Date: Mon, 7 Dec 2020 06:46:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> Cross-build s390x target with only KVM accelerator enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>  .gitlab-ci.yml                         | 1 +
>  MAINTAINERS                            | 1 +
>  3 files changed, 8 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
> 
> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
> new file mode 100644
> index 00000000000..1731af62056
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
> @@ -0,0 +1,6 @@
> +cross-s390x-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-s390x-cross
> +    TARGETS: s390x-softmmu
> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 573afceb3c7..a69619d7319 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -14,6 +14,7 @@ include:
>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'

KVM code is already covered by the "cross-s390x-system" job, but an
additional compilation test with --disable-tcg makes sense here. I'd then
rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".

And while you're at it, I'd maybe rather name the new file just
crossbuilds-s390x.yml and also move the other s390x related jobs into it?

 Thomas


