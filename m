Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJMNHTW9pmlDTQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 11:51:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C841C1ECF92
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 11:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244645.1544055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxNLE-0003tl-5K; Tue, 03 Mar 2026 10:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244645.1544055; Tue, 03 Mar 2026 10:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxNLE-0003rp-2I; Tue, 03 Mar 2026 10:51:04 +0000
Received: by outflank-mailman (input) for mailman id 1244645;
 Tue, 03 Mar 2026 10:51:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rqN=BD=bounce.vates.tech=bounce-md_30504962.69a6bd13.v1-ea06e0878b7b46b086ed0fd05c3267ec@srs-se1.protection.inumbo.net>)
 id 1vxNLC-0003rj-Mg
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 10:51:02 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9c5c03-16ee-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 11:51:01 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fQCJg2r81z35hTPt
 for <xen-devel@lists.xenproject.org>; Tue,  3 Mar 2026 10:50:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ea06e0878b7b46b086ed0fd05c3267ec; Tue, 03 Mar 2026 10:50:59 +0000
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
X-Inumbo-ID: dd9c5c03-16ee-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772535059; x=1772805059;
	bh=do0k8s2/i826y+Ow/hLp7T1yQxJuUBshAis7wonRKd4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cTVP2bAnarTtOKyVMrsywXgynHkNhqbofs3Xa1jDXr4pefIs0y1T2yYT6N0wl0MxZ
	 6AjEfweHLtXDPlKK/drjBc7JpYltpctWvM6Mc5AtpGoS0LM69D/xnc/HWOSBrLdaaj
	 I5ioaEEYzcSu1h3KpH2zW66nJBTJ9W7QMgQ5soougpWz6A9ygsKLtqzg/q3vq/3Obo
	 yyROVdLbSO6P0kI1Z8B6ni761uCvj8FCsUwPMtF2bKJwcJgn4OfjJBj9UZGcIDA3Kq
	 UM/nU5dV3x8J6HAHoF6NLSR7Ul85xFeePWnDH9KUyvkfXyVbQTM1auvA2M3VHlLedk
	 Sg7M+SFxyzhMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772535059; x=1772795559; i=teddy.astie@vates.tech;
	bh=do0k8s2/i826y+Ow/hLp7T1yQxJuUBshAis7wonRKd4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=f9HmVMI56qfEH8anX9Gs8JrLjAkmkrabnl1tC01djOJrTZhbReeruAuo40AFe0wqf
	 Ja4gIIPrbzuPq4YAFOPT9bsoWr4hPDhFuennQQfoMl4wPdI4k7CVj1XC8RmiO5ESH1
	 2UjLfeo9s7k2wtPhq4UYS4sPmJA+48rgXKDMAGdPiUNAX0C0dej3s4WFRFH3ovogjE
	 5kn2OOIVSfHd9UZoNpoZHKqrXYQApi2GHgiqmMJxcuOIFC1AEQVyjLQYETex+gHNXt
	 VVsALa9mMhkp4YDbG4pdV39d+D/nNFjkaYb4ZgdybL/rpg0ug7tu17fwGRqoout0c8
	 TKtgntzKffBXQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=202/2]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772535058591
Message-Id: <4c18413b-6296-4a30-bbec-561f7b802cbc@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech> <aadf2e78f91f442964cc4e93c028b6b31fceb9eb.1772211384.git.teddy.astie@vates.tech> <7380cf63-e9ac-4df9-9633-c26f9de0027a@suse.com>
In-Reply-To: <7380cf63-e9ac-4df9-9633-c26f9de0027a@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ea06e0878b7b46b086ed0fd05c3267ec?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260303:md
Date: Tue, 03 Mar 2026 10:50:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C841C1ECF92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,vates.tech,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.996];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Le 02/03/2026 =C3=A0 17:52, Jan Beulich a =C3=A9crit=C2=A0:
> On 27.02.2026 18:00, Teddy Astie wrote:
>> @@ -1354,6 +1358,127 @@ void enable_turbo_mode(int argc, char *argv[])
>>                   errno, strerror(errno));
>>   }
>>   
>> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package=
, int *temp)
>> +{
>> +    xc_resource_entry_t entries[] =3D {
>> +        { .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_=
STATUS },
>> +        { .idx =3D MSR_TEMPERATURE_TARGET },
>> +    };
>> +    struct xc_resource_op ops =3D {
>> +        .cpu =3D cpu,
>> +        .entries =3D entries,
>> +        .nr_entries =3D ARRAY_SIZE(entries),
>> +    };
>> +    int tjmax;
>> +
>> +    int ret =3D xc_resource_op(xch, 1, &ops);
>> +
>> +    switch ( ret )
>> +    {
>> +    case 0:
>> +        /* This CPU isn't online or can't query this MSR */
>> +        return -1;
> 
> Further down at the callers of this function you assume errno is set when=
ever
> an error indication is returned. As xc_resource_op() didn't fail, you wil=
l
> need to synthesize an errno value here.
> 

ah yes indeed

>> +static void get_core_temp(int argc, char *argv[])
>> +{
>> +    int temp =3D -1, cpu =3D -1;
>> +    unsigned int socket;
>> +    bool has_data =3D false;
>> +
>> +    if ( argc > 0 )
>> +        parse_cpuid(argv[0], &cpu);
>> +
>> +    if ( cpu !=3D -1 )
>> +    {
>> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
>> +            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
>> +        else
>> +        {
>> +            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
>> +                    errno, strerror(errno));
>> +            printf("No data\n");
>> +            exit(ENODATA);
> 
> In how far is using errno values as arguments to exit() a useful thing? (=
I
> think you had it like this before, and I merely forgot to ask.) Yes, I ca=
n
> see the tool using a number of exit(EINVAL), but I don't understand those
> either. This way you can't even document easily what particular exit code=
s
> mean, as the errno values may vary across OSes.
> 

I reused the exit(...) pattern used in xenpm, but I'm also fine by 
returning simpler errors (like exit(1) or exit(EXIT_FAILURE)).

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 981d3ec519..7d186c4837 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -1377,6 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, 
uint32_t cpu, bool package, int *te
      {
      case 0:
          /* This CPU isn't online or can't query this MSR */
+        errno =3D ENODATA;
          return -1;

      case 1:
@@ -1434,7 +1435,7 @@ static void get_core_temp(int argc, char *argv[])
              fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
                      errno, strerror(errno));
              printf("No data\n");
-            exit(ENODATA);
+            exit(EXIT_FAILURE);
          }
          return;
      }
@@ -1475,7 +1476,7 @@ static void get_core_temp(int argc, char *argv[])
      if ( !has_data )
      {
          printf("No data\n");
-        exit(ENODATA);
+        exit(EXIT_FAILURE);
      }
  }

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



