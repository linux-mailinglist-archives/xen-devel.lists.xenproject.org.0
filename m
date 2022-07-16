Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C1577001
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 17:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368819.600236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCk8t-0005uD-Rw; Sat, 16 Jul 2022 15:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368819.600236; Sat, 16 Jul 2022 15:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCk8t-0005sK-OL; Sat, 16 Jul 2022 15:55:43 +0000
Received: by outflank-mailman (input) for mailman id 368819;
 Sat, 16 Jul 2022 15:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAeN=XV=epam.com=prvs=9196fa0856=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oCk8s-0005rT-Ea
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 15:55:42 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcbff6f1-051f-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 17:55:39 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26GDSGHk025845;
 Sat, 16 Jul 2022 15:55:34 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3hbnh48t27-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Jul 2022 15:55:34 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM0PR03MB4305.eurprd03.prod.outlook.com (2603:10a6:208:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 16 Jul
 2022 15:55:28 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5438.020; Sat, 16 Jul 2022
 15:55:28 +0000
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
X-Inumbo-ID: bcbff6f1-051f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU1Njc9+2DurIE0E2b/ae85NQqfEFe6sEGVLur/93nJ2sqDG9KQ6YLSmQnPDfLoYDZo1BCALupVdtHolQ+jOaQp5nUqxqOYz059HNygjywjSJ4SQUi4uCuv/MDwF7nOa1X/2uY5imXdYlIwaFnpQZPPYeESIOy/UCyVRZQeCZI4M+Yn1Bhg1Okmaf/akZbS9fcIKhnmVcp8e72FmaxImNB3+ED3L/pz+2k9HYUAKZRLI7UCEfTlFAwqG+T0N1z7mT4U7fVAMkrpt/RSiMj16e4XyKq40UUn8s7zcGj3Zt9rfZ55XmDdwlGoblv9/oWs/rpOVM7BgWkX2KktzSUGFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btePDiAM88NFpJagtvHPsjc+2cSx5GO/bLziVxhqff0=;
 b=EPii9M7iAr5E37zuRGpD4j9IKIfjQZsqTVcDGl7MCy1lYnxhaDipeewu0dIYapDqh463Fr/7tZLbq+s3q/zlaqNk4CIM/iYnJ7fkmEycXtFll6NamcJVDJFCEthURGfTwhgxy1rZQb7CccJFK6HXwwtIsn9uNu3z3HzxZmejQpiYkXPJkslWwh80OCKAG3HtDs8/KuOrpiuPIbq+eRBJ0yDgrkU5Y6WmgM+pyx3BOOmwr98zixAU9TF0enGepVc+RB/tSU6cdoO065tsfCa81M6OFDwo6sKK4deJ3OAvPBJamGM46iLBIDS+/xRC7xCYwYkcQYn8WYtPj2MagtzfrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btePDiAM88NFpJagtvHPsjc+2cSx5GO/bLziVxhqff0=;
 b=PWoRrtjG75Qio6mNU2bVZQxw8CoijQiB6bc5rfCOsp3DY1Jy1ubZd6R6EfigcHAtDGWOaoDwowC+yOljOAlIMtXR+aXGPxHsX3Y5OpLUtB1coe4sUIH6bU6Cwj3LtPV5L7+DnuXiSpIxN4+XlwDhiQgwt/MAoqBOrhpqrHpUZdSF8DDm4gNcK/iDq+gnHUfqSac/3JxUyGwMbwhgTV+LeEoXHHZiHCOkGCx4bbVUvcHjpQyNy3TCA1BQX6S9KjpB9aTgiMhHl/+zYmcYpqQeviilS54XNFf0B2OwQTUPpndmpNo30SoD4nfBpGpK7HLEPvMmT5Za5+FOwsRU2muTaQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V11 1/3] libxl: Add support for Virtio disk configuration
Thread-Topic: [PATCH V11 1/3] libxl: Add support for Virtio disk configuration
Thread-Index: AQHYmH/5Fy4H059mo02DmQSX0PsOXK2BJ++A
Date: Sat, 16 Jul 2022 15:55:28 +0000
Message-ID: <540d44a5-6966-a9d7-4e62-63ae845c6f62@epam.com>
References: <20220715192026.4013441-1-olekstysh@gmail.com>
 <20220715192026.4013441-2-olekstysh@gmail.com>
In-Reply-To: <20220715192026.4013441-2-olekstysh@gmail.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2239005d-e699-47e0-906d-08da67439ad6
x-ms-traffictypediagnostic: AM0PR03MB4305:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aVQQcKDujZS9EhG7YT+espWjqaeVq96OPXxTIZaBYMeRDV0ELkzUR1+dYwgcl476hhcJgjHqYfoPWuGVats7qVAjVkHcOKpvtDhxv/QaWOwADQRaFAZWybYz1KDkB0HxZGCL5iyaKbUusG1hCAtTuH2bm2BU6FAjSuWBpN4npiqNzZaPq2FC/dJVuyqFmS+xL1Hh5H6eFTvAf7+fe7uQ5/baJ9xE3Mp7eNcC2+Dnw8T2eGrHLxRfO4frmKQdhZ4QKc+8qqCeT/rLO0+9BDFZcTIWyGJIdvnU/+H5NsFAUUyuc29teS/QgQ3EkQGF70vqhN2fUlcVlOIlZxzij2SIkdCXKCHJzjiXe2z6El+Sfdys7sl8OKJ5H0xm7QdcxTKH7WecH1B27Jn+meQSdvx+IxbdkzaKnGUp8OujZ/IoovY86xPR34Df/4i9ETom+EAf0iMpuYJTwvFzuy/ZKHwjfehEGjsjhNz1AI53JzmWW2v43spsAemTh+uTKRN2XAZyVmRo7TvmAHT2oHpILxJf8f+ClXdLzlEeACuIGWWn2HfL/GdTlRMYzcdNa6q2hLLD4m2UkQqKmTGcpPuO7UA7lrrUKUG0MjqbIbfdgf90eMq3CBvAsXmmQFCAVa/ita8TzptA/QCdwxUDslDP5u5a8z3qSXB7aMHXEpH6BVVgmzBsv+A2kfH5dMcqotF2XMv3Y6VrpVfqlgMUhWNFKMto1YuPLyhj0+szukCZCCP6O7LyjTaofq5ZiyxHKwuIWKwWs72JkDVlrvaOXTyygqVTZdePG+2NdcMtFqwoz1Cje7qssgvZl6AUdaWno4L0+RvR5wgvOAMvOHKD+1YnBQiIxDABd09sx5REWEkup9wRLtE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(55236004)(41300700001)(53546011)(6512007)(6506007)(316002)(26005)(478600001)(91956017)(71200400001)(6486002)(54906003)(6916009)(122000001)(38100700002)(31696002)(86362001)(66446008)(64756008)(66476007)(2616005)(38070700005)(83380400001)(66946007)(2906002)(31686004)(66556008)(8936002)(5660300002)(7416002)(4326008)(76116006)(36756003)(186003)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UUp2UGQwRVBOeEhJVWdnejkydCtDN013Vmk0WFlJVlBDWWw3dnREVnErc0JH?=
 =?utf-8?B?Sk8ycFJpMVorWVJGeGZYL3p0OFFWbHc4Umt2bzdQbXlOUjBiOWt2dHduN01r?=
 =?utf-8?B?by8wMUxBb08rZGdPb2N3cHAxdi9SNGxoNGkveGFBc1hRNmdySUY5UGhwQzlv?=
 =?utf-8?B?U2dqYTBLWlZwZUpXODExRFhzOG5WdkJ2djNMOGs5R045eE1LcHUxbFlLZ0s0?=
 =?utf-8?B?SzA1NlBVb3VZSGFjS0JmT1IyVlhyOFMwL0pZSVpSbEZ3UE4wQnBFN2w2VGNl?=
 =?utf-8?B?WlVwYXlaYnY0b2lUaDIrRTF3dXBWa0ZoVnpOUllkWlVmSkhOd0NJQWZkZncv?=
 =?utf-8?B?RnFIRWsrc2UvbEEzR0VzeE5TUUpNNmpqa2poNDBLN3ZNcHhXcXZUYllORnFh?=
 =?utf-8?B?U3FUTDRTNnlrSFVBWklWQlU2bktzM2NDYzJkRFAvMlAva2w0eUZuWnFCS2Jy?=
 =?utf-8?B?YU9md0psbHh5QU1ld1AxZjVFZkZkb2VEN2xwaGtsZ0NmbHNDNXFZN05hTlVI?=
 =?utf-8?B?N0MzT24yeGtTUmRaRTN4bU9PYlQwd25UbkNzRE5vTGg5YS94aFFtT1pBMS96?=
 =?utf-8?B?cE4yMC9NNTZLQ3Z6dG5oeXRNazZOOHM3UjVveXNFOW9EdksrYXdLUUsxTWNz?=
 =?utf-8?B?QWlEZkxaU21PcGZWd3EvcTdTVkNzVzd4VjVwVlE0RTR4N0praEo2V242VGpY?=
 =?utf-8?B?UFR3ZVV6Ym0ranZvZEpvTzY0aHRNNlV5RmYycGFKYndtZjJ2UW9xdmpSK05m?=
 =?utf-8?B?NEdtRjZ5V0MxZk9KZU1yUUVWcUorSXlVWlVsSGhNZDdwUGhxd3NDeWx2NFEw?=
 =?utf-8?B?dGJhdHZjYkRYTXlwWjRHci9xemNOOWptdVFSTzBFVTY3TCtjMWVJSnRhQkZV?=
 =?utf-8?B?MHo3K21NZWRNckpqN3c2R1lVc0haZ2duWE5PWC9WYy9HMEgrcU1zQlZ2UGpH?=
 =?utf-8?B?TTdVbkwwRTF4eU1VQmw4UnhIN3ZrU0kzbm8vL0xuaWMvelNha1gvQURHM1lY?=
 =?utf-8?B?MVFrWDNYcEU3R0tBNjUvMnBwR2c1NTFiVmRFSGZ1T29hMndmZlVkUUtleUhI?=
 =?utf-8?B?UGlRMjFYS2lXUmFTZjFqRFZFUGVyNU9BcUlKUlliZkdZYzVBakllOTF6L2N1?=
 =?utf-8?B?a3ZMNnBnMnZSUVFsb05ORXJwL2NxbTRpRUY2OHB1UHZXYWFZSTZKVFc1L1Ar?=
 =?utf-8?B?SWVqV0dtZlVBSzBKQUhXcUFxa01memNiRG4vdWV3K1BoVnB5RVNwaEpZTHFH?=
 =?utf-8?B?UXVDaThjd0tDME1tWUhyMFBYSzRrbWJZMDFQU0ZqOU8yVEd1a2N3NE1pd0Ny?=
 =?utf-8?B?Sm92c0d3SWNuNk5QQWVoK2E0MVhOaDdZRm5VZ2lITTl2NWtqemhJODFBYzEw?=
 =?utf-8?B?eGJySjBONjgvWnNUTndwQXR4MlBMT3V5QXRzZDVzeU1LZGZSMnJWeFNaWFNo?=
 =?utf-8?B?YVU5NE0vdDRkQkxTaXUyTW9hWlJpTWtXa01xbVV0MW8xNjhaOXc0NWd6bzJJ?=
 =?utf-8?B?djkrSEo5bnJwa1VPaHdWemhQdTdIaXg0NG9wT3U0TlpLZEhOY0dvY0F5QmNG?=
 =?utf-8?B?N1JtMGRwUUpSUGx2T1lDOVd2aGQ2YURqWERuT0EzSUJqNkpOczA1MUh0ME5t?=
 =?utf-8?B?SUUycFFLNFdXSGZPWXU0RnBRTkNXR3MwWEo1Q2VtQTZkU0dtMGlzWlpyNm5w?=
 =?utf-8?B?ZkJhalBLNXdvTzhFSldkc2oyazRvV25GclBXQ3l5ZmhEWXJUZXFwQ1ZoUHYv?=
 =?utf-8?B?MGo5bVBUUG9sWVd1ZVJlWjZqajQvbEh2YjYxczFuSTVCM3hybkVpaERjNUp4?=
 =?utf-8?B?eHBsUkpzeVFYTWp1MFBVY3V4R3pYOUNFY2lyMDBjWkp5WW9uWkl1Tk13OCsr?=
 =?utf-8?B?SzNHODlnYi9XYlhRUHpVdU1aUWZwQ3FDZHJvMUNNMVVua2FHMFNCWHd1RUh3?=
 =?utf-8?B?QTdLb2l1eWZzNWk5UWZtZ0lwUURYQjhpS0pNdUFKblFOQ2xjbTFEQnd5SnhJ?=
 =?utf-8?B?ZGEvalRwK3VyUnh0dXZwWi9NR0Y0NTREQnQ2WU5XZFVoM05vUTFOaDhYeFkw?=
 =?utf-8?B?RnhXcHBId0RxdEQwTVZSOW9qWFNLRWpWUmhvQlF2VFRzNnFpdGdGYkY0cWc5?=
 =?utf-8?B?emErb3JEQU1JejVjbHY4Nkl5Qms1TWtjc1MxcXF3VDREODVRclBkY0lBallt?=
 =?utf-8?Q?SJFCZSmA+Wbw2vYSRrk09NA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8212DD36044FEC40AE5FDE62EF462B71@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2239005d-e699-47e0-906d-08da67439ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 15:55:28.4256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2FFKR4bZLGUBQHEPc9YCrqU+WddAaeYxlGSmJvO/tduOzrmAnDhUewmWQnkZC70m1Kp7WMOrjxt1AuVDg8WX0/aEBK/9g3WGFgFrRDLQNF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4305
X-Proofpoint-ORIG-GUID: sJulxz2LfoYsVcfDS9GDeevHRhBNcGdc
X-Proofpoint-GUID: sJulxz2LfoYsVcfDS9GDeevHRhBNcGdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-16_11,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207160067

DQpIZWxsbyBhbGwuDQoNCg0KT24gMTUuMDcuMjIgMjI6MjAsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOg0KPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+DQo+DQo+IFRoaXMgcGF0Y2ggYWRkcyBiYXNpYyBzdXBwb3J0IGZvciBjb25m
aWd1cmluZyBhbmQgYXNzaXN0aW5nIHZpcnRpby1tbWlvDQo+IGJhc2VkIHZpcnRpby1kaXNrIGJh
Y2tlbmQgKGVtdWxhdG9yKSB3aGljaCBpcyBpbnRlbmRlZCB0byBydW4gb3V0IG9mDQo+IFFlbXUg
YW5kIGNvdWxkIGJlIHJ1biBpbiBhbnkgZG9tYWluLg0KPiBBbHRob3VnaCB0aGUgVmlydGlvIGJs
b2NrIGRldmljZSBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0cmFkaXRpb25hbA0KPiBYZW4gUFYg
YmxvY2sgZGV2aWNlICh2YmQpIGZyb20gdGhlIHRvb2xzdGFjaydzIHBvaW50IG9mIHZpZXc6DQo+
ICAgLSBhcyB0aGUgZnJvbnRlbmQgaXMgdmlydGlvLWJsayB3aGljaCBpcyBub3QgYSBYZW5idXMg
ZHJpdmVyLCBub3RoaW5nDQo+ICAgICB3cml0dGVuIHRvIFhlbnN0b3JlIGFyZSBmZXRjaGVkIGJ5
IHRoZSBmcm9udGVuZCBjdXJyZW50bHkgKCJ2ZGV2Ig0KPiAgICAgaXMgbm90IHBhc3NlZCB0byB0
aGUgZnJvbnRlbmQpLiBCdXQgdGhpcyBtaWdodCBuZWVkIHRvIGJlIHJldmlzZWQNCj4gICAgIGlu
IGZ1dHVyZSwgc28gZnJvbnRlbmQgZGF0YSBtaWdodCBiZSB3cml0dGVuIHRvIFhlbnN0b3JlIGlu
IG9yZGVyIHRvDQo+ICAgICBzdXBwb3J0IGhvdHBsdWdnaW5nIHZpcnRpbyBkZXZpY2VzIG9yIHBh
c3NpbmcgdGhlIGJhY2tlbmQgZG9tYWluIGlkDQo+ICAgICBvbiBhcmNoIHdoZXJlIHRoZSBkZXZp
Y2UtdHJlZSBpcyBub3QgYXZhaWxhYmxlLg0KPiAgIC0gdGhlIHJpbmctcmVmL2V2ZW50LWNoYW5u
ZWwgYXJlIG5vdCB1c2VkIGZvciB0aGUgYmFja2VuZDwtPmZyb250ZW5kDQo+ICAgICBjb21tdW5p
Y2F0aW9uLCB0aGUgcHJvcG9zZWQgSVBDIGZvciBWaXJ0aW8gaXMgSU9SRVEvRE0NCj4gaXQgaXMg
c3RpbGwgYSAiYmxvY2sgZGV2aWNlIiBhbmQgb3VnaHQgdG8gYmUgaW50ZWdyYXRlZCBpbiBleGlz
dGluZw0KPiAiZGlzayIgaGFuZGxpbmcuIFNvLCByZS11c2UgKGFuZCBhZGFwdCkgImRpc2siIHBh
cnNpbmcvY29uZmlndXJhdGlvbg0KPiBsb2dpYyB0byBkZWFsIHdpdGggVmlydGlvIGRldmljZXMg
YXMgd2VsbC4NCj4NCj4gRm9yIHRoZSBpbW1lZGlhdGUgcHVycG9zZSBhbmQgYW4gYWJpbGl0eSB0
byBleHRlbmQgdGhhdCBzdXBwb3J0IGZvcg0KPiBvdGhlciB1c2UtY2FzZXMgaW4gZnV0dXJlIChR
ZW11LCB2aXJ0aW8tcGNpLCBldGMpIHBlcmZvcm0gdGhlIGZvbGxvd2luZw0KPiBhY3Rpb25zOg0K
PiAtIEFkZCBuZXcgZGlzayBiYWNrZW5kIHR5cGUgKExJQlhMX0RJU0tfQkFDS0VORF9TVEFOREFM
T05FKSBhbmQgcmVmbGVjdA0KPiAgICB0aGF0IGluIHRoZSBjb25maWd1cmF0aW9uDQo+IC0gSW50
cm9kdWNlIG5ldyBkaXNrICJzcGVjaWZpY2F0aW9uIiBhbmQgInRyYW5zcG9ydCIgZmllbGRzIHRv
IHN0cnVjdA0KPiAgICBsaWJ4bF9kZXZpY2VfZGlzay4gQm90aCBhcmUgd3JpdHRlbiB0byB0aGUg
WGVuc3RvcmUuIFRoZSB0cmFuc3BvcnQNCj4gICAgZmllbGQgaXMgb25seSB1c2VkIGZvciB0aGUg
c3BlY2lmaWNhdGlvbiAidmlydGlvIiBhbmQgaXQgYXNzdW1lcw0KPiAgICBvbmx5ICJtbWlvIiB2
YWx1ZSBmb3Igbm93Lg0KPiAtIEludHJvZHVjZSBuZXcgInNwZWNpZmljYXRpb24iIG9wdGlvbiB3
aXRoICJ4ZW4iIGNvbW11bmljYXRpb24NCj4gICAgcHJvdG9jb2wgYmVpbmcgZGVmYXVsdCB2YWx1
ZS4NCj4gLSBBZGQgbmV3IGRldmljZSBraW5kIChMSUJYTF9fREVWSUNFX0tJTkRfVklSVElPX0RJ
U0spIGFzIGN1cnJlbnQNCj4gICAgb25lIChMSUJYTF9fREVWSUNFX0tJTkRfVkJEKSBkb2Vzbid0
IGZpdCBpbnRvIFZpcnRpbyBkaXNrIG1vZGVsDQo+DQo+IEFuIGV4YW1wbGUgb2YgZG9tYWluIGNv
bmZpZ3VyYXRpb24gZm9yIFZpcnRpbyBkaXNrOg0KPiBkaXNrID0gWyAncGh5Oi9kZXYvbW1jYmxr
MHAzLCB4dmRhMSwgYmFja2VuZHR5cGU9c3RhbmRhbG9uZSwgc3BlY2lmaWNhdGlvbj12aXJ0aW8n
XQ0KPg0KPiBOb3RoaW5nIGhhcyBjaGFuZ2VkIGZvciBkZWZhdWx0IFhlbiBkaXNrIGNvbmZpZ3Vy
YXRpb24uDQo+DQo+IFBsZWFzZSBub3RlLCB0aGlzIHBhdGNoIGlzIG5vdCBlbm91Z2ggZm9yIHZp
cnRpby1kaXNrIHRvIHdvcmsNCj4gb24gWGVuIChBcm0pLCBhcyBmb3IgZXZlcnkgVmlydGlvIGRl
dmljZSAoaW5jbHVkaW5nIGRpc2spIHdlIG5lZWQNCj4gdG8gYWxsb2NhdGUgVmlydGlvIE1NSU8g
cGFyYW1zIChJUlEgYW5kIG1lbW9yeSByZWdpb24pIGFuZCBwYXNzDQo+IHRoZW0gdG8gdGhlIGJh
Y2tlbmQsIGFsc28gdXBkYXRlIEd1ZXN0IGRldmljZS10cmVlLiBUaGUgc3Vic2VxdWVudA0KPiBw
YXRjaCB3aWxsIGFkZCB0aGVzZSBtaXNzaW5nIGJpdHMuIEZvciB0aGUgY3VycmVudCBwYXRjaCwN
Cj4gdGhlIGRlZmF1bHQgImlycSIgYW5kICJiYXNlIiBhcmUganVzdCB3cml0dGVuIHRvIHRoZSBY
ZW5zdG9yZS4NCj4gVGhpcyBpcyBub3QgYW4gaWRlYWwgc3BsaXR0aW5nLCBidXQgdGhpcyB3YXkg
d2UgYXZvaWQgYnJlYWtpbmcNCj4gdGhlIGJpc2VjdGFiaWxpdHkuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4gLS0tDQo+IENoYW5nZXMgUkZDIC0+IFYxOg0KPiAgICAgLSBubyBjaGFuZ2VzDQo+DQo+IENo
YW5nZXMgVjEgLT4gVjI6DQo+ICAgICAtIHJlYmFzZSBhY2NvcmRpbmcgdG8gdGhlIG5ldyBsb2Nh
dGlvbiBvZiBsaWJ4bF92aXJ0aW9fZGlzay5jDQo+DQo+IENoYW5nZXMgVjIgLT4gVjM6DQo+ICAg
ICAtIG5vIGNoYW5nZXMNCj4NCj4gQ2hhbmdlcyBWMyAtPiBWNDoNCj4gICAgIC0gcmViYXNlIGFj
Y29yZGluZyB0byB0aGUgbmV3IGFyZ3VtZW50IGZvciBERUZJTkVfREVWSUNFX1RZUEVfU1RSVUNU
DQo+DQo+IENoYW5nZXMgVjQgLT4gVjU6DQo+ICAgICAtIHNwbGl0IHRoZSBjaGFuZ2VzLCBjaGFu
Z2UgdGhlIG9yZGVyIG9mIHRoZSBwYXRjaGVzDQo+ICAgICAtIHVwZGF0ZSBwYXRjaCBkZXNjcmlw
dGlvbg0KPiAgICAgLSBkb24ndCBpbnRyb2R1Y2UgbmV3ICJ2ZGlzayIgY29uZmlndXJhdGlvbiBv
cHRpb24gd2l0aCBvd24gcGFyc2luZyBsb2dpYywNCj4gICAgICAgcmUtdXNlIFhlbiBQViBibG9j
ayAiZGlzayIgcGFyc2luZy9jb25maWd1cmF0aW9uIGxvZ2ljIGZvciB0aGUgdmlydGlvLWRpc2sN
Cj4gICAgIC0gaW50cm9kdWNlICJ2aXJ0aW8iIGZsYWcgYW5kIGRvY3VtZW50IGl0J3MgdXNhZ2UN
Cj4gICAgIC0gYWRkIExJQlhMX0hBVkVfREVWSUNFX0RJU0tfVklSVElPDQo+ICAgICAtIHVwZGF0
ZSBsaWJ4bHVfZGlza19sLltjaF0NCj4gICAgIC0gZHJvcCBudW1fZGlza3MgdmFyaWFibGUvTUFY
X1ZJUlRJT19ESVNLUw0KPiAgICAgLSBkcm9wIFdlaSdzIFQtYg0KPg0KPiBDaGFuZ2VzIFY1IC0+
IFY2Og0KPiAgICAgLSByZWJhc2Ugb24gY3VycmVudCBzdGFnaW5nDQo+ICAgICAtIHVzZSAiJSJQ
Ukl1NjQgaW5zdGVhZCBvZiAlbHUgZm9yIGRpc2stPmJhc2UgaW4gZGV2aWNlX2Rpc2tfYWRkKCkN
Cj4gICAgIC0gdXBkYXRlICouZ2VuLmdvIGZpbGVzDQo+DQo+IENoYW5nZXMgVjYgLT4gVjc6DQo+
ICAgICAtIHJlYmFzZSBvbiBjdXJyZW50IHN0YWdpbmcNCj4gICAgIC0gdXBkYXRlICouZ2VuLmdv
IGZpbGVzIGFuZCBsaWJ4bHVfZGlza19sLltjaF0gZmlsZXMNCj4gICAgIC0gdXBkYXRlIHBhdGNo
IGRlc2NyaXB0aW9uDQo+ICAgICAtIHJld29yayBzaWduaWZpY2FudGx5IHRvIHN1cHBvcnQgbW9y
ZSBmbGV4aWJsZSBjb25maWd1cmF0aW9uDQo+ICAgICAgIGFuZCBoYXZlIG1vcmUgZ2VuZXJpYyBi
YXNpYyBpbXBsZW1lbnRhdGlvbiBmb3IgYmVpbmcgYWJsZSB0byBleHRlbmQNCj4gICAgICAgdGhh
dCBmb3Igb3RoZXIgdXNlLWNhc2VzICh2aXJ0aW8tcGNpLCBxZW11LCBldGMpLg0KPg0KPiBDaGFu
Z2VzIFY3IC0+IFY4Og0KPiAgICAgLSB1cGRhdGUgKi5nZW4uZ28gZmlsZXMgYW5kIGxpYnhsdV9k
aXNrX2wuW2NoXSBmaWxlcw0KPiAgICAgLSB1cGRhdGUgcGF0Y2ggZGVzY3JpcHRpb24gYW5kIGNv
bW1lbnRzIGluIHRoZSBjb2RlDQo+ICAgICAtIHVzZSAic3BlY2lmaWNhdGlvbiIgY29uZmlnIG9w
dGlvbiBpbnN0ZWFkIG9mICJwcm90b2NvbCINCj4gICAgIC0gdXBkYXRlIGxpYnhsX3R5cGVzLmlk
bCBhbmQgY29kZSBhY2NvcmRpbmcgdG8gbmV3IGZpZWxkcw0KPiAgICAgICBpbiBsaWJ4bF9kZXZp
Y2VfZGlzaw0KPg0KPiBDaGFuZ2VzIFY4IC0+IFY5Og0KPiAgICAgLSB1cGRhdGUgKGFuZCBoYXJk
ZW4pIGNoZWNrcyBpbiBsaWJ4bF9fZGV2aWNlX2Rpc2tfc2V0ZGVmYXVsdCgpLA0KPiAgICAgICBy
ZXR1cm4gZXJyb3IgaW4gY2FzZSBvZiBpbmNvcnJlY3Qgc2V0dGluZ3Mgb2Ygc3BlY2lmaWNhdGlv
bg0KPiAgICAgICBhbmQgdHJhbnNwb3J0DQo+ICAgICAtIHJlbW92ZSBib3RoIGFzc2VydHMgaW4g
ZGV2aWNlX2Rpc2tfYWRkKCkNCj4gICAgIC0gdXBkYXRlIHZpcnRpbyByZWxhdGVkIGNvZGUgaW4g
bGlieGxfX2Rpc2tfZnJvbV94ZW5zdG9yZSgpLA0KPiAgICAgICBkbyBub3QgZmFpbCBpZiBzcGVj
aWZpY2F0aW9uIG5vZGUgaXMgYWJzZW50LCByZXBsYWNlDQo+ICAgICAgIG9wZW4tY29kZWQgY2hl
Y2tzIG9mIGZldGNoZWQgc3BlY2lmaWNhdGlvbiBhbmQgdHJhbnNwb3J0IGJ5DQo+ICAgICAgIGxp
YnhsX2Rpc2tfc3BlY2lmaWNhdGlvbl9mcm9tX3N0cmluZygpIGFuZCBsaWJ4bF9kaXNrX3RyYW5z
cG9ydF9mcm9tX3N0cmluZygpDQo+ICAgICAgIHJlc3BlY3RpdmVseQ0KPiAgICAgLSBzL2xpYnhs
X2RldmljZV9kaXNrX2dldF9wYXRoL2xpYnhsX19kZXZpY2VfZGlza19nZXRfcGF0aA0KPiAgICAg
LSBhZGQgYSBjb21tZW50IGZvciB2aXJ0aW8tbW1pbyBwYXJhbWV0ZXJzIGluIHN0cnVjdCBsaWJ4
bF9kZXZpY2VfZGlzaw0KPg0KPiBDaGFuZ2VzIFY5IC0+IFYxMDoNCj4gICAgIC0gcy9FUlJPUl9G
QUlML0VSUk9SX0lOVkFMIGluIGJvdGggcGxhY2VzIGluIGxpYnhsX19kZXZpY2VfZGlza19zZXRk
ZWZhdWx0KCkNCj4gICAgIC0gcmV3b3JrIGxpYnhsX19kZXZpY2VfZGlza19nZXRfcGF0aCgpDQo+
DQo+IENoYW5nZXMgVjEwIC0+IFYxMC4xOg0KPiAgICAgLSBmaXggc21hbGwgY29kaW5nIHN0eWxl
IGlzc3VlIGluIGxpYnhsX19kZXZpY2VfZGlza19nZXRfcGF0aCgpDQo+ICAgICAtIGRyb3Agc3Bl
Y2lmaWNhdGlvbiBjaGVjayBpbiBtYWluX2Jsb2NrYXR0YWNoKCkgYW5kIGFkZA0KPiAgICAgICBy
ZXF1aXJlZCBjaGVjayBpbiBsaWJ4bF9fZGV2aWNlX2Rpc2tfc2V0ZGVmYXVsdCgpDQo+ICAgICAt
IHVwZGF0ZSBzcGVjaWZpY2F0aW9uIGNoZWNrIGluIG1haW5fYmxvY2tkZXRhY2goKQ0KPg0KPiBD
aGFuZ2VzIFYxMC4xIC0+IFYxMToNCj4gICAgIC0gQW50aG9ueSBhbHJlYWR5IGdhdmUgaGlzIFJl
dmlld2VkLWJ5LCBJIGRyb3BwZWQgaXQgZHVlIHRvIHRoZSBjaGFuZ2VzDQo+ICAgICAtIEdlb3Jn
ZSBhbHJlYWR5IGdhdmUgaGlzIEFja2VkLWJ5LCBJIGRyb3BwZWQgaXQgZHVlIHRvIHRoZSBjaGFu
Z2VzDQo+ICAgICAtIHMvb3RoZXIvc3RhbmRhbG9uZSBmb3IgdGhlIGJhY2tlbmR0eXBlDQo+IC0t
LQ0KPiAgIGRvY3MvbWFuL3hsLWRpc2stY29uZmlndXJhdGlvbi41LnBvZC5pbiAgIHwgIDM4ICst
DQo+ICAgdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvICAgICAgfCAgIDggKw0K
PiAgIHRvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4uZ28gICAgICAgIHwgIDE4ICsNCj4g
ICB0b29scy9pbmNsdWRlL2xpYnhsLmggICAgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+ICAg
dG9vbHMvbGlicy9saWdodC9saWJ4bF9kZXZpY2UuYyAgICAgICAgICAgfCAgNjIgKy0NCj4gICB0
b29scy9saWJzL2xpZ2h0L2xpYnhsX2Rpc2suYyAgICAgICAgICAgICB8IDE0NiArKystDQo+ICAg
dG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oICAgICAgICAgfCAgIDIgKw0KPiAgIHRv
b2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsICAgICAgICAgIHwgIDE4ICsNCj4gICB0b29s
cy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzX2ludGVybmFsLmlkbCB8ICAgMSArDQo+ICAgdG9vbHMv
bGlicy9saWdodC9saWJ4bF91dGlscy5jICAgICAgICAgICAgfCAgIDIgKw0KPiAgIHRvb2xzL2xp
YnMvdXRpbC9saWJ4bHVfZGlza19sLmMgICAgICAgICAgIHwgOTU5ICsrKysrKysrKysrLS0tLS0t
LS0tLS0NCj4gICB0b29scy9saWJzL3V0aWwvbGlieGx1X2Rpc2tfbC5oICAgICAgICAgICB8ICAg
MiArLQ0KPiAgIHRvb2xzL2xpYnMvdXRpbC9saWJ4bHVfZGlza19sLmwgICAgICAgICAgIHwgICA5
ICsNCj4gICB0b29scy94bC94bF9ibG9jay5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiAr
DQo+ICAgMTQgZmlsZXMgY2hhbmdlZCwgNzk4IGluc2VydGlvbnMoKyksIDQ4MCBkZWxldGlvbnMo
LSkNCg0KDQpJIGhhdmUganVzdCByZWFsaXplZCB0aGF0IGN1cnJlbnQgcGF0Y2ggZG9lc24ndCBh
cHBseSB0byB0aGUgc3RhZ2luZyANCmNsZWFybHkuDQoNCkl0J3MgbXkgZmF1bHQsIGFzIFYxMSBp
cyBiYXNlZCBvbiB0aGUgc2FtZSBzdGFnaW5nIHN0YXRlIGFzIFYxMCB3YXMuDQoNCkl0IGNvbmZs
aWN0cyB3aXRoIGNoYW5nZXMgZG9uZSBieSB0aGUgZm9sbG93aW5nIGNvbW1pdDoNCg0KNTRkOGYy
N2QwNCB0b29scy9saWJ4bDogcmVwb3J0IHRydXN0ZWQgYmFja2VuZCBzdGF0dXMgdG8gZnJvbnRl
bmRzDQoNCg0KQWxzbyBJIG5vdGljZWQgdGhhdCBnb2xhbmcgYmluZGluZ3MgaW4gY3VycmVudCBz
dGFnaW5nIGlzIG91dC1vZi1zeW5jLg0KDQpJIHdpbGwgcHVzaCBhIHJlYmFzZWQgdmVyc2lvbiBz
b29uIGluIHJlcGx5IHRvIGN1cnJlbnQgdGhyZWFkLiBTb3JyeSBmb3IgDQp0aGUgaW5jb252ZW5p
ZW5jZS4NCg0KDQpbc25pcF0NCg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNoZW5r
bw0K

