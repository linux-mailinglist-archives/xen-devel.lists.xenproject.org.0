Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F08D4057
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 23:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732396.1138382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQws-0007wt-CW; Wed, 29 May 2024 21:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732396.1138382; Wed, 29 May 2024 21:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQws-0007uY-9o; Wed, 29 May 2024 21:35:06 +0000
Received: by outflank-mailman (input) for mailman id 732396;
 Wed, 29 May 2024 21:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx1n=NA=epam.com=prvs=28793c6931=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1sCQwq-0007uS-Qi
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 21:35:04 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ddcb97c-1e03-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 23:35:02 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TFleUn029438;
 Wed, 29 May 2024 21:34:53 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ydbacyu00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 21:34:53 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9130.eurprd03.prod.outlook.com
 (2603:10a6:102:33e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Wed, 29 May
 2024 21:34:49 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.7633.001; Wed, 29 May 2024
 21:34:48 +0000
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
X-Inumbo-ID: 4ddcb97c-1e03-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JemPXmWXoVtQqTSEYEyEiSO+GBrMh0imp+tNFeEGTd4erC5emFDj1T1H9Dg53Gq/2hzAtlCHPjbwZ02zPgqpFqe8ghTGqyp928CwnLWeyC0jfuvtRsv/3T7iQaeOXrynYh71MZT1OaNb7Ge8jVW8xYhZqp/xsCmLxfT8bKaE/qd0nwmc+d0I92/7nlbwUvgEnxDNw1HjzL25AalsN0FtooPuT4eL220jP83ryXJ0ZVXsv8osTaXErKd559CO6E074hu0+Gqu5U9Q2B7RX1Fp+wOZaRw4cRpaqol9MWJY7iHjAEyd1S4qNhQOBi5rXljQ6nlLqhqUlgs+EjAqncAq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vv87pxFTF0IfVJy5Y0SjWbBBW76pu6lBtaPyNGrGEe8=;
 b=UqS74zlB00nbynvd+UJxmYjSylmtEBRDF0xH17lcXQHFuVET0pRoXeN7De1NT1lqdxeaa8fnNfUBeCcjsDAKTS9OP+bQBpQ1ibR1eGEilZn2Ysw41nAZ6XrNBrAj3LNwOKNppwD43AZu5mVcMiXuEqhToW/FoBPC2rwB3g4TT8A5vJvvML1xAQekJe9vwxCkzDJg7+bmUNSvjZMx5b0choByh0Z5rZnvxIWBc13oYVsYXIE/rqQ+DFZcShwQJyup3jc3q1hF5UAjr6qQulEc7rZYVusALnIdQHsp+kaAwcE9ndKC7mxTlsBVHRM3Ivy/QvRxpDYWstbF+dAiD715aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vv87pxFTF0IfVJy5Y0SjWbBBW76pu6lBtaPyNGrGEe8=;
 b=UkVZ23Sacg/Dl7rUtrCVlVrJden3PmIj2JJnM4NoiWdiAyWO5t58loyTDDBWOb8dvSzOeP27fQIlz4eLp8I3U8cr+ytKo2qRte0NwwGeYht6TbYFSfITWFBEYlDzHpdcnoTzNlMiBegbuTCEDhUhAfT51RbXRdlc4ZIr0qYaOMqo389Qx+CGRfhxC27zr+CFVpOWxmaX7DtWcchdK/W6jAO+IjDNSue6HiXl7RLve9aiaHvRIkJuyubp8Kl3JYSEWA0e9/V88jIUlquI/q9zcY3vj5OYBR+BTJ53HQnShB3C7ryxh2P/OyuDDcv5jEP3ncpyiCBGoF1N61b7PtFwaw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm: dom0less: add TEE support
Thread-Topic: [PATCH] arm: dom0less: add TEE support
Thread-Index: AQHasgjZKwS4pdCyJUe9LewXYMLHeLGutaSAgAAAkIA=
Date: Wed, 29 May 2024 21:34:48 +0000
Message-ID: <87bk4oxpxk.fsf@epam.com>
References: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
 <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org>
In-Reply-To: <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9130:EE_
x-ms-office365-filtering-correlation-id: eb966ea8-c62e-4423-f936-08dc80272a9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?ZJAisddI+hjMqwe2fbi3RoZtK88N79L5sut3ozPJqRY5jA+OlxI35oPsMN?=
 =?iso-8859-1?Q?TJnPTOQ2xY2knmOfUDdOrJCYFfAnncmhfY9lRPwyoJ4YV8vpFp5G8WEX9V?=
 =?iso-8859-1?Q?kfj66XprwTMHKKr/AK9PGKgSArc6/fzmgHtkITgM9lqjU7/9A2mGXLdE4P?=
 =?iso-8859-1?Q?cw28j07aQLEHn1pwQYnV0xxbNS0ZkImC8XaFKPtHu/lbw3eOKDtz2rPlAV?=
 =?iso-8859-1?Q?zoo0WI68ZBUSWqM/VczkBKLpnxHHsUd9Wk+ETzKpI1e8Bk5FoDXH+Jcdry?=
 =?iso-8859-1?Q?yHH9TOwan0t0cemBG+oFgApnum/p8yq+f5Q9Xrar0y7l1BE6TBK9aFoSx6?=
 =?iso-8859-1?Q?zZ6JemAet6cLxOuCLfpB3mOOo4boN1hBjXIQtH7fN4qWrc6UwPBbvNIj2F?=
 =?iso-8859-1?Q?TdmRJxpClb0IQjCWA7gamDxlNkk7eUpb2qEkhAl3R+DRDLKXkf2VvImAJB?=
 =?iso-8859-1?Q?dJQV5NK3JuJpWTH2h4WY1ewLSKahJJP1A7K1zDWjF4xrL89DwOlClQlZY+?=
 =?iso-8859-1?Q?XqE1IMaXucB4ZheTL0JqmFxECYTRKviMYTwZmUbiAUK+nBiUHY3mV6ONuT?=
 =?iso-8859-1?Q?Jcl4YxldxFRSg5zHfYJp4rzcIrjhDzrsYilosgcgcV3Tkk2Us2cMrm7btm?=
 =?iso-8859-1?Q?M5xhq5WwS4Qfdvsxrnc839v2WZYgWrEH2DX5eZaRumySJD4ntw1ZeFn84v?=
 =?iso-8859-1?Q?nCjUbDfjULgmVMzO3O6j6vLIX6RWn2PBgPKhK40i3kDLSw5IraEJTCqCVK?=
 =?iso-8859-1?Q?ZGocsufHFxxaoV7FxiC3EqoT9UWmKAbkYD5WtOahbP0KXzRb/eTrvE1Zul?=
 =?iso-8859-1?Q?k28U4yL3vVnHjBSbPtJ1SXTi+isU431U+TGAEqecjYBFlG0oaafvP6hlwF?=
 =?iso-8859-1?Q?8J0d33dWSw/q5VmPMbvM/TXkFwGmXNAdmykW8+o/bFyPrmAGjOVtbEaELQ?=
 =?iso-8859-1?Q?C2deNAO7jP53ikRXOrW0s4Bl/39z1f1mmITqpMdgyU6SOyXWfaezrlNbcM?=
 =?iso-8859-1?Q?Czvj3vfeyO1KEibQ6HXNFXKNehOc7pAFyAjsWYgeI2JJBYb7K7ztvKF2V1?=
 =?iso-8859-1?Q?RQlxp9ncoigNjctTCgcsgVIUCI9q30xBjJXtUEirUCJ2/+hy8z/dIIsA4k?=
 =?iso-8859-1?Q?wRL/SdiuFlbVwfDnrLxuHXXvwKi9NvymKw7d7i0NjUgkCVF2Q5GgZUeJAs?=
 =?iso-8859-1?Q?z1fVUpBEV95B8539Vztm3NgXsmJ/pK1BEKXIoVaRVMq5osv8td/yjoyar9?=
 =?iso-8859-1?Q?9Zc+enjT4jAVNCvU4MNqeco9pCCcZmMymjumCYy4sAyIQyI+tdMEJZXGf8?=
 =?iso-8859-1?Q?zHtAT6wy5jyct5zHmd0vtThJQCBHJewCy7IAh122sTHSwrHKDSrd+Zgh3c?=
 =?iso-8859-1?Q?qXS7XUUghEIGWtoeMFRrVC5R2CecMvfQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Dv5Q5LQfCc5VDxfYRWKGQyeVvM70fNjC2G3S9TqfqM8df87Cq29FCt/FCi?=
 =?iso-8859-1?Q?6modDfVOk4jmEEFMlTg3ZESGpDbBV3uIrx9Y2ATngsTWSh+4nGFlSt/C4H?=
 =?iso-8859-1?Q?xheCtQOwroYF7rxdBDSQc4F1z0Jd7Ow9vi7yD2m3Oosr3utjh8FnfSHQQr?=
 =?iso-8859-1?Q?pyyY8S+PDzwuPBvnUIJU2SXxPFYfyDtdm6TBsX9Zg/kLVrsozK6IDt5DSC?=
 =?iso-8859-1?Q?TGjIeQ/5nsl3T6QbE4RoEWaft8xoPBdskemXZRFgOR7c4A0hnMffshx2aa?=
 =?iso-8859-1?Q?rw20N66vm3ynF/h8Z5DuBN1skaXh0Zc21avbt3QaJgdSmIF651xOyvc/dR?=
 =?iso-8859-1?Q?aOJ6CZHsbHwkb+ZaJJ1V2Bztxm/oaX8LnmwDIGkqBuX1cN5P4KJFd+nByD?=
 =?iso-8859-1?Q?nPIrRofCqEQWAw/c3gLxxl/35XC7KBEEOJrn0RGVffgFdAS7abaNivuQlK?=
 =?iso-8859-1?Q?9jfSeWyog1sjBPy+sOQEmWth8cqLazytlQ5Z8O21XjqGr7Ful+n98ijjfI?=
 =?iso-8859-1?Q?H9+NVCnUpdMVzkpncyWhhOSVECKNUywJpkvmgOSA+DRXPiuW+x5Zyy9YU6?=
 =?iso-8859-1?Q?ph3GDHoOhDXaJ2P9gFMZLP2oOlNWJ4wiNnRV8lSCyeLxSn3csxxBN4hUEu?=
 =?iso-8859-1?Q?+fpPx0NzTvL5BIFCqVgDlEy6f2lPOfiiQYDqq4lMeVtNAd3H1i03FIih3T?=
 =?iso-8859-1?Q?TqsX/ILd+NX+8z6ljqDL2XHXremQnt4JGwQl4NbMV6oQIeWCLaBRB59zfu?=
 =?iso-8859-1?Q?QoStncPPsOawuN8p0+he8YQKbbcwAZ/Kr5+dEdGm88boKqVZLKl226cl7W?=
 =?iso-8859-1?Q?giAYOljEBmj1maTfvtDlvMBrRdbIeDFluZBSHHZJlPE7eFR2p/0THKuXex?=
 =?iso-8859-1?Q?wvTUfXFIrP3eg6KlzFXLskyYVuj+ePvT2r5NshWB1mv6U/RRvUSvX/wDDe?=
 =?iso-8859-1?Q?BLgGRj8HfvAo1ztpFIc5miUnHo9TC6UoYagVUSPTSBhOt4ET1RVuSgW++m?=
 =?iso-8859-1?Q?SvWfrcIRZiwGCyJEAnsngMhE+/r8KmJvNmgXiqYcsbT3m6XepRnO9E9pOP?=
 =?iso-8859-1?Q?vwiNJR1oHPtqaC4kab43u9QQoDYC/yN4B0NGD8vBeWvKGIPSYyHq5jDv4H?=
 =?iso-8859-1?Q?4tWx68y/E5siIygT9msrU4/M/UhXg57fOyyVsMOXDewZ4Xk/+fQMIf1xXS?=
 =?iso-8859-1?Q?SDV72bAnNYuuI7n5skB3cS1pdm9nnppKtzvyCtvjXEfrY7PHkKqOkoHc5y?=
 =?iso-8859-1?Q?HYR9/Cl9Cs8OG2O8d03jeGhbCSI6gi19ktAKh+dzFaPFZYAO5kd6OkGokA?=
 =?iso-8859-1?Q?bD575TIyRM/Tj4410thhBGoiUrsFEvJL6fiZfSPWoMIWHr5Gb64iQSjtdU?=
 =?iso-8859-1?Q?HZV0uXhBAktvUsPRH2wGxvNri0+E5XMl2X2oekg6qtrMuMWANPCDexyafC?=
 =?iso-8859-1?Q?ASMP0NmLfRz/VT+OC1+1h183q2kdvGgXTfRq9/Q5W5I7OB9kwL2BMO0LcJ?=
 =?iso-8859-1?Q?3KMAjbtQJZeFeRi3A5T1X8A7i/vL0yQIdyNSTswsVSAC5jjbk3T258X7an?=
 =?iso-8859-1?Q?WOdfTaCGopGgvQXWJvzmZkKvZ1Bl8z+M4t5n0K7cWpzHyTLfqUBRKEx4rQ?=
 =?iso-8859-1?Q?zy4vLf2RedFawb6DL57QoGwzFHXAT/GOQcJUj0S/NdvQlwdAZZ5bBp+Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb966ea8-c62e-4423-f936-08dc80272a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 21:34:48.6243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99f46Z6/Fv/vE+dDebm/hd94sImD91vZKN0T+E+vw4eYdzUkbwGtnd68Cs4bcESreh9C0BA8WgxaXoFCHpvRWFLItSXasvXmCk4Zdbx9hMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9130
X-Proofpoint-GUID: ZPCxRbIvSlClq-HouQqH1dTzn6z34BB3
X-Proofpoint-ORIG-GUID: ZPCxRbIvSlClq-HouQqH1dTzn6z34BB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290153


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi Volodymyr,
>
> Can you clarify whether this is intended for the next release cycle?

Well, I don't think that this patch should be committed ASAP if this is
what you are asking about.

> On 29/05/2024 21:43, Volodymyr Babchuk wrote:
>> Allow to provide TEE type for a Dom0less guest via "xen,tee"
>> property. Create appropriate nodes in the guests' device tree and
>> initialize tee subsystem for it.
>
> The new property needs to be documented in
> docs/misc/arm/device-tree/booting.txt.
>

Yes, missed that.

>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>   xen/arch/arm/dom0less-build.c     | 69 +++++++++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/kernel.h |  3 ++
>>   2 files changed, 72 insertions(+)
>> diff --git a/xen/arch/arm/dom0less-build.c
>> b/xen/arch/arm/dom0less-build.c
>> index fb63ec6fd1..1ea3ecc45c 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -15,6 +15,7 @@
>>   #include <asm/domain_build.h>
>>   #include <asm/static-memory.h>
>>   #include <asm/static-shmem.h>
>> +#include <asm/tee/tee.h>
>>     bool __init is_dom0less_mode(void)
>>   {
>> @@ -277,6 +278,42 @@ static int __init make_vpl011_uart_node(struct kern=
el_info *kinfo)
>>   }
>>   #endif
>>   +#ifdef CONFIG_OPTEE
>> +static int __init make_optee_node(struct kernel_info *kinfo)
>
> Please introduce a callback in the TEE framework that will create the
> OPTEE node.

This is the reason why this is RFC. I wanted to discuss the right method
of doing this. "optee" node should reside in "/firmware/" node as per
device tree bindings. But "/firmware/" node can contain additional
entries, for example linux device tree bindings also define
"/firmware/sdei". So, probably correct solution is to implement function
"make_firmware_node()" in this file, which in turn will call TEE
framework.

But we are making assumption that all TEE implementation will have its
node inside "/firmware/". I am not 100% sure that this is correct. For
example I saw that Google Trusty uses "/trusty" node (directly inside
the DTS root). On other hand, it is not defined in dts bindings, as far
as I know.

>>   /*
>>    * Scan device tree properties for passthrough specific information.
>>    * Returns < 0 on error
>> @@ -650,6 +687,15 @@ static int __init prepare_dtb_domU(struct domain *d=
, struct kernel_info *kinfo)
>>       if ( ret )
>>           goto err;
>>   +#ifdef CONFIG_OPTEE
>> +    if ( kinfo->tee_type =3D=3D XEN_DOMCTL_CONFIG_TEE_OPTEE)
>> +    {
>> +        ret =3D make_optee_node(kinfo);
>> +        if ( ret )
>> +            goto err;
>> +    }
>> +#endif
>> +
>>       /*
>>        * domain_handle_dtb_bootmodule has to be called before the rest o=
f
>>        * the device tree is generated because it depends on the value of
>> @@ -743,6 +789,9 @@ static int __init construct_domU(struct domain *d,
>>   {
>>       struct kernel_info kinfo =3D {};
>>       const char *dom0less_enhanced;
>> +#ifdef CONFIG_TEE
>> +    const char *tee;
>> +#endif
>>       int rc;
>>       u64 mem;
>>       u32 p2m_mem_mb;
>> @@ -786,6 +835,18 @@ static int __init construct_domU(struct domain *d,
>>       else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore")=
 )
>>           kinfo.dom0less_feature =3D DOM0LESS_ENHANCED_NO_XS;
>>   +#ifdef CONFIG_TEE
>
> I would rather prefer if this code is implemented in tee.c. We also...
>
>> +    rc =3D dt_property_read_string(node, "xen,tee", &tee);
>
> ... want to return an error if "xen,tee" exists because CONFIG_TEE is
> not set.
>
>> +    if ( rc =3D=3D -EILSEQ ||
>> +         rc =3D=3D -ENODATA ||
>> +         (rc =3D=3D 0 && !strcmp(tee, "none")) )
>> +    {
>> +        if ( !hardware_domain )
>
>
> I don't understand this check. Why would we require dom0 for OP-TEE?

OP-TEE is enabled for Dom0 unconditionally in create_dom0(void);

This is another topic I wanted to discuss, actually, Should we use the
same "xen,tee" for Dom0? In this case we might want to alter Dom0 DTB to
remove TEE entry if user wants it to be disabled.

> In any case we should avoid to hide a feature behind the user back. At
> minimum, we should print a message, but I would rather prefer a
> panic() because the user asks for a feature and we denied it.
>
>> +            kinfo.tee_type =3D XEN_DOMCTL_CONFIG_TEE_NONE;
> Why don't we have a else case? Are you assuming that tee_type is
> initialized to TEE_NONE (which luckily happens to be 0)? If so, why do
> we need the check above?

Yes, you are right, I'll rework this part.

[...]

>> +    if ( kinfo.tee_type )
>> +    {
>> +        rc =3D tee_domain_init(d, kinfo.tee_type);
>
> Can you explain why do you need to call tee_domain_init() rather than
> setting d_cfg.arch.tee_type just before domain_create() is called and
> rely on the latter to call the former?
>

Because I was not familiar with dom0less code good enough. Your proposal
is much better, I'll rework this.

--=20
WBR, Volodymyr=

