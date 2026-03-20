Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLtdD24OvWkz6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:07:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323632D7C15
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257870.1552136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Vpc-0006UD-42; Fri, 20 Mar 2026 09:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257870.1552136; Fri, 20 Mar 2026 09:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Vpb-0006R1-Vr; Fri, 20 Mar 2026 09:07:47 +0000
Received: by outflank-mailman (input) for mailman id 1257870;
 Fri, 20 Mar 2026 09:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GknJ=BU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1w3Vpa-0006Cy-QT
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:07:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 425ef13e-243c-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 10:07:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 018D21682;
 Fri, 20 Mar 2026 02:07:39 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.84.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B34583F778;
 Fri, 20 Mar 2026 02:07:43 -0700 (PDT)
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
X-Inumbo-ID: 425ef13e-243c-11f1-b164-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/2] xen/arm: optee: Add MISRA-compliant switch default labels
Date: Fri, 20 Mar 2026 10:07:22 +0100
Message-ID: <0050ab559814a619b4ae23dd070e7aa4629865e2.1773911799.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773911799.git.bertrand.marquis@arm.com>
References: <cover.1773911799.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.915];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 323632D7C15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

optee.c has several switch statements over integer-valued OP-TEE fields
without a default label, and two default clauses that only contain
break. This triggers MISRA C Rule 16.4 findings.

Add explicit default labels to all reported switches and document the
intentional no-op defaults with rationale comments. The new default
paths preserve the existing behavior:
- unsupported parameter attribute types are ignored;
- non-handled RPC commands require no post-processing in Xen;
- unknown RPC function IDs are resumed unchanged.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/optee.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index f719d9d767ab..3d2633237074 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -897,6 +897,9 @@ static int translate_params(struct optee_domain *ctx,
         case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
         case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
             continue;
+        default:
+            /* Ignore unsupported parameter type. */
+            continue;
         }
     }
 
@@ -1027,6 +1030,9 @@ static void copy_std_request_back(struct optee_domain *ctx,
         case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
         case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
             continue;
+        default:
+            /* No output fields to copy for unsupported parameter type. */
+            continue;
         }
     }
 
@@ -1050,6 +1056,7 @@ static void free_shm_buffers(struct optee_domain *ctx,
             free_optee_shm_buf(ctx, arg->params[i].u.tmem.shm_ref);
             break;
         default:
+            /* No temporary SHM buffer to free for other parameter types. */
             break;
         }
     }
@@ -1503,6 +1510,7 @@ static void handle_rpc_cmd(struct optee_domain *ctx, struct cpu_user_regs *regs,
         case OPTEE_RPC_CMD_SHM_FREE:
             break;
         default:
+            /* Other RPC commands need no Xen-side post-processing here. */
             break;
         }
     }
@@ -1591,6 +1599,9 @@ static void handle_rpc(struct optee_domain *ctx, struct cpu_user_regs *regs)
     case OPTEE_SMC_RPC_FUNC_CMD:
         handle_rpc_cmd(ctx, regs, call);
         return;
+    default:
+        /* Resume the call unchanged for unknown RPC function IDs. */
+        break;
     }
 
     do_call_with_arg(ctx, call, regs, OPTEE_SMC_CALL_RETURN_FROM_RPC,
-- 
2.52.0


