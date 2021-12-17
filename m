Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315CD47895F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 12:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248548.428708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAyj-0001Yx-Fn; Fri, 17 Dec 2021 11:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248548.428708; Fri, 17 Dec 2021 11:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAyj-0001WG-CX; Fri, 17 Dec 2021 11:00:45 +0000
Received: by outflank-mailman (input) for mailman id 248548;
 Fri, 17 Dec 2021 11:00:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myAyh-0001WA-Hh
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 11:00:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92f20469-5f28-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 12:00:42 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BHAmIed021131;
 Fri, 17 Dec 2021 11:00:38 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d0s44818p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 11:00:38 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7135.eurprd03.prod.outlook.com (2603:10a6:102:ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 11:00:34 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 11:00:33 +0000
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
X-Inumbo-ID: 92f20469-5f28-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHJijGYD/+Y7X1wiK6O9OVYf35xZTpMChdXXeqiXBpdZZdycKHKVgejIaMLhZXunvr9QrXByrYN8qU6J1KzifkfMvdL9wkpCa6yZqItEurt4FUovrwhyalrjGd9z4et0H9RKsiK4vtDu/wKbewDsvVCzuNgxceXVzhCr6uRPFZ4/IuXi1BmhCgNrlImpGDnsIjJIoUG5A44h+xgEKh2/dmK6lS4uxMZAcymC1lVhiAwKq0EQE2hzsChbZ5xy87aNm8aCSPmqWGt1ICDNEXvNrT5DeptTvispBU4r2TbYtPSAHkQEnXTZkDNyyeGj6DjgxlP8uCjkQrUw3xY+22hxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slWg4g/yF2h8UtMXIgfp5KuwYyf+5AYnIrB2mZ05rvU=;
 b=avXA2hm7MA6Nas+l8k8ElEVkup3KpBUmW17X9NVy7h5s5NyiY8/GBCABIkt2HZUWa3qZ1NJ8SQf3QXNXlu5eOjahY7adPcpJ3YUraRxp5YzgiXbKGyaoVN0m3kLT9D9Z5JhEME6JEg5W9EWvcmI2ORjoLR2w8CchkJkJaRdhbZbl4PCFza8TqSoDtXqxs/scml8rgJEXuaX7I96yiwiwtw2s+X0jSmsa5pGRZXuo5T/xyhbwMT7qBt6e7FubwqV4adSfln9NbiUpVwpVldCPdpPFQ8Qg7jbiydfcbF4MOWtmbN4cqzkUmHhYYfDJw2rZW8UL+MYFvd+CcblS24ValQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slWg4g/yF2h8UtMXIgfp5KuwYyf+5AYnIrB2mZ05rvU=;
 b=qo66cMryGAd/tm271Rzmw3Fzz2JrfPcgpOPRkOomG5uec4xTOL1V4vylZ/wwvdnx6D1GWkR2FszEcoKf89QXUM4UP5oojdJKuXuehVYGx182x6zACOj5WfC6CPw+AHHRCbMLbgFgyBOrUAzov2pFvd69kPIyUvJzOaW4KF3maO6XugQhOP/UmLEHERnJktpHf1YE1CV2eFoXfypx6mR39JXU0Xsx+N/+verFZp6kyM9n0a9BxMl0/mySTJXwVrU04Z/dtmI7Ld0H8Qt+rxzL52Lq+176b3MqPHBURGGqXGv/xe0JScEkbt2luGCm2V5M6n6qsvDJkitpv+b+tbtsfA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross
	<jgross@suse.com>
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Topic: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Index: AQHX8M3K+4k+NJRDpU6TSJ1TAn9Owqw0GheAgAJu7YA=
Date: Fri, 17 Dec 2021 11:00:33 +0000
Message-ID: <20211217110033.GB3998068@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
 <eaed4dac-219f-39ae-7237-0ae67c77869a@gmail.com>
In-Reply-To: <eaed4dac-219f-39ae-7237-0ae67c77869a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8544fcef-b829-456c-5558-08d9c14c72f1
x-ms-traffictypediagnostic: PA4PR03MB7135:EE_
x-microsoft-antispam-prvs: 
 <PA4PR03MB71355356D6BCB9D97D70E8F9E3789@PA4PR03MB7135.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Y6V/U2OqWqVSdP0B2wCZSqE86tGOlnl5sVNZvuwnHo6zpmG6UXtm+Ss1Q/+6GcWE0Ui7oUw8M+e5NeTMhJcWwx98w/+lwXTHDFFEgrVeDM13L/kEgDr7tcLO4XHKpwX6Aj9f7AtBZJSlDDAYqDL5mvsiCKlIHFyCjXNxHza/oHG+wI58TNrAZMk8XhXGIj5AXmICpvAv9vYy0x0JXgvJHWFQ1FNmZNBNN30uyT7ZsZblbFNalcw5TMtvX4QLzfmSHHFxvhd4uCUB2dy/QyEj1VERdGSnOIkSh7lM6kd8xmvSxqq3RdJoQMev/OptDKWRW3hZ/nAc21GAqzJYLcVdCB5U3h53gyrdSdEda7AqZFnhYXJZmH2T9R3CiXDaVV1+UdF/VeWllgzpPrPc4qt+bg9zSjCXtQAmDCewH/vHPqxNNH5tisAT8JENf3GtQ6u868XtZJzZnqby5fCU7/CqAmq5fvs37ueFukBmaO25F1o4U7JNwUwR7Jm1lzd4gtBQljZNup1cVmH9Km/fNuIsHikgw3yziCG/6yV504gTqdJB4dbUQ4CMJcKqcQLvdgyga2cE1uURNqq3IuzIadxANYhgl9pLn7icKpglZXaXvlh5SaLMZFR+ss+O4yZzuWo1DKMwcVx1TMLEVEoK0de5S1KnoLNmfy0x38V05c9nB7sWrZcXtgeeyAs/93DUPV8MR1pHk86jMI5oowZBcWvItw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(1076003)(5660300002)(54906003)(2906002)(71200400001)(6916009)(83380400001)(76116006)(6486002)(91956017)(38100700002)(8676002)(9686003)(66946007)(66556008)(64756008)(66446008)(6512007)(33716001)(122000001)(33656002)(66476007)(53546011)(38070700005)(508600001)(6506007)(186003)(86362001)(4326008)(26005)(8936002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZjKjjZCgAPFR4keXTMQgBJaiyctdnDEA+5CrGOybALm4J/ky+0zwss6CTf1t?=
 =?us-ascii?Q?9xMcbnQurr3T399tG47emVYmdW6J1PghtwDHL36edY0OLJeE/AdTWv5Gw/R+?=
 =?us-ascii?Q?DG/nqJ8iEEJp+gJVyI0jSTDZkhYIz/1AgVJJ+GEk3Xas9ofnR1aTC4R5EKWH?=
 =?us-ascii?Q?CWgzzvcCezAMaSgPL+vw64hEGWVdwvsE5ldEJbNMIU6Dsm8zsydEJgdwDTUI?=
 =?us-ascii?Q?CmlsyxRiLlEO7wtresHQ9G/ztTrR2+Rn3XYZ8RqRkonR5NUkADASEE+5J/Xj?=
 =?us-ascii?Q?B6BzTeEoCWhOX7CCDYt08aHT2OOo3DsFEt3mo9WCq2LB53a/dEAcwDhkrb72?=
 =?us-ascii?Q?/LMvTYr+Eiu4NgDGmlTfgev9RGzOuMRdG9vx1ASrdKxaWSP+MQ4fhx9uh7Ln?=
 =?us-ascii?Q?OSrqWwULm/g+zprU1U0UjIBOhJ8AePqsi/O8vdwqEkeKDmL9ZvtiUwdrwWfW?=
 =?us-ascii?Q?Z4Bv1/fMNK6SSs9YIaVcnQ3ok+na2C3oVsQpGRY6UI4gFi6JPMjwgdDRzFxJ?=
 =?us-ascii?Q?zKZS3U4yAL6QGEh4vaqanKo9yPILCXj1+AQgFpcXllSUcDUwlsWr3ZWtLlUX?=
 =?us-ascii?Q?aZPCk+7+hTH1nsrqY8fUExeDJK9ENoRDBi0OPbePRW4DLfcG/5lVZjJtkE8y?=
 =?us-ascii?Q?CEW5g8r2OrMxkqR5ijDdMvuzewo2j3yHcOjcSYrx45ZQSV16MUzuh2gyC4yH?=
 =?us-ascii?Q?zagpIVlak+Aqo9iFM08o3KdhxjeK99XV2uT1F48EOIjoJKtCdoa1RA6jFAya?=
 =?us-ascii?Q?7vZEl8ppZPYl1h0/7ckE4ocgZGQBKiimWOAUel10Z/ZQe/t5/nzl3LViV3w3?=
 =?us-ascii?Q?rALsCig313Dq/KZno+DlJrZs/fNVHPlveLxXQA21cO5lxU/bBzjnoDAAwKd+?=
 =?us-ascii?Q?XKtH+y2cXft+R3OLxltYaWaPyTA1iLtEa6Ten74b4NVK2Jzr1TtSGXs4o0Hg?=
 =?us-ascii?Q?HdLg4tk3QVtncrTkYuVBOkZFpyueO3C+RDDRVPwy/BGesDI/L9v0TimbEc2/?=
 =?us-ascii?Q?ushfYVh4Ae7SXWdC5fhTQocHNZJblKb49tQBVpjLPedF/Qo7EP6MAGG4PRlQ?=
 =?us-ascii?Q?ueXcnDcpfq1ycB54zqg3FplMf7q3B12kP/weZnPh1AnbwxzwGZJcvy1a1www?=
 =?us-ascii?Q?LKlJCmIOdGakM1xBcUS1qmyLhn2uPleGwR8kdKWdygfw+i4S8fF5kBt9rW2L?=
 =?us-ascii?Q?ZPmWljg6wPqEcA5yGKXpRO7pfQ23nkAqfmsN9k9igYIH+tDTB86S7ZiX7/eS?=
 =?us-ascii?Q?RjsBOdZjxzNVjABtyIUhchTHHSk4PFUAS5No4Ih7H/2fk9qa+iizCiJ/LmPp?=
 =?us-ascii?Q?mtiS+H4AlO6gLwi9RaXdyJImRVC27hdwTXOu6ZTAKKPYMil4k0GJex9UK+G3?=
 =?us-ascii?Q?Yxhsl/GpWsohtd04M0q3dlBlyAjbhL6qPPSv6B78b+feLIZpQp9SL54a2BjG?=
 =?us-ascii?Q?2mPxTRpPBjVEH8Rq+Dzn2VvLVx1hWQ1hOu329NRumGtIOuvW307ny2ZSqtyQ?=
 =?us-ascii?Q?IkB8I4DYzCXE1voI/6Lk1v8u/zj+0TfXcG+cZjJvtoJUfSaD9fQF2G3OFR/l?=
 =?us-ascii?Q?zqCZwwIzLMsHgEwJq8CTTH0F3BYlPp2484DqF1kfhnIcKp8+s13OOkSsDjID?=
 =?us-ascii?Q?k86Jvk4RQY7IBRJhHh9nlskodqO0Qqc4D708ppV1IFbW8POyhYgYZx5jqr3j?=
 =?us-ascii?Q?HnpcvzlV8oOBWaEnYqnDka36qWU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <76EF263E9D7C2A4FAC6EC37EFBE67F1E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8544fcef-b829-456c-5558-08d9c14c72f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 11:00:33.8792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7qA+ck0ZJ4uXlOUOJ4OaYWyiaDy8EL+iE2hOM9AyvKu6nRZUjL2XOVjQvKcrL9He+UtpxYEvhRBwd60M7ISRI0zOwiw1iBEEq24IwOpbZlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7135
X-Proofpoint-GUID: E3v3FsiF0yCAeqv9GPxIuRqDafCvM43u
X-Proofpoint-ORIG-GUID: E3v3FsiF0yCAeqv9GPxIuRqDafCvM43u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_04,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170063

Hi Oleksandr,

On Wed, Dec 15, 2021 at 11:51:01PM +0200, Oleksandr wrote:
>=20
> On 14.12.21 11:34, Oleksii Moisieiev wrote:
>=20
>=20
> Hi Oleksii
>=20
> > This enumeration sets SCI type for the domain. Currently there is
> > two possible options: either 'none' or 'scmi_smc'.
> >=20
> > 'none' is the default value and it disables SCI support at all.
> >=20
> > 'scmi_smc' enables access to the Firmware from the domains using SCMI
> > protocol and SMC as transport.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   docs/man/xl.cfg.5.pod.in         | 22 ++++++++++++++++++++++
> >   tools/include/libxl.h            |  5 +++++
> >   tools/libs/light/libxl_types.idl |  6 ++++++
> >   tools/xl/xl_parse.c              |  9 +++++++++
> >   4 files changed, 42 insertions(+)
> >=20
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index b98d161398..92d0593875 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1614,6 +1614,28 @@ This feature is a B<technology preview>.
> >   =3Dback
> > +=3Ditem B<sci=3D"STRING">
> > +
> > +B<Arm only> Set SCI type for the guest. SCI is System Control Protocol=
 -
> > +allows domain to manage various functions that are provided by HW plat=
form.
> > +
> > +=3Dover 4
> > +
> > +=3Ditem B<none>
> > +
> > +Don't allow guest to use SCI if present on the platform. This is the d=
efault
> > +value.
> > +
> > +=3Ditem B<scmi_smc>
> > +
> > +Enables SCMI-SMC support for the guest. SCMI is System Control Managem=
ent
> > +Inferface - allows domain to manage various functions that are provide=
d by HW
> > +platform, such as clocks, resets and power-domains. Xen will mediate a=
ccess to
> > +clocks, power-domains and resets between Domains and ATF. Disabled by =
default.
> > +SMC is used as transport.
> > +
> > +=3Dback
> > +
> >   =3Dback
> >   =3Dhead2 Paravirtualised (PV) Guest Specific Options
> > diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> > index 2bbbd21f0b..30e5aee119 100644
> > --- a/tools/include/libxl.h
> > +++ b/tools/include/libxl.h
> > @@ -278,6 +278,11 @@
> >    */
> >   #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
> > +/*
> > + * libxl_domain_build_info has the arch_arm.sci field.
> > + */
> > +#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
> > +
> >   /*
> >    * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
> >    * 'soft reset' for domains and there is 'soft_reset' shutdown reason
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_=
types.idl
> > index 2a42da2f7d..9067b509f4 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
>=20
> I assume that at least goland bindings want updating.
>=20

Thanks for the notice. I will fix that in v2.

>=20
> > @@ -480,6 +480,11 @@ libxl_tee_type =3D Enumeration("tee_type", [
> >       (1, "optee")
> >       ], init_val =3D "LIBXL_TEE_TYPE_NONE")
> > +libxl_sci_type =3D Enumeration("sci_type", [
> > +    (0, "none"),
> > +    (1, "scmi_smc")
> > +    ], init_val =3D "LIBXL_SCI_TYPE_NONE")
> > +
> >   libxl_rdm_reserve =3D Struct("rdm_reserve", [
> >       ("strategy",    libxl_rdm_reserve_strategy),
> >       ("policy",      libxl_rdm_reserve_policy),
> > @@ -564,6 +569,7 @@ libxl_domain_build_info =3D Struct("domain_build_in=
fo",[
> >       ("apic",             libxl_defbool),
> >       ("dm_restrict",      libxl_defbool),
> >       ("tee",              libxl_tee_type),
> > +    ("sci",              libxl_sci_type),
> >       ("u", KeyedUnion(None, libxl_domain_type, "type",
> >                   [("hvm", Struct(None, [("firmware",         string),
> >                                          ("bios",             libxl_bio=
s_type),
> > diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > index 117fcdcb2b..c37bf6298b 100644
> > --- a/tools/xl/xl_parse.c
> > +++ b/tools/xl/xl_parse.c
> > @@ -2747,6 +2747,15 @@ skip_usbdev:
> >           }
> >       }
> > +    if (!xlu_cfg_get_string (config, "sci", &buf, 1)) {
> > +        e =3D libxl_sci_type_from_string(buf, &b_info->sci);
> > +        if (e) {
> > +            fprintf(stderr,
> > +                    "Unknown sci \"%s\" specified\n", buf);
> > +            exit(-ERROR_FAIL);
> > +        }
> > +    }
> > +
> >       parse_vkb_list(config, d_config);
> >       xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
>=20
> --=20
> Regards,
>=20
> Oleksandr Tyshchenko
> =

