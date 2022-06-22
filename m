Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E46D553F52
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 02:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353384.580313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nnd-0006lA-Ng; Wed, 22 Jun 2022 00:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353384.580313; Wed, 22 Jun 2022 00:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nnd-0006hk-Jg; Wed, 22 Jun 2022 00:00:49 +0000
Received: by outflank-mailman (input) for mailman id 353384;
 Wed, 22 Jun 2022 00:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BDV=W5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o3nnc-0006he-0B
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 00:00:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf6e45c-f1be-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 02:00:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 494526171E;
 Wed, 22 Jun 2022 00:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED62C3411C;
 Wed, 22 Jun 2022 00:00:43 +0000 (UTC)
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
X-Inumbo-ID: 5cf6e45c-f1be-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655856043;
	bh=RAgU+FrfC88PPxduGjhUGQtj1BDX6H2Gh3kLDvWJQdM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MXwdOBKFeuZ+ONTJXJsksDAX4/abQ4kAlMiI40T1r8uLpNvM1wI6EBX6pUS0AbgGA
	 XDSv4TpPcbg3aQ5YKIr4ZcziMEMYJcR/JR4Pb9jIEFhzHARU9BUhDNDiyPzEB1fbGo
	 HG1kk+rPIenZIrRUT5Rc7kqBAOTNuKQfEtvH6N/yZAZaoLzWQM/9fjpeU8ut4XyjyS
	 djUClMe93Wc4Uf5CSHn8jfVBHv94Fb+Mfba5w7eUqM6Vz9cyTuuPeL1L8cDLguCsKa
	 L21J3DFfiuZvQtC7wgR4d9jZhFEiPje6JSLv3564Rn+GHm3DAz4UcD67fwcwLagn89
	 Wx/eEij/GAFXg==
Date: Tue, 21 Jun 2022 17:00:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen: Add MISRA support to cppcheck make rule
In-Reply-To: <82a29dff7a0da97cc6ad9d247a97372bcf71f17c.1654850751.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206211658480.788376@ubuntu-linux-20-04-desktop>
References: <82a29dff7a0da97cc6ad9d247a97372bcf71f17c.1654850751.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jun 2022, Bertrand Marquis wrote:
> cppcheck MISRA addon can be used to check for non compliance to some of
> the MISRA standard rules.
> 
> Add a CPPCHECK_MISRA variable that can be set to "y" using make command
> line to generate a cppcheck report including cppcheck misra checks.
> 
> When MISRA checking is enabled, a file with a text description suitable
> for cppcheck misra addon is generated out of Xen documentation file
> which lists the rules followed by Xen (docs/misra/rules.rst).
> 
> By default MISRA checking is turned off.
> 
> While adding cppcheck-misra files to gitignore, also fix the missing /
> for htmlreport gitignore
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Hi Bertrand,

I tried this patch and I am a bit confused by the output
cppcheck-misra.txt file that I get (appended.)

I can see that there are all the rules from docs/misra/rules.rst as it
should be together with the one line summary, but there are also a bunch
of additional rules not present in docs/misra/rules.rst. Starting from
Rule 1.1 all the way to Rule 21.21. Is the expected?

Cheers,

Stefano


Appendix A Summary of guidelines
Rule 2.1 Required
All source files shall compile without any compilation errors (Misra rule 2.1)
Rule 4.7 Required
If a function returns error information then that error information shall be tested (Misra rule 4.7)
Rule 4.10 Required
Precautions shall be taken in order to prevent the contents of a header file being included more than once (Misra rule 4.10)
Rule 4.14 Required
The validity of values received from external sources shall be checked (Misra rule 4.14)
Rule 1.3 Required
There shall be no occurrence of undefined or critical unspecified behaviour (Misra rule 1.3)
Rule 3.2 Required
Line-splicing shall not be used in // comments (Misra rule 3.2)
Rule 5.1 Required
External identifiers shall be distinct (Misra rule 5.1)
Rule 5.2 Required
Identifiers declared in the same scope and name space shall be distinct (Misra rule 5.2)
Rule 5.3 Required
An identifier declared in an inner scope shall not hide an identifier declared in an outer scope (Misra rule 5.3)
Rule 5.4 Required
Macro identifiers shall be distinct (Misra rule 5.4)
Rule 6.2 Required
Single-bit named bit fields shall not be of a signed type (Misra rule 6.2)
Rule 8.1 Required
Types shall be explicitly specified (Misra rule 8.1)
Rule 8.4 Required
A compatible declaration shall be visible when an object or function with external linkage is defined (Misra rule 8.4)
Rule 8.5 Required
An external object or function shall be declared once in one and only one file (Misra rule 8.5)
Rule 8.6 Required
An identifier with external linkage shall have exactly one external definition (Misra rule 8.6)
Rule 8.8 Required
The static storage class specifier shall be used in all declarations of objects and functions that have internal linkage (Misra rule 8.8)
Rule 8.10 Required
An inline function shall be declared with the static storage class (Misra rule 8.10)
Rule 8.12 Required
Within an enumerator list the value of an implicitly-specified enumeration constant shall be unique (Misra rule 8.12)
Rule 9.1 Mandatory
The value of an object with automatic storage duration shall not be read before it has been set (Misra rule 9.1)
Rule 9.2 Required
The initializer for an aggregate or union shall be enclosed in braces (Misra rule 9.2)
Rule 13.6 Mandatory
The operand of the sizeof operator shall not contain any expression which has potential side effects (Misra rule 13.6)
Rule 14.1 Required
A loop counter shall not have essentially floating type (Misra rule 14.1)
Rule 16.7 Required
A switch-expression shall not have essentially Boolean type (Misra rule 16.7)
Rule 17.3 Mandatory
A function shall not be declared implicitly (Misra rule 17.3)
Rule 17.4 Mandatory
All exit paths from a function with non-void return type shall have an explicit return statement with an expression (Misra rule 17.4)
Rule 20.7 Required
Expressions resulting from the expansion of macro parameters shall be enclosed in parentheses (Misra rule 20.7)
Rule 20.13 Required
A line whose first token is # shall be a valid preprocessing directive (Misra rule 20.13)
Rule 20.14 Required
All #else #elif and #endif preprocessor directives shall reside in the same file as the #if #ifdef or #ifndef directive to which they are related (Misra rule 20.14)
Rule 1.1
No description for rule 1.1
Rule 1.2
No description for rule 1.2
Rule 1.4
No description for rule 1.4
Rule 1.5
No description for rule 1.5
Rule 1.6
No description for rule 1.6
Rule 1.7
No description for rule 1.7
Rule 1.8
No description for rule 1.8
Rule 1.9
No description for rule 1.9
Rule 1.10
No description for rule 1.10
Rule 1.11
No description for rule 1.11
Rule 1.12
No description for rule 1.12
Rule 1.13
No description for rule 1.13
Rule 1.14
No description for rule 1.14
Rule 1.15
No description for rule 1.15
Rule 1.16
No description for rule 1.16
Rule 1.17
No description for rule 1.17
Rule 1.18
No description for rule 1.18
Rule 1.19
No description for rule 1.19
Rule 1.20
No description for rule 1.20
Rule 1.21
No description for rule 1.21
Rule 2.2
No description for rule 2.2
Rule 2.3
No description for rule 2.3
Rule 2.4
No description for rule 2.4
Rule 2.5
No description for rule 2.5
Rule 2.6
No description for rule 2.6
Rule 2.7
No description for rule 2.7
Rule 2.8
No description for rule 2.8
Rule 2.9
No description for rule 2.9
Rule 2.10
No description for rule 2.10
Rule 2.11
No description for rule 2.11
Rule 2.12
No description for rule 2.12
Rule 2.13
No description for rule 2.13
Rule 2.14
No description for rule 2.14
Rule 2.15
No description for rule 2.15
Rule 2.16
No description for rule 2.16
Rule 2.17
No description for rule 2.17
Rule 2.18
No description for rule 2.18
Rule 2.19
No description for rule 2.19
Rule 2.20
No description for rule 2.20
Rule 2.21
No description for rule 2.21
Rule 3.1
No description for rule 3.1
Rule 3.3
No description for rule 3.3
Rule 3.4
No description for rule 3.4
Rule 3.5
No description for rule 3.5
Rule 3.6
No description for rule 3.6
Rule 3.7
No description for rule 3.7
Rule 3.8
No description for rule 3.8
Rule 3.9
No description for rule 3.9
Rule 3.10
No description for rule 3.10
Rule 3.11
No description for rule 3.11
Rule 3.12
No description for rule 3.12
Rule 3.13
No description for rule 3.13
Rule 3.14
No description for rule 3.14
Rule 3.15
No description for rule 3.15
Rule 3.16
No description for rule 3.16
Rule 3.17
No description for rule 3.17
Rule 3.18
No description for rule 3.18
Rule 3.19
No description for rule 3.19
Rule 3.20
No description for rule 3.20
Rule 3.21
No description for rule 3.21
Rule 4.1
No description for rule 4.1
Rule 4.2
No description for rule 4.2
Rule 4.3
No description for rule 4.3
Rule 4.4
No description for rule 4.4
Rule 4.5
No description for rule 4.5
Rule 4.6
No description for rule 4.6
Rule 4.8
No description for rule 4.8
Rule 4.9
No description for rule 4.9
Rule 4.11
No description for rule 4.11
Rule 4.12
No description for rule 4.12
Rule 4.13
No description for rule 4.13
Rule 4.15
No description for rule 4.15
Rule 4.16
No description for rule 4.16
Rule 4.17
No description for rule 4.17
Rule 4.18
No description for rule 4.18
Rule 4.19
No description for rule 4.19
Rule 4.20
No description for rule 4.20
Rule 4.21
No description for rule 4.21
Rule 5.5
No description for rule 5.5
Rule 5.6
No description for rule 5.6
Rule 5.7
No description for rule 5.7
Rule 5.8
No description for rule 5.8
Rule 5.9
No description for rule 5.9
Rule 5.10
No description for rule 5.10
Rule 5.11
No description for rule 5.11
Rule 5.12
No description for rule 5.12
Rule 5.13
No description for rule 5.13
Rule 5.14
No description for rule 5.14
Rule 5.15
No description for rule 5.15
Rule 5.16
No description for rule 5.16
Rule 5.17
No description for rule 5.17
Rule 5.18
No description for rule 5.18
Rule 5.19
No description for rule 5.19
Rule 5.20
No description for rule 5.20
Rule 5.21
No description for rule 5.21
Rule 6.1
No description for rule 6.1
Rule 6.3
No description for rule 6.3
Rule 6.4
No description for rule 6.4
Rule 6.5
No description for rule 6.5
Rule 6.6
No description for rule 6.6
Rule 6.7
No description for rule 6.7
Rule 6.8
No description for rule 6.8
Rule 6.9
No description for rule 6.9
Rule 6.10
No description for rule 6.10
Rule 6.11
No description for rule 6.11
Rule 6.12
No description for rule 6.12
Rule 6.13
No description for rule 6.13
Rule 6.14
No description for rule 6.14
Rule 6.15
No description for rule 6.15
Rule 6.16
No description for rule 6.16
Rule 6.17
No description for rule 6.17
Rule 6.18
No description for rule 6.18
Rule 6.19
No description for rule 6.19
Rule 6.20
No description for rule 6.20
Rule 6.21
No description for rule 6.21
Rule 7.1
No description for rule 7.1
Rule 7.2
No description for rule 7.2
Rule 7.3
No description for rule 7.3
Rule 7.4
No description for rule 7.4
Rule 7.5
No description for rule 7.5
Rule 7.6
No description for rule 7.6
Rule 7.7
No description for rule 7.7
Rule 7.8
No description for rule 7.8
Rule 7.9
No description for rule 7.9
Rule 7.10
No description for rule 7.10
Rule 7.11
No description for rule 7.11
Rule 7.12
No description for rule 7.12
Rule 7.13
No description for rule 7.13
Rule 7.14
No description for rule 7.14
Rule 7.15
No description for rule 7.15
Rule 7.16
No description for rule 7.16
Rule 7.17
No description for rule 7.17
Rule 7.18
No description for rule 7.18
Rule 7.19
No description for rule 7.19
Rule 7.20
No description for rule 7.20
Rule 7.21
No description for rule 7.21
Rule 8.2
No description for rule 8.2
Rule 8.3
No description for rule 8.3
Rule 8.7
No description for rule 8.7
Rule 8.9
No description for rule 8.9
Rule 8.11
No description for rule 8.11
Rule 8.13
No description for rule 8.13
Rule 8.14
No description for rule 8.14
Rule 8.15
No description for rule 8.15
Rule 8.16
No description for rule 8.16
Rule 8.17
No description for rule 8.17
Rule 8.18
No description for rule 8.18
Rule 8.19
No description for rule 8.19
Rule 8.20
No description for rule 8.20
Rule 8.21
No description for rule 8.21
Rule 9.3
No description for rule 9.3
Rule 9.4
No description for rule 9.4
Rule 9.5
No description for rule 9.5
Rule 9.6
No description for rule 9.6
Rule 9.7
No description for rule 9.7
Rule 9.8
No description for rule 9.8
Rule 9.9
No description for rule 9.9
Rule 9.10
No description for rule 9.10
Rule 9.11
No description for rule 9.11
Rule 9.12
No description for rule 9.12
Rule 9.13
No description for rule 9.13
Rule 9.14
No description for rule 9.14
Rule 9.15
No description for rule 9.15
Rule 9.16
No description for rule 9.16
Rule 9.17
No description for rule 9.17
Rule 9.18
No description for rule 9.18
Rule 9.19
No description for rule 9.19
Rule 9.20
No description for rule 9.20
Rule 9.21
No description for rule 9.21
Rule 10.1
No description for rule 10.1
Rule 10.2
No description for rule 10.2
Rule 10.3
No description for rule 10.3
Rule 10.4
No description for rule 10.4
Rule 10.5
No description for rule 10.5
Rule 10.6
No description for rule 10.6
Rule 10.7
No description for rule 10.7
Rule 10.8
No description for rule 10.8
Rule 10.9
No description for rule 10.9
Rule 10.10
No description for rule 10.10
Rule 10.11
No description for rule 10.11
Rule 10.12
No description for rule 10.12
Rule 10.13
No description for rule 10.13
Rule 10.14
No description for rule 10.14
Rule 10.15
No description for rule 10.15
Rule 10.16
No description for rule 10.16
Rule 10.17
No description for rule 10.17
Rule 10.18
No description for rule 10.18
Rule 10.19
No description for rule 10.19
Rule 10.20
No description for rule 10.20
Rule 10.21
No description for rule 10.21
Rule 11.1
No description for rule 11.1
Rule 11.2
No description for rule 11.2
Rule 11.3
No description for rule 11.3
Rule 11.4
No description for rule 11.4
Rule 11.5
No description for rule 11.5
Rule 11.6
No description for rule 11.6
Rule 11.7
No description for rule 11.7
Rule 11.8
No description for rule 11.8
Rule 11.9
No description for rule 11.9
Rule 11.10
No description for rule 11.10
Rule 11.11
No description for rule 11.11
Rule 11.12
No description for rule 11.12
Rule 11.13
No description for rule 11.13
Rule 11.14
No description for rule 11.14
Rule 11.15
No description for rule 11.15
Rule 11.16
No description for rule 11.16
Rule 11.17
No description for rule 11.17
Rule 11.18
No description for rule 11.18
Rule 11.19
No description for rule 11.19
Rule 11.20
No description for rule 11.20
Rule 11.21
No description for rule 11.21
Rule 12.1
No description for rule 12.1
Rule 12.2
No description for rule 12.2
Rule 12.3
No description for rule 12.3
Rule 12.4
No description for rule 12.4
Rule 12.5
No description for rule 12.5
Rule 12.6
No description for rule 12.6
Rule 12.7
No description for rule 12.7
Rule 12.8
No description for rule 12.8
Rule 12.9
No description for rule 12.9
Rule 12.10
No description for rule 12.10
Rule 12.11
No description for rule 12.11
Rule 12.12
No description for rule 12.12
Rule 12.13
No description for rule 12.13
Rule 12.14
No description for rule 12.14
Rule 12.15
No description for rule 12.15
Rule 12.16
No description for rule 12.16
Rule 12.17
No description for rule 12.17
Rule 12.18
No description for rule 12.18
Rule 12.19
No description for rule 12.19
Rule 12.20
No description for rule 12.20
Rule 12.21
No description for rule 12.21
Rule 13.1
No description for rule 13.1
Rule 13.2
No description for rule 13.2
Rule 13.3
No description for rule 13.3
Rule 13.4
No description for rule 13.4
Rule 13.5
No description for rule 13.5
Rule 13.7
No description for rule 13.7
Rule 13.8
No description for rule 13.8
Rule 13.9
No description for rule 13.9
Rule 13.10
No description for rule 13.10
Rule 13.11
No description for rule 13.11
Rule 13.12
No description for rule 13.12
Rule 13.13
No description for rule 13.13
Rule 13.14
No description for rule 13.14
Rule 13.15
No description for rule 13.15
Rule 13.16
No description for rule 13.16
Rule 13.17
No description for rule 13.17
Rule 13.18
No description for rule 13.18
Rule 13.19
No description for rule 13.19
Rule 13.20
No description for rule 13.20
Rule 13.21
No description for rule 13.21
Rule 14.2
No description for rule 14.2
Rule 14.3
No description for rule 14.3
Rule 14.4
No description for rule 14.4
Rule 14.5
No description for rule 14.5
Rule 14.6
No description for rule 14.6
Rule 14.7
No description for rule 14.7
Rule 14.8
No description for rule 14.8
Rule 14.9
No description for rule 14.9
Rule 14.10
No description for rule 14.10
Rule 14.11
No description for rule 14.11
Rule 14.12
No description for rule 14.12
Rule 14.13
No description for rule 14.13
Rule 14.14
No description for rule 14.14
Rule 14.15
No description for rule 14.15
Rule 14.16
No description for rule 14.16
Rule 14.17
No description for rule 14.17
Rule 14.18
No description for rule 14.18
Rule 14.19
No description for rule 14.19
Rule 14.20
No description for rule 14.20
Rule 14.21
No description for rule 14.21
Rule 15.1
No description for rule 15.1
Rule 15.2
No description for rule 15.2
Rule 15.3
No description for rule 15.3
Rule 15.4
No description for rule 15.4
Rule 15.5
No description for rule 15.5
Rule 15.6
No description for rule 15.6
Rule 15.7
No description for rule 15.7
Rule 15.8
No description for rule 15.8
Rule 15.9
No description for rule 15.9
Rule 15.10
No description for rule 15.10
Rule 15.11
No description for rule 15.11
Rule 15.12
No description for rule 15.12
Rule 15.13
No description for rule 15.13
Rule 15.14
No description for rule 15.14
Rule 15.15
No description for rule 15.15
Rule 15.16
No description for rule 15.16
Rule 15.17
No description for rule 15.17
Rule 15.18
No description for rule 15.18
Rule 15.19
No description for rule 15.19
Rule 15.20
No description for rule 15.20
Rule 15.21
No description for rule 15.21
Rule 16.1
No description for rule 16.1
Rule 16.2
No description for rule 16.2
Rule 16.3
No description for rule 16.3
Rule 16.4
No description for rule 16.4
Rule 16.5
No description for rule 16.5
Rule 16.6
No description for rule 16.6
Rule 16.8
No description for rule 16.8
Rule 16.9
No description for rule 16.9
Rule 16.10
No description for rule 16.10
Rule 16.11
No description for rule 16.11
Rule 16.12
No description for rule 16.12
Rule 16.13
No description for rule 16.13
Rule 16.14
No description for rule 16.14
Rule 16.15
No description for rule 16.15
Rule 16.16
No description for rule 16.16
Rule 16.17
No description for rule 16.17
Rule 16.18
No description for rule 16.18
Rule 16.19
No description for rule 16.19
Rule 16.20
No description for rule 16.20
Rule 16.21
No description for rule 16.21
Rule 17.1
No description for rule 17.1
Rule 17.2
No description for rule 17.2
Rule 17.5
No description for rule 17.5
Rule 17.6
No description for rule 17.6
Rule 17.7
No description for rule 17.7
Rule 17.8
No description for rule 17.8
Rule 17.9
No description for rule 17.9
Rule 17.10
No description for rule 17.10
Rule 17.11
No description for rule 17.11
Rule 17.12
No description for rule 17.12
Rule 17.13
No description for rule 17.13
Rule 17.14
No description for rule 17.14
Rule 17.15
No description for rule 17.15
Rule 17.16
No description for rule 17.16
Rule 17.17
No description for rule 17.17
Rule 17.18
No description for rule 17.18
Rule 17.19
No description for rule 17.19
Rule 17.20
No description for rule 17.20
Rule 17.21
No description for rule 17.21
Rule 18.1
No description for rule 18.1
Rule 18.2
No description for rule 18.2
Rule 18.3
No description for rule 18.3
Rule 18.4
No description for rule 18.4
Rule 18.5
No description for rule 18.5
Rule 18.6
No description for rule 18.6
Rule 18.7
No description for rule 18.7
Rule 18.8
No description for rule 18.8
Rule 18.9
No description for rule 18.9
Rule 18.10
No description for rule 18.10
Rule 18.11
No description for rule 18.11
Rule 18.12
No description for rule 18.12
Rule 18.13
No description for rule 18.13
Rule 18.14
No description for rule 18.14
Rule 18.15
No description for rule 18.15
Rule 18.16
No description for rule 18.16
Rule 18.17
No description for rule 18.17
Rule 18.18
No description for rule 18.18
Rule 18.19
No description for rule 18.19
Rule 18.20
No description for rule 18.20
Rule 18.21
No description for rule 18.21
Rule 19.1
No description for rule 19.1
Rule 19.2
No description for rule 19.2
Rule 19.3
No description for rule 19.3
Rule 19.4
No description for rule 19.4
Rule 19.5
No description for rule 19.5
Rule 19.6
No description for rule 19.6
Rule 19.7
No description for rule 19.7
Rule 19.8
No description for rule 19.8
Rule 19.9
No description for rule 19.9
Rule 19.10
No description for rule 19.10
Rule 19.11
No description for rule 19.11
Rule 19.12
No description for rule 19.12
Rule 19.13
No description for rule 19.13
Rule 19.14
No description for rule 19.14
Rule 19.15
No description for rule 19.15
Rule 19.16
No description for rule 19.16
Rule 19.17
No description for rule 19.17
Rule 19.18
No description for rule 19.18
Rule 19.19
No description for rule 19.19
Rule 19.20
No description for rule 19.20
Rule 19.21
No description for rule 19.21
Rule 20.1
No description for rule 20.1
Rule 20.2
No description for rule 20.2
Rule 20.3
No description for rule 20.3
Rule 20.4
No description for rule 20.4
Rule 20.5
No description for rule 20.5
Rule 20.6
No description for rule 20.6
Rule 20.8
No description for rule 20.8
Rule 20.9
No description for rule 20.9
Rule 20.10
No description for rule 20.10
Rule 20.11
No description for rule 20.11
Rule 20.12
No description for rule 20.12
Rule 20.15
No description for rule 20.15
Rule 20.16
No description for rule 20.16
Rule 20.17
No description for rule 20.17
Rule 20.18
No description for rule 20.18
Rule 20.19
No description for rule 20.19
Rule 20.20
No description for rule 20.20
Rule 20.21
No description for rule 20.21
Rule 21.1
No description for rule 21.1
Rule 21.2
No description for rule 21.2
Rule 21.3
No description for rule 21.3
Rule 21.4
No description for rule 21.4
Rule 21.5
No description for rule 21.5
Rule 21.6
No description for rule 21.6
Rule 21.7
No description for rule 21.7
Rule 21.8
No description for rule 21.8
Rule 21.9
No description for rule 21.9
Rule 21.10
No description for rule 21.10
Rule 21.11
No description for rule 21.11
Rule 21.12
No description for rule 21.12
Rule 21.13
No description for rule 21.13
Rule 21.14
No description for rule 21.14
Rule 21.15
No description for rule 21.15
Rule 21.16
No description for rule 21.16
Rule 21.17
No description for rule 21.17
Rule 21.18
No description for rule 21.18
Rule 21.19
No description for rule 21.19
Rule 21.20
No description for rule 21.20
Rule 21.21
No description for rule 21.21
Appendix B


