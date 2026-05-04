Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCLNIjlU+GnSswIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:09:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D1E4B9EBA
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299554.1574091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoLw-0006mm-W5; Mon, 04 May 2026 08:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299554.1574091; Mon, 04 May 2026 08:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoLw-0006lJ-T8; Mon, 04 May 2026 08:08:32 +0000
Received: by outflank-mailman (input) for mailman id 1299554;
 Mon, 04 May 2026 08:08:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wJoLu-0006lD-Vo
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:08:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJoLt-007wPo-Rx
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:08:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f853f6-e002-0a2a0a5209dd-0a2a4502e9e0-20
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:08:29 +0200
Received: from [209.85.167.47] (helo=mail-lf1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f853fd-af86-0a2a45020019-d155a72fec8d-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:08:29 +0200
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5a3d1561e38so3275015e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 01:08:29 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777882109; cv=none;
        d=google.com; s=arc-20240605;
        b=iuInSDAqgn1jKRkJ6/ilgsTjm6tokvsvfuRPcF+TECg/Oup7XZ1TP2ozaFnNaikSnd
         vvGOvWjaLi8dq64O/m/DrXcCwzQiwWJcRYf0YjYuogUhi8veeOiwKtYglELXwDwf/LBR
         sVnkFfi7YMlqsojSzPSHrGAQk8cfCkpqG8kxH8nzgVhsam00GtekvpG38bNNwOViogz9
         1xl6xVbJmRd0jPCXCLC/CHnXZhcYXyL9EBPmOXHFZxvCuZxzZRq5OuNcWcP42R/lxuO2
         oOfPdEmqtKruDgY3AZjQr3BGC4Fcp/R8IgAVP/WXHP5HMZZnWCi1zyAZQDbOWgjYSANc
         oudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qQDStmkrzvq8XjTGSV1q9ECeJq2d4zPRhDt/U4aOC0=;
        fh=jkSoJREO5h14KpMBT/ljS/ekmr5J1UsD5sXqYKYrHT4=;
        b=cIo+K5NVc+IITDGpVpDLsBuWnMi0noQlUOBqrSgVMCBaRZmLbG6vjGyNCqH3DaLQb0
         7AzUFtsGBmnsCHGLfNKnjmkBpeD2AosrzlpyuUyb/rHDQjcw/8eOS0kPppJ/k2gUPLHN
         ItsP13g0CQJP84VUWZ1exZ8WDigYtDyqfZWmj/VzgL5VfM1ONbvBOJIU5zDQ+ZCrENfg
         CyMsD9nkh4wHmbWaritdDvsOBX15oqQrNMoV5qzBt8vj/y3ee0FCBbL20hTh1az7r5jM
         AJ9QzumH1TGskmXji7H+ZLVMjIBMXctlbQEMEH3hfh7gwt+dPYkAn0hplfVAllupL21z
         3R7g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777882109; x=1778486909; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qQDStmkrzvq8XjTGSV1q9ECeJq2d4zPRhDt/U4aOC0=;
        b=VBH+yeaJHFdWKFeAjc2QfUmVt7oI8VgFa1VzaY6cfzEAXHklnPiCVkdjZ9V7KOY1Az
         JiI2EP0IEnbfWiyKl+Siwf+K9oZ+2/uGRa2J5IqsM80PsWt4iuuG5/cmuGHCaJwIJwBO
         hJ5yyXCdvYmreZoQxnQVitLV1qaGaI9ugreQpMR2mKBJalOsP2qgl5BTNtLeD1FKGfau
         /SBytfahpd2Q47dfLsePqQQ2MKGUqiz95ejjkuYYi7Pf5+4rnBIvd8RSm4kOYtP58BE4
         LUk0xnc0Hp93+iiThf1Gavz1JxFxQuOwFGy6ZY7+JmkwfuxateFXXE2Uj+0qt0kcjYe+
         2NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882109; x=1778486909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qQDStmkrzvq8XjTGSV1q9ECeJq2d4zPRhDt/U4aOC0=;
        b=hp1mGiWe5TrnPgeBhNqUKHdxVNtrYCSrCy5DHBSuw2kV0RgL66SsN2Du28zJHk2Mog
         IKZtloQLxCG8ZpKoZ56Xa7WmP6LhzHLwWjAAN2a4OUjGLiZnRkjZQmmTaAIvR+jKc6+T
         Ku2Dhv41YUZY5k6SrChW9X9UhMiXhHI0QLE/SF4k0HstQXo0GF4b8HcP9faxNINCXbNs
         ig4DuT3L0E4wrSzVMvRNDbhS4I8eRkaLS8hnAk4aW+0LrvW4R3I/UDCdTUWuu7wGlpkC
         jcLSGqyD1VTAj+oy0xg1Z1X89b3g8qj+QYozy4/SQyo+AHVSs6trb/+GGgadK8xnNyjz
         oaBg==
X-Forwarded-Encrypted: i=1; AFNElJ/ohvC4FLm+jQon7QKR864BDu4MQOeirnLISspaxbIk+bIO7gYbocPEI9ZyOAIqkY0Fw+DvOYklSJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGa0wnbx+xu7qBqACpU7XN4PS6gmGQJtySjUKADmmIK6FuoP3o
	83b3JwT/ok5hWmEQVWhQMxIthzq0q0slTWcnwsWCDN+bNgvuUJ5L/tBBSs1G9kMToPwu5LHSByr
	+rU/757405J1P0vB6hGjRP3msEUtjw9U=
X-Gm-Gg: AeBDiet50D1c+1eYSUA8oCtXFYrmOo2z/r8O0/l7vz/nXYwPr0TXi8f/wjWRVcZEKWZ
	TSZ5Qp5IJdS/EEwyzbmLX5SS3awyWQHendvz/fTOBbtaQLzaSjO6uJCDckVwbUz7N0yYXsfibHC
	KoA5JTCAWrkDUynYG6MH/etA+wQlBx/TgFJD/DAmr2CftLxFSvgNTJzttCNmAtSUo8FW57aIsOd
	40oSve/I9qbdzZQtSDwRNjTZ8SkxN8OQAETKdWakXAyLkuJCf4RBoqsiufROSgCX/4qKsmxwLlg
	yhTZDldYkgg1iB1W
X-Received: by 2002:a05:6512:b86:b0:5a8:6d5d:ca7f with SMTP id
 2adb3069b0e04-5a86d5dcb02mr1606805e87.29.1777882108766; Mon, 04 May 2026
 01:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com> <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com> <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
 <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com> <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
 <425cdc68-5e25-4e01-b5d9-6469e2d08abb@suse.com> <DDF9A244-22CB-416E-A855-D85FECE0A3C2@arm.com>
 <CAGeoDV_0r8_-dB33G5U81+Q1yncgzgLgMF5Ar_rmVt5h8-rgZQ@mail.gmail.com>
 <CAGeoDV-FWcrCHnE92s6Y+gpoVqa6vJDzB63Z6uXtL2T6Jfr7xw@mail.gmail.com> <b0a340a9-a10e-4256-9f38-c804767b0bfd@amd.com>
In-Reply-To: <b0a340a9-a10e-4256-9f38-c804767b0bfd@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 4 May 2026 11:08:16 +0300
X-Gm-Features: AVHnY4LhPAhpglB-N2_E_vD6t5WrzzH982qcwDTAGw6WmvSp3NvoeRqEQ-55FkM
Message-ID: <CAGeoDV-1CzoSHdXNVqVGSEEoGe2OR3tpJTfjELUvDF0upnCB1A@mail.gmail.com>
Subject: Re: Ping: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for
 SMC32 PSCI arguments
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1777882109-890CF161-736875D4/0/0
X-purgate-type: clean
X-purgate-size: 507
X-Rspamd-Queue-Id: D6D1E4B9EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Michal,

On Mon, May 4, 2026 at 9:50=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com>=
 wrote:
>
>
>
> On 04-May-26 08:46, Mykola Kvach wrote:
> > Hi all,
> >
> > Gentle ping on this patch.
> >
> > Bertrand has re-confirmed his Reviewed-by, and the previous discussion
> > looks resolved from my side.
> >
> > Could this be picked up if there are no remaining concerns?
> Yes, I'll merge it soon.

Thank you for the update. Much appreciated.

Best regards,
Mykola

>
> ~Michal
>

