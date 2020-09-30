Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7327E5CA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 11:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528.1725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNYry-0004KV-KQ; Wed, 30 Sep 2020 09:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528.1725; Wed, 30 Sep 2020 09:57:54 +0000
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
	id 1kNYry-0004K6-HE; Wed, 30 Sep 2020 09:57:54 +0000
Received: by outflank-mailman (input) for mailman id 528;
 Wed, 30 Sep 2020 09:57:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNYrw-0004K1-Ih
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 09:57:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09c56cf6-f6c1-4eaf-afd0-e1230204f5a7;
 Wed, 30 Sep 2020 09:57:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B367AC4D;
 Wed, 30 Sep 2020 09:57:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNYrw-0004K1-Ih
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 09:57:52 +0000
X-Inumbo-ID: 09c56cf6-f6c1-4eaf-afd0-e1230204f5a7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 09c56cf6-f6c1-4eaf-afd0-e1230204f5a7;
	Wed, 30 Sep 2020 09:57:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601459870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kt3YXb4HhDyXS4vTh23c8nxczbuf8QnZhcX1+DRh45I=;
	b=QXUHftJ5SzpKPCc0s9kk4M4X5LVrARwpNde1IYET6Pj4Q1J9fwZgfjPn439bP64pauYHkL
	mW2tm5KZ1khErDv0cQ8c3bW8re6oC1UaWzVEfi3qs9DEbRh4XbEAeg3gPEcol5JgX9PjRF
	JZhUK3C9W6xefElerueTNwaHsxkkH1o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1B367AC4D;
	Wed, 30 Sep 2020 09:57:50 +0000 (UTC)
Subject: Re: Xen Coding style and clang-format
To: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "julien@xen.org" <julien@xen.org>, "vicooodin@gmail.com"
 <vicooodin@gmail.com>, "viktor.mitin.19@gmail.com"
 <viktor.mitin.19@gmail.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
Date: Wed, 30 Sep 2020 11:57:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 11:18, Anastasiia Lukianenko wrote:
> I would like to know your opinion on the following coding style cases.
> Which option do you think is correct?
> 1) Function prototype when the string length is longer than the allowed
> one
> -static int __init
> -acpi_parse_gic_cpu_interface(struct acpi_subtable_header *header,
> -                             const unsigned long end)
> +static int __init acpi_parse_gic_cpu_interface(
> +    struct acpi_subtable_header *header, const unsigned long end)

Both variants are deemed valid style, I think (same also goes for
function calls with this same problem). In fact you mix two
different style aspects together (placement of parameter
declarations and placement of return type etc) - for each
individually both forms are deemed acceptable, I think.

> 2) Wrapping an operator to a new line when the length of the line is
> longer than the allowed one
> -    if ( table->revision > 6
> -         || (table->revision == 6 && fadt->minor_revision >= 0) )
> +    if ( table->revision > 6 ||
> +         (table->revision == 6 && fadt->minor_revision >= 0) )

Only the latter variant is correct.

> 3) define code style
> -#define ALLREGS \
> -    C(r0,r0_usr);   C(r1,r1_usr);   C(r2,r2_usr);   C(r3,r3_usr);   \
> -    C(cpsr,cpsr)
> +#define ALLREGS            \
> +    C(r0, r0_usr);         \
> +    C(r1, r1_usr);         \
> +    C(r2, r2_usr);         \

You're again mixing multiple style aspects together: There definitely
should be a blank after the comma, but I don't think we require
every item to be on its own line. But this latter aspect is a little
bogus here anyway - generally, macros better wouldn't contain
embedded semicolons, unless e.g. in a compound statement.

I also don't think we require backslashes (not) to be aligned; this
has typically been left to the author's taste so far, I guess.

> 4) Comment style
> -    /* PC should be always a multiple of 4, as Xen is using ARM
> instruction set */
> +    /* PC should be always a multiple of 4, as Xen is using ARM
> instruction set
> +     */

For a single line comment, only the former variant is correct.
In a multi-line comment neither would be. But comment style is
described well in ./CODING_STYLE, I think, so I'm not sure why
the question arose in the first place.

Jan

