Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uITKFuqK8GloUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:24:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9548288D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295561.1572225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfcF-0004Ei-6k; Tue, 28 Apr 2026 10:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295561.1572225; Tue, 28 Apr 2026 10:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfcF-0004DG-44; Tue, 28 Apr 2026 10:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1295561;
 Tue, 28 Apr 2026 10:24:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wHfcE-0004DA-IN
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:24:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHfcD-00BlCj-VF
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:24:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69f08acf-bab6-0a2a0a5309dd-0a2a4507cf68-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:24:29 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69f08adc-229c-0a2a45070019-a237832fa512-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:24:29 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B1CD44EE3D42;
 Tue, 28 Apr 2026 12:24:27 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1777371868;
	b=CH/97+DsIuWxZW5ffd8fASGrjevShkPy1KzHNkjIcF/ePLTRPZytaWhl+07xsRw8Xdax
	 j1dL22yHLuVz3aZobB2UPfw9J+9JGCfC8qgHYA5/KlhY9b8UXzciEwjcnD4e0KvHTAE9o
	 3cJoXK+J73lpFBzSr6SbuYtJEv71xL6WOhUHJ9IKj9xVRYj9gKZx9lDVOh5isgxJ+r6y8
	 5idCWfvrWwc9t0DsLIwU+1nQfw7DQwvI8zMx+HvKIcyaNHpfL3gcVqQDf8naGxIj9l4HR
	 8blZr4FIR4qLelTcUvi1qIqMpCdHzPswWkWGozeqX9Yc93z66sj9S0eMQVwqdLH7lAr/C
	 macUb715KVK2Mds0dqGmOGsvoSGVqyi5gHpMWQrZ/5dlxNTdnrVxPWgdUZRPgfgq/iwPe
	 R+J8oyd7f1EjAdSATQMI+mjxBehGffLGSLviUZ1r/y4lsiWc59MjjiYvlmUAavcFkBfhu
	 FDHqEBK0SBF7dCjmrM5etH8SFuALf7VGgzwXXshtkki+thlEG757C/cfApllg+Z8bs83f
	 k4rk0uNGru4fsaXXwp1spSCgH5Vd/ARB27Px7mXYUIREWmx2aA5pGhOSjp7UoCsrGdgT8
	 T8DkxAHtgn8V7X1syfos1B9K4quuPJJEpvcox3Nr8T8U4lg/aQ75cH0H7BlAM5c=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1777371868;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=9Lr+2OIu4LkQzWwjA3WNC/sPDHGHa2sUBFGHqOf9eZ4=;
	b=4oExtKqj2ENbVPV8EkC5QpoFp8ph5JVLWSpWYDbxj/pb9rXkMmHswtK0V7fcpYZ458ug
	 BDQpECCNs92APFFE64dYR21xFyRxOZyaR4tlPJdTqvr0FvPP7XIq/LS5q4iBMQ1SIjKAs
	 xdoVzlveqaNDpncyE7U1YpChgu+UWSVJGCH1lKmvobAOFRQdv+4FJRYe3T/ciI4qrVS35
	 H3hUcQot1PLp1V2UJLcdc5jy48BhRZc/oh18dktnI/F4xXAVlnyps9XEGeuYLcpLe8e0C
	 /4QBDgvBQi00FVYdqP66ENA3OhuM5rypDc9SbLwNoeAcR4dtg9ceb4SuPj0ea/UFR7CoW
	 0eSXJWWICPUWg50YBs71ctbFo78WD9/+foSWb2928sv49ju9KkWnvvFoGEn1nKl5CFHHx
	 kKu8wvRun0qUUg4HLW3QO8iTObuf+Nch+m6A7mvQTFZxYXt4W2lfKWCvyR7zKLbqbklWS
	 P+kl3VzxFTcje0hJ90RnPVN60PGZOpFS/cBEl3EhhrriFuspM4N0A9AaMnZZnbqFhxDae
	 k2RhfuEFOXSHaeSm8VUOJjqH76/BGipcY8iYSAYYa4yL0KY5Ji5TXyvwy8wCPhCnmal2t
	 ZbjcAa+UulErGN1CCFPJgFsPCieQ16FHEzkrXIzH69l1C6CsX1w1euCOIqrXQ3I=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 12:24:27 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu
 <luca.fancellu@arm.com>
Subject: Re: [PATCH v2] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
In-Reply-To: <d43959bd-6812-4241-b425-861d6020339b@amd.com>
References: <20260428080218.19371-1-michal.orzel@amd.com>
 <2f9875a8a1f4d85ddceccb2d093a4951@bugseng.com>
 <d43959bd-6812-4241-b425-861d6020339b@amd.com>
Message-ID: <c595c2dbe4e6481d9bf79a8b0887200e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1777371869-AC762C48-91C0AB94/0/0
X-purgate-type: clean
X-purgate-size: 3411
X-Rspamd-Queue-Id: B6B9548288D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.194];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:luca.fancellu@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,arm.com:email,linkedin.com:url,b.sc:url]

On 2026-04-28 12:22, Orzel, Michal wrote:
> On 28-Apr-26 10:20, Nicola Vetrini wrote:
>> On 2026-04-28 10:02, Michal Orzel wrote:
>>> overlay_get_nodes_info() is called before fdt_overlay_apply() to
>>> extract
>>> target paths from the overlay. This fails for overlays using
>>> phandle-based
>>> targeting (target = <&label>) because DTC compiles these as 
>>> unresolved
>>> fixups (target = <0xffffffff>), causing fdt_overlay_target_offset() 
>>> to
>>> return -FDT_ERR_BADPHANDLE. Prior to this change users were forced to
>>> manually modify the dtbo (even for hwdom) to switch from target to
>>> target-phandle by manually inspecting also the host DTB.
>>> 
>>> Introduce overlay_get_target_path() which directly handles the two
>>> targeting cases that occur before fixup resolution:
>>>  - target-path: the string property is returned directly.
>>>  - target = <&label>: the label is found in the overlay's __fixups__
>>>    node, then resolved to a path via the base DTB's __symbols__ node.
>>> 
>>> Libfdt fdt_for_each_property_offset() violates MISRA R20.7. Despite
>>> libfdt being excluded from the analysis, this causes ECLAIR scan to
>>> report a regression because the violation introduced by a macro is
>>> reported at the call site. Deviate R20.7 for libfdt.h.
>>> 
>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> In my pre-push testing I realized ECLAIR allcode reported a violation
>>> related to
>>> the use of fdt_for_each_property_offset. Libfdt is excluded from
>>> analysis but
>>> this does not apply to e.g. macros used in other places.
>>> 
>>> Changes in v2:
>>>  - strip out from series that is ready to be committed
>>>  - deviate 20.7 for libfdt.h. Discussed with Nicole.
>>> 
>>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2484326830
>>> ---
>>>  .../eclair_analysis/ECLAIR/deviations.ecl     |  1 +
>>>  xen/common/device-tree/dt-overlay.c           | 65 
>>> +++++++++++++++++--
>>>  2 files changed, 60 insertions(+), 6 deletions(-)
>>> 
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 30c323906924..5f0b73062474 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -631,6 +631,7 @@ not in scope for compliance are allowed, as that 
>>> is
>>> imported code."
>>>  -file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
>>>  -config=MC3A2.R20.7,reports+={safe,
>>> "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
>>>  -config=MC3A2.R20.7,reports+={safe,
>>> "any_area(any_loc(file(acpi_cpu_idle)))"}
>>> +-config=MC3A2.R20.7,reports+={safe,
>>> "any_area(any_loc(any_exp(file(^xen/include/xen/libfdt/libfdt.h$))))"}
>>>  -doc_end
>>> 
>> 
>> Nit: I think using a file_tag as above is better, but in any case use
>> libfdt\\.h in the regex
> Ok. Provided I will do this on commit, may I convert this as your 
> Rb/Ab?
> 
> ~Michal

Yes, sure

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

