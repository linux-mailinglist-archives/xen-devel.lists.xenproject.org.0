Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM9sF+RZA2r75AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:48:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97C5250B5
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307265.1578974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqH9-0002V9-BR; Tue, 12 May 2026 16:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307265.1578974; Tue, 12 May 2026 16:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqH9-0002T6-7z; Tue, 12 May 2026 16:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1307265;
 Tue, 12 May 2026 16:48:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wMqH7-0002R5-FI
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:48:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqH6-007Oof-SN
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 18:48:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0359a5-2eae-0a2a0a5409dd-0a2a45029870-30
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:48:04 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0359c4-af86-0a2a45020019-a237832f8eba-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:48:04 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 76D9C4EE3BFE;
 Tue, 12 May 2026 18:48:04 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778604484;
	b=z0i0lcXOcrofiGh8ovrLdXau6Fm6TLN/zcxPVlLIjX7MJ6Rjn+wgesFUkYpAA5TCTrpa
	 OVwl81Kajl/n4RQuZtiPuSdauFWdqYO6RIeR6ZEgWwj29HtfvkYkiGbQ2YHXhHl65d0Cb
	 FiNFgrfJyakAhSNVo6UXoNb9pY+LEQy7buXlmRKo62EQvwcqO4XK9TzYWCuPpUo8QdICd
	 03RBlGZsj6+b54dsJRbNm4Tp0Ucz/qCN468kjPRAJeN/xJGrwugqVwGBJnv+nbxK4MYp+
	 JhiEUlldGL8ORS0OVDBVKLX1kr9jIro5y5z4fGaufKiGrKym6tGKZ7eD6xYZUOzpugdJw
	 Lzlrt+jQUWyI2edN+U6hC8MieFEaslZZx8oF206xJ42LsRqs1ZbifU8giUOSpRY6zt3SO
	 uyHh72RargypYeb3kAsUXrrPvUWeo/co4BLmD/V6AyeHnbXuEUjz4+bVsulvYsS0lOXRL
	 m2/osJ1TaQe7gYtvUA963UQM3XrAvXvHllLYRE7uHmtz+grk2QvSbkBAFaalocal9dEFb
	 HpwETcUl934VaB7KeUIdHSJJX8tiI53eJJq5UzIQJnzW2CKiiaTKaXZyTWZiYScY960ms
	 P/0ryoWNr61X32638kCrMDWVegLRVHTdWkJEyDCgQotcDgSA37ZwWABjz2Se2Vs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778604484;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=CqnvSaUlStiy3Ko+J06Piky154NZPJUBk6JT45MLJJA=;
	b=XNacqxhDlJVdOEubIYh2T5IXb5+qABFU1FN/UKyfbszOAsH9lJNF0k9DofiXBnV7APfg
	 bvIEOJjh/sojEY2mpSc/KyBfpw1keJa5yLd+td5sUZu0Xf0LBcHIKCb0HL0BCg5/+wTBO
	 JcFL3uKQXyWzx7pnp9EByS7h17103TmFgaDAO4peAsEeO7InEjNxIx1LjfCiXd8IjFHAz
	 sgH1qMgS+VJml8uUCEkIOetV6mlG7ytA1E9zy1IY5Ytb2yq3DE/7+Zg6WRa46rEJsvAae
	 9ZImZBOyqAjc83ABuFI2Vl/iU1sWVqbe6C56lSRVoJiPA9IkLco1iSDLaK+JHAW2d8kpd
	 ZTpZNV5hO8XOtVJV8cGkOKOhF6now+06zSWqxQWEM4VdhOg5Xlc9GtNDhhMTv9w07BAc/
	 qToayB65diW7OmkoC+0Hc5eLKqjt9Qm19TPBoa3/SrUl4WntLPe5iEL/fN8d9n26NX9p7
	 +VzWZw6w7zm+/+1WZc0S3xQ3O6h8bfWSVFsb+4fLigLP90jJgCavXdwyVrYnpjsB0vLQf
	 09mG9xu9hazpU0PukPU49VMkQiR6YWoBQN9W5KWNZ4x479Mt5hchmigAGQAbxLw6BXhfP
	 fKZJsQKy1jz5gFXcTBzx8Asc9rl5uawcY8ecjvWphO6/hjatxMbJiuairAtblOA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 12 May 2026 18:48:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair: Restrict where eclair jobs are
 auto-started
In-Reply-To: <1778602049.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@vates.tech>
References: <1778602049.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@vates.tech>
Message-ID: <dde437002b6299523ce01370b96cf247@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778604484-80B78161-086A03E3/0/0
X-purgate-type: clean
X-purgate-size: 1599
X-Rspamd-Queue-Id: EA97C5250B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,b.sc:url,gitlab.com:url,vates.tech:email,vates.tech:url]
X-Rspamd-Action: no action

On 2026-05-12 18:07, Anthony PERARD wrote:
> This will prevent eclair jobs from been started automatically
> everywhere but in the main push repo, but still have the option to
> start a jobs manually.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> 
> Notes:
>     eclair jobs are still manual under people:
>         
> https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/2519778881
> 
>     and they are still running in hardware repos:
>         
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2519784420
> 
>  automation/gitlab-ci/analyze.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml 
> b/automation/gitlab-ci/analyze.yaml
> index b3f99f472d9e..d6b6cf3e548b 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -33,7 +33,7 @@
>        when: never
>      - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
>        when: never
> -    - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
> +    - if: $WTOKEN && $CI_PROJECT_PATH !~ /^xen-project\/hardware\//
>        when: manual
>        allow_failure: true
>      - !reference [.eclair-analysis, rules]
> 
> 
> --
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

