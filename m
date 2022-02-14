Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8D4B4EC2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 12:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271463.465909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZfX-0002kx-O3; Mon, 14 Feb 2022 11:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271463.465909; Mon, 14 Feb 2022 11:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZfX-0002iP-KF; Mon, 14 Feb 2022 11:37:23 +0000
Received: by outflank-mailman (input) for mailman id 271463;
 Mon, 14 Feb 2022 11:37:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJZfW-0002iJ-Hk
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 11:37:22 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76f436c1-8d8a-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 12:37:19 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EAmY4g004034;
 Mon, 14 Feb 2022 11:37:16 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e7nbmg74e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 11:37:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB5048.eurprd03.prod.outlook.com (2603:10a6:20b:8c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 11:37:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 11:37:12 +0000
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
X-Inumbo-ID: 76f436c1-8d8a-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR7RD0yh1xy1dLcfaWMc+c9sBkcLMNXpw89bpROvGP6GmY6Dc6iW/vZRKPkU2adRsCJV8bFUb2FvPc/Hjqecl44ZvB3B/Y3joKxtNbeEinssHJH1sO/NGlQBeydrnCucrxeDScHvFr+gTW+JFeCrl5aUYbdbq9pN0VKCJfUief/5/L/yEWJz3J7XJmnnWQ1UoZFw0GLZ4T4ldCYdOhsiK9b3q+oLa2g18jt5c6MlXaNaxpt4G6EtPV+Ps9BvLUx4LFlyIDaBOuaCPGbk7EUi8eQD27Y8shc9P/Le93sN8lp8axY3cDogcMfctGgLHgvn2B/uqXdrY4cmj19tzD7jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiGEzq9pRHRTrpgjt37xa+q5mYAKxcH1FrQrR3MGeZo=;
 b=gqyTnIKsQJPlNgoo+ydzLZ1t8Gf/7UPbhJ/tSGc6aH+fqZlwSJo7atuJfpxw7iZvyGAXNsdvA7cRFKMx7Voxayt6hX536fVultnEE3qjFnjN4mi0coAHEiZxFEzCvQWoXp1HpnQloUIkVqT2yWgVq89Dg8XgmoMDJkYma/bxilMtndAc4Efj7CM61ep5cdXdjEtdin4RziJIEzo8TT6QGljkeJ9d8bhv4kY6Umz+1Eq7S6VG/qVIZ74rKJuWO0f1vzpxFhbnqn5xthRQnPFBdH99xj3EfaQ194aAEzlszkrXB3zOsG4gRHP2AKasZFGAsnT/OH9e8FL1IrrTJlalmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiGEzq9pRHRTrpgjt37xa+q5mYAKxcH1FrQrR3MGeZo=;
 b=iPwGXr0wK7LqbsYgn31MEWWPz7cW1wAWH8cAQRIDXMNzX/YaWqEMBJgCSLlOaSq3LXiwYe8P0nx3V7Bz3pUHezt3/k2H3izUzjMSe462yetWxqf1d1V/f3z0KB7wYW+t3hSD4L/F5pxQca5ZcURNHqplsQ1uX6l0J/ROjIv3hm3QwUeoZEJOIrUfhDIFEGussY7EQjmfvZhE+XnSOm3Du4h8onthYusDIABMqoMwr8ZbI5ywXWuzHnupeafvD/kz+gY34hrWYbVkqNkZmuKMMO5HJu1gfNHTZQF471C4RG0pAxGZTk8Su14twleDJxjzQ3Szoj4/1cT9oruNZE7pCQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcAgAAQEwCAAAV1AIAABOQAgAABMICAAALZgIAAAzmA
Date: Mon, 14 Feb 2022 11:37:12 +0000
Message-ID: <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
In-Reply-To: <Ygo8M3Y6BLzljn15@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66ffcf85-b5c7-42cc-08ce-08d9efae57d0
x-ms-traffictypediagnostic: AM6PR03MB5048:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB50488924CB37F290720E792FE7339@AM6PR03MB5048.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hG5d9Boh8ELfZRF/jk4yegz0Ph4B+p/kPXylzYS23OBbdppj0pGQI5Y0CJV1D7y3hHy/+vdZNrgs+7tu88KUttvPHWsBBI79s4BDJ0kS+cgtWQsTw+fzIZ2IE+r6P1OjO9flRLuS09Rl+HYAGog3z+ikh6rh1PDbJpfI9WGnaHUYarMBTii57BvqAjGbNqJLcPwK7K4blIiPnYtCP7TjDQH2gaBVjSqtBbU+fsJSCHHKPV5PMdPaYPlG8AWie6w96pIDO0NIWmrvnuzo5ONxqrLK7KgOrDnkW/Oy+fyENSpP9gVlb3QrunbSnMj7yElxucLfvlBPb9YOHETl9NlTWXotw4+MtLcaeUm+KmWC/ZPRg+2FlFIlMWd5gohf0008twJ2afhRW6ijW66MBXaR/o6i0XDOVBq/CFa1k5ElsSEUhxItIwNeHvSjOuq6Jn26j1jEOskb10yxxIpJxQMlNPpSsZgF7pIJ6omOOLAC+rGQzBG6zvDJ67r9BKfwsPVhJGi6x5W6X8xkLsHHGCwAtBkE8uV3A+u3bqJhNOHFhSJ97XHCp7+6jMQ763kErrGVCMzrpWuuyBRZATG9CxJlFkX79+diNkZ8M2r1/1kxICjgQKaG5JOXDTThbSUIa7HagOCkl/DW/IAlpi7s2R+xx9rCaPcjljf46vnmOKxkCTA9kRmHqZbwi+cs4xktvhENAgjBRwsj4QgHVIupNpvQJwuKjaIlXXs+oFBKzPpgFu+e/EkEJ9RZ3Os3uT5Ylvj5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(53546011)(6506007)(8936002)(54906003)(316002)(6512007)(55236004)(38070700005)(91956017)(36756003)(71200400001)(31686004)(6916009)(6486002)(508600001)(122000001)(64756008)(8676002)(2906002)(83380400001)(31696002)(86362001)(66476007)(26005)(66946007)(66446008)(186003)(66556008)(4326008)(76116006)(5660300002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qm9IQjh0ZGxRZWdzK3lqbU9ZNG1WTXFRZitkajJZdnNUb2lvTXY3QlA5N3VU?=
 =?utf-8?B?Y29yV0F3SG1PY0NQVGNxMldrK21nbWNmekxjN2xWOFd3ZDdrQ2g3cXBDSk5u?=
 =?utf-8?B?UjBEbkIxanpucFY3ZFQzaDJKYVlqay9TVVR3a0FwUHdlRGxobUR1YjNsY3dj?=
 =?utf-8?B?WWsxdTFMMXdLckQ0TkFOZnhJbE1RWjdKcTFXaVU3M1FPVit2QkNOcFNXamU5?=
 =?utf-8?B?Nll3Mk4raXJEOGVRMjN3eXlCbzllT20zblNieDhucVVwMU5ZR1ltMDc3eTR6?=
 =?utf-8?B?SU1sTFBEcFdDQ2VqWlh4aThDZUJGbWZ2TWpQZmZGRFZsckpxRDRnNVdMcFA4?=
 =?utf-8?B?RUJnZ1NiRkZJZ0FoVnU0TXJucVBMREJtTEg4NXVVakN1UWk4VmxSNHNaUE82?=
 =?utf-8?B?b2VPSVVoTmtId3FrNm80MVFUQkNHWktZSyt3UnRQemxVd09PT3JpRUxNTTBG?=
 =?utf-8?B?dXlSUzdVQXpqOGNPTjU4aTBKaEVwanFjNC9iUTZtaVJvL0FETTRaT3luWVZR?=
 =?utf-8?B?K0l3dnc2bTVqRTl3eldGNCsvKzBsdTVTdWlmOFIyR3pEeWd5N0RiQXpRTDV2?=
 =?utf-8?B?Rlp1SmlkYi8xVTg3QldINTdaNmdhaXFUczBXeTNnMCtHajczeVd2ZTROdllV?=
 =?utf-8?B?OS94U2xDOEJJTk9VTFV5eE9Wcm1WWXgwUGJTUDBySERVL0pMczlML01uTE4x?=
 =?utf-8?B?NzkrRnZUNHBUS0REWHRkQWh1eXhSU2NkbTViQ01jSlpzZFY2ckoybUVrN0lG?=
 =?utf-8?B?Z0dMUWRLNXFOQmZCRDFKdXVlVG9xdGQ0MUhHZ0ZVZDJZSEZ4MFJXUEgrakhu?=
 =?utf-8?B?VXFhekpuL283QnJ4SWVsUzBnaHpnN1EvY3JXR3Njb3Q2SnV0VGUzdXlRbXhO?=
 =?utf-8?B?MG1FVjR2cktuRTRxc1gvZDF4MDFmM1NEOXduSVN4V0hxV1RhOTdsM2lrd2xm?=
 =?utf-8?B?Z0J4Qjk1cjVPMnBHcXBkWVgxNnZrNkNiZHo1UldxRWU3dmZEcWx4K3RUY0hC?=
 =?utf-8?B?N1Q5cFFYVVFRWHo1WWFkYzdCNGppeUJYNUJ4UnJidkVHbFlYNGczRTg4VFVJ?=
 =?utf-8?B?cUg5Rk5JSDB1REk0TFBQVU43S2psaGtaWjkzRnlNMUQvN29ySzBnTm9FcXI1?=
 =?utf-8?B?NjFyTFlBRlUybmRoUWlQNzhOell0anBMS0lMdFZTbG0rOUx2NzEyZ1Y4LzNV?=
 =?utf-8?B?blczQmJBYWIrekcraEZPMUZnajdvWWNjVVp2eDNUK1FtM05PTHQwT2J3U0sv?=
 =?utf-8?B?Nmp4eW1xWjJCcnRpWWVvaDUraW8rcENEZHZjelpudXh3elJDWlVMeTVibC9u?=
 =?utf-8?B?VHdNZG1CQW9VaEc1bHdpellrQXVPYWViRnRnVVdRQVdTWS8vaHUzRDg1MjZB?=
 =?utf-8?B?MWFycXBlazYweUZzWEFILzNadE91TkZ2TlozRnhnR09Pa3Z2Zm1UYkx4ckJy?=
 =?utf-8?B?ZEJnaEtkeXlRYzQzdmFTeEdNb3JEUit0R2tQSnJoNGtXUlpuU0ZvZXRNSzgw?=
 =?utf-8?B?MWRUSFdHK0NVaTZrK296RnZrQi9lWEpVV1g4R2xUVXQzaTR1QWQyazJ5b29M?=
 =?utf-8?B?ZVYrTHFSNUJlZGdmejlwQVNWTkpONFdJMTk2R2xTd082blhNV3RWL3BJNTk5?=
 =?utf-8?B?QWRSWDNnSTZNZHBDRUdhVEVaZDRIdlNIRU9PMXJxRXY4NGIyNlp2eWFkbGc4?=
 =?utf-8?B?NnNrNno4SUNIVVdWL3BqNFhxWi9TbnNibCtzZ3ZBcWYzY2pyUDVTWjhWL0VJ?=
 =?utf-8?B?cjhxcFU5NVcrQ3ZJVmdWdmNiODk5RXpNcVkveGdTRXIwYUxzSXhXUDlMZGd0?=
 =?utf-8?B?ZHZCQWgyNGlzVXl2TUk1OWx5OStaendrbm9yclo0d05oKzFhM1Z1YWg3UVMr?=
 =?utf-8?B?bDNFMHdOR3BDejE4MHdHcmlPWmY0dkwrbjgvOWdyK21ZMnpoZmZZeElGcElS?=
 =?utf-8?B?Y2s3Zlc0cFd1UFpMdG1LK2JhTi9uK1F0NlpObFpyUC85VDMxaVVObXoxTXlP?=
 =?utf-8?B?eW1DVWdaNUZJYWlwVWVTU2VsTk9idEZWVGZYWGc0RGRFTGRFUDczKzJ0eWdW?=
 =?utf-8?B?MGhOWHhleFBlZFYzd0NxK1k5VWk2UmpudmJqOHlNQW4yWGdJODhMTElzYXY2?=
 =?utf-8?B?Y3NoOVFIOThhNTlYZDIzY1lhMWY5YThJaVFxa2hGcG5VSFd4OGhGM01XTEFx?=
 =?utf-8?B?a3BSdlV2bVhuQUcvakw3RWdvMWlNRTV1MzIvUGNCdE5RYmtmWGQyamJVc05W?=
 =?utf-8?B?OGVETExKMHBnUG0vSkdVK0p0RnV6dk84L2E0aEZ4aTZRa3FDTEROYUtTSDRT?=
 =?utf-8?B?cjZhR29TdVl2UXNnY3MrVGRvV0xpVHR0ck9Rb0VEN3F3QlBCUGZwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB01C1908D38F248BD965921D9EAB571@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ffcf85-b5c7-42cc-08ce-08d9efae57d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 11:37:12.5298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNAPHiaxcpjEEIjp1Mod8QWMXS+C1xyayAC2H5Z7/pPq46KSwVzQrbEAP34xddrskCvNCAuZpzqx26JtpR377pp82DPzIdaa4e852iTfnGenI/4lnqYeGpMuRnZW0hZ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5048
X-Proofpoint-ORIG-GUID: ZEKKYbF7mDeo7EhV3KWlzOp3YmMV9AzK
X-Proofpoint-GUID: ZEKKYbF7mDeo7EhV3KWlzOp3YmMV9AzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_03,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140070

DQoNCk9uIDE0LjAyLjIyIDEzOjI1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAxNCwgMjAyMiBhdCAxMToxNToyN0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAxNC4wMi4yMiAxMzoxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAxMDo1Mzo0M0FNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTQuMDIuMjIgMTI6MzQsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAwOTozNjozOUFN
ICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxMS4wMi4y
MiAxMzo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiAg
ICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBtc2l4LT5tYXhfZW50cmllczsgaSsrICkNCj4+Pj4+
Pj4+Pj4gICAgICAgICAgIHsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
dnBjaV9tc2l4X2VudHJ5ICplbnRyeSA9ICZtc2l4LT5lbnRyaWVzW2ldOw0KPj4+Pj4+Pj4+IFNp
bmNlIHRoaXMgZnVuY3Rpb24gaXMgbm93IGNhbGxlZCB3aXRoIHRoZSBwZXItZG9tYWluIHJ3bG9j
ayByZWFkDQo+Pj4+Pj4+Pj4gbG9ja2VkIGl0J3MgbGlrZWx5IG5vdCBhcHByb3ByaWF0ZSB0byBj
YWxsIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcw0KPj4+Pj4+Pj4+IHdoaWxlIGhvbGRpbmcgc3Vj
aCBsb2NrIChjaGVjayBiZWxvdykuDQo+Pj4+Pj4+PiBZb3UgYXJlIHJpZ2h0LCBhcyBpdCBpcyBw
b3NzaWJsZSB0aGF0Og0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJx
cyAtPiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAtPiByZWFkX2xvY2sNCj4+Pj4+Pj4+DQo+Pj4+Pj4+
PiBFdmVuIG1vcmUsIHZwY2lfcHJvY2Vzc19wZW5kaW5nIG1heSBhbHNvDQo+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4gcmVhZF91bmxvY2sgLT4gdnBjaV9yZW1vdmVfZGV2aWNlIC0+IHdyaXRlX2xvY2sNCj4+
Pj4+Pj4+DQo+Pj4+Pj4+PiBpbiBpdHMgZXJyb3IgcGF0aC4gU28sIGFueSBpbnZvY2F0aW9uIG9m
IHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcw0KPj4+Pj4+Pj4gbXVzdCBub3QgaG9sZCBkLT52cGNp
X3J3bG9jayBhdCBsZWFzdC4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBBbmQgYWxzbyB3ZSBuZWVkIHRv
IGNoZWNrIHRoYXQgcGRldi0+dnBjaSB3YXMgbm90IHJlbW92ZWQNCj4+Pj4+Pj4+IGluIGJldHdl
ZW4gb3IgKnJlLWNyZWF0ZWQqDQo+Pj4+Pj4+Pj4gV2Ugd2lsbCBsaWtlbHkgbmVlZCB0byByZS1p
dGVyYXRlIG92ZXIgdGhlIGxpc3Qgb2YgcGRldnMgYXNzaWduZWQgdG8NCj4+Pj4+Pj4+PiB0aGUg
ZG9tYWluIGFuZCBhc3NlcnQgdGhhdCB0aGUgcGRldiBpcyBzdGlsbCBhc3NpZ25lZCB0byB0aGUg
c2FtZQ0KPj4+Pj4+Pj4+IGRvbWFpbi4NCj4+Pj4+Pj4+IFNvLCBkbyB5b3UgbWVhbiBhIHBhdHRl
cm4gbGlrZSB0aGUgYmVsb3cgc2hvdWxkIGJlIHVzZWQgYXQgYWxsDQo+Pj4+Pj4+PiBwbGFjZXMg
d2hlcmUgd2UgbmVlZCB0byBjYWxsIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcz8NCj4+Pj4+Pj4+
DQo+Pj4+Pj4+PiByZWFkX3VubG9jaw0KPj4+Pj4+Pj4gcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFz
DQo+Pj4+Pj4+PiByZWFkX2xvY2sNCj4+Pj4+Pj4+IHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9t
YWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7DQo+Pj4+Pj4+PiBpZiAoIHBk
ZXYgJiYgcGRldi0+dnBjaSAmJiBpc190aGVfc2FtZV92cGNpKHBkZXYtPnZwY2kpICkNCj4+Pj4+
Pj4+IDxjb250aW51ZSBwcm9jZXNzaW5nPg0KPj4+Pj4+PiBTb21ldGhpbmcgYWxvbmcgdGhvc2Ug
bGluZXMuIFlvdSBsaWtlbHkgbmVlZCB0byBjb250aW51ZSBpdGVyYXRlIHVzaW5nDQo+Pj4+Pj4+
IGZvcl9lYWNoX3BkZXYuDQo+Pj4+Pj4gSG93IGRvIHdlIHRlbGwgaWYgcGRldi0+dnBjaSBpcyB0
aGUgc2FtZT8gSmFuIGhhcyBhbHJlYWR5IGJyb3VnaHQNCj4+Pj4+PiB0aGlzIHF1ZXN0aW9uIGJl
Zm9yZSBbMV0gYW5kIEkgd2FzIGFib3V0IHRvIHVzZSBzb21lIElEIGZvciB0aGF0IHB1cnBvc2U6
DQo+Pj4+Pj4gcGRldi0+dnBjaS0+aWQgPSBkLT52cGNpX2lkKysgYW5kIHRoZW4gd2UgdXNlIHBk
ZXYtPnZwY2ktPmlkwqAgZm9yIGNoZWNrcw0KPj4+Pj4gR2l2ZW4gdGhpcyBpcyBhIGRlYnVnIG1l
c3NhZ2UgSSB3b3VsZCBiZSBPSyB3aXRoIGp1c3QgZG9pbmcgdGhlDQo+Pj4+PiBtaW5pbWFsIGNo
ZWNrcyB0byBwcmV2ZW50IFhlbiBmcm9tIGNyYXNoaW5nIChpZTogcGRldi0+dnBjaSBleGlzdHMp
DQo+Pj4+PiBhbmQgdGhhdCB0aGUgcmVzdW1lIE1TSSBlbnRyeSBpcyBub3QgcGFzdCB0aGUgY3Vy
cmVudCBsaW1pdC4gT3RoZXJ3aXNlDQo+Pj4+PiBqdXN0IHByaW50IGEgbWVzc2FnZSBhbmQgbW92
ZSBvbiB0byB0aGUgbmV4dCBkZXZpY2UuDQo+Pj4+IEFncmVlLCBJIHNlZSBubyBiaWcgaXNzdWUg
KHByb2JhYmx5KSBpZiB3ZSBhcmUgbm90IGFibGUgdG8gcHJpbnQNCj4+Pj4NCj4+Pj4gSG93IGFi
b3V0IHRoaXMgb25lOg0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9o
ZWFkZXIuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4gaW5kZXggODA5YTZiNDc3
M2UxLi41MDM3M2YwNGRhODIgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVh
ZGVyLmMNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+PiBAQCAtMTcx
LDEwICsxNzEsMzEgQEAgc3RhdGljIGludCBfX2luaXQgYXBwbHlfbWFwKHN0cnVjdCBkb21haW4g
KmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcmFuZ2VzZXQg
Km1lbSwgdWludDE2X3QgY21kKQ0KPj4+PiAgICDCoHsNCj4+Pj4gICAgwqDCoMKgwqAgc3RydWN0
IG1hcF9kYXRhIGRhdGEgPSB7IC5kID0gZCwgLm1hcCA9IHRydWUgfTsNCj4+Pj4gK8KgwqDCoCBw
Y2lfc2JkZl90IHNiZGYgPSBwZGV2LT5zYmRmOw0KPj4+PiAgICDCoMKgwqDCoCBpbnQgcmM7DQo+
Pj4+DQo+Pj4+ICsgQVNTRVJUKHJ3X2lzX3dyaXRlX2xvY2tlZCgmcGRldi0+ZG9tYWluLT52cGNp
X3J3bG9jaykpOw0KPj4+PiArDQo+Pj4+ICAgIMKgwqDCoMKgIHdoaWxlICggKHJjID0gcmFuZ2Vz
ZXRfY29uc3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKSkgPT0gLUVSRVNUQVJUICkN
Cj4+Pj4gK8KgwqDCoCB7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIG1heSB0cmlnZ2VyIHZw
Y2lfcHJvY2Vzc19wZW5kaW5nIHdoaWNoDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogbWF5IG5l
ZWQgdG8gYWNxdWlyZSBwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrIGluIHJlYWQgbW9kZS4NCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9j
aygmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayk7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqAg
cHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZV9s
b2NrKCZwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrKTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDC
oMKgwqAgLyogQ2hlY2sgaWYgcGRldiBzdGlsbCBleGlzdHMgYW5kIHZQQ0kgd2FzIG5vdCByZW1v
dmVkIG9yIHJlLWNyZWF0ZWQuICovDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocGNpX2dldF9w
ZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pICE9IHBkZXYp
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggdnBjaSBpcyBOT1QgdGhlIHNhbWUg
KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmMgPSAwOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+ICvCoMKgwqAg
fQ0KPj4+PiArDQo+Pj4+ICAgIMKgwqDCoMKgIHJhbmdlc2V0X2Rlc3Ryb3kobWVtKTsNCj4+Pj4g
ICAgwqDCoMKgwqAgaWYgKCAhcmMgKQ0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgIG1vZGlmeV9k
ZWNvZGluZyhwZGV2LCBjbWQsIGZhbHNlKTsNCj4+Pj4NCj4+Pj4gVGhpcyBvbmUgYWxzbyB3YW50
cyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgdG8gcnVuIHNvIGl0ICptaWdodCoNCj4+Pj4gd2Fu
dCBwZGV2IGFuZCB2cGNpIGNoZWNrcy4gQnV0IGF0IHRoZSBzYW1lIHRpbWUgYXBwbHlfbWFwIHJ1
bnMNCj4+Pj4gYXQgKCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlICksIHNvIGRlZmVy
X21hcCB3b24ndCBiZQ0KPj4+PiBydW5uaW5nIHlldCwgdGh1cyBubyB2cGNpX3Byb2Nlc3NfcGVu
ZGluZyBpcyBwb3NzaWJsZSB5ZXQgKGluIHRlcm1zDQo+Pj4+IGl0IGhhcyBzb21ldGhpbmcgdG8g
ZG8geWV0KS4gU28sIEkgdGhpbmsgd2UganVzdCBuZWVkOg0KPj4+Pg0KPj4+PiAgICDCoMKgwqDC
oMKgwqDCoCB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0KPj4+PiAg
ICDCoMKgwqDCoMKgwqDCoCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCj4+Pj4gICAgwqDC
oMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayk7DQo+Pj4+
DQo+Pj4+IGFuZCB0aGlzIHNob3VsZCBiZSBlbm91Z2gNCj4+PiBHaXZlbiB0aGUgY29udGV4dCBh
cHBseV9tYXAgaXMgY2FsbGVkIGZyb20gKGRvbTAgc3BlY2lmaWMgaW5pdCBjb2RlKSwNCj4+PiB0
aGVyZSdzIG5vIG5lZWQgdG8gY2hlY2sgZm9yIHRoZSBwZGV2IHRvIHN0aWxsIGV4aXRzLCBvciB3
aGV0aGVyIHZwY2kNCj4+PiBoYXMgYmVlbiByZWNyZWF0ZWQsIGFzIGl0J3Mgbm90IHBvc3NpYmxl
LiBKdXN0IGFkZCBhIGNvbW1lbnQgdG8NCj4+PiBleHBsaWNpdGx5IG5vdGUgdGhhdCB0aGUgY29u
dGV4dCBvZiB0aGUgZnVuY3Rpb24gaXMgc3BlY2lhbCwgYW5kIHRodXMNCj4+PiB0aGVyZSdzIG5v
IHBvc3NpYmlsaXR5IG9mIGVpdGhlciB0aGUgZGV2aWNlIG9yIHZwY2kgZ29pbmcgYXdheS4NCj4+
IERvZXMgaXQgcmVhbGx5IG5lZWQgd3JpdGVfdW5sb2NrL3dyaXRlX2xvY2sgZ2l2ZW4gdGhlIGNv
bnRleHQ/Li4uDQo+IEkgdGhpbmsgaXQncyBiYWQgcHJhY3RpY2UgdG8gY2FsbCBwcm9jZXNzX3Bl
bmRpbmdfc29mdGlycXMgd2hpbGUNCj4gaG9sZGluZyBhbnkgbG9ja3MuIFRoaXMgaXMgYSB2ZXJ5
IHNwZWNpZmljIGNvbnRleHQgc28gaXQncyBsaWtlbHkgZmluZQ0KPiB0byBub3QgZHJvcCB0aGUg
bG9jaywgYnV0IHdvdWxkIHN0aWxsIHNlZW0gaW5jb3JyZWN0IHRvIG1lLg0KT2sNCj4NCj4+IEkg
dGhpbmsgaXQgZG9lc24ndCBhcyB0aGVyZSBpcyBubyBjaGFuY2UgZGVmZXJfbWFwIGlzIGNhbGxl
ZCwgdGh1cw0KPj4gcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIC0+IHZwY2lfcHJvY2Vzc19wZW5k
aW5nIC0+IHJlYWRfbG9jaw0KPiBJbmRlZWQsIHRoZXJlJ3Mgbm8gY2hhbmNlIG9mIHRoYXQgYmVj
YXVzZSBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMNCj4gd2lsbCBuZXZlciB0cnkgdG8gZG8gYSBz
Y2hlZHVsaW5nIG9wZXJhdGlvbiB0aGF0IHdvdWxkIHJlc3VsdCBpbiBvdXINCj4gY29udGV4dCBi
ZWluZyBzY2hlZHVsZWQgb3V0Lg0KDQogwqDCoMKgIHdoaWxlICggKHJjID0gcmFuZ2VzZXRfY29u
c3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKSkgPT0gLUVSRVNUQVJUICkNCiDCoMKg
wqAgew0KIMKgwqDCoMKgwqDCoMKgIC8qDQogwqDCoMKgwqDCoMKgwqDCoCAqIEZJWE1FOiBHaXZl
biB0aGUgY29udGV4dCBhcHBseV9tYXAgaXMgY2FsbGVkIGZyb20gKGRvbTAgc3BlY2lmaWMNCiDC
oMKgwqDCoMKgwqDCoMKgICogaW5pdCBjb2RlIGF0IHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9h
Y3RpdmUpIGl0IGlzIG5vdCBzdHJpY3RseQ0KIMKgwqDCoMKgwqDCoMKgwqAgKiByZXF1aXJlZCB0
aGF0IHBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2sgaXMgdW5sb2NrZWQgYmVmb3JlIGNhbGxpbmcN
CiDCoMKgwqDCoMKgwqDCoMKgICogcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIGFzIHRoZXJlIGlz
IG5vIGNvbnRlbnRpb24gcG9zc2libGUgYmV0d2Vlbg0KIMKgwqDCoMKgwqDCoMKgwqAgKiB0aGlz
IGNvZGUgYW5kIHZwY2lfcHJvY2Vzc19wZW5kaW5nIHRyeWluZyB0byBhY3F1aXJlIHRoZSBsb2Nr
IGluDQogwqDCoMKgwqDCoMKgwqDCoCAqIHJlYWQgbW9kZS4gQnV0IHJ1bm5pbmcgcHJvY2Vzc19w
ZW5kaW5nX3NvZnRpcnFzIHdpdGggYW55IGxvY2sgaGVsZA0KIMKgwqDCoMKgwqDCoMKgwqAgKiBk
b2Vzbid0IHNlZW0gdG8gYmUgYSBnb29kIHByYWN0aWNlLCBzbyBkcm9wIHRoZSBsb2NrIGFuZCBy
ZS1hY3F1aXJlDQogwqDCoMKgwqDCoMKgwqDCoCAqIGl0IHJpZ2h0IGFnYWluLg0KIMKgwqDCoMKg
wqDCoMKgwqAgKi8NCiDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+
dnBjaV9yd2xvY2spOw0KIMKgwqDCoMKgwqDCoMKgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygp
Ow0KIMKgwqDCoMKgwqDCoMKgIHdyaXRlX2xvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2sp
Ow0KIMKgwqDCoCB9DQoNCldpbGwgdGhpcyBiZSBnb29kIGVub3VnaD8NCj4NCj4gVGhhbmtzLCBS
b2dlci4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

