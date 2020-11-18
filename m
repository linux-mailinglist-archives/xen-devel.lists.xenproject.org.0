Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED12B8368
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 18:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30193.60015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRhw-0003O3-4w; Wed, 18 Nov 2020 17:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30193.60015; Wed, 18 Nov 2020 17:57:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRhw-0003NU-1T; Wed, 18 Nov 2020 17:57:28 +0000
Received: by outflank-mailman (input) for mailman id 30193;
 Wed, 18 Nov 2020 17:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=135G=EY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfRhu-0003Mx-EH
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:57:26 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 853d4d6c-8c65-4304-a2f6-0ebe9697d8a9;
 Wed, 18 Nov 2020 17:57:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=135G=EY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfRhu-0003Mx-EH
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:57:26 +0000
X-Inumbo-ID: 853d4d6c-8c65-4304-a2f6-0ebe9697d8a9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 853d4d6c-8c65-4304-a2f6-0ebe9697d8a9;
	Wed, 18 Nov 2020 17:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605722245;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=aOeFD5/4w46KTt9yFuqNTO1fr11pDy3GcDph52x7WIk=;
  b=M/PHzvJabvVRAJjepEZ6o7XfQ2q4DDgG7YXTIS5RRBQhJLKMxKj+RfDB
   AB4eVJIriisrz8NlZBB1qXgUmKgu2Jzm7xv3FM063xCf0mZ/w/6xQhH9z
   9ZpzgePmea83xTpyv9+pBRI+rt47Y6SgJxQkZhHd7g5cMvXPuuhrqkdtk
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dp7NwnwVGeIuElNjqV35SwOO0XtlmgBMBd6Srloet5Gyd7X7amGhI4N559UKQjRdaz8i8Yo0+k
 sx9jzGmS8iFN/HyVQmQjQFVaQexMSf5WANoXqz73E97qYUQVo9Vecvv1gzH8pZm103MpaB2nYA
 +AensI5P7rL5pXJLo8oP/c1JJYzKeMLsY8B7cz3kgag4H/Nk5DjmsCO8RrdpMx1muSLw3zOVEN
 LanqqKPwnxZfhwebiSihoYX2fkDcwHj96klyK2IC8fsrvtMFgifAjkSmhduovPhUwZX7VEGKf/
 dss=
X-SBRS: None
X-MesageID: 31454861
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,488,1596513600"; 
   d="scan'208";a="31454861"
Subject: Re: [PATCH v1 2/4] automation/: add Ubuntu:focal container
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
 <42b2b80779e264d60fa3daf01110fece34f00696.1605636800.git.edvin.torok@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e74b1d8b-0318-a956-b09a-555795374393@citrix.com>
Date: Wed, 18 Nov 2020 17:57:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <42b2b80779e264d60fa3daf01110fece34f00696.1605636800.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 17/11/2020 18:24, Edwin Török wrote:
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> ---
>  automation/build/ubuntu/focal.dockerfile | 50 ++++++++++++++++++++++++
>  automation/scripts/containerize          |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 automation/build/ubuntu/focal.dockerfile
>
> diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
> new file mode 100644
> index 0000000000..1f014b67bc
> --- /dev/null
> +++ b/automation/build/ubuntu/focal.dockerfile
> @@ -0,0 +1,50 @@
> +FROM ubuntu:20.04
> +LABEL maintainer.name="The Xen Project " \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        zlib1g-dev \
> +        libncurses5-dev \
> +        libssl-dev \
> +        python-dev \

Python2 is legacy in Focal, and shouldn't be necessary for 4.14 and later.

> +        python3-dev \
> +        xorg-dev \
> +        uuid-dev \
> +        libyajl-dev \
> +        libaio-dev \
> +        libglib2.0-dev \
> +        clang \
> +        libpixman-1-dev \
> +        pkg-config \
> +        flex \
> +        bison \
> +        gettext \
> +        acpica-tools \
> +        bin86 \
> +        bcc \
> +        liblzma-dev \
> +        libc6-dev-i386 \
> +        libnl-3-dev \
> +        ocaml-nox \
> +        libfindlib-ocaml-dev \
> +        libsystemd-dev \
> +        markdown \

We dropped markdown as a dependency a release or two ago.

Both these dependences should be fine to drop, if we're happy to not
role Focal testing out to all the older branches.

> +        transfig \
> +        pandoc \
> +        checkpolicy \
> +        wget \

The build has absolutely no business reaching out into the internet.

I'm tempted to forcibly clobber it in the main build script.  (Perhaps
this is best not conflated with the Focal change.)

~Andrew

