Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MwID8xt8GmgTQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:20:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C647FE18
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295470.1572118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdfo-0008MY-DF; Tue, 28 Apr 2026 08:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295470.1572118; Tue, 28 Apr 2026 08:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdfo-0008Jd-9z; Tue, 28 Apr 2026 08:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1295470;
 Tue, 28 Apr 2026 08:20:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wHdfm-00080B-QQ
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 08:20:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHdfm-00F8gL-3L
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:20:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69f06db0-2eae-0a2a0a5409dd-0a2a450b99de-14
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:20:02 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69f06db1-212f-0a2a450b0019-a237832f9f84-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:20:01 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1B7464EE3D39;
 Tue, 28 Apr 2026 10:20:01 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1777364401;
	b=HWzt/s1yxEd2Q6Re/20+f3aIl2DaWobEFjkYwCljd5Prwgeva6WijAmqoWYQJ7HuryV2
	 GMT1sCTk9KK+a7hsR2sVtof5qGtSrnsrAkDHItlmlrk7zF1AXzPXTtcvBWThN27vhsOfn
	 N3UmfIT7pXnMfrlw+yIqTdbgiE5DyS1VlH1qZktD0CCBXxlys8rwEG9+/pz0XObSDb+44
	 eS/y6Kbwvyhvc/xWLBhXueNw1zEPRpEJbsJHfm5+AgvtsDThP13SAa/JRtZ5wWZxxkbj7
	 ZLI9WfWJV1pzIkcZAGBIDPFv5XfvTub9u5yJkw/AjZc35Wl4/47PIg1frBVfrqoWXRbqf
	 YckJgS5ppIaSKFtvaPA5fn/6+CCIuPr3V7wxBaEBsVRiG6d7gptnzfVvespwO9YXb5mSf
	 f7mo4d2ygEfpdmyNQwHCmgT+WkJOFSQoMXV5YJusqLRvaFPbUM9UmRpy9LdLNrRe/0kuc
	 Rjr0NVhlIQCvB5TwZn5DJeRfJlx6C8q0KGQD+I20dYAWnC+wqup6ACL/sME0Qdel0mGmW
	 5lG0ZXDQwAERLS6la4uVix3Fr3H8YxSzPpNJ6poxqFmna0wJsaRyro0NKFftxuaMcoQSs
	 rWsTYCRgnoU5QT2nE+l5HkY5x/GW6ecwUi5kb7O4qiHww3yknBN2chGG6Zx1+Sw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1777364401;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=vZ/d8dW13BwV9iBbLeQFHYLNppK60PCdRQMXTOBjpUs=;
	b=dLc0Wsg7YzkorDREyDMb62JHHbhj0Y54vIXJp+mNlNJUCXX35w4WuPKNdB+jdy0c+Pdr
	 fqLgiMga56b/1o5xCcvM7UIcH72vjXoIsgphRX09SD8egOx2mfXg80FiHO/MOdo3idT0z
	 JLRbph22LqoGQvwfQG9h7WwEfsJKGF0If0nXyxsZwgTrM3P7m4ejGtmvFZxUDR7dB6cop
	 5SbxUTlsdkjHLHQQs663dUtb5LJMmGpd5k829iS/++M94EhwEjhUvJUPwWn0DvZfTgkdA
	 gGAwtXrSi6T4yhIFieZ1X2RqZrjfKehgPOdQH5AWSrIBY0S1BTHdw1Vy73YxdW4J3frBD
	 FoSUqV/0/uIZSpdTf64Cw8YO6kFHmF7/GpGzXf+m+O0oI356UX5kaIzfyXdXpzZ0vjQlI
	 WAFLsfx07ug2GVNkhE2/M2ZfXk6r0V/gGo5a6p8qIqicnzRscSSKAlLPsNg7qzdxFBz0V
	 rTeW5xG/qYpqFrmzwET8OR3F5NMocJJyEKdVNTTd93LBq0CRPaFjUjFqmh+bIfFmcJnms
	 ziTXMEdvNQd9+jWp8rGTiSIrtyM4qmZKUizPFzF1rp7F+NsbxHYaFCUQYLYfHmXOHerKN
	 mb4Us2uwuNL/Ee5menpb06ez4WEglQMk3Hg63P2C7SifxVDwLJo/codlr5oQNeM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 10:20:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu
 <luca.fancellu@arm.com>
Subject: Re: [PATCH v2] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
In-Reply-To: <20260428080218.19371-1-michal.orzel@amd.com>
References: <20260428080218.19371-1-michal.orzel@amd.com>
Message-ID: <2f9875a8a1f4d85ddceccb2d093a4951@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1777364401-7FF7EF3B-BDC321F9/0/0
X-purgate-type: clean
X-purgate-size: 3123
X-Rspamd-Queue-Id: 831C647FE18
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
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:luca.fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,amd.com:email,b.sc:url,linkedin.com:url,bugseng.com:mid,bugseng.com:url,arm.com:email]

On 2026-04-28 10:02, Michal Orzel wrote:
> overlay_get_nodes_info() is called before fdt_overlay_apply() to 
> extract
> target paths from the overlay. This fails for overlays using 
> phandle-based
> targeting (target = <&label>) because DTC compiles these as unresolved
> fixups (target = <0xffffffff>), causing fdt_overlay_target_offset() to
> return -FDT_ERR_BADPHANDLE. Prior to this change users were forced to
> manually modify the dtbo (even for hwdom) to switch from target to
> target-phandle by manually inspecting also the host DTB.
> 
> Introduce overlay_get_target_path() which directly handles the two
> targeting cases that occur before fixup resolution:
>  - target-path: the string property is returned directly.
>  - target = <&label>: the label is found in the overlay's __fixups__
>    node, then resolved to a path via the base DTB's __symbols__ node.
> 
> Libfdt fdt_for_each_property_offset() violates MISRA R20.7. Despite
> libfdt being excluded from the analysis, this causes ECLAIR scan to
> report a regression because the violation introduced by a macro is
> reported at the call site. Deviate R20.7 for libfdt.h.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> In my pre-push testing I realized ECLAIR allcode reported a violation 
> related to
> the use of fdt_for_each_property_offset. Libfdt is excluded from 
> analysis but
> this does not apply to e.g. macros used in other places.
> 
> Changes in v2:
>  - strip out from series that is ready to be committed
>  - deviate 20.7 for libfdt.h. Discussed with Nicole.
> 
> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2484326830
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     |  1 +
>  xen/common/device-tree/dt-overlay.c           | 65 +++++++++++++++++--
>  2 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 30c323906924..5f0b73062474 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -631,6 +631,7 @@ not in scope for compliance are allowed, as that is 
> imported code."
>  -file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
>  -config=MC3A2.R20.7,reports+={safe, 
> "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
>  -config=MC3A2.R20.7,reports+={safe, 
> "any_area(any_loc(file(acpi_cpu_idle)))"}
> +-config=MC3A2.R20.7,reports+={safe, 
> "any_area(any_loc(any_exp(file(^xen/include/xen/libfdt/libfdt.h$))))"}
>  -doc_end
> 

Nit: I think using a file_tag as above is better, but in any case use 
libfdt\\.h in the regex

>  -doc_begin="To avoid compromising readability, the macros 
> alternative_(v)?call[0-9] are allowed


-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

