Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26B12D0E0C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46149.81868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDpi-0007Gc-BP; Mon, 07 Dec 2020 10:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46149.81868; Mon, 07 Dec 2020 10:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDpi-0007GF-7w; Mon, 07 Dec 2020 10:33:30 +0000
Received: by outflank-mailman (input) for mailman id 46149;
 Mon, 07 Dec 2020 10:33:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kmDpg-0007G8-DK
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:33:28 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fd5db7fb-a7b0-4805-a0ad-2f268959e0dc;
 Mon, 07 Dec 2020 10:33:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-C6u_WiEVOkC9GtpqMX5LSw-1; Mon, 07 Dec 2020 05:33:25 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 673C1858182;
 Mon,  7 Dec 2020 10:33:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 281EF60BD8;
 Mon,  7 Dec 2020 10:33:13 +0000 (UTC)
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
X-Inumbo-ID: fd5db7fb-a7b0-4805-a0ad-2f268959e0dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607337207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBOpJWU+NgQXJI1Pmo6+cAgOqxHfFZ8sskstH2Y6TmU=;
	b=ThOZN/nl+YziXoG0BqiTHXpKdmdJby1zYvkNTVbq0WgH40lv3AKJXLTqbeLeZNGluhNSQM
	rnV2ZauH41KjzQKcnmWlVejsAU69UPlZKYvhL+UhHvhBRbVxkQs+BfVoX5HgXO+//0GBsw
	ugM/Ad4l0d+jdOQPMroY6yFjZS82RJg=
X-MC-Unique: C6u_WiEVOkC9GtpqMX5LSw-1
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
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
 <cd5d00b1-999a-fbb3-204e-a759a9e2c3ec@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0447129c-e6c9-71f6-1786-b4e8689b8214@redhat.com>
Date: Mon, 7 Dec 2020 11:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <cd5d00b1-999a-fbb3-204e-a759a9e2c3ec@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11

On 07/12/2020 11.26, Philippe Mathieu-Daudé wrote:
> On 12/7/20 11:00 AM, Philippe Mathieu-Daudé wrote:
>> On 12/7/20 6:46 AM, Thomas Huth wrote:
>>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>>> Cross-build s390x target with only KVM accelerator enabled.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>>  .gitlab-ci.yml                         | 1 +
>>>>  MAINTAINERS                            | 1 +
>>>>  3 files changed, 8 insertions(+)
>>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>
>>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>> new file mode 100644
>>>> index 00000000000..1731af62056
>>>> --- /dev/null
>>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>> @@ -0,0 +1,6 @@
>>>> +cross-s390x-kvm:
>>>> +  extends: .cross_accel_build_job
>>>> +  variables:
>>>> +    IMAGE: debian-s390x-cross
>>>> +    TARGETS: s390x-softmmu
>>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>> index 573afceb3c7..a69619d7319 100644
>>>> --- a/.gitlab-ci.yml
>>>> +++ b/.gitlab-ci.yml
>>>> @@ -14,6 +14,7 @@ include:
>>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>>
>>> KVM code is already covered by the "cross-s390x-system" job, but an
>>> additional compilation test with --disable-tcg makes sense here. I'd then
>>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
> 
> What other accelerators are available on 390?

It's only TCG and KVM.

 Thomas



