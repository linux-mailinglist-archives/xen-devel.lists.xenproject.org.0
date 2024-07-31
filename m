Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19994397D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 01:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769183.1180071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZJ1w-0008Iq-NQ; Wed, 31 Jul 2024 23:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769183.1180071; Wed, 31 Jul 2024 23:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZJ1w-0008Fk-Jz; Wed, 31 Jul 2024 23:46:52 +0000
Received: by outflank-mailman (input) for mailman id 769183;
 Wed, 31 Jul 2024 23:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZJ1v-0008Fe-9t
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 23:46:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 261495d4-4f97-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 01:46:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D0079CE1847;
 Wed, 31 Jul 2024 23:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFB0C116B1;
 Wed, 31 Jul 2024 23:46:42 +0000 (UTC)
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
X-Inumbo-ID: 261495d4-4f97-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722469603;
	bh=AC0JgQP8y+qfpdID5AphXitvMlcdAlEYB891zOwDFpE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LEyEJiR/wuzChYWtvQrSIU1V8pO2tLXeIOAzniaC9wMk65iEyLMrb4DbYhEdCKRH8
	 WwZgO0l1PSHyzxG2CSZbKK6WW24STSqKr35rjFQanVETuZ6KKgUw903ImbtQHweZU9
	 KUe9wywkoFGreBh/GYLv3BW1aFIKLsSaZBfxS+BkkLZfnbQskBX8BP8YgW9LqAOP/6
	 3JtPE0k8Ua7hldQdoF22aS5XgHfj6L1Y0a0klpes5LmSq3POnj6iOzJU/ulNmLL/bo
	 ou/jnVPh0FLoMVSejN+ixtgPmgsIifHWVip9gUXmG46lY4czIn8lGu8DHQBm1CeTOl
	 ugCu+Aw5ZT9Xg==
Date: Wed, 31 Jul 2024 16:46:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com, 
    artem_mygaiev@epam.com, julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] docs: Introduce Fusa Requirement and define
 maintainers
In-Reply-To: <20240731163614.616162-2-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407311517480.4857@ubuntu-linux-20-04-desktop>
References: <20240731163614.616162-1-ayan.kumar.halder@amd.com> <20240731163614.616162-2-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Ayan Kumar Halder wrote:
> The FUSA folder is expected to contain requirements and other documents
> to enable safety certification of Xen hypervisor.
> Added a README to explain how the requirements are categorized, written
> and their supported status.
> 
> Added maintainers for the same.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  MAINTAINERS              |  9 +++++
>  docs/fusa/reqs/README.md | 75 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 docs/fusa/reqs/README.md
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c524a8a93..0d328e065c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -314,6 +314,15 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
>  F:	xen/common/efi/
>  F:	xen/include/efi/
>  
> +FUSA
> +M:	Stefano Stabellini <sstabellini@kernel.org>
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
> +M:	Michal Orzel <michal.orzel@amd.com>
> +M:	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> +M:	Artem Mygaiev <artem_mygaiev@epam.com>
> +S:	Supported
> +F:	docs/fusa/
> +
>  GDBSX DEBUGGER
>  M:	Elena Ufimtseva <elena.ufimtseva@oracle.com>
>  S:	Supported
> diff --git a/docs/fusa/reqs/README.md b/docs/fusa/reqs/README.md
> new file mode 100644
> index 0000000000..69b8d3a5c8
> --- /dev/null
> +++ b/docs/fusa/reqs/README.md
> @@ -0,0 +1,75 @@
> +This folder contains a set of requirements describing Xen and its implementation
> +in a form suitable for a safety certification process.
> +The status is experimental and it is maintained on a best effort basis.
> +
> +The requirements writing style is inspired from the ANSI/IEEE guide to Software
> +Requirements Standard 830-1984.


I think it would be helpful to mention that they are currently
experimental and may be slightly out of sync with the code. We are
actively working on a process to keep them updated, more details to
follow.


> +The requirements are categorized as follows :-
> +
> +1. Market requirements - They define the high level functionalities of the
> +hypervisor without going into concepts specific to Xen. Those should allow a
> +system architect to understand wether Xen is providing the functionalities it
> +needs for its system. This is the top level of the requirements.
> +
> +2. Product requirements - They define the Xen specific concepts and interfaces
> +provided by Xen without going into implementation details. One or several of
> +those requirements are linked to each market requirement. An Architect can use
> +them understand how Xen fulfils a market need and design how Xen should be used
> +in his system.
> +
> +3. Design requirements - They describe what the software implementation is doing
> +from a technical point of view. One or several design requirement together
> +define how product requirements are fulfilled technically and are linked to
> +them. An implementer can use them to know how to write or understand the Xen
> +code.
> +
> +The requirements are linked using OpenFastTrace
> +(https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide.md).
> +OpenFastTrace parses through the requirements and generates a traceability
> +report.
> +
> +The following is the skeleton for a requirement.
> +
> +Title  /* Title of the requirement */
> +-----
> +
> +`unique_tag`
> +/*
> + * Each requirement needs to have a unique tag associated. The format is
> + * req_type~name~revision.
> + *
> + * Thus, it consists of three components :-
> + * requirement type - This denotes the category of requirement. Thus, it shall
> + * be 'XenMkt', 'XenProd' or 'XenSwdgn' to denote market, product or design
> + * requirement.
> + * name - This denotes name of the requirement. In case of architecture specific
> + * requirements, this starts with the architecture type (ie x86_64, arm64).
> + * revision number - This gets incremented each time the requirement is modified.
> + */
> +
> +Description:
> +This shall describe the requirement in a definitive tone. In other words,
> +the requirement begins with 'Xen shall ...'. Further, the description is
> +expected to be unambiguous and consistent.
> +
> +Rationale:
> +This describes a rationale explaining the reason of the presence of the
> +requirement when this can help the reader. This field can be left blank.
> +
> +Comments:
> +This describes the use cases for the requirement when this can help the
> +reader. This field can be left blank as well.
> +
> +Covers:
> +This denotes the unique_tag of the parent. This field is non existent for the
> +market requirement as it is the top level.
> +
> +Needs:
> +This denotes the requirement type of its children. This field is non existent
> +for the design requirements as there are no subsequent requirements linked to
> +them.
> +
> +
> +The requirements are expected to the technically correct and follow the above
> +guidelines.
> -- 
> 2.25.1
> 

