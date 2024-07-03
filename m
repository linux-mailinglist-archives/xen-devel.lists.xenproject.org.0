Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA0926398
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753135.1161417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP18b-0001u2-Fl; Wed, 03 Jul 2024 14:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753135.1161417; Wed, 03 Jul 2024 14:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP18b-0001sM-Co; Wed, 03 Jul 2024 14:39:13 +0000
Received: by outflank-mailman (input) for mailman id 753135;
 Wed, 03 Jul 2024 14:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=utZJ=OD=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1sP18a-0001sE-2e
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:39:12 +0000
Received: from ppsw-31.srv.uis.cam.ac.uk (ppsw-31.srv.uis.cam.ac.uk
 [131.111.8.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01ac6ec9-394a-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 16:39:09 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34454)
 by ppsw-31.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 id 1sP18W-00000003hgD-LZiK (Exim 4.97.1)
 (return-path <amc96@srcf.net>); Wed, 03 Jul 2024 15:39:08 +0100
Received: from [10.125.226.166] (unknown [185.25.67.249])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E96101FAE1;
 Wed,  3 Jul 2024 15:39:07 +0100 (BST)
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
X-Inumbo-ID: 01ac6ec9-394a-11ef-8776-851b0ebba9a2
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <12c328db-6a1c-4365-9b84-2b5dfe1f550c@srcf.net>
Date: Wed, 3 Jul 2024 15:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 1/4] CI: Formalise the use of heredocs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-2-andrew.cooper3@citrix.com>
 <ZoVhXGF7sknROnS0@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <amc96@srcf.net>
Autocrypt: addr=amc96@srcf.net; keydata=
 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
 14JdDDHUX2Rs6+ahAA==
In-Reply-To: <ZoVhXGF7sknROnS0@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2024 3:34 pm, Roger Pau Monné wrote:
> On Wed, Jul 03, 2024 at 03:19:59PM +0100, Andrew Cooper wrote:
>> Commit b5739330d7f4 introduced the use of heredocs in the jessie/stretch
>> dockerfiles.
>>
>> It turns out this was introduced by BuildKit in 2018 along with a
>> standardisation of Dockerfile syntax, and has subsequently been adopted by the
>> docker community.
>>
>> Annotate all dockerfiles with a statement of the syntax in use, and extend
>> README.md details including how to activate BuildKit when it's available but
>> off by default.
>>
>> This allows the containers to be rebuilt following commit a0e29b316363 ("CI:
>> Drop glibc-i386 from the build containers").
>>
>> Fixes: b5739330d7f4 ("automation: fix jessie/stretch images to use archive.debian.org apt repos")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  automation/build/README.md                             | 10 +++++++++-
>>  automation/build/alpine/3.18-arm64v8.dockerfile        |  1 +
>>  automation/build/alpine/3.18.dockerfile                |  1 +
>>  automation/build/archlinux/current-riscv64.dockerfile  |  1 +
>>  automation/build/archlinux/current.dockerfile          |  1 +
>>  automation/build/centos/7.dockerfile                   |  1 +
>>  .../build/debian/bookworm-arm64v8-arm32-gcc.dockerfile |  1 +
>>  automation/build/debian/bookworm-arm64v8.dockerfile    |  1 +
>>  automation/build/debian/bookworm-cppcheck.dockerfile   |  1 +
>>  automation/build/debian/bookworm-i386.dockerfile       |  1 +
>>  automation/build/debian/bookworm.dockerfile            |  1 +
>>  automation/build/debian/bullseye-ppc64le.dockerfile    |  1 +
>>  automation/build/debian/buster-gcc-ibt.dockerfile      |  1 +
>>  automation/build/debian/jessie-i386.dockerfile         |  1 +
>>  automation/build/debian/jessie.dockerfile              |  1 +
>>  automation/build/debian/stretch-i386.dockerfile        |  1 +
>>  automation/build/debian/stretch.dockerfile             |  1 +
>>  automation/build/fedora/29.dockerfile                  |  1 +
>>  automation/build/suse/opensuse-leap.dockerfile         |  1 +
>>  automation/build/suse/opensuse-tumbleweed.dockerfile   |  1 +
>>  automation/build/ubuntu/bionic.dockerfile              |  1 +
>>  automation/build/ubuntu/focal.dockerfile               |  1 +
>>  automation/build/ubuntu/trusty.dockerfile              |  1 +
>>  automation/build/ubuntu/xenial-xilinx.dockerfile       |  1 +
>>  automation/build/ubuntu/xenial.dockerfile              |  1 +
>>  automation/build/yocto/yocto.dockerfile.in             |  2 ++
>>  .../tests-artifacts/alpine/3.18-arm64v8.dockerfile     |  1 +
>>  automation/tests-artifacts/alpine/3.18.dockerfile      |  1 +
>>  .../tests-artifacts/kernel/5.19-arm64v8.dockerfile     |  1 +
>>  automation/tests-artifacts/kernel/6.1.19.dockerfile    |  1 +
>>  .../qemu-system-aarch64/6.0.0-arm64v8.dockerfile       |  1 +
>>  .../qemu-system-ppc64/8.1.0-ppc64.dockerfile           |  1 +
>>  32 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/automation/build/README.md b/automation/build/README.md
>> index 1c040533fdd8..12a2b4af1807 100644
>> --- a/automation/build/README.md
>> +++ b/automation/build/README.md
>> @@ -81,7 +81,14 @@ Building a container
>>  
>>  There is a makefile to make this process easier. You should be
>>  able to run `make DISTRO/VERSION` to have Docker build the container
>> -for you. If you define the `PUSH` environment variable when running the
>> +for you.
>> +
>> +Xen's dockerfiles use heredocs, which depend on the standardised dockerfile
>> +syntax introduced by [BuiltKit].  This should work by default starting with
>> +docker 23.0, or podman/buildah v1.33.  For older versions of docker, it can be
>> +activated with `DOCKER_BUILDKIT=1` in the environment.
>> +
>> +If you define the `PUSH` environment variable when running the
>>  former `make` command, it will push the container to the [registry] if
>>  you have access to do so and have your Docker logged into the registry.
>>  
>> @@ -101,6 +108,7 @@ env CONTAINER_NO_PULL=1 \
>>  make -C automation/build suse/opensuse-tumbleweed PUSH=1
>>  ```
>>  
>> +[BuildKit]: https://docs.docker.com/build/buildkit/
>>  [registry]: https://gitlab.com/xen-project/xen/container_registry
>>  [registry help]: https://gitlab.com/help/user/project/container_registry
>>  
>> diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
>> index 91e90220240f..19fe46f8418f 100644
>> --- a/automation/build/alpine/3.18-arm64v8.dockerfile
>> +++ b/automation/build/alpine/3.18-arm64v8.dockerfile
>> @@ -1,3 +1,4 @@
>> +# syntax=docker/dockerfile:1
> Will this fail to parse if not using BuildKit?

No.  To "the legacy builder" (the pre-BuildKit thing), it's just a comment.

But to anything semi recent, it defines the version of the dockerfile
syntax we intend to use, and in particular will prevent you from
accidentally using newer syntax in an older dockerfile.

~Andrew

