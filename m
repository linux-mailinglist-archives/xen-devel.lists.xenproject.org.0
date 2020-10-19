Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC9292883
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 15:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8712.23344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUVUp-0006mk-2w; Mon, 19 Oct 2020 13:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8712.23344; Mon, 19 Oct 2020 13:46:43 +0000
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
	id 1kUVUo-0006mL-W7; Mon, 19 Oct 2020 13:46:42 +0000
Received: by outflank-mailman (input) for mailman id 8712;
 Mon, 19 Oct 2020 13:46:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUVUn-0006mF-9E
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 13:46:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19610d89-3d32-43b0-af75-7f8cd3222931;
 Mon, 19 Oct 2020 13:46:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19102B22A;
 Mon, 19 Oct 2020 13:46:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUVUn-0006mF-9E
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 13:46:41 +0000
X-Inumbo-ID: 19610d89-3d32-43b0-af75-7f8cd3222931
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 19610d89-3d32-43b0-af75-7f8cd3222931;
	Mon, 19 Oct 2020 13:46:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603115199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3uuDviRWo1QtDtFjPhK/Nzml2kSnSQTZRgY9EKGnbA=;
	b=pc7syDGASrgxu9p4ycGJlPyBIstMPB88fF1qdLL8pr0c57Qii3W0y/Zxki0PWN8A5aipNq
	6ZgRhUIb8Y9ikU0eEKZw193t/kgGQ8IDEEBA9PFujmjbzowlAl9HFmLTlj2uBgM3941OZO
	0voeUVVHnEuqJL22B/Nl7ReB4N4ig/U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 19102B22A;
	Mon, 19 Oct 2020 13:46:39 +0000 (UTC)
Subject: Re: [PATCH v10 01/11] docs / include: introduce a new framework for
 'domain context' records
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f0b7537-807c-54cc-0c0b-23e30e833f45@suse.com>
Date: Mon, 19 Oct 2020 15:46:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201008185735.29875-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.10.2020 20:57, Paul Durrant wrote:
> --- /dev/null
> +++ b/xen/include/public/save.h
> @@ -0,0 +1,66 @@
> +/*
> + * save.h
> + *
> + * Structure definitions for common PV/HVM domain state that is held by Xen.
> + *
> + * Copyright Amazon.com Inc. or its affiliates.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef XEN_PUBLIC_SAVE_H
> +#define XEN_PUBLIC_SAVE_H
> +
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +
> +#include "xen.h"
> +
> +/*
> + * C structures for the Domain Context v1 format.
> + * See docs/specs/domain-context.md
> + */
> +
> +struct domain_context_record {
> +    uint32_t type;
> +    uint32_t instance;
> +    uint64_t length;

Should this be uint64_aligned_t, such that alignof() will
produce consistent values regardless of bitness of the invoking
domain?

Jan

