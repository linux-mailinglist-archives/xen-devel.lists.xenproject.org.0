Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938832D0F96
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:41:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46343.82254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEtE-0000iz-Sx; Mon, 07 Dec 2020 11:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46343.82254; Mon, 07 Dec 2020 11:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEtE-0000iR-PJ; Mon, 07 Dec 2020 11:41:12 +0000
Received: by outflank-mailman (input) for mailman id 46343;
 Mon, 07 Dec 2020 11:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kmEtD-0000i1-Fs
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:41:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e61e124e-7348-4e8c-8f41-671d1a0d8443;
 Mon, 07 Dec 2020 11:41:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-A-HOIe1IPsKJsI0zvd0r6w-1; Mon, 07 Dec 2020 06:41:09 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9CE0107ACE8;
 Mon,  7 Dec 2020 11:41:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 231B85D9DC;
 Mon,  7 Dec 2020 11:40:53 +0000 (UTC)
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
X-Inumbo-ID: e61e124e-7348-4e8c-8f41-671d1a0d8443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607341270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CoKqcZfYBnXMQMOGUtw8RaWj33ktvmZ2VgJzuFiWcTA=;
	b=Z/A3nsSdLNrceb8kWBoVnTq3nU9PlVlMYd69wtRUwZLju1cWAClOrFBIBpxdgD7nm+47xJ
	1HgxmnwmEilFt1ZGuYIny5f0OwhkbWNITFzLSKKrSYkwEg3Dn4ZMNT0QfJnlIANqvdmPSa
	t0Q5FCQy9qR0ZITHGJnWfxcXyhkZCvc=
X-MC-Unique: A-HOIe1IPsKJsI0zvd0r6w-1
Subject: Re: [PATCH v2 4/5] gitlab-ci: Add KVM s390x cross-build jobs
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
 <20201207112353.3814480-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0a0c2002-64e1-0a6d-d520-144b70f2590a@redhat.com>
Date: Mon, 7 Dec 2020 12:40:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201207112353.3814480-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
> Cross-build s390x target with only KVM accelerator enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index d8685ade376..7a94a66b4b3 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -1,4 +1,3 @@
> -
>  .cross_system_build_job:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> @@ -120,6 +119,13 @@ cross-s390x-user:
>    variables:
>      IMAGE: debian-s390x-cross
>  
> +cross-s390x-kvm:

I'd still prefer "-no-tcg" or maybe "-kvm-only" ... but that's just a matter
of taste, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


