Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DFAE94B8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 05:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025808.1401112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUddX-0007dp-Ek; Thu, 26 Jun 2025 03:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025808.1401112; Thu, 26 Jun 2025 03:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUddX-0007b4-8y; Thu, 26 Jun 2025 03:50:55 +0000
Received: by outflank-mailman (input) for mailman id 1025808;
 Thu, 26 Jun 2025 03:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VCL=ZJ=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1uUddU-0007ay-SR
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 03:50:53 +0000
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc4e9f7a-5240-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 05:50:46 +0200 (CEST)
Received: from localhostlocalhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 55Q3og51030390; Wed, 25 Jun 2025 20:50:42 -0700
Received: from XCH16-02-01.nos.boeing.com (xch16-02-01.nos.boeing.com
 [137.137.110.53])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 55Q3oWIS030339
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 25 Jun 2025 20:50:32 -0700
Received: from XCH16-09-06.nos.boeing.com (137.137.111.51) by
 XCH16-02-01.nos.boeing.com (137.137.110.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 25 Jun 2025 20:50:32 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-09-06.nos.boeing.com (137.137.111.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Wed, 25 Jun 2025 20:50:32 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.175)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Jun
 2025 20:50:30 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by SA1P110MB1359.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:197::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 26 Jun
 2025 03:50:30 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 03:50:30 +0000
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
X-Inumbo-ID: bc4e9f7a-5240-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1750909842;
	bh=p69J/5sr60GizvBupwyAViTfwTc/Zat/sv06XApCAks=;
	h=From:To:CC:Subject:Date:From;
	b=AH45lr58MTmWQ3TA6n1lcEp7apCShnFnpwRGTlRXK6ZUZ/oT0mqd+huxuUw6vVTH+
	 74/V6TO6HOSeUr9osZCJppQo2myo3YklpbOWJSjE6YWxIri/4hC1tMXNi1CtEBzQPh
	 nCcb9F42pmP0JOAFSDYn7yOzJ1MHti4wTTCdpDtlVw3vuhjGQEJyzcfj5evsQGI6Zm
	 dcZeZ1HB59cnfB2GjKMcd2FCwht3hWilXEtQ36hDiI7fWsQFE7Z0oYCS5fEo9aZORN
	 YZG2lEon+OPO6wZtpnsa2uOG6sJ4jseZCDMzEcg9wKKaBCuQSSDK9YM+sBYIPOBD3j
	 dLPPl9qFWFcZw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Wc8AFOKaggjMsvGO1295jP/L9tq87FzfYeb1Uw10Ex06lnU/5PpYH/K65xvXD+b4xQJUT4dJwmsQIqH59whvhWv8ZulYOWeDk5tcWjP4DU6YSSsyJCNt0gfKwaShADngqwKdQp9EiQ/MXD+6qGKIAmAVOWnE7e6ql/QvSZWfD+oWx+9JOwuFi1SRJXBijpVclApJzHff5Kt9E4JGA1je/ssU/lVQTPbZm2UmnhevCk7g+G0hI7th2k2w2iXlR7bL541CtPpRc2eUbBDGFMQFSCs3JtwxlLxkFon5Jh3AboxGL7qNoFdal16xUQyHIEBaN4PYHjf7Ngl9Nzrd6C7wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p69J/5sr60GizvBupwyAViTfwTc/Zat/sv06XApCAks=;
 b=L7P3tR9dUWcrHaSCWOGevW9EvRmDhncRatp6Vycmod4nwjDGOm9sdtasZQvXFMSNEtB0lUAd/eOTwvshz08bm6199/woC81Rh3WuBVeBVWQGKiBMiX3MWPk98ozx9HPpgvL3Jw6x9WbrGzFqY30uTUE9NFTVrke4mzMJf5/cVYOm4wThfxDYVwBWO5wz5aCCqWv36NtWdAdirnr+0OIBTnkOv2RKNPYFDZSRRLSO8oJe4CnvFloV4jxemZkehnSJQfiUV5XTOtmZdX9AYBBjKkhKVTEBjJZ4AeXMhxqGe2bprwalm6nx8tpyA87u5aLK3w1ZpP3w4s8+Fd/bNehYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p69J/5sr60GizvBupwyAViTfwTc/Zat/sv06XApCAks=;
 b=EHIQuRKs1NlckrXy+KM6HaMDsdG4+3CYFxXZQdxaK2dW0YDDQkgh3if1LWVkI0prPjmkDwMXtgFS8IcQHfmruiM/S5QmQp60QkbrcYYiImjmQOzirGi4cOrsj+Y9d7+cN27jgPMxXYzlO8cBF1c/W/tqNon5y+Rh421yqHGEpxo=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>
Subject: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AdvmTXSjjVtbwyT/QSCLI/dKN0kF9Q==
Date: Thu, 26 Jun 2025 03:50:30 +0000
Message-ID: <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|SA1P110MB1359:EE_
x-ms-office365-filtering-correlation-id: 9fab9b26-becf-429c-9f25-08ddb4649844
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dRPhLlJlZKOVNBXi84du+vh/uWiEZb3EsfxHjtIPfxXWbLEwyDq7aN4iPvJr?=
 =?us-ascii?Q?0Cha/OzBp1bk7OFEEBztNRnP/e76MO5/aIPFx5ZSO+IwC4RtZA9XnIRGNmLK?=
 =?us-ascii?Q?ovrEgK5U7t4cDEKCwoaUYNfQ16GXl+2xTWVjtITYhedwJII4pmETR8ITOLfB?=
 =?us-ascii?Q?LDkJiVqYdFKC/LSVE83OyvTSsT+nVO6bo9qyG8Bc+5Woz16HN0qgFOqWL9hU?=
 =?us-ascii?Q?mukHnv6g9Y11TvYoon0LaoBvT3JHS/t5ve0Q4dXhq7/jmq3PlltvEVaFKhEo?=
 =?us-ascii?Q?CDIocTMkNoJl7DdLdj4m58Fr4TWjo/Q5SwtnLTgHY/M0uzmPJY2TpfXgSCYW?=
 =?us-ascii?Q?yQkWPBR+QMvn9izDRM/oJZSm1rZqs/Z7k3H6MMckXD50vJLe7voD+H27SQHG?=
 =?us-ascii?Q?r8LV1roVsbMNFWoZ1msHXPsLe2l1IqwBtcP30CY8kLA+HunZKlsUnvmoXJTj?=
 =?us-ascii?Q?PzWTwcpv2I5x9vQ+8jBOXxVynWN6dlDGmaX44HqZQIMQI2TNvH17Yus//+e4?=
 =?us-ascii?Q?FC/cpoSSJmgqXMetIXPGLQxqem4cT/ru8SGMc5TkGcKYafcPDpPTVVvoXmuj?=
 =?us-ascii?Q?4sXsLh+ofr273vdcpvsY1sV24S4MUtP71RWtZMpuA0D6P/FTrvguIX1iTmSR?=
 =?us-ascii?Q?bZ6easH1gdbxvadrIDy7gTaoMZiGoHUSs4C2yG7e6fAPq196pmGe94kmT0uC?=
 =?us-ascii?Q?BFMFhXRlkt0DYvHdB6GME42wxCoMcbVM4310a32eDVAAE+3aYnuRsJWBTKqN?=
 =?us-ascii?Q?mzYNX8GRoI7o0NJ4Xmn2Qa2ll5148fPqVEwMZFdGGVBcyd3Lu9EQ6SjCbUgq?=
 =?us-ascii?Q?A5knAEVotL3rBHOf8LPKYYX/CTeKj1TUxVXLt37egYxKwlU0471+7m4x5ql2?=
 =?us-ascii?Q?3gDVH1Bp08LGF+QYCgRYPFtvH3qp5jQiuvDMeR7nKbXRSVjCmIi5i1nX0qol?=
 =?us-ascii?Q?wPABcucD7sgow9OCaBBVFeQmwoUJ67aU9aDTUVs3iVIecu0hil25pXMaOtsT?=
 =?us-ascii?Q?f/Xa3IRdz4b5r8KRVBvAAaXBHuso7C26auS7xPHABobQuB9ypYwIbOQOh1Nx?=
 =?us-ascii?Q?rtrNMNIytsblxhJTDWd6RWvPxZ+Zz8bJmzXjIOjCeQM0MMGyAKBSNv5/tBj7?=
 =?us-ascii?Q?1gIzpq+s1SoUuoHSQmX3cEGlGJFvXOYXG7N1j7gfS48yLoHNkPNdJLhZEoSv?=
 =?us-ascii?Q?4ei3Bj3PiNQmf9ACN2y/N8vzGz79yfSkwtsJ0tWOP2HOwtN9zibCQ/uAdU2G?=
 =?us-ascii?Q?d1Gvsl2uUnaofmkLt1jv+w9vc5KUT1wqo3I8I7TUmgkDyKsXBgAadp0Rw/Nh?=
 =?us-ascii?Q?GpQvI+PpzQ+Jjobz86oNx7K69Ghd+JjJGOJ411pQj7MjGuH/a2Fu4qGsQAL3?=
 =?us-ascii?Q?Pikvci16R4I0YM0S0jstrLMhw6bI9CxgagOW+gDCuabFS9cAdt/tdxF8FNo7?=
 =?us-ascii?Q?TR3UvB/n+NwWjgqZXV6XWjILy+kclCfqqf3j+4tHpcEF71eIffOtsw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?07HMVYT17xHGpP5+ry3vzNN//Ge48/klRKBntQnqBmExGjlxlpH97L63IjkB?=
 =?us-ascii?Q?gkywFSb48pqe6K8pjc0XlmJyFUD+P5JdNx4+vbWs7ZC5AWfeeAuZR/8ixQwY?=
 =?us-ascii?Q?Z4nr4UaHINyHZzg/2T5C3KK78X1nTzhJLOp/bbO39LDDIHGASt5b1YJiURFr?=
 =?us-ascii?Q?9m7FBMIULSTcHC4c19G11y/hs51WY20hKbgeqjRpA4YVlamWhBvu4oO/P2sB?=
 =?us-ascii?Q?gxdyQTdNrV7bqbyi/nJqfPlIt1LVNwJTbI9gpARy3NjmFdp9byDpImCi5EXi?=
 =?us-ascii?Q?lunX7/N8k+cLEmTOKscCjuD7lH4cMq4BigNA2R+tL7OVnIGq1TaMdBkrlXyv?=
 =?us-ascii?Q?XyLjYCitTh0vl7mKJQLagr+d86imVB3XiDYz4kVcvAlQVtOC+4NhfZCostVc?=
 =?us-ascii?Q?yOkHCT/shEph5tBM4ZBkkSlcUiSElsV6mci6pDZrhLPOd4343hhu8OFUCWYv?=
 =?us-ascii?Q?lqEjwN/HFXNIA/eWDSFLYKk7ds2jj9e2nMDVKQoOxCNwCVtT6SuRlHVY4FcW?=
 =?us-ascii?Q?8dhhvX2/OAGZsTxBCdy3Vl9vJA26i5Wjh3gL9swDE324VlsMN1+3/Xv+sCtG?=
 =?us-ascii?Q?jVjfGlWRH3vHrAgbDPnaKLwRmF5w78LIewba0fPdO/zT2dZL90t+sY6/Oy2C?=
 =?us-ascii?Q?8YKxq5tLV6bYaBbpiWZnYe4aZfS75fftu2ywyXSTQPOaJCSInpX95N0+kR+d?=
 =?us-ascii?Q?NE4Nx7CLM3YvE2lPnYxQxxdKDGHTE9cGR87DolftnO745FscVZEKueu054UG?=
 =?us-ascii?Q?ZiawO5Q5sKAaCLp/p+zA4r67XmieWsZ1Soasx2uu3IVyheWRPP+uCACZ/ZCx?=
 =?us-ascii?Q?vRlKYb0suG6aHeezm9DXxSoOj2+211Z7MgYjA0fzIYmV709QJxpL3vistbon?=
 =?us-ascii?Q?FtVw2cL7CUEr74MKdCqtjTIFu4w+UuTHUywFzbE7hGw3JO2u4ODaxR/zSwv2?=
 =?us-ascii?Q?DL7HZrFOskx7KeJ6c9Mp/PUcoFChcX4LQfkNe3g6uA6vfH1BQ7z7G0dAQK9U?=
 =?us-ascii?Q?VoARYzEXaWF1WtKSpnQxfKfMoUB/xAbwLFxXnXQDFBmQ4IUuT2rPU3NoNLXB?=
 =?us-ascii?Q?VnzbGRxIs6+2XJ+lLyS2EXqwniJdEb7g8HSY1OED7Zk0ZfgidnJ4dzruj2RO?=
 =?us-ascii?Q?/NJySbwgnJv2818NFv6lRopjCZ2FHn+FhOFCNaWEB3UVvTDY44xIzu5ptVPc?=
 =?us-ascii?Q?z+aRWN5dmbvgJR+oKd6woZ8fTwUh/uPuHogRYVQE6NFWQtaBJ6K9ohJjUIdP?=
 =?us-ascii?Q?/hBZBAUPg4urKlLSyciPsPWk8d0FsjonmAVTizAWKy69a99EkUJabtTSwkci?=
 =?us-ascii?Q?2NL6wE+hEPIILTwtyDWSJwBqUc/My4Evg3+3LQcLeZ6VEkZMXMuoJFsRSApq?=
 =?us-ascii?Q?wrXtmw62foWHlhdTtwPhVfACJHUDwBrLueEAeaTzuHVZbWaFg/y3l4G9/j9I?=
 =?us-ascii?Q?OJrnEgE3W2b8tMP3tRwS0oXTr4kYuQO1r6OLKZ67VISWR6MMAOkPCdClgGCK?=
 =?us-ascii?Q?9VdqjLJOhER3EBBH+nnu0CP8IyOxBTNeoVS7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fab9b26-becf-429c-9f25-08ddb4649844
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 03:50:30.0519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1359
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

We are observing a slight delay in the start of major frame with the curren=
t implementation of ARINC653 scheduler, which breaks the determinism in the=
 periodic execution of domains.

This seems to result from the logic where the variable "next_major_frame" i=
s calculated based on the current timestamp "now" at a653sched_do_schedule(=
).

static void cf_check
a653sched_do_schedule(
<snip>
    else if ( now >=3D sched_priv->next_major_frame )
    {
        /* time to enter a new major frame
         * the first time this function is called, this will be true */
        /* start with the first domain in the schedule */
        sched_priv->sched_index =3D 0;
        sched_priv->next_major_frame =3D now + sched_priv->major_frame;
        sched_priv->next_switch_time =3D now + sched_priv->schedule[0].runt=
ime;
    }

Therefore, the inherent delta between "now" and the previous "next_major_fr=
ame" is added to the next start of major frame represented by the variable =
"next_major_frame".

And I think the issue can be fixed with the following change to use "next_m=
ajor_frame" as the base of calculation.

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c inde=
x 930361fa5c..15affad3a3 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -534,8 +534,11 @@ a653sched_do_schedule(
          * the first time this function is called, this will be true */
         /* start with the first domain in the schedule */
         sched_priv->sched_index =3D 0;
-        sched_priv->next_major_frame =3D now + sched_priv->major_frame;
-        sched_priv->next_switch_time =3D now + sched_priv->schedule[0].run=
time;
+
+        do {
+            sched_priv->next_switch_time =3D sched_priv->next_major_frame =
+ sched_priv->schedule[0].runtime;
+            sched_priv->next_major_frame +=3D sched_priv->major_frame;
+        } while ((now >=3D sched_priv->next_major_frame) || (now >=3D sche=
d_priv->next_switch_time));
     }
     Else

Can I get your advice on this subject?

Should you have any questions about the description, please let me know.

Here are the details to reproduce the issue on QEMUARM64.

[Xen version]
- 4.19 (43aeacff8695850ee26ee038159b1f885e69fdf)

[ARINC653 pool configuration]
- name=3D"Pool-arinc"
- sched=3D"arinc653"
- cpus=3D["3"]

[Dom1 configuration]
- name =3D "dom1"
- kernel =3D "/etc/xen/dom1/Image"
- ramdisk =3D "/etc/xen/dom1/guest.cpio.gz"
- extra =3D "root=3D/dev/loop0 rw nohlt"
- memory =3D 256
- vcpus =3D 1
- pool =3D "Pool-arinc"

[Major frame configuration]
$ a653_sched -p Pool-arinc dom1:10 :10 //20 msec (Dom1 10 msec : Idle 10 ms=
ec)

[Collecting xentrace dump]
$ xentrace -D -T 5 -e 0x2f000 /tmp/xentrace.bin

Parsed xentrace shows that its runstate change from 'runnable' to 'running'=
, which means the start of major frame, is slightly shifted every period.
Below are the first 21 traces since dom1 has started running. With the give=
n major frame of 20 msec, the 21st major frame should have started at 0.414=
553536 sec (0.01455336 + 20 msec * 20).
However, it started running at 0.418066096 sec which results in 3.5 msec of=
 shift, which will be eventually long enough to wrap around the whole major=
 frame (roughly after 120 periods).
=20
0.014553536 ---x d?v? runstate_change d1v0 runnable->running
0.034629712 ---x d?v? runstate_change d1v0 runnable->running
0.054771216 ---x d?v? runstate_change d1v0 runnable->running
0.075080608 -|-x d?v? runstate_change d1v0 runnable->running
0.095236544 ---x d?v? runstate_change d1v0 runnable->running
0.115390144 ---x d?v? runstate_change d1v0 runnable->running
0.135499040 ---x d?v? runstate_change d1v0 runnable->running
0.155614784 ---x d?v? runstate_change d1v0 runnable->running
0.175833744 ---x d?v? runstate_change d1v0 runnable->running
0.195887488 ---x d?v? runstate_change d1v0 runnable->running
0.216028656 ---x d?v? runstate_change d1v0 runnable->running
0.236182032 ---x d?v? runstate_change d1v0 runnable->running
0.256302368 ---x d?v? runstate_change d1v0 runnable->running
0.276457472 ---x d?v? runstate_change d1v0 runnable->running
0.296649296 ---x d?v? runstate_change d1v0 runnable->running
0.316753856 ---x d?v? runstate_change d1v0 runnable->running
0.336909120 ---x d?v? runstate_change d1v0 runnable->running
0.357329936 ---x d?v? runstate_change d1v0 runnable->running
0.377691744 |||x d?v? runstate_change d1v0 runnable->running
0.397747008 |||x d?v? runstate_change d1v0 runnable->running
0.418066096 -||x d?v? runstate_change d1v0 runnable->running

However, with the suggested change applied, we can obtain the deterministic=
 behavior of arinc653 scheduler, where every major frame starts 20 msec apa=
rt.
=20
0.022110320 ---x d?v? runstate_change d1v0 runnable->running
0.041985952 ---x d?v? runstate_change d1v0 runnable->running
0.062345824 ---x d?v? runstate_change d1v0 runnable->running
0.082145808 ---x d?v? runstate_change d1v0 runnable->running
0.101957360 ---x d?v? runstate_change d1v0 runnable->running
0.122223776 ---x d?v? runstate_change d1v0 runnable->running
0.142334352 ---x d?v? runstate_change d1v0 runnable->running
0.162126256 ---x d?v? runstate_change d1v0 runnable->running
0.182261984 ---x d?v? runstate_change d1v0 runnable->running
0.202001840 |--x d?v? runstate_change d1v0 runnable->running
0.222070800 ---x d?v? runstate_change d1v0 runnable->running
0.242137680 ---x d?v? runstate_change d1v0 runnable->running
0.262313040 ---x d?v? runstate_change d1v0 runnable->running
0.282178128 ---x d?v? runstate_change d1v0 runnable->running
0.302071328 ---x d?v? runstate_change d1v0 runnable->running
0.321969216 ---x d?v? runstate_change d1v0 runnable->running
0.341958464 ---x d?v? runstate_change d1v0 runnable->running
0.362147136 ---x d?v? runstate_change d1v0 runnable->running
0.382085296 ---x d?v? runstate_change d1v0 runnable->running
0.402076560 ---x d?v? runstate_change d1v0 runnable->running
0.421985456 ---x d?v? runstate_change d1v0 runnable->running

Thanks,
Anderson

