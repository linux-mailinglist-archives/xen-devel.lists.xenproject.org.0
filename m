Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E762D0A75
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 06:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45914.81462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km9YH-0002Pt-Pk; Mon, 07 Dec 2020 05:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45914.81462; Mon, 07 Dec 2020 05:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km9YH-0002PU-M7; Mon, 07 Dec 2020 05:59:13 +0000
Received: by outflank-mailman (input) for mailman id 45914;
 Mon, 07 Dec 2020 05:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1km9YF-0002PO-Po
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 05:59:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 238e397c-aeda-46a7-a233-92c85f16861e;
 Mon, 07 Dec 2020 05:59:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-GsG9jOd1Pp6VMq2f2a2Jhg-1; Mon, 07 Dec 2020 00:59:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98228802B40;
 Mon,  7 Dec 2020 05:59:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5295A5D6AB;
 Mon,  7 Dec 2020 05:58:56 +0000 (UTC)
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
X-Inumbo-ID: 238e397c-aeda-46a7-a233-92c85f16861e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607320751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J79ha+sdFVJY1jQ5SwPfSjjvCpXuHs7w7E0i9lDztTg=;
	b=Mf4DPmD7vZ6/zk+ycgkF3NO47KOkf9/IzzOIYPL97qOMZFR+gRu0y1fyJPSrObAgyTUrgk
	mMOCub9rP5xGEYj/i043Wz3rnLmFzFxZZNO+BQyEbr73DsdaPlVA+VqjjzGZE083r2cX7o
	5zxoQ9RKt8AY93sZtJs5ZxRasy+4srA=
X-MC-Unique: GsG9jOd1Pp6VMq2f2a2Jhg-1
Subject: Re: [PATCH 7/8] gitlab-ci: Add KVM MIPS cross-build jobs
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
 <20201206185508.3545711-8-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <112e7a72-1269-2df5-e573-74963db7396a@redhat.com>
Date: Mon, 7 Dec 2020 06:58:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> Cross-build mips target with KVM and TCG accelerators enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> later we'll build KVM-only.
> ---
>  .gitlab-ci.d/crossbuilds-kvm-mips.yml | 5 +++++
>  .gitlab-ci.yml                        | 1 +
>  MAINTAINERS                           | 1 +
>  3 files changed, 7 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml
> 
> diff --git a/.gitlab-ci.d/crossbuilds-kvm-mips.yml b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
> new file mode 100644
> index 00000000000..81eeeb315bb
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
> @@ -0,0 +1,5 @@
> +cross-mips64el-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-mips64el-cross
> +    TARGETS: mips64el-softmmu

That's already covered, see:

https://gitlab.com/qemu-project/qemu/-/jobs/883985068#L296

 Thomas


