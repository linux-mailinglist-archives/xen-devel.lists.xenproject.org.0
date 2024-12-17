Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BD9F5571
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 19:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859801.1271901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbvP-0005kE-MH; Tue, 17 Dec 2024 18:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859801.1271901; Tue, 17 Dec 2024 18:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbvP-0005hZ-JF; Tue, 17 Dec 2024 18:04:03 +0000
Received: by outflank-mailman (input) for mailman id 859801;
 Tue, 17 Dec 2024 18:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAop=TK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tNbvN-0005hT-RE
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 18:04:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a8daec2-bca1-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 19:04:00 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A6FE54EE0738;
 Tue, 17 Dec 2024 19:03:59 +0100 (CET)
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
X-Inumbo-ID: 4a8daec2-bca1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734458639; bh=AV6w8JQfS3QlWoHTTvFX0U9KitTgAGD/rpSGmIDa9nQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X4LHbCYwg0PZbdABDdZ4GbTLulv0A4V9bCy8KCekvdZ9qj+OmdAcQtqJK86BWJ/TL
	 lRoutQb7vzNXNBGJ+DmmvRsMAYDmUXUn3OS/vTWju4U4cIAlt4o9Du2mdcOTVibLYr
	 yQJNWtV9hCVeQYT4XGHvZBA5wDbG8gVn4hzF2yqkr32q29SNiBQ/Ji6T1mERbaiqEj
	 3xIeIyiE0DIGxUzSpZka8ZT5xnneSgcDJZhKdLmfGry7469YslgaF7Q6JvL23Veaxn
	 29tQvo8UgMSDV1W0XmojzIJMqjgO86cbgZuh/lt+Kt3rNEALuLjQ3TEpEW3k399Aky
	 Y582TkrrWnPwA==
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 19:03:59 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper3 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] eclair-analysis: Add usage of varargs extension for
 C99
In-Reply-To: <c45597af-ce69-41b5-bc73-bd32f2378b76@suse.com>
References: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
 <c45597af-ce69-41b5-bc73-bd32f2378b76@suse.com>
Message-ID: <143ba0299956e39a8e8e95f08908a812@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-12-17 17:40, Jan Beulich wrote:
> On 17.12.2024 17:24, Nicola Vetrini wrote:
>> This extension name is missing from the current list of extension used
>> by Xen, therefore is must be added to that configuration in order to
>> avoid violations for MISRA C Rule 1.1.
> 
> Which extension are we talking about here? I'm afraid ...
> 
>> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> @@ -100,8 +100,8 @@
>>      ext_enum_value_not_int: non-documented GCC extension.
>>      ext_gnu_array_range: see Section \"6.29 Designated Initializers\" 
>> of "GCC_MANUAL".
>>  "
>> --config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
>> --config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
>> +-config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
>> +-config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
>>  -doc_end
> 
> ... ext_c_missing_varargs_arg doesn't tell me anything. Without this 
> it's
> hard to tell whether C-language-toolchain.rst might also need an edit; 
> a
> search for "varargs" in the file yields no hit.
> 

It's related to section 6.21 of the gcc manual "Macros with a variable 
number of arguments".
The GCC extension (well, technically CPP) allowing zero arguments to a 
variadic macro, so it's already present in the comment above the 
configuration (out of context).


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

