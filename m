Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71A731435
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 11:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549491.858055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9jRr-0001hX-01; Thu, 15 Jun 2023 09:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549491.858055; Thu, 15 Jun 2023 09:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9jRq-0001eb-St; Thu, 15 Jun 2023 09:39:22 +0000
Received: by outflank-mailman (input) for mailman id 549491;
 Thu, 15 Jun 2023 09:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uS0=CD=epam.com=prvs=0530ed8423=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q9jRp-0001eV-Mj
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 09:39:21 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 803dc9ea-0b60-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 11:39:20 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F7jbSS009705; Thu, 15 Jun 2023 09:39:06 GMT
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2234.outbound.protection.outlook.com [104.47.11.234])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r7n75syt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 09:39:05 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7320.eurprd03.prod.outlook.com (2603:10a6:20b:2e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 09:39:02 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Thu, 15 Jun 2023
 09:39:02 +0000
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
X-Inumbo-ID: 803dc9ea-0b60-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpWEXB3GFdnCgK7Xdgz5dStPF5Dw75C5IpivAZI9WIt1WcnAMhuFtG1aM1hbD3DhuIOzGN+s47j7cGlQPt9mGj3wgdD0Nx9uSh3UxgGgJjbOAN1cpGy4lLcYS3Pd/KvNO7WqRycYJZObYN6kJHqWmL53Cm1epSPdp1u55xlEd9ODoiEiCxtJgJ2MXliTe68/misBD8k/8ZfHGbzxaqiNM1L4J+8lrBv8WHtP0GbdXjVeOP42Z3GBuvS9Ys8RYyroM874Q/hDqxYKe0DoPF391kHcOn7v0oRaVGdqwL4t34+9sWgC+l2NIcBMEEhDr5/e4kLC2LbIovDd4weBXmxs2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4luQ8/I9W0s4oJd63j1Hy6oyNXVndbEYQGAjRQ3Ga0=;
 b=Wk14MC09FHsYzE+t1G/Y/EgqqU+HfDT8YdLiVfVOIm7fcRJyAwGuzDuBZhsw8OGsrZNDvWwgIgKWmZEMskYzNfW55WpqyIVq2W5m+wCnmKIdIzbp2tFnr+8781q5xn605qvqFlHWmAbyuWgyRPYH+YGi1e9zDMZKrC+Q027cag2abMU+3hZVt6NTTbBIT7KkrDSycRObNOksBw5edRHBDUpKcC2Bp4wWD2qjAtkHglvAObMj7SwyNCapIhha/W5eLbWmPkzPslg+PPTjip4oTW+W0RYjPD9Da/1whFbS48s7VKLnwFC8iNteKbPbU0smOCY6Fbz8+ADf2LjAgMKgqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4luQ8/I9W0s4oJd63j1Hy6oyNXVndbEYQGAjRQ3Ga0=;
 b=n1CNgZVHiywCrqkD/gdzYZ8kBNTslvIlgvlUs6lAMD0aJAoM1NOixCC3Dnhhv2Tt1X+qJS/+5QTafUieZbgPpKHgGtC1Az+dymsGrjWzl5dmYqw4RCpgj/e5Bwqrf17PE7jojQqs5LtxQjOvYRAUpXl4ySqigj/FVhrQZvPYxY1o7nlyHmfyc7pt27etVuPOvAH84jpKsRyhcsjW6/zVplJ0FU6t6vQIbRYpbSmkHH1u3RMFWFrvgow+Nl6xxd1PUN6qk9ox3PI5ARqm/R8xZInkO82DFyBkv0DBJAtDznu6oWsEFHLEHNU/inpd4iltX2IVrzWudOdWvxtwH1zngA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Jan
 Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Thread-Index: AQHZneJYJeyWMREaaUSf/027X0QuCq+LHuyAgAB+64A=
Date: Thu, 15 Jun 2023 09:39:02 +0000
Message-ID: <875y7p9ia2.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <fcde45a6-9da8-4dfd-83cc-cd03e05a68bd@amd.com>
In-Reply-To: <fcde45a6-9da8-4dfd-83cc-cd03e05a68bd@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7320:EE_
x-ms-office365-filtering-correlation-id: 6f7c83b6-6ddb-4b56-1621-08db6d845a8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GtsbBQYOmZDaAdWN3dWzU5awJqdYNebwyLog84d242ls0Oe4O2hCIDBELxWK68YPvT4oG3cm5V3qOSI7r6LmB7hSYFlOq+7gzf2Q8m719DWa/UM+mBBgdWyEbA48TyDGcnvVFSrT2dphIhKdqjr/l2pJ3NUdPFzUiZsXJjVze0KBvj/amMsAUn+4n2pNA+PjdHo6Lzcms5ZbRWUiB2HBOjZz0BClW6cNuL5N/3p+MP/+24ZL+WXwIT6NV2B7CK+kEPrlGHXreaNvY0r4tL4FMA/5MRn50es0XUn9lPlNdh885ZsBXG0l7TUkvL+muT0GYVZh0sC7lR10vxCobDdtsds2RrZKYvhx8BBFn0XhdHxp2Lb4X27FglxEpExXykxSn0SmrHa4XExc+P23WW+XvpGGEN1WOdsl2gvsxHV8HKkypimk8XMmA0LKvdabjWgjkDpsXz+AiBbkNUQWzn5KN4Ew7tN2vQW6u20XcP29icDiG5r7JpDGJcu71BLtctpl8eA0dBg03FgqCq/+6wM67PgpsRxUJv42FvYUo/nRZg4TrXbLck6OX2sjERomumLkvq18Wws9QVudOMScs6fY19wEGDlGLxArI9qF8xQhF58=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(5660300002)(83380400001)(186003)(55236004)(6506007)(2906002)(7416002)(2616005)(966005)(6512007)(41300700001)(8936002)(26005)(8676002)(6486002)(316002)(122000001)(54906003)(38070700005)(53546011)(36756003)(478600001)(4326008)(76116006)(66556008)(66476007)(86362001)(38100700002)(66946007)(6916009)(66446008)(64756008)(91956017)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?lbNIVnDEX0dn9Kqo38arVnAM8mDqswFyrTsMqI49y4gW4Ils0OL02/tMau?=
 =?iso-8859-1?Q?5wtRZMScHtcbJvbahHHsabxptMNWeCLOcIkHumv85zgq6j8Bqef0vpszE0?=
 =?iso-8859-1?Q?woaUy5SguLbEPOR5nS/tQbB67/iHxIrGAaM5fF6kJPE2nHAJSdoKCgkrXP?=
 =?iso-8859-1?Q?ZVz/uyWLYqsNjwGrMMX0E8pkHLVrl/1hYxnzU73hs4KIy9u1bxElquUnKz?=
 =?iso-8859-1?Q?Po1IAUmH1/h6++pONRetPjFhWnNXyhvHyRz8ARVVzTKuy5Vqb411XW3sit?=
 =?iso-8859-1?Q?YUp6O239b9RWXlpEhVk6/5z30cwD8TI6406l8s9fsqixv0WYsjCgpWtCi5?=
 =?iso-8859-1?Q?FjDzaOut1Lc6mRwIK+74mkX92RJPiQK9H+Zrf5G5GoJTMdoHceNwI/uY+Z?=
 =?iso-8859-1?Q?FXn4j6LV6cipvLpuDoU/6S9ysAymwBIHDoFiPDuKj8+98cN9xPL+pIkOIV?=
 =?iso-8859-1?Q?pNt+gkRhpH56FlmvvGGhB6at7j32bxaQBsuFlSAddcq4Eqb+TAyO4k266c?=
 =?iso-8859-1?Q?58Z1onjTzLZs3ta3AdgqwH5QioX+EOG+9S3t2rP9Ff2mDGRKAl/Plzup/v?=
 =?iso-8859-1?Q?/p1qqZ0NRIBmuYdk2AuiGmV5Eh8j/VK0lNaQkk4yhDDejCxY0SjAZy96p3?=
 =?iso-8859-1?Q?ogSeY7mxN7cSCtptt6rGE3Vf/eNc1DcBfIqW83yDxmqtsbbygLLkWxOAJT?=
 =?iso-8859-1?Q?yJX0BQ3eBneoh7ocZoa09vpVizHMFSUtfcq8pA9LoyaYslLP/t0kUBkAvC?=
 =?iso-8859-1?Q?7H2hWFVbIbYCFMdyvzQZ6FsVEJsxyrE/JtQpq16+454ue8BeRZHtkepq2n?=
 =?iso-8859-1?Q?beEfRrZBIGN5QBBZiWrk9OhdLbnAU/DyRvvW1TiQ13jHtKFWUZnJWd/0PD?=
 =?iso-8859-1?Q?OTbIh/CIYAMyOt9mKP+H2qJt8Q0bC93dM7C5rq78PBIkObE8y721sd0T9h?=
 =?iso-8859-1?Q?Ol2OCzbLj/nslvzQb7ZwXSQSoOwDl9ZlMwU5aQ5Z+ecWldPwFGf9GtiHCY?=
 =?iso-8859-1?Q?r1jKY39RQq0GNDwhUAUmEx03exDg6zdYlE07QNKN14MqnxBwRSmSvfD2cw?=
 =?iso-8859-1?Q?RHGvsjhyx3HQD0eCbp0kE0BSTbAwutFQZ9xIOHRF1ZRweS7kHoSFUsDZav?=
 =?iso-8859-1?Q?TnSPzBWqZoacZgyrRKkE/oR/CtbNaAzABfYQ2ayfNtrqT0x2YtBQlC1z5s?=
 =?iso-8859-1?Q?fsQx1k+uaZFLa20c9pvUGDAsNSZMeOHivqVUmkxeJk/uS3ozoge9toxDIr?=
 =?iso-8859-1?Q?V4kzU6uWB9bRYb6uV9qg1xKxKzgOPmkIgBNt2vEPo/NbPFJapdmdaj+rQv?=
 =?iso-8859-1?Q?2SWJMaD8NtOAdoEUGYflnzEVN4LdS7JwH22lfvIY7F9C30t+hu+0+SqbyJ?=
 =?iso-8859-1?Q?CtO4Oi5QCa2cKXKt3+cyfpWbeDmCODa3MOdE2JNDJCtMtjghGW3DQKA9Rs?=
 =?iso-8859-1?Q?ZeLnrF8HsoAUf5tMMKF5u3M4nZNLXoI8aNpKUuHSrC+RPtzrHVCDWgxrdn?=
 =?iso-8859-1?Q?Hh+SA+chxPGwLczzdiOEVbnfgOg5vugeDQKSPHsoI+XvK8UFjdOYvGajO3?=
 =?iso-8859-1?Q?C/gNF5c/OBQz03WybdiPjClnEVTv4nKjin2+M67Z7N4mlP5XpyklLOtL/4?=
 =?iso-8859-1?Q?0JTuAfI4xIjGGh8vGnCewDczYKGe/kW2frtUxas9iBW7wXP9eUxqhKgA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7c83b6-6ddb-4b56-1621-08db6d845a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 09:39:02.4699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3HetkAFHZ9I3mx44csJCWKnDaXfH4KlLUkxdNxWrUbu772lZlYpq5AKN3aavMEenbkqKeSPsP4iyRO1mR5uVJtoVYdhSp2YTNn7k7FtmVB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7320
X-Proofpoint-ORIG-GUID: U6kik1pU9wW-91rKBioI6iXecJD-t4dq
X-Proofpoint-GUID: U6kik1pU9wW-91rKBioI6iXecJD-t4dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxlogscore=718
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150082


Hi Stewart,

Stewart Hildebrand <stewart.hildebrand@amd.com> writes:

> On 6/13/23 06:32, Volodymyr Babchuk wrote:
>> Hello,
>>=20
>> This is another another version of vPCI rework (previous one can be
>> found at [1]). The biggest change is how vPCI locking is done. This
>> series uses per-domain vPCI rwlock.
>>=20
>> Note that this series does not include my work on reference counting
>> for PCI devices because this counting does not resolve isses we are
>> having for vPCI. While it is (maybe) nice to have PCI refcounting, it
>> does not moves us towards PCI on ARM.
>>=20
>>=20
>> [1]
>> https://urldefense.com/v3/__https://lore.kernel.org/all/20220204063459.6=
80961-1-andr2000@gmail.com/__;!!GF_29dbcQIUBPA!0BUqPos1zFKUoPwbKLLwKItNgBVP=
aBgxmH1Y6zXpms2bngrlWrzB-qMNvIaiAy2WSWMa93UrlvRi0ijYP8X4Ymx07GXYPO1W$
>> [lore[.]kernel[.]org]
>
> Thanks for sending this!
>
> Should this be v8? I see v7 at [2].

Oops, my bad.=20

> I had to rewind my xen.git back to 67c28bfc5245 for this series to apply =
cleanly (just before ee045f3a4a6d "vpci/header: cope with devices not havin=
g vpci allocated").

I rebased this series onto staging about two weeks ago. Looks like
there was new changes into the PCI code after that.

Should I send a new, real v8 which is rebased onto current staging, or
we'll wait for review for the current set of patches?


--=20
WBR, Volodymyr=

