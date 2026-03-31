Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGMiAnuSy2nMJAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:23:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DB366FA3
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268796.1557996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7VJI-0004yA-Jn; Tue, 31 Mar 2026 09:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268796.1557996; Tue, 31 Mar 2026 09:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7VJI-0004wj-G7; Tue, 31 Mar 2026 09:22:56 +0000
Received: by outflank-mailman (input) for mailman id 1268796;
 Tue, 31 Mar 2026 09:22:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w7VJH-0004wd-CL
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:22:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7VJG-00FtqS-Kd
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:22:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69cb9237-5cb7-0a2a0a5109dd-0a2a4502d44c-48
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:22:54 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69cb926e-63bb-0a2a45020019-d155a72badae-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:22:54 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5a2beddab48so332777e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:22:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1774948974; cv=none;
        d=google.com; s=arc-20240605;
        b=S+KzXaWv7MpKqFUHlbDukjm3bgLrbJ2w24/ACWz5eAuuSku/3yjo+CC+aO4QkrTGZ5
         +vRb9Cp8Y6GudAeQlFw7Fu3qfTYzB5dMgEv+6hPIEyQS8vou3Pgyevbfoh6v04dTW4nT
         /5zAvY7WGFq7IcROhqvOfNtzhIVt0Y1wO4SjfQ+hpRyWcbNlOeRIU6+WlubB6ld329dQ
         CFJEy7LoHI7Qt5k9yQbUfzkB36NlDOjQlPEvbCLWgkepQamdzZT3evHbL8dA/TmD0ad5
         JFR9uYqKnZ4o3LmoZ1uOf5J8rrWnDgPYCc2KNMDve0zB1Lx8UYP47Hx+FrWXS15xHCvy
         zylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HH8nGTmv9aJD+zEWW9cyBJtLtU+zFivyeHZiC0SYTmk=;
        fh=XPwOTaEPrdk2pN2RgjfihMkJ4NQu8t1nAUIywJrC5RY=;
        b=XHivl5oNS4EguZSIMD7yY1lsKg1ijHtluqH4ynlNvEqnKHr0mEDWXZ6CBRZy6zHMsc
         +kSAe0MOwKWabcxL9QEkdaLhSkP1vUDNZrznrnimeik4BlJnLFg2h2Akm/Xw7PSiHQhv
         xLBWsjqHhGO938LZQ7zJGXQM254JhpbXhVyKp2mNDAspN+CBf2SnqKouKYq8A4E+uUkq
         /4fdIIhs96i7QiBrn/cocUGJKsRIbm0PU9W6QLlPK3sXzNkPZciNVjdIcCJ8zq0Gkya0
         loIrDmP6HIQjVTtSTxIGgtKjJ33ccQ0AELIzpONK4W5EAoQn6/PWM7M0yNSPCZ4RjRUF
         hCYw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774948974; x=1775553774; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HH8nGTmv9aJD+zEWW9cyBJtLtU+zFivyeHZiC0SYTmk=;
        b=cFv3fE/vHFDD6L33GIB/TLrN/rY3t8MN/urGpx7f1hHdxWr/nQUb9R2PaTvYpqAair
         vj5wwVCB1YX+G4zrqUMfc+WwsuCBDvtpYlfE9YWJzffH67U61fUE87vzvB0Ar38f04pg
         Gcqem3jZWso2uWaj2pxqqJxuLh2s0a+WhJbFOcdxc/XYdD+tqgN+dncTDbGu+2TwKrk4
         Ey+htYUIvrFQH6eLDFsDuxj/8/HWSrbnX3BoPSsM0AMd596SVS3CrGlLCU+mB2aBrzww
         H0FG1s08CWR4YO9cm1pJx/e9gr3m9hPBppEL1ViGbXIisAzH3U8evwuKWWT82j5Zn7g8
         z/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948974; x=1775553774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HH8nGTmv9aJD+zEWW9cyBJtLtU+zFivyeHZiC0SYTmk=;
        b=CQOze3ljqZ1zmy77VfHZKBJ4wl8mcQTNomNXfC8VsUs0Oa9GjfWtvsEOjF4VWXFhRo
         kTZuBKXL+m0YfTXzOAgN4goW5HESfReqPZRAjZHbUGI+pkX4lxRc8bwL0YLYpVXERImt
         SC9AmIpxjEku3cTToMpKq6wlCbTmV2JUEwpKDjnzhBvlhEze8rEcnFaraKXJWsZBC70k
         JgBWnfv3QRcUrYgWRkhmY02l+LXBiwhqSI/HjB4US+BIDapnjLN9qRhCTnh03CTObIFH
         y2Da4yWKwNQkmRRdijLE/TNaVPbl4Ik7JlIgHTORswSpiyhMUXbWyzLYtMC4pvy6nMY3
         oUrg==
X-Gm-Message-State: AOJu0YyDTdnC22uas2eSXPb5NzoCpe7Doanytv5NY7FpChxv3+XvoAmR
	yXn3rR+09j2lWNXrjT6DrzZCtk3YyZ6t9VJToMw/Lk/uUfHEo0wvkHc1e/kMvzKIoS+HGFV7kTJ
	ocsFbx1QI1CJvKYXm5jKZL52R2M4TCsA=
X-Gm-Gg: ATEYQzxOAwx78/jFpoy1/oNOJKZvNSQjRCVBbQhBTwoJP2i4Sgt3wiUFzynzyrO2XSj
	amnweIQGhAickpxnIHfYitZnz6FIr3JC6xk0R9dXwbNyCARM6gatIyg0QyloAgUs8uQHHdLw8zk
	bsgH0vbPuvqhJ5DDX2mTXyWlBFITNbmWarDCCBJxHAvM/mKh7VY3ChS80PDhvvwQfzonZe7ahcx
	4MJ1Bye1lt9qurSlhb3okpaxTWGLNhjUcRJGOW/b8yfIPgsFIG6zLM/NhG1UP0YRA7QrIbvRQ2A
	hEZM
X-Received: by 2002:a05:6512:3a8f:b0:5a2:b90d:9bb5 with SMTP id
 2adb3069b0e04-5a2b90da5dbmr1395103e87.29.1774948973466; Tue, 31 Mar 2026
 02:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774353053.git.mykola_kvach@epam.com> <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
 <759c3ebb-4282-489d-a18d-0f808853a03b@amd.com>
In-Reply-To: <759c3ebb-4282-489d-a18d-0f808853a03b@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 31 Mar 2026 12:22:42 +0300
X-Gm-Features: AQROBzD-LVxk39Kkdj1cncgp7ucO94kGs6B5ukhQL4r-J5pysfGB6dRTa0sWOw4
Message-ID: <CAGeoDV9=0D3ZkP3FeP5mh2tJ_=dMyPvwM6x7bJ_uBd-_ZpsoDg@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1774948974-43A8CDB8-50235AA0/0/0
X-purgate-type: clean
X-purgate-size: 1680
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 633DB366FA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

On Tue, Mar 31, 2026 at 11:52=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 24/03/2026 13:26, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface=
,
> > allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND ca=
ll
> > (both 32-bit and 64-bit variants).
> >
> > Implementation details:
> > - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> > - Trap and handle SYSTEM_SUSPEND in vPSCI
> > - Reject SYSTEM_SUSPEND for the hardware domain to avoid host shutdown
> > - Require all secondary VCPUs to be offline before suspend
> > - Split arch_set_info_guest() into arch_vcpu_validate_guest_context() a=
nd
> >   arch_vcpu_apply_guest_context() for reuse by vPSCI
> > - Add vpsci_build_guest_context() helper and store prevalidated context=
 in
> >   resume_ctx; resume applies it and frees it
> > - Add arch_domain_resume() function is an architecture-specific hook th=
at
> >   is invoked during domain resume to perform any necessary setup or
> >   restoration steps required by the platform.
> >
> > Usage:
> >
> > For Linux-based guests, suspend can be initiated with:
> >     echo mem > /sys/power/state
> > or via:
> >     systemctl suspend
> >
> > Resume from control domain:
> >       xl resume <domain>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> I'll do the change Jan mentioned on commit.

Thanks for the review and for taking care of Jan's suggested change.


Best regards,
Mykola

>
> ~Michal
>

