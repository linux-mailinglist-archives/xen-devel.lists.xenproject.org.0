Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E947F1340
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 13:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636700.992397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r53OH-0003RS-3a; Mon, 20 Nov 2023 12:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636700.992397; Mon, 20 Nov 2023 12:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r53OH-0003Pn-0f; Mon, 20 Nov 2023 12:28:37 +0000
Received: by outflank-mailman (input) for mailman id 636700;
 Mon, 20 Nov 2023 12:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhrZ=HB=epam.com=prvs=56889b6e60=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r53OG-0003Ph-43
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 12:28:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5162ed70-87a0-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 13:28:33 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AKBQl9j013014; Mon, 20 Nov 2023 12:28:30 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ug6kb86xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Nov 2023 12:28:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB7122.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 12:28:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 12:28:27 +0000
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
X-Inumbo-ID: 5162ed70-87a0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCH5lIdc9tq18M1/S5JoRVc5HuCOraYV0KMPSLuRkI2OKDLbyqYtVub2x5y9oUU7PmB1f/QhJkCDZr9JPGW7q9y6laGOULwcj0c9Vg3zX2/TyHvGunlxc+OC/MNA6Srg+Mq6xGnCzGVBR/ye3jS3MOpF7gDTqEVooryZUiSykAY8jOiGJ2nUmj6YBUCJFSMk4pPNC/E43QT8fahxCTK+XUBAp3J5RNPdlEJBd5PzGDaERgdRkJ2NlsGj9btDZeg/+0/9Qap0HrBRLlbO2RBUnEKUNDsYBRJBzaHOCb1Vl8z8PcdTUwRE17LALUwOuZOtVaeqfUYZecdemejvluT+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ii45Co+a2TBdTogtICxoVTXYwN9632ob5OCY7lzGfPA=;
 b=MZVtM55YiqNP6LWsHIyRnd4qgaZq89r+qlEOgk8v1QUEjglf8/niwpUJnL8Mm6N1xlozDHxkmeGhMMaeQl6W48XRoAOxE1HHD4nBNtsnGt43sl4mMSHpHkoxoPo357umRJD9AmnG1SP/qCA74AW0Gs7256Ls0Cw8tSU2t79TyOwNA2Xh9drXEGyQOeNh4obzt7H0jl5HT/1kvrwQCngphwghK2LOX1Iz6AL7j+mSwLjb1D4ULGC/DB3t4F8Pr8Ecg0/Q9CzvkXAqDyex8cTPjqCTo86LykNkWVrwo+ebLvmjedtCarV88V0vOqPYZVpVCYCizR87YlGXoN4zWQrWZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ii45Co+a2TBdTogtICxoVTXYwN9632ob5OCY7lzGfPA=;
 b=ZRJpyvOnv61tjDw9xMv8QdNeah3ExHXEBVeV9dZvVaKhQ9fBbHBKzat86Gk5T6wl8TsfB5sPK9JKlks4j8cxnaDGmH+mkBbcXOhJ1LKDG47qIYWTjTNeZsJqRmsPFKS8ZPr90XvWmpvbg1KEWdwu4O+I76WNs8+sT6YfwaBnoGAt5ZAJCl9qJwYwW9rDAoIM7lMU1Xvmmsn0R4vthYpM4zQzEXX2VWEvy7Wb7P7A6Lpk4V6fCDE+dbxf7rfVHHT+09LjVKOrxLdwY03mmCrLYBtsx3casss0EEPqVWdx4d5os7dA63bcRmwusBWqKiudizwt2W8ffsMhQI55xdqeNQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>,
        Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] xenstored: print domain id in traces
Thread-Topic: [PATCH] xenstored: print domain id in traces
Thread-Index: AQHaGM9oQiwd7S9EmE2h7a1Tz9yy37B+SeoAgATd0gA=
Date: Mon, 20 Nov 2023 12:28:27 +0000
Message-ID: <874jhg38yd.fsf@epam.com>
References: <20231116205613.3796068-1-volodymyr_babchuk@epam.com>
 <16a320e7-3d12-4c9e-9010-ce0fe37c7e33@xen.org>
In-Reply-To: <16a320e7-3d12-4c9e-9010-ce0fe37c7e33@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM9PR03MB7122:EE_
x-ms-office365-filtering-correlation-id: b439e656-f436-4ace-7881-08dbe9c4329e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MVAdAZxAtJx9Y/p4RxTVPum/0sprafXOjLpnYW/Xg4EI5/PF7FDSm26yiT9/gT+26qbWnBrmXbIKnVyufv0RNUmConKHw62K2DwndGD+AuqA0CFsWpn4ErZWrVif7DOmnZzX2Mc7CoqiTpb/osRjlboq3fFrg9wH9GzftsjJ+cHCnC7fKr1eAk5zTUrA4nfvnzbfSciNXDGO4FljLYeIM4fA5fxg762+Ume2i/xwoSzSUDaBfZcEfpkuEaX6g2vyoag0L+znwXdtnniXtxdEbpWvozI8YizRYJHxF2GaHUX7EmtqdU8n2Lun7aKyYpiuppE8hQ38gnXbGnietS5PevfuQxEPre//N4JCknDUbn3iad+DzFzq6mmyC7zscWta8pv8nmUp59dFKxP/62uSbxvKh+CUQq7dbpW1B9pCdwGjHqVW3w3nYOMUHWSfwKJf6X789D1TMjIarggheJwKUPcTxcxLoTWTrpi5sCKlXCTecDc1eLZPrfhOfwS32pKy00krsSIq0AksDPE1ucecRGDn3WuwX43cu1qLgbMUAnyeXofTcu4Ic0QeZM6RKJORCLuSISo2DlR5f9DoEIwpeactYrWWBGWxwhHXCA+d6J4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66899024)(122000001)(2616005)(55236004)(53546011)(6506007)(41300700001)(6512007)(38070700009)(83380400001)(26005)(36756003)(4326008)(8676002)(8936002)(478600001)(5660300002)(86362001)(966005)(6486002)(76116006)(71200400001)(2906002)(38100700002)(64756008)(66476007)(66556008)(66446008)(91956017)(66946007)(316002)(6916009)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?q5///TRwKpyGA8A27Y8nCBGB+Z/7Lmtid3fYCKfNXh+Y3eZ4oc4vZivp5I?=
 =?iso-8859-1?Q?eI4myTnoQqrEjGQHUD489dQlFDGwKXwJFfXEPZh/slbJyZ0KWFcEDz1V1+?=
 =?iso-8859-1?Q?uRDBsnX9jzOZCjPrFuyuT2MHP51Q9ghH8BfNge2cXImA18/9nbAtDU/chf?=
 =?iso-8859-1?Q?skOBf1ge5DHLa4NjONlZd4lCt4rt+Vciu66ea3fbs1RfUJzWiLd/ANahLN?=
 =?iso-8859-1?Q?0lKTYob/rRi4YyfbVbtyujaIdLjyHj37beypucP8Iw/vnX92IjjE4ZIZc0?=
 =?iso-8859-1?Q?o/nNOo8KdlmaToo1y4bkJ7Px4NF4gGnOLf3hkAz7cS+Rg8G9cVD4FKDsNO?=
 =?iso-8859-1?Q?lr9NfYLL/UY7uC9s6HeADpyPlvbyDAp52ks1o1zvq5HRTgMZyfE6A4BUdw?=
 =?iso-8859-1?Q?+Sxkc2Opk1s2/abjHc7xES5zXfPBr18g0p4HJsmqRA4U1Rg48xpI7gQysK?=
 =?iso-8859-1?Q?jnhflRpP3kP6ljTbsYKjrqct60bskq6plAWbRl9NsSSuhPHxmgn/zNzhT4?=
 =?iso-8859-1?Q?QXAzK9B9GTTsnrf/scz//OAm/RZ85FLuMyRDcNQ/213Waj8kxnWEJDs55L?=
 =?iso-8859-1?Q?Q4oOk8/GOrhzXYe3mic388HabtYMGdbXRALAsM3brGoPLg6kfDecNrFC2X?=
 =?iso-8859-1?Q?O7yTHi7zy0U9gQSU/KBA9qElAIcyTa7Iwcmw9o+Wqdpd5TguCQMkAUPA7B?=
 =?iso-8859-1?Q?c8soh3+TRomixjWmum/RTcwDDg2X0agtmEZqznsa5Nc8JMRy9ejDhV+3FG?=
 =?iso-8859-1?Q?TqWqipRpQl/ayFerHF60MnxeDa7s6I2GTaglLlMepPGEjgl5ZjwUpB1XlL?=
 =?iso-8859-1?Q?/ntyUP4omlHdjzg6572hga2NT4wvF9yyq2eDSS250gD0e8TNCw3x1ay2JV?=
 =?iso-8859-1?Q?ZFC/X9cBjYwN6Yd1dolyaOpi2+nEEikNuZORE7zoSK3+xABfmgCRLdQ1Rd?=
 =?iso-8859-1?Q?x0ZlydfHZ8a+etQU+c/K4yQZHSTMYVarEBjUxrl7TAT8uckrXTVkRkoN21?=
 =?iso-8859-1?Q?OESEA68CI+cpPRPgS0qrz/qhS33Ljz3vYdyilwj4h5dDOEhyImTO55xkrP?=
 =?iso-8859-1?Q?+TGUXQtHZz9bJIRABCAOXLrgiBVFExescMrjkQ9wyJfaC/rtkrpOcWFdul?=
 =?iso-8859-1?Q?UH0QK2EDT0GuT7yGBIf0u8qmJwSV+dXu3P6s6q4nAmCFjp+4nYAAjfk+qY?=
 =?iso-8859-1?Q?jdr86LTqYLpphMdSzb2WWBEuhXBxIPgu424Mh3kl/pRO4FWf+qxYSAuysD?=
 =?iso-8859-1?Q?nkut51PQBGdiJ35FQ7ZIE3WImju/Ve8OwNmsXG33drHm2mQ0llYf8APrNg?=
 =?iso-8859-1?Q?dfa3IUfX7uGkYVFB47cXywQlSsIw3b6u2bj3L7OToAcY7NMyJvqIL2nHhm?=
 =?iso-8859-1?Q?kGs+mkK0Ikx9n41LFHBLveR5+IhB45+VhGz5qpTK5KuHD1mUt3C43XvhLh?=
 =?iso-8859-1?Q?EnER9IoEzjbMeKZXC9WDwt6B9YYzjHvEJizouBlta6OawZctu7LCB4MJ+s?=
 =?iso-8859-1?Q?3HeIJMeUYYKz8lVTeuRgaD9HJFCpVtafqw9kbhRE8/cunnqAGx6NLGfSka?=
 =?iso-8859-1?Q?ACRmtJ6YFkeeqCbXIAUtaUPABi0BWqqB7/R7mj1PHJcpOSJ5U6vAcZ+8D+?=
 =?iso-8859-1?Q?JzNTzvD7we9ZYxDboRLdl1ZVF+1oczXM6Lrc6Mo8o963NgQrH6NjWoqg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b439e656-f436-4ace-7881-08dbe9c4329e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 12:28:27.4640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTPy27+HIvvjYFMIZcUrxXYRBlFgx97fym1SK3mYfqnMAURSc2Xrxq9w9qDXllu8K/D5XnjUVfjLhV2tSY424hsXC10kfN2cUkHJ1Mu3WyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7122
X-Proofpoint-ORIG-GUID: MYhFJVp2biJtT4vy0lj_xYipIXslF16n
X-Proofpoint-GUID: MYhFJVp2biJtT4vy0lj_xYipIXslF16n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_09,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200085


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi Volodymyr,
>
> On 16/11/2023 20:56, Volodymyr Babchuk wrote:
>> It is very helpful to see domain id why analyzing xenstored
>> traces. Especially when you are trying to understand which exactly
>> domain performs an action.
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>   tools/xenstored/core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
>> index edd07711db..311764eb0c 100644
>> --- a/tools/xenstored/core.c
>> +++ b/tools/xenstored/core.c
>> @@ -135,8 +135,8 @@ static void trace_io(const struct connection *conn,
>>   	now =3D time(NULL);
>>   	tm =3D localtime(&now);
>>   -	trace("io: %s %p %04d%02d%02d %02d:%02d:%02d %s (",
>> -	      out ? "OUT" : "IN", conn,
>> +	trace("io: %s %p (d%d) %04d%02d%02d %02d:%02d:%02d %s (",
>
> AFAICT conn->id is an unsigned int. So it should be d%u. This can be
> dealt on commit.
>

Yes, I missed this part. I have noticed that you already committed this
change and even mentioned %u in the commit message. But in the diff [1] I a=
m
seeing %d. Should I sent another another patch that fixes this?

[1] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D97f8555a=
cbf3da013ed713ca0bbe739d41c48da9

--=20
WBR, Volodymyr=

