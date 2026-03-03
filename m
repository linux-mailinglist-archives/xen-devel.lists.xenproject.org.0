Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULjUGMe5pmk7TAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 11:36:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9D1ECBAE
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 11:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244636.1544046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxN75-0001D5-Vi; Tue, 03 Mar 2026 10:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244636.1544046; Tue, 03 Mar 2026 10:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxN75-00019y-SC; Tue, 03 Mar 2026 10:36:27 +0000
Received: by outflank-mailman (input) for mailman id 1244636;
 Tue, 03 Mar 2026 10:36:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRO9=BD=bounce.vates.tech=bounce-md_30504962.69a6b9a7.v1-8d3d45f8eee04d98930e521723555683@srs-se1.protection.inumbo.net>)
 id 1vxN74-00019c-PO
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 10:36:26 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a96872-16ec-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 11:36:25 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fQBzq5d3Vz35hTbg
 for <xen-devel@lists.xenproject.org>; Tue,  3 Mar 2026 10:36:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8d3d45f8eee04d98930e521723555683; Tue, 03 Mar 2026 10:36:23 +0000
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
X-Inumbo-ID: d3a96872-16ec-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772534183; x=1772804183;
	bh=d+Gf5ULgHW5IJhmRmxNvkZtOOex1lueb4vEqeJbOAEo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0LnmLmxtqNLtQU25CztmGHzOy1A6Yvbs7ImxTsfJ3C360s/mp5hb3EpC4QHjlwwnO
	 lE0vVXOj+olkoAoM2oGjMe1qjxk793Uu1JHKvjj4UIkAEd6ZD5gc8oM9VcSDS5BWlk
	 ctTMFney1cXd5rcFr25GXHXL2y9kZN9VEeh0SFbo0dNePFRw4eKmzkNvrl9xBeThs/
	 36N4kVCIGZNeA3Am57hAUd5JcIHM7BXJ1Yg2A8E609hpctjzs7rxIwYnDHEmmyEs47
	 j+Avq3b8k+morkbr4oYoCp3IJSqrg3V9wn53kYQUY+IRPjZknitrcF8t7A3RAh8Vvk
	 EURZcwfKEB8fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772534183; x=1772794683; i=teddy.astie@vates.tech;
	bh=d+Gf5ULgHW5IJhmRmxNvkZtOOex1lueb4vEqeJbOAEo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=w8FX3NsIaVATAV2a/zLFRwUN5ztoAG/aLW6RxscDgWf+SFl/oBu4J/C7kfFIUD3mJ
	 UCtRKybt08TojYaEFUwb0+hFofMjB/Q98zJMlIettxtnschstLZXyAbKvv+G2UPf/n
	 NY8h+iKKMmEd6eomkxaYlceUynLYmwyxmlnplevoHEWMMBlvDbSvn06bB85l4VjXuW
	 tP5OWOjyZNmBs2/YjnpeS3ybwX0bRWpez+CBqM9+/SHQuGEHdXgx5A7py80HswL1aR
	 0cPdlSUJYx2lNA0TrXgcQ4StDKgRl2hbhmCwEDGzs2WP5F+YXnaESHlefr/2lpVp+U
	 p0FNd5jngJahw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=201/2]=20libxc:=20Report=20consistent=20errors=20in=20xc=5Fresource=5Fop?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772534183074
Message-Id: <effebb3c-fc3c-4f6f-a3a5-f59e7d982ab5@vates.tech>
To: "Anthony PERARD" <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
References: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech> <aaWo9FfgQMYvy_2I@l14>
In-Reply-To: <aaWo9FfgQMYvy_2I@l14>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8d3d45f8eee04d98930e521723555683?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260303:md
Date: Tue, 03 Mar 2026 10:36:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C6E9D1ECBAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.994];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Le 02/03/2026 =C3=A0 16:14, Anthony PERARD a =C3=A9crit=C2=A0:
> On Fri, Feb 27, 2026 at 05:00:05PM +0000, Teddy Astie wrote:
>> xc_report_op doesn't update errno in some error conditions.
>> Make sure it reports -ENOMEM in out of memory errors and -EINVAL
>> in invalid usages errors.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> v7: Introduced
>> v8: Use errno to report errors
>>
>>   tools/libs/ctrl/xc_resource.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/tools/libs/ctrl/xc_resource.c b/tools/libs/ctrl/xc_resource=
.c
>> index cb6a97202b..ac1524d1bd 100644
>> --- a/tools/libs/ctrl/xc_resource.c
>> +++ b/tools/libs/ctrl/xc_resource.c
>> @@ -28,7 +28,10 @@ static int xc_resource_op_one(xc_interface *xch, xc_r=
esource_op_t *op)
>>                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
>>   
>>       if ( xc_hypercall_bounce_pre(xch, entries) )
>> +    {
>> +        errno =3D ENOMEM;
> 
> Looking at xc_hypercall_bounce_pre(), it's looks like `errno` should
> already be set. On Linux, that would be `mmap()` or `madvise()` updating
> it.
> 
>>           return -1;
>> +    }
>>   
>>       platform_op.cmd =3D XENPF_resource_op;
>>       platform_op.u.resource_op.nr_entries =3D op->nr_entries;
>> @@ -54,11 +57,15 @@ static int xc_resource_op_multi(xc_interface *xch, u=
int32_t nr_ops, xc_resource_
>>       call_list =3D xc_hypercall_buffer_alloc(xch, call_list,
>>                                             sizeof(*call_list) * nr_ops)=
;
>>       if ( !call_list )
>> +    {
>> +        errno =3D ENOMEM;
> 
> Here, xc_hypercall_buffer_alloc() should already have updated `errno`.
> (It's a function called by xc_hypercall_bounce_pre(), so we've got the
> same culprit updating `errno`.)
> 
>>           return -1;
>> +    }
>>   
>>       platform_ops =3D xc_hypercall_buffer_array_create(xch, nr_ops);
>>       if ( !platform_ops )
>>       {
>> +        errno =3D ENOMEM;
> 
> Here, xc_hypercall_buffer_array_create() calls `calloc()` and `malloc()`
> which will update `errno`.
> 
>>           rc =3D -1;
>>           goto out;
>>       }
>> @@ -66,6 +73,7 @@ static int xc_resource_op_multi(xc_interface *xch, uin=
t32_t nr_ops, xc_resource_
>>       entries_list =3D xc_hypercall_buffer_array_create(xch, nr_ops);
>>       if ( !entries_list )
>>       {
>> +        errno =3D ENOMEM;
> 
> Same as above.
> 
>>           rc =3D -1;
>>           goto out;
>>       }
>> @@ -81,6 +89,7 @@ static int xc_resource_op_multi(xc_interface *xch, uin=
t32_t nr_ops, xc_resource_
>>                           platform_op, sizeof(xen_platform_op_t));
>>           if ( !platform_op )
>>           {
>> +            errno =3D ENOMEM;
> 
> With xc_hypercall_buffer_array_alloc(), `errno` is updated by `mmap` or
> `madvise`, like the first case.
> 
>>               rc =3D -1;
>>               goto out;
>>           }
>> @@ -90,6 +99,7 @@ static int xc_resource_op_multi(xc_interface *xch, uin=
t32_t nr_ops, xc_resource_
>>                      entries, entries_size);
>>           if ( !entries)
>>           {
>> +            errno =3D ENOMEM;
> 
> Same as above.
> 

Ok for all, though good to note that malloc ones are documented as 
platform specific behaviors (at least in malloc(3)).
But in our case (POSIX platforms), it's supposed to be the case.

>>               rc =3D -1;
>>               goto out;
>>           }
>> @@ -137,6 +147,7 @@ int xc_resource_op(xc_interface *xch, uint32_t nr_op=
s, xc_resource_op_t *ops)
>>       if ( nr_ops > 1 )
>>           return xc_resource_op_multi(xch, nr_ops, ops);
>>   
>> +    errno =3D EINVAL;
> 
> Ha! This one was missing indeed.
> 
> The patch description will need to be updated with all the chunk be one
> been dropped.
> 

Overall, it's

libxc: Report EINVAL on incorrect xc_resource_op usage

When passing 0 operations to xc_resource_op, a error is reported without 
setting errno appropriately.

> Thanks,
> 
> 
> --
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



