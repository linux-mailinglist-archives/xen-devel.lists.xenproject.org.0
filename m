Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK66ERQdn2lcZAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:02:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7519A2D8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240890.1542137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHKe-0008OK-GB; Wed, 25 Feb 2026 16:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240890.1542137; Wed, 25 Feb 2026 16:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHKe-0008Ms-CZ; Wed, 25 Feb 2026 16:01:48 +0000
Received: by outflank-mailman (input) for mailman id 1240890;
 Wed, 25 Feb 2026 16:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1EJK=A5=bounce.vates.tech=bounce-md_30504962.699f1ce3.v1-482a7224c02e41c58e684e009777b938@srs-se1.protection.inumbo.net>)
 id 1vvHKc-0008Mh-ID
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 16:01:46 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 450477b1-1263-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 17:01:40 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fLfTv15Vvz5Qld74
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 16:01:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 482a7224c02e41c58e684e009777b938; Wed, 25 Feb 2026 16:01:39 +0000
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
X-Inumbo-ID: 450477b1-1263-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772035299; x=1772305299;
	bh=zyfB8a/LztjIJ2AZxsJrk+XNtYgH9WQ+m3rsAXKXpdU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FHrEco3iUjR+/SczBYRGigGIyQIWH96xjiJnviZw21eUaRcQyyN+Hb+KmKELQ7EgK
	 2wurPAmdU4wJ8sRRgQSD8WSutqBMCgJPWhrcV8Xe+llO2ZRmA1JucYgqpyLFK9ctVL
	 zdvcxQZJwevy289wlFkikeXnjAEq/pFfSyARnZPEbY1BLB5//oyQf9xRAJWzg5Q2VD
	 o1Q3DI/9Bmuydqn+1tIM/dTw6YGS5IwpJllaLUuvCJqpeycldB3F+TBmgf31+gUjy2
	 iI52sl3i6LsdX5E6gaa3IU7J8teTy7VKLTwFydW21YEWUl1kHLh9JDgpnGdzmq/Vct
	 y72h/vieU1n3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772035299; x=1772295799; i=anthony.perard@vates.tech;
	bh=zyfB8a/LztjIJ2AZxsJrk+XNtYgH9WQ+m3rsAXKXpdU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=StdL/u14QdfCODZMQlK3/6wq/pkCGeIYEbMgEewQ3ncyhWTVm8vQApzi54bEcqBqd
	 zUKC6ZXZ6lyMR0MMf4hkwLrY4lW6OQ9RTbRh0vxaeFeqYzxTWUpz+WBafzOfwcH4Pa
	 FQnaWQdjeKCRtckjU24fDrbh0yUGLb6EJRiDDZZs9Tc7w4qmAtEKoefyAASAXbG6ae
	 uJ0ZsfYa/vFC9V5jyXDLFeDaNHTLAqoMGSzMvB5Ua7Talecnvjg0vZ1FrvMapBFtZR
	 LKY+QoXTDxZLo54O0YY7OSFa8PakQhAI1c1LxNCF4fp9Ly/5Oxfp+IrHmaKC2K7jtH
	 bx9eeGE0KjZ3Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v10=205/6]=20tools/xl/libxl:=20wire=20up=20SCMI=20SMC=20multi-agent=20configuration?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772035289214
To: "Oleksii Moisieiev" <Oleksii_Moisieiev@epam.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Jan Beulich" <jbeulich@suse.com>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>
Message-Id: <aZ8c2KGivXuLZGLn@l14>
References: <cover.1770982468.git.oleksii_moisieiev@epam.com> <4ed96ed7bbb04c02b09eed63730702398b00b83f.1770982468.git.oleksii_moisieiev@epam.com>
In-Reply-To: <4ed96ed7bbb04c02b09eed63730702398b00b83f.1770982468.git.oleksii_moisieiev@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.482a7224c02e41c58e684e009777b938?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260225:md
Date: Wed, 25 Feb 2026 16:01:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RSPAMD_URIBL_FAIL(0.00)[pod.in:query timed out,epam.com:query timed out];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:url,vates.tech:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	NEURAL_SPAM(0.00)[1.000];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[oleksii_moisieiev.epam.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E5B7519A2D8
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 11:37:05AM +0000, Oleksii Moisieiev wrote:
> Plumb the SCMI SMC multi-agent type through the toolstack:
> 
> - Extend libxl_arm_sci_type enumeration with scmi_smc_multiagent (value 2)
> - Add agent_id field to libxl_arm_sci structure for per-domain agent assignment
> - Update libxl_arm.c to translate libxl config to XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA
>   and pass agent_id to the hypervisor via xen_domctl_createdomain
> - Add xl.cfg parsing for arm_sci="type=scmi_smc_multiagent,agent_id=N"
> - Document the new xl.cfg options in xl.cfg.5.pod.in
> 
> This completes the userspace side of multi-agent SCMI, allowing xl create
> and dom0less configurations to assign unique agent_id values to domains.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v10:
> - Split hypervisor and toolstack changes into separate commits

Thanks. That's easier to review.

>  docs/man/xl.cfg.5.pod.in         | 14 ++++++++++++++
>  tools/libs/light/libxl_arm.c     |  4 ++++
>  tools/libs/light/libxl_types.idl |  4 +++-
>  tools/xl/xl_parse.c              | 12 ++++++++++++
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 27c455210b..e7f8af6156 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3156,8 +3156,22 @@ single SCMI OSPM agent support.
>  Should be used together with B<scmi-smc-passthrough> Xen command line
>  option.
>  
> +=item B<scmi_smc_multiagent>
> +
> +Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> +SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmware-A)
> +with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
> +specified for the guest.
> +
>  =back
>  
> +=item B<agent_id=NUMBER>
> +
> +Specifies a non-zero ARM SCI agent id for the guest. This option is mandatory
> +if the SCMI SMC support is enabled for the guest. The agent ids of domains

Those is need to say "SCMI SMC multi-agent support for the guest" ?
`agent_id` doesn't seems to be used if we only select "type=scmi_smc"

> +existing on a single host must be unique and in the range [0..254]. UINT8_MAX
> +(255) is treated as invalid.

What does "UINT8_MAX is treated as invalid" mean? Why is it mention? How
is it different that the number 3615? My guess is that we don't care in
this user documentation. All we need to say is that the value needs to
be between 0 and 254 included, which is already stated.

Also, it's written "non-zero agent id", but zero is in range of accepted
values ([0-254]). So is agent_id=0 a valid config, or not? Also, if this
config option isn't specified, we have a default to the value 0, is that
ok? (libxl doesn't check if `agent_id` is a valid value, only `xl`
doesn't that in this patch)

BTW, you could check that agent_id is valid value in
"libxl__arch_domain_build_info_setdefault()"

> +
>  =back
>  
>  =back
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e4407d6e3f..be0e6263ae 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -240,6 +240,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
>          config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
>          break;
> +    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
> +        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> +        config->arch.arm_sci_agent_id = d_config->b_info.arch_arm.arm_sci.agent_id;
> +        break;
>      default:
>          LOG(ERROR, "Unknown ARM_SCI type %d",
>              d_config->b_info.arch_arm.arm_sci.type);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 4a958f69f4..9bfbf09145 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -554,11 +554,13 @@ libxl_sve_type = Enumeration("sve_type", [
>  
>  libxl_arm_sci_type = Enumeration("arm_sci_type", [
>      (0, "none"),
> -    (1, "scmi_smc")
> +    (1, "scmi_smc"),
> +    (2, "scmi_smc_multiagent")
>      ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
>  
>  libxl_arm_sci = Struct("arm_sci", [
>      ("type", libxl_arm_sci_type),
> +    ("agent_id", uint8)

Could you add a "#define LIBXL_HAVE_SCMI_SMC_MULTIAGENT" in
"tools/include/libxl.h"? With a quick description about the new type,
and new field. The are plenty of "LIBXL_HAVE_*" macro example in the
header.

>      ])
>  
>  libxl_rdm_reserve = Struct("rdm_reserve", [
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1cc41f1bff..2f1b475022 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
>              }
>          }
>  
> +        if (MATCH_OPTION("agent_id", ptr, oparg)) {
> +            unsigned long val = parse_ulong(oparg);
> +
> +            if ( val >= UINT8_MAX ) {
> +                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%lu). Valid range [0..254]\n",
> +                        val);
> +                ret = ERROR_INVAL;
> +                goto out;
> +            }
> +            arm_sci->agent_id = val;
> +        }
> +
>          ptr = strtok(NULL, ",");
>      }

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


