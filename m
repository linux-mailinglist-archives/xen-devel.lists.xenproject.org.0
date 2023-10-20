Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DD7D092A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 09:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619680.965171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtjYH-0006aT-Ah; Fri, 20 Oct 2023 07:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619680.965171; Fri, 20 Oct 2023 07:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtjYH-0006YW-7r; Fri, 20 Oct 2023 07:04:09 +0000
Received: by outflank-mailman (input) for mailman id 619680;
 Fri, 20 Oct 2023 07:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYNS=GC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtjYF-0006Xe-Ar
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 07:04:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db98a480-6f16-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 09:04:06 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 86C794EE073A;
 Fri, 20 Oct 2023 09:04:05 +0200 (CEST)
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
X-Inumbo-ID: db98a480-6f16-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 20 Oct 2023 09:04:05 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v3 8/8] docs/misra: exclude three more files
In-Reply-To: <6ed0694a-a8cb-f01b-3d16-681c29d48522@suse.com>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
 <0eae39cdc68e48932936e2c510a867ebe1f7c298.1697722648.git.nicola.vetrini@bugseng.com>
 <6ed0694a-a8cb-f01b-3d16-681c29d48522@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a3f9c1da3e5c5721da0f13161b30f539@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2023 08:04, Jan Beulich wrote:
> On 19.10.2023 15:40, Nicola Vetrini wrote:
>> These files should not conform to MISRA guidelines at the moment,
>> therefore they are added to the exclusion list.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> These exclusions are automatically picked up by ECLAIR's automation
>> to hide reports originating from these files.
>> ---
>>  docs/misra/exclude-list.json | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>> 
>> diff --git a/docs/misra/exclude-list.json 
>> b/docs/misra/exclude-list.json
>> index 575ed22a7f67..b2b4b9253615 100644
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -145,6 +145,10 @@
>>              "rel_path": "common/zstd/*",
>>              "comment": "Imported from Linux, ignore for now"
>>          },
>> +        {
>> +            "rel_path": "common/symbols-dummy.c",
>> +            "comment": "The resulting code is not included in the 
>> final Xen binary, ignore for now"
>> +        },
>>          {
>>              "rel_path": "crypto/*",
>>              "comment": "Origin is external and documented in 
>> crypto/README.source"
>> @@ -189,6 +193,14 @@
>>              "rel_path": "include/acpi/acpixf.h",
>>              "comment": "Imported from Linux, ignore for now"
>>          },
>> +        {
>> +          "rel_path": "include/acpi/acexep.h",
> 
> Typo (include/acpi/acexcep.h)?
> 
> Jan

Indeed, thanks. This is trivial enough to be done on commit, I suppose.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

