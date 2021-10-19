Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB6433F87
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 21:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213432.371635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvEN-0006dQ-71; Tue, 19 Oct 2021 19:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213432.371635; Tue, 19 Oct 2021 19:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvEN-0006b7-3z; Tue, 19 Oct 2021 19:57:03 +0000
Received: by outflank-mailman (input) for mailman id 213432;
 Tue, 19 Oct 2021 19:57:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfyF=PH=oracle.com=alec.r.brown@srs-us1.protection.inumbo.net>)
 id 1mcvEL-0006b1-MA
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 19:57:01 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7e80a2a-3116-11ec-8324-12813bfff9fa;
 Tue, 19 Oct 2021 19:56:59 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JJ20hZ005510; 
 Tue, 19 Oct 2021 19:56:09 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsqgmmv7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 19:56:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19JJpWA1195512;
 Tue, 19 Oct 2021 19:56:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3020.oracle.com with ESMTP id 3br8gsxubx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 19:56:04 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com (2603:10b6:5:6b::26) by
 DM5PR1001MB2396.namprd10.prod.outlook.com (2603:10b6:4:30::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Tue, 19 Oct 2021 19:56:01 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::c5da:305e:be30:abac]) by DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::c5da:305e:be30:abac%3]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 19:56:01 +0000
Received: from alec-orcl (73.61.222.52) by
 MN2PR17CA0009.namprd17.prod.outlook.com (2603:10b6:208:15e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 19:55:58 +0000
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
X-Inumbo-ID: b7e80a2a-3116-11ec-8324-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=+XR3LTOt/2W6NSg8Z8xkfFmcz8BR0yTrJbA4p1J5W6w=;
 b=jh7MmqFa7mj2mdtEDGa/wXexJXuGxB7m2zPObitG6ULUygjGdXVtMBaWakulb7bZgHKl
 e6yABbGSFpl9xI9opWgeoPfJ4nrXeqNdvayizlnO1bFZN3vtNZNJtmF5LnBDamW5cIz4
 01pbJvthH470NUUxseStAe8Gg1KKcAdXjqz7flAuszDBi16DzHi6RXnrcB2xl4yPPHZu
 v1tJwV3XINbK3iOnmhp80I5l4Kj0NOauLZfteFTGiwEe0O9Lujgm2meVZESSSTVZa8Uo
 jzwmjesdxm+dgbXmR9DYNZA5BFQCmhpElB33Uio2H3IOOb1T2yrcqeBPahVuiltRO7Uo Cg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxOvUGJO24U50UkNmhfKAWEwudOAo8cp3qj3bBG1S5zKxIMAB2Q6xxtfCyj2k8DyoonavmipSyq5d5eR86crPUI2DADHXw5HmnlrK5ApziGpfhglN3EBrlGgfSuwrw8nqaienbXBnilSXW7+lgGHIQLDA0fzFB9wRoLyw0y0xTXUgXzO9O8wQjLCxBJjF2OntuK+zZ7j8jX+SGPjiy++I9mD+oQNygr/o7KLgoSNuDd6sDDc8mnb5w+GhKa8YAosxYGEWVQc5hUiXu62T5JFb1HOlDQRu5aNXQLGSp1g5LJeC3h1pi6QBu28OlHMwaBoaBT8NljxxdzzrLd4TCl1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XR3LTOt/2W6NSg8Z8xkfFmcz8BR0yTrJbA4p1J5W6w=;
 b=ZsEZoYkAcP8w6wXtA0AO0l31KvSW1VWkgYAV1nDHfyMwz1J+urX0uHX5lFg7wgXLIRV7GUTHv/RoWuCurZcQgb8/kwHC0yGatM11A4VYqqfTvM3E1OtzuCi6abotx8uRYcZUIh4OacPSTIIN5mNikkWsqZuLxsdgAyiEZfGjmP5rXf31LkJ0HKIs5wsI3hXfgBXTQ+4fu7FAvxiQlGxJ9ejbDUoZgA/EY3wtdhbiD91NYvf4zwXJtW4mRkKXKkp6CdYplixvqBRExa6j8cYlO8euqQzcUCuLVzMHJqiwJarmXHYs0tWAeziUB1pK6KU8sfiAog7rKm7iCw8qgMjZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XR3LTOt/2W6NSg8Z8xkfFmcz8BR0yTrJbA4p1J5W6w=;
 b=ZCutfKV1MUPwDbBfTeCFkqs7mtNmSZCp2kQo517QGJeUQrfzGvnHm1vlIv3xw0o6699bfkczRJwISlWPpexd24OFo6yq9tgxu1+/cDUzcqAPr19+Z/OFt5WQlFLJVbM8YiBsZL6yf2lE2mw88J0MLTd66FoEs8yXp5S9NkVYzu4=
Authentication-Results: gmx.de; dkim=none (message not signed)
 header.d=none;gmx.de; dmarc=none action=none header.from=oracle.com;
Date: Tue, 19 Oct 2021 15:55:56 -0400
From: Alec Brown <alec.r.brown@oracle.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: "coreboot@coreboot.org" <coreboot@coreboot.org>,
        "grub-devel@gnu.org" <grub-devel@gnu.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>,
        "trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Aleksandr Burmashev <alexander.burmashev@oracle.com>,
        "allen.cryptic@gmail.com" <allen.cryptic@gmail.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "btrotter@gmail.com" <btrotter@gmail.com>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
        Eric DeVolder <eric.devolder@oracle.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "hun@n-dimensional.de" <hun@n-dimensional.de>,
        "james.dutton@gmail.com" <james.dutton@gmail.com>,
        "javierm@redhat.com" <javierm@redhat.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        "jwerner@chromium.org" <jwerner@chromium.org>,
        Kanth Ghatraju <kanth.ghatraju@oracle.com>,
        Konrad Wilk <konrad.wilk@oracle.com>,
        "krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>,
        "leif@nuviainc.com" <leif@nuviainc.com>,
        "lukasz.hawrylko@intel.com" <lukasz.hawrylko@intel.com>,
        "luto@amacapital.net" <luto@amacapital.net>,
        "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
        "mjg59@google.com" <mjg59@google.com>,
        "mtottenh@akamai.com" <mtottenh@akamai.com>,
        "nico.h@gmx.de" <nico.h@gmx.de>,
        "phcoder@gmail.com" <phcoder@gmail.com>,
        "piotr.krol@3mdeb.com" <piotr.krol@3mdeb.com>,
        "pjones@redhat.com" <pjones@redhat.com>,
        "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
        "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        "sjg@chromium.org" <sjg@chromium.org>,
        "trini@konsulko.com" <trini@konsulko.com>,
        "tyhicks@linux.microsoft.com" <tyhicks@linux.microsoft.com>,
        "ulrich.windl@rz.uni-regensburg.de" <ulrich.windl@rz.uni-regensburg.de>,
        "wvervoorn@eltan.com" <wvervoorn@eltan.com>,
        "rharwood@redhat.com" <rharwood@redhat.com>
Subject: Re: [SPECIFICATION RFC v3] The firmware and bootloader log
 specification
Message-ID: <YW8izCvup7gKiKGc@alec-orcl>
References: <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
 <A7F710D3-5148-4E92-9E3D-5D850AD0245F@gmx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A7F710D3-5148-4E92-9E3D-5D850AD0245F@gmx.de>
X-ClientProxiedBy: MN2PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:208:15e::22) To DM6PR10MB2986.namprd10.prod.outlook.com
 (2603:10b6:5:6b::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7843de07-0e2f-44cf-44e4-08d9933a798d
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1001MB23963AA636AFF93D4852C44ABCBD9@DM5PR1001MB2396.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EbaiNoifvw7ECI9qx7Uu3gK1oc4d7yHlrysDNpLEEzdnr96/HbrzqJeKGjgHyV/1MZ/OIeARxdS2t3uxUhmc1FABkL/SKnc2SasInLgxprbwo8vTtvz5VeYqKBUDHJJSCU+lmrdaBrPzXxOL57Ia7HUx84yQp/Cb1RyGb66ljG7sJrDgje+q7CIdo5h5ySPNM/FyUZPc8agwIuV+A3UnE3H6um6fQ9AKolfGglqJ6yUgycx0af8fWp0bvFMu3mQ2+YPf9l2yGh0DMGwKpDhLKDOw1+kvSM8N7Lp0wUS+epan+2VlLmFtRQ2E1g1avjDCI1WJQcIRXrvt5gSW89HH1unqtTiMz43RQSnRkZQdggwdjYZW76oUqvgyRqKtj55Wq7ehpuSpDjjRPEYvQtIAVZAr4rVTAGVYsDorYDM301Wvrc7W5NdS3TP9QXHpk/6rRBzLZDSm86O9b7cDQ+kbJpIC5x7QZ9KFj0o0sKuMbWDLbjvzG8gzKQ3MkpfbBvy8CNFTmbOjaUqcUKYrZOxSemznmeBr3eqKZ60vTxgHQSLWesaiKZlsT0a8lH+RjY9TogGBTThaFqxAkdF7KVvjaCrDyXxcOYVD7tP6Xg25Wj4iu/PJGLLeOzB2HtKd4SvQeHQxjINjl/kgJXrQj7BT66zcFWkCn9+nwysM7tfC3RzahUQn8w/8tH0F2/w20fas1buYeoRPTbFCFqw1gLxsd7H3kaD+tykPSf4gfsa9SnySeQMS1zrXa9bAJjPKSgY/fcA7Q9E/SSOQnHa/FDYVkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2986.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(7416002)(5660300002)(86362001)(8676002)(4326008)(7406005)(9686003)(26005)(55016002)(66946007)(966005)(2906002)(83380400001)(66476007)(66556008)(316002)(38100700002)(508600001)(54906003)(6496006)(956004)(186003)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MyEAvdH5fdrP1X6Vto4tc/tRdtK9Lgup0fAo1bPDBAMlbjkKRjEr78UaD3C+?=
 =?us-ascii?Q?DM3fRPCnlEK6cLW7ZbSexY3WcDcEla+KWmTenxnDCY+OwEyv+DJ0xbKPotmA?=
 =?us-ascii?Q?I2pg4mhi7m4Mq1qtmLxJqncJfSLruFv0YHHZqvcue2YdzjTbb2p8Jnk+nKau?=
 =?us-ascii?Q?RDM3rTz5wFlKNa+VZB6/CZ7/j2HJg1pFoeiXeLqMlPFuK3z3aJ5EshmJBCXB?=
 =?us-ascii?Q?inlSIQBL0wjzwJnFDvaOmzvIcSGdmIj2//hx+7yL1Ac9KVsnTOKdnocCqBdz?=
 =?us-ascii?Q?4838bDxTvQFzIVlBBaWOcI09gSIRu/NcPVo6B/uXrHqsgG/Kljt2EJ+eevqy?=
 =?us-ascii?Q?X7arumQeTPp1/uQDgkdYcAnulHHxkIy6RATLOAxYCc2Eszn5hhoYzzzc4jB3?=
 =?us-ascii?Q?tr3dscKwlFyGxmokh3zzfkqrFYdAVEjPkzotLvxSiJrHEeElXOk6o54S/gj2?=
 =?us-ascii?Q?bD0RekrBZZkf/H2hjAS4NgSTSDMZ5dZwKG2DqIDS+qBCdECnf/V7aeMQrMLm?=
 =?us-ascii?Q?IVBIUG7Qd5buNZTJIYHtTuOPqAp2VW/kefv0udrPPRov4I2wRCRY8v9srQCK?=
 =?us-ascii?Q?aeSJHSBYrPnKIKynqmmfMmrhZG2mT3k8h8XXz4UsKkDryL1bA3SrNghSL+5L?=
 =?us-ascii?Q?Kiye5Gcr11mfDqsfy0fP7iga5le+y4CBLPcgyaUhRyQVpYrgL49sXTSbFfIX?=
 =?us-ascii?Q?CaYyxRh/UYkZVH5L0PBEFrOeDz7tI79wyrsA7X0WvAAdi37no2gcTS3Lsa7x?=
 =?us-ascii?Q?eoP4KYR27bFzafZvTFoToRpjduyyyNGvdd7pHGyExByyuxUCATro9Sm8zlnx?=
 =?us-ascii?Q?9lC94lGMUvAxY08bWnSckVrQw00V+F4py5KePJHa0POfqRPnkJlukMRLqS19?=
 =?us-ascii?Q?NbYIDmRKl7dzQemypqrZEdusoBMkqrB2A3PggQ1+EGXa4Ydls5+1MXVz7SEb?=
 =?us-ascii?Q?khTszj6rGrIEC/hQdHpSSEIqxcj940QBhI0mhyZMhBfrMQJ8UIDDGUeGS3O/?=
 =?us-ascii?Q?HcteVMiOVHgwJ5qrwYl7nAz/0kzi4oUxuyf+0w5rT6iaugGmcNCD40zMNpvL?=
 =?us-ascii?Q?il6k0lTtfk/QX49TB5O7X3e//tYqeCrlDtWaME1ln+42D3adeoTydUnSnJwv?=
 =?us-ascii?Q?t5xvk4OvwL4ZsbGloSQNxuKl3wPTuO2ljXiAy/BjJSUiiD9Xjxb3iNQc1vVL?=
 =?us-ascii?Q?ltBoyzgd3UIzAwi1BgHyr3fQHoO61/WAENodPjbLv23XuF/XfnzoAQZhLMxh?=
 =?us-ascii?Q?KHdevEFa/XI87m7zjqAiwIzN/BaUK8JXo5xI1HTl7/QtF1tWdRSJCdm1aYxB?=
 =?us-ascii?Q?nXuLIR73eZA3ccQuK2b8y9iw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7843de07-0e2f-44cf-44e4-08d9933a798d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2986.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 19:56:00.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alec.r.brown@oracle.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2396
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10142 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190114
X-Proofpoint-GUID: etKxljiA5g1qGrbHSJYzOMBhTxHuyrIR
X-Proofpoint-ORIG-GUID: etKxljiA5g1qGrbHSJYzOMBhTxHuyrIR


On Sun, Sep 19, 2021 at 12:53:35AM +0200, Heinrich Schuchardt wrote:
> 
> 
> Am 18. September 2021 18:04:13 MESZ schrieb Alec Brown <alec.r.brown@oracle.com>:
> >Hi everyone,
> >
> >I've been working on improving the specification for the firmware and bootloader
> >log that Daniel Kiper has proposed and take into account most of the suggestions
> >that were made in these threads [1], [2].
> >
> >The goal is to allow various boot components to pass logs to the running OS and
> >then to the user space for processing and analysis. These logs should be generic
> >enough so that it can work in multiple environments and be human readable.
> 
> Hello Alec,
> 
> in your mail it remains unclear which information you want to put into the log and why it is needed. I would prefer the motivation and content to be clarified before defining any interface structures.
> 
> We already the EFI_TCG2_PROTOCOL and RFC 5424 (The syslog protocol). Why do we need to start from scratch?
> 
> Best regards
> 
> Heinrich 

Hi Heinrich,

The motivation behind developing these logs was to allow TrenchBoot to be able
to view how the platform was setup during boot. We intend for our specification
to target the Bootloader and Firmware and collect logs from them, but not TPM
event logs, which is what the EFI_TCG2_PROTOCOL collects. We plan on using our
specification for the GRUB Bootloader since it will be more efficient and
flexible to use than the syslog protocol. However, if other boot components
want to use a different logging format, our bf_log_header allows them to do so.

Alec Brown

> 
> >
> >It has yet to be decided where to put the final version of this specification.
> >It should be merged into an existing specification, e.g. UEFI, ACPI, Multiboot2,
> >or be standalone, such as a part of OASIS Standards.
> >
> >Below is how the layout of these logs would store their data.
> >
> >bf_log_header:
> >               +-------------------+
> >u32            | version           |
> >u32            | size              |
> >u8[64]         | producer          |
> >u8[64]         | log_format        |
> >u64            | flags             |
> >u64            | next_bflh_addr    |
> >u64            | log_addr          |
> >u32            | log_size          |
> >               +-------------------+
> >
> >bf_log_buffer:
> >               +-------------------+
> >u32            | version           |
> >u32            | size              |
> >u8[64]         | producer          |
> >u32            | next_msg_off      |
> >bf_log_msg[l]  | msgs              |
> >               +-------------------+
> >
> >bf_log_msg:
> >               +-------------------+
> >u32            | size              |
> >u64            | ts_nsec           |
> >u32            | level             |
> >u32            | facility          |
> >u32            | msg_off           |
> >u8[n]          | type              |
> >u8[m]          | msg               |
> >               +-------------------+
> >
> >Where l is the number of msgs, n is the size of type, and m is the size of the
> >msg.
> >
> >The bf_log_header structure forms a linked list. Each bf_log_header element in
> >the linked list points to the individual log buffer and the next bf_log_header
> >element in the linked list. The first element in the linked list points to the
> >last boot component in the boot chain. The last element points to the starting
> >boot component in the boot chain. The log buffers which contain the log
> >messages are produced by the various boot components, typically from the
> >firmware to the bootloader. The log message is stored in a log format that is
> >compatible with the boot component that produced it.
> >
> >The fields in bf_log_header structure:
> >  - version: the firmware and bootloader log header version number, 1 for now,
> >  - size: the size of the bf_log_header to allow for backward compatibility if 
> >    other fields are added,
> >  - producer: the producer/firmware/bootloader/... entity, NUL terminated
> >    string, e.g. GRUB, Coreboot; the length allows for ASCII UUID storage,
> >  - log_format: the format used to record the log messages, NUL terminated
> >    string, e.g. bf_log_msg, cbmem_cons, etc.; various producers may generate
> >    logs in various formats if needed,
> >  - flags: bit field used to store information about the log state, if bit 0 has
> >    been set it means the log was truncated,
> >  - next_bflh_addr: the physical address of the next bf_log_header structure,
> >    none if zero,
> >  - log_addr: the physical address of where the log buffer is stored,
> >  - log_size: the total size of the log buffer.
> >
> >The bf_log_buffer is used to store log messages from the firmware and
> >bootloader. This format for storing messages is called the bf log format. The
> >bf_log_buffer contains the header information of the bf log format with the log
> >messages being stored in an array of bf_log_msg messages.
> >
> >The fields in bf_log_buffer structure:
> >  - version: the firmware and bootloader log version number, 1 for now,
> >  - size: the total allocated space for the bf_log_buffer including the log
> >    messages stored in msgs,
> >  - producer: the producer/firmware/bootloader/... entity, NUL terminated
> >    string, e.g. GRUB, Coreboot; the length allows for ASCII UUID storage; same
> >    as the field in bf_log_header,
> >  - next_msg_off: the byte offset from the beginning of the allocated space for
> >    bf_log_buffer to the next byte after the last bf_log_msg in msgs,
> >  - msgs: the array of log messages stored in the bf_log_msg structures.
> >
> >The fields in bf_log_msg structure:
> >  - size: the total size of the bf_log_msg entry,
> >  - ts_nsec: the timestamp in nanoseconds starting from 0 (zero); the producer
> >    using this log format defines the meaning of 0,
> >  - level: similar to the syslog meaning; used to differentiate normal log
> >    messages from debug log messages, but the exact interpretation depends on
> >    the producer,
> >  - facility: similar to the syslog meaning; used to differentiate the sources
> >    of the log messages, but the exact interpretation depends on the producer,
> >  - msg_off: the byte offset which the msg field starts in bf_log_msg,
> >  - type: the log message type; similar to facility but NUL terminated string
> >    instead of integer, but the exact interpretation depends on the producer,
> >  - msg: the log message, NUL terminated string.
> >
> >In bf_log_msg, the producers are free to use or ignore any of the level,
> >facility, and type fields. If level or facility are ignored, they should be set
> >to 0. If type is ignored, it should be set to an empty NUL terminated string.
> >
> >Since it doesn't seem possible to have each boot component using the same log
> >format, we added a log_format and log_phys_addr fields to give flexibility in
> >how logs are stored. An example of a different log format that can be used is
> >the cbmem_console log format used by coreboot:
> >
> >cbmem_console:
> >               +-------------------+
> >u32            | size              |
> >u32            | cursor            |
> >u8[m]          | body              |
> >               +-------------------+
> >
> >There is still the outstanding issue of how the logs will be sent to the OS. If
> >UEFI is used, we can use config tables. If ACPI or Device Tree is used, we can
> >use bf_log_header.next_bflh_addr to present the logs. If none of these platforms
> >are used, it becomes a lot trickier to solve this issue.
> >
> >Any suggestions are much appreciated and will be taken into consideration.
> >
> >I will be presenting this work at the LPC System Boot and Security
> >Micro-conference on the 22nd of September at 7:50 AM PDT (14:50 UTC). Come and
> >join if you want to discuss the design. The schedule for the System Boot and
> >Security Micro-conference can be found here [3].
> >
> >Thanks!
> >Alec Brown
> >
> >[1] https://lists.gnu.org/archive/html/grub-devel/2020-11/msg00100.html
> >[2] https://lists.gnu.org/archive/html/grub-devel/2020-12/msg00021.html
> >[3] https://linuxplumbersconf.org/event/11/sessions/116/#20210922

