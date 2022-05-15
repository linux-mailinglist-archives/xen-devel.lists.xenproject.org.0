Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE766527853
	for <lists+xen-devel@lfdr.de>; Sun, 15 May 2022 17:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329440.552676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqFjJ-00056G-73; Sun, 15 May 2022 15:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329440.552676; Sun, 15 May 2022 15:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqFjJ-00052x-2s; Sun, 15 May 2022 15:00:21 +0000
Received: by outflank-mailman (input) for mailman id 329440;
 Sun, 15 May 2022 15:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7N/m=VX=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1nqFjH-00052p-FE
 for xen-devel@lists.xenproject.org; Sun, 15 May 2022 15:00:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb0133f-d45f-11ec-aa76-f101dd46aeb6;
 Sun, 15 May 2022 17:00:18 +0200 (CEST)
Received: from [192.168.1.137] (host-87-18-194-234.retail.telecomitalia.it
 [87.18.194.234])
 by support.bugseng.com (Postfix) with ESMTPSA id D8BD44EE0779;
 Sun, 15 May 2022 17:00:16 +0200 (CEST)
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
X-Inumbo-ID: bbb0133f-d45f-11ec-aa76-f101dd46aeb6
Message-ID: <a0eea4ee-86dc-c366-d6d4-36dd9df85b4b@bugseng.com>
Date: Sun, 15 May 2022 17:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: ECLAIR Xen x86 results and progress
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "julien@xen.org" <julien@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop>
 <3F6B0F2E-0CF6-4C60-A803-DD8A5EAF0DFB@arm.com>
 <alpine.DEB.2.22.394.2205091231570.43560@ubuntu-linux-20-04-desktop>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2205091231570.43560@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/22 21:55, Stefano Stabellini wrote:
> On Mon, 9 May 2022, Bertrand Marquis wrote:
>>> On 6 May 2022, at 17:31, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>
>>> Hi all,
>>>
>>> Roberto kindly provided the ECLAIR x86 results:
>>>
>>> https://eclairit.com:8443/job/XEN/Target=X86_64,agent=public/lastSuccessfulBuild/eclair/
>>>
>>> Click on "See ECLAIR in action", then you can select "Show 100 entries"
>>> and see all the results in one page. As an example MC3R1.R1.3
>>> corresponds to Rule 1.3 in the spreadsheet.
>>>
>>>
>>> If you are OK with this, I would like to aim at a follow-up meeting on
>>> Tue May 17 at the same time (8AM California / 4PM UK). If the date/time
>>> doesn't work, I'll run another Doodle poll.
>>
>> Works for me.
> 
> Actually, to make sure more people are able to attend, I would like to
> suggest May 19 8AM California / 4PM UK / 5PM Europe (which is the same
> slot typically used by the Xen Community Call). Please let me know if
> that works or if it is a problem.
> 
> 
>>> By then, I am hoping that the group has already gone through the first
>>> 20 rules in the list, up until Rule 8.10. Is that reasonable for all of
>>> you?
>>
>> I completed that part of the table this morning (up to 8.14), it took me 30 minutes.
> 
> Thank you! I did so as well in about the same amount of time.
> 
> I think I should provide a clarification on a couple of rules that are
> not clear from the examples.
> 
> 
> # Rule 5.4 "Macro identifiers shall be distinct"
> 
> This one is about the length of the Macro itself. C90 requires the first
> 31 characters to be different, while C99 requires the first 63
> characteres to be different.
> 
> So the problem is the following:
> 
> #define this_macro_is_way_way_way_too_long
> #define this_macro_is_way_way_way_too_loooong
> 
> I don't think we have any violations.
> 
> 
> # Rule 8.6 " An identifier with external linkage shall have exactly one external definition"
> 
> This one is meant to catch cases where there are 2 definitions for 1
> declaration:
> 
> header.h:
> extern int hello;
> 
> file1.c:
> int hello;
> 
> file2:
> int hello;
> 
> There was a question on whether having 1 declaration with no definitions
> would be OK, so only the following:
> 
> header.h:
> extern int hello;
> 
> for instance because file1.c has been removed from the build due to a
> kconfig. Reading MISRA, I don't think it is a violation of Rule 8.6.
> Roberto please correct me if I am wrong.

Hi there.

As I am not 100% sure I will be able to attend the meeting on the 19th,
I am providing some input here:

# Rule 5.4 "Macro identifiers shall be distinct"

The point here is that every standard-conformant C/C++ compiler has the right
of ignoring the characters in an identifier that are outside the "significant
part."  Different kind of identifiers have different minimum lengths
for the significant part.  For macros and non-external identifiers,
we have:

- for C90 and C95: 31 characters;
- for C99, C11 and C18: 63 characters;
- for C++: 1024 characters.

So, for example, a C90 compiler (or, and it is the same, any compiler
in C90 mode) can freely ignore all characters in the name of macros
beyond the 31st.  And if two macro identifiers differ only in the
non-significant part, the behavior is undefined (for the simple reason
that the preprocessor can choose any of the conflicting macros).
Now, the builds of XEN that are analized at https://eclairit.com
are built with (versions of) GCC and GCC goes well beyond the
standard minimal requirements by stipulating that "For internal names,
all characters are significant. For external names, the number of
significant characters are defined by the linker; for almost all
targets, all characters are significant."
(https://gcc.gnu.org/onlinedocs/gcc/Identifiers-implementation.html#Identifiers-implementation).
Now, given that ECLAIR takes into account (completely automatically)
all the implementation-defined behaviors of the actually used toolchain
(including how those are influenced by the command-line options),
why do we have a violation report when macro names only differ
after the 31st character in C90 mode?
For example,

12345678901234567890123456789012345678901
XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING_SIZE
XEN_NETIF_CTRL_TYPE_SET_HASH_MAPPING

?

The reason is pragmatic: yes, there is no undefined behavior
with GCC, but do you really want to admit macro names that are
different only in characters coming hundreds or thousands positions
from the beginning of the identifier?  I guess not: then choose your
threshold, add a one-liner to the ECLAIR configuration, and let ECLAIR
warn you if and when the rule is violated with *that* threshold.

This brings us to a related topic: why is part of XEN compiled in C90
mode while part of it is compiled in C99 mode?  This is a very important
violation of MISRA C Rule 1.1, which is not in your coding standard,
but it really should be included.  C90 and C99 are not 100% compatible,
and mixing them is asking for trouble.  My advice is choosing one version
of the language (C90, C99, C11 or C18) and stick to it, enabling Rule 1.1
to make sure the source code complies to the chosen language standard version.
My advice is: if at all possible, exclude C90;  then use the most modern
version of the language that is compatible with *all* toolchains you need
to support.

# Rule 8.6 " An identifier with external linkage shall have exactly one external definition"

Exactly one means:

- 2 or more is bad, as you may violate the "one definition rule" and incur
   undefined behavior;
- 0 is bad, as this means you have redundant (useless) declarations.

Of course, the first case is the most dangerous one.  The second case
is just one aspect of a more general MISRA principle saying
"unused stuff should not reach the compilation phases past preprocessing,"
that is, you should #if-, #ifdef- or #ifndef-out everything that is
not required by the project configuration you are building.
Again, the actual hazard depends on several factors.  Unused function
definitions are clearly more dangerous than unused function declarations:
if the linker is unable to filter out the unused code, then the device
will contain code that is unreachable in normal executions but that
code can be exploited during a cyber-attack.  It is a matter of a one-line
ECLAIR configuration to adapt to the case where you might say
"unused declarations are OK and we do not want to exclude them
with preprocessor conditionals."

I hope it helps,

     Roberto



