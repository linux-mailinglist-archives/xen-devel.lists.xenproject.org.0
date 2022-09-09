Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B925B34A3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404092.646424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWakY-0003Af-Kw; Fri, 09 Sep 2022 09:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404092.646424; Fri, 09 Sep 2022 09:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWakY-00038X-Hl; Fri, 09 Sep 2022 09:56:38 +0000
Received: by outflank-mailman (input) for mailman id 404092;
 Fri, 09 Sep 2022 09:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTTi=ZM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWakW-00038B-6t
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:56:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a68780b3-3025-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:56:18 +0200 (CEST)
Received: from FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::14)
 by AM8PR08MB6561.eurprd08.prod.outlook.com (2603:10a6:20b:368::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 09:56:29 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::b4) by FR0P281CA0045.outlook.office365.com
 (2603:10a6:d10:48::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.6 via Frontend
 Transport; Fri, 9 Sep 2022 09:56:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 09:56:29 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 09 Sep 2022 09:56:28 +0000
Received: from 55a50f561b9e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 383F1661-B06E-4A90-B7A0-85C11EB37C9E.1; 
 Fri, 09 Sep 2022 09:56:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 55a50f561b9e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 09:56:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6184.eurprd08.prod.outlook.com (2603:10a6:20b:29c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15; Fri, 9 Sep
 2022 09:56:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 9 Sep 2022
 09:56:21 +0000
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
X-Inumbo-ID: a68780b3-3025-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K149ofrXjXDqMEHawZDsbixjhZNd4X8ZvQHQ5Wf8cCwKwTWOSnDcZhOzx8mCtGpj4AA97ik9uPy6ompXxi/lN2UOSAkgK2bqEzEnr/F2K4cvybwCoM8KExtDAgbXTzUnwZSX2C0klXLSpteQgBmPNdzzRzmNWLekQwLV3SzWIczPxVFwIO/jG/itE3n14vFODR6Rv088WNJ2mgqm4FRpQsRvgbuLWjuXZ74nrWQNwGoSpi36SAn9wyNv6uQ34PLBdm5m/kKbymgt5E9xRnG7yMMyO+707fwdXkk34Xf/Mz5w90WzKUrhAH5hL3Yuf+SsNtwURe/a55s657sViNIMBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMVI0uwjXlNqgN//YaBP0fYehbV3VaJJVKqOggi+tNE=;
 b=d1NXrlhsNnn3IauyKZp42sb2t8J4sMvZGl+xTa9Zb/I/LnZ02z+UpDNclFFO0IJVT1KtRkB95O3t8GhSotqDNromWfigKv67at1Y3bcqYr1EXJ+VfVoLnYnK6/nv63s2EHqg4vZVDgPlFFpKMBSbeaTLQjbxstTgiookyryLzgZd8F6ccYbJ5bQc2bKckbr5mUOXsibeq8hJ2nALEPwnX0LCma8wzCWhyIJhB/gmXkcemJN8KxJn4aISt44mIeVxEeJfqlu65+P+EI+MmRHWcat5IqJfa2Wd/pmMrHY0Lggj24++K5Rjz/y2VLXJ4QmChPL4Y//FC9OujC3NyMFqbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMVI0uwjXlNqgN//YaBP0fYehbV3VaJJVKqOggi+tNE=;
 b=M3U6g1lMCbdvxUnWG25DsHaigFWDtMFl6+DcFVH2535O5YtBgvur5AfezwDzOrYnily/5YdstN0bBQVESXPDm7jCEpw/DyyrlvJgqf3WKhLZnYkttw2ZmHbL25NsNt0GlZHCQaqZSBZWe8koF9HLY864gUtHTnk2JXsKExesC14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5X5gXDb6OidzYtLnfEC5x1rDjUdghG/MDemU0imvGFSeauy0nMiYycP7AZiDHGjvC1Z5JWpYDlGNl70R5UyA2mX4uw5pY9Fw4NhrYJawMbSM1vqkrXwu0xm6WGZN9c8Y/NSZH7IA3aCXsv338fkiKKulnwJWt6BrZWGVPmzv4KdWV52PuPG9lb1BY8AR7xYOY0mGCeuunVHjR2iLpwgdT0YRCWU5nF2YRrUHOQsbqmMHPBt2V0sNK9LiuRiXEeOYrhNvBSD4IXtN9s8wDk5KRrwKZP0QVWx1v0FzR3QHtaDpznIXV3luA390tLMqSZck1tzPp8U7myO/2Wg+aob0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMVI0uwjXlNqgN//YaBP0fYehbV3VaJJVKqOggi+tNE=;
 b=WW7XbDSGwRdlOX4AUKKB1MZyrG+4wSbWzVVfi+4Ui+7ZrDtq6jK8UBpwTBF/GtQAfuho8lz2C3xvC9YGxjVTghjPZK6XKokyUmVeQ1XS8WQqaemhxLc2UlxlSsYUMj6++4Uf2h3iXX17DM9yrVFZedhwJQuDLyjlFaPmaYfPC9LO5IVXBgyVvgXM1w7EghuD5Mp6eU22iVW4wOh2mkG2XJmEtkOQr5/VvZIJVw45DXtlk6xX+Yy1ui7pgmH5T5+LwEFYitGfTk9NiipLeGZ4COL1HdSgYWA3Bs6kw9i00zw2o0s8UhlTGA3ccJmt41ElucTnpjenbD4Y8sMqfUr2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMVI0uwjXlNqgN//YaBP0fYehbV3VaJJVKqOggi+tNE=;
 b=M3U6g1lMCbdvxUnWG25DsHaigFWDtMFl6+DcFVH2535O5YtBgvur5AfezwDzOrYnily/5YdstN0bBQVESXPDm7jCEpw/DyyrlvJgqf3WKhLZnYkttw2ZmHbL25NsNt0GlZHCQaqZSBZWe8koF9HLY864gUtHTnk2JXsKExesC14=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jandryuk@gmail.com" <jandryuk@gmail.com>
Subject: RE: [PATCH] xsm/flask: adjust print messages to use %pd
Thread-Topic: [PATCH] xsm/flask: adjust print messages to use %pd
Thread-Index: AQHYxDGm1l2kl9jZnEi0PeM8zmcB0K3W20Yg
Date: Fri, 9 Sep 2022 09:56:21 +0000
Message-ID:
 <AS8PR08MB79918FE3B1C08991CFF62A3092439@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220909095012.4251-1-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 424ECAEE4083B542A4F7005EBBF175C0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0573a62c-4c71-4296-e500-08da92499133
x-ms-traffictypediagnostic:
	AS8PR08MB6184:EE_|VE1EUR03FT024:EE_|AM8PR08MB6561:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UAG7RPJ5xGsLCOU2cbRrSPIL7lFggeP7I5+93/kSewG0N1Kq26CxX1XNV/ThjHttYe7TxlyXVEoqZ7J/yiRHeo56YbrLYisouk90aE1zchBrb+0CU1ziBkjtiRsSYR1l9ESnLU3KhlJ4VM2Sy9WFqXt5n+8ou82p8H0F/gaPunbCGRbu6X9HBoksowJM9Js4i4h73XS78JlLvCtceVro16hgLe50FWZF9MSOnxtVhXex4LR0KjtDJFiIKJw2baUXOxnK1CJzvPA8EAHRkGAhhEvlN5hDLKdG4QLeGAKoRKKnJl/EYgDSMBvj5w0hTY4fLEz0DOM6MSgrzjnu7vf2qZofRYoxxYZBhnvlUuVGdQX27rJdT6S4XZNsAKue1LjCwcK9S/uIZgvOFZVOrJtBwBE34gZBwdNsnIsLYtPISgy/pYTmar3S3d78h0PwGYbUV0/rGw6Mor3NFY0B4nCQCQxb2VqI6BeH+y6I5qcCOdUTWl8spqnLrPwtG3C82+0WbnE1XlpBJhwL3r+c6k3jQrcLHYNEaPsWXoxPY+4COELNojXpBJI623Xao4c7540ZGUZk9BUSeeAIZ2hnZCXgJtgRXyEnjUCnobV3ZkRUA9g8VGcVjIvtepZdY4u3DTziRw+GA3VZ3CP4cK6a8jmHUMRX9H6FlGZsOpwmY6P/m4K+Zfc28zDltvc0PiX2ywt+XnK6mTY+hY8qX6g/yHSHqErujeNQD9+GUpEwYpFnIR8Kgivls2GDmH7qbgd6t/Va4ZA9EKRQwkgYK5tOKe5m6Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(38100700002)(33656002)(5660300002)(15650500001)(122000001)(83380400001)(186003)(110136005)(316002)(8936002)(52536014)(2906002)(8676002)(55016003)(76116006)(66946007)(4326008)(66446008)(64756008)(66556008)(66476007)(86362001)(7696005)(38070700005)(6506007)(26005)(9686003)(41300700001)(478600001)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6184
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	743bd34d-b167-474b-e68a-08da92498cc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	11C9TEuP6kdW9NXFTlusvmBls/sToLjZbQ3Gm8eARtg99Ptzbe8gqrewNKx1ylFQaho5nB0eU8n7DPV2zuXuTQO3jKFgk4OdENaPF7SV9RJpQJryfy1RnsOV7k8MVlMMhRsGW6lQTWSUq7klU5EWmzKoQa2RQBy5M809tnA2tidmzFCh2P7JAYDN9ey0rCOzdI05fB4lzOiI/3dlJ6YNBjEvBlAGoxmYQ/V6btdJoIFjOYRXRkTl/lhD4Ew1t9/X7D+f1uVOFw2rjZuB1cy1VH4iZ4oxSiNTycw+hMXJz/UU62bH879tvZ88min2QDquZaKX4+8C1zmLeADVHDwry4GJhQURAqMMV4xmNKea58d3SMnTBySFsoRfvLDCNspjODLdKnaVzHYqmDslxJXy5Ow5qoQlOQOmvwy50LSuArIpr6Sfs+zq7rfinUdI9lr3AhaX5Q7yysGM+1aY3/pZJwAayvIR4+ZGqm4iafOnVFfTzX8c6rQeVcfwXH2qLy1SANK1WEbpu7EF7xxBD+m8KEO78wR3p9JPEXmrYBSa2fIF+vFvR8mzWhMEwTeAPt8KzEZIa+0KYvVBzdRr013fihM0E54rnU4FCOdnXyW8xcu0O5P4DSRyKEikwXcBPinJAhedYfhUgUGSvHEOOfpWziXoNN8axczWjMZGtSnWZ100Mrm7IPL4Eu354/MZwZ0gWcQL7nwuqq+/77fvBsPrva+495N4vrGuD2DLmZN3FFfnWoBO0rzSra6fDnwAK4vpX26viRFuPaKNhGX4KM99hw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(82310400005)(83380400001)(86362001)(186003)(316002)(110136005)(336012)(36860700001)(47076005)(70586007)(52536014)(107886003)(5660300002)(8936002)(70206006)(356005)(478600001)(8676002)(41300700001)(4326008)(9686003)(55016003)(40460700003)(82740400003)(40480700001)(81166007)(2906002)(26005)(15650500001)(33656002)(7696005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:56:29.1618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0573a62c-4c71-4296-e500-08da92499133
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6561

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH] xsm/flask: adjust print messages to use %pd
>=20
> Print messages from flask use an inconsistent format when printing the
> domain
> id. The %pd conversion specifier provides a consistent way to format for =
the
> domain id and aligns with the rest of the hypervisor code.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/xsm/flask/avc.c   | 8 ++++----
>  xen/xsm/flask/hooks.c | 3 +--
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
> index 4a75ec97e2..4a86681c81 100644
> --- a/xen/xsm/flask/avc.c
> +++ b/xen/xsm/flask/avc.c
> @@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32
> requested,
>      if ( a && (a->sdom || a->tdom) )
>      {
>          if ( a->sdom && a->tdom && a->sdom !=3D a->tdom )
> -            avc_printk(&buf, "domid=3D%d target=3D%d ", a->sdom->domain_=
id, a-
> >tdom->domain_id);
> +            avc_printk(&buf, "source=3D%pd target=3D%dp ", a->sdom, a->t=
dom);

I guess this should be target=3D%pd?

With this fixed:
Reviewed-by: Henry Wang <Henry.Wang@arm.com>

This should also be fine to merge in 4.17, but following the discussion wit=
h
Julien and Jan I think providing a Release ack would lead to confusion...

Kind regards,
Henry


>          else if ( a->sdom )
> -            avc_printk(&buf, "domid=3D%d ", a->sdom->domain_id);
> +            avc_printk(&buf, "source=3D%pd ", a->sdom);
>          else
> -            avc_printk(&buf, "target=3D%d ", a->tdom->domain_id);
> +            avc_printk(&buf, "target=3D%pd ", a->tdom);
>      }
>      else if ( cdom )
> -        avc_printk(&buf, "domid=3D%d ", cdom->domain_id);
> +        avc_printk(&buf, "current=3D%pd ", cdom);
>      switch ( a ? a->type : 0 ) {
>      case AVC_AUDIT_DATA_DEV:
>          avc_printk(&buf, "device=3D%#lx ", a->device);
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 8bd56644ef..a79281bdb0 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -281,8 +281,7 @@ static int cf_check flask_evtchn_interdomain(
>      rc =3D security_transition_sid(sid1, sid2, SECCLASS_EVENT, &newsid);
>      if ( rc )
>      {
> -        printk("security_transition_sid failed, rc=3D%d, Dom%d\n",
> -               -rc, d2->domain_id);
> +        printk("security_transition_sid failed, rc=3D%d, %pd\n", -rc, d2=
);
>          return rc;
>      }
>=20
> --
> 2.20.1
>=20


