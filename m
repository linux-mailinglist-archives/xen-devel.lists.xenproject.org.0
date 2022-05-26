Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66966534D41
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 12:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337445.562167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuAdJ-0006em-Lf; Thu, 26 May 2022 10:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337445.562167; Thu, 26 May 2022 10:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuAdJ-0006bu-IP; Thu, 26 May 2022 10:22:21 +0000
Received: by outflank-mailman (input) for mailman id 337445;
 Thu, 26 May 2022 03:45:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j/Im=WC=marvell.com=nareshb@srs-se1.protection.inumbo.net>)
 id 1nu4R1-0005fa-E7
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 03:45:15 +0000
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eca1fc0-dca6-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 05:45:13 +0200 (CEST)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24Q2Ah6I003208;
 Wed, 25 May 2022 20:44:57 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3g9jap3ssk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 20:44:57 -0700
Received: from DM6PR18MB3193.namprd18.prod.outlook.com (2603:10b6:5:1c4::10)
 by CY4PR18MB1174.namprd18.prod.outlook.com (2603:10b6:903:112::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 03:44:55 +0000
Received: from DM6PR18MB3193.namprd18.prod.outlook.com
 ([fe80::7411:dbb2:1f0e:9aa3]) by DM6PR18MB3193.namprd18.prod.outlook.com
 ([fe80::7411:dbb2:1f0e:9aa3%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 03:44:55 +0000
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
X-Inumbo-ID: 3eca1fc0-dca6-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uy4kEPGyz+Z3UrherOABT6wROvGty6tC+ouubyTSvaPSopyAngNs1ixZ7WEOJZ6ld8Z1CVm+SMfsDhyyv0DH9JeFSuBxMUxCOwrjk9imU6K8qHywcEqfOiBZCTgZD1/cVsRBTmJeN9RDNmwAFKSG1C1SvHcqjdUBYqlbTCRmC+LTEoBwbMLtre/YgcbpPUvOwks2+RnCn0h9DpJ81ed30v8lO4illR4t1EIAYjMdCjml4GpABMN5UoWk4Eh6k6RRMRzJMhAk4JVWF/Zv3cDcIelb7IUzHwLqFvo7Gdqq4Ke4f/0u8dLku4gobxrFkIDi4nsqYmP5I3n5FStrwP2jdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puJc2WkDHXx0g8CNdp9f2Rp58BxwGQ4zGWdF61McxOg=;
 b=SGVnVOx0ekj/0fPHK+jSSwUC3MWy/OZeNCugdh3laBC+SAOrLQV1GsYqY/3WYqa0oClTeFA51HXA5QXxOHtd7FCdwM4cvQpCcm1NeW9QBlR5Vn2SO5gZKst7jyU7h6XkRaSE6kMQvFwgrtMAZecYo9EQDLNzOvzof1Fw8Rs2KHsIz8rMDUlXKOFpz/I6nPCuRwN2ieRz3rC+gV+WUDLq1zE/u1Bq7ZVlL6zIULbNf8in1M0f27qqrzonfWZ58NOHGCjsUu5hKp+DI3rSbCB/UA72+Uv728AUDQqjJZJSl/AkT92m5L67tDLVK4F4z8VGy6Vu1BKVssbKMW2gG+O1DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puJc2WkDHXx0g8CNdp9f2Rp58BxwGQ4zGWdF61McxOg=;
 b=S9ZzAXFAKFPO1vylj0J9Xf02V4PVZErTz78d1X0bNFcV3DeLdtwD6zQsddmqfbNBmb7kINN79asFb+hYno9ovsbYojffuy9ypFrgDybibHdxDc51co7vkndt0FBdjgp8xu3eyLf5KKJLBBx+E//PQ6MnIpQ1Yc2mj7/zYrhda0s=
From: Naresh Bhat <nareshb@marvell.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "julien@xen.org" <julien@xen.org>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>
CC: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>
Subject: Re: [EXT] Xen MISRA C meeting
Thread-Topic: [EXT] Xen MISRA C meeting
Thread-Index: AQHYWRY+8umpp9wdok+1YiKJDVeK4q0wsn2E
Date: Thu, 26 May 2022 03:44:55 +0000
Message-ID: 
 <DM6PR18MB3193122699AA7888B8765E44B9D99@DM6PR18MB3193.namprd18.prod.outlook.com>
References: 
 <alpine.DEB.2.22.394.2204251730000.915916@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2204251730000.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: f863fcf5-d396-ccbd-d08f-c84ebc140f1b
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 742ea29d-cd1b-4ec6-30ae-08da3eca194b
x-ms-traffictypediagnostic: CY4PR18MB1174:EE_
x-microsoft-antispam-prvs: 
 <CY4PR18MB117471DD13E778CC9C71AB71B9D99@CY4PR18MB1174.namprd18.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OZgrqA7608nxC0sgEgbMetP0ZMfy+8xL5Z6LDcLeNXdsPICvVtqGE+BQOWKAxlY/rSa0xak6oZ+mvAl2BKzF1/9bBhywf4vj44qP0yj0HP5YXzmfy/qs3OagWmHnFNQVGDQZFHsDouOXtZORFR3nmbcVqNmc8RJ5iY5sfr0prR1JJUmFqn11ZCYlFGtoxo2l0vN9pjVhA9/sd42daCP4AVM+m5Scugo/HI5daoM/OwBTXRO5rTj9WpzhkT38mffywSZMKHMUf3zmgRnlBBhQTkEF1tzrFLBqa8I6GsO+plhRU/LGVOLvYSOYnnsECxF7zjTWXCsvVho/8gJGq0OcsRq0HqR9Yg/ty5M6sAs1cARP7hd8nQljwe16T94cVQWfRQz1vlFd6/xQ5HJvlWpU+YUMF5sLHzCrScm2+b+//bEOvbsv26Y9UYqPqX7idCCDSWKPJV6QDWEv+guOLLUERikjovcWDfkE214qGi8TODN9lfHcVZK5XigcjoidFTsbq7hG5kSLkgJwrX90YAAqnrw+Ybbf3Y+tLRkMsR7ybd4IohZZ6lEDgLWtVpJ9SgdPktkotPUsQr14IQdlbtXG36cuzJtzXkaBDff6zxiH4SV3U7d98euMt+rTVyyAGO73OQDF4wdxkXtBdEh82vZyNt0FqlhRQ6CX8MBVxbWTyYzOxAA32YHM3NgUhfp4Gi0e6czH53XeTeV/x7xVQRI6jVSvGuGZNYmLtxJr5lrQN1sn3QL87v5JnhIhrZjzVtt5jGi3c/7b2EzNKXnNBpxUBp6TL2lQpJmfq9F4+gfzAWA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR18MB3193.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(53546011)(54906003)(7696005)(110136005)(26005)(9686003)(76116006)(6506007)(86362001)(38100700002)(2906002)(71200400001)(38070700005)(91956017)(66476007)(8676002)(66556008)(122000001)(4326008)(66446008)(66946007)(64756008)(966005)(508600001)(5660300002)(166002)(52536014)(8936002)(33656002)(55016003)(186003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fSr1r1Ls0Io9ww5JSiOoJApt3P12tVBauIYpj1ZccbFb32ITfnIMuQ5cvIkX?=
 =?us-ascii?Q?Xz0iolKMTFj1jAEW43o9Mre94UWR+OSprj+8zWpP/eAgnhhM4uOf2Ycw9Xef?=
 =?us-ascii?Q?FGl3we3XbAlA7wYygPfImRDs92tgx1AOhHx5YGiZ5sc8VJtY1g2IeI9+6vk9?=
 =?us-ascii?Q?1NOY3LMOR7cmc5htYFTie248d1jk7u+i3hfYaip3x4NLeSu7cT9qLzpT2Hjv?=
 =?us-ascii?Q?7lMBHjajKGzmtrIMta/MG2hT0v9cI5Cn4RhsBMVgu5Pr+bglQrVollyYArnv?=
 =?us-ascii?Q?jT7OnPq8Qo1COQj84fXzLKZwgNfYPhIanPBmQ3ZmmhxIt9iIWLTplmYunmL6?=
 =?us-ascii?Q?xHtzK/ZJiSaKGZT8IzMBB7v1LKjLEOlj1PeEaIMO4BcjZ/TXko6+TUePXnPh?=
 =?us-ascii?Q?oRVbqpegI3bZ50EtGYJCmCGQMRpwmNnz+OmEeZnTOLjHBrcGI1QDb2waL2h6?=
 =?us-ascii?Q?2oRflI58DZg5Y08R31zdQtHEA+CrUHUw8HY3zZ08HmgK6U53pTcXd/VBwfEV?=
 =?us-ascii?Q?Z9LWxe3Le4Mfuw2Wt9SVqJbomn6lI6ZogB7PMP+Sbj7tBNjddim6zWxgi1Vs?=
 =?us-ascii?Q?SUSX5KsRcNxt4zyhce/gNLwPMQYJOOb/YmpfGkipsERYp1207y05mJ5RsAHC?=
 =?us-ascii?Q?+QGk3JBTcF4Jw8071tUKl7FMGPUMloj1bIAhYCTeOCoM737qPpGnm9rppOrI?=
 =?us-ascii?Q?9LRpJNgSyuT9X8ahfeep0MPAUGyGxo3zvbUSDy6Pb+I9bi/LWwKzjbtW2emW?=
 =?us-ascii?Q?hU3qZXhZLoa3kj9X1LDm1KW6CM5iWi59ZPcZrkzHh5Fh+oJJfn82Ow24p5rs?=
 =?us-ascii?Q?3KgvfiU3eJFAGrUxRMqLx66PrUUUOvQTVowtD0yjH7C3GM8Sdzfm56zX680/?=
 =?us-ascii?Q?G8c4mrPVWBFUy7Pp7z4ivvnCPjq+jNMENuhfLvjTOPjaHbwXwxu8kAJYKpIA?=
 =?us-ascii?Q?EQf02W5A1edWVSfgkYCAd8m437REIGP3sEhFJnLxDqsCNXH6DkyJs/eGY3Ty?=
 =?us-ascii?Q?m46K+0fFfvA1Ui0m07jb4xZ91wTodPB50xWa9i3QCQ59KkUj0Ljuqj4QKKkl?=
 =?us-ascii?Q?mwHVL9HZVAkQzG6q5443hIGLm15Y2NmYSLIWd3cTlgd3LSvenQNCipRje0+4?=
 =?us-ascii?Q?6Z1A5J7lFR7NICOMpNQAEv09LcXA58SMXYV9lveimeIoSeNqs8Xf81QYwC48?=
 =?us-ascii?Q?7ky7wolXbOosM9Tt8Zv+5sj0mZvl6Te5P9X3/Q/zJ/G6GzFXeZtJSAWveKTE?=
 =?us-ascii?Q?NYwIjOqeqv2uYRsAs/w6Pp+MlChQ2K++oM4zLp5Bd8oOlF6/OWhgZwlLAP/r?=
 =?us-ascii?Q?KmEsqkK4gqeXMBKz8611WlT6J9+PGOj5J2gQAoKxoI8lGG/bfzHAm0kDbHuG?=
 =?us-ascii?Q?n9xyAhsDgxDFTXuZGqOdWJipjYs5wvHO/NHy9igTXY+tklpfZnWxrax1F7rM?=
 =?us-ascii?Q?Lrv8rXKfER7jRxqpIOAP8xfYJ5dPtOkE9Ce5mEntLs7P8QQJTQb8WLSOdc+y?=
 =?us-ascii?Q?9hNTLXYguKC91MeSPtbKgO5OKgNTleRprxeOWv27Ax84nT5ZNBxLG3vv6OmZ?=
 =?us-ascii?Q?l05bUjLhQqCl8ICjDUGD3w1yNi0q0eJ7atRr6pgbtd15DoTbSKvWUGO/Nnbq?=
 =?us-ascii?Q?G/gtcBRtP8GAnzHs9u9BtZHoqSANsfVnm1GHNk9cGLqdNFzeS3jn1XWjl8Qw?=
 =?us-ascii?Q?kfaCLS7n7b/NOq1CvRcZ0xfysgGgTdXXljk7aDqn4cU0otReIgPDmDMQOtPw?=
 =?us-ascii?Q?IRTzrQxORg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR18MB3193122699AA7888B8765E44B9D99DM6PR18MB3193namp_"
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR18MB3193.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742ea29d-cd1b-4ec6-30ae-08da3eca194b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2022 03:44:55.4395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: etnFBumkaAx4LJTqCw+dcCHUMZhmAkZbxslWIB63DrrQylrMw1uazq9QO//qq1qQuSWhkGSIN0L/W9QlC0UmjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR18MB1174
X-Proofpoint-GUID: xGnh0DaxzA8VAoyIbigEATb_74f24I6h
X-Proofpoint-ORIG-GUID: xGnh0DaxzA8VAoyIbigEATb_74f24I6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_01,2022-05-25_02,2022-02-23_01

--_000_DM6PR18MB3193122699AA7888B8765E44B9D99DM6PR18MB3193namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Can someone please share the "MISRA C Rules For Xen" read-only excel sheet =
link?

Thanks and Regards
-Naresh Bhat
________________________________
From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Stefa=
no Stabellini <sstabellini@kernel.org>
Sent: 26 April 2022 08:04
To: jbeulich@suse.com <jbeulich@suse.com>; andrew.cooper3@citrix.com <andre=
w.cooper3@citrix.com>; julien@xen.org <julien@xen.org>; Bertrand.Marquis@ar=
m.com <Bertrand.Marquis@arm.com>; roger.pau@citrix.com <roger.pau@citrix.co=
m>
Cc: sstabellini@kernel.org <sstabellini@kernel.org>; george.dunlap@citrix.c=
om <george.dunlap@citrix.com>; xen-devel@lists.xenproject.org <xen-devel@li=
sts.xenproject.org>; Artem_Mygaiev@epam.com <Artem_Mygaiev@epam.com>
Subject: [EXT] Xen MISRA C meeting

External Email

----------------------------------------------------------------------
Hi all,

I would like to schedule a meeting to discuss Xen and MISRA C with the
Xen community. I have a proposal on how to make progress in terms of
MISRA C adoption in Xen and I would like to get your feedback on it.

The meeting is open to anybody. The Xen x86 and ARM maintainers' input
is required to make progress, please fill the Doodle poll by the end of
Wed Apr 27 if possible.

https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__doodle.com_meeting_p=
articipate_id_elY67vja&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DRXJFzROO9n=
XScR8aaDkNU6ZCmkfPIaIv0GMuOJ1P5rM&m=3DqEY_7qRui0kIvfEnpRFfdtfI2fE12_6V8maCM=
Kbla1KKnepLZFDxyEWmawRDbWrf&s=3D_S_U8vNb535pEdAHS77PMn-zepxQNH_2gRu-qFht_ls=
&e=3D

If no slots work in the Doodle poll for everyone we could consider
re-using the Xen Community call slot (it is one of the Doodle poll
slots).

Cheers,

Stefano


--_000_DM6PR18MB3193122699AA7888B8765E44B9D99DM6PR18MB3193namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi All,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can someone please share the &quot;MISRA C Rules For Xen&quot; read-only ex=
cel sheet link?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks and Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
-Naresh Bhat</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Xen-devel &lt;xen-dev=
el-bounces@lists.xenproject.org&gt; on behalf of Stefano Stabellini &lt;sst=
abellini@kernel.org&gt;<br>
<b>Sent:</b> 26 April 2022 08:04<br>
<b>To:</b> jbeulich@suse.com &lt;jbeulich@suse.com&gt;; andrew.cooper3@citr=
ix.com &lt;andrew.cooper3@citrix.com&gt;; julien@xen.org &lt;julien@xen.org=
&gt;; Bertrand.Marquis@arm.com &lt;Bertrand.Marquis@arm.com&gt;; roger.pau@=
citrix.com &lt;roger.pau@citrix.com&gt;<br>
<b>Cc:</b> sstabellini@kernel.org &lt;sstabellini@kernel.org&gt;; george.du=
nlap@citrix.com &lt;george.dunlap@citrix.com&gt;; xen-devel@lists.xenprojec=
t.org &lt;xen-devel@lists.xenproject.org&gt;; Artem_Mygaiev@epam.com &lt;Ar=
tem_Mygaiev@epam.com&gt;<br>
<b>Subject:</b> [EXT] Xen MISRA C meeting</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">External Email<br>
<br>
----------------------------------------------------------------------<br>
Hi all,<br>
<br>
I would like to schedule a meeting to discuss Xen and MISRA C with the<br>
Xen community. I have a proposal on how to make progress in terms of<br>
MISRA C adoption in Xen and I would like to get your feedback on it.<br>
<br>
The meeting is open to anybody. The Xen x86 and ARM maintainers' input<br>
is required to make progress, please fill the Doodle poll by the end of<br>
Wed Apr 27 if possible.<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__doodle.co=
m_meeting_participate_id_elY67vja&amp;d=3DDwIBAg&amp;c=3DnKjWec2b6R0mOyPaz7=
xtfQ&amp;r=3DRXJFzROO9nXScR8aaDkNU6ZCmkfPIaIv0GMuOJ1P5rM&amp;m=3DqEY_7qRui0=
kIvfEnpRFfdtfI2fE12_6V8maCMKbla1KKnepLZFDxyEWmawRDbWrf&amp;s=3D_S_U8vNb535p=
EdAHS77PMn-zepxQNH_2gRu-qFht_ls&amp;e=3D">https://urldefense.proofpoint.com=
/v2/url?u=3Dhttps-3A__doodle.com_meeting_participate_id_elY67vja&amp;d=3DDw=
IBAg&amp;c=3DnKjWec2b6R0mOyPaz7xtfQ&amp;r=3DRXJFzROO9nXScR8aaDkNU6ZCmkfPIaI=
v0GMuOJ1P5rM&amp;m=3DqEY_7qRui0kIvfEnpRFfdtfI2fE12_6V8maCMKbla1KKnepLZFDxyE=
WmawRDbWrf&amp;s=3D_S_U8vNb535pEdAHS77PMn-zepxQNH_2gRu-qFht_ls&amp;e=3D</a>
<br>
<br>
If no slots work in the Doodle poll for everyone we could consider<br>
re-using the Xen Community call slot (it is one of the Doodle poll<br>
slots).<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR18MB3193122699AA7888B8765E44B9D99DM6PR18MB3193namp_--

