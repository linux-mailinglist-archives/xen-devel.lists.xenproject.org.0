Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM1GEicLoGnbfQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 09:58:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51FD1A3036
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 09:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241312.1542398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvXBM-00089F-Rs; Thu, 26 Feb 2026 08:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241312.1542398; Thu, 26 Feb 2026 08:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvXBM-000876-P1; Thu, 26 Feb 2026 08:57:16 +0000
Received: by outflank-mailman (input) for mailman id 1241312;
 Thu, 26 Feb 2026 08:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvXBL-000870-VX
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 08:57:15 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24534315-12f1-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 09:57:13 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso5348145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 00:57:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b3471asm34125995e9.3.2026.02.26.00.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 00:57:12 -0800 (PST)
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
X-Inumbo-ID: 24534315-12f1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772096232; x=1772701032; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0724WCopK/1FyxOPGWFFS5yePKLO9Eft9ibIIKk8hg=;
        b=WU6TdA3X48ZveVtkdtSBuywcUuYAoge46LKRw/yVlwBfGJfydYTqEP2Z/klUDJMvRo
         WhLhdNc1E2V+F8IOoBPQAIx6WWnTrquxwBQInhoZLilDuG3bjOdfWx+CTHPh5T1HtPX3
         CusKDBWk5Cy1GoDN5618L5zAew66++jT+gkEO4Ot7NQArmWkrzYzlXQZQLZijACoTNtw
         N+2cKu7diBrloBzEY1ViN04r4wSmDboNkD/DcRnfS12uHzBQWSvF6cDRr4C2ATgSCkSB
         Jq6sQ7n/tntnwgvWpS0p6mk6OC10sM/SdHn3g6S9dxV5xcyRVgV9G2gCj+J0+SIqB7tj
         4SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772096232; x=1772701032;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0724WCopK/1FyxOPGWFFS5yePKLO9Eft9ibIIKk8hg=;
        b=SnyNSnntcAZ6LCB48HIPRRnZfvYqZ3myrhQUGneZEQSHS2UxkIIGdN7csTeyXHEkov
         bCEnU3xJJBt57YBuNspwzi7biJnVE8w4Lg5cdZlEc7OpT2Rh+B7HYolFJ6tN7wa9I/Mz
         Ou7DcQ51OMwjkcX7qj6BghpFROkYPXvIqR0FfbHoiLvm1zcRqTtfJHBX3kjIYT7ObOwk
         2tat8Y5xjxcwthFWqLiXp9trdys0O0WGxhulkA8mQYJhz9l6TFffQD+uiFPrgobk7HuJ
         Dd0nZCG2xsE2SmTHI+ENr71+1LP58jz1PYN8A1VY6dRS0MDWX/AMMXTcPbrFieo1FNBB
         5/4Q==
X-Gm-Message-State: AOJu0Yz4ubApbaR2J5WxdEak54ldOrFRNISTpvOScZGRLIVgPB/E0/B+
	NUg1u6WFZztjg/mMJQeU1vYDpkEmv472QfiMq7uLlOGa7SVBMMhaI1MMvUPzLgHTt7fM2qTVC2s
	TwCA=
X-Gm-Gg: ATEYQzz1d6Ggg1k0TIu0qoyQPTHDFbb7Kl2i6Y9SOdbEyWIDYqa7WEYorLsV6QbGS8+
	76+AjvMvAwDR5Gw3QrgpqQ9HPpIRBEOJlqbDmJlVyd/tWoQV//2DSfdOL9qrcE9YE8WaJKl7DCP
	9UjayH6+g0FruY/c1gagDh0HdYTbrPtWpm3/BZSzcqRtdzbG0E5Xw6Lu+mLhUGriRhwVnL4g8Ab
	0/VvDBruV9inzJ+nDePaVUYjiLrccqzN3I3eQu8h4YxjHRmqipmnPMah4JlA1UWPGWJqRnGFByo
	CcqzLWrUmAOeyJlKeMo6WNmNDLuyjMJ5NS2UTaiRumuBu4yGg7k5CdpOQKE+e3azcpPf3QTUNbg
	whq5WBOpk/UB9DkULfHy0X7EytuKEHHZJqq2+JBMzLVPh/SxoGE7IbwlCc69pfK9aPY5Cnzafjx
	QV1K2TQfqxBoEBytTkOCs0R1b7rhKM0/Z9wILqqErg4Bcu+iA6dmksrRTpYVes9klmXg6QfUh6n
	/lrzx6sM2oqcjtULSLAWFemdw==
X-Received: by 2002:a05:600c:c3ce:20b0:483:c12b:fe3c with SMTP id 5b1f17b1804b1-483c12bff86mr49293295e9.4.1772096232463;
        Thu, 26 Feb 2026 00:57:12 -0800 (PST)
Message-ID: <f11a57c2-662a-453b-86f9-b10c489aaa90@suse.com>
Date: Thu, 26 Feb 2026 09:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: don't use #if in unlikely() invocation
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A51FD1A3036
X-Rspamd-Action: no action

As per the standard this is UB, i.e. we're building on an extension in
the compilers we use (for gcc, see "The C Preprocessor" section
"Directives Within Macro Arguments"). Misra C:2012 rule 20.6 disallows
this altogether, though.

Combine the fix with some tidying: Fold the two level-1 checks, adjust in
particular comment style, and move the unlikely() use to a single inner
part of the conditional.

No functional change intended.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -634,35 +634,36 @@ _sh_propagate(struct vcpu *v,
         sflags |= _PAGE_UC;
     }
 
-    // protect guest page tables
-    //
-    if ( unlikely((level == 1)
-                  && sh_mfn_is_a_page_table(target_mfn)
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC )
-                  /* Unless the page is out of sync and the guest is
-                     writing to it. */
-                  && !(mfn_oos_may_write(target_mfn)
-                       && (ft == ft_demand_write))
-#endif /* OOS */
-                  ) )
-        sflags &= ~_PAGE_RW;
-
-    /*
-     * shadow_mode_log_dirty support
-     *
-     * Only allow the guest write access to a page a) on a demand fault,
-     * or b) if the page is already marked as dirty.
-     *
-     * (We handle log-dirty entirely inside the shadow code, without using the
-     * p2m_ram_logdirty p2m type: only HAP uses that.)
-     */
-    if ( level == 1 && unlikely(paging_mode_log_dirty(d)) && !mmio_mfn )
+    if ( level == 1 )
     {
-        if ( ft & FETCH_TYPE_WRITE )
-            paging_mark_dirty(d, target_mfn);
-        else if ( (sflags & _PAGE_RW) &&
-                  !paging_mfn_is_dirty(d, target_mfn) )
+        /* Protect guest page tables. */
+        if ( unlikely(sh_mfn_is_a_page_table(target_mfn))
+#if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
+             /*
+              * Unless the page is out of sync and the guest is writing to it.
+              */
+             && (ft != ft_demand_write || !mfn_oos_may_write(target_mfn))
+#endif /* OOS */
+           )
             sflags &= ~_PAGE_RW;
+
+        /*
+         * shadow_mode_log_dirty support
+         *
+         * Only allow the guest write access to a page a) on a demand fault,
+         * or b) if the page is already marked as dirty.
+         *
+         * (We handle log-dirty entirely inside the shadow code, without using
+         * the p2m_ram_logdirty p2m type: only HAP uses that.)
+         */
+        if ( unlikely(paging_mode_log_dirty(d)) && !mmio_mfn )
+        {
+            if ( ft & FETCH_TYPE_WRITE )
+                paging_mark_dirty(d, target_mfn);
+            else if ( (sflags & _PAGE_RW) &&
+                      !paging_mfn_is_dirty(d, target_mfn) )
+                sflags &= ~_PAGE_RW;
+        }
     }
 
     // PV guests in 64-bit mode use two different page tables for user vs

