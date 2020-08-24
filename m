Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB6250767
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 20:24:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAH8m-0004ii-6G; Mon, 24 Aug 2020 18:24:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+7PQ=CC=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kAH8k-0004id-Uf
 for xen-devel@lists.xen.org; Mon, 24 Aug 2020 18:24:19 +0000
X-Inumbo-ID: 4d48b5f8-36c1-4819-85a4-4dc8e54b0438
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d48b5f8-36c1-4819-85a4-4dc8e54b0438;
 Mon, 24 Aug 2020 18:24:18 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id b14so8364210qkn.4
 for <xen-devel@lists.xen.org>; Mon, 24 Aug 2020 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E16eb5/A+Qwl9Ib/4VtSwRiqsBojzOAk2nzPefBT8jg=;
 b=EyxCQcDwiFTS1sJzknDC/TABUFq/tcCtAG6lM18HXlIOyG6HXEdr6iPrJ+/490UH0P
 zEU3A2eoEWh4xXZQ/1Mpw3t+M0/1asbVRW4SeV3EsQOCwKvnJEypcgx+MQ5kEwWvxVow
 Wg2E1i25izmJPrrWc7BO1Byifjo6L+poZ1d11USCEabb12u4B6yyVt7dJD96XX/ewlGf
 v2rjCfcJNJVMpMcWMupjpXQlBNyzSgRKCZxq7nfgjx5ZATRUKVQ0CLRUsCKPcm+hJHf2
 qHub3m4dMbpXM2/36+RyYXBQ5Fq0p0ftVTr0n5BKA64QR+4Kjdpi/8zCAOw1ohK/g4p5
 QGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E16eb5/A+Qwl9Ib/4VtSwRiqsBojzOAk2nzPefBT8jg=;
 b=bRRVwxygXkMuOCUn+jnOgdDOPfJz+aJVCZwa0HCZ7tJXmdYCsDIBwpvJgzoFgempcp
 jHIFx9whz66o43AuC1mRbNO+Y1x8a4i73a4ombjTPNy37b0h7eSmWim8a+UgWrl3nBR+
 cRj4MAE3f9/Gk94yVpMuDQUgyazSPmzG9AMypjFDQKgTAazV2JvDRCw0btvm0SiZQjZd
 Sg2tQa/pOYhV+8p3hqVKrSsNOE3DXBIADBdOMtVGoyyQycCnFM7l0O4QaBbfddq6uf3X
 jCH28PC/ESQYK6xFW2DVetIut/EDh64phXs9lXxPcv8t5hu2m+3t1X/0KHE/pK3g564h
 tl4w==
X-Gm-Message-State: AOAM533HjCFm5RsEDDtBm3u67rBxlblIexRFO962c1Y6WazyDqNFOxt3
 l37FbribuZMl/GyJQRz3gzQ+vTUJ6I8Nc1Q+Chr3sO4xcT+6Wg==
X-Google-Smtp-Source: ABdhPJzZPiSquxX5er2f2hm7VmHl5YA96y1md0ng9KTDIswZ4IEd24VCQLfsYrtEiHEioErNT4PJfahVRo5VRIOtXPg=
X-Received: by 2002:a37:8107:: with SMTP id c7mr5818483qkd.22.1598293457751;
 Mon, 24 Aug 2020 11:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200824181143.GA571@antioche.eu.org>
In-Reply-To: <20200824181143.GA571@antioche.eu.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 24 Aug 2020 11:24:06 -0700
Message-ID: <CAMmSBy_cvK2c3x6anVS3KzZPANW4OdVCgO2dfQY+SCi7dxTeDg@mail.gmail.com>
Subject: Re: qemu-xen and bridge (xen 4.11)
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 24, 2020 at 11:12 AM Manuel Bouyer <bouyer@antioche.eu.org> wrote:
>
> Hello,
> with the recent XSA about qemu, I'm trying to switch the NetBSD port from
> qemu-xen-traditional to qemu-xen (in Xen 4.11 for now, I'll look at
> 4.13 later).
> One showstopper is that with qemu-xen, the bridge name is not passed
> any more to the qemu-ifup script. I tried adding a br= option to
> the qemu invocation, but qemu-system-i386 doesn't seem to use it
> (at last the script is still called with only one argument).
> I'm not about to pass to qemu the value of nics[i].script instead of
> libxl_tapif_script(), so that at last per-domain script can be
> specified.
>
> How is this issue dealt with on other OSes ? I can't believe I'm
> the only one with multiple bridges in the dom0 ...

You mean something like?
   https://github.com/lf-edge/eve/blob/master/pkg/xen-tools/patches-4.14.0/10-bridge-helper-support.patch

Thanks,
Roman.

